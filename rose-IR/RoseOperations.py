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
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseZeroExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseZeroExtendOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseExtractSliceOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, Low, High]
    RoseOperation.__init__(self, RoseOpcode.bvextract, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseExtractSliceOp(Name, Bitvector, Low, High, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)
  
  def getLowIndex(self):
    return self.getOperand(1)
  
  def getHighIndex(self):
    return self.getOperand(2)


class RoseInsertSliceOp(RoseOperation):
  def __init__(self, InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, \
              High : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    assert InsertVal.getType().isBitVectorTy()
    OperandList = [InsertVal, Bitvector, Low, High]
    RoseOperation.__init__(self, RoseOpcode.bvinsert, "", OperandList, ParentBlock)

  @staticmethod
  def create(InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseInsertSliceOp(InsertVal, Bitvector, Low, High, ParentBlock)

  def getInsertValue(self):
    return self.getOperand(0)

  def getBitVector(self):
    return self.getOperand(1)
  
  def getLowIndex(self):
    return self.getOperand(2)
  
  def getHighIndex(self):
    return self.getOperand(3)


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


class RoseReturnOp(RoseOperation):
  def __init__(self, Value : RoseValue, ParentBlock):
    OperandList = [Value]
    super().__init__(RoseOpcode.rosereturn, "", OperandList, ParentBlock)

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


class RoseCallOp(RoseOperation):
  def __init__(self, Name : str, Callee, OperandList : list, ParentBlock):
    assert Callee.getType().isFunctionTy()
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

  def print(self):
    Op = "(define (" + self.getName() + " (" + str(self.getOpcode())
    for Operand in self.getOperands():
        Op += (" " + Operand.getName())
    Op += ")"
    print(Op)


class RoseSelectOp(RoseOperation):
  def __init__(self, Name : str, Cond : RoseValue, Then : RoseValue, Else : RoseValue, ParentBlock):
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

  def print(self):
    Op = "(define (" + self.getName() + " (" + str(self.getOpcode())
    for Operand in self.getOperands():
        Op += (" " + Operand.getName())
    Op += ")"
    print(Op)

