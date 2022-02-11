
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
    self.Children = Children
    if self.Children is not None:
      assert self.areChildrenValid()
    # Tracks keys for this region
    self.Keys = Keys
    # This is a unique ID to identify this instance of rose region
    # If this is an instance of undef region, then the ID used is 0.
    if not isinstance(self, RoseAbstractions.RoseUndefRegion):
      self.ID = uuid.uuid4()
    else:
      self.ID = 0

  def __eq__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.Children == Other.Children and self.Parent == Other.Parent
  
  def __ne__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.Children != Other.Children or self.Parent != Other.Parent
  
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
      return self.getChild(self.ChildIndex)
    
  
  def areChildrenValid(self):
    if isinstance(self, RoseAbstractions.RoseUndefRegion):
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
  
  def getChildren(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    return self.Children
  
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
      return self.Children[Index]
    else:
      assert Index < len(self.Children[Key])
      return self.Children[Key][Index]
  
  def getNumChildren(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      return len(self.Children)
    else:
      return len(self.Children[Key])
  
  def getPosOfChild(self, Child, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      assert Child in self.Children
      return self.Children.index(Child)
    else:
      assert Child in self.Children[Key]
      return self.Children[Key].index(Child)

  def getTailChild(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    print("KEY:")
    print(Key)
    if self.isEmpty(Key):
      return RoseAbstractions.RoseUndefRegion()
    if Key == None:
      return self.Children[len(self.Children) - 1]
    else:
      return self.Children[Key][len(self.Children[Key]) - 1]
  
  def isEmpty(self, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    if Key == None:
      return len(self.Children) == 0
    else:
      return len(self.Children[Key]) == 0
  
  def updateTailChild(self, UpdatedChild, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not self.isEmpty(Key)
    if Key == None:
      self.Children[len(self.Children) - 1] = UpdatedChild
    else:
      self.Children[Key][len(self.Children[Key]) - 1] = UpdatedChild
  
  # Get the first function enclosing this region
  def getFunction(self):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    Function = self.getParent()
    while not isinstance(Function, RoseAbstractions.RoseFunction):
      Function = Function.getParent()
    return Function

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
      self.Children[Key].append(Region)
  
  def addRegionBefore(self, Index, Region, Key = None):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Region)
    Region.setParent(self)
    if Key == None:
      assert Index < len(self.Children)
      self.Children.insert(Index, Region)
    else:
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
      assert Index >= 0 and Index < len(self.Children[Key])
      self.Children[Key][Index] = Region
    
  def eraseChild(self, Child):
    # Sanity check
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert self.isChildValid(Child)
    assert Child in self.Children
    self.Children.remove(Child)
  
  def clone(self):
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

  def getRegionsOfType(self, SubRegionType, Level : int = -1):
    # Some sanity checks
    assert not isinstance(self, RoseAbstractions.RoseUndefRegion)
    assert not SubRegionType == RoseAbstractions.RoseUndefRegion
    assert SubRegionType == RoseAbstractions.RoseFunction \
        or SubRegionType == RoseAbstractions.RoseForLoop \
        or SubRegionType == RoseAbstractions.RoseCond \
        or SubRegionType == RoseAbstractions.RoseBlock
    if isinstance(self, RoseAbstractions.RoseBlock):
      return False
    RegionList = list()
    for SubRegion in self:
      if Level > 0:
        RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level - 1))
        continue
      if isinstance(SubRegion, SubRegionType):
        RegionList.append(SubRegion)
      if Level < 0:
        RegionList.extend(SubRegion.getRegionsOfType(SubRegionType, Level))
        continue
    return RegionList

  def print(self, NumSpace = 0):
    for Child in self.Children:
      Child.print(NumSpace)


