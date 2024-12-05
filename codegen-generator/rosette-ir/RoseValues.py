#############################################################
#
# This file contains all the different classes for values
# in Rosette IR.
#
#############################################################


from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseTypes import *
import RoseAbstractions
from RoseLLVMContext import *

from llvmlite.ir.values import Undefined as LLVMUndefined
from llvmlite.ir.values import Constant as LLVMConstant
from llvmlite.ir.types import VectorType as LLVMVectorType


class RoseUndefValue(RoseValue):
    def __init__(self):
        super().__init__("undef", RoseUndefinedType.create(), ID=0)

    def __str__(self):
        return self.getName()

    def isClonable(self):
        return False

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented

    def to_llvm_ir(self, Context: RoseLLVMContext = None):
        return LLVMUndefined

    def print(self):
        print(self.getName())

    def __str__(self):
        return self.getName()


# Constant value (integer and float) class
class RoseConstant(RoseValue):
    def __init__(self, Value, Type: RoseType):
        # Some sanity checks
        if type(Value) == int:
            assert isinstance(Type, RoseBitVectorType) \
                or isinstance(Type, RoseIntegerType) \
                or isinstance(Type, RoseStringType) \
                or isinstance(Type, RoseBooleanType)
            if not isinstance(Type, RoseStringType):
                if isinstance(Type.getBitwidth(), int):
                    assert Value.bit_length() <= Type.getBitwidth()
        self.Val = Value
        if isinstance(Type, RoseStringType):
            assert type(Value) == str
        if not isinstance(Type, RoseStringType):
            super().__init__(str(Value), Type)
        else:
            super().__init__(Value, Type)

    @staticmethod
    def create(Value, Type:  RoseType):
        return RoseConstant(Value, Type)

    def __eq__(self, Other):
        if not isinstance(Other, RoseValue):
            return False
        if isinstance(Other, RoseUndefValue) \
                or isinstance(Other, RoseOperation) \
                or isinstance(Other, RoseArgument):
            return False
        # Rule out the cases where we just compare agains plain ol' values
        if not isinstance(Other, RoseConstant) \
                and isinstance(Other, RoseValue):
            return False
        assert isinstance(Other, RoseConstant)
        return self.Val == Other.Val and self.getType() == Other.getType()

    def __ne__(self, Other):
        return not self.__eq__(Other)

    def __hash__(self):
        return super().__hash__()

    def __str__(self):
        if isinstance(self.getType(), RoseStringType):
            return self.Val
        return str(self.Val)

    def getValue(self):
        return self.Val

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        assert ReverseIndexing == False
        if isinstance(self.getType(), RoseStringType):
            return self.Val
        if isinstance(self.getType(), RoseBitVectorType):
            return "(bv " + str(self.Val) + " " + str(self.getType().getBitwidth()) + ")"
        return str(self.Val)

    def to_llvm_ir(self, Context: RoseLLVMContext = None):
        assert not isinstance(self.getType(), RoseStringType)
        if Context != None:
            # If this constant is a bitvector, then we may have element type
            # and number of elements.
            LLVMType = Context.getLLVMTypeFor(self)
            if LLVMType != None:
                if isinstance(LLVMType, LLVMVectorType):
                    # Now let's convert the constant value to hex
                    HexVal = hex(self.getValue())
                    HexValStr = str(HexVal)
                    NumElem = LLVMType.count
                    Precision = LLVMType.element
                    ElemBitwidth = Precision.width
                    Diff = (ElemBitwidth * NumElem) - (4 * len(HexValStr[2:]))
                    if Diff != 0:
                        Zeros = ""
                        for _ in range(int(Diff / 4)):
                            Zeros += "0"
                        HexValStr = HexValStr[:2] + Zeros + HexValStr[2:]
                    ElemList = list()
                    HexValStr = HexValStr[2:]
                    for Idx in range(NumElem):
                        Index = Idx * int(ElemBitwidth / 4)
                        if Index != (Index + int(ElemBitwidth / 4)):
                            ElemStr = HexValStr[Index: (
                                Index + int(ElemBitwidth / 4))]
                        else:
                            ElemStr = HexValStr[Index]
                        ElemStr = "0x" + ElemStr
                        ElemList.append(int(ElemStr, 16))
                    # Reverse the list of elements in elemlist because
                    # indexing in rosette works in reverse order.
                    ElemList.reverse()
                    return LLVMConstant(LLVMType, ElemList)
                else:
                    return LLVMConstant(LLVMType, self.getValue())
        return LLVMConstant(self.getType().to_llvm_ir(), self.getValue())

    def print(self):
        print(self.Val)

    def __str__(self):
        if not isinstance(self.Val, str):
            return str(self.Val)
        else:
            return self.Val


class RoseArgument(RoseValue):
    def __init__(self, Name: str, Type: RoseType, Function):
        # Some sanity checks
        if isinstance(Function, RoseUndefValue) == False:
            assert isinstance(Function, RoseAbstractions.RoseFunction)
        self.Callee = Function
        super().__init__(Name, Type)

    @staticmethod
    def create(Name: str, Type: RoseType, Function=RoseUndefValue()):
        return RoseArgument(Name, Type, Function)

    def __eq__(self, Other):
        if not isinstance(Other, RoseValue):
            return False
        if isinstance(Other, RoseUndefValue) \
                or isinstance(Other, RoseOperation) \
                or isinstance(Other, RoseConstant):
            return False
        # Rule out the cases where we just compare agains plain ol' values
        if not isinstance(Other, RoseArgument) \
                and isinstance(Other, RoseValue):
            return False
        assert isinstance(Other, RoseArgument)
        return self.Callee.getRegionID() == Other.Callee.getRegionID() and super().__eq__(Other)

    def __ne__(self, Other):
        return not self.__eq__(Other)

    # TODO: Should we also include callee in the hash?
    def __hash__(self):
        return super().__hash__()

    # This is same as __eq__ for rose arguments.
    def isSameAs(self, Other):
        return self.__eq__(Other)

    def getArgIndex(self):
        assert isinstance(self.Callee, RoseAbstractions.RoseFunction)
        return self.Callee.getIndexOfArg(self)

    def getFunction(self):
        return self.Callee

    def setFunction(self, Function):
        # Sanity checks
        assert (isinstance(Function, RoseAbstractions.RoseFunction)
                or isinstance(Function, RoseAbstractions.RoseUndefRegion))
        self.Callee = Function

    def verify(self):
        if not isinstance(self.Callee, RoseUndefValue):
            if self != self.Callee.getArg(self.getArgIndex()):
                return False
        # Nothing more to verify
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        assert ReverseIndexing == False
        return self.getName()

    def print(self):
        print(self.getName())

    def __str__(self):
        return self.getName()


# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
    def __init__(self, Opcode: RoseOpcode, Name: str, OperandsBundle: tuple,
                 ParentBlock=RoseAbstractions.RoseUndefRegion()):
        if not isinstance(ParentBlock, RoseAbstractions.RoseUndefRegion):
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        self.ParentBlock = ParentBlock
        self.Opcode = Opcode
        # The given operands can be a list or a tuple
        if isinstance(OperandsBundle, list):
            self.Operands = OperandsBundle
            # The result of an operation is a RoseValue
            Type = Opcode.getOutputType(self.Operands)
            super().__init__(Name, Type)
        else:
            assert isinstance(OperandsBundle, tuple)
            self.Operands = OperandsBundle[0]
            # The result of an operation is a RoseValue
            OpInfoBundle = OperandsBundle[1]
            super().__init__(Name, Opcode.getOutputType(self.Operands, OpInfoBundle))
        # Sanity check
        self.assertValidationOfInputs()

    def assertValidationOfInputs(self):
        assert self.getOpcode().inputsAreValid(self.getOperands(),
                                               self.getType(), self.getOpInfoBundle())

    def __eq__(self, Other):
        if not isinstance(Other, RoseValue):
            return False
        if isinstance(Other, RoseUndefValue) \
                or isinstance(Other, RoseArgument) \
                or isinstance(Other, RoseConstant):
            return False
        # Rule out the cases where we just compare agains plain ol' values
        if not isinstance(Other, RoseOperation) \
                and isinstance(Other, RoseValue):
            return False
        assert isinstance(Other, RoseOperation)
        return self.Opcode == Other.Opcode and self.Operands == Other.Operands \
            and self.getOpInfoBundle() == Other.getOpInfoBundle() \
            and self.ParentBlock.getRegionID() == Other.ParentBlock.getRegionID() \
            and super().__eq__(Other)

    def __ne__(self, Other):
        return not self.__eq__(Other)

    def __hash__(self):
        return super().__hash__()

    # This is different from __eq__ because here we want to see if
    # the compuations are the same.
    def isSameAs(self, Other):
        if isinstance(Other, RoseUndefValue) \
                or isinstance(Other, RoseArgument) \
                or isinstance(Other, RoseConstant):
            return False
        # Rule out the cases where we just compare agains plain ol' values
        if not isinstance(Other, RoseOperation) \
                and isinstance(Other, RoseValue):
            return False
        assert isinstance(Other, RoseOperation)
        return self.Opcode == Other.getOpcode() and self.Operands == Other.getOperands() \
            and self.getType() == Other.getType()

    def cloneOperation(self, Suffix: str = "", ValueToValueMap: dict = dict(), ChangeID: bool = False):
        if Suffix == "" and ChangeID == False:
            return self.clone()
        if isinstance(self.getType(), RoseVoidType):
            ClonedOp = self.clone(ChangeID=ChangeID)
        else:
            if Suffix != "":
                ClonedOp = self.clone(self.getName() + "." + Suffix, ChangeID)
            else:
                ClonedOp = self.clone(ChangeID=ChangeID)
        for Index, Operand in enumerate(self.getOperands()):
            if isinstance(Operand, RoseConstant):
                ClonedOperand = RoseConstant.create(
                    Operand.getValue(), Operand.getType())
            else:
                if Operand in ValueToValueMap:
                    ClonedOperand = ValueToValueMap[Operand]
                else:
                    if isinstance(Operand, RoseValue):
                        if Suffix != "":
                            ClonedOperand = Operand.clone(
                                Operand.getName() + "." + Suffix, ChangeID)
                        else:
                            ClonedOperand = Operand.clone(ChangeID=ChangeID)
                    else:
                        ClonedOperand = Operand.clone()
                    ValueToValueMap[Operand] = ClonedOperand
            ClonedOp.setOperand(Index, ClonedOperand)
        ValueToValueMap[self] = ClonedOp
        return ClonedOp

    def getOpcode(self):
        return self.Opcode

    def getOperands(self):
        return self.Operands

    def getParent(self):
        return self.ParentBlock

    def getOperand(self, Index):
        assert Index < len(self.Operands)
        return self.Operands[Index]

    def isSizeChangingOp(self):
        return self.Opcode.isSizeChangingOp()

    def setOperand(self, Index, NewOperand):
        assert Index < len(self.Operands)
        # Get all all uses of this instruction,
        # and replace their uses.
        Users = self.getUsers()
        OldSelf = self.cloneOperation()
        self.Operands[Index] = NewOperand
        for User in Users:
            User.replaceUsesWith(OldSelf, self)

    def setParent(self, Block):
        assert isinstance(Block, RoseAbstractions.RoseBlock) \
            or isinstance(Block, RoseAbstractions.RoseUndefRegion)
        # Get all all uses of this instruction,
        # and replace their uses.
        Users = self.getUsers()
        OldSelf = self.cloneOperation()
        self.ParentBlock = Block
        for User in Users:
            User.replaceUsesWith(OldSelf, self)

    # This is used to query if this operation uses
    #  the given value as an operand.
    def usesValue(self, Value):
        if isinstance(Value, RoseOperation):
            if Value == self:
                return False
        for Operand in self.Operands:
            if type(Value) != type(Operand):
                continue
            if Operand == Value:
                return True
        return False

    def getUsers(self):
        Block = self.getParent()
        if isinstance(Block, RoseAbstractions.RoseUndefRegion):
            return list()
        Function = Block.getFunction()
        assert not isinstance(Function, RoseAbstractions.RoseUndefRegion)
        return Function.getUsersOf(self)

    def getNumUsers(self):
        Block = self.getParent()
        if isinstance(Block, RoseAbstractions.RoseUndefRegion):
            return list()
        Function = Block.getFunction()
        assert not isinstance(Function, RoseAbstractions.RoseUndefRegion)
        return Function.getNumUsersOf(self)

    def getIndexForOperand(self, Operand):
        assert isinstance(Operand, RoseValue)
        for Index, CheckOperand in enumerate(self.getOperands()):
            if Operand == CheckOperand:
                return Index
        return None

    # This is an overloaded function
    def replaceUsesWith(self, *args):
        if len(args) == 1:
            # This means that we need to replace the uses of this operation
            # with the new value.
            NewValue = args[0]
            assert isinstance(NewValue, RoseValue)
            Function = self.getParent().getFunction()
            assert not isinstance(Function, RoseAbstractions.RoseUndefRegion)
            return Function.replaceUsesWith(self, NewValue)
        if len(args) == 2:
            # This means that the operands of this operation need to be replaced
            # with the new value.
            OldValue = args[0]
            NewValue = args[1]
            assert isinstance(OldValue, RoseValue)
            assert isinstance(NewValue, RoseValue)
            print("self:")
            self.print()
            print("OldValue:")
            OldValue.print()
            for Index, Operand in enumerate(self.Operands):
                print("Operand:")
                Operand.print()
                if type(OldValue) != type(Operand):
                    print("SKIP")
                    continue
                print("-")
                if Operand == OldValue:
                    self.setOperand(Index, NewValue)
                    # # Get all all uses of this instruction,
                    # # and replace their uses.
                    # Users = self.getUsers()
                    # OldSelf = self.cloneOperation()
                    # self.setOperand(Index, NewValue)
                    # for User in Users:
                    #     User.replaceUsesWith(OldSelf, self)
            return
        assert False, "Illegal number of arguments to replaceUsesWith"

    # Subclass must implement this
    def getOpInfoBundle(self):
        return None

    def replaceOperands(self, OperandList: list):
        # Check if the operands are valid
        assert self.getOpcode().inputsAreValid(OperandList, self.getType(),
                                               self.getOpInfoBundle())
        # Now replace each operand
        for Index, Operand in enumerate(OperandList):
            self.setOperand(Index, Operand)

    # Subclass must implement this
    def simplify(self):
        NotImplemented

    # Subclass must implement this
    def solve(self):
        NotImplemented

    def verify(self):
        # Verify the input operations
        if self.getOpcode().inputsAreValid(self.getOperands(), self.getType(),
                                           self.getOpInfoBundle()) == False:
            return False
        if self.getType() != self.getOpcode().getOutputType():
            return False
        return True

    # There are situations where value being extracted is defined
    # outside a loop. In Rosette, the indexing into bitvectors takes
    # place from right to left, instead of left to right. So we need
    # an operand for that.
    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        assert ReverseIndexing == False
        Spaces = ""
        for _ in range(NumSpace):
            Spaces += " "
        Name = super().getName()
        String = Spaces + "(define " + Name + " ("
        String += (self.Opcode.getRosetteOp() + " ")
        for Index, Operand in enumerate(self.getOperands()):
            if isinstance(Operand, RoseConstant) \
                    and isinstance(Operand.getType(), RoseBitVectorType):
                String += " " + Operand.to_rosette()
            else:
                String += " " + Operand.getName()
            if Index != len(self.getOperands()) - 1:
                String += " "
        String += "))\n"
        return String

    def __str__(self, NumSpace=0):
        Spaces = ""
        for _ in range(NumSpace):
            Spaces += " "
        Name = super().getName()
        String = ""
        if Name != "":
            String = Spaces + Name + " = "
        else:
            String = Spaces
        String += str(self.Opcode)
        for Index, Operand in enumerate(self.getOperands()):
            String += " " + str(Operand.getType()) + " " + Operand.getName()
            if Index != len(self.getOperands()) - 1:
                String += ","
        String += "\n"
        return String
    
    def print(self, NumSpace=0):
        print(self.__str__(NumSpace))
