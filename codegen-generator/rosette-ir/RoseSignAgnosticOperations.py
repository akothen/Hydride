##################################################################
#
# This files contains the classes for sign agnostic operations.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseValues import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp


class RoseSignAgnosticBitVectorOp(RoseBitVectorOp):

  def __init__(self, Opcode : RoseOpcode,  Name : str, Operands : list, \
               SignID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    self.signIDIsValid(SignID)
    super().__init__(Opcode, Name, Operands + [SignID], ParentBlock)

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


class RoseBVGeneralDivOp(RoseSignAgnosticBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    SignID : RoseConstant, ParentBlock : RoseBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    assert isinstance(SignID, RoseConstant)
    Operands = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvgeneraldiv, Name, Operands, SignID, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForSignedOperation()
    print("SignID:")
    SignID.print()
    SignID.getType().print()
    return RoseBVGeneralDivOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralDivOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvdiv"


class RoseBVGeneralRemOp(RoseSignAgnosticBitVectorOp):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    SignID : RoseConstant, ParentBlock : RoseBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    assert isinstance(SignID, RoseConstant)
    Operands = [Operand1, Operand2]
    super().__init__(RoseOpcode.bvgeneralrem, Name, Operands, SignID, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                  ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralRemOp(Name, Operand1, Operand2, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralRemOp(Name, Operand1, Operand2, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvrem"



class RoseBVGeneralMaxOp(RoseSignAgnosticBitVectorOp):
  def __init__(self, Name : str, Operands : list, \
                    SignID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    assert isinstance(SignID, RoseConstant)
    super().__init__(RoseOpcode.bvgeneralmax, Name, Operands, SignID, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralMaxOp(Name, Operands, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralMaxOp(Name, Operands, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvmax"


class RoseBVGeneralMinOp(RoseSignAgnosticBitVectorOp):
  def __init__(self, Name : str, Operands : list, \
                    SignID : RoseConstant, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    assert isinstance(SignID, RoseConstant)
    super().__init__(RoseOpcode.bvgeneralmin, Name, Operands, SignID, ParentBlock)
    
  @staticmethod
  def createSigned(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForSignedOperation()
    return RoseBVGeneralMinOp(Name, Operands, SignID, ParentBlock)

  @staticmethod
  def createUnsigned(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    SignID = RoseSignAgnosticBitVectorOp.getIDForUnsignedOperation()
    return RoseBVGeneralMinOp(Name, Operands, SignID, ParentBlock)
  
  def getRosetteName(self):
    return "bvmin"

