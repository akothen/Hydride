from enum import Enum, auto

# Definition of concept of types in Rose IR
class RoseType:
    # Rosette types we are concerned with
    class RoseTypeEnum(Enum):
        Integer = auto()
        Float = auto()
        Double = auto()
        BitVector = auto()
        Vector = auto()
        List = auto()
        Undefined = auto()

    def __init__(self):
        self.TypeEnum = None
        self.Bitwidth = None
    
    @staticmethod
    def getBitVectorTy(Bitwidth):
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.BitVector
        Type.Bitwidth = Bitwidth
        return Type

    @staticmethod
    def getIntegerTy(Bitwidth = 32):
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Integer
        Type.Bitwidth = Bitwidth
        return Type

    @staticmethod
    def getFloatTy(Bitwidth = 32):
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Float
        Type.Bitwidth = Bitwidth
        return Type
    
    @staticmethod
    def getDoubleTy(Bitwidth = 64):
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Double
        Type.Bitwidth = Bitwidth
        return Type

    @staticmethod
    def getVectorTy():
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Vector
        return Type
    
    @staticmethod
    def getListTy():
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.List
        return Type
    
    @staticmethod
    def getUndefTy():
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Undefined
        return Type

    def getBitwidth(self):
        assert(self.TypeEnum == self.RoseTypeEnum.BitVector \
            or self.TypeEnum == self.RoseTypeEnum.Integer \
            or self.TypeEnum == self.RoseTypeEnum.Float \
            or self.TypeEnum == self.RoseTypeEnum.Double)
        return self.Bitwidth
    
    def setBitwidth(self, Bitwidth):
        assert(self.TypeEnum == self.RoseTypeEnum.BitVector \
            or self.TypeEnum == self.RoseTypeEnum.Integer \
            or self.TypeEnum == self.RoseTypeEnum.Float \
            or self.TypeEnum == self.RoseTypeEnum.Double)
        self.Bitwidth = Bitwidth
    
    def isBitVectorTy(self):
        return self.TypeEnum == self.RoseTypeEnum.BitVector
    
    def isIntegerTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Integer

    def isFloatTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Float

    def isDoubleTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Double

    def isVectorTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Vector
    
    def isListTy(self):
        return self.TypeEnum == self.RoseTypeEnum.List
    
    def isUndefTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Undefined



    
# Test
if __name__ == '__main__':
    BVType = RoseType.getBitVectorTy(8)
    print(BVType)


 
