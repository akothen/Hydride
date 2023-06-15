##############################################################
#
# Class in this file keeps track of state of a Function in
# Rosette IR and other information from each compilation
# stage.
#
##############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseContext import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseCodeGenerator import RoseCodeGenerator

import uuid


class RoseFunctionInfo():
    def __init__(self):
        self.ID = uuid.uuid4()
        self.FunctionAtStages = list()
        self.TargetAgnosticFunction = RoseUndefRegion()
        self.TargetSpecificFunction = RoseUndefRegion()
        self.ArgsToConcreteValMap = dict()
        self.InstSema = None
        self.Context = None
        self.CodeGenerator = None
        self.InElemType = None
        self.OutElemType = None
        self.InVectorLength = None
        self.OutVectorLength = None
        self.LaneSize = None
        self.LaneSizeIndex = None
        self.InElemTypeIndex = None
        self.OutElemTypeIndex = None
        self.InVectorLengthIndex = None
        self.OutVectorLengthIndex = None
        self.Signedness = None
        self.IsSIMD = None
        self.IsShuffle = None

    def __hash__(self):
        return hash(self.ID)

    def destroyAllRecentFunctionVersions(self, KeepOldestFunction: bool = True):
        if KeepOldestFunction:
            self.FunctionAtStages = [self.FunctionAtStages[0]]
        else:
            self.FunctionAtStages = list()

    def getInElemType(self):
        return self.InElemType

    def getOutElemType(self):
        return self.OutElemType

    def getInVectorLength(self):
        return self.InVectorLength

    def getOutVectorLength(self):
        return self.OutVectorLength

    def getLaneSize(self):
        return self.LaneSize

    def getInElemTypeIndex(self):
        return self.InElemTypeIndex

    def getOutElemTypeIndex(self):
        return self.OutElemTypeIndex

    def getInVectorLengthIndex(self):
        return self.InVectorLengthIndex

    def getOutVectorLengthIndex(self):
        return self.OutVectorLengthIndex

    def getLaneSizeIndex(self):
        return self.LaneSizeIndex

    def getSignedness(self):
        return self.Signedness

    def isSIMD(self):
        return self.IsSIMD

    def isShuffle(self):
        return self.IsShuffle

    def setInElemType(self, ElemType):
        self.InElemType = ElemType

    def setOutElemType(self, ElemType):
        self.OutElemType = ElemType

    def setInVectorLength(self, Length: int):
        self.InVectorLength = Length

    def setOutVectorLength(self, Length: int):
        self.OutVectorLength = Length

    def setLaneSize(self, Size: int):
        self.LaneSize = Size

    def setInElemTypeIndex(self, Idx: int):
        self.InElemTypeIndex = Idx

    def setOutElemTypeIndex(self, Idx: int):
        self.OutElemTypeIndex = Idx

    def setInVectorLengthIndex(self, Idx: int):
        self.InVectorLengthIndex = Idx

    def setOutVectorLengthIndex(self, Idx: int):
        self.OutVectorLengthIndex = Idx

    def setLaneSizeIndex(self, Idx: int):
        self.LaneSizeIndex = Idx

    def setSignedness(self, Signedness: bool):
        self.Signedness = Signedness

    def setIsSIMD(self, IsSIMD: bool):
        self.IsSIMD = IsSIMD

    def setIsShuffle(self, IsShuffle: bool):
        self.IsShuffle = IsShuffle

    def addTargetSpecificFunction(self, Function: RoseFunction):
        self.TargetSpecificFunction = Function

    def addTargetAgnosticFunction(self, Function: RoseFunction):
        self.TargetAgnosticFunction = Function

    def addArgsToConcreteMap(self, ArgsToConcreteValMap: dict):
        # Sanity checking
        for Arg, _ in ArgsToConcreteValMap.items():
            assert Arg.getFunction() in self.FunctionAtStages
        self.ArgsToConcreteValMap = ArgsToConcreteValMap

    def eraseConcreteValForArg(self, Arg: RoseArgument):
        del self.ArgsToConcreteValMap[Arg]

    def getConcreteValFor(self, Arg: RoseFunction):
        assert Arg in self.ArgsToConcreteValMap
        return self.ArgsToConcreteValMap[Arg]

    def argHasConcreteVal(self, Arg: RoseArgument):
        return Arg in self.ArgsToConcreteValMap

    def getArgsToConcreteValMap(self):
        return self.ArgsToConcreteValMap

    def getRosetteCode(self):
        return self.RosetteCode

    def addRosetteCode(self, RosetteCode: str):
        self.RosetteCode = RosetteCode

    def addContext(self, Context: RoseContext):
        assert isinstance(Context, RoseContext)
        self.Context = Context

    def getContext(self):
        return self.Context

    def addRawSemantics(self, Sema):
        self.InstSema = Sema

    def getRawSemantics(self):
        return self.InstSema

    def addFunctionAtNewStage(self, Function: RoseFunction):
        self.FunctionAtStages.append(Function)

    def getOriginalFunction(self):
        return self.FunctionAtStages[0]

    def getLatestFunction(self):
        if len(self.FunctionAtStages) == 0:
            return RoseUndefRegion()
        return self.FunctionAtStages[len(self.FunctionAtStages) - 1]

    def addCodeGenerator(self, CodeGenerator: RoseCodeGenerator):
        # assert isinstance(CodeGenerator, RoseCodeGenerator)
        self.CodeGenerator = CodeGenerator

    def getCodeGenerator(self):
        return self.CodeGenerator

    def getTargetAgnoticFunction(self):
        return self.TargetAgnosticFunction

    def getTargetSpecificFunction(self):
        return self.TargetSpecificFunction

    def computeSemanticsInfo(self):
        self.computeSemanticsInfoFromTargetSpecficFunction()
        self.computeSemanticsInfoFromTargetAgnosticFunction()

    def computeSemanticsInfoFromTargetSpecficFunction(self):
        # Function is expected to be canonicalized
        Function = self.getTargetSpecificFunction()
        print("^^^^^^^^^^^^^^TARGET SPECIFIC FUNCTION:")
        Function.print()
        # Go over all the blocks in the function
        BlockList = Function.getRegionsOfType(RoseBlock)
        for Block in BlockList:
            for Op in reversed(Block.getOperations()):
                if isinstance(Op, RoseBVInsertSliceOp):
                    if Op.getInputBitVector() == Function.getReturnValue():
                        if not isinstance(Op.getInsertValue(), RoseConstant):
                            Loop = Block.getParentOfType(RoseForLoop)
                            if not isinstance(Loop, RoseUndefRegion):
                                OuterLoop = Loop.getParentOfType(RoseForLoop)
                                if not isinstance(OuterLoop, RoseUndefRegion):
                                    self.OutElemType = Op.getOutputBitwidth()
                                    LoopStep = OuterLoop.getStep()
                                    self.LaneSize = LoopStep.getValue()
                                    self.OutVectorLength = Op.getInputBitVector().getType().getBitwidth()
                                    if HasReductionPattern(Block):
                                        self.IsSIMD = False
                                    else:
                                        self.IsSIMD = True
                                    print("self.OutVectorLength:")
                                    print(self.OutVectorLength)
                    continue
                if isinstance(Op, RoseBVExtractSliceOp):
                    if Op.getInputBitVector() != Function.getReturnValue():
                        if isinstance(Op.getInputBitVector(), RoseArgument):
                            Bitwidth = Op.getOutputBitwidth()
                            if Bitwidth != 1:
                                self.InElemType = Op.getOutputBitwidth()
                                self.InVectorLength = Op.getInputBitVector().getType().getBitwidth()
                    continue
                if isinstance(Op, RoseBVSdivOp) \
                        or isinstance(Op, RoseBVSremOp) \
                        or isinstance(Op, RoseBVSmaxOp) \
                        or isinstance(Op, RoseBVSminOp) \
                        or isinstance(Op, RoseBVSignExtendOp) \
                        or isinstance(Op, RoseBVSSaturateOp) \
                        or (isinstance(Op, RoseSaturableBitVectorOp) and Op.noSignedWrapAllowed()) \
                        or (isinstance(Op, RoseGeneralSaturableBitVectorOp) and Op.noSignedWrapAllowed()) \
                        or isinstance(Op, RoseBVSLTOp) \
                        or isinstance(Op, RoseBVSLEOp) \
                        or isinstance(Op, RoseBVSGTOp) \
                        or isinstance(Op, RoseBVSGEOp):
                    self.Signedness = 1
                    continue
                if isinstance(Op, RoseBVUdivOp) \
                        or isinstance(Op, RoseBVUremOp) \
                        or isinstance(Op, RoseBVUmaxOp) \
                        or isinstance(Op, RoseBVUminOp) \
                        or isinstance(Op, RoseBVZeroExtendOp) \
                        or isinstance(Op, RoseBVUSaturateOp) \
                        or (isinstance(Op, RoseSaturableBitVectorOp) and Op.noUnsignedWrapAllowed()) \
                        or (isinstance(Op, RoseGeneralSaturableBitVectorOp) and Op.noUnsignedWrapAllowed()) \
                        or isinstance(Op, RoseBVULTOp) \
                        or isinstance(Op, RoseBVULEOp) \
                        or isinstance(Op, RoseBVUGTOp) \
                        or isinstance(Op, RoseBVUGEOp):
                    if self.Signedness == None:
                        self.Signedness = 0
                    continue
        return

    def computeSemanticsInfoFromTargetAgnosticFunction(self):
        print("computeSemanticsInfoFromTargetAgnosticFunction")
        # Function is expected to be canonicalized
        Function = self.getTargetAgnoticFunction()
        print("^^^^^^^^^^^^^^TARGET AGNOSTIC FUNCTION:")
        Function.print()
        # Go over all the blocks in the function
        BlockList = Function.getRegionsOfType(RoseBlock)
        for Block in BlockList:
            for Op in reversed(Block.getOperations()):
                if isinstance(Op, RoseBVInsertSliceOp):
                    if Op.getInputBitVector() == Function.getReturnValue():
                        if not isinstance(Op.getInsertValue(), RoseConstant):
                            Loop = Block.getParentOfType(RoseForLoop)
                            print("INNER LOOP:")
                            Loop.print()
                            if not isinstance(Loop, RoseUndefRegion):
                                OuterLoop = Loop.getParentOfType(RoseForLoop)
                                print("OUTER LOOP:")
                                OuterLoop.print()
                                if not isinstance(OuterLoop, RoseUndefRegion):
                                    print("Op:")
                                    Op.print()
                                    print("Op.getOutputBitwidth():")
                                    print(Op.getOutputBitwidth())
                                    if isinstance(Op.getOutputBitwidth(), RoseArgument):
                                        self.OutElemTypeIndex = Op.getOutputBitwidth().getArgIndex()
                                        print("self.OutElemTypeIndex:")
                                        print(self.OutElemTypeIndex)
                                    else:
                                        self.OutElemTypeIndex = None
                                        print("self.OutElemTypeIndex:")
                                        print(self.OutElemTypeIndex)
                                    LoopStep = OuterLoop.getStep()
                                    print("LoopStep:")
                                    print(LoopStep)
                                    if not isinstance(LoopStep, RoseConstant):
                                        self.LaneSizeIndex = LoopStep.getArgIndex()
                                        print("self.LaneSizeIndex:")
                                        print(self.LaneSizeIndex)
                                    else:
                                        self.LaneSizeIndex = None
                                        print("self.LaneSizeIndex:")
                                        print(self.LaneSizeIndex)
                                    # If block is a reduction block then the output vector
                                    # length is different.
                                    LoopEnd = OuterLoop.getEndIndex()
                                    print("LoopEnd:")
                                    print(LoopEnd)
                                    if not isinstance(LoopEnd, RoseConstant):
                                        self.OutVectorLengthIndex = LoopEnd.getArgIndex()
                                        print("self.OutVectorLengthIndex:")
                                        print(self.OutVectorLengthIndex)
                                    else:
                                        self.OutVectorLengthIndex = None
                                        print("self.OutVectorLengthIndex:")
                                        print(self.OutVectorLengthIndex)
                                    if HasReductionPattern(Block):
                                        self.OutVectorLengthIndex = None
                                        print("self.OutVectorLengthIndex:")
                                        print(self.OutVectorLengthIndex)
                    continue
                if isinstance(Op, RoseBVExtractSliceOp):
                    if Op.getInputBitVector() != Function.getReturnValue():
                        print("Op:")
                        Op.print()
                        if isinstance(Op.getInputBitVector(), RoseArgument):
                            Bitwidth = Op.getOutputBitwidth()
                            print("Op.getOutputBitwidth():")
                            print(Op.getOutputBitwidth())
                            if isinstance(Bitwidth, RoseValue):
                                Bitwidth = self.ArgsToConcreteValMap[Bitwidth].getValue(
                                )
                            if Bitwidth != 1:
                                if isinstance(Op.getOutputBitwidth(), RoseArgument):
                                    self.InElemTypeIndex = Op.getOutputBitwidth().getArgIndex()
                                    print("self.InElemTypeIndex:")
                                    print(self.InElemTypeIndex)
                                else:
                                    self.InElemTypeIndex = None
                                    print("self.InElemTypeIndex:")
                                    print(self.InElemTypeIndex)
                                if not isinstance(Op.getLowIndex(), RoseArgument):
                                    Loop = Block.getParentOfType(RoseForLoop)
                                    if not isinstance(Loop, RoseUndefRegion):
                                        OuterLoop = Loop.getParentOfType(
                                            RoseForLoop)
                                        if not isinstance(OuterLoop, RoseUndefRegion):
                                            LoopEnd = OuterLoop.getEndIndex()
                                            if isinstance(LoopEnd, RoseArgument):
                                                self.InVectorLengthIndex = LoopEnd.getArgIndex()
                                                print(
                                                    "self.InVectorLengthIndex:")
                                                print(self.InVectorLengthIndex)
                                            else:
                                                self.InVectorLengthIndex = None
                                                print(
                                                    "self.InVectorLengthIndex:")
                                                print(self.InVectorLengthIndex)
                    continue
        return

    def print(self):
        print("******* Printing Function Info ********")
        print("Function:")
        self.getLatestFunction().print()
        print("Semantics Info:")
        print(self.InstSema)
        print("InElemType:")
        print(self.InElemType)
        print("InElemTypeIndex:")
        print(self.InElemTypeIndex)
        print("OutElemType:")
        print(self.OutElemType)
        print("OutElemTypeIndex:")
        print(self.OutElemTypeIndex)
        print("InVectorLength:")
        print(self.InVectorLength)
        print("InVectorLengthIndex:")
        print(self.InVectorLengthIndex)
        print("OutVectorLength:")
        print(self.OutVectorLength)
        print("OutVectorLengthIndex:")
        print(self.OutVectorLengthIndex)
        print("LaneSize:")
        print(self.LaneSize)
        print("LaneSizeIndex:")
        print(self.LaneSizeIndex)
        print("Signedness:")
        print(self.Signedness)
        print("SIMD?:")
        print(self.IsSIMD)
        print("***************************************")
