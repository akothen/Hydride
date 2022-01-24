#############################################################
#
# This pass removes bvtrunc and replace them with bvextratct
# and simplify the IR.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def RunOpSimplifyOnBlock(Block : RoseBlock):
  print("RUN OP SIMPLIFY ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Gather all the truncate ops in this block
  TruncateOpsList = list()
  for Operation in Block:
    if isinstance(Operation, RoseBVTruncateOp):
      TruncateOpsList.append(Operation)
  # Now deal with all the truncate ops in this block
  for Op in TruncateOpsList:
    if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
      # Check if the only use of this extract op is the truncate op
      ExtractOp = Op.getInputBitVector()
      if len(ExtractOp.getUsers()) == 1:
        # Replace this extract and truncate instruction with a new extarct op
        TotalBitwidth = ExtractOp.getOutputBitwidth()
        TruncBitwidth = Op.getOutputBitwidth()
        assert TotalBitwidth > TruncBitwidth
        High = ExtractOp.getHighIndex()
        # Compute the new low index
        if isinstance(High, RoseConstant):
          NewLow = RoseConstant.create(High.getValue() - TruncBitwidth + 1, High.getType())
        else:
          # Subtract the high index with the trucnate bitwidth
          Offset = RoseConstant.create(TruncBitwidth - 1, High.getType())
          NewLow = RoseSubOp.create("new.low.index." + ExtractOp.getName(), [High, Offset])
          # Add this new low index computation to the IR
          Block.addOperationBefore(NewLow, ExtractOp)
        # Generate the new operation now
        ExtractOp.getInputBitVector().print()
        ExtractOp.getInputBitVector().getType().print()
        print(type(ExtractOp.getInputBitVector()))
        TruncBitwidthVal = RoseConstant(TruncBitwidth, High.getType())
        NewOp = RoseBVExtractSliceOp.create("new." + ExtractOp.getName(), \
                                  ExtractOp.getInputBitVector(), NewLow, High, TruncBitwidthVal)
        # Add this new operation to the block and replace the uses of older op
        Block.addOperationBefore(NewOp, ExtractOp)
        Op.replaceUsesWith(NewOp)
        # Remove the truncate and the replaced extract op
        Block.eraseOperation(Op)
        Block.eraseOperation(ExtractOp)
        continue
    # Nothing to be done except to replace this truncate op with 
    # an extract op.
    TotalBitwidth = Op.getInputBitVector().getOutputBitwidth()
    TruncBitwidth = Op.getOutputBitwidth()
    assert TotalBitwidth > TruncBitwidth
    High = RoseConstant.create(TotalBitwidth - 1, Op.getOperand(1).getType())
    Low = RoseConstant.create(TotalBitwidth - TruncBitwidth, Op.getOperand(1).getType())
    TruncBitwidthVal = RoseConstant(TruncBitwidth, Op.getOperand(1).getType())
    NewOp = RoseBVExtractSliceOp.create("new." + Op.getName(), Op.getInputBitVector(), \
                                        Low, High, TruncBitwidthVal)
    # Add this new operation to the block and replace the uses of older op
    Block.addOperationBefore(NewOp, Op)
    Op.replaceUsesWith(NewOp)
    # The truncate op must be removed
    Block.eraseOperation(Op)


def RunOpSimplifyOnRegion(Region):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Run op simplification on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunOpSimplifyOnFunction(Abstraction)
      continue
    # Op simplification only happens on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      print(Abstraction)
      Abstraction.print()
      RunOpSimplifyOnRegion(Abstraction)
      continue
    RunOpSimplifyOnBlock(Abstraction)


def RunOpSimplifyOnFunction(Function : RoseFunction):
  print("RUN ON OP SIMPLIFY FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run op simplification on the given function
  RunOpSimplifyOnRegion(Function)


# Runs a transformation
def Run(Function : RoseFunction):
  RunOpSimplifyOnFunction(Function)
  print("\n\n\n\n\n")
  Function.print()



