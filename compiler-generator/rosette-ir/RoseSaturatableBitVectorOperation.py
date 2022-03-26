##################################################################
#
# This files contains the class derived by bitvector ops
# that need to have saturation qualifiers.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp

from enum import Enum, auto


class RoseSaturatableBitVectorOp(RoseBitVectorOp):
  class SaturationQualifiers(Enum):
    NUW = auto()
    NSW = auto()
    NONE = auto()

  def __init__(self, Opcode : RoseOpcode,  Name : str, Operands : list, \
              NoSignedWrap : bool, NoUnsignedWrap : bool, ParentBlock : RoseBlock):
    for Operand in Operands:
      assert isinstance(Operand.getType(), RoseBitVectorType)
    assert NoSignedWrap & NoUnsignedWrap == False
    if NoSignedWrap == True:
      self.SaturationQualifier = self.SaturationQualifiers.NSW
    elif NoUnsignedWrap == True:
      self.SaturationQualifier = self.SaturationQualifiers.NUW
    else:
      self.SaturationQualifier = self.SaturationQualifiers.NONE
    super().__init__(Opcode, Name, Operands, ParentBlock)

  def noSignedWrapAllowed(self):
    return self.SaturationQualifier == self.SaturationQualifiers.NSW

  def noUnsignedWrapAllowed(self):
    return self.SaturationQualifier == self.SaturationQualifiers.NUW
  
  def wrappingAllowed(self):
    return self.SaturationQualifier == self.SaturationQualifiers.NONE
  
  def allowNoSignedWrapping(self):
    self.SaturationQualifier = self.SaturationQualifiers.NSW
  
  def allowNoUnsignedWrapping(self):
    self.SaturationQualifier = self.SaturationQualifiers.NUW
  
  def allowWrapping(self):
    self.SaturationQualifier = self.SaturationQualifiers.NONE
  
  def getSaturationQualifier(self):
    if self.SaturationQualifier == self.SaturationQualifiers.NSW:
      return "nsw"
    if self.SaturationQualifier == self.SaturationQualifiers.NUW:
      return "nuw"
    return None

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = ""
    if Name != "":
        String = Spaces + Name + " = "
    else:
      String = Spaces
    SatQualifier = self.getSaturationQualifier()
    if SatQualifier == None:
      String += str(self.Opcode)
    else:
      String += str(self.Opcode) + " " + SatQualifier
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + str(Operand.getType()) + " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += ","
    print(String)


