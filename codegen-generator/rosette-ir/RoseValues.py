#############################################################
#
# This file contains all the different classes for values
# in Rosette IR.
#
#############################################################


from re import L
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseTypes import *
import RoseAbstractions 

import llvmlite


class RoseUndefValue(RoseValue):
  def __init__(self):
    super().__init__("undef", RoseUndefinedType.create(), ID=0)
  
  def __str__(self):
    return self.getName()

  def isClonable(self):
    return False
  
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    NotImplemented

  def to_llvm_ir(self, IRBuilder = None):
    return llvmlite.ir.Undefined()

  def print(self):
    print(self.getName())


# Constant value (integer and float) class
class RoseConstant(RoseValue):
  def __init__(self, Value, Type : RoseType):
    # Some sanity checks
    if type(Value) == int:
      assert isinstance(Type, RoseBitVectorType) \
          or isinstance(Type, RoseIntegerType) \
          or isinstance(Type, RoseStringType)
      if not isinstance(Type, RoseStringType):
        assert Value.bit_length() <= Type.getBitwidth()
    self.Val = Value
    if isinstance(Type, RoseStringType):
      assert type(self.Value) == str
    if not isinstance(Type, RoseStringType):
      super().__init__(str(Value), Type)
    else:
      super().__init__(Value, Type)
  
  @staticmethod
  def create(Value, Type :  RoseType):
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
    return self.Val == Other.Val and super().__eq__(Other)

  def __ne__(self, Other):
    if not isinstance(Other, RoseValue):
      return  True
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseOperation) \
    or isinstance(Other, RoseArgument):
      return True
    # Rule out the cases where we just compare agains plain ol' values
    if not isinstance(Other, RoseConstant) \
    and isinstance(Other, RoseValue):
        return True
    assert isinstance(Other, RoseConstant)
    return self.Val != Other.Val or super().__ne__(Other)
  
  def __hash__(self):
    return super().__hash__()

  def __str__(self):
    if isinstance(self.getType(), RoseStringType):
      return self.Val
    return str(self.Val)

  def getValue(self):
    return self.Val
  
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    if isinstance(self.getType(), RoseStringType):
      return self.Val
    return str(self.Val)

  def to_llvm_ir(self, IRBuilder = None):
    assert not isinstance(self.getType(), RoseStringType)
    return llvmlite.ir.Constant(self.getType().to_llvm_ir(), self.getValue())

  def print(self):
    print(self.Val)


class RoseArgument(RoseValue):
  def __init__(self, Name : str, Type : RoseType, Function):
    # Some sanity checks
    if isinstance(Function, RoseUndefValue) == False:
      assert isinstance(Function, RoseAbstractions.RoseFunction)
    self.Callee = Function
    super().__init__(Name, Type)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function = RoseUndefValue()):
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
    if not isinstance(Other, RoseValue):
      return  True
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseOperation) \
    or isinstance(Other, RoseConstant):
      return True
    # Rule out the cases where we just compare agains plain ol' values
    if not isinstance(Other, RoseArgument) \
    and isinstance(Other, RoseValue):
        return True
    assert isinstance(Other, RoseArgument)
    return self.Callee.getRegionID() != Other.Callee.getRegionID() or super().__ne__(Other)

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
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    self.Callee = Function
  
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    return self.getName()

  def print(self):
    print(self.getName())


# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
  def __init__(self, Opcode : RoseOpcode, Name : str, Operands : list, \
              ParentBlock = RoseAbstractions.RoseUndefRegion()):
    if not isinstance(ParentBlock, RoseAbstractions.RoseUndefRegion):
      assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
    self.Opcode = Opcode
    self.Operands = Operands
    self.ParentBlock = ParentBlock
    # The result of an operation is a RoseValue
    super().__init__(Name, Opcode.getOutputType(Operands))
    # Sanity check to see that the operand list is complete
    self.assertValidationOfInputs()
  
  def assertValidationOfInputs(self):
    assert self.getOpcode().inputsAreValid(self.getOperands())
  
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
        and self.ParentBlock.getRegionID() == Other.ParentBlock.getRegionID() \
        and super().__eq__(Other)

  def __ne__(self, Other):
    if not isinstance(Other, RoseValue):
      return  True
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseArgument) \
    or isinstance(Other, RoseConstant):
      return True
    # Rule out the cases where we just compare agains plain ol' values
    if not isinstance(Other, RoseOperation) \
    and isinstance(Other, RoseValue):
        return True
    assert isinstance(Other, RoseOperation)
    return self.Opcode != Other.Opcode or self.Operands != Other.Operands \
        or self.ParentBlock.getRegionID() != Other.ParentBlock.getRegionID() \
        or super().__ne__(Other)
  
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
  
  def cloneOperation(self, Suffix : str = "", ValueToValueMap : dict = dict()):
    if Suffix == "":
      return self.clone()
    if isinstance(self.getType(), RoseVoidType):
      ClonedOp = self.clone()
    else:
      ClonedOp = self.clone(self.getName() + "." + Suffix)
    ValueToValueMap[self] = ClonedOp
    for Index, Operand in enumerate(self.getOperands()):
      print("Operand:")
      Operand.print()
      if isinstance(Operand, RoseConstant):
        ClonedOperand = RoseConstant.create(Operand.getValue(), Operand.getType())
      else:
        ClonedOperand = ValueToValueMap[Operand]
      ClonedOp.setOperand(Index, ClonedOperand)
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
  
  def setOperand(self, Index, Operand):
    assert Index < len(self.Operands)
    self.Operands[Index] = Operand
  
  def setParent(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock) \
        or isinstance(Block, RoseAbstractions.RoseUndefRegion)
    self.ParentBlock = Block

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
    assert not isinstance(Block, RoseAbstractions.RoseUndefRegion)
    Function =  Block.getFunction()
    assert not isinstance(Function, RoseAbstractions.RoseUndefRegion)
    return Function.getUsersOf(self)
  
  def getNumUsers(self):
    Block = self.getParent()
    assert not isinstance(Block, RoseAbstractions.RoseUndefRegion)
    Function =  Block.getFunction()
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
      for Index, Operand in enumerate(self.Operands):
        if type(OldValue) != type(Operand):
            continue
        if Operand == OldValue:
          self.setOperand(Index, NewValue)
      return
    assert False, "Illegal number of arguments to replaceUsesWith"

  def replaceOperands(self, OperandList : list):
    # Check if the operands are valid
    assert self.getOpcode().inputsAreValid(OperandList)
    # Now replace each operand
    for Index, Operand in enumerate(OperandList):
      self.setOperand(Index, Operand)

  # Subclass must implement this
  def simplify(self):
    NotImplemented

  # Subclass must implement this
  def solve(self):
    NotImplemented

  # There are situations where value being extracted is defined
  # outside a loop. In Rosette, the indexing into bitvectors takes
  # place from right to left, instead of left to right. So we need
  # an operand for that.
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += "))\n"
    return String

  def print(self, NumSpace = 0):
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
    print(String)

