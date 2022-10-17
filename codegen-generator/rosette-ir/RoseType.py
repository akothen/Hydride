#############################################################
#
# Base class for tracking type information for Rosette IR.
#
#############################################################



from enum import Enum, auto

from copy import deepcopy


# Definition of concept of types in Rose IR
class RoseType:
    # Rosette types we are concerned with
    class RoseTypeEnum(Enum):
        Integer = auto()
        Float = auto()
        Boolean = auto()
        String = auto()
        BitVector = auto()
        Vector = auto()
        List = auto()
        Undefined = auto()
        Void = auto()
        Function = auto()

    # SubClassData is data necessary for different types
    # Its used by different derived types differently.
    def __init__(self, Enum, SubClassData = None):
        self.TypeEnum = Enum
        self.SubClassData = SubClassData
    
    def __eq__(self, Other):
        assert isinstance(Other, RoseType)
        return self.TypeEnum == Other.TypeEnum and self.SubClassData == Other.SubClassData
    
    def __ne__(self, Other):
        assert isinstance(Other, RoseType)
        return self.TypeEnum != Other.TypeEnum or self.SubClassData != Other.SubClassData

    def __hash__(self):
        return hash(self.TypeEnum)

    def getSubClassData(self):
        return self.SubClassData

    def clone(self):
        return deepcopy(self)

