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


class RoseFunctionInfo():
  def __init__(self):
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
    self.IsSIMD = None

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

  def isSIMD(self):
    return self.IsSIMD

  def addTargetSpecificFunction(self, Function : RoseFunction):
    self.TargetSpecificFunction = Function

  def addTargetAgnosticFunction(self, Function : RoseFunction):
    self.TargetAgnosticFunction = Function

  def addArgsToConcreteMap(self, ArgsToConcreteValMap : dict):
    # Sanity checking
    for Arg, _ in ArgsToConcreteValMap.items():
      assert Arg.getFunction() in self.FunctionAtStages
    self.ArgsToConcreteValMap = ArgsToConcreteValMap
  
  def getConcreteValFor(self, Arg : RoseFunction):
    assert Arg in self.ArgsToConcreteValMap
    return self.ArgsToConcreteValMap[Arg]

  def argHasConcreteVal(self, Arg : RoseFunction):
    return Arg in self.ArgsToConcreteValMap

  def getArgsToConcreteValMap(self):
    return self.ArgsToConcreteValMap
  
  def getRosetteCode(self):
    return self.RosetteCode
  
  def addRosetteCode(self, RosetteCode : str):
    self.RosetteCode = RosetteCode

  def addContext(self, Context : RoseContext):
    assert isinstance(Context, RoseContext)
    self.Context = Context
  
  def getContext(self):
    return self.Context

  def addRawSemantics(self, Sema):
    self.InstSema = Sema

  def getRawSemantics(self):
    return self.InstSema
  
  def addFunctionAtNewStage(self, Function : RoseFunction):
    self.FunctionAtStages.append(Function)
  
  def getOriginalFunction(self):
    return self.FunctionAtStages[0]

  def getLatestFunction(self):
    if len(self.FunctionAtStages) == 0:
      return RoseUndefRegion()
    return self.FunctionAtStages[len(self.FunctionAtStages) -1]
  
  def addCodeGenerator(self, CodeGenerator : RoseCodeGenerator):
    #assert isinstance(CodeGenerator, RoseCodeGenerator)
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
    return

  def computeSemanticsInfoFromTargetAgnosticFunction(self):
    # Function is expected to be canonicalized
    Function = self.getTargetAgnoticFunction()
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
                  if isinstance(Op.getOutputBitwidth(), RoseArgument):
                    self.OutElemTypeIndex = Op.getOutputBitwidth().getArgIndex()
                  LoopStep = OuterLoop.getStep()
                  if not isinstance(LoopStep, RoseConstant):
                    self.LaneSizeIndex = LoopStep.getArgIndex()
                  # If block is a reduction block then the output vector
                  # length is different.
                  LoopEnd = OuterLoop.getEndIndex()
                  if not isinstance(LoopEnd, RoseConstant):
                    self.OutVectorLengthIndex = LoopEnd.getArgIndex()
                  if HasReductionPattern(Block):
                    self.OutVectorLengthIndex = None
          continue
        if isinstance(Op, RoseBVExtractSliceOp):
          if Op.getInputBitVector() != Function.getReturnValue():
            if isinstance(Op.getInputBitVector(), RoseArgument):
              Bitwidth = Op.getOutputBitwidth()
              if isinstance(Bitwidth, RoseValue):
                Bitwidth = self.ArgsToConcreteValMap[Bitwidth].getValue()
              if Bitwidth != 1:
                if isinstance(Op.getOutputBitwidth(), RoseArgument):
                  self.InElemTypeIndex = Op.getOutputBitwidth().getArgIndex()
                if not isinstance(Op.getLowIndex(), RoseArgument):
                  Loop = Block.getParentOfType(RoseForLoop)
                  if not isinstance(Loop, RoseUndefRegion):
                    OuterLoop = Loop.getParentOfType(RoseForLoop)
                    if not isinstance(OuterLoop, RoseUndefRegion):
                      LoopEnd = OuterLoop.getEndIndex()
                      if isinstance(LoopEnd, RoseArgument):
                        self.InVectorLengthIndex = LoopEnd.getArgIndex()
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
    print("SIMD?:")
    print(self.IsSIMD)
    print("***************************************")


