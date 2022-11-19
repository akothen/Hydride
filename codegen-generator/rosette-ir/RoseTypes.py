#############################################################
#
# All the first class types for Rosette IR.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue

from llvmlite.ir.types import IntType as LLVMIntType
from llvmlite.ir.types import FloatType as LLVMFloatType
from llvmlite.ir.types import DoubleType as LLVMDoubleType
from llvmlite.ir.types import VoidType as LLVMVoidType


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

    def __str__(self):
        return "undefined"

    def to_llvm_ir(self):
      assert False, "Rose IR to LLVM IR type conversion not supported."


class RoseVoidType(RoseType):
    def __init__(self):
        SubClassData = None
        super().__init__(RoseType.RoseTypeEnum.Void, SubClassData)
    
    @staticmethod
    def create():
        return RoseVoidType()
    
    def print(self):
        print("void")

    def __str__(self):
        return "void"

    def to_llvm_ir(self):
      return LLVMVoidType()


class RoseBitVectorType(RoseType):
    def __init__(self, Bitwidth):
        # Some sanity checks
        print(type(Bitwidth))
        assert isinstance(Bitwidth, int) or isinstance(Bitwidth, RoseValue)
        if isinstance(Bitwidth, int):
            # Bitwidth of a bitvector must be more than 1.
            assert Bitwidth >= 1
        super().__init__(RoseType.RoseTypeEnum.BitVector, Bitwidth)
    
    @staticmethod
    def create(Bitwidth):
      return RoseBitVectorType(Bitwidth)

    def getBitwidth(self):
      Bitwidth = self.getSubClassData()
      assert isinstance(Bitwidth, int) or isinstance(Bitwidth, RoseValue)
      if isinstance(Bitwidth, int):
        assert Bitwidth >= 1
      return Bitwidth
    
    def __str__(self):
        Bitwidth = self.getBitwidth()
        if type(Bitwidth) == int:
            return "bv" + str(Bitwidth)
        else:
            return "bv"
    
    def print(self):
        Bitwidth = self.getBitwidth()
        if type(Bitwidth) == int:
            print("bitvector" + str(Bitwidth))
        else:
            print("bitvector" + str(Bitwidth.getName()))

    def to_llvm_ir(self):
        Bitwidth = self.getBitwidth()
        assert type(Bitwidth) == int
        return LLVMIntType(Bitwidth)


class RoseIntegerType(RoseType):
    def __init__(self, Bitwidth : int):
        # Bitwidth of an integer must be more than 1.
        print(type(Bitwidth))
        assert Bitwidth > 1
        super().__init__(RoseType.RoseTypeEnum.Integer, Bitwidth)
    
    @staticmethod
    def create(Bitwidth : int):
        return RoseIntegerType(Bitwidth)
    
    def getBitwidth(self):
        Bitwidth = self.getSubClassData()
        assert type(Bitwidth) == int
        assert Bitwidth > 1
        return Bitwidth
    
    def __str__(self):
        return "int" + str(self.getBitwidth())
    
    def print(self):
        print("int" + str(self.getBitwidth()))
  
    def to_llvm_ir(self):
        return LLVMIntType(self.getBitwidth())


class RoseBooleanType(RoseType):
    def __init__(self):
        super().__init__(RoseType.RoseTypeEnum.Boolean)
    
    @staticmethod
    def create():
        return RoseBooleanType()
    
    def getBitwidth(self):
        return 1

    def __str__(self):
        return "bool"
    
    def print(self):
        print("bool")

    def to_llvm_ir(self):
      return LLVMIntType(self.getBitwidth())
  

class RoseStringType(RoseType):
    def __init__(self, Length : int):
        # Bitwidth of an integer must be more than 0.
        print(type(Length))
        assert Length > 0
        super().__init__(RoseType.RoseTypeEnum.String, Length)
    
    @staticmethod
    def create(Length : int):
        return RoseStringType(Length)
    
    def getLength(self):
        Length = self.getSubClassData()
        assert type(Length) == int
        assert Length > 0
        return Length
    
    def __str__(self):
        return "str" + str(self.getLength())
    
    def print(self):
        print("str" + str(self.getLength()))
  
    def to_llvm_ir(self):
        NotImplemented


class RoseTileType(RoseType):
    
    # '__tile': RoseListType.create(RoseBitVectorType.create(512, 16),
    # 'rows': RoseBitVectorType.create(8),
    # 'colsb': RoseBitVectorType.create(16),
    def __init__(self, Rows: int, Cols: int):
        SubClassData = {}
        SubClassData["rows"] = Rows
        SubClassData["cols"] = Cols
        super().__init__(RoseType.RoseTypeEnum.Tile, SubClassData)

    @staticmethod
    def create(Rows: int, Cols: int):
        return RoseTileType(Rows, Cols)

    def getRows(self):
        Rows = self.getSubClassData()["rows"]
        return Rows

    def getColsb(self):
        Cols = self.getSubClassData()["cols"]
        return Cols

    def __str__(self):
        Rows = self.getSubClassData()["rows"]
        Cols = self.getSubClassData()["cols"]
        return "tile.r" + str(Rows) + ".c" + str(Cols)
    
    def print(self):
        Rows = self.getSubClassData()["rows"]
        Cols = self.getSubClassData()["cols"]
        print("tile.r" + str(Rows) + ".c" + str(Cols))

    def to_llvm_ir(self):
        assert False, "Rose IR to LLVM IR type conversion not supported."


class RoseGenericFloatType(RoseType):
    def __init__(self, Mantissa : int, Exponent : int):
        # Some sanity checks
        assert Mantissa > 1
        assert Exponent > 1
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
        assert Mantissa > 1
        assert Exponent > 1
        return (Mantissa + Exponent + 1)
    
    def getMantissaWidth(self):
        Mantissa = self.getSubClassData()["mantissa"]
        assert type(Mantissa) == int
        assert Mantissa > 1
        return Mantissa

    def getExponentWidth(self):
        Exponent = self.getSubClassData()["exponent"]
        assert type(Exponent) == int
        assert Exponent > 1
        return Exponent
    
    def print(self):
        print("fp." + str(self.getMantissaWidth()) + "." + str(self.getExponentWidth()))

    def to_llvm_ir(self):
      assert False, "Rose IR to LLVM IR type conversion not supported."


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

    def to_llvm_ir(self):
      return LLVMFloatType()


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

    def to_llvm_ir(self):
      return LLVMDoubleType()


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

    def __str__(self):
        return "vector"

    def to_llvm_ir(self):
      assert False, "Rose IR to LLVM IR type conversion not supported."


class RoseListType(RoseType):
    def __init__(self, NodeType, Length : int):
        assert isinstance(NodeType, RoseGenericFloatType) \
            or isinstance(NodeType, RoseIntegerType) \
            or isinstance(NodeType, RoseBitVectorType) \
            or isinstance(NodeType, RoseVectorType) \
            or isinstance(NodeType, RoseStringType) \
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

    def __str__(self):
        return "list"

    def to_llvm_ir(self):
      assert False, "Rose IR to LLVM IR type conversion not supported."


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

    def to_llvm_ir(self):
      assert False, "Rose IR to LLVM IR type conversion not supported."



# Test
if __name__ == '__main__':
    BVType = RoseType.getBitVectorTy(8)
    print(BVType)

 


