
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
import RoseAbstractions 

from enum import Enum, auto


class RoseUndefValue(RoseValue):
  def __init__(self):
    super().__init__("undef", RoseType.getUndefTy())
  
  def __str__(self):
    return self.getName()
  
  def print(self):
    print(self.getName())


# Constant value (integer and float) class
class RoseConstant(RoseValue):
  def __init__(self, Value, Type : RoseType):
    self.Val = Value
    super().__init__(str(Value), Type)
  
  @staticmethod
  def create(Value, Type :  RoseType):
    return RoseConstant(Value, Type)

  def __eq__(self, Other):
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
    return hash((self.getValue(), self.getType()))

  def __str__(self):
    return str(self.Val)

  def getValue(self):
    return self.Val
  
  def to_rosette(self):
    return str(self.Val)

  def print(self):
    print(self.Val)



class RoseArgument(RoseValue):
  def __init__(self, Name : str, Type : RoseType, Function, ArgIndex : int):
    # Some sanity checks
    if isinstance(Function, RoseUndefValue) == False:
      assert isinstance(Function, RoseAbstractions.RoseFunction)
      assert ArgIndex < Function.getNumArgs() 
      assert Function.getArg(ArgIndex).getType() == Type
    self.Callee = Function
    self.ArgIndex = ArgIndex
    super().__init__(Name, Type)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function = RoseUndefValue(), ArgIndex : int = 0):
    return RoseArgument(Name, Type, Function, ArgIndex)

  def __eq__(self, Other):
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseOperation) \
    or isinstance(Other, RoseConstant):
      return False
    # Rule out the cases where we just compare agains plain ol' values
    if not isinstance(Other, RoseArgument) \
    and isinstance(Other, RoseValue):
        return False
    assert isinstance(Other, RoseArgument)
    return self.ArgIndex == Other.ArgIndex \
      and self.Callee.getRegionID() == Other.Callee.getRegionID() and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseOperation) \
    or isinstance(Other, RoseConstant):
      return True
    # Rule out the cases where we just compare agains plain ol' values
    if not isinstance(Other, RoseArgument) \
    and isinstance(Other, RoseValue):
        return True
    assert isinstance(Other, RoseArgument)
    return self.ArgIndex != Other.ArgIndex \
      or self.Callee.getRegionID() != Other.Callee.getRegionID() or super().__ne__(Other)

  # TODO: Should we also include callee in the hash?
  def __hash__(self):
    return hash((self.getName(), self.getType(), self.ArgIndex))

  def getArgIndex(self):
    assert self.ArgIndex < self.Callee.getArg(self.getArgIndex()).getType()
    return self.ArgIndex
  
  def getFunction(self):
    return self.Callee
  
  def setFunction(self, Function):
    # Sanity checks
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    assert Function.getNumArgs() > self.ArgIndex
    assert Function.getArg(self.ArgIndex).getType() == self.getType()
    self.Callee = Function
  
  def print(self):
    print(self.getName())


# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
  class Signedness(Enum):
    Signed = auto()
    Unsigned = auto()
    DontCare = auto()

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
    return hash((self.getName(), self.getType(), self.Opcode))
  
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

  def getOpcode(self):
    return self.Opcode
  
  def getOperands(self):
    return self.Operands
  
  def getParent(self):
    return self.ParentBlock
  
  def getOperand(self, Index):
    assert Index < len(self.Operands)
    return self.Operands[Index]
  
  def setOperand(self, Index, Operand):
    assert Index < len(self.Operands)
    self.Operands[Index] = Operand
  
  def setParent(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock)
    self.ParentBlock = Block

  # This is used to query if this operation uses
  #  the given value as an operand.
  def usesValue(self, Value):
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
    return Block.getUsersOf(self)
  
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

  # Subclass must implement this
  def simplify(self):
    NotImplemented

  # Subclass must implement this
  def solve(self):
    NotImplemented

  # Subclass is expected to implement this function
  def isSigned(self):
    NotImplemented

  def to_rosette(self, NumSpace = 0):
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


