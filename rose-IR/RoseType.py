from enum import Enum, auto


# Definition of concept of types in Rose IR
class RoseType:
    # Rosette types we are concerned with
    class RoseTypeEnum(Enum):
        Integer = auto()
        BitVector = auto()
        Vector = auto()
        List = auto()

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
    def getIntegerTy():
        Type = RoseType()
        Type.TypeEnum = Type.RoseTypeEnum.Integer
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
    
    def setBitwidth(self, Bitwidth):
        assert(self.TypeEnum == self.RoseTypeEnum.BitVector \
            or self.TypeEnum == self.RoseTypeEnum.Integer)
        self.Bitwidth = Bitwidth
    
    def isBitVectorTy(self):
        return self.TypeEnum == self.RoseTypeEnum.BitVector
    
    def isIntegerTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Integer
    
    def isVectorTy(self):
        return self.TypeEnum == self.RoseTypeEnum.Vector
    
    def isListTy(self):
        return self.TypeEnum == self.RoseTypeEnum.List

    
# Test
if __name__ == '__main__':
    BVType = RoseType.getBitVectorTy(8)
    print(BVType)


 
