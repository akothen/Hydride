
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseAbstractions import RoseUndefRegion
from RoseValues import *
from RoseBitVectorOperation import RoseBitVectorOp


class RoseBVSignExtendOp(RoseBitVectorOp):
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

  def getSignedness(self):
    return RoseOperation.Signedness.Signed

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    String += " " + self.getInputBitVector().getName()
    String += " (bitvector " + str(self.getOutputBitwidth())
    String += "))\n"
    return String


class RoseBVZeroExtendOp(RoseBitVectorOp):
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

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    String += " " + self.getInputBitVector().getName()
    String += " (bitvector " + str(self.getOutputBitwidth())
    String += "))\n"
    return String


class RoseBVSSaturateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvssat, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseBVSSaturateOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseBVSSaturateOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    return RoseOperation.Signedness.Signed

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "Saturate("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
    return String


class RoseBVUSaturateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvusat, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseBVUSaturateOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseBVUSaturateOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "USaturate("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
    return String


class RoseBVTruncateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvtrunc, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
            ParentBlock = RoseUndefRegion()):
    return RoseBVTruncateOp(Name, Bitvector, TargetBitwidth, ParentBlock)
    
  @staticmethod
  def create(Name : str, Bitvector : RoseValue, TargetBitwidth : int, ParentBlock = RoseUndefRegion()):
    TargetBitwidthVal = RoseConstant.create(TargetBitwidth, RoseType.getIntegerTy(32))
    return RoseBVTruncateOp(Name, Bitvector, TargetBitwidthVal, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare

  def to_rosette(self, NumSpace = 0):
    assert "No direct convertion of BVTruncate Op to Rosette. Run OpSimplify Pass!"
    NotImplemented


class RoseBVExtractSliceOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
              Bitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector, Low, High, Bitwidth]
    super().__init__(RoseOpcode.bvextract, Name, OperandList, ParentBlock)

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
  
  def getLowIndexPos(self):
    return 1
  
  def getHighIndexPos(self):
    return 2

  def isIndexingBVOp(self):
    return True

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    String += " " + self.getHighIndex().getName()
    String += " " + self.getLowIndex().getName()
    String += " " + self.getInputBitVector().getName()
    String += "))\n"
    return String


class RoseBVInsertSliceOp(RoseBitVectorOp):
  def __init__(self, InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, \
              High : RoseValue, Bitwidth : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    assert InsertVal.getType().isBitVectorTy()
    OperandList = [InsertVal, Bitvector, Low, High, Bitwidth]
    super().__init__(RoseOpcode.bvinsert, "", OperandList, ParentBlock)

  @staticmethod
  def create(InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
            Bitwidth : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVInsertSliceOp(InsertVal, Bitvector, Low, High, Bitwidth, ParentBlock)

  def getInsertValue(self):
    return self.getOperand(0)

  def getInputBitVector(self):
    return self.getOperand(1)
  
  def getLowIndex(self):
    return self.getOperand(2)
  
  def getHighIndex(self):
    return self.getOperand(3)

  def getLowIndexPos(self):
    return 2
  
  def getHighIndexPos(self):
    return 3

  def getBitwidthHandled(self):
    BitwidthVal = self.getOperand(4)
    assert isinstance(BitwidthVal, RoseConstant)
    return BitwidthVal.getValue()

  def isIndexingBVOp(self):
    return True

  def getSignedness(self):
    Operand = self.getInsertValue()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()

  def to_rosette(self, NumSpace = 0):
    assert "No direction convertion of BVInsert to Rosette!"
    NotImplemented



######################################## BITWISE OPERATORS ###########################

class RoseBVNotOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNotOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVAndOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAndOp(Name, Operands, ParentBlock)
  
  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned


class RoseBVOrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVOrOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned


class RoseBVXorOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvxor, Name, Operands, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVXorOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned


class RoseBVShlOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvshl, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVShlOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVLshrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvlshr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVLshrOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVAshrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvashr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVAshrOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()
  


######################################## ARITHMETIC OPERATORS ###########################


class RoseBVNegOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvneg, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNegOp(Name, Bitvector, ParentBlock)
  
  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVAddOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvadd, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAddOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned


class RoseBVSubOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsub, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSubOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned


class RoseBVMulOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvmul, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVMulOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    SignedOperandFound = False
    for Operand in self.getOperands():
      assert not isinstance(Operand, RoseUndefValue)
      if not isinstance(Operand, RoseOperation):
        return RoseOperation.Signedness.DontCare
      Signedness = Operand.getSignedness()
      if Signedness == RoseOperation.Signedness.Signed:
        SignedOperandFound = True
        continue
      if Signedness == RoseOperation.Signedness.DontCare:
        return RoseOperation.Signedness.DontCare
    if SignedOperandFound == True:
      return RoseOperation.Signedness.Signed
    return RoseOperation.Signedness.Unsigned

  
class RoseBVUdivOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvudiv, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUdivOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned


class RoseBVSdivOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsdiv, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSdivOp(Name, Operand1, Operand2, ParentBlock)
  
  def getSignedness(self):
    return RoseOperation.Signedness.Signed


class RoseBVUremOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvurem, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUremOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned


class RoseBVSremOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsrem, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSremOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Signed


class RoseBVSmodOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsmod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSmodOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Signed


############################# COMPARISON OPERATORS ###################################

class RoseBVEQOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bveq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVEQOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVNEQOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvneq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVNEQOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "bvnot (bveq " 
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + Operand.getName()
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
    return String


class RoseBVSLTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvslt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLTOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVULTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvult, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULTOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVSLEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsle, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLEOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVULEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvule, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULEOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVSGTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsgt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGTOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVUGTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvugt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGTOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVSGEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGEOp(Name, Operand1, Operand2, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


class RoseBVUGEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvuge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGEOp(Name, Operand1, Operand2, ParentBlock)
  
  def getSignedness(self):
    return RoseOperation.Signedness.DontCare



######################################## ADDITIONAL OPERATORS ###########################

class RoseBVAdd1Op(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvadd1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAdd1Op(Name, Bitvector, ParentBlock)
  
  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVSub1Op(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvsub1, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSub1Op(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVSminOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSminOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Signed


class RoseBVUminOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUminOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned


class RoseBVSmaxOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvsmax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSmaxOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Signed


class RoseBVUmaxOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.bvumax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUmaxOp(Name, Operands, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.Unsigned


class RoseBVRolOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvrol, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRolOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVRorOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBitVectorTy()
    assert Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvror, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRorOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def getSignedness(self):
    Operand = self.getInputBitVector()
    if not isinstance(Operand, RoseOperation):
      return RoseOperation.Signedness.DontCare
    return Operand.getSignedness()


class RoseBVZeroOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert Bitvector.getType().isBitVectorTy()
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvzero, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVZeroOp(Name, Bitvector, ParentBlock)

  def getSignedness(self):
    return RoseOperation.Signedness.DontCare


