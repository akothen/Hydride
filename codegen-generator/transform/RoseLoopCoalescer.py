#############################################################
#
# This is the function loop coalescing pass for Rose IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *
from RoseUtilities import *


# This is necessary to ensure that 2 packs are rerollable.
def DFGsAreIsomorphic(Pack1: list, Pack2: list, Context: RoseContext, ValueToValueMap: dict,
                      Strict=True):
    print("PACK1:")
    for Op in Pack1:
        Op.print()
    print("PACK2:")
    for Op in Pack2:
        Op.print()
    # print("DATAFLOW PATTERNS ARE SAME")
    if len(Pack1) != len(Pack2):
        return False
        # return False
    # Reverse iterate the packs
    OpsList1 = [Pack1[len(Pack1) - 1]]
    OpsList2 = [Pack2[len(Pack2) - 1]]
    Visited = set()
    while len(OpsList1) != 0:
        # print("OpsList1:")
        # print(OpsList1)
        # print("OpsList2:")
        # print(OpsList2)
        assert len(OpsList1) == len(OpsList2)
        Op1 = OpsList1.pop()
        Op2 = OpsList2.pop()
        print("----OP1:")
        Op1.print()
        print("----OP2:")
        Op2.print()
        # Skip constants
        if isinstance(Op1, RoseConstant) \
                and isinstance(Op2, RoseConstant):
            if Strict == True:
                if Op1 != Op2:
                    return False
            continue
        if not isinstance(Op1, RoseOperation):
            if isinstance(Op2, RoseOperation):
                return False
            if Op1 != Op2:
                if Op1 in ValueToValueMap:
                    if ValueToValueMap[Op1] != Op2:
                        return False
                elif Op2 in ValueToValueMap:
                    if ValueToValueMap[Op2] != Op1:
                        return False
                else:
                    return False
            continue
        if not isinstance(Op2, RoseOperation):
            if isinstance(Op1, RoseOperation):
                return False
            if Op1 != Op2:
                if Op1 in ValueToValueMap:
                    if ValueToValueMap[Op1] != Op2:
                        return False
                elif Op2 in ValueToValueMap:
                    if ValueToValueMap[Op2] != Op1:
                        return False
                else:
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
    print("DFGs ARE ISOMORPHIC--")
    return True


def AreLoopsCoalescable(Loop1: RoseForLoop, Loop2: RoseForLoop, Context: RoseContext):
    # The loop bounds and step must be constants
    assert isinstance(Loop1.getStartIndex(), RoseConstant) \
        and isinstance(Loop1.getEndIndex(), RoseConstant) \
        and isinstance(Loop1.getStep(), RoseConstant)
    assert isinstance(Loop2.getStartIndex(), RoseConstant) \
        and isinstance(Loop2.getEndIndex(), RoseConstant) \
        and isinstance(Loop2.getStep(), RoseConstant)
    BlockList1 = Loop1.getRegionsOfType(RoseBlock, 0)
    BlockList2 = Loop2.getRegionsOfType(RoseBlock, 0)
    assert Loop1.getNumChildren() == 1 and Loop2.getNumChildren() == 1
    assert len(BlockList1) == 1 and len(BlockList2) == 1
    Pack1 = list()
    Pack1.extend(BlockList1[0].getOperations())
    Pack2 = list()
    Pack2.extend(BlockList2[0].getOperations())
    # We only handle cases where the loop bodies of given loops must be strictly isomorphic.
    # TODO: Improve this to handle more cases
    #
    # Also map loop1's iterator to loop2's
    ValueToValueMap = dict()
    ValueToValueMap[Loop1.getIterator()] = Loop2.getIterator()
    ValueToValueMap[Loop2.getIterator()] = Loop1.getIterator()
    if DFGsAreIsomorphic(Pack1, Pack2, Context, ValueToValueMap, True) == False:
        return False
    # The end of the first loop must be the beginning of of second loop, and the steps
    # for both loops must be the same.
    if Loop1.getEndIndex() != Loop2.getStartIndex() or Loop1.getStep() != Loop2.getStep():
        return False
    print("LOOPS ARE COALESCABLE")
    return True


def CoalesceLoops(LoopList: list, Context: RoseContext):
    LoopPacks = list()
    LoopPack = list()
    for Index in range(len(LoopList) - 1):
        print("ITERATING LOOPS LIST COALESCE")
        Loop1 = LoopList[Index]
        Loop2 = LoopList[Index + 1]
        # The loop bounds and step must be constants
        if isinstance(Loop1.getStartIndex(), RoseConstant) \
                and isinstance(Loop1.getEndIndex(), RoseConstant) \
                and isinstance(Loop1.getStep(), RoseConstant) \
                and isinstance(Loop2.getStartIndex(), RoseConstant) \
                and isinstance(Loop2.getEndIndex(), RoseConstant) \
                and isinstance(Loop2.getStep(), RoseConstant):
            if len(LoopPack) > 1:
                LoopPacks.append(LoopPack)
            LoopPack = list()
        # These Loops can only contain single blocks as loop bodies.
        if Loop1.getNumChildren() != 1 or Loop2.getNumChildren() != 1:
            if len(LoopPack) > 1:
                LoopPacks.append(LoopPack)
            LoopPack = list()
        BlockList1 = Loop1.getRegionsOfType(RoseBlock, 0)
        BlockList2 = Loop2.getRegionsOfType(RoseBlock, 0)
        if len(BlockList1) != 1 or len(BlockList2) != 1:
            if len(LoopPack) > 1:
                LoopPacks.append(LoopPack)
            LoopPack = list()
        if AreLoopsCoalescable(Loop1, Loop2, Context) == True:
            # Add loops to the loop packs
            if len(LoopPack) > 0 and LoopPack[-1] != Loop1:
                LoopPack.append(Loop1)
            elif len(LoopPack) == 0:
                LoopPack.append(Loop1)
            LoopPack.append(Loop2)
            print("+++len(LoopPack):")
            print(len(LoopPack))
        else:
            print("---LOOP PACK")
            print("len(LoopPack):")
            print(len(LoopPack))
            if len(LoopPack) > 1:
                LoopPacks.append(LoopPack)
            LoopPack = list()
    # If the loop pack has not been added to a list of packs,
    # this is a good time to add it.
    print(len(LoopPack))
    if len(LoopPack) > 1:
        LoopPacks.append(LoopPack)
    # Coalesce loops in the loop packs
    print("len(LoopPacks):")
    print(len(LoopPacks))
    for LoopsPack in LoopPacks:
        print("LOOP PACK")
        # Modify the end  index of the first loop of the loops pack with
        # the end index of the last loop in the pack.
        LoopsPack[0].setEndIndex(LoopsPack[-1].getEndIndex().getValue())
        # Remove all loops in the pack except the first one
        for Loop in LoopsPack[1:]:
            Parent = Loop.getParent()
            Key = Parent.getKeyForChild(Loop)
            Parent.eraseChild(Loop, Key)
    return


def RunLoopCoalescerOnFunction(Region: RoseRegion, Context: RoseContext):
    # Iterate over all the contents of this region
    LoopList = list()
    ChildrenList = list()
    ChildrenList.extend(Region.getChildren())
    for Abstraction in ChildrenList:
        if isinstance(Abstraction, RoseFunction):
            RunLoopCoalescerOnFunction(Abstraction, Context)
            continue
        if isinstance(Abstraction, RoseForLoop):
            # Loop must have only one block in the loop body and no nested region
            if Abstraction.getNumChildren() == 1:
                BlockList = Abstraction.getRegionsOfType(RoseBlock, 0)
                if len(BlockList) == 1:
                    LoopList.append(Abstraction)
                    continue
        if len(LoopList) > 1:
            CoalesceLoops(LoopList, Context)
            continue
        LoopList = list()


# Runs loop coalesce pass
def Run(Function: RoseFunction, Context: RoseContext):
    print("RUN LOOP COALESCER")
    RunLoopCoalescerOnFunction(Function, Context)
    Function.print()
