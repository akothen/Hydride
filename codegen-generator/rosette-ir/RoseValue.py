#############################################################
#
# Base class for representing values in Rosette IR.
#
#############################################################


from RoseType import *

from copy import deepcopy
import uuid


# Base class for Rosette values. The values have name
# and type. Keeping this simple for now.
class RoseValue:
    def __init__(self, Name: str, Type: RoseType, ID=None):
        self.Name = Name
        self.Type = Type
        if ID == None:
            self.ID = uuid.uuid4()
        else:
            self.ID = ID

    @staticmethod
    def create(Name: str, Type: RoseType):
        return RoseValue(Name, Type)

    def __eq__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name == Other.Name and self.Type == Other.Type and self.ID == Other.ID

    def __ne__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name != Other.Name or self.Type != Other.Type or self.ID != Other.ID

    def __hash__(self):
        return hash(self.ID)

    def __str__(self):
        return self.getName()

    def _setID(self):
        self.ID = uuid.uuid4()

    def getType(self):
        return self.Type

    def getName(self):
        return self.Name

    def setName(self, Name: str):
        self.Name = Name

    # This should only be used if the current type is undefined
    def setType(self, Type: RoseType):
        self.Type = Type

    def isClonable(self):
        return True

    def clone(self, NewName: str = None, ChangeID: bool = False):
        assert self.isClonable() == True
        NewCopy = deepcopy(self)
        if NewName != None:
            NewCopy.setName(NewName)
        if ChangeID == True:
            NewCopy._setID()
        return NewCopy

    def print(self, Debug=False):
        print(self.Name)
        if Debug == True:
            self.Type.print()
