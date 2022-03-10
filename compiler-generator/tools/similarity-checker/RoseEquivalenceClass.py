
from RoseAbstractions import *
from RoseValues import *


class RoseEquivalenceClass:
  def __init__(self):
    self.EquivalentFuctions = set()
    self.FunctToArgsMapping = dict()
  
  def addFunction(self, Function : RoseFunction):
    self.EquivalentFuctions.add(Function)
  
  def addFunctToArgsMapping(self, Function : RoseFunction, ArgToConcreteValMap : dict):
    self.FunctToArgsMapping[Function] = ArgToConcreteValMap
  
  def getAFunction(self):
    return self.EquivalentFuctions[0]
  
  def getEquivalentFunctions(self):
    return self.EquivalentFuctions



