
from RoseAbstractions import *
from RoseValues import *
from RoseContext import *


class RoseFunctionInfo():
  def __init__(self):
    self.ParameterizedFunction = RoseUndefRegion()
    self.OriginalFunction = RoseUndefRegion()
    self.ArgsToConcreteValMap = dict()
    self.RosetteCode = None
    self.InstSema = None
    self.Context = None
  
  def addArgsToConcreteMap(self, ArgsToConcreteValMap : dict):
    # Sanity checking
    for Arg, _ in ArgsToConcreteValMap.items():
      assert Arg.getFunction() == self.Function
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
    self.Context = Context
  
  def getContext(self):
    return self.Context

  def addRawSemantics(self, Sema):
    self.Sema = Sema
  
  def addParameterizedFunction(self, Function : RoseFunction):
    self.ParameterizedFunction = Function
  
  def addOriginalFunction(self, Function : RoseFunction):
    self.OriginalFunction = Function  
  
  def getFunction(self):
    return self.ParameterizedFunction


