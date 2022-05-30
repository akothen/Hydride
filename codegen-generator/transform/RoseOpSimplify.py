#############################################################
#
# This pass removes bvtrunc and replace them with bvextracts,
# removes redundant bvextracts, and simplifies the IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def SimplifyOperations(Block : RoseBlock):
  print("SIMPLIFY OPERATIONS")
  # Gather mapping between simplifiable ops and the simplified op
  OpToSimplifiedOp = dict()
  OpList = list()
  print("==============================================")
  for Operation in Block:
    SimplifiedOp = Operation.simplify()
    Operation.print()
    print("SIMPLIFIED OP:")
    print(SimplifiedOp)
    SimplifiedOp.print()
    if not isinstance(SimplifiedOp, RoseUndefValue):
      print("PUT")
      OpList.append(Operation)
      OpToSimplifiedOp[Operation] = SimplifiedOp
      Operation.print()
      print("-->")
      SimplifiedOp.print()
  # Now replace the uses of the ops that can be simplified and delete the ops
  for Operation in OpList:
    Operation.print()
    print("-----SIMPLIFIED OP:")
    print(SimplifiedOp)
    SimplifiedOp.print()
    SimplifiedOp = OpToSimplifiedOp[Operation]
    Operation.print()
    print("-->")
    SimplifiedOp.print()
    if isinstance(SimplifiedOp, RoseOperation) and SimplifiedOp not in Block:
      Block.addOperationBefore(SimplifiedOp, Operation)
    Operation.replaceUsesWith(SimplifiedOp)
    Block.eraseOperation(Operation)
  print("SIMPLIFY OPERATIONS DONE")


def RunOpSimplifyOnBlock(Block : RoseBlock):
  print("RUN OP SIMPLIFY ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Time to simplify some instructions that can be simplified
  SimplifyOperations(Block)

  # Gather all the truncate and extract ops in this block
  OpList = list()
  for Operation in Block:
    if isinstance(Operation, RoseBVTruncateOp) \
    or isinstance(Operation, RoseBVExtractSliceOp):
      OpList.append(Operation)
  # Now deal with all the truncate ops in this block
  for Op in OpList:
    if isinstance(Op, RoseBVTruncateOp):
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
          # Remove the truncate and the replaced extract op.
          # IMPORTANT: the truncate op must be removed before the extract op.
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
      continue
    # Now deal with extract op whose operand is an extract op.
    # Note that this could be thought of the general case of 
    # what we have dealt with above.
    assert isinstance(Op, RoseBVExtractSliceOp)
    if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
      SecondExtractOp = Op
      # Check if the only use of this extract op is the only use
      FirstExtractOp = SecondExtractOp.getInputBitVector()
      if len(FirstExtractOp.getUsers()) == 1:
        # Replace this first and second instruction with a new extarct op
        FirstExtractBitwidth = FirstExtractOp.getOutputBitwidth()
        SecondExtractBitwidth = SecondExtractOp.getOutputBitwidth()
        assert FirstExtractBitwidth > SecondExtractBitwidth
        FirstLow = FirstExtractOp.getLowIndex()
        SecondLow = SecondExtractOp.getLowIndex()
        SecondHigh= SecondExtractOp.getHighIndex()
        # Compute the new low index
        if isinstance(SecondLow, RoseConstant) and isinstance(FirstLow, RoseConstant):
          NewLow = RoseConstant.create(FirstLow.getValue() + SecondLow.getValue(), SecondLow.getType())
        else:
          NewLow = RoseAddOp.create("new.low.index." + SecondExtractOp.getName(), [FirstLow, SecondLow])
          # Add this new low index computation to the IR
          Block.addOperationBefore(NewLow, FirstExtractOp)
        # Compute the new high index
        if isinstance(SecondHigh, RoseConstant) and isinstance(FirstLow, RoseConstant):
          NewHigh = RoseConstant.create(FirstLow.getValue() + SecondHigh.getValue(), SecondHigh.getType())
        else:
          NewHigh = RoseAddOp.create("new.high.index." + SecondExtractOp.getName(), [FirstLow, SecondHigh])
          # Add this new low index computation to the IR
          Block.addOperationBefore(NewHigh, FirstExtractOp)
        # Generate the new operation now
        BitwidthVal = RoseConstant(SecondExtractBitwidth, NewHigh.getType())
        NewOp = RoseBVExtractSliceOp.create("new." + FirstExtractOp.getName(), \
                              FirstExtractOp.getInputBitVector(), NewLow, NewHigh, BitwidthVal)
        # Add this new operation to the block and replace the uses of older op
        Block.addOperationBefore(NewOp, FirstExtractOp)
        SecondExtractOp.replaceUsesWith(NewOp)
        # IMPORTANT: Remove the second extract before removing the first one
        Block.eraseOperation(SecondExtractOp)
        Block.eraseOperation(FirstExtractOp)

  # Let's try and simplify the block again since there maybe things to simplify
  SimplifyOperations(Block) 


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




