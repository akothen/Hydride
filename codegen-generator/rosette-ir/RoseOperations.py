##############################################################
#
# This file contains all the primitive ops for Rosette llvmlite.ir.
# Most of these ops are similar to the ones supported by
# Rosette language.
#
##############################################################


from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseAbstractions import RoseUndefRegion
from RoseValues import *
from RoseLLVMContext import *

import llvmlite


class RoseReturnOp(RoseOperation):
  def __init__(self, Value : RoseValue, ParentBlock):
    OperandList = [Value]
    super().__init__(RoseOpcode.ret, "", OperandList, ParentBlock)

  @staticmethod  
  def create(*args):
    if len(args) == 2:
      if isinstance(args[0], RoseValue):
        return RoseReturnOp(args[0], args[1])
    if len(args) == 1:
      if isinstance(args[0], RoseValue):
        return RoseReturnOp(args[0], RoseUndefRegion())
      if not isinstance(args[0], RoseValue):
        Value = RoseValue.create("", RoseType.getVoidTy())
        return RoseReturnOp(Value, args[0])
    if len(args) == 0:
      Value = RoseValue.create("", RoseType.getVoidTy())
      return RoseReturnOp(Value, RoseUndefRegion())
    assert False

  def getReturnedValue(self):
    return self.getOperands(0)

  def solve(self):
    # Cannot solve return ops
    return None

  def simplify(self):
    return RoseUndefValue()

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    String = Spaces + "(" + self.getReturnedValue().getName() + ")\n"
    return String

  def to_llvm_ir(self, Context : RoseLLVMContext):
    ReturnVal = Context.getLLVMValueFor(self.getReturnedValue())
    assert ReturnVal != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.ret(ReturnVal)


class RoseCallOp(RoseOperation):
  def __init__(self, Name : str, Callee, OperandList : list, ParentBlock):
    assert isinstance(Callee.getType(), RoseFunctionType)
    Operands = [Callee]
    Operands.extend(OperandList)
    super().__init__(RoseOpcode.call, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Callee, OperandList : list, ParentBlock = RoseUndefRegion()):
    return RoseCallOp(Name, Callee, OperandList, ParentBlock)
  
  def getCallee(self):
    return self.getOperands()[0]
  
  def getCallOperands(self):
    return self.getOperands()[1:]

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
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
    String += " " + self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + str(Operand.getType()) + " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += ","
    String += " )"
    print(String)
  
  def solve(self):
    # Cannot solve calls
    return None

  def simplify(self):
    return RoseUndefValue()


class RoseOpaqueCallOp(RoseOperation):
  def __init__(self, Name : str, Callee, OperandList : list, ParentBlock):
    assert isinstance(Callee.getType(), RoseStringType)
    Operands = [Callee]
    Operands.extend(OperandList)
    super().__init__(RoseOpcode.opaquecall, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Callee, OperandList : list, ParentBlock = RoseUndefRegion()):
    return RoseOpaqueCallOp(Name, Callee, OperandList, ParentBlock)
  
  def getCallee(self):
    return self.getOperands()[0]
  
  def getCallOperands(self):
    return self.getOperands()[1:]

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
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
    String += " " + self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + str(Operand.getType()) + " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += ","
    String += " )"
    print(String)
  
  def solve(self):
    # Cannot solve calls
    return None

  def simplify(self):
    return RoseUndefValue()


class RoseSelectOp(RoseOperation):
  def __init__(self, Name : str, Cond : RoseValue, Then : RoseValue, Else : RoseValue, ParentBlock):
    assert isinstance(Cond.getType(), RoseBooleanType) \
      or isinstance(Cond.getType(), RoseBitVectorType) 
    OperandList = [Cond, Then, Else]
    super().__init__(RoseOpcode.select, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Cond : RoseValue, Then : RoseValue, Else : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSelectOp(Name, Cond, Then, Else, ParentBlock)
  
  def getCondition(self):
    return self.getOperands()[0]
  
  def getThenValue(self):
    return self.getOperands()[1]
  
  def getElseValue(self):
    return self.getOperands()[2]

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    if isinstance(self.getCondition().getType(), RoseBitVectorType):
      ConditionString = "(equal? " + self.getCondition().getName() + " (bv #b1 1))\n"
    else:
      ConditionString = "(equal? " + self.getCondition().getName() + " #t)"
    if isinstance(self.getType(), RoseBitVectorType):
      if isinstance(self.getThenValue(), RoseConstant):
        ThenString = "(bv " + self.getThenValue().getName() + " " \
                    + str(self.getThenValue().getType().getBitwidth()) + ")"
      else:
        ThenString = self.getThenValue().getName()
      if isinstance(self.getElseValue(), RoseConstant):
        ElseString = "(bv " + self.getElseValue().getName() + " " \
                    + str(self.getElseValue().getType().getBitwidth()) + ")"
      else:
        ElseString = self.getElseValue().getName()
    else:
      ThenString = self.getThenValue().getName()
      ElseString = self.getElseValue().getName()
    String = Spaces + "(define " + Name + " (if " \
      + ConditionString + " " + ThenString + " " + ElseString +  "))\n"
    return String
    #assert "No direction convertion of Select Op to Rosette!"
    #NotImplemented

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Condition = Context.getLLVMValueFor(self.getCondition())
    assert Condition != llvmlite.ir.Undefined()
    Then = Context.getLLVMValueFor(self.getThenValue())
    assert Then != llvmlite.ir.Undefined()
    Else = Context.getLLVMValueFor(self.getElseValue())
    assert Else != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.select(Condition, Then, Else, self.getName())

  def solve(self):
    # Cannot solve select ops.
    # TODO: Support simplification for select ops.
    return None

  def simplify(self):
    Condition = self.getOperand(0) 
    if isinstance(Condition, RoseConstant):
      if Condition.getValue() == 1:
        return self.getOperand(1)
      assert  Condition.getValue() == 0
      return self.getOperand(2)
    return RoseUndefValue()


class RoseCastOp(RoseOperation):
  def __init__(self, Name : str, Operand : RoseValue, TargetType : RoseType, ParentBlock):
    assert isinstance(TargetType, RoseBitVectorType) \
      or isinstance(TargetType, RoseBooleanType) \
      or isinstance(TargetType, RoseIntegerType)
    assert isinstance(Operand.getType(), RoseBitVectorType) \
        or isinstance(Operand.getType(), RoseBooleanType) \
        or isinstance(Operand.getType(), RoseIntegerType)
    assert Operand.getType() != TargetType
    OperandList = [Operand, TargetType]
    super().__init__(RoseOpcode.cast, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand : RoseValue, TargetType : RoseType, 
            ParentBlock = RoseUndefRegion()):
    return RoseCastOp(Name, Operand, TargetType, ParentBlock)

  def solve(self):
    # Cannot solve casts.
    # TODO: Support simplification for casts
    return None

  def simplify(self):
    # Cannot simplify
    return RoseUndefValue()

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    if isinstance(self.getOperand(0).getType(), RoseBitVectorType) \
      and isinstance(self.getType(), RoseIntegerType):
      String += "bitvector->integer " + self.getOperand(0).getName() + "))\n"
    elif isinstance(self.getOperand(0).getType(), RoseIntegerType) \
      and isinstance(self.getType(), RoseBitVectorType):
      String += "integer->bitvector " + self.getOperand(0).getName() + " " \
              "(bitvector " + self.getType().getBitwidth() + "))\n"
    elif isinstance(self.getOperand(0).getType(), RoseBitVectorType) \
      and isinstance(self.getType(), RoseBooleanType):
      String += "bitvector->bool " + self.getOperand(0).getName() + "))\n"
    elif isinstance(self.getOperand(0).getType(), RoseBooleanType) \
      and isinstance(self.getType(), RoseBitVectorType):
      String += "bool->bitvector " + self.getOperand(0).getName() + " " \
              "(bitvector " + self.getType().getBitwidth() + "))\n"
    return String

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + Name + " = "
    String += str(self.Opcode)
    Operand = self.getOperand(0)
    String += " " + str(Operand.getType()) + " " + Operand.getName() \
              + ", " + str(self.getOperand(1))
    print(String)


class RoseAbsOp(RoseOperation):
  def __init__(self, Name : str, Operand : RoseValue, ParentBlock):
    assert isinstance(Operand.getType(), RoseIntegerType)
    OperandList = [Operand]
    super().__init__(RoseOpcode.abs, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Operand : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseAbsOp(Name, Operand, ParentBlock)
  
  def solve(self):
    # First check if all the operand is constant
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    return abs(self.getOperand(0).getValue())

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    OperandInLLVM = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    ZeroLLVM =  llvmlite.ir.Constant(self.getOperand(0).getType().to_llvm_ir(), 0)
    Condition = IRBuilder.icmp_signed(">=", OperandInLLVM, ZeroLLVM, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM
    Else = IRBuilder.neg(OperandInLLVM, "%neg." + self.getName())
    return IRBuilder.select(Condition, Then, Else, self.getName())


######################################## ARITHMETIC OPERATORS ###########################


class RoseAddOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.add, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAddOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result += Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      print("ADD Operand:")
      Operand.print()
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() != 0:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.add(Operand1, Operand2, self.getName())
    return IRBuilder.fadd(Operand1, Operand2, self.getName())


class RoseSubOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.sub, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseSubOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result -= Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Index, Operand in enumerate(self.getOperands()):
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() != 0:
          return RoseUndefValue()
        continue
      # Must be the first operand for this to be simplifiable
      if isinstance(Result, RoseUndefValue) and Index == 0:
        Result = Operand
        continue
      return RoseUndefValue()
    # Not the final result
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.sub(Operand1, Operand2, self.getName())
    return IRBuilder.fsub(Operand1, Operand2, self.getName())


class RoseMulOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.mul, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMulOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      # If any operand is zero, we can safely say that result is zero
      if Operand.getValue() == 0:
        return 0
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result *= Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() != 1:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.mul(Operand1, Operand2, self.getName())
    return IRBuilder.fmul(Operand1, Operand2, self.getName())


class RoseDivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.div, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseDivOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    # If the numerator is zero, the result is zero
    if self.getOperand(0).getValue() == 0:
      return 0
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    Result = (self.getOperand(0).getValue() / self.getOperand(1).getValue())
    # If the result is an integer, see if can be cast into an integer
    if isinstance(self.getOperand(0).getType(), RoseIntegerType) \
      and isinstance(self.getOperand(1).getType(), RoseIntegerType):
      if Result == int(Result):
        Result = int(Result)
    return Result
  
  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve() 
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if the denominator is 1, the result is the numerator
    if isinstance(self.getOperand(1), RoseConstant)  \
      and self.getOperand(1).getValue() == 1:
      return self.getOperand(0)
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.sdiv(Operand1, Operand2, self.getName())
    return IRBuilder.fdiv(Operand1, Operand2, self.getName())


class RoseRemOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.rem, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseRemOp(Name, Operand1, Operand2, ParentBlock)

  # TODO: Double check this
  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() % self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if the denominator is 1, the result is the numerator
    if isinstance(self.getOperand(1), RoseConstant)  \
      and self.getOperand(1).getValue() == 1:
      return self.getOperand(0)
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.srem(Operand1, Operand2, self.getName())
    return IRBuilder.frem(Operand1, Operand2, self.getName())
  

class RoseModOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.mod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseModOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() % self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if the denominator is 1, the result is the numerator
    if isinstance(self.getOperand(1), RoseConstant)  \
      and self.getOperand(1).getValue() == 1:
      return self.getOperand(0)
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    if isinstance(self.getType(), RoseIntegerType):
      return IRBuilder.srem(Operand1, Operand2, self.getName())
    return IRBuilder.frem(Operand1, Operand2, self.getName())


############################# COMPARISON OPERATORS ###################################

class RoseEQOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.equal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseEQOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() == self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("==", Operand1, Operand2, self.getName())


class RoseNEQOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.notequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseNEQOp(Name, Operand1, Operand2, ParentBlock)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "not (equal? " 
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
    return String

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() != self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("!=", Operand1, Operand2, self.getName())


class RoseLTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.lessthan, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseLTOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() < self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("<", Operand1, Operand2, self.getName())


class RoseLEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.lessthanequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseLEOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() <= self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("<=", Operand1, Operand2, self.getName())


class RoseGTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.greaterthan, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseGTOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() > self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed(">", Operand1, Operand2, self.getName())


class RoseGEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not isinstance(Operand1.getType(), RoseBitVectorType)
    assert not isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.greaterthanequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseGEOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() >= self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed(">=", Operand1, Operand2, self.getName())
  

######################################## ADDITIONAL OPERATORS ###########################


class RoseMinOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.min, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMinOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        if Result > Operand.getValue():
          Result = Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    OperandInLLVM1 = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM1 != llvmlite.ir.Undefined()
    OperandInLLVM2 = Context.getLLVMValueFor(self.getOperand(1))
    assert OperandInLLVM2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    Condition = IRBuilder.icmp_signed("<=", OperandInLLVM1, OperandInLLVM2, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM1
    Else = OperandInLLVM2
    return IRBuilder.select(Condition, Then, Else, self.getName())


class RoseMaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.max, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMaxOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        if Result < Operand.getValue():
          Result = Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation 
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    OperandInLLVM1 = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM1 != llvmlite.ir.Undefined()
    OperandInLLVM2 = Context.getLLVMValueFor(self.getOperand(1))
    assert OperandInLLVM2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    Condition = IRBuilder.icmp_signed(">=", OperandInLLVM1, OperandInLLVM2, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM1
    Else = OperandInLLVM2
    return IRBuilder.select(Condition, Then, Else, self.getName())


######################################## BOOLEAN OPERATORS ###########################


class RoseNotOp(RoseOperation):
  def __init__(self, Name : str, Value : RoseValue, ParentBlock):
    assert isinstance(Value.getType(), RoseBooleanType)
    OperandList = [Value]
    super().__init__(RoseOpcode.boolnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Value : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseNotOp(Name, Value, ParentBlock)

  def getInputValue(self):
    return self.getOperand(0)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    return ~(self.getOperand(0).getValue())

  def simplify(self):
    # Try solving the operation
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    return RoseUndefValue()

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getInputValue())
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.not_(Operand, self.getName())


class RoseAndOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBooleanType)
    super().__init__(RoseOpcode.booland, Name, Operands, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAndOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result &= Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() == 0:
          return RoseConstant(0, self.getType())
        if Operand.getValue() != 1:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.and_(Operand1, Operand2, self.getName())


class RoseNandOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBooleanType)
    super().__init__(RoseOpcode.boolnand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseNandOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result &= Operand.getValue()
    # Not the final result
    return ~Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() == 0:
          # Not the result
          return RoseConstant(1, self.getType())
        if Operand.getValue() != 1:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    # Not the result
    return RoseNotOp.create("not." + Result.getName(), Result)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    AndInst = IRBuilder.and_(Operand1, Operand2, self.getName())
    return IRBuilder.not_(AndInst, "not." + self.getName())


class RoseOrOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBooleanType)
    super().__init__(RoseOpcode.boolor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseOrOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result |= Operand.getValue()
    return Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() == 1:
          return RoseConstant(1, self.getType())
        if Operand.getValue() != 0:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.or_(Operand1, Operand2, self.getName())


class RoseNorOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBooleanType)
    super().__init__(RoseOpcode.boolnor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseNorOp(Name, Operands, ParentBlock)

  def solve(self):
    # First check if all the operands are constants
    Result = None
    for Index, Operand in enumerate(self.getOperands()):
      if not isinstance(Operand, RoseConstant):
        return None
      if Index == 0:
        Result = Operand.getValue()
      else:
        Result |= Operand.getValue()
    # Not the final result
    return ~Result

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() == 1:
          # Not the result
          return RoseConstant(0, self.getType())
        if Operand.getValue() != 0:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    # Not the final result
    return RoseNotOp.create("not." + Result.getName(), Result)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    OrInst = IRBuilder.or_(Operand1, Operand2, self.getName())
    return IRBuilder.not_(OrInst, "not." + self.getName())


class RoseXorOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBooleanType)
    assert isinstance(Operand2.getType(), RoseBooleanType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.boolxor, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseXorOp(Name, Operand1, Operand2, ParentBlock)

  def solve(self):
    # First check if the operand are constants
    if not isinstance(self.getOperand(0), RoseConstant):
      return None
    if not isinstance(self.getOperand(1), RoseConstant):
      return None
    return (self.getOperand(0).getValue() ^ self.getOperand(1).getValue())

  def simplify(self):
    # Try solving the operation first
    SolvedResult = self.solve()
    if SolvedResult != None:
      return RoseConstant(SolvedResult, self.getType())
    # See if there is only one non-constant operand that we can return
    Result = RoseUndefValue()
    for Operand in self.getOperands():
      if isinstance(Operand, RoseConstant):
        if Operand.getValue() != 0:
          return RoseUndefValue()
        continue
      if isinstance(Result, RoseUndefValue):
        Result = Operand
        continue
      return RoseUndefValue()
    # Not the final result
    return Result

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.xor(Operand1, Operand2, self.getName())



