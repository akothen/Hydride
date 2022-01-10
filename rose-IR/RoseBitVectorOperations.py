
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseAbstractions import RoseUndefRegion
from RoseValues import RoseOperation, RoseConstant


class RoseBVSignExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvsignextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSignExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseBVSignExtendOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseBVZeroExtendOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvzeroextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseBVZeroExtendOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseBVZeroExtendOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getTargetBitwidth(self):
    return self.getOperand(1)


class RoseBVExtractSliceOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
              Bitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, Low, High, Bitwidth]
    RoseOperation.__init__(self, RoseOpcode.bvextract, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
            Bitwidth : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVExtractSliceOp(Name, Bitvector, Low, High, Bitwidth, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)
  
  def getLowIndex(self):
    return self.getOperand(1)
  
  def getHighIndex(self):
    return self.getOperand(2)


class RoseBVInsertSliceOp(RoseOperation):
  def __init__(self, InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, \
              High : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    assert InsertVal.getType().isBitVectorTy()
    OperandList = [InsertVal, Bitvector, Low, High]
    RoseOperation.__init__(self, RoseOpcode.bvinsert, "", OperandList, ParentBlock)

  @staticmethod
  def create(InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseBVInsertSliceOp(InsertVal, Bitvector, Low, High, ParentBlock)

  def getInsertValue(self):
    return self.getOperand(0)

  def getBitVector(self):
    return self.getOperand(1)
  
  def getLowIndex(self):
    return self.getOperand(2)
  
  def getHighIndex(self):
    return self.getOperand(3)


######################################## BITWISE OPERATORS ###########################

class RoseBVNotOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNotOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


class RoseBVAndOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAndOp(Name, Operands, ParentBlock)


class RoseBVOrOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVOrOp(Name, Operands, ParentBlock)


class RoseBVXorOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvxor, Name, Operands, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVXorOp(Name, Operands, ParentBlock)


class RoseBVShlOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvshl, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVShlOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVLshrOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvlshr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVLshrOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVAshrOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvashr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVAshrOp(Name, Operand1, Operand2, ParentBlock)



######################################## ARITHMETIC OPERATORS ###########################


class RoseBVNegOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvneg, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNegOp(Name, Bitvector, ParentBlock)
  
  def getInputBitVector(self):
    return self.getOperand(0)


class RoseBVAddOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvadd, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAddOp(Name, Operands, ParentBlock)


class RoseBVSubOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsub, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSubOp(Name, Operands, ParentBlock)


class RoseBVMulOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvmul, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVMulOp(Name, Operands, ParentBlock)

  
class RoseBVUdivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvudiv, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUdivOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseBVSdivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsdiv, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSdivOp(Name, Operand1, Operand2, ParentBlock)
  
  
class RoseBVUremOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvurem, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUremOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseBVSremOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsrem, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSremOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseBVSmodOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsmod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSmodOp(Name, Operand1, Operand2, ParentBlock)



############################# COMPARISON OPERATORS ###################################

class RoseBVEQOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bveq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVEQOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVSLTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvslt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLTOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVULTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvult, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULTOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVSLEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsle, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLEOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVULEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvule, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULEOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVSGTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsgt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGTOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVUGTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvugt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGTOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVSGEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGEOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVUGEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvuge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGEOp(Name, Operand1, Operand2, ParentBlock)



######################################## ADDITIONAL OPERATORS ###########################

class RoseBVAdd1Op(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvadd1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAdd1Op(Name, Bitvector, ParentBlock)


class RoseBVSub1Op(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvsub1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSub1Op(Name, Bitvector, ParentBlock)


class RoseBVSminOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSminOp(Name, Operands, ParentBlock)


class RoseBVUminOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUminOp(Name, Operands, ParentBlock)


class RoseBVSmaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSmaxOp(Name, Operands, ParentBlock)


class RoseBVUmaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUmaxOp(Name, Operands, ParentBlock)


class RoseBVRolOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvrol, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRolOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVRorOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvror, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRorOp(Name, Operand1, Operand2, ParentBlock)


class RoseBVZeroOp(RoseOperation):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvzero, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVZeroOp(Name, Bitvector, ParentBlock)


