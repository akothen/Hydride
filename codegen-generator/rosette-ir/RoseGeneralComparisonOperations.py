##################################################################
#
# This files contains the general comparison operations.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp


class RoseGeneralComparisonBitVectorOp(RoseBitVectorOp):
  def __init__(self, Opcode : RoseOpcode,  Name : str,  Operand1 : RoseValue, \
                      Operand2 : RoseValue, SignID : RoseConstan, \
                      ParentBlock : RoseBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    self.signIDIsValid(SignID)
    OperandList = [Operand1, Operand2]
    super().__init__(Opcode, Name, OperandList + [SignID], ParentBlock)


  @staticmethod
  def getIDForSignedOperation():
    return RoseConstant.create(1, RoseBooleanType.create())

  @staticmethod
  def getIDForUnsignedOperation():
    return RoseConstant.create(0, RoseBooleanType.create())

  def signIDIsValid(self, SignID : RoseConstant):
    assert isinstance(SignID, RoseConstant)
    assert isinstance(SignID.getType(), RoseBooleanType)

  def isOpSigned(self):
    SignID = self.getSignID()
    self.signIDIsValid(SignID)
    return SignID.getValue() == 1

  def isOpUnsigned(self):
    SignID = self.getSignID()
    self.signIDIsValid(SignID)
    return SignID.getValue() == 0

  def getSignID(self):
    return self.getOperands()[-1]

  def getSignIDPos(self):
     return len(self.getOperands()) - 1

  def getRosetteName(self):
    NotImplemented

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += self.getRosetteName()
    for Operand in self.getOperands()[:-1]:
      if isinstance(Operand, RoseConstant):
        String += " " + Operand.to_rosette()
      else:
        String += " " + Operand.getName()
    if isinstance(self.getSignID(), RoseConstant):
      String += " " + str(self.getSignID().getValue())
    else:
      String += " " + self.getSignID().getName()     
    String += " ))\n"
    return String



class RoseBVGeneralLTOp(RoseGeneralComparisonBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvgenerallt, Name, Operand1, Operand2, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralLTOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralLTOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvlt"


class RoseBVGeneralLEOp(RoseGeneralComparisonBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvgeneralle, Name, Operand1, Operand2, ParentBlock)

  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralLEOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralLEOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvle"


class RoseBVGeneralGTOp(RoseGeneralComparisonBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvgeneralgt, Name, Operand1, Operand2, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralGTOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralGTOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvgt"


class RoseBVGeneralGEOp(RoseGeneralComparisonBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    super().__init__(RoseOpcode.bvgeneralge, Name, Operand1, Operand2, ParentBlock)

  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralGEOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseGeneralComparisonBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralGEOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvge"



