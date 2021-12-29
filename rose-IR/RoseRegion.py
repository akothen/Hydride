
from RoseOperation import RoseOperation
from RoseFunctionCall import RoseFunctionCall
import RoseAbstractions


# Abstract class representing a region.
# Regions can contain loops, function, blocks.
# Regions can be contained in functions and loops.
class RoseRegion:
  def __init__(self, Children : list, Parent):
    # Parent must be a function, loop or a block
    if Parent is not None:
      assert isinstance(Parent, RoseAbstractions.RoseForLoop) \
          or isinstance(Parent, RoseAbstractions.RoseFunction)
    self.Parent = Parent

    # Children do not have to be instances of regions
    for Child in Children:
      assert isinstance(Child, RoseAbstractions.RoseForLoop) \
          or isinstance(Child, RoseAbstractions.RoseFunction) \
          or isinstance(Child, RoseAbstractions.RoseBlock) \
          or isinstance(Child, RoseOperation) \
          or isinstance(Child, RoseFunctionCall)
    self.Children = Children
  
  @staticmethod
  def create(Children : list, Parent = None):
    return RoseRegion(Children, Parent)
    
  def getChildren(self):
    return self.Children
  
  def getParent(self):
    return self.Parent
  
  def setParent(self, Parent):
    self.Parent = Parent
  
  def addBlock(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock)
    # Blocks can only be added to functions and loops only
    assert isinstance(self, RoseAbstractions.RoseForLoop) \
        or isinstance(self, RoseAbstractions.RoseFunction)
    Block.setParent(self)
    self.Children.append(Block)
  
  def addFunction(self, Function):
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    # Functions can only be added to other functions ans perhaps loops
    assert isinstance(self, RoseAbstractions.RoseForLoop) \
        or isinstance(self, RoseAbstractions.RoseFunction)
    Function.setParent(self)
    self.Children.append(Function)
  
  def addForLoop(self, Loop):
    assert isinstance(Loop, RoseAbstractions.RoseForLoop)
    # Loops can only be added to functions and other loops
    assert isinstance(self, RoseAbstractions.RoseForLoop) \
        or isinstance(self, RoseAbstractions.RoseFunction)
    Loop.setParent(self)
    self.Children.append(Loop)
     
  def addOperation(self, Op):
    # Sanity check
    assert isinstance(Op, RoseFunctionCall) \
        or isinstance(Op, RoseOperation)
    
    # Operations are contained only in blocks
    assert isinstance(self, RoseAbstractions.RoseBlock)
    Op.setParentBlock(self)
    self.Children.append(Op)

  def print(self):
    for Child in self.Children:
        Child.print()

