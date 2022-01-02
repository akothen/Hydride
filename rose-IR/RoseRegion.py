
import RoseAbstractions
import RoseConstants


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
    if isinstance(self, RoseConstants.RoseUndefRegion):
      return True
    return False

  def isParentValid(self, Parent):
    if isinstance(self, RoseConstants.RoseUndefRegion):
      return True
    if isinstance(Parent, RoseAbstractions.RoseForLoop) \
    or isinstance(Parent, RoseAbstractions.RoseFunction) \
    or isinstance(Parent, RoseAbstractions.RoseCond):
      return True
    if Parent == RoseConstants.RoseUndefRegion():
      return True
    return False
  
  def getChildren(self):
    return self.Children
  
  def getParent(self):
    return self.Parent
  
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

  def print(self):
    for Child in self.Children:
        Child.print()
  
  
