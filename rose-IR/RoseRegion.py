
import RoseAbstractions


# Abstract class representing a region.
# Regions can contain loops, function, blocks, etc.
# Regions can be contained in functions and loops.
class RoseRegion:
  def __init__(self, Children, Parent):
    self.Parent = Parent
    if self.Parent is not None:
      assert self.isParentValid(Parent)
    self.Children = Children
    if self.Children is not None:
      assert self.areChildrenValid()

  def __eq__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.Children == Other.Children and self.Parent == Other.Parent
  
  def __ne__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.Children != Other.Children or self.Parent != Other.Parent

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
  
  def getChildren(self):
    return self.Children
  
  def getParent(self):
    return self.Parent
  
  def getChild(self, Index, Key = None):
    assert not self.isEmpty(Key)
    if Key == None:
      assert Index < len(self.Children)
      return self.Children[Index]
    else:
      assert Index < len(self.Children[Key])
      return self.Children[Key][Index]
  
  def getNumChildren(self, Key = None):
    if Key == None:
      return len(self.Children)
    else:
      return len(self.Children[Key])
  
  def getPosOfChild(self, Child, Key = None):
    if Key == None:
      assert Child in self.Children
      return self.Children.index(Child)
    else:
      assert Child in self.Children[Key]
      return self.Children[Key].index(Child)

  def getTailChild(self, Key = None):
    if self.isEmpty(Key):
      return RoseAbstractions.RoseUndefRegion()
    if Key == None:
      return self.Children[len(self.Children) - 1]
    else:
      return self.Children[Key][len(self.Children) - 1]
  
  def isEmpty(self, Key = None):
    if Key == None:
      return len(self.Children) == 0
    else:
      return len(self.Children[Key]) == 0
  
  def updateTailChild(self, UpdatedChild, Key = None):
    assert not self.isEmpty(Key)
    if Key == None:
      self.Children[len(self.Children) - 1] = UpdatedChild
    else:
      self.Children[Key][len(self.Children) - 1] = UpdatedChild

  def setParent(self, Parent):
    assert isinstance(Parent, RoseRegion)
    assert self.isParentValid(Parent)
    self.Parent = Parent

  def addChildren(self):
    pass

  def addRegion(self, Region, Key = None):
    assert self.isChildValid(Region)
    Region.setParent(self)
    if Key == None:
      self.Children.append(Region)
    else:
      self.Children[Key].append(Region)
    
  def replaceRegion(self, Region, Index, Key = None):
    assert self.isChildValid(Region)
    if Key == None:
      assert Index >= 0 and Index < len(self.Children)
      self.Children[Index] = Region
    else:
      assert Index >= 0 and Index < len(self.Children[Key])
      self.Children[Key][Index] = Region
    
  def eraseChild(self, Child):
    assert self.isChildValid(Child)
    assert Child in self.Children
    self.Children.remove(Child)


  def print(self):
    for Child in self.Children:
        Child.print()


