from RoseType import RoseType
from RoseValue import RoseValue

# Constant value (integer and float) class
class Constant(RoseValue):
    def __init__(self, Value, Type : RoseType):
        self.Val = Value
        super().__init__("", Type)
    
    @staticmethod
    def create(Value, Bitwidth = 32):
        if isinstance(Value, int):
            return Constant(Value, RoseType.getIntegerTy(Bitwidth))
        if isinstance(Value, float):
            return Constant(Value, RoseType.getFloatTy(Bitwidth))
        exit()
        assert(False)

    def getValue(self):
        return self.Val
    
    def print(self):
        print(self.Val)

