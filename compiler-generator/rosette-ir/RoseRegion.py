##############################################################
#
# This file contains the code for the base class for regions
# in Rosette IR.
#
##############################################################

from RoseTypes import RoseVoidType
import RoseAbstractions

from copy import deepcopy
import uuid


# Abstract class representing a region.
# Regions can contain loops, function, blocks, etc.
# Regions can be contained in functions and loops.
class RoseRegion:
  def __init__(self, Children, Parent, Keys = None):
    self.Parent = Parent
    if self.Parent is not None:
      assert self.isParentValid(Parent)
    # Tracks keys for this region
    self.Keys = Keys
    self.Children = Children
    if self.Children is not None:
      assert self.areChildrenValid()
      if type(self.Children) == list:
        # Set the parents of the children
        for Child in self.Children:
          Child.setParent(self)
      else:
        assert self.Keys != None
        for Key in self.Keys:
          # Set the parents of the children
          for Child in self.Children[Key]:
            Child.setParent(self)
    # This is a unique ID to identify this instance of rose region
    # If this is an instance of undef region, then the ID used is 0.
    if not isinstance(self, RoseAbstractions.RoseUndefRegion):
      self.ID = uuid.uuid4()
    else:
      self.ID = 0

  def __eq__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.ID == Other.ID #self.Children == Other.Children and self.Parent == Other.Parent
  
  def __ne__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.ID != Other.ID #self.Children != Other.Children or self.Parent != Other.Parent
  
  def __iter__(self):
    # Undef region is not iterable
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    self.KeyIndex = 0
    self.ChildIndex = -1
    return self
  
  def __next__(self):
    self.ChildIndex += 1
    if self.Keys != None:
      while self.ChildIndex == self.getNumChildren(self.Keys[self.KeyIndex]):
        if self.KeyIndex == len(self.Keys) - 1:
          # We are done iterating this cond region
          raise StopIteration
        # Now we move on to the next subregion
        self.KeyIndex += 1
        self.ChildIndex = 0
      return self.getChild(self.ChildIndex, self.Keys[self.KeyIndex])
    else:
      if self.ChildIndex == self.getNumChildren():
        raise StopIteration
      print("self.ChildIndex:")
      print(self.ChildIndex)
      return self.getChild(self.ChildIndex)
  
  def areChildrenValid(self):
    # Children do not have to be instances of regions
    if self.Keys != None:
      for Key in self.Keys:
        for Child in self.Children[Key]:
          if self.isChildValid(Child) == False:
            return False
    else:
      for Child in self.Children:
        if self.isChildValid(Child) == False:
          return False
    return True

  def isChildValid(self, Child):
    if not isinstance(self, RoseAbstractions.RoseBlock):
      if isinstance(Child, RoseAbstractions.RoseFunction) \
      or isinstance(Child, RoseAbstractions.RoseForLoop) \
      or isinstance(Child, RoseAbstractions.RoseCond) \
      or isinstance(Child, RoseAbstractions.RoseBlock):
        return True
      return False
    else:
      if isinstance(Child, RoseAbstractions.RoseOperation):
        return True
      return False

  def isParentValid(self, Parent):
    if isinstance(self, RoseAbstractions.RoseUndefRegion):
      return True
    if isinstance(Parent, RoseAbstractions.RoseForLoop) \
    or isinstance(Parent, RoseAbstractions.RoseFunction) \
    or isinstance(Parent, RoseAbstractions.RoseCond):
      return True
    if Parent == RoseAbstractions.RoseUndefRegion():
      return True
    return False

  def getRegionID(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    return self.ID
  
  def getKeys(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    return self.Keys
  
  def getChildren(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      return self.Children
    else:
      assert self.Keys != None
      assert Key in self.Keys
      return self.Children[Key]
  
  def getParent(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    return self.Parent
  
  def getChild(self, Index, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not self.isEmpty(Key)
    if Key == None:
      assert Index < len(self.Children)
      Child = self.Children[Index]
      print("CHILD:")
      Child.print()
      print("Child.getParent():")
      print(type(Child.getParent()))
      print(type(self))
      assert Child.getParent() == self
      return Child
    else:
      assert self.Keys != None
      assert Key in self.Keys
      assert Index < len(self.Children[Key])
      Child = self.Children[Key][Index]
      assert Child.getParent() == self
      return Child
  
  def getNumChildren(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      return len(self.Children)
    else:
      assert self.Keys != None
      assert Key in self.Keys
      return len(self.Children[Key])
  
  def getPosOfChild(self, Child, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      assert Child in self.Children
      return self.Children.index(Child)
    else:
      assert self.Keys != None
      assert Key in self.Keys
      assert Child in self.Children[Key]
      assert Child.getParent() == self
      return self.Children[Key].index(Child)

  def getTailChild(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    print("KEY:")
    print(Key)
    if self.isEmpty(Key):
      return RoseAbstractions.RoseUndefRegion()
    if Key == None:
      Child = self.Children[len(self.Children) - 1]
      assert Child.getParent() == self
      return Child
    else:
      assert self.Keys != None
      assert Key in self.Keys
      Child = self.Children[Key][len(self.Children[Key]) - 1]
      assert Child.getParent() == self
      return Child
  
  def isEmpty(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      return len(self.Children) == 0
    else:
      assert self.Keys != None
      assert Key in self.Keys
      return len(self.Children[Key]) == 0
  
  def updateTailChild(self, UpdatedChild, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not self.isEmpty(Key)
    if Key == None:
      self.Children[len(self.Children) - 1] = UpdatedChild
    else:
      assert self.Keys != None
      assert Key in self.Keys
      self.Children[Key][len(self.Children[Key]) - 1] = UpdatedChild
  
  # Get the first function enclosing this region
  def getFunction(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    Function = self.getParent()
    while not isinstance(Function, RoseAbstractions.RoseFunction) \
          and not isinstance(Function, RoseAbstractions.RoseUndefRegion):
      Function = Function.getParent()
    return Function

  def getKeyForChild(self, Region):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if self.getKeys() == None:
      return None
    for Key in self.getKeys():
      for Child in self.Children[Key]:
        if Child == Region:
          return Key
    assert False, "Given region is not a child!"

  def getRegionBefore(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    ParentRegion = self.getParent()
    if isinstance(ParentRegion, RoseAbstractions.RoseUndefRegion):
      return RoseAbstractions.RoseUndefRegion()
    # Find the key for this region within the parent
    Key = ParentRegion.getKeyForChild(self)
    Position = ParentRegion.getPosOfChild(self, Key)
    if Position == 0:
      return RoseAbstractions.RoseUndefRegion()
    return ParentRegion.getChild(Position - 1, Key)

  def setParent(self, Parent):
    assert isinstance(Parent, RoseRegion)
    assert self.isParentValid(Parent)
    self.Parent = Parent

  def addChildren(self):
    pass

  def addRegion(self, Region, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Region)
    Region.setParent(self)
    if Key == None:
      self.Children.append(Region)
    else:
      assert self.Keys != None
      assert Key in self.Keys
      self.Children[Key].append(Region)
  
  def addNewKeyedRegion(self, Key, Region):
    # Sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Region)
    assert self.Keys != None
    assert Key not in self.Keys
    self.Keys.append(Key)
    Region.setParent(self)
    self.Children[Key] = [Region]
  
  def addRegionBefore(self, Index, Region, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Region)
    Region.setParent(self)
    if Key == None:
      assert Index < len(self.Children)
      self.Children.insert(Index, Region)
    else:
      assert self.Keys != None
      assert Key in self.Keys
      assert Index < len(self.Children[Key])
      self.Children[Key].insert(Index, Region)
    
  def replaceRegion(self, Region, Index, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Region)
    if Key == None:
      assert Index >= 0 and Index < len(self.Children)
      self.Children[Index] = Region
    else:
      assert self.Keys != None
      assert Key in self.Keys
      assert Index >= 0 and Index < len(self.Children[Key])
      self.Children[Key][Index] = Region
    
  def eraseChild(self, Child, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Child)
    assert Child.getParent() == self
    if Key == None:
      assert Child in self.Children
      # Remove the child
      self.Children.remove(Child)
    else:
      assert self.Keys != None
      assert Key in self.Keys
      assert Child in self.Children[Key]
      # Remove the child
      self.Children[Key].remove(Child)
    # Set the child's parent to undef region
    Child.setParent(RoseAbstractions.RoseUndefRegion())

  def cloneRegion(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    return deepcopy(self)

  # This could be used for checking structural isomorphism
  # i.e. this region's and given region's types match up as
  # we sequentially iterate over them.
  # Note that this does not check whether two regions are
  # equivalent or isomorphic in any other respect.
  def isStructurallyIsomorphicWith(self, CheckRegion):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not isinstance(CheckRegion, RoseAbstractions.RoseUndefRegion)
    # Check if the regions types are the same.
    if type(self) != type(CheckRegion):
      return False
    # If the regions are block, we stop here
    if isinstance(self, RoseAbstractions.RoseBlock):
      return True
    # Check if the keys are the same
    if self.Keys != CheckRegion.getKeys():
      return False
    # Number of children in this and given region is the same
    # for all keys.
    if self.Keys != None:
      for Key in self.Keys:
        if self.getNumChildren(Key) != CheckRegion.getNumChildren(Key):
          return False
      # Now iterate over all children for each key
      for Key in self.Keys:
        for Index in range(self.getNumChildren(Key)):
          Region1 = self.getChild(Index, Key)
          Region2 = CheckRegion.getChild(Index, Key)
          if Region1.isStructurallyIsomorphicWith(Region2) == False:
            return False
    else:
      if self.getNumChildren() != CheckRegion.getNumChildren():
        return False
      for Index in range(self.getNumChildren()):
        Region1 = self.getChild(Index)
        Region2 = CheckRegion.getChild(Index)
        if Region1.isStructurallyIsomorphicWith(Region2) == False:
          return False
    return True

  def containsRegionOfType(self, SubRegionType, Level : int = -1):
    # Some sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not SubRegionType == RoseAbstractions.RoseUndefRegion
    assert SubRegionType == RoseAbstractions.RoseFunction \
        or SubRegionType == RoseAbstractions.RoseForLoop \
        or SubRegionType == RoseAbstractions.RoseCond \
        or SubRegionType == RoseAbstractions.RoseBlock
    if isinstance(self, RoseAbstractions.RoseBlock):
      return False
    for SubRegion in self:
      if Level > 0:
        if SubRegion.containsRegionOfType(SubRegionType, Level - 1) == True:
          return True
        continue
      if isinstance(SubRegion, SubRegionType):
        return True
      if Level < 0:
        if SubRegion.containsRegionOfType(SubRegionType, Level) == True:
          return True
        continue
    return False

  def numLevelsOfRegion(self, SubRegionType, Level : int = -1):
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not SubRegionType == RoseAbstractions.RoseUndefRegion
    assert SubRegionType == RoseAbstractions.RoseFunction \
        or SubRegionType == RoseAbstractions.RoseForLoop \
        or SubRegionType == RoseAbstractions.RoseCond \
        or SubRegionType == RoseAbstractions.RoseBlock
    if isinstance(self, RoseAbstractions.RoseBlock):
      return 0
    NumSubRegions = 0
    for SubRegion in self:
      if Level > 0:
        NumSubRegions += SubRegion.numLevelsOfRegion(SubRegionType, Level - 1)
        continue
      if isinstance(SubRegion, SubRegionType):
        NumSubRegions += 1
      if Level < 0:
        NumSubRegions += SubRegion.numLevelsOfRegion(SubRegionType, Level)
        continue
    return NumSubRegions

  def getRegionsOfType(self, SubRegionType, Level : int = -1, Key = None):
    # Some sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not SubRegionType == RoseAbstractions.RoseUndefRegion
    assert SubRegionType == RoseAbstractions.RoseFunction \
        or SubRegionType == RoseAbstractions.RoseForLoop \
        or SubRegionType == RoseAbstractions.RoseCond \
        or SubRegionType == RoseAbstractions.RoseBlock
    if isinstance(self, RoseAbstractions.RoseBlock):
      assert SubRegionType != RoseAbstractions.RoseBlock
      return []
    print(type(self))
    if self.getKeys() == None:
      assert Key == None
    else:
      print("self.getKeys():")
      print(self.getKeys())
      print("Key:")
      print(Key)
      assert Key in self.getKeys()
    RegionList = list()
    for SubRegion in self.getChildren(Key):
      if Level > 0:
        if SubRegion.getKeys() == None:
          RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level - 1))
        else:
          for SubRegionKey in SubRegion.getKeys():
            RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level - 1, SubRegionKey))
        continue
      if isinstance(SubRegion, SubRegionType):
        RegionList.append(SubRegion)
        if SubRegionType == RoseAbstractions.RoseBlock:
          continue
      if Level < 0:
        if SubRegion.getKeys() == None:
          RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level))
        else:
          for SubRegionKey in SubRegion.getKeys():
            RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level, SubRegionKey))
        continue
    return RegionList

  def getKeysOfSubRegionsWithRegionOfType(self, SubRegionType):
    # Some sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not SubRegionType == RoseAbstractions.RoseUndefRegion
    assert SubRegionType == RoseAbstractions.RoseFunction \
        or SubRegionType == RoseAbstractions.RoseForLoop \
        or SubRegionType == RoseAbstractions.RoseCond \
        or SubRegionType == RoseAbstractions.RoseBlock
    if self.Keys == None:
      return None
    KeyList = list()
    for Key in self.Keys:
      for Child in self.Children[Key]:
        if isinstance(Child, SubRegionType):
          KeyList.append(Key)
          break
    return KeyList

  def getParentOfType(self, ParentRegionType):
    # Some sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not ParentRegionType == RoseAbstractions.RoseUndefRegion \
       and not ParentRegionType == RoseAbstractions.RoseBlock
    assert ParentRegionType == RoseAbstractions.RoseFunction \
        or ParentRegionType == RoseAbstractions.RoseForLoop \
        or ParentRegionType == RoseAbstractions.RoseCond
    Parent = self.getParent()
    if isinstance(Parent, RoseAbstractions.RoseUndefRegion):
      return RoseAbstractions.RoseUndefRegion()
    while not isinstance(Parent, ParentRegionType):
      Parent = Parent.getParent()
      if isinstance(Parent, RoseAbstractions.RoseUndefRegion):
        return RoseAbstractions.RoseUndefRegion()
    return Parent

  # Replaces the uses of an operation 
  def replaceUsesWith(self, Abstraction, NewAbstraction):
    assert not isinstance(Abstraction, RoseAbstractions.RoseUndefValue) \
      and not isinstance(Abstraction, RoseAbstractions.RoseConstant) \
      and not isinstance(Abstraction, RoseAbstractions.RoseFunction)
    assert not isinstance(NewAbstraction, RoseAbstractions.RoseUndefValue) \
      and not isinstance(NewAbstraction, RoseAbstractions.RoseFunction)
    assert isinstance(Abstraction, RoseAbstractions.RoseValue)
    assert isinstance(NewAbstraction, RoseAbstractions.RoseValue)
    assert Abstraction.getType() == NewAbstraction.getType()
    if self.Keys != None:
      for Key in self.Keys:
        for Child in self.Children[Key]:
          assert self.isChildValid(Child)
          Child.replaceUsesWith(Abstraction, NewAbstraction)
    else:
      for Child in self.Children:
        assert self.isChildValid(Child)
        Child.replaceUsesWith(Abstraction, NewAbstraction)

  # Sees if the given operation or function or argument has any uses
  def hasUsesOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseAbstractions.RoseUndefValue) \
      and not isinstance(Abstraction, RoseAbstractions.RoseConstant)
    assert isinstance(Abstraction, RoseAbstractions.RoseValue)
    if self.Keys != None:
      for Key in self.Keys:
        for Child in self.Children[Key]:
          assert self.isChildValid(Child)
          if Child.hasUsesOf(Abstraction) == True:
            return True
    else:
      for Child in self.Children:
        assert self.isChildValid(Child)
        if isinstance(self, RoseAbstractions.RoseBlock):
          if Child.usesValue(Abstraction) == True:
            return True
        else:
          if Child.hasUsesOf(Abstraction) == True:
            return True
    return False

  # This can be implemented by a subclass
  def getUsersInRegion(self, Abstraction):
    return []

  # Get all users of the given value
  def getUsersOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseAbstractions.RoseUndefValue) \
      and not isinstance(Abstraction, RoseAbstractions.RoseConstant)
    assert isinstance(Abstraction, RoseAbstractions.RoseValue)
    Users = []
    Users.extend(self.getUsersInRegion(Abstraction))
    # Blocks are already handled separately
    if isinstance(self, RoseAbstractions.RoseBlock):
      return Users
    if self.Keys != None:
      for Key in self.Keys:
        for Child in self.Children[Key]:
          assert self.isChildValid(Child)
          Users.extend(Child.getUsersOf(Abstraction))
    else:
      for Child in self.Children:
        assert self.isChildValid(Child)
        Users.extend(Child.getUsersOf(Abstraction))
    return Users

  # This can be implemented by a subclass
  def getNumUsersInRegion(self, Abstraction):
    return 0

  def getNumUsersOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseAbstractions.RoseUndefValue) \
      and not isinstance(Abstraction, RoseAbstractions.RoseConstant)
    assert isinstance(Abstraction, RoseAbstractions.RoseValue)
    NumUsers = 0
    NumUsers += self.getNumUsersInRegion(Abstraction)
    # Blocks are already handled separately
    if isinstance(self, RoseAbstractions.RoseBlock):
      return NumUsers
    if self.Keys != None:
      for Key in self.Keys:
        for Child in self.Children[Key]:
          assert self.isChildValid(Child)
          NumUsers += Child.getNumUsersOf(Abstraction)
    else:
      for Child in self.Children:
        assert self.isChildValid(Child)
        NumUsers += Child.getNumUsersOf(Abstraction)
    return NumUsers

  # An abstraction can be an operation and region.
  # This function cannot be used for rose blocks.
  def addAbstraction(self, Abstraction, Key = None):
    assert not isinstance(self, RoseAbstractions.RoseBlock)
    if Key != None:
      assert self.Keys != None
      assert Key in self.Keys
    else:
      assert self.Keys == None
    print("ADD ABSTRACTION SELF:")
    self.print()
    print("+++Key:")
    print(Key)
    print("Abstraction:")
    Abstraction.print()
    if isinstance(Abstraction, RoseRegion):
      self.addRegion(Abstraction, Key)
      return
    elif isinstance(Abstraction, RoseAbstractions.RoseOperation):
      # This is a little more difficult. First try to get RoseBlock
      TailRegion = self.getTailChild(Key)
      if not isinstance(TailRegion, RoseAbstractions.RoseBlock) \
      or isinstance(TailRegion, RoseAbstractions.RoseUndefRegion):
        print("CREATING A NEW BLOCK")
        # Add a new block first
        Block = RoseAbstractions.RoseBlock.create([])
        Block.addRegion(Abstraction)
        print("--BLOCK:")
        Block.print()
        self.addRegion(Block, Key)
        print("--self:")
        self.print()
      else:
        print("ADDING TO TAIL REGION")
        TailRegion.addRegion(Abstraction)
        self.updateTailChild(TailRegion, Key)
      return
    assert False

  def replaceAbstraction(self, OldAbstraction, NewAbstraction, Key = None):
    assert type(OldAbstraction) == type(NewAbstraction)
    assert self.isChildValid(NewAbstraction)
    if Key != None:
      assert self.Keys != None
      assert Key in self.Keys
      for Child in self.Children[Key]:
        if type(OldAbstraction) == type(Child):
          if Child == OldAbstraction:
            Index = self.Children[Key].index(OldAbstraction)
            self.replaceRegion(NewAbstraction, Index, Key)
            return True
        if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
          return True
    else:
      if  self.Keys != None:
        for RegionKey in self.Keys:
          if self.replaceAbstraction(OldAbstraction, NewAbstraction, RegionKey):
            return True
      else:
        for Child in self.Children:
          assert self.isChildValid(Child)
          if type(OldAbstraction) == type(Child):
            if Child == OldAbstraction:
              Index = self.Children.index(OldAbstraction)
              self.replaceRegion(NewAbstraction, Index)
              return True
          if not isinstance(self, RoseAbstractions.RoseBlock):
            if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
              return True
    return False

  def print(self, NumSpace = 0):
    for Child in self.Children:
      Child.getParent() 
      assert Child.getParent() == self
      Child.print(NumSpace)


