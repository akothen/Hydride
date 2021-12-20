
import os
from enum import Enum, auto



# Rosette types we are concerned with
class RoseTypeEnum(Enum):
    Integer = auto()
    BitVector = auto()
    Vector = auto()
    List = auto()

 
# Definition of concept of types in Rose IR
class RoseType:
    def __init__(self, TypeEnum : RoseTypeEnum):
        self.TypeEnum = TypeEnum
        self.Bitwidth = None
    
    def setBitwidth(self, Bitwidth):
        assert(self.TypeEnum == RoseTypeEnum.BitVector \
            or self.TypeEnum == RoseTypeEnum.Integer)
        self.Bitwidth = Bitwidth
    

# Base class for Rosette values. The values have name
# and type (bitwidth). 
class RoseValue:
    def __init__(self, Name : str, Type : RoseType, Bitwidth : int):
        self.Name = Name
        self.Type = Type
        self.Bitwidth = Bitwidth

    def getType(self):
        return self.Type.name
    
    def getTypeSize(self):
        return self.Bitwidth

    def getName(self):
        return self.Name
    
    def setName(self, Name : str):
        self.Name = Name


# List of all operations that
# involve bitvectors.
class RoseOpcode(Enum):
    bvadd = auto()
    bvsub = auto()
    bvmul = auto()
    bvsdiv = auto()
    bvudiv = auto()
    bvsrem = auto()
    bvurem = auto()
    bvsmod = auto()
    bveq = auto()
    bvslt = auto()
    bvult = auto()
    bvsle = auto()
    bvule = auto()
    bvsgt = auto()
    bvugt = auto()
    bvsge = auto()
    bvuge = auto()
    bvnot = auto()
    bvand = auto()
    bvor = auto()
    bvxor = auto()
    bvshl = auto()
    bvlshr = auto()
    bvashr = auto()
    bvneg = auto()
    concat = auto()
    bvextract = auto()
    bvsignextract = auto()
    bvzeroextract = auto()
    bvlowextextract = auto()
    bvsignlowextract = auto()
    bvzerolowextract = auto()

    def __str__(self):
        return self.name
    
    def getNumBVOpInputs(self, Inputs : list):
        NumBVInputs = 0
        for Input in Inputs:
            if Input.getType() == RoseType.BitVector:
                NumBVInputs += 1
        return NumBVInputs

    def getOutputType(self, Inputs : list): 
        assert(len(Inputs) > 1)
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul:
            assert(self.getNumBVOpInputs(Inputs) > 1)
            return 
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod:
            assert(self.getNumBVOpInputs(Inputs) == 2)
            return 
        





# Let's see how this could be useful
class HighOrderFunctions(Enum):
    concat = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name


# An operation in Rosette
# An operation is either an instruction or a sort of lambda function
class RoseOperation:
    def __init__(self, Opcode : RoseOpcode, NumOperands : int, Name : str, Type : RoseType, Bitwidth : int, ParentBlock):
        self.Opcode = Opcode
        self.NumOperands = NumOperands
        self.OperandList = [None] * NumOperands
        self.Value = RoseValue(Name, Type, Bitwidth)
        self.ParentBlock = None

    def __ctor(self, Opcode : RoseOpcode, OperandList : list, RetVal : RoseValue):
        assert(len(OperandList) == self.OperandList)
        self.Opcode = Opcode
        self.NumOperands = len(OperandList)
        self.OperandList = OperandList
        self.RetVal = RetVal
    
    @classmethod
    def create(self, Opcode : RoseOpcode, OperandList : list, Name : str):
        self.__ctor(Name, ArgsList, RetVal, [])

    def setFuncName(self, FuncName):
        self.FuncName = FuncName
    
    def getOperand(self, Index):
        assert Index < self.NumOperands
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert Index < self.NumOperands
        self.OperandList[Index] = Operand

    def hangOffOperand(self, Index):
        assert Index < self.NumOperands
        self.OperandList[Index] = None

    def Print(self):
        Func_Sig = "(define (" + str(self.Opcode)
        for Arg in self.Operands:
            Func_Sig += (" " + Arg)
        Func_Sig += ")"
        print(Func_Sig)


# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
class RoseTopLevelFunction:
    def __init__(self, Name : str, NumArgs : int, RetType : RoseType, RetBitwidth : int):
        self.Name = Name
        self.NumArgs = NumArgs
        self.ArgList = [None] * NumArgs
        self.RetVal = RoseValue("", RetType, RetBitwidth)
        self.RegionList = []

    def __ctor(self, Name : str, ArgList : list, RetVal : RoseValue, RegionList : list):
        assert(len(ArgList) == self.NumArgs)
        self.Name = Name
        self.NumArgs = len(ArgList)
        self.ArgList = ArgList
        self.RetVal = RetVal
        self.RegionList = RegionList
    
    @classmethod
    def createEmptyFunction(self, Name : str, ArgsList : list, RetVal : RoseValue):
        self.__ctor(Name, ArgsList, RetVal, [])
    
    def getNumArgs(self):
        return self.NumArgs
    
    def getArg(self, Index):
        return self.ArgList[Index]
    
    def getRetVal(self):
        return self.RetVal
    
    def addArg(self, NewArg):
        self.NumArgs += 1
        self.ArgList.append(NewArg)

    def Print(self):
        Func_Sig = "(define (" + self.FuncName
        for Arg in self.ArgsList:
            Func_Sig += (" " + Arg)
        Func_Sig += ")"
        print(Func_Sig)


# Definition of Block 
# It is a list of operations
class RoseBlock:
    def __init__(self):
        self.ArgsList = []
        self.BasicBlockList = []
        
    
    def Create(self, FuncName, ArgsList, BasicBlockList):
        self.FuncName = FuncName
        self.ArgsList = ArgsList
        self.BasicBlockList = BasicBlockList


    def CreateEmptyFunc(self, FuncName, ArgsList):
        self.Create(FuncName, ArgsList, [])
    

    def setFuncName(self, FuncName):
        self.FuncName = FuncName


    def Print(self):
        Func_Sig = "(define (" + self.FuncName
        for Arg in self.ArgsList:
            Func_Sig += (" " + Arg)
        Func_Sig += ")"
        print(Func_Sig)


class RoseRegion:
     def __init__(self):
        self.FuncName = ""
        self.ArgsList = []
        self.BasicBlockList = []
    
    def Create(self, FuncName, ArgsList, BasicBlockList):
        self.FuncName = FuncName
        self.ArgsList = ArgsList
        self.BasicBlockList = BasicBlockList


    def CreateEmptyFunc(self, FuncName, ArgsList):
        self.Create(FuncName, ArgsList, [])
    

    def setFuncName(self, FuncName):
        self.FuncName = FuncName


    def Print(self):
        Func_Sig = "(define (" + self.FuncName
        for Arg in self.ArgsList:
            Func_Sig += (" " + Arg)
        Func_Sig += ")"
        print(Func_Sig)   



class RoseLoop(RoseRegion):
    def __init__(self):
        self.InductionVar = None
        self.LowIndex = None
        self.HighIndex = None
        self.BlockList = []


class RoseLoopNest:
    def __init__(self, NumLoops):
        self.Loops = [None] * NumLoops


class RoseFunction(RoseRegion):
    def __init__(self):
        self.FuncName = ""
        self.ArgsList = []
        self.BasicBlockList = []
        
    
    def Create(self, FuncName, ArgsList, BasicBlockList):
        self.FuncName = FuncName
        self.ArgsList = ArgsList
        self.BasicBlockList = BasicBlockList


    def CreateEmptyFunc(self, FuncName, ArgsList):
        self.Create(FuncName, ArgsList, [])
    

    def setFuncName(self, FuncName):
        self.FuncName = FuncName


    def Print(self):
        Func_Sig = "(define (" + self.FuncName
        for Arg in self.ArgsList:
            Func_Sig += (" " + Arg)
        Func_Sig += ")"
        print(Func_Sig)

