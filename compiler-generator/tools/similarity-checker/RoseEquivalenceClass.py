##################################################################
#
# Class in this file represents an equivalence class of Functions
# in Rosette IR.
#
##################################################################


from RoseAbstractions import *
from RoseValues import *

import uuid


class RoseEquivalenceClass:
  def __init__(self):
    self.EquivalentFuctions = set()
    self.FunctToArgsMapping = dict()
    # Unique ID for each equivalent class
    self.ID = uuid.uuid4()

  def __eq__(self, Other):
    assert isinstance(Other, RoseEquivalenceClass)
    return self.ID == Other.ID

  def __neq__(self, Other):
    assert isinstance(Other, RoseEquivalenceClass)
    return self.ID != Other.ID

  def __hash__(self):
    return hash(self.ID())

  def addFunction(self, Function : RoseFunction):
    self.EquivalentFuctions.add(Function)
  
  def addFunctToArgsMapping(self, Function : RoseFunction, ArgToConcreteValMap : dict):
    self.FunctToArgsMapping[Function] = ArgToConcreteValMap
  
  def getAFunction(self):
    return self.EquivalentFuctions[0]
  
  def getFunctToArgsMapping(self):
    return self.FunctToArgsMapping

  def getEquivalentFunctions(self):
    return self.EquivalentFuctions

  def extend(self, EquivalentFuctions : set,  FunctToArgsMapping : dict):
    self.EquivalentFuctions.update(EquivalentFuctions)
    self.FunctToArgsMapping.update(FunctToArgsMapping)


