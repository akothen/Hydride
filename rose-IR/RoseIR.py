
# File that puts all abstractions in Rose IR in one place

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
        Type.Bitwidth = 32
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
    
    def getBitwidth(self):
        assert(self.TypeEnum == self.RoseTypeEnum.BitVector \
            or self.TypeEnum == self.RoseTypeEnum.Integer)
        return self.Bitwidth
    
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
    bvsmin = auto()
    bvumin = auto()
    bvsmax = auto()
    bvumax = auto()
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
    bvzero = auto()
    bvrol = auto()
    bvror = auto()
    bit = auto()
    lsb = auto()
    msb = auto()
    bvadd1 = auto()
    bvsub1 = auto()
    rotateleft = auto()
    rotateright = auto()
    concat = auto()
    bvextract = auto()
    bvsignextract = auto()
    bvzeroextract = auto()
    bvlowextextract = auto()
    bvsignlowextract = auto()
    bvzerolowextract = auto()

    def __str__(self):
        return self.name
    
    def getBVOpInputs(self, Inputs : list):
        BVInputs = []
        for Input in Inputs:
            if Input.getType().isBitVectorTy():
                BVInputs.append(Input)
        return BVInputs

    def getOutputType(self, Inputs : list): 
        assert(len(Inputs) >= 1)
        if self.name == self.bvzero \
        or self.name == self.bit \
        or self.name == self.lsb \
        or self.name == self.msb:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(1)
        if self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1 \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) > 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(1)
        return None

    def inputsAreValid(self, Inputs : list): 
        if self.isValidNumInputs(len(Inputs)) == False:
            return False
        if self.name == self.bvzero \
        or self.name == self.bit \
        or self.name == self.lsb \
        or self.name == self.msb \
        or self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1 \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) > 1:
                return True
            else:
                return False
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror \
        or self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) == 2:
                return True
            else:
                return False
        return None
    
    def isValidNumInputs(self, NumInputs : int):
        if self.name == self.bvzero \
        or self.name == self.lsb \
        or self.name == self.msb \
        or self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1:
            return (NumInputs == 1)
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            return (NumInputs > 1)
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror \
        or self.name == self.bit \
        or self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            return (NumInputs == 2)
        return None


# Let's see how this could be useful
class HighOrderFunctions(Enum):
    apply = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name


# Base class for Rosette values. The values have name
# and type. Keeping this simple for now.
class RoseValue:
    def __init__(self, Name : str, Type : RoseType):
        self.Name = Name
        self.Type = Type

    def getType(self):
        return self.Type

    def getName(self):
        return self.Name
    
    def setName(self, Name : str):
        self.Name = Name

    def print(self):
        print(self.Name)


# An operation in Rosette
# An operation is either an instruction.
# TODO: complete the definition
class RoseOperation(RoseValue):
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock):
        # Sanity check to see that the operand list is complete
        assert(Opcode.inputsAreValid(OperandList))
        self.Opcode = Opcode
        self.OperandList = OperandList
        # The result of an operation is a RoseValue
        super().__init__(Name, Opcode.getOutputType(OperandList))
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = None):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert(Index < self.len(self.OperandList))
        self.OperandList[Index] = Operand
        # Sanity Check
        assert(self.Opcode.inputsAreValid(self.OperandList))

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.Opcode)
        for Operand in self.OperandList:
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)


# Abstract class representing a region.
# Regions can contain loops, function, blocks.
# Regions can be contained in functions and loops.
class RoseRegion:
    def __init__(self, Parent, Children : list):
        self.Parent = Parent
        self.Children = Children
    
    @staticmethod
    def create(self, Parent, Children : list):
        return RoseRegion(Parent, Children)
    
    def getChildren(self):
        return self.Children
    
    def getParent(self):
        return self.Parent
    
    def addChild(self, Child):
        self.Children.append(Child)

    def print(self):
        for Child in self.Children:
            Child.print()


# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
class RoseFunction(RoseRegion):
    def __init__(self, Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion : RoseRegion):
        self.Name = Name
        self.ArgList = ArgsList
        self.ReturnValue = RoseValue("", RetType)
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion : RoseRegion):
        return RoseFunction(Name, ArgsList, RetType, RegionList, ParentRegion)
    
    # Empty function
    @staticmethod
    def create(Name : str, ArgsList : list, RetType : RoseType):
        return RoseFunction(Name, ArgsList, RetType, [], None)

    def getNumArgs(self):
        return len(self.ArgsList)
    
    def getArg(self, Index):
        return self.ArgList[Index]
    
    def getReturnValue(self):
        return self.ReturnValue
    
    def getReturnTy(self):
        return self.ReturnValue.getType()
    
    def addArg(self, NewArg):
        self.ArgList.append(NewArg)

    def isTopLevelFunction(self):
        return (self.getParent() == None)

    def print(self):
        # Print function signature first
        Func_Sig = "(define (" + self.Name
        for Arg in self.ArgList:
            Func_Sig += (" " + Arg.getName())
        Func_Sig += ")"
        print(Func_Sig)
        # Print regions in this function
        super().print()
        print(")")


# This represents internal and external function calls
# This class is for operations whose opcodes are not known ahead of time.
class RoseFunctionCall(RoseValue):
    def __init__(self, Callee : RoseFunction, Name : str, OperandList : list, ParentBlock):
        # Sanity check to see that the operand list is complete
        #assert(Opcode.inputsAreValid(OperandList))
        self.Callee = Callee
        self.OperandList = OperandList
        # The result of a function call is a RoseValue
        super().__init__(Name, Callee.getReturnTy())
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Callee : RoseFunction, Name : str, OperandList : list, ParentBlock = None):
        return RoseOperation(Callee, Name, OperandList, ParentBlock)
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert(Index < self.len(self.OperandList))
        self.OperandList[Index] = Operand

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.Opcode)
        for Operand in self.OperandList:
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)


# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
    def __init__(self, OpList : list, ParentRegion):
        # Sanity check
        for Op in OpList:
            assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        super().__init__(ParentRegion, OpList)
        
    @staticmethod
    def create(OpList : list, ParentRegion):
        return RoseBlock(OpList, ParentRegion)

    def getOps(self):
        return self.getChildren()

    def addOp(self, Op):
        assert(isinstance(Op, RoseOperation)
            or isinstance(Op, RoseFunctionCall))
        self.addChild(Op)
 

# Class representing loops
# Loops have headers and region list for body
class RoseLoop(RoseRegion):
    def __init__(self, InductionVar : RoseValue, Start : int, End : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        # Loop header information
        self.InductionVar = InductionVar
        self.Start = Start
        self.End = End
        self.Step = Step
        # Loop region body
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(InductionVar : RoseValue, End : int, Start : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        return RoseLoop(InductionVar, Start, End, Step, RegionList, ParentRegion)

    # More regular loop
    @staticmethod
    def create(InductionVar : RoseValue, End : int, RegionList : list, ParentRegion : RoseRegion):
        return RoseLoop(InductionVar, 0, End, 1, RegionList, ParentRegion)

    # Empty loop
    @staticmethod
    def create(InductionVar : RoseValue, End : int, Start = 0, Step = 1):
        return RoseLoop(InductionVar, Start, End, Step, [], None)

    def getInductionVariable(self):
        return self.InductionVar
    
    def getStartIndex(self):
        return self.Start

    def getEndIndex(self):
        return self.End

    def getStep(self):
        return self.Step

    def print(self):
        LoopHeader = "(for/list ([" + self.InductionVar.getName() + " (range " \
            + str(self.Start) + " " + str(self.End) + " " + str(self.Step) + ")])"
        print(LoopHeader)
        # Print regions in this loop
        super().print()
        print(")")



