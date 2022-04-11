from enum import Enum, auto

class OperandType:

    class OperandTypeEnum(Enum):
        BitVector = auto()
        LaneSize = auto()
        Precision = auto()
        Integer = auto()

    def __init__(self, Enum):
        self.TypeEnum = Enum

    def __eq__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum == Other.TypeEnum

    def __ne__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum != Other.TypeEnum

    def __hash__(self):
        return hash(self.TypeEnum)





class InstructionType:

    class InstructionTypeEnum(Enum):
        SIMD = auto()
        NON_SIMD = auto()
        Shuffle = auto()


    def __init__(self, Enum):
        self.TypeEnum = Enum

    def __eq__(self, Other):
        assert isinstance(Other, InstructionType)
        return self.TypeEnum == Other.TypeEnum

    def __ne__(self, Other):
        assert isinstance(Other, OperandType)
        return self.TypeEnum != Other.TypeEnum

    def __hash__(self):
        return hash(self.TypeEnum)
