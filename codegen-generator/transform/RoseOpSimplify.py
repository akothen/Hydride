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
from RoseContext import *


def SimplifyOperations(Block: RoseBlock):
    print("SIMPLIFYING BLOCK:")
    Block.print()
    # Gather mapping between simplifiable ops and the simplified op
    OpToSimplifiedOp = dict()
    OpList = list()
    for Operation in Block:
        SimplifiedOp = Operation.simplify()
        if not isinstance(SimplifiedOp, RoseUndefValue):
            OpList.append(Operation)
            OpToSimplifiedOp[Operation] = SimplifiedOp
    # Now replace the uses of the ops that can be simplified and delete the ops
    for Operation in OpList:
        SimplifiedOp = OpToSimplifiedOp[Operation]
        print("OPERATION:")
        Operation.print()
        print("SIMPLIFY OPERATION:")
        SimplifiedOp.print()
        if isinstance(SimplifiedOp, RoseOperation):
            if not isinstance(SimplifiedOp.getParent(), RoseBlock):
                Block.addOperationBefore(SimplifiedOp, Operation)
            elif SimplifiedOp not in Block:
                Block.addOperationBefore(SimplifiedOp, Operation)
        Operation.replaceUsesWith(SimplifiedOp)
        Block.eraseOperation(Operation)


def RunOpSimplifyOnBlock(Block: RoseBlock,  Context: RoseContext):
    # Time to simplify some instructions that can be simplified
    SimplifyOperations(Block)

    # Gather all the truncate and extract ops in this block
    OpList = list()
    # for Operation in Block:
    #  if isinstance(Operation, RoseBVTruncateHighOp) \
    #  or isinstance(Operation, RoseBVTruncateLowOp) \
    #  or isinstance(Operation, RoseBVExtractSliceOp):
    #    OpList.append(Operation)
    # Now deal with all the truncate ops in this block
    for Op in OpList:
        if isinstance(Op, RoseBVTruncateHighOp):
            if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
                # Check if the only use of this extract op is the truncate op
                ExtractOp = Op.getInputBitVector()
                if ExtractOp.getNumUsers() == 1:
                    # Replace this extract and truncate instruction with a new extarct op
                    TotalBitwidth = ExtractOp.getOutputBitwidth()
                    TruncBitwidth = Op.getOutputBitwidth()
                    assert TotalBitwidth > TruncBitwidth
                    High = ExtractOp.getHighIndex()
                    Low = ExtractOp.getLowIndex()
                    # Compute the new low index
                    if isinstance(High, RoseConstant):
                        NewLow = RoseConstant.create(
                            High.getValue() - TruncBitwidth + 1, High.getType())
                        NewHigh = High
                    else:
                        # Subtract the high index with the trucnate bitwidth
                        # Offset = RoseConstant.create(TruncBitwidth - 1, High.getType())
                        # NewLow = RoseSubOp.create("new.low.idx." + ExtractOp.getName(), [High, Offset])
                        Offset = RoseConstant.create(
                            TotalBitwidth - TruncBitwidth, Low.getType())
                        NewLow = RoseAddOp.create(Context.genName(ExtractOp.getName() + ".new.low.idx"),
                                                  [Low, Offset])
                        Bitwidth = RoseConstant.create(
                            TruncBitwidth - 1, High.getType())
                        NewHigh = RoseAddOp.create(Context.genName(ExtractOp.getName() + ".new.high.idx"),
                                                   [NewLow, Bitwidth])
                        # Add this new low index computation to the IR
                        Block.addOperationBefore(NewLow, ExtractOp)
                        Block.addOperationBefore(NewHigh, ExtractOp)
                    # Generate the new operation now
                    TruncBitwidthVal = RoseConstant(
                        TruncBitwidth, High.getType())
                    NewOp = RoseBVExtractSliceOp.create(Context.genName(ExtractOp.getName() + ".new"),
                                                        ExtractOp.getInputBitVector(), NewLow, NewHigh, TruncBitwidthVal)
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
            High = RoseConstant.create(
                TotalBitwidth - 1, Op.getOperand(1).getType())
            Low = RoseConstant.create(
                TotalBitwidth - TruncBitwidth, Op.getOperand(1).getType())
            TruncBitwidthVal = RoseConstant(
                TruncBitwidth, Op.getOperand(1).getType())
            NewOp = RoseBVExtractSliceOp.create(Context.genName(Op.getName() + ".new"),
                                                Op.getInputBitVector(), Low, High, TruncBitwidthVal)
            # Add this new operation to the block and replace the uses of older op
            Block.addOperationBefore(NewOp, Op)
            Op.replaceUsesWith(NewOp)
            # The truncate op must be removed
            Block.eraseOperation(Op)
            continue
        if isinstance(Op, RoseBVTruncateLowOp):
            if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
                # Check if the only use of this extract op is the truncate op
                ExtractOp = Op.getInputBitVector()
                if ExtractOp.getNumUsers() == 1:
                    # Replace this extract and truncate instruction with a new extarct op
                    TotalBitwidth = ExtractOp.getOutputBitwidth()
                    TruncBitwidth = Op.getOutputBitwidth()
                    assert TotalBitwidth > TruncBitwidth
                    Low = ExtractOp.getLowIndex()
                    # Compute the new high index
                    Offset = RoseConstant.create(
                        TruncBitwidth - 1, Low.getType())
                    NewHigh = RoseAddOp.create(Context.genName(ExtractOp.getName() + ".new.high.idx"),
                                               [Low, Offset])
                    # Add this new high index computation to the IR
                    Block.addOperationBefore(NewHigh, ExtractOp)
                    # Generate the new operation now
                    TruncBitwidthVal = RoseConstant(
                        TruncBitwidth, Low.getType())
                    NewOp = RoseBVExtractSliceOp.create(Context.genName(ExtractOp.getName() + ".new"),
                                                        ExtractOp.getInputBitVector(), Low, NewHigh, TruncBitwidthVal)
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
            High = RoseConstant.create(
                TruncBitwidth - 1, Op.getOperand(1).getType())
            Low = RoseConstant.create(0, Op.getOperand(1).getType())
            TruncBitwidthVal = RoseConstant(
                TruncBitwidth, Op.getOperand(1).getType())
            NewOp = RoseBVExtractSliceOp.create(Context.genName(Op.getName() + ".new"),
                                                Op.getInputBitVector(), Low, High, TruncBitwidthVal)
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
            if FirstExtractOp.getNumUsers() == 1:
                # Replace this first and second instruction with a new extarct op
                FirstExtractBitwidth = FirstExtractOp.getOutputBitwidth()
                SecondExtractBitwidth = SecondExtractOp.getOutputBitwidth()
                assert FirstExtractBitwidth > SecondExtractBitwidth
                FirstLow = FirstExtractOp.getLowIndex()
                SecondLow = SecondExtractOp.getLowIndex()
                SecondHigh = SecondExtractOp.getHighIndex()
                # Compute the new low index
                if isinstance(SecondLow, RoseConstant) and isinstance(FirstLow, RoseConstant):
                    NewLow = RoseConstant.create(
                        FirstLow.getValue() + SecondLow.getValue(), SecondLow.getType())
                else:
                    NewLow = RoseAddOp.create(
                        "new.low.index." + SecondExtractOp.getName(), [FirstLow, SecondLow])
                    # Add this new low index computation to the IR
                    Block.addOperationBefore(NewLow, FirstExtractOp)
                # Compute the new high index
                if isinstance(SecondHigh, RoseConstant) and isinstance(FirstLow, RoseConstant):
                    NewHigh = RoseConstant.create(
                        FirstLow.getValue() + SecondHigh.getValue(), SecondHigh.getType())
                else:
                    NewHigh = RoseAddOp.create(
                        "new.high.index." + SecondExtractOp.getName(), [FirstLow, SecondHigh])
                    # Add this new low index computation to the IR
                    Block.addOperationBefore(NewHigh, FirstExtractOp)
                # Generate the new operation now
                BitwidthVal = RoseConstant(
                    SecondExtractBitwidth, NewHigh.getType())
                NewOp = RoseBVExtractSliceOp.create("new." + FirstExtractOp.getName(),
                                                    FirstExtractOp.getInputBitVector(), NewLow, NewHigh, BitwidthVal)
                # Add this new operation to the block and replace the uses of older op
                Block.addOperationBefore(NewOp, FirstExtractOp)
                SecondExtractOp.replaceUsesWith(NewOp)
                # IMPORTANT: Remove the second extract before removing the first one
                Block.eraseOperation(SecondExtractOp)
                Block.eraseOperation(FirstExtractOp)

    # Let's try and simplify the block again since there maybe things to simplify
    SimplifyOperations(Block)


def RunOpSimplifyOnRegion(Region, Context: RoseContext):
    # Iterate over all the contents of this function
    assert not isinstance(Region, RoseBlock)
    for Abstraction in Region:
        # Run op simplification on a nested function
        if isinstance(Abstraction, RoseFunction):
            RunOpSimplifyOnFunction(Abstraction, Context)
            continue
        # Op simplification only happens on blocks
        if not isinstance(Abstraction, RoseBlock):
            RunOpSimplifyOnRegion(Abstraction, Context)
            continue
        RunOpSimplifyOnBlock(Abstraction, Context)


def RunOpSimplifyOnFunction(Function: RoseFunction, Context: RoseContext):
    print("RUN ON OP SIMPLIFY FUNCTION")
    print("FUNCTION:")
    Function.print()
    # Run op simplification on the given function
    RunOpSimplifyOnRegion(Function, Context)


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
    RunOpSimplifyOnFunction(Function, Context)
    print("\n\n\n\n\n")
    Function.print()
