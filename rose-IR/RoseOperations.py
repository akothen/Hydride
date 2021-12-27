from RoseOperation import RoseOperation
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType, RoseBitVectorType


# Constant value (integer and float) class
class Constant(RoseValue):
  def __init__(self, Value, Type : RoseType):
      self.Val = Value
      super().__init__("", Type)
  
  @staticmethod
  def create(Value, Bitwidth : int):
      if isinstance(Value, int):
          return Constant(Value, RoseType.getIntegerTy(Bitwidth))
      if isinstance(Value, float):
          return Constant(Value, RoseType.getFloatTy())
      exit()

  def getValue(self):
      return self.Val
  
  def print(self):
      print(self.Val)


class RoseSignExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvsignextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock = None):
    return RoseSignExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = None):
    return RoseSignExtendOp(Name, Bitvector, Constant("", TargetBitwidth), ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseZeroExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvzeroextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock = None):
    return RoseZeroExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = None):
    return RoseZeroExtendOp(Name, Bitvector, Constant("", TargetBitwidth), ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseSliceOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, Low, High]
    super().__init__(RoseOpcode.bvextract, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, ParentBlock = None):
    return RoseSliceOp(Name, Bitvector, Low, High, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)
  
  def getLowIndex(self):
    return self.getOperand(1)
  
  def getHighIndex(self):
    return self.getOperand(2)



class RoseNotOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = None):
    return RoseNotOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


class RoseNegOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvneg, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = None):
    return RoseNegOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)
