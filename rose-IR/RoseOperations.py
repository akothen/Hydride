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


######################################## BITWISE OPERATORS ###########################

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


class RoseAndOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAndOp(Name, Operands, ParentBlock)


class RoseOrOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseOrOp(Name, Operands, ParentBlock)


class RoseXorOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvxor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseXorOp(Name, Operands, ParentBlock)


class RoseShlOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvshl, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseShlOp(Name, Operand1, Operand2, ParentBlock)


class RoseLshrOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvlshr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseLshrOp(Name, Operand1, Operand2, ParentBlock)


class RoseAshrOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvashr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseAshrOp(Name, Operand1, Operand2, ParentBlock)



######################################## ARITHMETIC OPERATORS ###########################


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


class RoseAddOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvadd, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAddOp(Name, Operands, ParentBlock)


class RoseSubOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsub, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseSubOp(Name, Operands, ParentBlock)


class RoseMulOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvmul, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMulOp(Name, Operands, ParentBlock)

  
class RoseUdivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvudiv, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUdivOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseSdivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsdiv, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSdivOp(Name, Operand1, Operand2, ParentBlock)
  
  
class RoseUremOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvurem, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUremOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseSremOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsrem, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSremOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseSmodOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsmod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSmodOp(Name, Operand1, Operand2, ParentBlock)



############################# COMPARISON OPERATORS ###################################

class RoseEqOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bveq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseEqOp(Name, Operand1, Operand2, ParentBlock)


class RoseSltOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvslt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSltOp(Name, Operand1, Operand2, ParentBlock)


class RoseUltOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvult, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUltOp(Name, Operand1, Operand2, ParentBlock)


class RoseSleOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsle, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSleOp(Name, Operand1, Operand2, ParentBlock)


class RoseUleOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvule, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUleOp(Name, Operand1, Operand2, ParentBlock)


class RoseSgtOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsgt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSgtOp(Name, Operand1, Operand2, ParentBlock)


class RoseUgtOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvugt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUgtOp(Name, Operand1, Operand2, ParentBlock)


class RoseSgeOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSgeOp(Name, Operand1, Operand2, ParentBlock)


class RoseUgeOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvuge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseUgeOp(Name, Operand1, Operand2, ParentBlock)



######################################## ADDITIONAL OPERATORS ###########################

class RoseAdd1Op(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvadd1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseAdd1Op(Name, Bitvector, ParentBlock)


class RoseSub1Op(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvsub1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseSub1Op(Name, Bitvector, ParentBlock)


class RoseSminOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseSminOp(Name, Operands, ParentBlock)


class RoseUminOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseUminOp(Name, Operands, ParentBlock)


class RoseSmaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseSmaxOp(Name, Operands, ParentBlock)


class RoseUmaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseUmaxOp(Name, Operands, ParentBlock)


class RoseRolOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvrol, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseRolOp(Name, Operand1, Operand2, ParentBlock)


class RoseRorOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvror, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseRorOp(Name, Operand1, Operand2, ParentBlock)


class RoseZeroOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvzero, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseZeroOp(Name, Bitvector, ParentBlock)

