###################################################################
#
# Some utility functions that could be useful for Similarity
# Checker.
#
###################################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


# The cananonical for a function is a loop nest with
# one outer loop and at least one inner loop.
def IsFunctionInCanonicalForm(Function: RoseFunction):
    # This function must not have a parent
    if Function.isTopLevelFunction() == False:
        return False
    # This function must not contain other functions
    if Function.containsRegionOfType(RoseFunction) == True:
        return False
    OuterLoopFound = False
    InnerLoopsFound = False
    for Region in Function:
        # Make sure there aren't more than one bvinserts in a block
        if isinstance(Region, RoseBlock):
            BVInsertFound = False
            for Op in Region:
                if isinstance(Op, RoseBVInsertSliceOp):
                    if BVInsertFound == True:
                        return False
                    BVInsertFound = True
            continue
        # The given function cannot contain regions other than loops
        if not isinstance(Region, RoseForLoop):
            return False
        if OuterLoopFound == True:
            return False
        OuterLoopFound = True
        InnerLoopStep = RoseUndefValue()
        for SubRegion in Region:
            # Make sure there aren't more than one bvinserts in a block
            if isinstance(SubRegion, RoseBlock):
                BVInsertFound = False
                for Op in SubRegion:
                    if isinstance(Op, RoseBVInsertSliceOp):
                        if BVInsertFound == True:
                            return False
                        BVInsertFound = True
                continue
            # This level of loop mustn't contain regions other than loops
            if not isinstance(SubRegion, RoseForLoop):
                return False
            InnerLoopsFound = True
            if InnerLoopStep == RoseUndefValue():
                InnerLoopStep = SubRegion.getStep()
            else:
                if InnerLoopStep.getValue() != SubRegion.getStep().getValue():
                    return False
            InnerInnerLoopStep = RoseUndefValue()
            for SubSubRegion in SubRegion:
                # Make sure there aren't more than one bvinserts in a block
                if isinstance(SubSubRegion, RoseBlock):
                    BVInsertFound = False
                    for Op in SubSubRegion:
                        if isinstance(Op, RoseBVInsertSliceOp):
                            if BVInsertFound == True:
                                return False
                            BVInsertFound = True
                    continue
                if isinstance(SubSubRegion, RoseForLoop):
                    if InnerInnerLoopStep == RoseUndefValue():
                        InnerInnerLoopStep = SubSubRegion.getStep()
                    else:
                        if InnerInnerLoopStep.getValue() != SubSubRegion.getStep().getValue():
                            return False
    return (OuterLoopFound == True and InnerLoopsFound == True)


def GetBVExtractsToBeSkipped(Abstraction):
    # Gather bvextract ops that index into masks and serve as conditions for
    # cond regions in the function. We will not need to extract output bitwidths
    # of these ops because the bitwidth of conditions for bitwidths is always one.
    assert not isinstance(Abstraction, RoseBlock)
    SkipBVExtracts = set()
    CondRegions = list()
    if Abstraction.getKeys() == None:
        CondRegions.extend(Abstraction.getRegionsOfType(RoseCond))
    else:
        for Key in Abstraction.getKeys():
            CondRegions.extend(Abstraction.getRegionsOfType(RoseCond, Key=Key))
    if isinstance(Abstraction, RoseCond):
        CondRegions = [Abstraction] + CondRegions
    for CondRegion in CondRegions:
        Worklist = list()
        Worklist.append(CondRegion.getCondition())
        while len(Worklist) != 0:
            Operation = Worklist.pop()
            if not isinstance(Operation, RoseOperation):
                continue
            if Operation == CondRegion.getCondition():
                # This thing only applies if the conditions are coming from
                # extracting bits from masks.
                if not isinstance(Operation, RoseBVExtractSliceOp):
                    if isinstance(Operation, RoseComparisonBitVectorOp):
                        Worklist.extend(Operation.getOperands())
                    continue
            if not isinstance(Operation, RoseBVExtractSliceOp):
                Worklist.extend(Operation.getOperands())
                continue
            SkipBVExtracts.add(Operation)
            break
    # Iterate over some blocks
    BlockList = list()
    if Abstraction.getKeys() == None:
        BlockList.extend(Abstraction.getRegionsOfType(RoseBlock))
    else:
        for Key in Abstraction.getKeys():
            BlockList.extend(Abstraction.getRegionsOfType(RoseBlock, Key=Key))
    for Block in BlockList:
        for Op in Block:
            if isinstance(Op, RoseSelectOp):
                Worklist = list()
                Worklist.append(Op.getCondition())
                while len(Worklist) != 0:
                    Operation = Worklist.pop()
                    if not isinstance(Operation, RoseOperation):
                        continue
                    if Operation == Op.getCondition():
                        # This thing only applies if the conditions are coming from
                        # extracting bits from masks.
                        if not isinstance(Operation, RoseBVExtractSliceOp):
                            if isinstance(Operation, RoseComparisonBitVectorOp):
                                Worklist.extend(Operation.getOperands())
                            continue
                    if not isinstance(Operation, RoseBVExtractSliceOp):
                        Worklist.extend(Operation.getOperands())
                        continue
                    SkipBVExtracts.add(Operation)
                    break
    print("SkipBVExtracts:")
    for Op in SkipBVExtracts:
        print("OP:")
        Op.print()
    return SkipBVExtracts


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output
# of the smallest bitwidth.
def GetOpDeterminingLoopBoundsInBlockList(Function: RoseFunction, BlockList: list,
                                          SkipBVExtracts: set = set()):
    # Sanity check
    assert isinstance(Function, RoseFunction)
    # Now gather the bvinserts and bvextracts.
    FunctionOutput = Function.getReturnValue()
    Params = Function.getArgs()
    BVInsertOps = list()
    BVExtractOps = list()
    Result = list()
    # BlockToBVInsertOp = dict()
    for Block in BlockList:
        print("BLOCK IN BLOCKLIST:")
        Block.print()
        assert isinstance(Block, RoseBlock)
        assert Function == Block.getFunction()
        for Op in reversed(Block.getOperations()):
            if isinstance(Op, RoseBVInsertSliceOp):
                if Op.getInputBitVector() == FunctionOutput:
                    if isinstance(Op.getOutputBitwidth(), RoseArgument):
                        # if Block in BlockToBVInsertOp:
                        #  return None
                        Result.append(Op)
                        # BlockToBVInsertOp[Block] = Op
                        continue
                    # if Block in BlockToBVInsertOp:
                    # return None
                    BVInsertOps.append(Op)
                    # BlockToBVInsertOp[Block] = Op
                    continue
            if isinstance(Op, RoseBVExtractSliceOp):
                if Op in SkipBVExtracts:
                    continue
                if Op.getInputBitVector() in Params:
                    if isinstance(Op.getOutputBitwidth(), RoseArgument):
                        Result.append(Op)
                        continue
                    print("RELEVANT BV EXTRACT OP:")
                    Op.print()
                    BVExtractOps.append(Op)

    # If we already have some results in the result list, just return that
    if len(Result) != 0:
        print("RETUTNING RESULT")
        return Result

    # The bvinserts and bvextracts have output bitwidths that are integers
    # (and not rose values).
    BitWidth = RoseUndefValue()
    if len(BVInsertOps) != 0:
        # But first make sure the bitwidth for all bvinserts is the same.
        BitWidth = BVInsertOps[0].getOutputBitwidth()
        Result.append(BVInsertOps[0])
        # Sanity check
        for Op in BVInsertOps[1:]:
            if Op.getOutputBitwidth() < BitWidth:
                BitWidth = Op.getOutputBitwidth()
                Result.clear()
            Result.append(Op)

    if len(BVExtractOps) != 0:
        # Now check get extract ops with smallest output bitwidths
        ExtractBitWidth = BVExtractOps[0].getOutputBitwidth()
        for Op in BVExtractOps[1:]:
            Op.print()
            if ExtractBitWidth > Op.getOutputBitwidth():
                ExtractBitWidth = Op.getOutputBitwidth()
        if not isinstance(BitWidth, RoseUndefValue):
            if BitWidth > ExtractBitWidth:
                BitWidth = ExtractBitWidth
                # No bvinsert op is good here
                Result.clear()
        else:
            BitWidth = ExtractBitWidth
        for Op in BVExtractOps:
            print("Op.getOutputBitwidth():")
            print(Op.getOutputBitwidth())
            print("BitWidth:")
            print(BitWidth)
            if Op.getOutputBitwidth() == BitWidth:
                Result.append(Op)
    if len(Result) != 0:
        return Result
    return None


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output
# of the smallest bitwidth.
def GetOpDeterminingLoopBoundsFor(RegionList: list, SkipBVExtracts: set = set()):
    print("FIX BOUNDS OF LOOP FOR REGION LIST")
    # Get all the blocks in this region list at level 0.
    BlockList = list()
    for Region in RegionList:
        if isinstance(Region, RoseBlock):
            BlockList.append(Region)
            continue
        if Region.getKeys() == None:
            BlockList.extend(Region.getRegionsOfType(RoseBlock, Level=0))
        else:
            for Key in Region.getKeys():
                BlockList.extend(Region.getRegionsOfType(
                    RoseBlock, Level=0, Key=Key))
    # Take into account any cond blocks in the region list
    CondRegions = list()
    for Region in RegionList:
        if isinstance(Region, RoseBlock):
            continue
        if Region.getKeys() == None:
            CondRegions.extend(Region.getRegionsOfType(RoseCond, Level=0))
        else:
            for Key in Region.getKeys():
                CondRegions.extend(Region.getRegionsOfType(
                    RoseCond, Level=0, Key=Key))
    for CondRegion in CondRegions:
        CondRegionBlockList = list()
        for Key in CondRegion.getKeys():
            CondRegionBlockList.extend(
                CondRegion.getRegionsOfType(RoseBlock, Level=0, Key=Key))
        print("CondRegionBlockList:")
        for Block in CondRegionBlockList:
            print("BLOCK:")
            Block.print()
            print("*********")
        BlockList.extend(CondRegionBlockList)

    # Gather bvextract ops that index into masks and serve as conditions for
    # cond regions in the function. We will not need to extract output bitwidths
    # of these ops because the bitwidth of conditions for bitwidths is always one.
    print("------len(RegionList):")
    print(len(RegionList))
    for Region in RegionList:
        if isinstance(Region, RoseBlock):
            continue
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        SkipBVExtracts.update(GetBVExtractsToBeSkipped(Region))

    return GetOpDeterminingLoopBoundsInBlockList(RegionList[0].getFunction(), BlockList, SkipBVExtracts)


def HasInlinableSubRegion(Function: RoseFunction):
    InsertOps = list()
    ExtractOps = list()
    BlockList = Function.getRegionsOfType(RoseBlock)
    for Block in BlockList:
        for Op in Block:
            if isinstance(Op, RoseBVInsertSliceOp):
                if not isinstance(Op.getInputBitVector(), RoseArgument):
                    if Op.getInputBitVector() != Function.getReturnValue():
                        InsertOps.append(Op)
                continue
            if isinstance(Op, RoseBVExtractSliceOp):
                if not isinstance(Op.getInputBitVector(), RoseArgument):
                    if Op.getInputBitVector() != Function.getReturnValue():
                        ExtractOps.append(Op)
                continue
    if len(ExtractOps) == 0:
        return
    if len(InsertOps) == 0:
        return
    # Check if extract ops and insert ops are in disjoint regions.
    # This means that the only common parent region must be the function.
    # xtractOpToInsertRegion = dict()
    # InsertRegionToExtractOps = dict()
    InsertRegions = list()
    for InsertOp in InsertOps:
        for ExtractOp in ExtractOps:
            if ExtractOp.getInputBitVector() != InsertOp.getInputBitVector():
                continue
            InsertRegion = InsertOp.getParent()
            ExtractRegion = ExtractOp.getParent()
            if InsertRegion == ExtractRegion:
                continue
            print("InsertRegion:")
            InsertRegion.print()
            print("InsertRegion.getParent():")
            InsertRegion.getParent().print()
            print("ExtractRegion:")
            ExtractRegion.print()
            print("ExtractRegion.getParent():")
            ExtractRegion.getParent().print()
            while not isinstance(InsertRegion.getParent(), RoseFunction):
                InsertRegion = InsertRegion.getParent()
            while not isinstance(ExtractRegion.getParent(), RoseFunction):
                ExtractRegion = ExtractRegion.getParent()
            print("---InsertRegion:")
            InsertRegion.print()
            print("---InsertRegion.getParent():")
            InsertRegion.getParent().print()
            print("---ExtractRegion:")
            ExtractRegion.print()
            print("---ExtractRegion.getParent():")
            ExtractRegion.getParent().print()
            if isinstance(InsertRegion.getParent(), RoseFunction):
                assert isinstance(ExtractRegion.getParent(), RoseFunction)
                # ExtractOpToInsertRegion[ExtractOp] = InsertRegion
                # if InsertRegion not in InsertRegionToExtractOps:
                #  InsertRegionToExtractOps[InsertRegion] = set()
                # InsertRegionToExtractOps[InsertRegion].add(ExtractOp)
                if InsertRegion not in InsertRegions:
                    InsertRegions.append(InsertRegion)
    return InsertRegions


def GenConcreteValue(ConcreteValue: RoseConstant):
    assert isinstance(ConcreteValue, RoseConstant)
    if isinstance(ConcreteValue.getType(), RoseBitVectorType):
        if ConcreteValue.getType().getBitwidth() >= 4:
            Input = "(bv #x"
            HexVal = hex(ConcreteValue.getValue())
            HexValString = str(HexVal[2:])
            LeftOver = ConcreteValue.getType().getBitwidth() - len(HexValString)
            for _ in range(LeftOver):
                HexValString = "0" + HexValString
            Input += HexValString
            Input += " " + str(ConcreteValue.getType().getBitwidth()) + ")"
        else:
            Input = "(bv #b"
            HexVal = bin(ConcreteValue.getValue())
            HexValString = str(HexVal[2:])
            LeftOver = ConcreteValue.getType().getBitwidth() - len(HexValString)
            for _ in range(LeftOver):
                HexValString = "0" + HexValString
            Input += HexValString
            Input += " " + str(ConcreteValue.getType().getBitwidth()) + ")"
    else:
        assert isinstance(ConcreteValue.getType(), RoseIntegerType) \
            or isinstance(ConcreteValue.getType(), RoseBooleanType)
        Input = str(ConcreteValue.getValue())
    return Input


# The names in Rosette IR need to be changed to names of instructions
# in LLVM IR.
def RoseIRToLLVM(Name: str):
    assert isinstance(Name, str)
    NameList = list(Name)
    Index = 0
    for Char in NameList:
        if Char != "_":
            break
        Index += 1
    Name = "".join(NameList[Index:])
    return "hydride_" + Name
