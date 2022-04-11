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
    self.ArgsToConcreteValMap = dict()
    self.InstSema = None
    self.Context = None
    self.CodeGenerator = None
    self.InElemType = None
    self.OutElemType = None
    self.InVectorLength = None
    self.OutVectorLength = None
    self.LaneSize = None
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

  def isSIMD(self):
    return self.IsSIMD

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
  
  def computeSemanticsInfo(self):
    # Function is expected to be canonicalized
    Function = self.getLatestFunction()
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
                  if isinstance(self.OutElemType, RoseValue):
                    self.OutElemType = self.ArgsToConcreteValMap[self.OutElemType].getValue()
                  LoopStep = OuterLoop.getStep()
                  if not isinstance(LoopStep, RoseConstant):
                    LoopStep = self.ArgsToConcreteValMap[LoopStep]
                  self.LaneSize = LoopStep.getValue()
                  # If block is a reduction block then the output vector
                  # length is different.
                  LoopEnd = OuterLoop.getEndIndex()
                  if not isinstance(LoopEnd, RoseConstant):
                    LoopEnd = self.ArgsToConcreteValMap[LoopEnd]
                  if HasReductionPattern(Block):
                    self.OutVectorLength = self.OutElemType \
                                  * int(LoopEnd.getValue() / LoopStep.getValue())
                    self.IsSIMD = False
                  else:
                    self.OutVectorLength = LoopEnd.getValue()
                    self.IsSIMD = True
                  print("self.OutVectorLength:")
                  print(self.OutVectorLength)
          continue
        if isinstance(Op, RoseBVExtractSliceOp):
          if Op.getInputBitVector() != Function.getReturnValue():
            Bitwidth = Op.getOutputBitwidth()
            if isinstance(Bitwidth, RoseValue):
              Bitwidth = self.ArgsToConcreteValMap[Bitwidth].getValue()
            if Bitwidth != 1:
              self.InElemType = Op.getOutputBitwidth()
              if isinstance(self.InElemType, RoseValue):
                self.InElemType = self.ArgsToConcreteValMap[self.InElemType].getValue()
              Loop = Block.getParentOfType(RoseForLoop)
              if not isinstance(Loop, RoseUndefRegion):
                OuterLoop = Loop.getParentOfType(RoseForLoop)
                if not isinstance(OuterLoop, RoseUndefRegion):
                  LoopEnd = OuterLoop.getEndIndex()
                  if not isinstance(LoopEnd, RoseConstant):
                    LoopEnd = self.ArgsToConcreteValMap[LoopEnd]
                  self.InVectorLength = LoopEnd.getValue()
                  print("self.InVectorLength:")
                  print(self.InVectorLength)
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
    print("OutElemType:")
    print(self.OutElemType)
    print("InVectorLength:")
    print(self.InVectorLength)
    print("OutVectorLength:")
    print(self.OutVectorLength)
    print("LaneSize:")
    print(self.LaneSize)
    print("SIMD?:")
    print(self.IsSIMD)
    print("***************************************")


