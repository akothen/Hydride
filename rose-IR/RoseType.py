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
        Function = auto()

    # SubClassData is data necessary for different types
    # Its used by different derived types differently.
    def __init__(self, Enum, SubClassData):
        self.TypeEnum = Enum
        self.SubClassData = SubClassData
    
    @staticmethod
    def getBitVectorTy(Bitwidth : int):
       return RoseBitVectorType.create(Bitwidth)

    @staticmethod
    def getIntegerTy(Bitwidth : int):
        return RoseIntegerType.create(Bitwidth)

    @staticmethod
    def getGenericFloatTy(Mantissa : int, Exponent : int, IsSigned : bool = True):
        return RoseGenericFloatType.create(Mantissa, Exponent, IsSigned)

    @staticmethod
    def getFloatTy():
        return RoseFloatType.create()
    
    @staticmethod
    def getDoubleTy():
        return RoseDoubleType.create()

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
    
    @staticmethod
    def getFunctionTy(ArgTypeList : list, ReturnType):
        assert isinstance(ReturnType, RoseType)
        return RoseFunctionType.create(ArgTypeList, ReturnType)

    def getSubClassData(self):
        return self.SubClassData
    
    def isBitVectorTy(self):
        return isinstance(self, RoseBitVectorType)
    
    def isIntegerTy(self):
        return isinstance(self, RoseIntegerType)
    
    def isGenericFloatTy(self):
        return isinstance(self, RoseGenericFloatType)

    def isFloatTy(self):
        return (isinstance(self, RoseFloatType) \
            or isinstance(self, RoseDoubleType))

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
    
    def isFunctionTy(self):
        return isinstance(self, RoseFunctionType)


class RoseBitVectorType(RoseType):
    def __init__(self, Bitwidth : int):
        super().__init__(RoseType.RoseTypeEnum.BitVector, Bitwidth)
    
    @staticmethod
    def create(Bitwidth : int):
        return RoseBitVectorType(Bitwidth)

    def getBitwidth(self):
        Bitwidth = self.getSubClassData()
        assert type(Bitwidth) == int
        return Bitwidth
    
    def print(self):
        print("bitvector" + str(self.getBitwidth()))


class RoseIntegerType(RoseType):
    def __init__(self, Bitwidth : int):
        super().__init__(RoseType.RoseTypeEnum.Integer, Bitwidth)
    
    @staticmethod
    def create(Bitwidth : int):
        return RoseIntegerType(Bitwidth)
    
    def getBitwidth(self):
        Bitwidth = self.getSubClassData()
        assert type(Bitwidth) == int
        return Bitwidth
    
    def print(self):
        print("int" + str(self.getBitwidth()))
    

class RoseGenericFloatType(RoseType):
    def __init__(self, Mantissa : int, Exponent : int):
        SubClassData = {}
        SubClassData["mantissa"] = Mantissa
        SubClassData["exponent"] = Exponent
        super().__init__(RoseType.RoseTypeEnum.Float, SubClassData)
    
    @staticmethod
    def create(Mantissa : int, Exponent : int):
        return RoseGenericFloatType(Mantissa, Exponent)
    
    def getBitwidth(self):
        Mantissa = self.getSubClassData()["mantissa"]
        Exponent = self.getSubClassData()["exponent"]
        assert type(Mantissa) == int
        assert type(Exponent) == int
        return (Mantissa + Exponent + 1)
    
    def getMantissaWidth(self):
        Mantissa = self.getSubClassData()["mantissa"]
        assert type(Mantissa) == int
        return Mantissa

    def getExponentWidth(self):
        Exponent = self.getSubClassData()["exponent"]
        assert type(Exponent) == int
        return Exponent
    
    def print(self):
        print("fp." + str(self.getMantissaWidth()) + "." + str(self.getExponentWidth()))


class RoseFloatType(RoseGenericFloatType):
    def __init__(self):
        Mantissa = 23
        Exponent = 8
        super().__init__(Mantissa, Exponent)
    
    @staticmethod
    def create():
        return RoseFloatType()
    
    def print(self):
        print("float")


class RoseDoubleType(RoseGenericFloatType):
    def __init__(self):
        Mantissa = 52
        Exponent = 11
        super().__init__(Mantissa, Exponent)
    
    @staticmethod
    def create():
        return RoseDoubleType()
    
    def print(self):
        print("double")


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
        return RoseVectorType(ElemType, Length)

    def getLength(self):
        return self.getSubClassData()["length"]
    
    def getElemType(self):
        return self.getSubClassData()["elemType"]
    
    def print(self):
        print("vector")


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
    
    def print(self):
        print("list")


# Sort of placeholder type
class RoseUndefinedType(RoseType):
    def __init__(self):
        SubClassData = None
        super().__init__(RoseType.RoseTypeEnum.Undefined, SubClassData)
    
    @staticmethod
    def create():
        return RoseUndefinedType()
    
    def print(self):
        print("undefined")


class RoseVoidType(RoseType):
    def __init__(self):
        SubClassData = None
        super().__init__(RoseType.RoseTypeEnum.Void, SubClassData)
    
    @staticmethod
    def create():
        return RoseVoidType()
    
    def print(self):
        print("void")


# Rosette does not have a function type but it is good for Rose IR to
# have it for the IR to have some definitive structure and sanity checks.
class RoseFunctionType(RoseType):
    def __init__(self, ArgTypeList : list, ReturnType : RoseType):
        # Some sanity checks
        for ArgType in ArgTypeList:
            assert isinstance(ArgType, RoseType)
        SubClassData = {}
        SubClassData["arglist"] = ArgTypeList
        SubClassData["return"] = ReturnType
        super().__init__(RoseType.RoseTypeEnum.Function, SubClassData)
    
    @staticmethod
    def create(ArgTypeList : list, ReturnType : RoseType):
        return RoseFunctionType(ArgTypeList, ReturnType)
    
    def getArgType(self, ArgNo : int):
        # Sanity check
        ArgTypeList = self.getSubClassData()["arglist"]
        assert ArgNo < len(ArgTypeList)
        return ArgTypeList[ArgNo]
    
    def getNumArgs(self):
        ArgTypeList = self.getSubClassData()["arglist"]
        return len(ArgTypeList)

    def getArgList(self):
        ArgTypeList = self.getSubClassData()["arglist"]
        return ArgTypeList
    
    def getReturnType(self):
        return self.getSubClassData()["return"]


# Test
if __name__ == '__main__':
    BVType = RoseType.getBitVectorTy(8)
    print(BVType)
