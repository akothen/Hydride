##################################################################
#
# This files contains definitions of all bitvector ops supported
# in Rosette llvmlite.ir. Most of these operations are similar to the ones
# supported by the Rosette language.
#
##################################################################


from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseValues import *
from RoseBitVectorOperation import RoseBitVectorOp
from RoseSaturableBitVectorOperation import RoseSaturableBitVectorOp
from RoseLLVMContext import *

import llvmlite


class RoseBVSignExtendOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType) 
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvsignextend, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(*args):
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[3], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVSignExtendOp(args[0], args[1], TargetBitwidthVal, args[3])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseBlock):
        return RoseBVSignExtendOp(args[0], args[1], args[2], args[3])
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVSignExtendOp(args[0], args[1], TargetBitwidthVal, RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        return RoseBVSignExtendOp(args[0], args[1], args[2], RoseUndefRegion())
    assert(False)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    String += " " + self.getInputBitVector().getName()
    String += " (bitvector " + str(self.getOutputBitwidth())
    String += ")))\n"
    return String

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getInputBitVector())
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.sext(Operand, self.getType().to_llvm_ir(), self.getName())


class RoseBVZeroExtendOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvzeroextend, Name, OperandList, ParentBlock)

  @staticmethod
  def create(*args):
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[3], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVZeroExtendOp(args[0], args[1], TargetBitwidthVal, args[3])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseBlock):
        return RoseBVZeroExtendOp(args[0], args[1], args[2], args[3])
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVZeroExtendOp(args[0], args[1], TargetBitwidthVal, RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        return RoseBVZeroExtendOp(args[0], args[1], args[2], RoseUndefRegion())
    assert(False)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    String += " " + self.getInputBitVector().getName()
    String += " (bitvector " + str(self.getOutputBitwidth())
    String += ")))\n"
    return String

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getInputBitVector())
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.zext(Operand, self.getType().to_llvm_ir(), self.getName())


class RoseBVSSaturateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvssat, Name, OperandList, ParentBlock)

  @staticmethod
  def create(*args):
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[3], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVSSaturateOp(args[0], args[1], TargetBitwidthVal, args[3])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseBlock):
        return RoseBVSSaturateOp(args[0], args[1], args[2], args[3])
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVSSaturateOp(args[0], args[1], TargetBitwidthVal, RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        return RoseBVSSaturateOp(args[0], args[1], args[2], RoseUndefRegion())
    assert(False)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    String = Spaces + "(define " + self.getName() + " (bvssat "
    String += self.getOperand(0).getName() + " " \
            + str(self.getOperand(0).getOutputBitwidth()) \
            + " " + self.getOperand(1).getName() + " "
    String += "))\n"
    return String


class RoseBVUSaturateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvusat, Name, OperandList, ParentBlock)

  @staticmethod
  def create(*args):
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[3], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVUSaturateOp(args[0], args[1], TargetBitwidthVal, args[3])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseBlock):
        return RoseBVUSaturateOp(args[0], args[1], args[2], args[3])
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVUSaturateOp(args[0], args[1], TargetBitwidthVal, RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        return RoseBVUSaturateOp(args[0], args[1], args[2], RoseUndefRegion())
    assert(False)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    String = Spaces + "(define " + self.getName() + " (bvusat "
    String += self.getOperand(0).getName() + " " \
            + str(self.getOperand(0).getOutputBitwidth()) \
            + " " + self.getOperand(1).getName() + " "
    String += "))\n"
    return String


class RoseBVTruncateOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector, TargetBitwidth]
    super().__init__(RoseOpcode.bvtrunc, Name, OperandList, ParentBlock)

  @staticmethod
  def create(*args):
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[3], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVTruncateOp(args[0], args[1], TargetBitwidthVal, args[3])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseBlock):
        return RoseBVTruncateOp(args[0], args[1], args[2], args[3])
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        return RoseBVTruncateOp(args[0], args[1], TargetBitwidthVal, RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        return RoseBVTruncateOp(args[0], args[1], args[2], RoseUndefRegion())
    assert(False)

  def getInputBitVector(self):
    return self.getOperand(0)

  # Rosette has no truncate op. So we use bitvector extract to model it.
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = self.getName()
    InputOp = self.getInputBitVector()
    assert isinstance(InputOp, RoseBitVectorOp)
    LowIndexName = Name + ".low.idx"
    HighIndexName = Name + ".high.idx"
    BVSize = InputOp.getOutputBitwidth()
    if isinstance(BVSize, RoseValue):
      String = Spaces + "(define " + HighIndexName + " "  \
              + "(- " + str(BVSize) + " 1))\n"
    else:
      String = Spaces + "(define " + HighIndexName + " "  \
              + str(BVSize - 1) + ")\n"
    if ReverseIndexing == False:
      String += Spaces + "(define " + LowIndexName + " "  \
              + "(- " + HighIndexName + " " \
              + self.getOperand(1).getName() + " -1 ))\n"
    else:
      InputBVSize = self.getInputBitVector().getType().getBitwidth()
      if not isinstance(InputBVSize, RoseValue):
        ReverseIndexString = "(- " + str(InputBVSize - 1)+ " "
      else:
         ReverseIndexString = "(- (- " + str(InputBVSize)+ " 1) "
      # DO NOT CHANGE THIS ORDER
      String += " " + ReverseIndexString + LowIndexName + ")"
      String += " " + ReverseIndexString + HighIndexName + ")"
    String += Spaces + "(define " + Name + " ("
    String += RoseOpcode.bvextract.getRosetteOp() + " "
    String += " " + HighIndexName
    String += " " + LowIndexName
    String += " " + self.getInputBitVector().getName()
    String += "))\n"
    return String

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getInputBitVector())
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.trunc(Operand, self.getType().to_llvm_ir(), self.getName())


class RoseBVExtractSliceOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, Low : RoseValue, High : RoseValue, \
              Bitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
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
  
  def getBitwidthPos(self):
    return 3

  def getOutputBitwidth(self):
    BitwidthVal = self.getOperand(self.getBitwidthPos())
    #assert isinstance(BitwidthVal, RoseConstant)
    if isinstance(BitwidthVal, RoseConstant):
      return BitwidthVal.getValue()
    else:
      return BitwidthVal

  def isIndexingBVOp(self):
    return True

  # There are situations where value being extracted is defined
  # outside a loop. In Rosette, the indexing into bitvectors takes
  # place from right to left, instead of left to right. So we need
  # to reverse the order of extraction as well.
  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += (self.Opcode.getRosetteOp() + " ")
    if ReverseIndexing == False:
      String += " " + self.getHighIndex().getName()
      String += " " + self.getLowIndex().getName()
    else:
      InputBVSize = self.getInputBitVector().getType().getBitwidth()
      if not isinstance(InputBVSize, RoseValue):
        ReverseIndexString = "(- " + str(InputBVSize - 1)+ " "
      else:
         ReverseIndexString = "(- (- " + str(InputBVSize)+ " 1) "
      # DO NOT CHANGE THIS ORDER
      String += " " + ReverseIndexString + self.getLowIndex().getName() + ")"
      String += " " + ReverseIndexString + self.getHighIndex().getName() + ")"
    String += " " + self.getInputBitVector().getName()
    String += "))\n"
    return String


class RoseBVInsertSliceOp(RoseBitVectorOp):
  def __init__(self, InsertVal : RoseValue, Bitvector : RoseValue, Low : RoseValue, \
              High : RoseValue, Bitwidth : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    assert isinstance(InsertVal.getType(), RoseBitVectorType)
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

  def getBitwidthPos(self):
    return 4

  def getOutputBitwidth(self):
    BitwidthVal = self.getOperand(self.getBitwidthPos())
    #assert isinstance(BitwidthVal, RoseConstant)
    if isinstance(BitwidthVal, RoseConstant):
      return BitwidthVal.getValue()
    else:
      return BitwidthVal

  def isIndexingBVOp(self):
    return True

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    assert "No direction convertion of BVInsert to Rosette!"
    NotImplemented



######################################## BITWISE OPERATORS ###########################

class RoseBVNotOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNotOp(Name, Bitvector, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.not_(Operand, self.getName())


class RoseBVAndOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAndOp(Name, Operands, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.and_(Operand1, Operand2, self.getName())


class RoseBVOrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVOrOp(Name, Operands, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.or_(Operand1, Operand2, self.getName())


class RoseBVXorOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvxor, Name, Operands, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVXorOp(Name, Operands, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.xor(Operand1, Operand2, self.getName())


class RoseBVShlOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvshl, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVShlOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.shl(Operand1, Operand2, self.getName())


class RoseBVLshrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvlshr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVLshrOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.lshr(Operand1, Operand2, self.getName())


class RoseBVAshrOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvashr, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVAshrOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.ashr(Operand1, Operand2, self.getName())


######################################## ARITHMETIC OPERATORS ###########################


class RoseBVNegOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvneg, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVNegOp(Name, Bitvector, ParentBlock)
  
  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    Operand = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.neg(Operand, self.getName())


class RoseBVAddOp(RoseSaturableBitVectorOp):
  def __init__(self, Name : str, Operands : list,  NoSignedWrap : bool, \
                NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvadd, Name, Operands, NoSignedWrap, \
                    NoUnsignedWrap, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAddOp(Name, Operands, False, False, ParentBlock)

  @staticmethod
  def createNSW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAddOp(Name, Operands, True, False, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVAddOp(Name, Operands, False, True, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    SaturationQualifier = self.getSaturationQualifier()
    if SaturationQualifier != None:
      return IRBuilder.add(Operand1, Operand2, self.getName())
    return IRBuilder.add(Operand1, Operand2, self.getName(), flags=(SaturationQualifier,))


class RoseBVSubOp(RoseSaturableBitVectorOp):
  def __init__(self, Name : str, Operands : list,  NoSignedWrap : bool, \
                NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvsub, Name, Operands, NoSignedWrap, \
                    NoUnsignedWrap, ParentBlock)

  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSubOp(Name, Operands, False, False, ParentBlock)

  @staticmethod
  def createNSW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSubOp(Name, Operands, True, False, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSubOp(Name, Operands, False, True, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    SaturationQualifier = self.getSaturationQualifier()
    if SaturationQualifier != None:
      return IRBuilder.sub(Operand1, Operand2, self.getName())
    return IRBuilder.sub(Operand1, Operand2, self.getName(), flags=(SaturationQualifier,))


class RoseBVMulOp(RoseSaturableBitVectorOp):
  def __init__(self, Name : str, Operands : list,  NoSignedWrap : bool, \
                NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvmul, Name, Operands, NoSignedWrap, \
                    NoUnsignedWrap, ParentBlock)

  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVMulOp(Name, Operands, False, False, ParentBlock)

  @staticmethod
  def createNSW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVMulOp(Name, Operands, True, False, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVMulOp(Name, Operands, False, True, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    SaturationQualifier = self.getSaturationQualifier()
    if SaturationQualifier != None:
      return IRBuilder.mul(Operand1, Operand2, self.getName())
    return IRBuilder.mul(Operand1, Operand2, self.getName(), flags=(SaturationQualifier,))


class RoseBVUdivOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvudiv, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUdivOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.udiv(Operand1, Operand2, self.getName())


class RoseBVSdivOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsdiv, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSdivOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.sdiv(Operand1, Operand2, self.getName())


class RoseBVUremOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvurem, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUremOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.urem(Operand1, Operand2, self.getName())


class RoseBVSremOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsrem, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSremOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.srem(Operand1, Operand2, self.getName())


class RoseBVSmodOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsmod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSmodOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.srem(Operand1, Operand2, self.getName())


############################# COMPARISON OPERATORS ###################################

class RoseBVEQOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bveq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVEQOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("==", Operand1, Operand2, self.getName())


class RoseBVNEQOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvneq, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVNEQOp(Name, Operand1, Operand2, ParentBlock)

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "not (bveq " 
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + Operand.getName()
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))\n"
    return String

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("!=", Operand1, Operand2, self.getName())


class RoseBVSLTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvslt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLTOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("<", Operand1, Operand2, self.getName())


class RoseBVULTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvult, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULTOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_unsigned("<", Operand1, Operand2, self.getName())


class RoseBVSLEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsle, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSLEOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("<=", Operand1, Operand2, self.getName())


class RoseBVULEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvule, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVULEOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_unsigned("<=", Operand1, Operand2, self.getName())


class RoseBVSGTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsgt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGTOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed(">", Operand1, Operand2, self.getName())


class RoseBVUGTOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvugt, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGTOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_unsigned(">", Operand1, Operand2, self.getName())


class RoseBVSGEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvsge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVSGEOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed(">=", Operand1, Operand2, self.getName())


class RoseBVUGEOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvuge, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVUGEOp(Name, Operand1, Operand2, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand1 = Context.getLLVMValueFor(self.getOperand(0))
    assert Operand1 != llvmlite.ir.Undefined()
    Operand2 = Context.getLLVMValueFor(self.getOperand(1))
    assert Operand2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_unsigned(">=", Operand1, Operand2, self.getName())


######################################## ADDITIONAL OPERATORS ###########################

class RoseBVAdd1Op(RoseSaturableBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue,  NoSignedWrap : bool, \
                NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvadd1, Name, OperandList, NoSignedWrap, \
                    NoUnsignedWrap, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAdd1Op(Name, Bitvector, False, False, ParentBlock)
  
  @staticmethod
  def createNSW(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAdd1Op(Name, Bitvector, True, False, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAdd1Op(Name,Bitvector,  False, True, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand = Context.getLLVMValueFor(self.getInputBitVector())
    assert Operand != llvmlite.ir.Undefined()
    OneLLVM =  llvmlite.ir.Constant(self.getInputBitVector().getType().to_llvm_ir(), 1)
    IRBuilder = Context.getLLVMBuilder()
    SaturationQualifier = self.getSaturationQualifier()
    if SaturationQualifier != None:
      return IRBuilder.add(Operand, OneLLVM, self.getName())
    return IRBuilder.add(Operand, OneLLVM, self.getName(), flags=(SaturationQualifier,))


class RoseBVSub1Op(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue,  NoSignedWrap : bool, \
                NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvsub1, Name, OperandList, NoSignedWrap, \
                    NoUnsignedWrap, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSub1Op(Name, Bitvector, False, False, ParentBlock)
  
  @staticmethod
  def createNSW(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSub1Op(Name, Bitvector, True, False, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVSub1Op(Name,Bitvector,  False, True, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    Operand = Context.getLLVMValueFor(self.getInputBitVector())
    assert Operand != llvmlite.ir.Undefined()
    OneLLVM =  llvmlite.ir.Constant(self.getInputBitVector().getType().to_llvm_ir(), 1)
    IRBuilder = Context.getLLVMBuilder()
    SaturationQualifier = self.getSaturationQualifier()
    if SaturationQualifier != None:
      return IRBuilder.sub(Operand, OneLLVM, self.getName())
    return IRBuilder.sub(Operand, OneLLVM, self.getName(), flags=(SaturationQualifier,))


class RoseBVSminOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvsmin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSminOp(Name, Operands, ParentBlock)

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


class RoseBVUminOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvumin, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUminOp(Name, Operands, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    OperandInLLVM1 = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM1 != llvmlite.ir.Undefined()
    OperandInLLVM2 = Context.getLLVMValueFor(self.getOperand(1))
    assert OperandInLLVM2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    Condition = IRBuilder.icmp_unsigned("<=", OperandInLLVM1, OperandInLLVM2, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM1
    Else = OperandInLLVM2
    return IRBuilder.select(Condition, Then, Else, self.getName())


class RoseBVSmaxOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvsmax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVSmaxOp(Name, Operands, ParentBlock)

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


class RoseBVUmaxOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvumax, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseBVUmaxOp(Name, Operands, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    assert len(self.getOperands()) == 2
    OperandInLLVM1 = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM1 != llvmlite.ir.Undefined()
    OperandInLLVM2 = Context.getLLVMValueFor(self.getOperand(1))
    assert OperandInLLVM2 != llvmlite.ir.Undefined()
    IRBuilder = Context.getLLVMBuilder()
    Condition = IRBuilder.icmp_unsigned(">=", OperandInLLVM1, OperandInLLVM2, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM1
    Else = OperandInLLVM2
    return IRBuilder.select(Condition, Then, Else, self.getName())


class RoseBVRolOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvrol, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRolOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


class RoseBVRorOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvror, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseBVRorOp(Name, Operand1, Operand2, ParentBlock)

  def getInputBitVector(self):
    return self.getOperand(0)


class RoseBVZeroOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType)
    OperandList = [Bitvector]
    super().__init__(RoseOpcode.bvzero, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Bitvector : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVZeroOp(Name, Bitvector, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    OperandInLLVM = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM != llvmlite.ir.Undefined()
    ZeroLLVM =  llvmlite.ir.Constant(self.getOperand(0).getType().to_llvm_ir(), 0)
    IRBuilder = Context.getLLVMBuilder()
    return IRBuilder.icmp_signed("==", OperandInLLVM, ZeroLLVM, \
                                 "%" + "cond." + self.getName())


class RoseBVAbsOp(RoseBitVectorOp):
  def __init__(self, Name : str, Operand : RoseValue, ParentBlock):
    assert isinstance(Operand.getType(), RoseBitVectorType)
    OperandList = [Operand]
    super().__init__(RoseOpcode.bvabs, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Operand : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseBVAbsOp(Name, Operand, ParentBlock)

  def to_llvm_ir(self, Context : RoseLLVMContext):
    OperandInLLVM = Context.getLLVMValueFor(self.getOperand(0))
    assert OperandInLLVM != llvmlite.ir.Undefined()
    ZeroLLVM =  llvmlite.ir.Constant(self.getOperand(0).getType().to_llvm_ir(), 0)
    IRBuilder = Context.getLLVMBuilder()
    Condition = IRBuilder.icmp_signed(">=", OperandInLLVM, ZeroLLVM, \
                                     "%" + "cond." + self.getName())
    Then = OperandInLLVM
    Else = IRBuilder.neg(OperandInLLVM, "%neg." + self.getName())
    return IRBuilder.select(Condition, Then, Else, self.getName())

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " "
    String += "(integer->bitvector (abs (bitvector->integer " \
            + self.getOperand(0).getName() + ")) (bitvector " \
            + str(self.getOperand(0).getOutputBitwidth()) + "))"
    String += ")\n"
    return String


