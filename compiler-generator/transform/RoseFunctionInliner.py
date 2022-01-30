
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *


def RunInlinerOnFunction(Function : RoseFunction):
  print("RUN INLINER ON FUNCTION")
  print("FUNCTION:")
  Function.print()

  # Iterate over all the abstractions of this region
  for Abstraction in Function.getChildren():
    # Run inliner on the nested function
    if isinstance(Abstraction, RoseFunction):
      RunInlinerOnFunction(Abstraction)
  
  # Top level function has no uses
  if Function.isTopLevelFunction():
    return
  
  # Get the params of the function
  FunctionArgs = Function.getArgs()

  # Look for uses of this function
  ParentRegionOfFunction = Function.getFunction()
  Users = ParentRegionOfFunction.getUsersOf(Function)
  for User in Users:
    print("USER OF FUNCTION:")
    User.print()
    assert isinstance(User, RoseCallOp)
    # Get all the call operands that matter
    CallArgs = User.getCallOperands()
    Block = User.getParent()
    UserPos = Block.getPosOfOperation(User)
    print("BLOCK BEFORE SPLITTING:")
    Block.print()
    NewBlock = Block.splitAt(UserPos)
    print("NEW BLOCK:")
    NewBlock.print()
    print("UPDATED BLOCK:")
    Block.print()
    # Clone all the regions of the function to be inlined
    # and add them to the parent region.
    ParentRegion = Block.getParent()
    InsertionPoint = ParentRegion.getPosOfChild(NewBlock)
    for Region in Function.getChildren():
      ParentRegion.addRegionBefore(InsertionPoint, Region.clone())
    # Now replace the uses of function args with call args
    for Index in range(Function.getNumArgs()):
      ParentRegion.replaceUsesWith(FunctionArgs, CallArgs[Index])
    print("FUNCTION AFTER INLINING")
    ParentRegionOfFunction.print()
  
  print("+++FUNCTION AFTER INLINING")
  ParentRegionOfFunction.print()
  # Now remove the inlined function
  ParentRegionOfFunction.eraseChild(Function)
  print("FUNCTION AFTER ERASING")
  ParentRegionOfFunction.print()



# Runs Loop reroller
def Run(Function : RoseFunction):
  print("RUN FUNCTION INLINER")
  RunInlinerOnFunction(Function)
  Function.print()


