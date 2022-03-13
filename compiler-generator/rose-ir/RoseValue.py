#############################################################
#
# Base class for representing values in Rosette IR.
#
#############################################################


from RoseType import *

from copy import deepcopy


# Base class for Rosette values. The values have name
# and type. Keeping this simple for now.
class RoseValue:
    def __init__(self, Name : str, Type : RoseType):
        self.Name = Name
        self.Type = Type
    
    @staticmethod
    def create(Name : str, Type : RoseType):
        return RoseValue(Name, Type)
    
    def __eq__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name == Other.Name and self.Type == Other.Type

    def __ne__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name != Other.Name or self.Type != Other.Type

    def __hash__(self):
        return hash((self.Name, self.Type))

    def getType(self):
        return self.Type

    def getName(self):
        return self.Name
    
    def setName(self, Name : str):
        self.Name = Name
    
    # This should only be used if the current type is undefined
    def setType(self, Type : RoseType):
        self.Type = Type
    
    def isClonable(self):
        return True

    def clone(self, NewName : str = None):
        assert self.isClonable() == True
        NewCopy = deepcopy(self)
        if NewName != None:
            NewCopy.setName(NewName)
        return NewCopy

    def print(self, Debug = False):
        print(self.Name)
        if Debug == True:
            self.Type.print()

 



