##############################################################
#
# This file contains code for loop reroller transformation.
# It aggressively looks for patterns of code to reroll and
# is also capable of rerolling code multiple times.
#
##############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseUtilities import *
from RoseContext import *
from RoseAliasAnalysis import *

import numpy as np
import math


# Useful for debugging
def PrintPack(Pack: list):
    print("PRINTING PACK:")
    for Op in Pack:
        Op.print()


def GetOffsetsBetweenPacks(Pack1: list, Pack2: list, OffsetsList: list = []):
    # print("GetOffsetsBetweenPacks:")
    # print("PACK1:")
    # for Op in Pack1:
    #  Op.print()
    # print("PACK2:")
    # for Op in Pack2:
    #  Op.print()
    assert len(Pack1) == len(Pack2)
    if OffsetsList == []:
        # OffsetsList = list() * len(Pack1)
        for Index in range(len(Pack1)):
            OffsetsList.append(list())
    for Index in range(len(Pack1)):
        # If the operations have different opcodes or types, skip
        if Pack1[Index].getOpcode() != Pack2[Index].getOpcode():
            return None
        if Pack1[Index].getType() != Pack2[Index].getType():
            return None
        # Deal with call operations
        if isinstance(Pack1[Index], RoseCallOp):
            # Make sure that the callees for the operations are equal.
            if Pack1[Index].getCallee().getName() != Pack2[Index].getCallee().getName():
                return None
            OffsetsList[Index] = None
            continue

        if not isinstance(Pack1[Index], RoseBitVectorOp):
            if len(Pack1[Index].getOperands()) != len(Pack1[Index].getOperands()):
                return None
            NewOffsetsList = []
            for OperandIndex, Operand1 in enumerate(Pack1[Index].getOperands()):
                Operand2 = Pack2[Index].getOperand(OperandIndex)
                if isinstance(Operand1, RoseConstant):
                    if not isinstance(Operand2, RoseConstant):
                        return None
                    NewOffsetsList.append(
                        Operand2.getValue() - Operand1.getValue())
                else:
                    if isinstance(Operand2, RoseConstant):
                        return None
            # Check if the given offsets match the newly computed offsets
            if OffsetsList[Index] == []:
                OffsetsList[Index] = NewOffsetsList
                continue
            if OffsetsList[Index] != NewOffsetsList:
                return None
            continue

        # If this operation has not indexing operands, add None
        if Pack1[Index].isIndexingBVOp() == False:
            OffsetsList[Index] = None
            continue
        # If the bitvector values for the bitvector ops are
        # different, offset compuation is meaningless.
        # print(Pack1[Index].getBitVectorOperands())
        # print(Pack2[Index].getBitVectorOperands())
        if Pack1[Index].getInputBitVector() != Pack2[Index].getInputBitVector():
            return None
        # Output bitwidths for bitvector ops must be equal
        if Pack1[Index].getOutputBitwidth() != Pack2[Index].getOutputBitwidth():
            return None
        # Get offsets between instructions
        LowIndex1 = Pack1[Index].getLowIndex()
        LowIndex2 = Pack2[Index].getLowIndex()
        HighIndex1 = Pack1[Index].getHighIndex()
        HighIndex2 = Pack2[Index].getHighIndex()

        NewOffsetsList = []
        if isinstance(LowIndex1, RoseConstant):
            if not isinstance(LowIndex2, RoseConstant):
                return None
            NewOffsetsList.append(LowIndex2.getValue() - LowIndex1.getValue())
        else:
            if isinstance(LowIndex2, RoseConstant):
                return None
        if isinstance(HighIndex1, RoseConstant):
            if not isinstance(HighIndex2, RoseConstant):
                return None
            NewOffsetsList.append(
                HighIndex2.getValue() - HighIndex1.getValue())
        else:
            if isinstance(HighIndex2, RoseConstant):
                return None

        # Check if the given offsets match the newly computed offsets
        if OffsetsList[Index] == []:
            OffsetsList[Index] = NewOffsetsList
            continue
        if OffsetsList[Index] != NewOffsetsList:
            return None
    # print(OffsetsList)
    return OffsetsList


# It is assumed that code in pack2 is dominated by code in pack1
def ArePacksContiguous(Pack1: list, Pack2: list, Context: RoseContext):
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True
    print("ARE PACKS CONTIGIUOUS:")
    PrintPack(Pack1)
    PrintPack(Pack2)
    # List of bitvectors written to by the given packs
    DestBitvectorsList = list()
    # For the first pack we will be loking for last last bvinsert operation
    # to a bitslice.
    Pack1BVInsertOps = dict()
    for Op in Pack1:
        if isinstance(Op, RoseBVInsertSliceOp):
            Pack1BVInsertOps[Op.getInputBitVector()] = Op
    # For the second pack we will be loking for the first bvinsert operation
    # to a bitslice.
    Pack2BVInsertOps = dict()
    for Op in Pack2:
        if isinstance(Op, RoseBVInsertSliceOp):
            if Op.getInputBitVector() not in Pack2BVInsertOps:
                Pack2BVInsertOps[Op.getInputBitVector()] = Op
                DestBitvectorsList.append(Op.getInputBitVector())
    for DestBitvector in DestBitvectorsList:
        Op1 = Pack1BVInsertOps[DestBitvector]
        Op2 = Pack2BVInsertOps[DestBitvector]
        print("OP1:")
        Op1.print()
        print("OP2:")
        Op2.print()
        # Both of the bvinsert ops must be writing contiguous slices
        if (RoseAliasAnalysis.alias(Op1, Op2) == RoseAliasAnalysis.AnalysisResults.Contiguous
                or RoseAliasAnalysis.alias(Op1, Op2) == RoseAliasAnalysis.AnalysisResults.Unknown):
            continue
        return False
    return True


def GetValidRerollableCandidates(RerollableCandidatePacks: list, Context: RoseContext):
    print("++++++++++++++++++++++++++++++++++++++++++++++++")
    # Collect list of rerollable windows in a set.
    RerollableCandidatesList = list()
    PacksList = list()
    OffsetsList = list()
    for Pack in RerollableCandidatePacks:
        if PacksList == []:
            PacksList = [Pack]
            continue
        # Now lets see if the window should be added to the window list
        CheckPack = PacksList[len(PacksList) - 1]
        # The DFGs for the packs have to be the same
        CheckDFGsAreIsomorphic = DFGsAreIsomorphic(CheckPack, Pack, Context)
        print("CheckDFGsAreIsomorphic:")
        print(CheckDFGsAreIsomorphic)
        if CheckDFGsAreIsomorphic == False:
            # This is the end of the window list.
            # If we didn't capture multiple windows, we must discard the list
            if len(PacksList) != 1:
                # Add the window list to the candidate list
                RerollableCandidatesList.append(PacksList)
            # Empty the list and continue
            PacksList = [Pack]
            continue
        # Make sure that the bvinserts in the two packs are
        # contiguous.
        # ArePacksContiguous(CheckPack, Pack, Context)
        CheckPacksAreContiguous = True
        print("CheckPacksAreContiguous:")
        print(CheckPacksAreContiguous)
        if CheckPacksAreContiguous == False:
            # This is the end of the window list.
            # If we didn't capture multiple windows, we must discard the list
            if len(PacksList) != 1:
                # Add the window list to the candidate list
                RerollableCandidatesList.append(PacksList)
            # Empty the list and continue
            PacksList = [Pack]
            continue
        NewOffsetsList = GetOffsetsBetweenPacks(CheckPack, Pack, OffsetsList)
        if NewOffsetsList == None:
            # This is the end of the window list.
            # If we didn't capture multiple windows, we must discard the list
            if len(PacksList) != 1:
                # Add the window list to the candidate list
                RerollableCandidatesList.append(PacksList)
            # Empty the list and continue
            PacksList = [Pack]
            continue
        # If the offsets list is empty. Fill it up.
        if OffsetsList == []:
            OffsetsList = NewOffsetsList
        assert OffsetsList == NewOffsetsList
        # Add the window to the list
        print("ADD WINDOW TO THE LIST")
        PacksList.append(Pack)
    # Put in the last window list
    if PacksList != []:
        # Now we have a window list we can add to the list
        # But it must end with bvinsert.
        RerollableCandidatesList.append(PacksList)

    # Now filter out all cases where there is only one pack list
    TempRerollableCandidatesList = RerollableCandidatesList
    for PackList in TempRerollableCandidatesList:
        if len(PackList) == 1:
            RerollableCandidatesList.remove(PackList)
            continue
    print("-------RerollableCandidatesList:")
    print(RerollableCandidatesList)

    for Pack in RerollableCandidatePacks:
        print("+++WINDOW:")
        for Op in Pack:
            Op.print()

    for PackList in RerollableCandidatesList:
        print("--WINDOW LIST:")
        for Pack in PackList:
            print("--WINDOW:")
            for Op in Pack:
                Op.print()
    return RerollableCandidatesList


def GetDependenciesBetweenPacks(Pack1: list, Pack2: list):
    # Check if Pack2 is dependent on Pack1
    Dependencies = list()
    for Op2 in Pack2:
        for Operand in Op2.getOperands():
            if not isinstance(Operand, RoseOperation):
                continue
            if isinstance(Operand, RoseBitVectorOp):
                continue
            if Operand in Pack1:
                if Operand not in Dependencies:
                    Dependencies.append(Operand)
    if len(Dependencies) != 0:
        return Dependencies
    return None


def FixDependentPack(Pack: list, Dependencies: list,
                     Context: RoseContext):
    print("FixDependentPack")
    PrintPack(Pack)
    for Op in Dependencies:
        print("DEPENCY:")
        Op.print()
        ClonedOp = Op.clone(NewName=Context.genName(
            Op.getName() + ".cloned"), ChangeID=True)
        print("ClonedOp:")
        ClonedOp.print()
        Users = Op.getUsers()
        ClonedOpNotInserted = False
        for User in Users:
            print("USER:")
            User.print()
            if User not in Pack:
                continue
            if ClonedOpNotInserted == False:
                User.getParent().addOperationBefore(ClonedOp, User)
                ClonedOpNotInserted = True
                # Add cloned op to the second pack
                OpIndex = Pack.index(User)
                Pack.insert(OpIndex, ClonedOp)
            for OperandIdx, Operand in enumerate(User.getOperands()):
                if not isinstance(Operand, RoseOperation):
                    continue
                if isinstance(Operand, RoseBitVectorOp):
                    continue
                if Operand == Op:
                    User.setOperand(OperandIdx, ClonedOp)
        assert ClonedOpNotInserted == True
    return


# Op1 is an add ops and op2 is not.
def FixPack(Op1: RoseOperation, Op2: RoseOperation, Block2: RoseBlock,
            Pack: list, OpsList1: list, OpsList2: list,
            Visited: list, ValueToValueMap: dict, Context: RoseContext):
    print("FIXING PACK")
    print("OP1:")
    Op1.print()
    print("OP2:")
    Op2.print()
    print("Block2:")
    Block2.print()
    print("Pack:")
    PrintPack(Pack)
    # See if adding on Add op before Op2 would do.
    if not isinstance(Op1, RoseAddOp):
        return False
    if len(Op1.getOperands()) != 2:
        return False
    if Op1 in ValueToValueMap:
        print("OP1 IN VALUE TO VALUE MAP")
        Op1Users = Op1.getUsers()
        for Op1User in Op1Users:
            if Op1User in ValueToValueMap:
                for OperandIdx, Operand in enumerate(ValueToValueMap[Op1User].getOperands()):
                    if Operand == Op2:
                        PackIndex = Pack.index(ValueToValueMap[Op1User])
                        ValueToValueMap[Op1User].setOperand(OperandIdx, NewOp2)
                        Pack[PackIndex] = ValueToValueMap[Op1User]
        print("NEW BLOCK?")
        Block2.print()
        return True
    if isinstance(Op1.getOperand(0), RoseConstant) \
            or isinstance(Op1.getOperand(1), RoseConstant):
        print("FIRST CONDITION")
        # return False
        # Generate a new add op
        Zero = RoseConstant(0, Op2.getType())
        NewOp2 = RoseAddOp.create(Context.genName(
            Op2.getName() + ".new"), [Op2, Zero])
        print("NEW ADD OP:")
        NewOp2.print()
        # Replace the uses of Op2 with NewOp2
        # Op2.replaceUsesWith(NewOp2)
        Op1Users = Op1.getUsers()
        for Op1User in Op1Users:
            if Op1User in ValueToValueMap:
                for OperandIdx, Operand in enumerate(ValueToValueMap[Op1User].getOperands()):
                    if Operand == Op2:
                        PackIndex = Pack.index(ValueToValueMap[Op1User])
                        ValueToValueMap[Op1User].setOperand(OperandIdx, NewOp2)
                        Pack[PackIndex] = ValueToValueMap[Op1User]
        # Add the new op to the block
        Block2.addOperationAfter(NewOp2, Op2)
        # Consider all other instructions
        OpsList1.extend(Op1.getOperands())
        OpsList2.extend(NewOp2.getOperands())
        # Extend the pack
        Index = Pack.index(Op2)
        Pack.insert(Index + 1, NewOp2)
        # Fix the visited ops list
        Visited.remove(Op2)
        Visited.add(NewOp2)
        ValueToValueMap[Op1] = NewOp2
        ValueToValueMap[NewOp2] = Op1
        print("NEW BLOCK:")
        Block2.print()
        print("---AFTER PACK:")
        for Op in Pack:
            Op.print()
    else:
        return False
    return True


def AlignPacks(Pack1: list, Pack2: list, ValueToValueMap: dict):
    assert len(Pack1) == len(Pack2)
    for Pack1Op, Pack2Op in ValueToValueMap.items():
        # The value to value maps pack1 op to pack2 op and vice versa.
        # so we only loop for mappings one way.
        if Pack1Op not in Pack1:
            continue
        Pack1Index = Pack1.index(Pack1Op)
        if Pack1Index != Pack2.index(Pack2Op):
            print("FIXING PACK ALIGNMENT")
            print("PACK1:")
            Pack1Op.print()
            print("PACK2:")
            Pack2Op.print()
            # Fix the index of Pack2Op in pack2
            Pack2.remove(Pack2Op)
            Pack2.insert(Pack1Index, Pack2Op)
            # Packs always end with bvinserts, so this is not
            # the last op.
            Block = Pack2[Pack1Index + 1].getParent()
            Block.removeOperation(Pack2Op)
            Block.addOperationBefore(Pack2Op, Pack2[Pack1Index + 1])
    return


def FixDFGIsomorphism(Pack1: list, Pack2: list, Context):
    print("FixDFGIsomorphism")
    assert len(Pack1) != 0 and len(Pack2) != 0
    Block1 = Pack1[0].getParent()
    Block2 = Pack2[0].getParent()

    Dependencies = GetDependenciesBetweenPacks(Pack1, Pack2)
    if Dependencies != None:
        # Fix the pack dependency
        FixDependentPack(Pack2, Dependencies, Context)
        # Check if the DFGs have been made isomorphic
        if DFGsAreIsomorphic(Pack1, Pack2, Context):
            return True
    Dependencies = GetDependenciesBetweenPacks(Pack2, Pack1)
    if Dependencies != None:
        # Fix the pack dependency
        FixDependentPack(Pack1, Dependencies, Context)
        # Check if the DFGs have been made isomorphic
        if DFGsAreIsomorphic(Pack1, Pack2, Context):
            return True

    # We need to see if we can make these two packs isomorphic.
    # First step is to see where the DFG isomorphism is violated
    # and correct it if it has to do with one special case --
    # missing add indexing op (addition to zero).
    def GetNumBVOps(Pack: list):
        NumExtractOps = 0
        NumInsertOps = 0
        NumOtherBVOps = 0
        for Op in Pack:
            if isinstance(Op, RoseBVExtractSliceOp):
                NumExtractOps += 1
            elif isinstance(Op, RoseBVInsertSliceOp):
                NumInsertOps += 1
            elif isinstance(Op, RoseBitVectorOp):
                NumOtherBVOps += 1
        return NumExtractOps, NumInsertOps, NumOtherBVOps

    def GatherIndexingOpsInPack(Pack: list):
        IndexingToBVOpsMap = dict()
        for Op in reversed(Pack):
            if isinstance(Op, RoseBVExtractSliceOp) \
                    or isinstance(Op, RoseBVInsertSliceOp):
                IndexingOps = GatherIndexingOps(Op)
                for IndexingOp in IndexingOps:
                    IndexingToBVOpsMap[IndexingOp] = Op
        return IndexingToBVOpsMap

    # First get number of different number of bv ops
    NumExtractOps1, NumInsertOps1, NumOtherBVOps1 = GetNumBVOps(Pack1)
    NumExtractOps2, NumInsertOps2, NumOtherBVOps2 = GetNumBVOps(Pack2)
    if NumExtractOps1 != NumExtractOps2 \
            or NumInsertOps1 != NumInsertOps2 \
            or NumOtherBVOps1 != NumOtherBVOps2:
        return False

    # Gather all the indexing ops
    IndexingToBVOpsMap1 = GatherIndexingOpsInPack(Pack1)
    IndexingToBVOpsMap2 = GatherIndexingOpsInPack(Pack2)

    # Reverse iterate the packs
    OpsList1 = [Pack1[len(Pack1) - 1]]
    OpsList2 = [Pack2[len(Pack2) - 1]]
    Visited = set()
    ValueToValuePackMap = dict()
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
            continue
        if not isinstance(Op1, RoseOperation):
            if isinstance(Op2, RoseOperation):
                print("TRY FIXING PACK 1")
                # Fix the pack if possible
                if FixPack(Op2, Op1, Block1, Pack1,
                           OpsList2, OpsList1, Visited, ValueToValuePackMap, Context) == True:
                    print("---AFTER PACK1:")
                    for Op in Pack1:
                        Op.print()
                    continue
                return False
            if Op1 != Op2:
                return False
            continue
        if not isinstance(Op2, RoseOperation):
            if isinstance(Op1, RoseOperation):
                print("TRY FIXING PACK 2")
                # Fix the pack if possible
                if FixPack(Op1, Op2, Block2, Pack2,
                           OpsList1, OpsList2, Visited, ValueToValuePackMap, Context) == True:
                    print("---AFTER PACK2:")
                    for Op in Pack2:
                        Op.print()
                    continue
                return False
            if Op1 != Op2:
                return False
            continue
        # if Op1 in Visited:
        #   print("OP1 IN VISITED")
        #   if not Op2 in Visited:
        #     print("OP2 NOT IN VISITED")
        #     if FixPack(Op1, Op2, Block2, Pack2, \
        #               OpsList1, OpsList2, Visited, ValueToValuePackMap, Context) == True:
        #       continue
        #     if FixPack(Op2, Op1, Block2, Pack2, \
        #               OpsList2, OpsList1, Visited, ValueToValuePackMap, Context) == True:
        #       continue
        #     return False
        #   continue
        # if Op2 in Visited:
        #   print("OP2 IN VISITED")
        #   if not Op1 in Visited:
        #     print("OP1 NOT IN VISITED")
        #     if FixPack(Op1, Op2, Block2, Pack2, \
        #               OpsList1, OpsList2, Visited, ValueToValuePackMap, Context) == True:
        #       continue
        #     if FixPack(Op2, Op1, Block2, Pack2, \
        #               OpsList2, OpsList1, Visited, ValueToValuePackMap, Context) == True:
        #       continue
        #     return False
        #   continue
        Visited.add(Op1)
        Visited.add(Op2)
        print("--OP1:")
        Op1.print()
        print("--OP2:")
        Op2.print()
        # If the operations have different opcodes or types, skip
        if Op1.getOpcode() != Op2.getOpcode():
            print("OPCODES ARE NOT THE SAME")
            # Check if one of the ops is an indexing op
            # if Op1 in IndexingToBVOpsMap1:
            print("Op1 in IndexingToBVOpsMap1")
            print("OP1:")
            Op1.print()
            print("OP2:")
            Op2.print()
            if Op1 in IndexingToBVOpsMap1 and Op2 in IndexingToBVOpsMap2:
                if FixPack(Op2, Op1, Block1, Pack1,
                           OpsList2, OpsList1, Visited, ValueToValuePackMap, Context) == True:
                    print("---AFTER PACK1:")
                    for Op in Pack1:
                        Op.print()
                    continue
                # elif  Op2 in IndexingToBVOpsMap2:
                else:
                    print("Op2 in IndexingToBVOpsMap2")
                    print("OP1:")
                    Op1.print()
                    print("OP2:")
                    Op2.print()
                    if FixPack(Op1, Op2, Block2, Pack2,
                               OpsList1, OpsList2, Visited, ValueToValuePackMap, Context) == True:
                        print("---AFTER PACK2:")
                        for Op in Pack2:
                            Op.print()
                        continue
                return False
        if Op1.getType() != Op2.getType():
            return False
        ValueToValuePackMap[Op1] = Op2
        ValueToValuePackMap[Op2] = Op1
        # Deal with call operations
        if isinstance(Op1, RoseCallOp):
            assert isinstance(Op2, RoseCallOp)
            # Make sure that the callees for the operations are equal.
            if Op1.getCallee().getName() != Op2.getCallee().getName():
                return False
            OpsList1.extend(Op1.getCallOperands())
            OpsList2.extend(Op2.getCallOperands())
            # for Operand1 in Op1.getCallOperands():
            #  ValueToValuePackMap[Operand1] = Op1
            # for Operand2 in Op2.getCallOperands():
            #  ValueToValuePackMap[Operand2] = Op2
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
            # for Operand in Op1.getBitVectorOperands():
            #  ValueToValuePackMap[Operand] = Op1
            # for Operand in Op2.getBitVectorOperands():
            #  ValueToValuePackMap[Operand] = Op2
            continue
        # Consider all other instructions
        OpsList1.extend(Op1.getOperands())
        OpsList2.extend(Op2.getOperands())
        # for Operand1 in Op1.getOperands():
        #  ValueToValuePackMap[Operand1] = Op1
        # for Operand2 in Op2.getOperands():
        #  ValueToValuePackMap[Operand2] = Op2
    # We are done exploring the DFGs
    print("AFTER PACK1:")
    for Op in Pack1:
        Op.print()
    print("AFTER PACK2:")
    for Op in Pack2:
        Op.print()
    AlignPacks(Pack1, Pack2, ValueToValuePackMap)
    return True


# This is necessary to ensure that 2 packs are rerollable.
def DFGsAreIsomorphic(Pack1: list, Pack2: list, Context: RoseContext):
    print("PACK1:")
    for Op in Pack1:
        Op.print()
    print("PACK2:")
    for Op in Pack2:
        Op.print()
    # print("DATAFLOW PATTERNS ARE SAME")
    if len(Pack1) != len(Pack2):
        return FixDFGIsomorphism(Pack1, Pack2, Context)
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
            continue
        if not isinstance(Op1, RoseOperation):
            if isinstance(Op2, RoseOperation):
                return False
            if Op1 != Op2:
                return False
            continue
        if not isinstance(Op2, RoseOperation):
            if isinstance(Op1, RoseOperation):
                return False
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


def FuseCandidatePacks2(RerollableCandidatePacks: list):
    print("BEFORE FUSING:")
    for Pack in RerollableCandidatePacks:
        print("+++UNFUSED PACK:")
        for Op in Pack:
            Op.print()

    NewCandidatePacks = []
    NewPack = []
    AllowPackExtension = None  # We do not know yet
    for Pack in RerollableCandidatePacks:
        LastOp = Pack[len(Pack) - 1]
        assert isinstance(LastOp, RoseBVInsertSliceOp)
        if NewPack == []:
            NewPack = Pack
            continue
        # This op can be a candidate for being added to the window
        MergePacks = True
        for Op in Pack:
            for NewPackOp in NewPack:
                # Check if the bitvector opcode and bitvector operands match
                if Op.getOpcode() == NewPackOp.getOpcode():
                    if isinstance(Op, RoseBitVectorOp):
                        if Op.getBitVectorOperands() == NewPackOp.getBitVectorOperands():
                            MergePacks = False
                            break
                    else:
                        assert isinstance(Op, RoseCallOp)
                        if Op.getCallee().getName() == NewPackOp.getCallee().getName():
                            MergePacks = False
                            break
        if MergePacks == True:
            if AllowPackExtension != False:
                NewPack.extend(Pack)
                AllowPackExtension = True
                print("HERE1")
            else:
                # Since packs are not allowed to extend,
                # create a new pack.
                NewCandidatePacks.append(NewPack)
                NewPack = Pack
                print("HERE2")
        else:
            print("HERE3")
            # Add the new pack to the list of new candidate packs
            if AllowPackExtension == None:
                print("FUSION OF PACKS NOT ALLOWD!!")
                AllowPackExtension = False
            NewCandidatePacks.append(NewPack)
            NewPack = Pack

    if NewPack != []:
        NewCandidatePacks.append(NewPack)
    # We expect to see multiple new candidate packs
    if len(NewCandidatePacks) == 1:
        NewCandidatePacks = []
    print("AFTER FUSING:")
    for Pack in NewCandidatePacks:
        print("+++FUSED PACK:")
        for Op in Pack:
            Op.print()
    return NewCandidatePacks


def FuseCandidatePacks(RerollableCandidatePacks: list):
    print("BEFORE FUSING:")
    for Pack in RerollableCandidatePacks:
        print("+++UNFUSED PACK:")
        for Op in Pack:
            Op.print()

    NewCandidatePacks = []
    NewPack = []
    AllowPackExtension = None  # We do not know yet
    for Pack in RerollableCandidatePacks:
        LastOp = Pack[len(Pack) - 1]
        assert isinstance(LastOp, RoseBVInsertSliceOp)
        if NewPack == []:
            NewPack = Pack
            continue
        # This op can be a candidate for being added to the window
        MergePacks = True
        for Op in Pack:
            for NewPackOp in NewPack:
                # Check if the bitvector opcode and bitvector operands match
                if Op.getOpcode() == NewPackOp.getOpcode():
                    if isinstance(Op, RoseBitVectorOp):
                        if Op.getBitVectorOperands() == NewPackOp.getBitVectorOperands():
                            MergePacks = False
                            print("Op:")
                            Op.print()
                            print("NewPackOp:")
                            NewPackOp.print()
                            break
                    elif isinstance(Op, RoseCallOp):
                        if Op.getCallee().getName() == NewPackOp.getCallee().getName():
                            MergePacks = False
                            break
                    # else:
                    #  MergePacks = False
        if MergePacks == True:
            # If the two packs contain two bvinsert ops with insert values coming
            # from the bvextract ops from the same bitvector, the packs cannot be merged.
            NewPackInsertOp = NewPack[-1]
            InsertOp = Pack[-1]
            if InsertOp.getInputBitVector() == NewPackInsertOp.getInputBitVector():
                if isinstance(InsertOp.getInsertValue(), RoseBVExtractSliceOp) \
                        and isinstance(NewPackInsertOp.getInsertValue(), RoseBVExtractSliceOp):
                    if InsertOp.getInsertValue() == NewPackInsertOp.getInsertValue():
                        MergePacks = False
                else:
                    MergePacks = False
        if MergePacks == True:
            if AllowPackExtension != False:
                NewPack.extend(Pack)
                AllowPackExtension = True
                print("HERE1")
            else:
                # Since packs are not allowed to extend,
                # create a new pack.
                NewCandidatePacks.append(NewPack)
                NewPack = Pack
                print("HERE2")
        else:
            print("HERE3")
            # Add the new pack to the list of new candidate packs
            if AllowPackExtension == None:
                print("FUSION OF PACKS NOT ALLOWD!!")
                AllowPackExtension = False
            NewCandidatePacks.append(NewPack)
            NewPack = Pack

    print("NewPack:")
    print(NewPack)
    if NewPack != []:
        NewCandidatePacks.append(NewPack)
    # We expect to see multiple new candidate packs
    if len(NewCandidatePacks) == 1:
        NewCandidatePacks = []
    # elif len(NewCandidatePacks) == 0:
    #  NewCandidatePacks = RerollableCandidatePacks

    print("AFTER FUSING:")
    for Pack in NewCandidatePacks:
        print("+++FUSED PACK:")
        for Op in Pack:
            Op.print()
    return NewCandidatePacks


def RunRerollerOnBlock(Block: RoseBlock, BlockToRerollableCandidatesMap: dict,
                       Context: RoseContext):
    print("RUN REROLLER ON BLOCK")
    print("BLOCK:")
    Block.print()
    # Collect groups instructions that are rerollable.
    # This only works on bitvector operations.
    # Pack is the moving window through code that
    # collects rellolable set of operations.
    # A legal window will end with a bvinsert operation.
    RerollableCandidatePacks = []
    Pack = []
    TotalNumInsts = Block.getNumOperations()
    for Index in range(TotalNumInsts):
        Operation = Block.getOperation(Index)
        # Once we hit an instruction that cannot reroll,
        # we quit if we have found some candidates already.
        # If not, we keep looking.
        # if not isinstance(Operation, RoseBitVectorOp) \
        # and not isinstance(Operation, RoseCallOp):
        #  Pack = []
        #  if len(RerollableCandidatePacks) == 0:
        #    continue
        #  else:
        #    break
        # Add the op to the window
        Pack.append(Operation)
        # The window ends with a bvinsert op. If we hit one,
        # start a new window.
        if isinstance(Operation, RoseBVInsertSliceOp):
            # Insert the window to the candidates list and empty the window
            RerollableCandidatePacks.append(Pack)
            Pack = []

    # We expect to see multiple packs
    if len(RerollableCandidatePacks) == 1:
        RerollableCandidatePacks = []

    # Fuse the packs that are fusible
    RerollableCandidatePacks = FuseCandidatePacks(RerollableCandidatePacks)

    # Get a set of rerollable sets
    RerollableCandidatesList = GetValidRerollableCandidates(
        RerollableCandidatePacks, Context)

    print("+++=RerollableCandidatesList:")
    print(RerollableCandidatesList)
    print(len(RerollableCandidatesList))

    # Add the set to the block map
    BlockToRerollableCandidatesMap[Block] = RerollableCandidatesList
    return BlockToRerollableCandidatesMap


def RunRerollerOnRegion(Region, BlockToRerollableCandidatesMap: dict,
                        Context: RoseContext, VisitedRegion: set = set()):
    if Region in VisitedRegion:
        print("REGION HAS BEEN VISITED")
        return BlockToRerollableCandidatesMap
    # Iterate over all the contents of this region
    assert not isinstance(Region, RoseBlock)
    AbstractionToReductionInfo = dict()
    for Abstraction in Region:  # Region.getChildren():
        print("NEXT ABSTRACTION:")
        Abstraction.print()
        # Run reroller on a nested function
        if isinstance(Abstraction, RoseFunction):
            RunRerollerOnFunction(Abstraction, Context)
            continue
        # Reroller only operates on blocks
        if not isinstance(Abstraction, RoseBlock):
            Abstraction.print()
            AbstractionToReductionInfoMap, BlockToRerollableCandidatesMap = \
                RunRerollerOnRegion(
                    Abstraction, BlockToRerollableCandidatesMap, Context)
            AbstractionToReductionInfo.update(AbstractionToReductionInfoMap)
            continue
        if Abstraction in VisitedRegion:
            continue
        AbstractionToReductionInfo[Abstraction] = \
            FixReductionPattern1ToMakeBlockRerollable(
                Abstraction, Context, VisitedRegion)

        # if FixReductionPattern1ToMakeBlockRerollable(Abstraction, Context, VisitedRegion) == False:
        #  if FixReductionPattern2ToMakeBlockRerollable(Abstraction, Context, VisitedRegion) == False:
        #    FixReductionPattern3ToMakeBlockRerollable(Abstraction, Context, VisitedRegion)
        BlockToRerollableCandidatesMap = RunRerollerOnBlock(Abstraction,
                                                            BlockToRerollableCandidatesMap, Context)
        print("^^^^^^^ABSTRACTION:")
        Abstraction.print()
        VisitedRegion.add(Abstraction)
    VisitedRegion.add(Region)
    return AbstractionToReductionInfo, BlockToRerollableCandidatesMap


# The assumption here is that the relationship between the
# indices is of the form: A * iterator + B.
# We need to find A and B for every indexed bitvector operation.
# Another assumption is that the given packs consist of call,
# bvextract and bvinsert ops.
def GetLowOffsetsWithinPackConstantIndices(Pack1: list, Pack2: list, Context: RoseContext):
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True
    print("GetLowOffsetsWithinPackConstantIndices")
    # Get the low index for the first bvinsert op in the pack
    StartIndex1 = None
    StartIndex2 = None
    for Index in range(len(Pack1)):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        if isinstance(Op1, RoseBVInsertSliceOp):
            assert isinstance(Op2, RoseBVInsertSliceOp)
            assert isinstance(Op1.getLowIndex(), RoseConstant)
            assert isinstance(Op2.getLowIndex(), RoseConstant)
            StartIndex1 = Op1.getLowIndex().getValue()
            StartIndex2 = Op2.getLowIndex().getValue()
            break
    assert StartIndex1 != None
    assert StartIndex2 != None
    print("StartIndex1:")
    print(StartIndex1)
    print("StartIndex2:")
    print(StartIndex2)
    LowOffsetsListMap = dict()
    CoFactactorsListMap = dict()
    for Index in range(len(Pack1)):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        LowOffsetsListMap[Index] = list()
        CoFactactorsListMap[Index] = list()
        if isinstance(Op1, RoseCallOp) or \
                (isinstance(Op1, RoseBitVectorOp) == True and Op1.isIndexingBVOp() == False):
            assert isinstance(Op2, RoseCallOp) or \
                (isinstance(Op2, RoseBitVectorOp) ==
                 True and Op2.isIndexingBVOp() == False)
            LowOffsetsListMap[Index].append(None)
            CoFactactorsListMap[Index].append(None)
            continue
        assert isinstance(Op1, RoseBitVectorOp) and isinstance(
            Op2, RoseBitVectorOp)
        assert Op1.isIndexingBVOp() and Op2.isIndexingBVOp()
        # Now we are dealing with bitvector ops that index into bitvectors
        # First get the start index and get offsets relative to
        LowIndex1 = Op1.getLowIndex()
        LowIndex2 = Op2.getLowIndex()
        assert isinstance(LowIndex1, RoseConstant)
        assert isinstance(LowIndex2, RoseConstant)
        # Solve the linear equations
        # C1 * outer_iterator + C2 * innner_iterator + Offset =
        Cofactor = (LowIndex2.getValue() - LowIndex1.getValue())\
            / (StartIndex2 - StartIndex1)
        if Cofactor == int(Cofactor):
            Cofactor = int(Cofactor)
        print("--OP1:")
        Op1.print()
        print("--OP2:")
        Op2.print()
        print("LowIndex1.getValue():")
        print(LowIndex1.getValue())
        print("LowIndex2.getValue():")
        print(LowIndex2.getValue())
        print("FLOAT COFACTOR:")
        print((LowIndex2.getValue() - LowIndex1.getValue())
              / (StartIndex2 - StartIndex1))
        print("Cofactor:")
        print(Cofactor)
        Offset = LowIndex1.getValue() - (Cofactor * StartIndex1)
        assert Offset == int(Offset)
        Offset = int(Offset)
        print("Offset:")
        print(Offset)
        LowOffsetsListMap[Index].append(Offset)
        CoFactactorsListMap[Index].append(Cofactor)
    return LowOffsetsListMap, CoFactactorsListMap


def AreStartingIndicesNonConstant(Pack1: list, Pack2: list, Context: RoseContext):
    print("AreStartingIndicesNonConstant")
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True

    def GatherLowIndexingOps(Pack: list):
        IndexingToBVOpsMap = dict()
        for Op in reversed(Pack):
            if isinstance(Op, RoseBVExtractSliceOp) \
                    or isinstance(Op, RoseBVInsertSliceOp):
                IndexingOps = list()
                if isinstance(Op.getLowIndex(), RoseOperation):
                    IndexingOps.append(Op.getLowIndex())
                while len(IndexingOps) != 0:
                    IndexingOp = IndexingOps.pop()
                    IndexingToBVOpsMap[IndexingOp] = Op
                    # We can erase Op, but first get the operands
                    for Operand in IndexingOp.getOperands():
                        if isinstance(Operand, RoseOperation):
                            IndexingOps.append(Operand)
        return IndexingToBVOpsMap

    # Gather all the indexing ops
    IndexingToBVOpsMap1 = GatherLowIndexingOps(Pack1)
    IndexingToBVOpsMap2 = GatherLowIndexingOps(Pack2)

    Indices = list()
    OperandIndicesMap = dict()
    for Index in reversed(range(len(Pack1))):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        if isinstance(Op1, RoseBVInsertSliceOp):
            assert isinstance(Op2, RoseBVInsertSliceOp)
            if not isinstance(Op1.getLowIndex(), RoseConstant):
                assert not isinstance(Op2.getLowIndex(), RoseConstant)
            else:
                assert isinstance(Op2.getLowIndex(), RoseConstant)
                # return None, None
            continue
        if isinstance(Op1, RoseBVExtractSliceOp):
            assert isinstance(Op2, RoseBVExtractSliceOp)
            if not isinstance(Op1.getLowIndex(), RoseConstant):
                assert not isinstance(Op2.getLowIndex(), RoseConstant)
            else:
                assert isinstance(Op2.getLowIndex(), RoseConstant)
                # print("NONE, NONE -- EXTRACT OP")
                # return None, None
            continue
        if Op1 in IndexingToBVOpsMap1:
            assert Op2 in IndexingToBVOpsMap2
            assert len(Op1.getOperands()) == len(Op2.getOperands())
            print("OP1:")
            Op1.print()
            print("OP2:")
            Op2.print()
            for OperandIndex in range(len(Op1.getOperands())):
                if isinstance(Op1.getOperand(OperandIndex), RoseConstant):
                    assert isinstance(Op2.getOperand(
                        OperandIndex), RoseConstant)
                    if Op1.getOperand(OperandIndex).getValue() != Op2.getOperand(OperandIndex).getValue():
                        Indices.append(Index)
                        if Index in OperandIndicesMap:
                            OperandIndicesMap[Index].append(OperandIndex)
                        else:
                            OperandIndicesMap[Index] = [OperandIndex]
                        break
    if Indices == []:
        assert len(list(OperandIndicesMap.keys())) == 0
        return None, None
    return Indices, OperandIndicesMap


def GetLowOffsetsWithinPackNonConstantIndices(Pack1: list, Pack2: list,
                                              PackIndex: int, OperandIndex: int,
                                              Context: RoseContext):
    assert type(PackIndex) == int
    assert type(OperandIndex) == int
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True
    print("GetLowOffsetsWithinPackNonConstantIndices")
    print("PACK1:")
    PrintPack(Pack1)
    print("PACK2:")
    PrintPack(Pack2)

    StartIndex1 = None
    StartIndex2 = None
    Op1 = Pack1[PackIndex]
    Op2 = Pack2[PackIndex]
    assert isinstance(Op1.getOperand(OperandIndex), RoseConstant)
    assert isinstance(Op2.getOperand(OperandIndex), RoseConstant)
    assert Op1.getOperand(OperandIndex).getValue(
    ) != Op2.getOperand(OperandIndex).getValue()
    StartIndex1 = Op1.getOperand(OperandIndex).getValue()
    StartIndex2 = Op2.getOperand(OperandIndex).getValue()
    assert StartIndex1 != None
    assert StartIndex2 != None
    print("StartIndex1:")
    print(StartIndex1)
    print("StartIndex2:")
    print(StartIndex2)

    LowOffsetsListMap = dict()
    CoFactactorsListMap = dict()
    for Index in range(len(Pack1)):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        print("+++OP1:")
        Op1.print()
        print("++++OP2:")
        print(Op2)
        LowOffsetsListMap[Index] = list()
        CoFactactorsListMap[Index] = list()
        if isinstance(Op1, RoseCallOp):
            assert isinstance(Op2, RoseCallOp)
            LowOffsetsListMap[Index].append(None)
        elif isinstance(Op1, RoseBitVectorOp):
            assert isinstance(Op2, RoseBitVectorOp)
            LowOffsetsListMap[Index].append(None)
        else:
            assert not isinstance(Op2, RoseBitVectorOp)
            for OperandIndex in range(len(Op1.getOperands())):
                if not isinstance(Op1.getOperand(OperandIndex), RoseConstant):
                    assert not isinstance(
                        Op2.getOperand(OperandIndex), RoseConstant)
                    LowOffsetsListMap[Index].append(None)
                else:
                    assert isinstance(Op2.getOperand(
                        OperandIndex), RoseConstant)
                    LowOffsetsListMap[Index].append(Op2.getOperand(OperandIndex).getValue()
                                                    - Op1.getOperand(OperandIndex).getValue())
        CoFactactorsListMap[Index].append(None)

    return LowOffsetsListMap, CoFactactorsListMap


def GetFirstLowIndexInPackNonConstantIndices(Pack: list,
                                             PackIndex: int, OperandIndex: int):
    print("GetFirstLowIndexInPackNonConstantIndices:")
    assert type(PackIndex) == int
    assert type(OperandIndex) == int
    StartIndex = None
    Op = Pack[PackIndex]
    assert isinstance(Op.getOperand(OperandIndex), RoseConstant)
    StartIndex = Op.getOperand(OperandIndex).getValue()
    assert StartIndex != None
    print("StartIndex1:")
    print(StartIndex)
    return StartIndex


def GetFirstLowIndexInPackConstantIndices(Pack: list):
    print("GetFirstLowIndexInPack:")
    for Op in Pack:
        Op.print()
    StartIndex = None
    for Op in Pack:
        if isinstance(Op, RoseBVInsertSliceOp):
            assert isinstance(Op.getLowIndex(), RoseConstant)
            StartIndex = Op.getLowIndex().getValue()
            break
    assert StartIndex != None
    return StartIndex


def GetStepForRerolledLoopNonConstantIndices(Pack1: list, Pack2: list,
                                             PackIndex: int, OperandIndex: int,
                                             Context: RoseContext):
    assert type(PackIndex) == int
    assert type(OperandIndex) == int
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True

    # We just get the difference between 2 different packs
    Offset = None
    Op1 = Pack1[PackIndex]
    Op2 = Pack2[PackIndex]
    assert isinstance(Op1.getOperand(OperandIndex), RoseConstant)
    assert isinstance(Op2.getOperand(OperandIndex), RoseConstant)
    assert Op1.getOperand(OperandIndex).getValue(
    ) != Op2.getOperand(OperandIndex).getValue()
    Offset = Op2.getOperand(OperandIndex).getValue() - \
        Op1.getOperand(OperandIndex).getValue()
    assert Offset != None
    print("PackIndex")
    print(PackIndex)
    print("OperandIndex:")
    print(OperandIndex)
    print("Offset:")
    print(Offset)
    return Offset


def GetStepForRerolledLoopConstantIndices(Pack1: list, Pack2: list, Context: RoseContext):
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True

    # We just get the difference between 2 different packs
    Offset = None
    for Index in range(len(Pack1)):
        if isinstance(Pack1[Index], RoseBVInsertSliceOp):
            assert isinstance(Pack2[Index], RoseBVInsertSliceOp)
            LowIndex1 = Pack1[Index].getLowIndex()
            LowIndex2 = Pack2[Index].getLowIndex()
            assert isinstance(LowIndex1, RoseConstant)
            assert isinstance(LowIndex2, RoseConstant)
            Offset = (LowIndex2.getValue() - LowIndex1.getValue())
            break
    assert Offset != None
    return Offset


# This aims to see if the rerollable packs can be rerolled more again
def GetValidCandidatesRerollableTwice(RerollableCandidatesList, Context: RoseContext):
    print("****************************************************")
    print("RerollableCandidatesList:")
    for PackList in RerollableCandidatesList:
        print("PACKLIST:")
        for Pack in PackList:
            print("PACK:")
            for Op in Pack:
                Op.print()
    # Puts packlists that are isomorphic together
    CandidateListsOfIsomorphicPackLists = []
    IsomorphicPackLists = []
    MergedPackList = []
    OffsetsList = []
    for PackListIndex in range(len(RerollableCandidatesList)):
        if PackListIndex in MergedPackList:
            continue
        PackList = RerollableCandidatesList[PackListIndex]
        if IsomorphicPackLists == []:
            IsomorphicPackLists = [PackList]
            MergedPackList.append(PackListIndex)
        for CheckPackListIndex in range((PackListIndex + 1), len(RerollableCandidatesList)):
            if CheckPackListIndex in MergedPackList:
                continue
            CheckPackList = RerollableCandidatesList[CheckPackListIndex]
            # We try to look for isomorphism between the data flows
            # of packlists.
            TailPackList = IsomorphicPackLists[len(IsomorphicPackLists) - 1]
            print("TailPackList:")
            for Op in TailPackList[0]:
                Op.print()
            print("CheckPackList[0]:")
            for Op in CheckPackList[0]:
                Op.print()
            CheckDFGsAreIsomorphic = DFGsAreIsomorphic(
                TailPackList[0], CheckPackList[0], Context)
            print("++++CheckDFGsAreIsomorphic:")
            print(CheckDFGsAreIsomorphic)
            if CheckDFGsAreIsomorphic == False:
                # Nothing to do here, just skip this pack list
                continue
            # Now we check if the offsets are equal
            NewOffsetsList = GetOffsetsBetweenPacks(
                TailPackList[0], CheckPackList[0], OffsetsList)
            print("++++NewOffsetsList:")
            print(NewOffsetsList)
            if NewOffsetsList == None:
                # Nothing to do here, just skip this pack list
                continue
            # If the offsets list is empty. Fill it up.
            if OffsetsList == []:
                OffsetsList = NewOffsetsList
            assert OffsetsList == NewOffsetsList
            MergedPackList.append(CheckPackListIndex)
            IsomorphicPackLists.append(CheckPackList)
        if len(IsomorphicPackLists) != 1:
            CandidateListsOfIsomorphicPackLists.append(IsomorphicPackLists)
        # Reset the lists. Note that we do not reset the offset list because we expect
        # the offset list to be the same across rerolled loops.
        IsomorphicPackLists = []
        # OffsetsList = []
    print("================================================")
    for PackLists in CandidateListsOfIsomorphicPackLists:
        print("+++++++PACKLISTS:")
        for PackList in PackLists:
            print("-------PACKLIST:")
            for Pack in PackList:
                print("PACK:")
                for Op in Pack:
                    Op.print()
    return CandidateListsOfIsomorphicPackLists


def PerformRerollingOnce(Block: RoseBlock, RerollableCandidatesList: list,
                         DoesReduction: bool, IteratorSuffix: int,
                         RemovedOps: list, Context: RoseContext):
    print("PerformRerollingOnce:")
    Block.print()
    print("FUNCTION:")
    Block.getFunction().print()
    # Reroll the candidares in the list
    for PackList in RerollableCandidatesList:
        # Get the non-constant index
        PackIndices, OperandIndicesMap = AreStartingIndicesNonConstant(PackList[0],
                                                                       PackList[1], Context)
        print("PackIndices:")
        print(PackIndices)
        print("OperandIndicesMap:")
        print(OperandIndicesMap)
        NonConstantIndexing = False
        if PackIndices == None:
            assert OperandIndicesMap == None
            # Lets get the offsets across windows and other info for generating a loop
            LowOffsetsListMap, CoFactactorsListMap = \
                GetLowOffsetsWithinPackConstantIndices(
                    PackList[0], PackList[1], Context)
            Step = GetStepForRerolledLoopConstantIndices(
                PackList[0], PackList[1], Context)
            Start = GetFirstLowIndexInPackConstantIndices(PackList[0])
            End = GetFirstLowIndexInPackConstantIndices(
                PackList[len(PackList) - 1])
        else:
            assert OperandIndicesMap != None
            NonConstantIndexing = True
            # Lets get the offsets across windows and other info for generating a loop
            LowOffsetsListMap, CoFactactorsListMap = \
                GetLowOffsetsWithinPackNonConstantIndices(PackList[0], PackList[1],
                                                          PackIndices[0], OperandIndicesMap[PackIndices[0]][0],
                                                          Context)
            Step = GetStepForRerolledLoopNonConstantIndices(PackList[0], PackList[1],
                                                            PackIndices[0], OperandIndicesMap[PackIndices[0]][0],
                                                            Context)
            Start = GetFirstLowIndexInPackNonConstantIndices(PackList[0],
                                                             PackIndices[0], OperandIndicesMap[PackIndices[0]][0])
            End = GetFirstLowIndexInPackNonConstantIndices(PackList[len(PackList) - 1],
                                                           PackIndices[0], OperandIndicesMap[PackIndices[0]][0])
        if DoesReduction == True and Step < 0:
            # Reverse the list of packs and try again
            PackList.reverse()
            # Get the non-constant index
            PackIndices, OperandIndicesMap = AreStartingIndicesNonConstant(PackList[0],
                                                                           PackList[1], Context)
            print("PackIndices:")
            print(PackIndices)
            print("OperandIndicesMap:")
            print(OperandIndicesMap)
            NonConstantIndexing = False
            if PackIndices == None:
                assert OperandIndicesMap == None
                # Lets get the offsets across windows and other info for generating a loop
                LowOffsetsListMap, CoFactactorsListMap = \
                    GetLowOffsetsWithinPackConstantIndices(
                        PackList[0], PackList[1], Context)
                Step = GetStepForRerolledLoopConstantIndices(
                    PackList[0], PackList[1], Context)
                Start = GetFirstLowIndexInPackConstantIndices(PackList[0])
                End = GetFirstLowIndexInPackConstantIndices(
                    PackList[len(PackList) - 1])
            else:
                assert OperandIndicesMap != None
                NonConstantIndexing = True
                # Lets get the offsets across windows and other info for generating a loop
                LowOffsetsListMap, CoFactactorsListMap = \
                    GetLowOffsetsWithinPackNonConstantIndices(PackList[0], PackList[1],
                                                              PackIndices[0], OperandIndicesMap[PackIndices[0]][0],
                                                              Context)
                Step = GetStepForRerolledLoopNonConstantIndices(PackList[0], PackList[1],
                                                                PackIndices[0], OperandIndicesMap[PackIndices[0]][0],
                                                                Context)
                Start = GetFirstLowIndexInPackNonConstantIndices(PackList[0],
                                                                 PackIndices[0], OperandIndicesMap[PackIndices[0]][0])
                End = GetFirstLowIndexInPackNonConstantIndices(PackList[len(PackList) - 1],
                                                               PackIndices[0], OperandIndicesMap[PackIndices[0]][0])
        print("START:")
        print(Start)
        print("END:")
        print(End)
        print("STEP:")
        print(Step)
        print("CoFactactorsListMap:")
        print(CoFactactorsListMap)
        print("LowOffsetsListMap:")
        print(LowOffsetsListMap)
        print("PackIndices:")
        print(PackIndices)
        print("OperandIndices:")
        print(OperandIndicesMap)
        # Because of the way ranges in Rosette work, we have to add step to end before
        # generating a loop
        End += Step
        Loop = RoseForLoop.create(
            "iterator." + str(IteratorSuffix), Start, End, Step)
        IteratorSuffix += 1
        Iterator = Loop.getIterator()
        # Map to track old and new ops.
        OldToNewOPsMap = dict()
        # Insert operations in the generated loop.
        for OpIndex, Op in enumerate(PackList[0]):
            # Handle ops that do not have indices in operands
            if isinstance(Op, RoseCallOp):
                NewOp = Op.clone()
                for Index, Operand in enumerate(Op.getOperands()):
                    # If the operand is a constant value, we just copy constants over
                    if isinstance(Operand, RoseConstant):
                        NewOperand = Op.getOperand(Index)
                    else:
                        NewOperand = OldToNewOPsMap.get(
                            Operand, RoseUndefValue())
                        if NewOperand == RoseUndefValue():
                            # Operand is coming from some other source, just use
                            # the same operand as the old op.
                            NewOperand = Op.getOperand(Index)
                    print("----NewOperand:")
                    NewOperand.print()
                    NewOp.setOperand(Index, NewOperand)
                OldToNewOPsMap[Op] = NewOp
                Loop.addAbstraction(NewOp)
                continue
            if NonConstantIndexing == False:
                # Handle ops that do not have indices in operands
                if not isinstance(Op, RoseBitVectorOp) \
                        or (isinstance(Op, RoseBitVectorOp) and not Op.isIndexingBVOp()):
                    NewOp = Op.clone()
                    for Index, Operand in enumerate(Op.getOperands()):
                        # If the operand is a constant value, we just copy constants over
                        if isinstance(Operand, RoseConstant):
                            NewOperand = Op.getOperand(Index)
                        else:
                            NewOperand = OldToNewOPsMap.get(
                                Operand, RoseUndefValue())
                            if NewOperand == RoseUndefValue():
                                # Operand is coming from some other source, just use
                                # the same operand as the old op.
                                NewOperand = Op.getOperand(Index)
                        print("----NewOperand:")
                        NewOperand.print()
                        NewOp.setOperand(Index, NewOperand)
                    OldToNewOPsMap[Op] = NewOp
                    Loop.addAbstraction(NewOp)
                    continue
                # Handle bitvector operations (especially the indexing operations)
                [LowCofactor] = CoFactactorsListMap[OpIndex]
                Op.print()
                assert LowCofactor != None
                if LowCofactor == 1:
                    ScaledIterator = Iterator
                elif LowCofactor == 0:
                    ScaledIterator = RoseConstant(0, Iterator.getType())
                else:
                    if type(LowCofactor) != int:
                        LowCofactor = int(1 / LowCofactor)
                        LowCofactorVal = RoseConstant(
                            LowCofactor, Iterator.getType())
                        ScaledIterator = RoseDivOp.create(Context.genName("%" + "low.cofactor"),
                                                          Iterator, LowCofactorVal)
                    else:
                        LowCofactorVal = RoseConstant(
                            LowCofactor, Iterator.getType())
                        ScaledIterator = RoseMulOp.create(Context.genName("%" + "low.cofactor"),
                                                          [Iterator, LowCofactorVal])
                    Loop.addAbstraction(ScaledIterator)
                [LowOffset] = LowOffsetsListMap[OpIndex]
                assert LowOffset != None
                if LowOffset != 0:
                    # Generate an add instruction
                    LowOffsetVal = RoseConstant(
                        LowOffset, ScaledIterator.getType())
                    LowIndex = RoseAddOp.create(Context.genName("%" + "low.offset"),
                                                [ScaledIterator, LowOffsetVal])
                    Loop.addAbstraction(LowIndex)
                else:
                    LowIndex = ScaledIterator
                OpBitWidthVal = RoseConstant(Op.getOutputBitwidth() - 1,
                                             ScaledIterator.getType())
                HighIndex = RoseAddOp.create(Context.genName("%" + "high.offset"),
                                             [LowIndex, OpBitWidthVal])
                Loop.addAbstraction(HighIndex)
                NewOp = Op.clone()
                for Index, Operand in enumerate(Op.getOperands()):
                    if Index == Op.getLowIndexPos():
                        NewOp.setOperand(Index, LowIndex)
                        continue
                    if Index == Op.getHighIndexPos():
                        NewOp.setOperand(Index, HighIndex)
                        continue
                    if isinstance(Operand, RoseConstant):
                        # Just copy this constant over
                        NewOp.setOperand(Index, Operand)
                        continue
                    NewOperand = OldToNewOPsMap.get(Operand, RoseUndefValue())
                    if NewOperand == RoseUndefValue():
                        # Operand is coming from some other source, just use
                        # the same operand as the old op.
                        NewOperand = Op.getOperand(Index)
                    NewOp.setOperand(Index, NewOperand)
            else:
                # Deal with a bitvector and non-bitvector ops
                NewOp = Op.clone()
                for Index, Operand in enumerate(Op.getOperands()):
                    if isinstance(Operand, RoseConstant):
                        if OpIndex in PackIndices and Index in OperandIndicesMap[OpIndex]:
                            # Replace this constant with the iterator
                            print("PackIndices:")
                            print(PackIndices)
                            print("OperandIndices:")
                            print(OperandIndicesMap)
                            print("----Index:")
                            print(Index)
                            print("Loop.getStep().getValue():")
                            print(Loop.getStep().getValue())
                            # Check if the next pack has the operation with an operand
                            # at "Index" with a constant value of "Step".
                            if LowOffsetsListMap[OpIndex][Index] == Loop.getStep().getValue():
                                NewOp.setOperand(Index, Loop.getIterator())
                            else:
                                print("LowOffsetsListMap[OpIndex][Index]:")
                                print(LowOffsetsListMap[OpIndex][Index])
                                if LowOffsetsListMap[OpIndex][Index] > 0:
                                    OpInFirstPack = PackList[0][OpIndex]
                                    OpInSecondPack = PackList[1][OpIndex]
                                    print(
                                        "OpInFirstPack.getOperand(Index).getValue():")
                                    print(OpInFirstPack.getOperand(
                                        Index).getValue())
                                    print(
                                        "OpInSecondPack.getOperand(Index).getValue():")
                                    print(OpInSecondPack.getOperand(
                                        Index).getValue())
                                    # if OpInFirstPack.getOperand(Index).getValue() \
                                    #         > OpInSecondPack.getOperand(Index).getValue():
                                    #   Factor = int(OpInFirstPack.getOperand(Index).getValue() \
                                    #               / OpInSecondPack.getOperand(Index).getValue())
                                    #   assert Factor * OpInSecondPack.getOperand(Index).getValue() \
                                    #             == OpInFirstPack.getOperand(Index).getValue()
                                    # else:
                                    #   # Now we deal with
                                    #   Factor = int(OpInSecondPack.getOperand(Index).getValue() \
                                    #               / OpInFirstPack.getOperand(Index).getValue())
                                    #   assert Factor * OpInFirstPack.getOperand(Index).getValue() \
                                    #             == OpInSecondPack.getOperand(Index).getValue()
                                    # FactorVal = RoseConstant.create(Factor, Loop.getStep().getType())
                                    # MulOp = RoseMulOp.create(Context.genName(), [Loop.getIterator(), FactorVal])
                                    # DivOp = RoseDivOp.create(Context.genName(), MulOp, Loop.getStep())
                                    # NewOp.setOperand(Index, DivOp)
                                    # Loop.addAbstraction(MulOp)
                                    # Loop.addAbstraction(DivOp)
                                    # if Loop.getStartIndex().getValue() == OpInFirstPack.getOperand(Index).getValue():
                                    #   MulOp = RoseMulOp.create(Context.genName(), [Loop.getIterator(), \
                                    #                                     OpInSecondPack.getOperand(Index)])
                                    #   DivOp = RoseDivOp.create(Context.genName(), MulOp, Loop.getStep())
                                    #   NewOp.setOperand(Index, DivOp)
                                    #   Loop.addAbstraction(MulOp)
                                    #   Loop.addAbstraction(DivOp)
                                    # else:
                                    #   MulOp = RoseMulOp.create(Context.genName(), [Loop.getIterator(), \
                                    #                                     OpInSecondPack.getOperand(Index)])
                                    #   DivOp = RoseDivOp.create(Context.genName(), MulOp, Loop.getStep())
                                    #   Offset = OpInFirstPack.getOperand(Index).getValue() \
                                    #                     - Loop.getStartIndex().getValue()
                                    #   OffsetVal = RoseConstant.create(Offset, Loop.getStep().getType())
                                    #   AddOp =  RoseAddOp.create(Context.genName(), [OffsetVal, DivOp])
                                    #   NewOp.setOperand(Index, AddOp)
                                    #   Loop.addAbstraction(MulOp)
                                    #   Loop.addAbstraction(DivOp)
                                    #   Loop.addAbstraction(AddOp)
                                    #
                                    # x0 = OpInFirstPack.getValue()
                                    # x1 = OpInSecondPack.getValue()
                                    # x0 = k * iterator_0 + b
                                    # x1 = k * iterator_1 + b
                                    # iteration_n = n * step + start
                                    # Solve these equations and you get:
                                    # k = (x1 - x0) / step
                                    # b = x0 - k * start
                                    # x_n = k * iterator + b
                                    Diff = OpInSecondPack.getOperand(Index).getValue()\
                                        - OpInFirstPack.getOperand(Index).getValue()
                                    K = int(Diff / Loop.getStep().getValue())
                                    assert K * Loop.getStep().getValue() == Diff
                                    KVal = RoseConstant.create(
                                        K, Loop.getStep().getType())
                                    B = OpInFirstPack.getOperand(Index).getValue() \
                                        - (K * Loop.getStartIndex().getValue())
                                    BVal = RoseConstant.create(
                                        B, Loop.getStep().getType())
                                    MulOp = RoseMulOp.create(
                                        Context.genName(), [Loop.getIterator(), KVal])
                                    AddOp = RoseAddOp.create(
                                        Context.genName(), [MulOp, BVal])
                                    NewOp.setOperand(Index, AddOp)
                                    Loop.addAbstraction(MulOp)
                                    Loop.addAbstraction(AddOp)
                                else:
                                    # Only support special case for now
                                    print("REROLLER SPECIAL CASE SUPPORT")
                                    assert LowOffsetsListMap[OpIndex][Index] + \
                                        Loop.getStep().getValue() == 0
                                    SubOp1 = RoseSubOp.create(Context.genName(),
                                                              [Loop.getEndIndex(), Loop.getIterator()])
                                    SubOp2 = RoseSubOp.create(Context.genName(),
                                                              [SubOp1, Loop.getStep()])
                                    NewOp.setOperand(Index, SubOp2)
                                    Loop.addAbstraction(SubOp1)
                                    Loop.addAbstraction(SubOp2)
                        else:
                            # Just copy this constant over
                            print("+++++NewOperand:")
                            Operand.print()
                            NewOp.setOperand(Index, Operand)
                        continue
                    NewOperand = OldToNewOPsMap.get(Operand, RoseUndefValue())
                    if NewOperand == RoseUndefValue():
                        # Operand is coming from some other source, just use
                        # the same operand as the old op.
                        NewOperand = Op.getOperand(Index)
                    NewOp.setOperand(Index, NewOperand)
            OldToNewOPsMap[Op] = NewOp
            Loop.addAbstraction(NewOp)
        # This is the full loop
        Loop.print()
        # Now add the generated loop before the given block
        ParentRegion = Block.getParent()
        ParentRegion.print()
        Block.print()
        ParentKey = ParentRegion.getKeyForChild(Block)
        Index = ParentRegion.getPosOfChild(Block, ParentKey)
        ParentRegion.addRegionBefore(Index, Loop, ParentKey)
        print("PRINTING PARENT REGION BEFORE:")
        ParentRegion.print()
        print("PRINTING PARENT REGION AFTER:")
        ParentRegion.print()
        # Lets queue all the ops in the pack list to be removed
        for Pack in PackList:
            for Op in Pack:
                RemovedOps.append(Op)


# Assumption here is that the indices are expressed as:
# C1 * outer_iterator + C2 * innner_iterator + Offset = BitSlice_Index
# We try to find C1, C2 and Offset for every bitslice.
def GetIndexRelationsAcrossPacks(ListOfCandidatePackLists, Context: RoseContext):
    print("GetIndexRelationsAcrossPacks:")
    print(ListOfCandidatePackLists)
    Pack1 = ListOfCandidatePackLists[0][0]
    Pack2 = ListOfCandidatePackLists[0][1]
    Pack3 = ListOfCandidatePackLists[1][0]
    print("------------------")
    print(Pack1)
    PrintPack(Pack1)
    PrintPack(Pack2)
    PrintPack(Pack3)
    # Check if the candidate packs are isomorphic.
    assert DFGsAreIsomorphic(Pack1, Pack2, Context) == True
    assert DFGsAreIsomorphic(Pack1, Pack3, Context) == True
    # Get the low index for the first bvinsert op in the pack
    StartIndex1 = None
    StartIndex2 = None
    StartIndex3 = None
    for Index in range(len(Pack1)):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        Op3 = Pack3[Index]
        if isinstance(Op1, RoseBVInsertSliceOp):
            assert isinstance(Op2, RoseBVInsertSliceOp)
            assert isinstance(Op1.getLowIndex(), RoseConstant)
            assert isinstance(Op2.getLowIndex(), RoseConstant)
            assert isinstance(Op3.getLowIndex(), RoseConstant)
            StartIndex1 = Op1.getLowIndex().getValue()
            StartIndex2 = Op2.getLowIndex().getValue()
            StartIndex3 = Op3.getLowIndex().getValue()
            break
    assert StartIndex1 != None
    assert StartIndex2 != None
    assert StartIndex3 != None
    print("StartIndex1:")
    print(StartIndex1)
    print("StartIndex2:")
    print(StartIndex2)
    print("------StartIndex3:")
    print(StartIndex3)
    Pack1LaneIndex = 0
    Pack2LaneIndex = 0
    # StartIndex is total index into the vector. It is supposed
    # to be the index into a lane. So adjust for that.
    Pack3LaneIndex = StartIndex3 - StartIndex1
    StartIndex3 = StartIndex1

    # Function to round numbers
    def Round(X):
        def Truncate(number, digits) -> float:
            stepper = 10.0 ** digits
            return math.trunc(stepper * number) / stepper
        # Truncate first
        print("X: ")
        print(X)
        X = Truncate(X, 2)
        # See if more rounding is needed
        print("TRUNCATED X: ")
        print(X)
        if X == 0:
            return X
        if (1/X) % 2 == 0:
            return X
        if X != int(X):
            if (X + 0.01) == int(X + 0.01):
                X = X + 0.01
                return X
            assert (X - 0.01) == int(X - 0.01)
            X = X - 0.01
            return X
        return X

    LowOffsetsListMap = list()
    CoFactactorsListMap1 = list()
    CoFactactorsListMap2 = list()
    for Index in range(len(Pack1)):
        Op1 = Pack1[Index]
        Op2 = Pack2[Index]
        Op3 = Pack3[Index]
        if isinstance(Op1, RoseCallOp) or Op1.isIndexingBVOp() == False:
            assert isinstance(Op2, RoseCallOp) or Op2.isIndexingBVOp() == False
            assert isinstance(Op3, RoseCallOp) or Op3.isIndexingBVOp() == False
            LowOffsetsListMap.append(None)
            CoFactactorsListMap1.append(None)
            CoFactactorsListMap2.append(None)
            continue
        # Now we are dealing with bitvector ops that index into bitvectors
        # First get the start index and get offsets relative to
        LowIndex1 = Op1.getLowIndex()
        LowIndex2 = Op2.getLowIndex()
        LowIndex3 = Op3.getLowIndex()
        assert isinstance(LowIndex1, RoseConstant)
        assert isinstance(LowIndex2, RoseConstant)
        assert isinstance(LowIndex3, RoseConstant)
        print("--OP1:")
        Op1.print()
        print("--OP2:")
        Op2.print()
        print("LowIndex1.getValue():")
        print(LowIndex1.getValue())
        print("LowIndex2.getValue():")
        print(LowIndex2.getValue())
        print("LowIndex3.getValue():")
        print(LowIndex3.getValue())
        print("StartIndex1:")
        print(StartIndex1)
        print("StartIndex2:")
        print(StartIndex2)
        print("StartIndex3:")
        print(StartIndex3)
        # Solve the linear equations
        # C1 * outer_iterator + C2 * innner_iterator + Offset = BitSlice_Index
        A = np.array([[Pack1LaneIndex,  StartIndex1, 1], [Pack2LaneIndex, StartIndex2, 1],
                      [Pack3LaneIndex, StartIndex3, 1]])
        B = np.array(
            [LowIndex1.getValue(), LowIndex2.getValue(), LowIndex3.getValue()])
        X = np.linalg.solve(A, B)
        Cofactor1 = Round(X[0])
        Cofactor2 = Round(X[1])
        Offset = Round(X[2])
        print("Cofactor1:")
        print(Cofactor1)
        print("Cofactor2:")
        print(Cofactor2)
        print("Offset:")
        print(Offset)
        if Cofactor1 == int(Cofactor1):
            Cofactor1 = int(Cofactor1)
        if Cofactor2 == int(Cofactor2):
            Cofactor2 = int(Cofactor2)
        assert Offset == int(Offset)
        Offset = int(Offset)
        LowOffsetsListMap.append(Offset)
        CoFactactorsListMap1.append(Cofactor1)
        CoFactactorsListMap2.append(Cofactor2)
    return LowOffsetsListMap, CoFactactorsListMap1, CoFactactorsListMap2


def PerformRerollingTwice(Block: RoseBlock, ListOfCandidateIsomorphicPackLists: list,
                          IteratorSuffix: int, RemovedOps: list, Context: RoseContext):
    # Generate the outer loop that wraps around all the packlists
    ListOfCandidatePackLists = ListOfCandidateIsomorphicPackLists[0]
    FirstLoopPack = ListOfCandidatePackLists[0][0]
    SecondLoopPack = ListOfCandidatePackLists[1][0]
    LastLoopPack = ListOfCandidatePackLists[len(
        ListOfCandidatePackLists) - 1][0]
    OutStart = GetFirstLowIndexInPackConstantIndices(FirstLoopPack)
    OutEnd = GetFirstLowIndexInPackConstantIndices(LastLoopPack)
    OutStep = GetStepForRerolledLoopConstantIndices(
        FirstLoopPack, SecondLoopPack, Context)
    # Account for how Rosette expects the loop bounds to be expressed.
    OutEnd += OutStep
    OuterLoop = RoseForLoop.create("iterator.lane", OutStart, OutEnd, OutStep)
    OutIterator = OuterLoop.getIterator()
    # Now pack the code for inner loops
    for ListOfPackLists in ListOfCandidateIsomorphicPackLists:
        # Lets get the offsets across windows and other info for generating a loop
        LowOffsetsListMap, CoFactactorsListMap1, CoFactactorsListMap2 = \
            GetIndexRelationsAcrossPacks(ListOfPackLists, Context)
        print("LowOffsetsListMap:")
        print(LowOffsetsListMap)
        print("CoFactactorsListMap1:")
        print(CoFactactorsListMap1)
        print("CoFactactorsListMap2:")
        print(CoFactactorsListMap2)
        PackList = ListOfPackLists[0]
        Step = GetStepForRerolledLoopConstantIndices(
            PackList[0], PackList[1], Context)
        Start = GetFirstLowIndexInPackConstantIndices(PackList[0])
        End = GetFirstLowIndexInPackConstantIndices(
            PackList[len(PackList) - 1])
        print("START:")
        print(Start)
        print("END:")
        print(End)
        print("STEP:")
        print(Step)
        # Because of the way ranges in Rosette work, we have to add step to end before
        # generating a loop
        End += Step
        Loop = RoseForLoop.create(
            "iterator." + str(IteratorSuffix), Start, End, Step)
        IteratorSuffix += 1
        Iterator = Loop.getIterator()
        # Map to track old and new ops.
        OldToNewOPsMap = dict()
        # Insert operations in the generated loop.
        for OpIndex, Op in enumerate(PackList[0]):
            # Handle ops that do not have indices in operands
            if isinstance(Op, RoseCallOp) or Op.isIndexingBVOp() == 0:
                NewOp = Op.clone()
                for Index, Operand in enumerate(Op.getOperands()):
                    # If the operand is a constant value, we just copy constants over
                    if isinstance(Operand, RoseConstant):
                        NewOperand = Op.getOperand(Index)
                    else:
                        NewOperand = OldToNewOPsMap.get(
                            Operand, RoseUndefValue())
                        if NewOperand == RoseUndefValue():
                            # Operand is coming from some other source, just use
                            # the same operand as the old op.
                            NewOperand = Op.getOperand(Index)
                    NewOp.setOperand(Index, NewOperand)
                OldToNewOPsMap[Op] = NewOp
                Loop.addAbstraction(NewOp)
                continue
            # Handle instructions with indices as operands
            print("HANDLING THE INSTRUCTIONS WITH INDICES AS OPERANDS")
            LowCofactor1 = CoFactactorsListMap1[OpIndex]
            assert LowCofactor1 != None
            if LowCofactor1 == 1:
                ScaledIterator1 = OutIterator
            elif LowCofactor1 == 0:
                ScaledIterator1 = RoseConstant(0, OutIterator.getType())
            else:
                if type(LowCofactor1) != int:
                    LowCofactor1 = int(1 / LowCofactor1)
                    LowCofactorVal1 = RoseConstant(
                        LowCofactor1, OutIterator.getType())
                    ScaledIterator1 = RoseDivOp.create(Context.genName("%" + "low.out.cofactor"),
                                                       OutIterator, LowCofactorVal1)
                else:
                    LowCofactorVal1 = RoseConstant(
                        LowCofactor1, OutIterator.getType())
                    ScaledIterator1 = RoseMulOp.create(Context.genName("%" + "low.out.cofactor"),
                                                       [OutIterator, LowCofactorVal1])
                Loop.addAbstraction(ScaledIterator1)
            LowCofactor2 = CoFactactorsListMap2[OpIndex]
            assert LowCofactor2 != None
            if LowCofactor2 == 1:
                ScaledIterator2 = Iterator
            elif LowCofactor2 == 0:
                ScaledIterator2 = RoseConstant(0, Iterator.getType())
            else:
                if type(LowCofactor2) != int:
                    LowCofactor2 = int(1 / LowCofactor2)
                    LowCofactorVal2 = RoseConstant(
                        LowCofactor2, Iterator.getType())
                    ScaledIterator2 = RoseDivOp.create(Context.genName("%" + "low.cofactor"),
                                                       Iterator, LowCofactorVal2)
                else:
                    LowCofactorVal2 = RoseConstant(
                        LowCofactor2, Iterator.getType())
                    ScaledIterator2 = RoseMulOp.create(Context.genName("%" + "low.cofactor"),
                                                       [Iterator, LowCofactorVal2])
                Loop.addAbstraction(ScaledIterator2)
            if isinstance(ScaledIterator1, RoseConstant) and ScaledIterator1.getValue() == 0:
                ScaledIterator = ScaledIterator2
            elif isinstance(ScaledIterator2, RoseConstant) and ScaledIterator2.getValue() == 0:
                ScaledIterator = ScaledIterator1
            else:
                ScaledIterator = RoseAddOp.create(Context.genName("%" + "low.scaled.it"),
                                                  [ScaledIterator1, ScaledIterator2])
                Loop.addAbstraction(ScaledIterator)
            LowOffset = LowOffsetsListMap[OpIndex]
            assert LowOffset != None
            if LowOffset != 0:
                # Generate an add instruction
                LowOffsetVal = RoseConstant(
                    LowOffset, ScaledIterator.getType())
                LowIndex = RoseAddOp.create(Context.genName("%" + "low.offset"),
                                            [ScaledIterator, LowOffsetVal])
                Loop.addAbstraction(LowIndex)
            else:
                LowIndex = ScaledIterator
            OpBitWidthVal = RoseConstant(
                Op.getOutputBitwidth() - 1, ScaledIterator.getType())
            HighIndex = RoseAddOp.create(Context.genName("%" + "high.offset"),
                                         [LowIndex, OpBitWidthVal])
            Loop.addAbstraction(HighIndex)
            NewOp = Op.clone()
            for Index, Operand in enumerate(Op.getOperands()):
                if Index == Op.getLowIndexPos():
                    NewOp.setOperand(Index, LowIndex)
                    continue
                if Index == Op.getHighIndexPos():
                    NewOp.setOperand(Index, HighIndex)
                    continue
                if isinstance(Operand, RoseConstant):
                    # Just copy this constant over
                    NewOp.setOperand(Index, Operand)
                    continue
                NewOperand = OldToNewOPsMap.get(Operand, RoseUndefValue())
                if NewOperand == RoseUndefValue():
                    # Operand is coming from some other source, just use
                    # the same operand as the old op.
                    NewOperand = Op.getOperand(Index)
                NewOp.setOperand(Index, NewOperand)
            OldToNewOPsMap[Op] = NewOp
            Loop.addAbstraction(NewOp)
        # This is the full loop
        Loop.print()
        # Now add the generated loop before the generated outer loop
        OuterLoop.addAbstraction(Loop)
        print("PRINT OUTER LOOP")
        OuterLoop.print()
        # Lets queue all the ops in the pack lists to be removed
        for PackList in ListOfPackLists:
            for Pack in PackList:
                for Op in Pack:
                    RemovedOps.append(Op)

    # Now add the outer loop to the rest of the IR
    ParentRegion = Block.getParent()
    ParentRegion.print()
    Block.print()
    Index = ParentRegion.getPosOfChild(Block)
    ParentRegion.addRegionBefore(Index, OuterLoop)
    print("PRINTING PARENT REGION BEFORE:")
    ParentRegion.print()
    print("PRINTING PARENT REGION AFTER:")
    ParentRegion.print()


# Fix some packs
def FixBitvectorOpsInPack(Block: RoseBlock, Pack: list, Context: RoseContext):
    print("FixBitvectorOpsInPack")
    ToBeRemoved = set()
    for PackIndex, Op in enumerate(Pack):
        print("OP IN PACK:")
        Op.print()
        if isinstance(Op, RoseBVExtractSliceOp) \
                or isinstance(Op, RoseBVInsertSliceOp):
            print("BITVECTOR OPERATION:")
            Op.print()
            HighIndexOp = Op.getHighIndex()
            if isinstance(HighIndexOp, RoseOperation):
                print("HIGH INDEX IS AN OPERATION")
                # At least one of the operands must be the low index
                if isinstance(HighIndexOp, RoseAddOp):
                    print("HIGH INDEX IS AN ADD OPERATION")
                    assert len(HighIndexOp.getOperands()) == 2
                    if HighIndexOp.getOperand(0) == Op.getLowIndex():
                        continue
                    if HighIndexOp.getOperand(1) == Op.getLowIndex():
                        continue
                print("GENERATING NEW HIGH INDEX")
                BitwidthVal = RoseConstant.create(
                    Op.getOutputBitwidth() - 1, Op.getLowIndex().getType())
                HighIndexPackIndex = Pack.index(HighIndexOp)
                NewHighIndex = RoseAddOp.create(Context.genName(HighIndexOp.getName() + ".new"),
                                                [Op.getLowIndex(), BitwidthVal])
                Op.setOperand(Op.getHighIndexPos(), NewHighIndex)
                Block.addOperationBefore(NewHighIndex, Op)
                Pack[PackIndex] = Op
                print("HighIndexOp.getNumUsers():")
                print(HighIndexOp.getNumUsers())
                print(type(HighIndexOp.getNumUsers()))
                if HighIndexOp.getNumUsers() == 0:
                    # Erase this high index op
                    print("ERASING OP:")
                    HighIndexOp.print()
                    Block.eraseOperation(HighIndexOp)
                    print("OEPRATION ERASED")
                    if HighIndexOp in ToBeRemoved:
                        ToBeRemoved.remove(HighIndexOp)
                    Pack[HighIndexPackIndex] = NewHighIndex
                else:
                    Pack.insert(PackIndex, NewHighIndex)
                    ToBeRemoved.add(HighIndexOp)
    # Remove any ops that can be removed
    for HighIndexOp in ToBeRemoved:
        print("++++HighIndexOp:")
        HighIndexOp.print()
        if HighIndexOp.getNumUsers() == 0:
            Block.eraseOperation(HighIndexOp)
    print("BLOCK AFTER FIXING PACK:")
    Block.print()
    return


def PerformRerolling(BlockToRerollableCandidatesMap: dict,
                     AbstractionToReductionInfo: dict, Context: RoseContext):
    print("PERFORMING REROLLING")
    RemovedOps = []
    IteratorSuffix = 0
    # Iterate over the candidate lists for different blocks
    # and reroll as much as possible.
    for Block, RerollableCandidatesList in BlockToRerollableCandidatesMap.items():
        for Packs in RerollableCandidatesList:
            for Pack in Packs:
                FixBitvectorOpsInPack(Block, Pack, Context)
        ListOfCandidateIsomorphicPackLists = \
            GetValidCandidatesRerollableTwice(
                RerollableCandidatesList, Context)
        print(len(ListOfCandidateIsomorphicPackLists))
        if ListOfCandidateIsomorphicPackLists != []:
            print("PERFORMING REROLLING TWICE")
            PerformRerollingTwice(Block, ListOfCandidateIsomorphicPackLists,
                                  IteratorSuffix, RemovedOps, Context)
        else:
            print("PERFORMING REROLLING ONCE")
            ParentRegion = Block.getParent()
            print("+++++++BLOCK VALIDITY:")
            print(Block in ParentRegion.getChildren())
            DoesReduction = AbstractionToReductionInfo[Block]
            PerformRerollingOnce(Block, RerollableCandidatesList, DoesReduction,
                                 IteratorSuffix, RemovedOps, Context)
            print("---------BLOCK VALIDITY:")
            print(Block in ParentRegion.getChildren())
    # Finaly, remove the ops.
    # Reverse the list of ops since we want to remove
    # uses of ops before the ops themselves.
    RemovedOps.reverse()
    for Operation in RemovedOps:
        print("OPERATION BEING REMOVED:")
        Operation.print()
        Block = Operation.getParent()
        Block.eraseOperation(Operation)
        # If the block is empty now, we can remove it
        if Block.isEmpty():
            ParentRegion = Block.getParent()
            print("ParentRegion:")
            ParentRegion.print()
            ParentKey = ParentRegion.getKeyForChild(Block)
            ParentRegion.eraseChild(Block, ParentKey)


def FixExternalDependencyInBlock(Block: RoseBlock, Context: RoseContext):
    OpList = list()
    OpList.extend(Block.getOperations())
    for Op in OpList:
        if not isinstance(Op, RoseBVExtractSliceOp) and \
                not isinstance(Op, RoseBVInsertSliceOp):
            continue
        IndexingOps = GatherIndexingOps(Op)
        for IndexingOp in IndexingOps:
            if IndexingOp.getParent() == Block:
                continue
            print("^^^INDEXING OP:")
            IndexingOp.print()
            # Clone the indexing op and replace uses with
            # unique copy.
            ClonedIndexingOp = IndexingOp.clone(Context.genName(IndexingOp.getName() + ".copy"),
                                                ChangeID=True)
            ReplaceUsesWithUniqueCopiesOf(
                Block, IndexingOp, ClonedIndexingOp, Context)
    return


def FixReductionPattern1ToMakeBlockRerollable(Block: RoseBlock,
                                              Context: RoseContext, VisitedRegion: set = set()):
    print("FIX REDUCTION PATTERN TO MAKE BLOCK REROLLABLE")
    print("FixReductionPatternToMakeBlockRerollable")
    print("BLOCK:")
    Block.print()
    # Look for chains of bvadd ops
    Function = Block.getFunction()
    PrintFunctionInfo(Function)
    BVAddChain = list()
    BVInsertOp = RoseUndefValue()
    IntermediateOp = RoseUndefValue()
    for Op in reversed(Block.getOperations()):
        if isinstance(Op, RoseBVInsertSliceOp):
            # Right now, we cannot deal with blocks with multiple
            # reduction patterns i.e. if there are multiple
            # bvinserts in the block.
            # TODO: fix this
            if not isinstance(BVInsertOp, RoseUndefValue):
                print("MULTIPLE BVINSERTS FOUND")
                return False
            # Go up the use-def chain to look for add ops.
            # Skip bvsat and bvusat ops.
            InsertValue = Op.getInsertValue()
            if isinstance(InsertValue, RoseBVSSaturateOp) \
                    or isinstance(InsertValue, RoseBVUSaturateOp):
                IntermediateOp = InsertValue
                InsertValue = IntermediateOp.getInputBitVector()
            if isinstance(InsertValue, RoseBVAddOp):
                Worklist = [InsertValue]
                while len(Worklist) != 0:
                    AddOp = Worklist.pop()
                    # Number of uses for the add op must be only 1.
                    if AddOp.getNumUsers() == 1:
                        BVAddChain.append(AddOp)
                    for Operand in AddOp.getOperands():
                        if isinstance(Operand, RoseBVAddOp) \
                                and Operand.getParent() == Block:
                            Worklist.append(Operand)
                BVInsertOp = Op

    if len(BVAddChain) == 0 \
            or BVInsertOp == RoseUndefValue():  # or len(BVAddChain) == 1
        print("len(BVAddChain):")
        print(len(BVAddChain))
        print("RETURNING EARLY!!!")
        return False

    if len(BVAddChain) == 1:
        print("BVAddCHAIN == 1")
        # Check if there is any distant possibility that this reduction
        # pattern is reroller. Trace back two threads.
        AddOp = BVAddChain[0]
        assert isinstance(AddOp, RoseBVAddOp)
        assert len(AddOp.getOperands()) == 2
        Trace1 = [AddOp.getOperand(0)]
        Trace2 = [AddOp.getOperand(1)]
        while len(Trace1) != 0 and len(Trace2) != 0:
            Trace1Op = Trace1.pop()
            Trace2Op = Trace2.pop()
            if type(Trace1Op) != type(Trace2Op):
                print("EXIT2")
                return False
            if isinstance(Trace1Op, RoseArgument) \
                    and isinstance(Trace2Op, RoseArgument):
                continue
            if isinstance(Trace1Op, RoseBVExtractSliceOp) \
                    and isinstance(Trace2Op, RoseBVExtractSliceOp):
                if Trace1Op.getInputBitVector() != Trace2Op.getInputBitVector():
                    return False
                Trace1.append(Trace1Op.getInputBitVector())
                Trace2.append(Trace2Op.getInputBitVector())
                continue
            if Trace1Op.isSizeChangingOp() and Trace2Op.isSizeChangingOp():
                Trace1.append(Trace1Op.getOperand(0))
                Trace2.append(Trace2Op.getOperand(0))
                continue
            assert len(Trace1Op.getOperands()) == 2 and len(
                Trace2Op.getOperands()) == 2
            for Operand in Trace1Op.getOperands():
                if not isinstance(Operand, RoseConstant):
                    Trace1.append(Operand)
            for Operand in Trace2Op.getOperands():
                if not isinstance(Operand, RoseConstant):
                    Trace2.append(Operand)

    if not isinstance(IntermediateOp, RoseUndefValue):
        assert isinstance(IntermediateOp, RoseBVSSaturateOp) \
            or isinstance(IntermediateOp, RoseBVUSaturateOp)

    if len(BVAddChain) == 2:
        print("SPECIAL CHECK")
        # Check if there is any distant possibility that this reduction
        # pattern is rerollable. Trace back two threads.
        AddOp = BVAddChain[0]
        assert isinstance(AddOp, RoseBVAddOp)
        assert len(AddOp.getOperands()) == 2
        Trace1 = [AddOp.getOperand(0)]
        Trace2 = [AddOp.getOperand(1)]
        while len(Trace1) != 0 and len(Trace2) != 0:
            Trace1Op = Trace1.pop()
            Trace2Op = Trace2.pop()
            print("TRACE1 OP:")
            Trace1Op.print()
            print("TRACE2 OP:")
            Trace2Op.print()
            if type(Trace1Op) != type(Trace2Op):
                print("EXIT2")
                if isinstance(Trace1Op, RoseBVExtractSliceOp) \
                        or Trace1Op.isSizeChangingOp():
                    if isinstance(Trace2Op, RoseBVAddOp):
                        Trace1 = [Trace2Op.getOperand(0)]
                        Trace2 = [Trace2Op.getOperand(1)]
                        continue
                if isinstance(Trace2Op, RoseBVExtractSliceOp) \
                        or Trace2Op.isSizeChangingOp():
                    if isinstance(Trace1Op, RoseBVAddOp):
                        Trace1 = [Trace1Op.getOperand(0)]
                        Trace2 = [Trace1Op.getOperand(1)]
                        continue
                if isinstance(Trace1Op, RoseBVExtractSliceOp) \
                        or Trace1Op.isSizeChangingOp():
                    if Trace2Op.getOpcode().typesOfOperandsAreEqual() \
                            and Trace2Op.getOpcode().typesOfInputsAndOutputEqual():
                        Trace1 = [Trace2Op]
                        continue
                if isinstance(Trace2Op, RoseBVExtractSliceOp) \
                        or Trace2Op.isSizeChangingOp():
                    if Trace1Op.getOpcode().typesOfOperandsAreEqual() \
                            and Trace1Op.getOpcode().typesOfInputsAndOutputEqual():
                        Trace2 = [Trace1Op]
                        continue
                if Trace2Op.getOpcode().typesOfOperandsAreEqual() \
                        and Trace2Op.getOpcode().typesOfInputsAndOutputEqual():
                    if Trace1Op.getOpcode().typesOfOperandsAreEqual() \
                            and Trace1Op.getOpcode().typesOfInputsAndOutputEqual():
                        Trace1 = [Trace1Op.getOperand(0)]
                        Trace2 = [Trace2Op]
                        continue
                if Trace1Op.getOpcode().typesOfOperandsAreEqual() \
                        and Trace1Op.getOpcode().typesOfInputsAndOutputEqual():
                    if isinstance(Trace2Op, RoseBVAddOp):
                        Trace1 = [Trace2Op.getOperand(0)]
                        Trace2 = [Trace2Op]
                        continue
                return False
            if isinstance(Trace1Op, RoseArgument) \
                    and isinstance(Trace2Op, RoseArgument):
                print("ARGUMENTS:")
                print("TRACE1 OP:")
                Trace1Op.print()
                print("TRACE2 OP:")
                Trace2Op.print()
                if Trace1Op != Trace2Op:
                    return False
                continue
            if isinstance(Trace1Op, RoseBVExtractSliceOp) \
                    and isinstance(Trace2Op, RoseBVExtractSliceOp):
                Trace1.append(Trace1Op.getInputBitVector())
                Trace2.append(Trace2Op.getInputBitVector())
                continue
            if Trace1Op.isSizeChangingOp() and Trace2Op.isSizeChangingOp():
                Trace1.append(Trace1Op.getOperand(0))
                Trace2.append(Trace2Op.getOperand(0))
                continue
            assert len(Trace1Op.getOperands()) == 2 and len(
                Trace2Op.getOperands()) == 2
            for Operand in Trace1Op.getOperands():
                if not isinstance(Operand, RoseConstant):
                    Trace1.append(Operand)
            for Operand in Trace2Op.getOperands():
                if not isinstance(Operand, RoseConstant):
                    Trace2.append(Operand)

    # Remove any external dependencies
    FixExternalDependencyInBlock(Block, Context)
    print("FIXED BLOCK AFTER REMOVING EXTERNAL DEPENDENCIES")
    Block.print()

    # One of the bvadds must be coming from external source
    # (some other block or function argument).
    print("LOOKING FOR BVADDS FROM EXTERNAL SOURCE")
    TempValues = list()
    ExternalOperands = list()
    OpsWithExternalOperands = list()
    OpsWithTempVals = list()
    for Op in BVAddChain:
        print("OP IN BVADDCHAIN:")
        Op.print()
        ExternalOperandFound = False
        for Operand in Op.getOperands():
            print("Operand:")
            Operand.print()
            if Operand in BVAddChain:
                print("OPERAND IN BV ADD CHAIN")
                continue
            if Operand not in Block:
                print("OPERAND NOT IN BLOCK")
                ExternalOperands.append(Operand)
                ExternalOperandFound = True
                continue
            if isinstance(Operand, RoseBVExtractSliceOp) \
                    and isinstance(Operand.getInputBitVector(), RoseArgument):
                ExternalOperands.append(Operand)
                ExternalOperandFound = True
                continue
            print("--####Operand:")
            Operand.print()
            TempValues.append(Operand)
        if ExternalOperandFound == False:
            OpsWithTempVals.append(Op)
        else:
            OpsWithExternalOperands.append(Op)
    if TempValues == []:  # or ExternalOperands == []:
        print("TempValues is empty")
        return False
    # Limit the reduction pattern we analyze
    if len(OpsWithTempVals) == 0:
        print("OpsWithTempVals is empty")
        return False

    # Insert bvinserts after TempValues
    print("$$$$$BVInsertOp:")
    BVInsertOp.print()
    InsertOpLowIndex = BVInsertOp.getLowIndex()
    InsertOpHighIndex = BVInsertOp.getHighIndex()
    BitwidthVal = RoseConstant.create(BVInsertOp.getOutputBitwidth(),
                                      InsertOpLowIndex.getType())
    FirstOp = Block.getOperation(0)

    # Put the ExternalOperand ops in the beginning of the loop
    LastInsertOp = RoseUndefValue()
    for Index, Operand in enumerate(ExternalOperands):
        print("TEMP:")
        Operand.print()
        # Get the new op for external operand
        if isinstance(Operand, RoseOperation):
          NewOp = CloneAndInsertOperation(Operand, FirstOp, Context)
        else:
          NewOp = Operand
        print("NEWOP:")
        NewOp.print()
        # Get the indices
        if isinstance(InsertOpLowIndex, RoseOperation):
            LowIndex = CloneAndInsertOperation(InsertOpLowIndex, FirstOp, Context)
        else:
            print("NO NEW LOW OP")
            LowIndex = InsertOpLowIndex
        if isinstance(InsertOpHighIndex, RoseOperation):
            HighIndex = CloneAndInsertOperation(InsertOpHighIndex, FirstOp, Context)
        else:
            print("NO NEW HIGH OP")
            HighIndex = InsertOpHighIndex
        print("***LowIndex:")
        LowIndex.print()
        print("***HighIndex:")
        HighIndex.print()
        if Index != 0:
            ExtractOp = RoseBVExtractSliceOp.create(Context.genName(Operand.getName() + ".ext"),
                                                    BVInsertOp.getInputBitVector(),
                                                    LowIndex, HighIndex, BitwidthVal)
            print("NewOp:")
            NewOp.print()
            AddOp = RoseBVAddOp.create(Context.genName(Operand.getName() + ".acc"), [ExtractOp, NewOp])
            if isinstance(IntermediateOp, RoseBVSSaturateOp):
                InsertValue = RoseBVSSaturateOp.create(Context.genName(Operand.getName() + ".sat"),
                                                       AddOp, BitwidthVal)
            elif isinstance(IntermediateOp, RoseBVUSaturateOp):
                InsertValue = RoseBVUSaturateOp.create(Context.genName(Operand.getName() + ".sat"),
                                                       AddOp, BitwidthVal)
            else:
                InsertValue = AddOp
            InsertOp = RoseBVInsertSliceOp.create(InsertValue, BVInsertOp.getInputBitVector(),
                                                  LowIndex, HighIndex, BitwidthVal)
            Block.addOperationBefore(ExtractOp, FirstOp)
            Block.addOperationBefore(AddOp, FirstOp)
            if not isinstance(IntermediateOp, RoseUndefValue):
                Block.addOperationBefore(InsertValue, FirstOp)
            Block.addOperationBefore(InsertOp, FirstOp)
        else:
            InsertOp = RoseBVInsertSliceOp.create(NewOp, BVInsertOp.getInputBitVector(),
                                                  LowIndex, HighIndex, BitwidthVal)
            Block.addOperationBefore(InsertOp, FirstOp)
            LastInsertOp = InsertOp

    print("^^^^^FIXED BLOCK:")
    Block.print()

    # Insert bvinserts after TempValues
    for Op in TempValues:
        print("TEMP:")
        Op.print()
        InsertionPoint = Block.getPosOfOperation(Op) + 1
        InsertBefore = Block.getChild(InsertionPoint)
        if isinstance(InsertOpLowIndex, RoseOperation):
            LowIndex = CloneAndInsertOperation(
                InsertOpLowIndex, InsertBefore, Context)
        else:
            LowIndex = InsertOpLowIndex
        if isinstance(InsertOpHighIndex, RoseOperation):
            HighIndex = CloneAndInsertOperation(
                InsertOpHighIndex, InsertBefore, Context)
        else:
            HighIndex = InsertOpHighIndex
        print("LowIndex:")
        LowIndex.print()
        print("HighIndex:")
        HighIndex.print()
        ExtractOp = RoseBVExtractSliceOp.create(Context.genName(Op.getName() + ".ext"),
                                                BVInsertOp.getInputBitVector(),
                                                LowIndex, HighIndex, BitwidthVal)
        print("Op:")
        Op.print()
        AddOp = RoseBVAddOp.create(Context.genName(
            Op.getName() + ".acc"), [ExtractOp, Op])
        if isinstance(IntermediateOp, RoseBVSSaturateOp):
            InsertValue = RoseBVSSaturateOp.create(Context.genName(Op.getName() + ".sat"),
                                                   AddOp, BitwidthVal)
        elif isinstance(IntermediateOp, RoseBVUSaturateOp):
            InsertValue = RoseBVUSaturateOp.create(Context.genName(Op.getName() + ".sat"),
                                                   AddOp, BitwidthVal)
        else:
            InsertValue = AddOp
        InsertOp = RoseBVInsertSliceOp.create(InsertValue, BVInsertOp.getInputBitVector(),
                                              LowIndex, HighIndex, BitwidthVal)
        Block.addOperationBefore(ExtractOp, InsertBefore)
        Block.addOperationBefore(AddOp, InsertBefore)
        if not isinstance(IntermediateOp, RoseUndefValue):
            Block.addOperationBefore(InsertValue, InsertBefore)
        Block.addOperationBefore(InsertOp, InsertBefore)

    def EraseIndexingBVOperand(BVOp: RoseBitVectorOp):
        print("BVOp:")
        BVOp.print()
        if not isinstance(BVOp, RoseBVExtractSliceOp) \
          and not isinstance(BVOp, RoseBVInsertSliceOp):
          return
        print("EraseIndexingBVOperand")
        BVOp.print()
        ParentBlock = BVOp.getParent()
        assert not isinstance(ParentBlock, RoseUndefRegion)
        ErasedOps = []
        # Get all the indexing operations for bvinsert
        IndexingOps = []
        if isinstance(BVOp.getLowIndex(), RoseOperation):
            IndexingOps.append(BVOp.getLowIndex())
        if isinstance(BVOp.getHighIndex(), RoseOperation):
            IndexingOps.append(BVOp.getHighIndex())
        # Erase the bvinsert op
        ParentBlock.eraseOperation(BVOp)
        print("BV OP ERASED")
        ParentBlock.print()
        ErasedOps.append(BVOp)
        while len(IndexingOps) != 0:
            Op = IndexingOps.pop()
            print("--INDEXING OP:")
            Op.print()
            Op.getParent().print()
            # If we have already erased this op, continue
            if Op in ErasedOps:
                continue
            if ParentBlock.hasUsesOf(Op) == False:
                print("INDEXING OP HAS NO MORE USES")
                # We can erase Op, but first get the operands
                for Operand in Op.getOperands():
                    if isinstance(Operand, RoseOperation):
                        IndexingOps.append(Operand)
                # Erase the op
                ParentBlock.eraseOperation(Op)
                ErasedOps.append(Op)
        return ErasedOps

    print("---FIXED BLOCK:")
    Block.print()

    # Erase the bvinsert op
    print("ERASE INSERT OP")
    EraseIndexingBVOperand(BVInsertOp)
    if not isinstance(IntermediateOp, RoseUndefValue):
        Block.eraseOperation(IntermediateOp)

    ToBeRemoved = OpsWithExternalOperands + OpsWithTempVals
    while len(ToBeRemoved) != 0:
        UpdatedList = list()
        UpdatedList.extend(ToBeRemoved)
        for Op in reversed(UpdatedList):
            if Op.getNumUsers() == 0:
                Block.eraseOperation(Op)
                ToBeRemoved.remove(Op)

    # Now erase the external operands
    for Operand in ExternalOperands:
        EraseIndexingBVOperand(Operand)

    print("++++++FIXED BLOCK:")
    Block.print()

    # Create a new block
    FirstBlock = RoseBlock.create()
    ParentRegion = Block.getParent()
    ParentKey = ParentRegion.getKeyForChild(Block)
    Index = ParentRegion.getPosOfChild(Block, ParentKey)
    ParentRegion.addRegionBefore(Index, FirstBlock, ParentKey)

    if len(OpsWithExternalOperands) != 0:
        # Add instructions to the first block
        OpList = list()
        OpList.extend(Block.getOperations())
        for Op in OpList:
            Block.removeOperation(Op)
            FirstBlock.addOperation(Op)
            if Op == LastInsertOp:
                break
    else:
        # Create a new constant as big as BVInsertOp.getInputVector()
        print("BVInsertOp:")
        BVInsertOp.print()
        IndexingVals = GatherIndexingValues(BVInsertOp)
        print("len(IndexingVals):")
        print(IndexingVals)
        ValueToValueMap = dict()
        ValueToValueMap[BVInsertOp.getInputBitVector(
        )] = BVInsertOp.getInputBitVector()
        print("---FirstBlock:")
        FirstBlock.print()
        for IndexingVal in IndexingVals:
            print("INDEXING Val:")
            IndexingVal.print()
            if isinstance(IndexingVal, RoseOperation):
                # If the operands are non-operations, add them to the
                # ValueToValue map since we do not want any changes to them.
                for Operand in IndexingVal.getOperands():
                    if not isinstance(Operand, RoseOperation):
                        ValueToValueMap[Operand] = Operand
                    print("OPERNAD:")
                    Operand.print()
                    print(Operand.ID)
                ClonedIndexingOp = IndexingVal.cloneOperation(
                    ValueToValueMap=ValueToValueMap, ChangeID=True)
                print("CLONE OPERATION ClonedIndexingOp:")
                ClonedIndexingOp.print()
                ClonedIndexingOp.setName(Context.genName(
                    ClonedIndexingOp.getName() + "."))
                print("ClonedIndexingOp:")
                ClonedIndexingOp.print()
                for Operand in ClonedIndexingOp.getOperands():
                    print("CLONED OPERNAD:")
                    Operand.print()
                    print(Operand.ID)
                FirstBlock.addOperation(ClonedIndexingOp)
                print("Mapping IndexingOp to ClonedIndexingOp:")
                IndexingVal.print()
                print("IndexingOp.id:")
                print(IndexingVal.ID)
                ClonedIndexingOp.print()
                print("ClonedIndexingOp.id:")
                print(ClonedIndexingOp.ID)
                ValueToValueMap[IndexingVal] = ClonedIndexingOp
            else:
                # No need to clone non-operation values
                ValueToValueMap[IndexingVal] = IndexingVal
        print("FirstBlock:")
        FirstBlock.print()
        # Replace the low index and high of the ClonedBVInsertOp
        OldLowIndex = BVInsertOp.getLowIndex()
        OldHighIndex = BVInsertOp.getHighIndex()
        print("OLD  LOW IDNEX:")
        OldLowIndex.print()
        print("OldLowIndex.id:")
        print(OldLowIndex.ID)
        print("OLD HIGH INDEX:")
        OldHighIndex.print()
        print("OldHighIndex.id:")
        print(OldHighIndex.ID)
        ClonedBVInsertOp = BVInsertOp.cloneOperation(ChangeID=True,
                                                     ValueToValueMap=ValueToValueMap)
        FirstBlock.addOperation(ClonedBVInsertOp)
        ClonedBVInsertOp.setOperand(ClonedBVInsertOp.getLowIndexPos(),
                                    ValueToValueMap[OldLowIndex])
        ClonedBVInsertOp.setOperand(ClonedBVInsertOp.getHighIndexPos(),
                                    ValueToValueMap[OldHighIndex])
        ConstantVal = RoseConstant.create(
            0, BVInsertOp.getInputBitVector().getType())
        ExtractedVal = RoseBVExtractSliceOp.create(Context.genName("%zero.const"),
                                                   ConstantVal, ClonedBVInsertOp.getLowIndex(),
                                                   ClonedBVInsertOp.getHighIndex(), BitwidthVal)
        ClonedBVInsertOp.setOperand(0, ExtractedVal)
        FirstBlock.addOperationBefore(ExtractedVal, ClonedBVInsertOp)
    VisitedRegion.add(FirstBlock)
    print("FIRST BLOCK:")
    FirstBlock.print()
    print("FIXED BLOCK:")
    Block.print()
    PrintFunctionInfo(Function)
    return True


def RunRerollerOnFunction(Function: RoseFunction, Context: RoseContext):
    print("RUN ON REROLLER FUNCTION")
    print("FUNCTION:")
    Function.print()
    # Mapping root instruction to list of redundant instructions
    BlockToRerollableCandidatesMap = dict()

    # Run loop reroller on the given function
    AbstractionToReductionInfo, BlockToRerollableCandidatesMap = \
        RunRerollerOnRegion(Function, BlockToRerollableCandidatesMap, Context)
    # Time to perform some rerolling
    PerformRerolling(BlockToRerollableCandidatesMap,
                     AbstractionToReductionInfo, Context)


def PrintFunctionInfo(Function: RoseFunction):
    print("PrintFunctionInfo")
    Function.print()
    for Block in Function.getRegionsOfType(RoseBlock):
        for Op in Block:
            # if isinstance(Op, RoseBVInsertSliceOp):
            #  print("bvinsert op:")
            Op.print()
            if isinstance(Op, RoseMulOp):
                for Operand in Op.getOperands():
                    print("OPERAND:")
                    Operand.print()
                    print(Operand.ID)
            #  print("Op.getInputBitVector():")
            #  Op.getInputBitVector().print()
            #  print(Op.getInputBitVector().ID)
            #  print("Function.getReturnValue():")
            #  Function.getReturnValue().print()
            #  print(Function.getReturnValue().ID)


# Runs Loop reroller
def Run(Function: RoseFunction, Context: RoseContext):
    print("RUN LOOP REROLLER")
    Function.print()
    Context.print()
    PrintFunctionInfo(Function)
    RunRerollerOnFunction(Function, Context)
    print("___________")
    print("\n\n\n\n")
    print("Function:")
    Function.print()
    PrintFunctionInfo(Function)
