
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
import RoseAbstractions 



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
    assert isinstance(Other, RoseConstant)
    return self.Val == Other.Val and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseOperation) \
    or isinstance(Other, RoseArgument):
      return True
    assert isinstance(Other, RoseConstant)
    return self.Val != Other.Val or super().__ne__(Other)
  
  def __str__(self):
    return str(self.Val)

  def getValue(self):
    return self.Val
  
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
      assert isinstance(Other, RoseArgument)
      return self.ArgIndex == Other.ArgIndex and self.Callee == Other.Callee \
              and super().__eq__(Other)

  def __ne__(self, Other):
      if isinstance(Other, RoseUndefValue) \
      or isinstance(Other, RoseOperation) \
      or isinstance(Other, RoseConstant):
        return True
      assert isinstance(Other, RoseArgument)
      return self.ArgIndex != Other.ArgIndex or self.Callee != Other.Callee \
          or super().__ne__(Other)

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
  def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, \
              ParentBlock = RoseAbstractions.RoseUndefRegion()):
    if not isinstance(ParentBlock, RoseAbstractions.RoseUndefRegion):
      assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
    print(OperandList)
    self.Opcode = Opcode
    self.OperandList = OperandList
    self.ParentBlock = ParentBlock
    # The result of an operation is a RoseValue
    super().__init__(Name, Opcode.getOutputType(OperandList))
    # Sanity check to see that the operand list is complete
    self.assertValidationOfInputs()
  
  def assertValidationOfInputs(self):
    assert self.getOpcode().inputsAreValid(self.getOperands())
  
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseArgument) \
    or isinstance(Other, RoseConstant):
      return False
    assert isinstance(Other, RoseOperation)
    return self.Opcode == Other.Opcode and self.OperandList == Other.OperandList \
        and self.ParentBlock == Other.ParentBlock and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseArgument) \
    or isinstance(Other, RoseConstant):
      return True
    assert isinstance(Other, RoseOperation)
    return self.Opcode != Other.Opcode or self.OperandList != Other.OperandList \
        or self.ParentBlock != Other.ParentBlock or super().__ne__(Other)
  
  def getOpcode(self):
    return self.Opcode
  
  def getOperands(self):
    return self.OperandList
  
  def getParent(self):
    return self.ParentBlock
  
  def getOperand(self, Index):
    assert Index < len(self.OperandList)
    return self.OperandList[Index]
  
  def setOperand(self, Index, Operand):
    assert Index < self.len(self.OperandList)
    self.OperandList[Index] = Operand
  
  def setParent(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock)
    self.ParentBlock = Block

  def print(self):
    Name = super().getName()
    String = ""
    if Name != "":
        String = Name + " = "
    String += str(self.Opcode)
    for Operand in self.getOperands():
        String += " " + Operand.getName()
    print(String)


