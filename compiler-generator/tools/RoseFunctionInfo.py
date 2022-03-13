
from RoseAbstractions import *
from RoseValues import *
from RoseContext import *
from RoseCodeGenerator import RoseCodeGenerator


class RoseFunctionInfo():
  def __init__(self):
    self.FunctionAtStages = list()
    self.ArgsToConcreteValMap = dict()
    self.InstSema = None
    self.Context = None
    self.CodeGenerator = None
  
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



