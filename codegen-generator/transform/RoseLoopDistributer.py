#############################################################
#
# This is the function loop distribution pass for Rose IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *
from RoseUtilities import *


# Loop distrubution is legal if multiple bvinserts in a single block
# are not inserting to contiguous bit slices.
def IsLoopDistrbutionLegal(InsertOps: list):
    if len(InsertOps) < 2:
        return False
    print("IsLoopDistrbutionLegal:")
    print("len(InsertOps):")
    print(len(InsertOps))
    for Index, _ in enumerate(InsertOps[:-1]):
        print("InsertOps[Index]:")
        InsertOps[Index].print()
        print("InsertOps[Index + 1]:")
        InsertOps[Index + 1].print()
        if AreBitSlicesContiguous(InsertOps[Index], InsertOps[Index + 1]):
            return False
    return True


def GetInsertsForLegalLoopDistribution2(InsertOps: list):
    if len(InsertOps) < 2:
        return []
    print("===IsLoopDistrbutionLegal:")
    print("len(InsertOps):")
    print(len(InsertOps))
    RelevantBVInserts = list()
    if len(InsertOps) > 2:
        for Index, _ in enumerate(InsertOps[:-2]):
            print("InsertOps[Index]:")
            InsertOps[Index].print()
            print("InsertOps[Index + 1]:")
            InsertOps[Index + 1].print()
            if not AreBitSlicesContiguous(InsertOps[Index], InsertOps[Index + 1]):
                RelevantBVInserts.append(InsertOps[Index])
    # Last iteration is peeled off
    print("InsertOps[len(InsertOps) - 2]:")
    InsertOps[Index].print()
    print("InsertOps[len(InsertOps) - 1]:")
    InsertOps[Index + 1].print()
    if not AreBitSlicesContiguous(InsertOps[len(InsertOps) - 2], InsertOps[len(InsertOps) - 1]):
        RelevantBVInserts.append(InsertOps[Index])
    print("RelevantBVInserts:")
    print("len(RelevantBVInserts):")
    print(len(RelevantBVInserts))
    return RelevantBVInserts


def GetInsertsForLegalLoopDistribution(InsertOps: list):
    if len(InsertOps) < 2:
        return []
    print("===IsLoopDistrbutionLegal:")
    print("len(InsertOps):")
    print(len(InsertOps))
    RelevantBVInserts = list()
    for Index, _ in enumerate(InsertOps[:-1]):
        print("InsertOps[Index]:")
        InsertOps[Index].print()
        print("InsertOps[Index + 1]:")
        InsertOps[Index + 1].print()
        if not AreBitSlicesContiguous(InsertOps[Index], InsertOps[Index + 1]):
            if len(RelevantBVInserts) > 0 \
                    and RelevantBVInserts[len(RelevantBVInserts) - 1] != InsertOps[Index]:
                RelevantBVInserts.append(InsertOps[Index])
            elif len(RelevantBVInserts) == 0:
                RelevantBVInserts.append(InsertOps[Index])
            RelevantBVInserts.append(InsertOps[Index + 1])
    print("RelevantBVInserts:")
    print("len(RelevantBVInserts):")
    print(len(RelevantBVInserts))
    return RelevantBVInserts


def FixDependencyInBlockExternalToBlock(Block: RoseBlock, Loop: RoseForLoop,
                                        NewLoops: list, Context: RoseContext):
    assert isinstance(Block, RoseBlock)
    assert isinstance(Loop, RoseForLoop)
    BlocksInLoop = Loop.getRegionsOfType(RoseBlock)
    assert Block in BlocksInLoop

    print("FixDependencyInBlockExternalToBlock")
    print("Block:")
    Block.print()
    print("Loop:")
    Loop.print()
    print("len(NewLoops):")
    print(len(NewLoops))

    OpList = list()
    OpList.extend(Block.getOperations())
    while len(OpList) != 0:
        Op = OpList.pop()
        if isinstance(Op, RoseBVInsertSliceOp):
            continue
        print("********Operation:")
        Op.print()
        OperandList = list()
        if isinstance(Op, RoseBVExtractSliceOp):
            OperandList.append(Op.getLowIndex())
            OperandList.append(Op.getHighIndex())
        else:
            OperandList.extend(Op.getOperands())
        for Operand in OperandList:
            if not isinstance(Operand, RoseOperation):
                continue
            ParentBlock = Operand.getParent()
            if ParentBlock == Block:
                continue
            # Make sure that the op is coming from a source outside the loop.
            if ParentBlock in BlocksInLoop:
                continue
            assert not isinstance(Operand, RoseBVInsertSliceOp)
            print("^^^INDEXING OP:")
            Operand.print()
            # Clone the indexing op and replace uses with
            # unique copy.
            NewOp = Operand.clone(Context.genName(Operand.getName() + ".copy"),
                                  ChangeID=True)
            print("ClonedIndexingOp:")
            NewOp.print()
            # If any of the operands are iterators of one of the new loops, replace it
            # with the iterator of the given loop.
            for OperandIndex, CheckOperand in enumerate(NewOp.getOperands()):
                if isinstance(CheckOperand, RoseOperation) \
                        or isinstance(CheckOperand, RoseArgument) \
                        or isinstance(CheckOperand, RoseConstant):
                    continue
                for CheckLoop in NewLoops:
                    print("CheckLoop.getIterator():")
                    CheckLoop.getIterator().print()
                    print("CheckOperand:")
                    CheckOperand.print()
                    if CheckLoop.getIterator() == CheckOperand:
                        NewOp.setOperand(OperandIndex, Loop.getIterator())
                        print("NewOp iterator changed:")
                        NewOp.print()
                        break
            ReplaceUsesWithUniqueCopiesOf(Loop, Operand, NewOp, Context)
            Loop.print()
            OpList.append(NewOp)
    return


def RunLoopDistributerOnBlock(Block: RoseBlock, Context: RoseContext):
    # If the block is not inside a loop, we cannot distrbute the loop.
    if not isinstance(Block.getParent(), RoseForLoop):
        return

    Function = Block.getFunction()
    InsertOps = list()
    for Op in Block:
        if isinstance(Op, RoseBVInsertSliceOp):
            InsertOps.append(Op)

    # if IsLoopDistrbutionLegal(InsertOps) == False:
    #  return
    InsertOps = GetInsertsForLegalLoopDistribution(InsertOps)
    if len(InsertOps) == 0:
        return

    OuterLoop = Block.getParent()
    NewLoops = list()
    for Op in InsertOps:
        ParentBlock = Op.getParent()
        if Op != InsertOps[-1]:
            ParentBlock.splitAt(ParentBlock.getPosOfOperation(Op) + 1)
        Loop = RoseForLoop.create(Context.genName("%" + "iterator"),
                                  OuterLoop.getStartIndex().getValue(),
                                  OuterLoop.getEndIndex().getValue(), OuterLoop.getStep().getValue())
        OperationList = list()
        OperationList.extend(ParentBlock.getOperations())
        for Operation in OperationList:
            # Replace the uses of the iterator of the outerloop with the
            # iterator of the newly generated loop.
            if Operation.usesValue(OuterLoop.getIterator()):
                Operation.replaceUsesWith(
                    OuterLoop.getIterator(), Loop.getIterator())
            ParentBlock.removeOperation(Operation)
            Loop.addAbstraction(Operation)
        ParentKey = OuterLoop.getKeyForChild(ParentBlock)
        Index = OuterLoop.getPosOfChild(ParentBlock, ParentKey)
        OuterLoop.addRegionBefore(Index, Loop, ParentKey)
        OuterLoop.eraseChild(ParentBlock, ParentKey)
        print("NEW LOOP PARENT;")
        Loop.getParent().print()
        # Fix any dependency between the distributed loops
        BlockList = Loop.getRegionsOfType(RoseBlock)
        for Block in BlockList:
            FixDependencyInBlockExternalToBlock(Block, Loop, NewLoops, Context)
        NewLoops.append(Loop)

    # Remove the outer loop
    ParentRegion = OuterLoop.getParent()
    ParentKey = ParentRegion.getKeyForChild(OuterLoop)
    for Region in OuterLoop:
        Index = ParentRegion.getPosOfChild(OuterLoop, ParentKey)
        print("--INDEX:")
        print(Index)
        print("REGION:")
        Region.print()
        ParentRegion.addRegionBefore(Index, Region.clone(), ParentKey)
    ParentRegion.eraseChild(OuterLoop, ParentKey)
    print("FUNCTION++++:")
    Function.print()


def RunLoopDistributerOnFunction(Function: RoseFunction, Context: RoseContext):
    print("RUN LOOP DISTRIBUTER ON FUNCTION")
    print("FUNCTION:")
    Function.print()
    BlockList = list()
    BlockList.extend(Function.getRegionsOfType(RoseBlock))
    for Block in BlockList:
        RunLoopDistributerOnBlock(Block, Context)
    print("NEW FUNCTION:")
    Function.print()


# Runs loop distribution pass
def Run(Function: RoseFunction, Context: RoseContext):
    print("RUN LOOP DISTRIBUTER")
    RunLoopDistributerOnFunction(Function, Context)
    Function.print()
