##################################################################
#
# This files contains the classes for general saturable operations.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseValues import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp


class RoseGeneralSaturableBitVectorOp(RoseBitVectorOp):

  def __init__(self, Opcode : RoseOpcode,  Name : str, Operands : list, \
               SaturationQualifierID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    self.saturationQualifierIsValid(SaturationQualifierID)
    super().__init__(Opcode, Name, Operands + [SaturationQualifierID], ParentBlock)

  @staticmethod
  def getIDForNoSignedWrapAllowed():
    return RoseConstant.create(1, RoseIntegerType(2))

  @staticmethod
  def getIDForNoUnsignedWrapAllowed():
    return RoseConstant.create(0, RoseIntegerType(2))

  @staticmethod
  def getIDForWrappingAllowed():
    return RoseConstant.create(-1, RoseIntegerType(2))

  def saturationQualifierIsValid(self, SaturationQualifierID : RoseConstant):
    assert isinstance(SaturationQualifierID, RoseConstant)
    assert isinstance(SaturationQualifierID.getType(), RoseIntegerType)
    assert SaturationQualifierID.getType().getBitwidth() == 2

  def noSignedWrapAllowed(self):
    SaturationQualifierID = self.getSaturationQualifierID()
    self.saturationQualifierIsValid(SaturationQualifierID)
    return SaturationQualifierID.getValue() == 1

  def noUnsignedWrapAllowed(self):
    SaturationQualifierID = self.getSaturationQualifierID()
    self.saturationQualifierIsValid(SaturationQualifierID)
    return SaturationQualifierID.getValue() == 0
  
  def wrappingAllowed(self):
    SaturationQualifierID = self.getSaturationQualifierID()
    self.saturationQualifierIsValid(SaturationQualifierID)
    return SaturationQualifierID.getValue() == -1

  def getSaturationQualifierID(self):
    return self.getOperands()[-1]

  def getSaturationQualifierIDPos(self):
     return len(self.getOperands()) - 1




class RoseBVGeneralAddOp(RoseGeneralSaturableBitVectorOp):
  def __init__(self, Name : str, Operands : list, \
                    SaturationQualifierID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    assert isinstance(SaturationQualifierID, RoseConstant)
    super().__init__(RoseOpcode.bvgeneraladd, Name, Operands, \
                    SaturationQualifierID, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForWrappingAllowed()
    return RoseBVGeneralAddOp(Name, Operands, SaturationQualifierID, ParentBlock)

  @staticmethod
  def createNSW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForNoSignedWrapAllowed()
    return RoseBVGeneralAddOp(Name, Operands, SaturationQualifierID, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForNoUnsignedWrapAllowed()
    return RoseBVGeneralAddOp(Name, Operands, SaturationQualifierID, ParentBlock)
  
  def getRosetteName(self):
    return "bvaddnw"

  def getSimpleRosetteName(self):
    return "bvadd" 
  
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
    if isinstance(self.getOperand(0).getType().getBitwidth(), RoseValue):
      String += " " + self.getOperand(0).getType().getBitwidth().getName()
    else:
      String += " " + str(self.getOperand(0).getType().getBitwidth())
    if isinstance(self.getSaturationQualifierID(), RoseConstant):
      String += " " + str(self.getSaturationQualifierID().getValue())
    else:
      String += " " + self.getSaturationQualifierID().getName()     
    String += " ))\n"
    return String


class RoseBVGeneralSubOp(RoseGeneralSaturableBitVectorOp):
  def __init__(self, Name : str, Operands : list, \
                    SaturationQualifierID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    assert isinstance(SaturationQualifierID, RoseConstant)
    super().__init__(RoseOpcode.bvgeneralsub, Name, Operands, \
                    SaturationQualifierID, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForWrappingAllowed()
    return RoseBVGeneralSubOp(Name, Operands, SaturationQualifierID, ParentBlock)

  @staticmethod
  def createNSW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForNoSignedWrapAllowed()
    return RoseBVGeneralSubOp(Name, Operands, SaturationQualifierID, ParentBlock)

  @staticmethod
  def createNUW(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SaturationQualifierID = RoseGeneralSaturableBitVectorOp.getIDForNoUnsignedWrapAllowed()
    return RoseBVGeneralSubOp(Name, Operands, SaturationQualifierID, ParentBlock)

  def getRosetteName(self):
    return "bvsubnw" 
  
  def getSimpleRosetteName(self):
    return "bvsub" 

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
    if isinstance(self.getOperand(0).getType().getBitwidth(), RoseValue):
      String += " " + self.getOperand(0).getType().getBitwidth().getName()
    else:
      String += " " + str(self.getOperand(0).getType().getBitwidth())
    if isinstance(self.getSaturationQualifierID(), RoseConstant):
      String += " " + str(self.getSaturationQualifierID().getValue())
    else:
      String += " " + self.getSaturationQualifierID().getName()     
    String += " ))\n"
    return String


