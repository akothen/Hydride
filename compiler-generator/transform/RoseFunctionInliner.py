#############################################################
#
# This is the function inlining pass for Rose IR.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *


def RunInlinerOnFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN INLINER ON FUNCTION")
  print("FUNCTION:")
  Function.print()

  # Iterate over all the abstractions of this region
  for Abstraction in Function.getChildren():
    # Run inliner on the nested function
    if isinstance(Abstraction, RoseFunction):
      RunInlinerOnFunction(Abstraction, Context)
  
  # Top level function has no uses
  if Function.isTopLevelFunction():
    return
  
  # Track call sites of the function
  CallSites = list()

  # Look for uses of this function
  ParentRegionOfFunction = Function.getFunction()
  Users = ParentRegionOfFunction.getUsersOf(Function)
  Suffix = "callsite"
  for UserIndex, User in enumerate(Users):
    # Clone the function
    ClonedFunction = Function.clone(Suffix + str(UserIndex))
    print("ClonedFunction:")
    ClonedFunction.print()
    # Get the params of the function
    FunctionArgs = ClonedFunction.getArgs()
    print("USER OF FUNCTION:")
    User.print()
    assert isinstance(User, RoseCallOp)
    CallSites.append(User)
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
    for Region in ClonedFunction.getChildren():
      ParentRegion.addRegionBefore(InsertionPoint, Region)
      InsertionPoint += 1
    print("ParentRegion:")
    ParentRegion.print()
    # Now replace the uses of function args with call args
    for Index in range(ClonedFunction.getNumArgs()):
      print("CallArgs[Index]:")
      CallArgs[Index].print()
      print("FunctionArgs[Index]:")
      FunctionArgs[Index].print()
      ParentRegion.replaceUsesWith(FunctionArgs[Index], CallArgs[Index])
    # Replace the value at callsite with return value
    User.replaceUsesWith(ClonedFunction.getReturnValue())
    # Erase the return op
    for Op in ParentRegion.getUsersOf(ClonedFunction.getReturnValue()):
      if isinstance(Op, RoseReturnOp):
        ParentBlock = Op.getParent()
        ParentBlock.eraseOperation(Op)
        if ParentBlock.getNumOperations() == 0:
          BlockParent = ParentBlock.getParent()
          Key = BlockParent.getKeyForChild(ParentBlock)
          BlockParent.eraseChild(ParentBlock, Key)
        break
    print("ParentRegion:")
    ParentRegion.print()
    print("FUNCTION AFTER INLINING")
    ParentRegionOfFunction.print()
  
  print("+++FUNCTION AFTER INLINING")
  ParentRegionOfFunction.print()
  # Now remove the inlined function
  ParentRegionOfFunction.eraseChild(Function)
  print("FUNCTION AFTER ERASING")
  ParentRegionOfFunction.print()
  # Erase call sites
  for CallSite in CallSites:
    Block = CallSite.getParent()
    Block.eraseOperation(CallSite)


# Runs function inliner
def Run(Function : RoseFunction, Context : RoseContext):
  print("RUN FUNCTION INLINER")
  RunInlinerOnFunction(Function, Context)
  Function.print()


