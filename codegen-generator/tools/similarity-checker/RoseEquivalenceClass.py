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
        self.FunctionToArgsMapping = dict()
        # Unique ID for each equivalent class
        self.ID = uuid.uuid4()

    def __eq__(self, Other):
        if Other == None:
            return False
        assert isinstance(Other, RoseEquivalenceClass)
        return self.ID == Other.ID

    def __neq__(self, Other):
        if Other == None:
            return True
        assert isinstance(Other, RoseEquivalenceClass)
        return self.ID != Other.ID

    def __hash__(self):
        return hash(self.ID)

    def addFunction(self, Function: RoseFunction):
        self.EquivalentFuctions.add(Function)

    def addFunctionToArgsMapping(self, Function: RoseFunction, ArgToConcreteValMap: dict):
        self.FunctionToArgsMapping[Function] = ArgToConcreteValMap

    def getAFunction(self):
        return list(self.EquivalentFuctions)[0]

    def getFunctionToArgsMapping(self):
        return self.FunctionToArgsMapping

    def getEquivalentFunctions(self):
        return self.EquivalentFuctions

    def replaceFunction(self, OldFunction: RoseFunction, NewFunction: RoseFunction,
                        NewFunctionToArgsMapping: dict):
        self.EquivalentFuctions.remove(OldFunction)
        self.EquivalentFuctions.add(NewFunction)
        del self.FunctionToArgsMapping[OldFunction]
        self.FunctionToArgsMapping[NewFunction] = NewFunctionToArgsMapping

    def extend(self, EquivalentFuctions: set,  FunctionToArgsMapping: dict):
        self.EquivalentFuctions.update(EquivalentFuctions)
        self.FunctionToArgsMapping.update(FunctionToArgsMapping)
