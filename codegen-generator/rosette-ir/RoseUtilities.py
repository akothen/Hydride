###################################################################
#
# Some utility functions that could be useful for transformations
# and lowering/translation passes.
#
###################################################################


from sympy import symbols, simplify, Integer
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


def ComputeBitSliceWidth(Low: RoseValue, High: RoseValue, TotalBitwidth: int = None) -> int:
    # Strip any casts and size extensions away
    if isinstance(Low, RoseCastOp) \
            or isinstance(Low, RoseBVSignExtendOp) \
            or isinstance(Low, RoseBVZeroExtendOp):
        Low = Low.getOperand(0)
    if isinstance(High, RoseCastOp) \
            or isinstance(High, RoseBVSignExtendOp) \
            or isinstance(High, RoseBVZeroExtendOp):
        High = High.getOperand(0)

    # Handle easiest case first
    if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
        if TotalBitwidth != None:
            assert Low.getValue() >= 0 and Low.getValue() < TotalBitwidth
            assert High.getValue() >= 0 and High.getValue() < TotalBitwidth
        assert High.getValue() >= Low.getValue()
        return (High.getValue() - Low.getValue() + 1)

    # Either both high and low are constants or both are variables/operations.
    # Other cases are not taken into account.
    assert not isinstance(Low, RoseConstant)
    assert not isinstance(High, RoseConstant)

    # Just handle one _very_ common case where high = i + some_constant
    # Strip away any cast first
    assert isinstance(High, RoseAddOp)
    if isinstance(High.getOperand(0), RoseConstant):
        HighIndexValue = High.getOperand(1)
        ConstantHighIndex = High.getOperand(0)
    else:
        assert isinstance(High.getOperand(1), RoseConstant)
        HighIndexValue = High.getOperand(0)
        ConstantHighIndex = High.getOperand(1)
    # Strip any casts away
    if isinstance(HighIndexValue, RoseCastOp) \
            or isinstance(HighIndexValue, RoseBVSignExtendOp) \
            or isinstance(HighIndexValue, RoseBVZeroExtendOp):
        HighIndexValue = HighIndexValue.getOperand(0)
    # High index is expressed in terms of low index
    # TODO: Make this more general.
    print("HighIndexValue:")
    HighIndexValue.print()
    HighIndexValue.getType().print()
    print("Low:")
    Low.print()
    Low.getType().print()

    # Just handle one _very_ common case where low = i
    assert isinstance(HighIndexValue, RoseOperation)
    assert isinstance(Low, RoseOperation)
    if Low.isSameAs(HighIndexValue):
        return (ConstantHighIndex.getValue() + 1)

    # Now handle a rare case where low = i + some_constant
    assert isinstance(Low, RoseAddOp)
    if isinstance(Low.getOperand(0), RoseConstant):
        LowIndexValue = Low.getOperand(1)
        ConstantLowIndex = Low.getOperand(0)
    else:
        assert isinstance(Low.getOperand(1), RoseConstant)
        LowIndexValue = Low.getOperand(0)
        ConstantLowIndex = Low.getOperand(1)
    # Strip any casts away
    if isinstance(LowIndexValue, RoseCastOp) \
            or isinstance(LowIndexValue, RoseBVSignExtendOp) \
            or isinstance(LowIndexValue, RoseBVZeroExtendOp):
        LowIndexValue = LowIndexValue.getOperand(0)
    assert LowIndexValue.isSameAs(HighIndexValue)
    assert ConstantHighIndex.getValue() >= ConstantLowIndex.getValue()
    return (ConstantHighIndex.getValue() - ConstantLowIndex.getValue() + 1)


# Assumption here is that BVOp1 accesses lower indices than BVOp2
def AreBitSlicesContiguous(BVOp1: RoseBitVectorOp, BVOp2: RoseBitVectorOp) -> bool:
    print("CHECK IF BIT SLICES ARE CONTIGUOUS")
    # Some sanity checks
    assert isinstance(BVOp1, RoseBVInsertSliceOp) or isinstance(
        BVOp1, RoseBVExtractSliceOp)
    assert isinstance(BVOp2, RoseBVInsertSliceOp) or isinstance(
        BVOp2, RoseBVExtractSliceOp)
    # assert BVOp1.getOutputBitwidth() == BVOp2.getOutputBitwidth()
    print("BVOp1:")
    BVOp1.print()
    print("BVOp2:")
    BVOp2.print()
    Low1 = BVOp1.getLowIndex()
    Low2 = BVOp2.getLowIndex()
    # Expected difference between the low indices of the bitvectos
    Bitwidth = BVOp1.getOutputBitwidth()

    # Function used to strip off casts, and sign and zero extensions
    def StripCastsAndSizeExtension(X: RoseOperation):
        if isinstance(X, RoseCastOp) \
                or isinstance(X, RoseBVSignExtendOp) \
                or isinstance(X, RoseBVZeroExtendOp):
            return X.getOperand(0)
        return X

    # Strip any casts and size extensions away
    Low1 = StripCastsAndSizeExtension(Low1)
    Low2 = StripCastsAndSizeExtension(Low2)
    print("LOW1:")
    Low1.print()
    print("LOW2:")
    Low2.print()

    if RoseConstantFolder(RoseSubOp.create("_owo", [Low2, Low1])) == Bitwidth:
        return True
    # Handle easiest case first
    if isinstance(Low1, RoseConstant) and isinstance(Low2, RoseConstant):
        if (Low2.getValue() - Low1.getValue()) == Bitwidth:
            return True
        return False

    # Either both low indices are constants or both are variables/operations.
    # Other cases are not taken into account.
    assert not isinstance(Low1, RoseConstant)
    assert not isinstance(Low2, RoseConstant)

    if isinstance(Low2.getOperand(0), RoseConstant) \
            or isinstance(Low2.getOperand(1), RoseConstant):
        # Just handle one _very_ common case where low2 = i + some_constant
        # Strip away any cast first
        # assert isinstance(Low2, RoseAddOp)
        if not isinstance(Low2, RoseAddOp):
            return False
        print("LOW1:")
        Low1.print()
        print("LOW2:")
        Low2.print()
        if isinstance(Low2.getOperand(0), RoseConstant):
            Low2IndexValue = Low2.getOperand(1)
            ConstantLow2Index = Low2.getOperand(0)
        else:
            assert isinstance(Low2.getOperand(1), RoseConstant)
            Low2IndexValue = Low2.getOperand(0)
            ConstantLow2Index = Low2.getOperand(1)
        # Strip any casts away
        Low2IndexValue = StripCastsAndSizeExtension(Low2IndexValue)
        # High index is expressed in terms of low index
        # TODO: Make this more general.
        print("Low2IndexValue:")
        Low2IndexValue.print()
        Low2IndexValue.getType().print()
        print("Low1:")
        Low1.print()
        Low1.getType().print()

        # Just handle one _very_ common case where low1 = i
        if isinstance(Low2IndexValue, RoseOperation) and isinstance(Low1, RoseOperation):
            if Low1.isSameAs(Low2IndexValue):
                if ConstantLow2Index.getValue() == Bitwidth:
                    return True
                return False
            # Now handle a rare case where low1 = i + some_constant
            # assert isinstance(Low1, RoseAddOp)
            if not isinstance(Low1, RoseAddOp):
                return False
            if isinstance(Low1.getOperand(0), RoseConstant):
                Low1IndexValue = Low1.getOperand(1)
                ConstantLow1Index = Low1.getOperand(0)
            else:
                assert isinstance(Low1.getOperand(1), RoseConstant)
                Low1IndexValue = Low1.getOperand(0)
                ConstantLow1Index = Low1.getOperand(1)
            # Strip any casts away
            Low1IndexValue = StripCastsAndSizeExtension(Low1IndexValue)
            assert Low1IndexValue.isSameAs(Low2IndexValue)
            assert ConstantLow2Index.getValue() >= ConstantLow1Index.getValue()
            if (ConstantLow2Index.getValue() - ConstantLow1Index.getValue()) == Bitwidth:
                return True
            return False

        # Check if Low2IndexValue and low1 are equal
        if Low1 == Low2IndexValue and ConstantLow2Index.getValue() == Bitwidth:
            return True
        return False

    # Now trace back to see if the operations in both cases match
    FullTrace1 = list()
    FullTrace2 = list()
    OpTrace1 = [Low1]
    OpTrace2 = [Low2]
    while len(OpTrace1) != 0 and len(OpTrace2) != 0:
        assert len(OpTrace1) == len(OpTrace2)
        Trace1Op = OpTrace1.pop()
        Trace2Op = OpTrace2.pop()
        print("Trace1Op:")
        Trace1Op.print()
        print("Trace2Op:")
        Trace2Op.print()
        FullTrace1.append(Trace1Op)
        FullTrace2.append(Trace2Op)
        if type(Trace1Op) != type(Trace2Op):
            print("false5")
            return False
        # The types of the operands of these ops must be the same too
        assert Trace1Op.getOpcode().typesOfInputsAndOutputEqual() \
            or Trace1Op.getOpcode().typesOfOperandsAreEqual()
        assert Trace2Op.getOpcode().typesOfInputsAndOutputEqual() \
            or Trace2Op.getOpcode().typesOfOperandsAreEqual()
        assert len(Trace1Op.getOperands()) == 2
        assert len(Trace2Op.getOperands()) == 2
        if type(Trace1Op.getOperand(0)) != type(Trace2Op.getOperand(0)):
            # Try again
            if type(Trace1Op.getOperand(0)) != type(Trace2Op.getOperand(1)):
                print("false4")
                return False
            if type(Trace1Op.getOperand(1)) != type(Trace2Op.getOperand(2)):
                print("false3")
                return False
            if isinstance(Trace1Op.getOperand(0), RoseOperation):
                assert isinstance(Trace2Op.getOperand(1), RoseOperation)
                OpTrace1.append(Trace1Op.getOperand(0))
                OpTrace2.append(Trace2Op.getOperand(1))
            if isinstance(Trace1Op.getOperand(1), RoseOperation):
                assert isinstance(Trace2Op.getOperand(0), RoseOperation)
                OpTrace1.append(Trace1Op.getOperand(1))
                OpTrace2.append(Trace2Op.getOperand(0))
        else:
            if type(Trace1Op.getOperand(1)) != type(Trace2Op.getOperand(1)):
                print("false2")
                return False
            if isinstance(Trace1Op.getOperand(0), RoseOperation):
                assert isinstance(Trace2Op.getOperand(0), RoseOperation)
                OpTrace1.append(Trace1Op.getOperand(0))
                OpTrace2.append(Trace2Op.getOperand(0))
            if isinstance(Trace1Op.getOperand(1), RoseOperation):
                assert isinstance(Trace2Op.getOperand(1), RoseOperation)
                OpTrace1.append(Trace1Op.getOperand(1))
                OpTrace2.append(Trace2Op.getOperand(1))
        # Now check if these operationns are same as each other
        if Trace1Op.isSameAs(Trace2Op):
            # These ops must have one use in add op.
            AptUserFound = False
            for User in Trace1Op.getUsers():
                if isinstance(User, RoseAddOp):
                    if User in FullTrace1:
                        AptUserFound = True
                        break
            if AptUserFound == False:
                continue
            AptUserFound = False
            for User in Trace2Op.getUsers():
                if isinstance(User, RoseAddOp):
                    if User in FullTrace2:
                        AptUserFound = True
                        break
            if AptUserFound == False:
                continue
        # Now see if, after simplifying these ops, we get
        # a difference of values that is equivalent to the
        # bitwidth of the operation(s) for which these ops
        # serve as indexing ops.
        ClonedTrace1Op = Trace1Op.cloneOperation()
        ClonedTrace2Op = Trace2Op.cloneOperation()
        SimplifiedClonedTrace1Op = ClonedTrace1Op.simplify()
        SimplifiedClonedTrace2Op = ClonedTrace2Op.simplify()
        print("ClonedTrace1Op:")
        ClonedTrace1Op.print()
        print("SimplifiedClonedTrace1Op:")
        SimplifiedClonedTrace1Op.print()
        print("ClonedTrace2Op:")
        ClonedTrace2Op.print()
        print("SimplifiedClonedTrace2Op:")
        SimplifiedClonedTrace2Op.print()
        if isinstance(SimplifiedClonedTrace1Op, RoseConstant) \
                and isinstance(SimplifiedClonedTrace2Op, RoseConstant):
            if SimplifiedClonedTrace1Op.getValue() > SimplifiedClonedTrace2Op.getValue():
                if SimplifiedClonedTrace1Op.getValue() \
                        - SimplifiedClonedTrace2Op.getValue() == BVOp2.getOutputBitwidth():
                    print("CONTIGUOUS!!!!")
                    return True
            if SimplifiedClonedTrace1Op.getValue() < SimplifiedClonedTrace2Op.getValue():
                if SimplifiedClonedTrace2Op.getValue() \
                        - SimplifiedClonedTrace1Op.getValue() == BVOp2.getOutputBitwidth():
                    print("CONTIGUOUS!!!!")
                    return True
            print("false1")
            return False
    print("false0")
    return False


def DoBitSlicesOverlap(BVOp1: RoseBitVectorOp, BVOp2: RoseBitVectorOp):
    # Some sanity checks
    assert isinstance(BVOp1, RoseBVInsertSliceOp) or isinstance(
        BVOp1, RoseBVExtractSliceOp)
    assert isinstance(BVOp2, RoseBVInsertSliceOp) or isinstance(
        BVOp2, RoseBVExtractSliceOp)
    print("BVOp1:")
    BVOp1.print()
    print("BVOp2:")
    BVOp2.print()
    assert BVOp1.getInputBitVector() == BVOp2.getInputBitVector()
    assert isinstance(BVOp1.getLowIndex(), RoseConstant) \
        and isinstance(BVOp1.getHighIndex(), RoseConstant)
    assert isinstance(BVOp2.getLowIndex(), RoseConstant) \
        and isinstance(BVOp2.getHighIndex(), RoseConstant)
    if BVOp1.getLowIndex().getValue() > BVOp2.getHighIndex().getValue():
        return False
    if BVOp1.getHighIndex().getValue() < BVOp2.getLowIndex().getValue():
        return False
    return True


def GetInvariantsInBlock(Block: RoseBlock, Invariants=dict()):
    assert not isinstance(Block, RoseUndefRegion)
    # Iterate over the block in reverse order and see
    # if indexing operations are iterator independent.
    IndexingOp = set()
    for Op in reversed(Block.getOperations()):
        # Skip call and cast ops
        if isinstance(Op, RoseCallOp) or isinstance(Op, RoseCastOp):
            continue
        # Sign extending ops are considered to contain invariants
        if Op.isSizeChangingOp():
            assert isinstance(Op, RoseBitVectorOp)
            # Since this op is an indexing op, we can safely ignore it
            if Op in IndexingOp:
                IndexingOp.add(Op.getInputBitVector())
                continue
            # This op can be an invariant if it is not
            # directly used in a bvinsert op.
            Invariants[Op] = [Op.getOperand(1)]
            continue
        if isinstance(Op, RoseBitVectorOp) and Op.isIndexingBVOp():
            IndexingOp.add(Op)
            Low = Op.getLowIndex()
            High = Op.getHighIndex()
            if isinstance(Low, RoseConstant):
                Invariants[Op] = [Op.getLowIndexPos()]
            else:
                IndexingOp.add(Low)
            if isinstance(High, RoseConstant):
                if Invariants.get(Op, []) == []:
                    Invariants[Op] = [Op.getHighIndexPos()]
                else:
                    Invariants[Op].append(Op.getHighIndexPos())
            else:
                IndexingOp.add(High)
            continue
        if Op in IndexingOp:
            for Operand in Op.getOperands():
                if isinstance(Operand, RoseConstant):
                    continue
                IndexingOp.add(Operand)
            continue
        for OperandIndex, Operand in enumerate(Op.getOperands()):
            if isinstance(Operand, RoseConstant):
                if Invariants.get(Op, []) == []:
                    Invariants[Op] = [OperandIndex]
                else:
                    Invariants[Op].append(OperandIndex)
    return Invariants


def GetInvariantsInRegion(Abstraction, Invariants=dict()):
    assert not isinstance(Abstraction, RoseUndefRegion)
    if isinstance(Abstraction, RoseBlock):
        return GetInvariantsInBlock(Abstraction, Invariants)
    # Now iterate over all regions and extract all the invariants
    for Region in Abstraction:
        if isinstance(Region, RoseForLoop) \
                or isinstance(Region, RoseFunction):
            Invariants = GetInvariantsInRegion(Region, Invariants)
            continue
        if isinstance(Region, RoseBlock):
            GetInvariantsInBlock(Region, Invariants)
    return Invariants


def FuseAdjacentBlocks(Region, RegionAndKeyToBlock: dict = dict()):
    assert not isinstance(Region, RoseUndefRegion)
    assert not isinstance(Region, RoseBlock)
    # Now just go over the function and fuse adjacent blocks
    if Region.getKeys() is not None:
        for Key in Region.getKeys():
            ChildrenList = list()
            ChildrenList.extend(Region.getChildren(Key))
            for Abstraction in ChildrenList:
                if isinstance(Abstraction, RoseBlock):
                    if (Region, Key) not in RegionAndKeyToBlock:
                        RegionAndKeyToBlock[(Region, Key)] = Abstraction
                        continue
                    # Fuse this block with the currently tracked block
                    OperationList = list()
                    OperationList.extend(Abstraction.getOperations())
                    for Operation in OperationList:
                        Abstraction.removeOperation(Operation)
                        RegionAndKeyToBlock[(Region, Key)
                                            ].addOperation(Operation)
                    # Delete this block
                    # ParentRegion = Abstraction.getParent()
                    Region.eraseChild(Abstraction, Key)
                    continue
                # Deal with other types of subregions
                if (Region, Key) in RegionAndKeyToBlock:
                    RegionAndKeyToBlock.pop((Region, Key))
                FuseAdjacentBlocks(Abstraction, RegionAndKeyToBlock)
    else:
        ChildrenList = list()
        ChildrenList.extend(Region.getChildren())
        for Abstraction in ChildrenList:
            if isinstance(Abstraction, RoseBlock):
                if (Region, None) not in RegionAndKeyToBlock:
                    RegionAndKeyToBlock[(Region, None)] = Abstraction
                    continue
                # Fuse this block with the currently tracked block
                OperationList = list()
                OperationList.extend(Abstraction.getOperations())
                for Operation in OperationList:
                    Abstraction.removeOperation(Operation)
                    RegionAndKeyToBlock[(Region, None)].addOperation(Operation)
                # Delete this block
                # ParentRegion = Abstraction.getParent()
                Region.eraseChild(Abstraction)
                continue
            # Deal with other types of subregions
            if (Region, None) in RegionAndKeyToBlock:
                RegionAndKeyToBlock.pop((Region, None))
            FuseAdjacentBlocks(Abstraction, RegionAndKeyToBlock)


def CloneAndInsertOperation(Operation: RoseOperation, InsertBefore: RoseOperation,
                            Context: RoseContext, OrginalValToClonedValMap: dict = dict()):
    # Both operation and insertion point must be in the same block
    assert Operation.getParent() == InsertBefore.getParent()

    # If the insertion point and operation are the same, there is nothing to do
    # if Operation == InsertBefore:
    #  print("HERE1")
    #  return Operation

    # Get the current position of the operation in the block
    ParentBlock = Operation.getParent()
    InsertionPoint = ParentBlock.getPosOfOperation(InsertBefore)

    if InsertionPoint > ParentBlock.getPosOfOperation(Operation):
        return Operation

    # Deal with case: InsertionPoint < ParentBlock.getPosOfOperation(Operation)
    # We need to get operands that are defined before InsertBefore point
    OperandList = list()
    for Operand in Operation.getOperands():
        if not isinstance(Operand, RoseOperation):
            OperandList.append(Operand)
            continue
        if Operand in OrginalValToClonedValMap:
            NewOperand = OrginalValToClonedValMap[Operand]
        else:
            NewOperand = CloneAndInsertOperation(
                Operand, InsertBefore, Context)
            OrginalValToClonedValMap[Operand] = NewOperand
        OperandList.append(NewOperand)

    # Clone and replace the operands in the operation
    ClonedOperation = Operation.clone(
        Context.genName(Operation.getName() + ".clone."))
    ClonedOperation.replaceOperands(OperandList)

    # Insert the op to the IR
    ParentBlock.addOperationBefore(ClonedOperation, InsertBefore)
    OrginalValToClonedValMap[Operation] = ClonedOperation

    return ClonedOperation


# Replaces the uses of an operation in the given region with a new clone of the
# operation in each block. This is optimization-friendly.
# The new abstraction must be an operation.
def ReplaceUsesWithUniqueCopiesOf(Region, Abstraction: RoseValue, NewAbstraction: RoseOperation,
                                  Context: RoseContext):
    assert not isinstance(Abstraction, RoseUndefValue) \
        and not isinstance(Abstraction, RoseConstant) \
        and not isinstance(Abstraction, RoseFunction)
    assert isinstance(Abstraction, RoseValue)
    assert isinstance(NewAbstraction, RoseOperation)
    assert Abstraction.getType() == NewAbstraction.getType()
    NewOpToInsertBeforeMap = dict()
    if Region.getKeys() != None:
        for Key in Region.getKeys():
            for Child in Region.getChildren(Key):
                assert Region.isChildValid(Child)
                if isinstance(Child, RoseOperation):
                    assert isinstance(Region, RoseBlock)
                    if Child.usesValue(Abstraction):
                        NewName = Context.genName(NewAbstraction.getName() + ".copy.")
                        ClonedNewAbstraction = NewAbstraction.clone(NewName)
                        Child.replaceUsesWith(Abstraction, ClonedNewAbstraction)
                        # Region.addOperationBefore(ClonedNewAbstraction, Child)
                        NewOpToInsertBeforeMap[ClonedNewAbstraction] = Child
                else:
                    ReplaceUsesWithUniqueCopiesOf(Child, Abstraction, NewAbstraction, Context)
    else:
        for Child in Region.getChildren():
            assert Region.isChildValid(Child)
            if isinstance(Child, RoseOperation):
                assert isinstance(Region, RoseBlock)
                if Child.usesValue(Abstraction):
                    NewName = Context.genName(NewAbstraction.getName() + ".copy.")
                    ClonedNewAbstraction = NewAbstraction.clone(NewName)
                    Child.replaceUsesWith(Abstraction, ClonedNewAbstraction)
                    # Region.addOperationBefore(ClonedNewAbstraction, Child)
                    NewOpToInsertBeforeMap[ClonedNewAbstraction] = Child
            else:
                ReplaceUsesWithUniqueCopiesOf(Child, Abstraction, NewAbstraction, Context)
    # Now add the new operations
    print("NewOpToInsertBeforeMap:")
    print(NewOpToInsertBeforeMap)
    for NewOp, InsertBefore in NewOpToInsertBeforeMap.items():
        Region.addOperationBefore(NewOp, InsertBefore)


def GatherIndexingOps(Operation: RoseOperation):
    # Sanity checks
    assert isinstance(Operation, RoseBitVectorOp)
    assert Operation.isIndexingBVOp()
    IndexingOps = list()
    Worklist = list()
    if isinstance(Operation.getLowIndex(), RoseOperation):
        Worklist.append(Operation.getLowIndex())
    if isinstance(Operation.getHighIndex(), RoseOperation):
        Worklist.append(Operation.getHighIndex())
    Visited = set()
    while len(Worklist) != 0:
        IndexingOp = Worklist.pop()
        if IndexingOp in Visited:
            continue
        IndexingOps.append(IndexingOp)
        Visited.add(IndexingOp)
        # We can erase Op, but first get the operands
        for Operand in IndexingOp.getOperands():
            if isinstance(Operand, RoseOperation):
                Worklist.append(Operand)
    IndexingOps.reverse()
    return IndexingOps


def GatherIndexingValues(Operation: RoseOperation):
    print("GatherIndexingValues")
    # Sanity checks
    assert isinstance(Operation, RoseBitVectorOp)
    assert Operation.isIndexingBVOp()
    IndexingValues = list()
    Worklist = [Operation.getLowIndex(), Operation.getHighIndex()]
    Visited = set()
    while len(Worklist) != 0:
        IndexingVal = Worklist.pop()
        print("IndexingVal:")
        IndexingVal.print()
        print(IndexingVal.ID)
        if IndexingVal in Visited:
            print("INDEXING VAL IN VISITED")
            continue
        print("INDEXING VAL NOT IN VISITED")
        IndexingValues.append(IndexingVal)
        Visited.add(IndexingVal)
        if isinstance(IndexingVal, RoseOperation):
            # We can erase Op, but first get the operands
            for Operand in IndexingVal.getOperands():
                if not isinstance(Operand, RoseConstant):
                    Worklist.append(Operand)
    IndexingValues.reverse()
    return IndexingValues


def HasReductionPattern2(Block: RoseBlock):
    print("DOES BLOCK HAVE REDUCTION PATTERN")
    Block.print()
    Loop = Block.getParentOfType(RoseForLoop)
    if isinstance(Loop, RoseUndefRegion):
        return False
    Op = Block.getOperation(len(Block.getOperations()) - 1)
    if not isinstance(Op, RoseBVInsertSliceOp):
        return False
    if Op.getInputBitVector() != Block.getFunction().getReturnValue():
        return False
    # The low index must be dependent on the outer loop if an outer loop
    # exists.
    ParentLoop = Loop.getParentOfType(RoseForLoop)
    if not isinstance(ParentLoop, RoseUndefRegion):
        if not isinstance(Op.getLowIndex(), RoseConstant):
            if not isinstance(Op.getLowIndex(), RoseArgument):
                if ParentLoop.getIterator() != Op.getLowIndex():
                    return False
    ReductionOp = Op.getInsertValue()
    if not isinstance(ReductionOp, RoseOperation):
        return False
    if ReductionOp.getOpcode().typesOfInputsAndOutputEqual() == False:
        print("TYPES OF INPUT AND OUTPUT ARE NOT EQUAL")
        ReductionOp.print()
        return False
    for Operand in ReductionOp.getOperands():
        if isinstance(Operand, RoseBVExtractSliceOp):
            if Operand.getInputBitVector() == Block.getFunction().getReturnValue():
                print("RETURN TRUE")
                return True
    return False


def HasReductionPattern(Block: RoseBlock):
    print("DOES BLOCK HAVE REDUCTION PATTERN")
    Block.print()
    Loop = Block.getParentOfType(RoseForLoop)
    if isinstance(Loop, RoseUndefRegion):
        return False
    Op = Block.getOperation(len(Block.getOperations()) - 1)
    if not isinstance(Op, RoseBVInsertSliceOp):
        return False
    if Op.getInputBitVector() != Block.getFunction().getReturnValue():
        return False
    # The low index must be dependent on the outer loop if an outer loop
    # exists.
    ParentLoop = Loop.getParentOfType(RoseForLoop)
    if not isinstance(ParentLoop, RoseUndefRegion):
        if not isinstance(Op.getLowIndex(), RoseConstant):
            if not isinstance(Op.getLowIndex(), RoseArgument):
                if ParentLoop.getIterator() != Op.getLowIndex():
                    return False
    ReductionOp = Op.getInsertValue()
    if not isinstance(ReductionOp, RoseOperation):
        return False
    if ReductionOp.getOpcode().typesOfInputsAndOutputEqual() == False \
            and not isinstance(ReductionOp, RoseGeneralSaturableBitVectorOp):
        print("TYPES OF INPUT AND OUTPUT ARE NOT EQUAL")
        ReductionOp.print()
        return False
    for Operand in ReductionOp.getOperands():
        if isinstance(Operand, RoseBVExtractSliceOp):
            if Operand.getInputBitVector() == Block.getFunction().getReturnValue():
                print("RETURN TRUE")
                return True
    return False


def HasReductionPatternInFunction(Function: RoseFunction):
    print("DOES BLOCK HAVE REDUCTION PATTERN")
    RetValUsers = Function.getUsersOf(Function.getReturnValue())
    InsertOp = None
    for User in RetValUsers:
        if isinstance(User, RoseBVInsertSliceOp):
            if (User.getInputBitVector() == Function.getReturnValue()):
                Block = User.getParent()
                Loop = Block.getParentOfType(RoseForLoop)
                if isinstance(Loop, RoseUndefRegion):
                    continue
                InsertOp = User
                break
    if InsertOp == None:
        return False
    Block = InsertOp.getParent()
    Loop = Block.getParentOfType(RoseForLoop)
    assert not isinstance(Loop, RoseUndefRegion)
    # The low index must be dependent on the outer loop if an outer loop
    # exists.
    ParentLoop = Loop.getParentOfType(RoseForLoop)
    if not isinstance(ParentLoop, RoseUndefRegion):
        if not isinstance(InsertOp.getLowIndex(), RoseConstant):
            if not isinstance(InsertOp.getLowIndex(), RoseArgument):
                if ParentLoop.getIterator() != InsertOp.getLowIndex():
                    return False
    ReductionOp = InsertOp.getInsertValue()
    if not isinstance(ReductionOp, RoseOperation):
        return False
    if ReductionOp.getOpcode().typesOfInputsAndOutputEqual() == False \
            and not isinstance(ReductionOp, RoseGeneralSaturableBitVectorOp):
        print("TYPES OF INPUT AND OUTPUT ARE NOT EQUAL")
        ReductionOp.print()
        return False
    for Operand in ReductionOp.getOperands():
        if isinstance(Operand, RoseBVExtractSliceOp):
            if Operand.getInputBitVector() == Function.getReturnValue():
                print("RETURN TRUE")
                return True
    return False


def GetReductionOps(Block: RoseBlock):
    assert HasReductionPattern(Block)
    OpList = list()
    InsertOp = Block.getOperation(len(Block.getOperations()) - 1)
    for Operand in InsertOp.getInsertValue().getOperands():
        if isinstance(Operand, RoseBVExtractSliceOp):
            if Operand.getInputBitVector() == Block.getFunction().getReturnValue():
                for IndexingOp in GatherIndexingOps(Operand):
                    if IndexingOp not in OpList:
                        OpList.append(IndexingOp)
                OpList.append(Operand)
    OpList.append(InsertOp.getInsertValue())
    for IndexingOp in GatherIndexingOps(InsertOp):
        if IndexingOp not in OpList:
            OpList.append(IndexingOp)
    OpList.append(InsertOp)
    return OpList


def IsBlockPreheader(Block: RoseBlock):
    assert isinstance(Block, RoseBlock)
    ParentRegion = Block.getParent()
    assert not isinstance(ParentRegion, RoseUndefRegion)
    Key = ParentRegion.getKeyForChild(Block)
    if ParentRegion.getTailChild(Key) != Block:
        BlockPos = ParentRegion.getPosOfChild(Block, Key)
        NextRegion = ParentRegion.getChild(BlockPos + 1, Key)
        if isinstance(NextRegion, RoseForLoop):
            return True
    return False


def GetAllCrossLaneOpsInFunction(Function: RoseFunction):
    print("GetAllCrossLaneOpsInFunction")
    assert isinstance(Function, RoseFunction)
    OpList = list()
    BlockList = Function.getRegionsOfType(RoseBlock)
    for Block in BlockList:
        for Op in Block:
            if isinstance(Op, RoseBVInsertSliceOp):
                InsertValue = Op.getInsertValue()
                if isinstance(InsertValue, RoseBVExtractSliceOp):
                    if isinstance(InsertValue.getLowIndex(), RoseOperation) \
                            and isinstance(Op.getOperand(Op.getBitwidthPos()), RoseConstant):
                        OpList.append(InsertValue)
    print("+++++OpList:")
    print(OpList)
    return OpList


def GenerateOpWithSameInputsAndOutputType(Name: str, Opcode: RoseOpcode, Operands: list):
    assert Opcode.typesOfInputsAndOutputEqual() == True
    if Opcode == RoseOpcode.bvadd:
        return RoseBVAddOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvsub:
        return RoseBVSubOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvmul:
        return RoseBVMulOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvor:
        return RoseBVOrOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvxor:
        return RoseBVXorOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvand:
        return RoseBVAndOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvshl:
        assert len(Operands) == 2
        return RoseBVShlOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvlshr:
        assert len(Operands) == 2
        return RoseBVLshrOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvashr:
        assert len(Operands) == 2
        return RoseBVAshrOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvsmin:
        return RoseBVSminOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvumin:
        return RoseBVUminOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvsmax:
        return RoseBVSmaxOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvumax:
        return RoseBVUmaxOp.create(Name, Operands)
    if Opcode == RoseOpcode.bvnot:
        assert len(Operands) == 1
        return RoseBVNotOp.create(Name, Operands[0])
    if Opcode == RoseOpcode.bvneg:
        assert len(Operands) == 1
        return RoseBVNegOp.create(Name, Operands[0])
    if Opcode == RoseOpcode.bvadd1:
        assert len(Operands) == 1
        return RoseBVAdd1Op.create(Name, Operands[0])
    if Opcode == RoseOpcode.bvsub1:
        assert len(Operands) == 1
        return RoseBVSub1Op.create(Name, Operands[0])
    if Opcode == RoseOpcode.bvsdiv:
        assert len(Operands) == 2
        return RoseBVSdivOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvudiv:
        assert len(Operands) == 2
        return RoseBVUdivOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvsrem:
        assert len(Operands) == 2
        return RoseBVSremOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvurem:
        assert len(Operands) == 2
        return RoseBVUremOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvsmod:
        assert len(Operands) == 2
        return RoseBVSmodOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvrol:
        assert len(Operands) == 2
        return RoseBVRolOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.bvror:
        assert len(Operands) == 2
        return RoseBVRorOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.boolnot:
        assert len(Operands) == 1
        return RoseNotOp.create(Name, Operands[0])
    if Opcode == RoseOpcode.booland:
        return RoseAndOp.create(Name, Operands)
    if Opcode == RoseOpcode.boolnand:
        return RoseNandOp.create(Name, Operands)
    if Opcode == RoseOpcode.boolor:
        return RoseOrOp.create(Name, Operands)
    if Opcode == RoseOpcode.boolnor:
        return RoseNorOp.create(Name, Operands)
    if Opcode == RoseOpcode.boolxor:
        assert len(Operands) == 2
        return RoseXorOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.add:
        return RoseAddOp.create(Name, Operands)
    if Opcode == RoseOpcode.sub:
        return RoseSubOp.create(Name, Operands)
    if Opcode == RoseOpcode.mul:
        return RoseMulOp.create(Name, Operands)
    if Opcode == RoseOpcode.min:
        return RoseMinOp.create(Name, Operands)
    if Opcode == RoseOpcode.max:
        return RoseMaxOp.create(Name, Operands)
    if Opcode == RoseOpcode.div:
        assert len(Operands) == 2
        return RoseDivOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.rem:
        assert len(Operands) == 2
        return RoseRemOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.mod:
        assert len(Operands) == 2
        return RoseModOp.create(Name, Operands[0], Operands[1])
    if Opcode == RoseOpcode.abs:
        assert len(Operands) == 1
        return RoseAbsOp.create(Name, Operands[0])
    if Opcode == RoseOpcode.ret:
        assert len(Operands) == 1
        return RoseReturnOp.create(Name, Operands[0])

    assert False, "Operation inputs and outputs do not have same type"


def NewSizeExtendOp(Name: str, Opcode: RoseOpcode, Operand: RoseBitVectorOp, NewSize: int):
    assert Opcode.isSizeChangingOp() == True
    if Opcode == RoseOpcode.bvzeroextend:
        return RoseBVZeroExtendOp.create(Name, Operand, NewSize)
    if Opcode == RoseOpcode.bvsignextend:
        return RoseBVSignExtendOp.create(Name, Operand, NewSize)
    if Opcode == RoseOpcode.bvssat:
        return RoseBVSSaturateOp.create(Name, Operand, NewSize)
    if Opcode == RoseOpcode.bvusat:
        return RoseBVUSaturateOp.create(Name, Operand, NewSize)
    if Opcode == RoseOpcode.bvtrunclow:
        return RoseBVTruncateLowOp.create(Name, Operand, NewSize)
    if Opcode == RoseOpcode.bvtrunchigh:
        return RoseBVTruncateHighOp.create(Name, Operand, NewSize)
    assert False, "Operation is not a size extending op"


# This API helps determine if the DFGs in the two given blocks
# are isomorphic.
def DFGsOfBlocksAreIsomorphic(Block1: RoseBlock, Block2: RoseBlock,
                              FixDFGIsomorphism=None, Strict=False):
    Pack1 = list()
    Pack2 = list()
    Pack1.extend(Block1.getOperations())
    Pack2.extend(Block2.getOperations())
    print("PACK1:")
    for Op in Pack1:
        Op.print()
    print("PACK2:")
    for Op in Pack2:
        Op.print()
    # print("DATAFLOW PATTERNS ARE SAME")
    if len(Pack1) != len(Pack2):
        print("LENGHTS OF THE PACKS ARE NOT THE SMAE")
        if FixDFGIsomorphism != None:
            if FixDFGIsomorphism(Pack1, Pack2) == False:
                return None
        else:
            return None

    # Reverse iterate the packs
    OpsList1 = [Pack1[len(Pack1) - 1]]
    OpsList2 = [Pack2[len(Pack2) - 1]]
    Visited = set()
    while len(OpsList1) != 0:
        assert len(OpsList1) == len(OpsList2)
        Op1 = OpsList1.pop()
        Op2 = OpsList2.pop()
        assert not isinstance(Op1, RoseUndefValue)
        assert not isinstance(Op2, RoseUndefValue)
        # Skip constants
        if isinstance(Op1, RoseConstant) \
                and isinstance(Op2, RoseConstant):
            if Op1.getType() != Op2.getType():
                return False
            if Strict == True:
                if Op1.getValue() == Op2.getValue():
                    return False
            continue
        # Skip arguments
        if isinstance(Op1, RoseArgument) \
                and isinstance(Op2, RoseArgument):
            if Op1.getType() != Op2.getType():
                return False
            if Strict == True:
                if Op1 == Op2:
                    return False
            continue
        if not isinstance(Op1, RoseOperation):
            if isinstance(Op2, RoseOperation):
                return False
            if Strict == False:
                # If op1 and op2 are simple values, we can skip
                if isinstance(Op1, RoseValue) \
                        and isinstance(Op2, RoseValue):
                    if Op1.getType() != Op2.getType():
                        return False
                    continue
                continue
            if Op1 != Op2:
                return False
            continue
        if not isinstance(Op2, RoseOperation):
            if isinstance(Op1, RoseOperation):
                return False
            if Strict == False:
                # If op1 and op2 are simple values, we can skip
                if isinstance(Op1, RoseValue) \
                        and isinstance(Op2, RoseValue):
                    if Op1.getType() != Op2.getType():
                        return False
                    continue
            if Op1 != Op2:
                return False
            continue
        if Op1 in Visited:
            if not Op2 in Visited:
                return False
            continue
        if Op2 in Visited:
            if not Op1 in Visited:
                return False
            continue
        Visited.add(Op1)
        Visited.add(Op2)
        print("--OP1:")
        Op1.print()
        print("--OP2:")
        Op2.print()
        # If the operations have different opcodes or types, skip
        if Op1.getOpcode() != Op2.getOpcode():
            return False
        if Op1.getType() != Op2.getType():
            return False
        if len(Op1.getOperands()) != len(Op2.getOperands()):
            return False
        # Deal with call operations
        if isinstance(Op1, RoseCallOp):
            assert isinstance(Op2, RoseCallOp)
            # Make sure that the callees for the operations are equal.
            if Op1.getCallee().getName() != Op2.getCallee().getName():
                return False
            OpsList1.extend(Op1.getCallOperands())
            OpsList2.extend(Op2.getCallOperands())
            continue
        # If this operation has not indexing operands, add None
        if (isinstance(Op1, RoseBVExtractSliceOp) or isinstance(Op1, RoseBVInsertSliceOp)) \
                and Op1.isIndexingBVOp() == True:
            # Output bitwidths for bitvector ops must be equal
            if Op1.getOutputBitwidth() != Op2.getOutputBitwidth():
                return False
            OpsList1.extend(Op1.getBitVectorOperands())
            OpsList1.append(Op1.getLowIndex())
            OpsList1.append(Op1.getHighIndex())
            OpsList2.extend(Op2.getBitVectorOperands())
            OpsList2.append(Op2.getLowIndex())
            OpsList2.append(Op2.getHighIndex())
            continue
        # Consider all other instructions
        OpsList1.extend(Op1.getOperands())
        OpsList2.extend(Op2.getOperands())
    # We are done exploring the DFGs
    print("AFTER PACK1:")
    for Op in Pack1:
        Op.print()
    print("AFTER PACK2:")
    for Op in Pack2:
        Op.print()
    return True


def MapIsomorphicDFGsOfBlocks(KeyBlock: RoseBlock, ValBlock: RoseBlock,
                              FixDFGIsomorphism=None, Strict=False):
    Pack1 = list()
    Pack2 = list()
    Pack1.extend(KeyBlock.getOperations())
    Pack2.extend(ValBlock.getOperations())
    print("PACK1:")
    for Op in Pack1:
        Op.print()
    print("PACK2:")
    for Op in Pack2:
        Op.print()
    # print("DATAFLOW PATTERNS ARE SAME")
    if len(Pack1) != len(Pack2):
        print("LENGHTS OF THE PACKS ARE NOT THE SMAE")
        if FixDFGIsomorphism != None:
            if FixDFGIsomorphism(Pack1, Pack2) == False:
                return None
        else:
            return None

    MapBetweenValues = dict()
    # Reverse iterate the packs
    OpsList1 = [Pack1[len(Pack1) - 1]]
    OpsList2 = [Pack2[len(Pack2) - 1]]
    Visited = set()
    while len(OpsList1) != 0:
        assert len(OpsList1) == len(OpsList2)
        Op1 = OpsList1.pop()
        Op2 = OpsList2.pop()
        print("----OP1:")
        Op1.print()
        print("----OP2:")
        Op2.print()
        assert not isinstance(Op1, RoseUndefValue)
        assert not isinstance(Op2, RoseUndefValue)
        # Skip constants
        if isinstance(Op1, RoseConstant) \
                and isinstance(Op2, RoseConstant):
            if Op1.getType() != Op2.getType():
                return None
            if Strict == True:
                if Op1.getValue() == Op2.getValue():
                    return None
            # Map Op1 and Op2
            MapBetweenValues[Op1] = Op2
            continue
        # Skip arguments
        if isinstance(Op1, RoseArgument) \
                and isinstance(Op2, RoseArgument):
            if Op1.getType() != Op2.getType():
                return None
            if Strict == True:
                if Op1 == Op2:
                    return None
            # Map Op1 and Op2
            MapBetweenValues[Op1] = Op2
            continue
        if not isinstance(Op1, RoseOperation):
            if isinstance(Op2, RoseOperation):
                return None
            if Strict == False:
                # If op1 and op2 are simple values, we can skip
                if isinstance(Op1, RoseValue) \
                        and isinstance(Op2, RoseValue):
                    if Op1.getType() != Op2.getType():
                        return None
                    # Map Op1 and Op2
                    MapBetweenValues[Op1] = Op2
                    continue
            if Op1 != Op2:
                return None
            # Map Op1 and Op2
            MapBetweenValues[Op1] = Op2
            continue
        if not isinstance(Op2, RoseOperation):
            if isinstance(Op1, RoseOperation):
                return None
            if Strict == False:
                # If op1 and op2 are simple values, we can skip
                if isinstance(Op1, RoseValue) \
                        and isinstance(Op2, RoseValue):
                    if Op1.getType() != Op2.getType():
                        return None
                    # Map Op1 and Op2
                    MapBetweenValues[Op1] = Op2
                    continue
            if Op1 != Op2:
                return None
            # Map Op1 and Op2
            MapBetweenValues[Op1] = Op2
            continue
        if Op1 in Visited:
            if not Op2 in Visited:
                return None
            continue
        if Op2 in Visited:
            if not Op1 in Visited:
                return None
            continue
        Visited.add(Op1)
        Visited.add(Op2)
        # Map Op1 and Op2
        MapBetweenValues[Op1] = Op2
        print("--OP1:")
        Op1.print()
        print("--OP2:")
        Op2.print()
        # If the operations have different opcodes or types, skip
        if Op1.getOpcode() != Op2.getOpcode():
            return None
        if Op1.getType() != Op2.getType():
            return None
        if len(Op1.getOperands()) != len(Op2.getOperands()):
            return None
        # Deal with call operations
        if isinstance(Op1, RoseCallOp):
            assert isinstance(Op2, RoseCallOp)
            # Make sure that the callees for the operations are equal.
            if Op1.getCallee().getName() != Op2.getCallee().getName():
                return None
            OpsList1.extend(Op1.getCallOperands())
            OpsList2.extend(Op2.getCallOperands())
            continue
        # If this operation has not indexing operands, add None
        if (isinstance(Op1, RoseBVExtractSliceOp) or isinstance(Op1, RoseBVInsertSliceOp)) \
                and Op1.isIndexingBVOp() == True:
            # Output bitwidths for bitvector ops must be equal
            if Op1.getOutputBitwidth() != Op2.getOutputBitwidth():
                return None
            OpsList1.extend(Op1.getBitVectorOperands())
            OpsList1.append(Op1.getLowIndex())
            OpsList1.append(Op1.getHighIndex())
            OpsList2.extend(Op2.getBitVectorOperands())
            OpsList2.append(Op2.getLowIndex())
            OpsList2.append(Op2.getHighIndex())
            continue
        # Consider all other instructions
        OpsList1.extend(Op1.getOperands())
        OpsList2.extend(Op2.getOperands())

    return MapBetweenValues


def GetElemSizeOfArg(Function: RoseFunction, Arg: RoseArgument):
    # Look for bvextract ops
    BlockList = Function.getRegionsOfType(RoseBlock)
    ElemSize = None
    for Block in BlockList:
        for Op in Block:
            if isinstance(Op, RoseBVExtractSliceOp):
                if Arg == Op.getInputBitVector():
                    ElemSize = Op.getOutputBitwidth()
                    return ElemSize
    assert ElemSize != None


def RoseConstantFolder(Query: RoseBitVectorOp):
    def expr(Query: RoseBitVectorOp):
        if isinstance(Query, RoseConstant):
            return Query.getValue()
        if isinstance(Query, RoseAddOp):
            return expr(Query.getOperand(0)) + expr(Query.getOperand(1))
        if isinstance(Query, RoseSubOp):
            return expr(Query.getOperand(0)) - expr(Query.getOperand(1))
        if isinstance(Query, RoseMulOp):
            return expr(Query.getOperand(0)) * expr(Query.getOperand(1))
        if type(Query) == RoseValue:
            return symbols(Query.getName())
        print("RoseConstantFolder encounter", type(Query))
        assert False, type(Query)
    try:
        E = expr(Query)
        E = simplify(E)
        if E.is_Integer:
            return Integer(E)
        return None
    except:
        return None

