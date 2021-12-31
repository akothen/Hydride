
import RoseAbstractions


# Abstract class representing a region.
# Regions can contain loops, function, blocks, etc.
# Regions can be contained in functions and loops.
class RoseRegion:
  def __init__(self, Children, Parent, SubClassData = None):
    self.Parent = Parent
    if self.Parent is not None:
      assert self.isParentValid(Parent)
    self.Children = Children
    assert self.areChildrenValid()
    self.SubClassData = SubClassData

  def __eq__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.SubClassData == Other.SubClassData and self.Children == Other.Children \
       and self.Parent == Other.Parent
  
  def __ne__(self, Other):
    assert isinstance(Other, RoseRegion)
    return self.SubClassData != Other.SubClassData or self.Children != Other.Children \
        or self.Parent != Other.Parent

  def areChildrenValid(self):
    pass

  def isParentValid(self, Parent):
    if isinstance(Parent, RoseAbstractions.RoseForLoop) \
    or isinstance(Parent, RoseAbstractions.RoseFunction) \
    or isinstance(Parent, RoseAbstractions.RoseCond):
      return True
    return False
  
  def getChildren(self):
    return self.Children
  
  def getParent(self):
    return self.Parent
  
  def getSubClassData(self):
    return self.SubClassData
  
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
    
  def setSubClassData(self, Data, Key = None):
    if Key == None:
       self.SubClassData = Data
    else:
      self.SubClassData[Key] = Data

  def print(self):
    for Child in self.Children:
        Child.print()
