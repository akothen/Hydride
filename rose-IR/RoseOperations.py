from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseConstants import RoseConstant, RoseUndefRegion
from RoseOperation import RoseOperation


class RoseSignExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvsignextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseSignExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseSignExtendOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseZeroExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvzeroextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseZeroExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseZeroExtendOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseSliceOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, Low, High]
    super().__init__(RoseOpcode.bvextract, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseSliceOp(Name, Bitvector, Low, High, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)
  
  def getLowIndex(self):
    return self.getOperand(1)
  
  def getHighIndex(self):
    return self.getOperand(2)



class RoseNotOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseNotOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


class RoseNegOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvneg, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseNegOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


# This represents internal and external function calls
# This class is for operations whose opcodes are not known ahead of time.
class RoseCallOp(RoseOperation):
  def __init__(self, Name : str, Callee, OperandList : list, ParentBlock):
    assert Callee.getType().isFunctionTy()
    self.Callee = Callee
    super().__init__(RoseOpcode.call, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Callee, OperandList : list, ParentBlock = RoseUndefRegion()):
    return RoseCallOp(Name, Callee, OperandList, ParentBlock)
  
  # Override the function in the base class
  def assertValidationOfInputs(self):
    print("assertValidationOfInputs")
    assert RoseOpcode.call.callInputsAreValid(self.Callee, self.getOperands())
  
  # Override the function in the base class
  def getType(self):
    return self.Callee.getType().getReturnType()
  
  def getCallee(self):
    return self.Callee

  def print(self):
    Op = "(define (" + self.getName() + " (" + str(self.Opcode)
    for Operand in self.OperandList:
        Op += (" " + Operand.getName())
    Op += ")"
    print(Op)
    
 
