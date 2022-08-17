#############################################################
#
# This is the function inlining pass for Rose IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *
from RoseUtilities import *


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

  # Look for uses of this inner function
  ParentRegionOfFunction = Function.getFunction()
  Users = ParentRegionOfFunction.getUsersOf(Function)
  Suffix = "site"
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
        
    # Get uses of callsites
    ClonedReturnValue = ClonedFunction.getReturnValue()
    CallSiteUsers = User.getParent().getFunction().getUsersOf(User)
    print("CallSiteUsers:")
    print(CallSiteUsers)
    assert len(CallSiteUsers) == 1
    CallSiteUser = CallSiteUsers[0]
    # Get users of return value
    TempDstUsers = ParentRegion.getUsersOf(ClonedReturnValue)
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
    
    if isinstance(CallSiteUser, RoseBVInsertSliceOp):
      assert CallSiteUser.getInsertValue() == ClonedReturnValue
      if not isinstance(ClonedReturnValue, RoseArgument) \
        and not isinstance(ClonedReturnValue, RoseOperation):
        for TempDstUser in TempDstUsers:
          if isinstance(TempDstUser, RoseBVInsertSliceOp):
            print("TempDstUser:")
            TempDstUser.print()
            #ParentFunction = TempDstUser.getParent().getFunction()
            assert ClonedReturnValue == TempDstUser.getInputBitVector()
            PrevLowIndex = TempDstUser.getOperand(TempDstUser.getLowIndexPos())
            if isinstance(PrevLowIndex, RoseOperation):
              LowIndex = RoseAddOp.create(Context.genName(), \
                              [TempDstUser.getLowIndex(), CallSiteUser.getLowIndex()])
              CurrentBlock.addOperationBefore(LowIndex, PrevLowIndex)
              TempDstUser.setOperand(TempDstUser.getLowIndexPos(), LowIndex)
            PrevHighIndex = TempDstUser.getOperand(TempDstUser.getHighIndexPos())
            if isinstance(PrevHighIndex, RoseOperation):
              Bitwidth = RoseConstant.create(TempDstUser.getOutputBitwidth() - 1, \
                              CallSiteUser.getOperand(CallSiteUser.getBitwidthPos()).getType())
              HighIndex = RoseAddOp.create(Context.genName(), [LowIndex, Bitwidth])
              CurrentBlock = TempDstUser.getParent()
              CurrentBlock.addOperationBefore(HighIndex, PrevHighIndex)   
              TempDstUser.setOperand(TempDstUser.getHighIndexPos(), HighIndex)
            TempDstUser.setOperand(1, CallSiteUser.getInputBitVector())
        # Erase the callsite user
        ParentBlock = CallSiteUser.getParent()
        ParentBlock.eraseOperation(CallSiteUser)
        if ParentBlock.getNumOperations() == 0:
          BlockParent = ParentBlock.getParent()
          Key = BlockParent.getKeyForChild(ParentBlock)
          BlockParent.eraseChild(ParentBlock, Key)
    
    # Erase the call site
    Block = User.getParent()
    Block.eraseOperation(User)
    if Block.getNumOperations() == 0:
      BlockParent = Block.getParent()
      Key = BlockParent.getKeyForChild(Block)
      BlockParent.eraseChild(Block, Key)

    print("User.getParent().getFunction():")
    CallArgs[0].getParent().getFunction().print()
    # Replace uses with unique copies
    for CallArgOp in CallArgs:
      if isinstance(CallArgOp, RoseOperation):
        NewOp = CallArgOp.clone(CallArgOp.getName() + "." + "copy")
        ReplaceUsesWithUniqueCopiesOf(ParentRegion, CallArgOp, NewOp, Context)

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

  # Now fuse adjacent blocks in this function
  FuseAdjacentBlocks(ParentRegionOfFunction)



# Runs function inliner
def Run(Function : RoseFunction, Context : RoseContext):
  print("RUN FUNCTION INLINER")
  NumBlocksAtLevel0 = Function.numLevelsOfRegion(RoseBlock, Level=0)
  print("NumBlocksAtLevel0:")
  print(NumBlocksAtLevel0)
  print("FUNCTION:")
  Function.print()
  Blocks = Function.getRegionsOfType(RoseBlock, Level=0)
  for Block in Blocks:
    print("BLOCK IN FUNCTION:")
    Block.print()
  print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  RunInlinerOnFunction(Function, Context)
  Function.print()
  print("AFTER INLINING")
  NumBlocksAtLevel0 = Function.numLevelsOfRegion(RoseBlock, Level=0)
  print("NumBlocksAtLevel0:")
  print(NumBlocksAtLevel0)
  print("FUNCTION:")
  Function.print()
  Blocks = Function.getRegionsOfType(RoseBlock, Level=0)
  for Block in Blocks:
    print("BLOCK IN FUNCTION:")
    Block.print()
  print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")


