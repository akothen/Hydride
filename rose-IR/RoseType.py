from enum import Enum, auto

# Definition of concept of types in Rose IR
class RoseType:
    # Rosette types we are concerned with
    class RoseTypeEnum(Enum):
        Integer = auto()
        Float = auto()
        BitVector = auto()
        Vector = auto()
        List = auto()
        Undefined = auto()
        Void = auto()

    # SubClassData is data necessary for different types
    # Its used by different derived types differently.
    def __init__(self, Enum, SubClassData):
        self.TypeEnum = Enum
        self.SubClassData = SubClassData
    
    @staticmethod
    def getBitVectorTy(Bitwidth : int):
       return RoseIntegerType.create(Bitwidth)

    @staticmethod
    def getIntegerTy(Bitwidth : int, isSigned : bool = True):
        return RoseIntegerType.create(Bitwidth, isSigned)

    @staticmethod
    def getGenericFloatTy(Mantissa : int, Exponent : int, IsSigned : bool = True):
        return RoseGenericFloatType.create(Mantissa, Exponent, IsSigned)

    @staticmethod
    def getFloatTy(IsSigned : bool = True):
        return RoseFloatType.create(IsSigned)
    
    @staticmethod
    def getDoubleTy(IsSigned : bool = True):
        return RoseDoubleType.create(IsSigned)

    @staticmethod
    def getVectorTy(ElemType, Length : int):
        return RoseVectorType.create(ElemType, Length)
    
    @staticmethod
    def getListTy(NodeType, Length : int):
        RoseListType
        return RoseListType.create(NodeType, Length)
    
    @staticmethod
    def getUndefTy():
        return RoseUndefinedType.create()
    
    @staticmethod
    def getVoidTy():
        return RoseVoidType.create()

    def getSubClassData(self):
        return self.SubClassData
    
    def isBitVectorTy(self):
        return isinstance(self, RoseBitVectorType)
    
    def isIntegerTy(self):
        return isinstance(self, RoseIntegerType)
    
    def isGenericFloatTy(self):
        return isinstance(self, RoseGenericFloatType)

    def isFloatTy(self):
        return isinstance(self, RoseFloatType)

    def isDoubleTy(self):
        return isinstance(self, RoseDoubleType)

    def isVectorTy(self):
        return isinstance(self, RoseVectorType)
    
    def isListTy(self):
        return isinstance(self, RoseListType)
    
    def isUndefTy(self):
        return isinstance(self, RoseUndefinedType)

    def isVoidTy(self):
        return isinstance(self, RoseVoidType)


class RoseBitVectorType(RoseType):
    def __init__(self, Bitwidth : int):
        super().__init__(RoseType.RoseTypeEnum.BitVector, Bitwidth)
    
    @staticmethod
    def create(Bitwidth : int):
        return RoseBitVectorType(Bitwidth)

    def getBitwidth(self):
        return self.getSubClassData()


class RoseIntegerType(RoseType):
    def __init__(self, Bitwidth : int, IsSigned : bool):
        SubClassData = {}
        SubClassData["bitwidth"] = Bitwidth
        SubClassData["isSigned"] = IsSigned
        super().__init__(RoseType.RoseTypeEnum.Integer, SubClassData)
    
    @staticmethod
    def create(Bitwidth : int, IsSigned : bool = True):
        return RoseIntegerType(Bitwidth, IsSigned)
    
    def getBitwidth(self):
        return self.getSubClassData()["bitwidth"]
    
    def isSigned(self):
        return self.getSubClassData()["isSigned"]



class RoseGenericFloatType(RoseType):
    def __init__(self, Mantissa : int, Exponent : int, IsSigned : bool):
        SubClassData = {}
        SubClassData["mantissa"] = Mantissa
        SubClassData["exponent"] = Exponent
        SubClassData["isSigned"] = IsSigned
        super().__init__(RoseType.RoseTypeEnum.Float, SubClassData)
    
    @staticmethod
    def create(Mantissa : int, Exponent : int, IsSigned : bool = True):
        return RoseGenericFloatType(Mantissa, Exponent, IsSigned)
    
    def getBitwidth(self):
        Mantissa = self.getSubClassData()["mantissa"]
        Exponent = self.getSubClassData()["exponent"]
        return (Mantissa + Exponent + 1)
    
    def getMantissaWidth(self):
        return self.getSubClassData()["mantissa"]

    def getExponentWidth(self):
        return self.getSubClassData()["exponent"]

    def isSigned(self):
        return self.getSubClassData()["isSigned"]


class RoseFloatType(RoseGenericFloatType):
    def __init__(self, IsSigned : bool):
        Mantissa = 23
        Exponent = 8
        super().__init__(Mantissa, Exponent, IsSigned)
    
    @staticmethod
    def create(IsSigned : bool = True):
        return RoseFloatType(IsSigned)


class RoseDoubleType(RoseGenericFloatType):
    def __init__(self, IsSigned : bool):
        Mantissa = 52
        Exponent = 11
        super().__init__(Mantissa, Exponent, IsSigned)
    
    @staticmethod
    def create(IsSigned : bool = True):
        return RoseDoubleType(IsSigned)


class RoseVectorType(RoseType):
    def __init__(self, ElemType, Length : int):
        assert isinstance(ElemType, RoseGenericFloatType) \
            or isinstance(ElemType, RoseIntegerType) \
            or isinstance(ElemType, RoseBitVectorType)
        SubClassData = {}
        SubClassData["elemType"] = ElemType
        SubClassData["length"] = Length
        super().__init__(RoseType.RoseTypeEnum.Vector, SubClassData)
    
    @staticmethod
    def create(ElemType, Length : int):
        return RoseBitVectorType(ElemType, Length)

    def getLength(self):
        return self.getSubClassData()["length"]
    
    def getElemType(self):
        return self.getSubClassData()["elemType"]


class RoseListType(RoseType):
    def __init__(self, NodeType, Length : int):
        assert isinstance(NodeType, RoseGenericFloatType) \
            or isinstance(NodeType, RoseIntegerType) \
            or isinstance(NodeType, RoseBitVectorType) \
            or isinstance(NodeType, RoseVectorType) \
            or isinstance(NodeType, RoseListType)
        SubClassData = {}
        SubClassData["nodeType"] = NodeType
        SubClassData["length"] = Length
        super().__init__(RoseType.RoseTypeEnum.List, SubClassData)
    
    @staticmethod
    def create(NodeType, Length : int):
        return RoseListType(NodeType, Length)

    def getLength(self):
        return self.getSubClassData()["length"]
    
    def getNodeType(self):
        return self.getSubClassData()["nodeType"]


class RoseUndefinedType(RoseType):
    def __init__(self):
        SubClassData = None
        super().__init__(RoseType.RoseTypeEnum.Undefined, SubClassData)
    
    @staticmethod
    def create():
        return RoseUndefinedType()


class RoseVoidType(RoseType):
    def __init__(self):
        SubClassData = None
        super().__init__(RoseType.RoseTypeEnum.Void, SubClassData)
    
    @staticmethod
    def create():
        return RoseVoidType()



    
# Test
if __name__ == '__main__':
    BVType = RoseType.getBitVectorTy(8)
    print(BVType)


 
