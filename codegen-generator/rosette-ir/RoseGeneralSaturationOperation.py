##################################################################
#
# This files contains the class for a general saturation operation.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseValues import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp


class RoseBVGeneralSaturationOp(RoseBitVectorOp):
  def __init__(self, Name : str, Bitvector : RoseValue, TargetBitwidth : RoseValue, \
                           SaturationKind : RoseValue, ParentBlock):
    assert isinstance(Bitvector.getType(), RoseBitVectorType) 
    OperandList = [Bitvector, TargetBitwidth, SaturationKind]
    super().__init__(RoseOpcode.bvsaturate, Name, OperandList, ParentBlock)

  @staticmethod
  def create(*args):
    if len(args) == 5:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int) and isinstance(args[4], RoseBlock):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        if isinstance(args[3], bool):
          IsSignedVal = RoseConstant.create(args[3], RoseBooleanType.create())
          return RoseBVGeneralSaturationOp(args[0], args[1], TargetBitwidthVal, IsSignedVal, args[4])
        if isinstance(args[3], RoseValue):
          return RoseBVGeneralSaturationOp(args[0], args[1], TargetBitwidthVal, args[3], args[4])
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[4], RoseBlock):
        if isinstance(args[3], bool):
          IsSignedVal = RoseConstant.create(args[3], RoseBooleanType.create())
          return RoseBVGeneralSaturationOp(args[0], args[1], args[2], IsSignedVal, args[4])
        if isinstance(args[3], RoseValue):
          return RoseBVGeneralSaturationOp(args[0], args[1], args[2], args[3], args[4])
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], int):
        TargetBitwidthVal = RoseConstant.create(args[2], RoseIntegerType.create(32))
        if isinstance(args[3], bool):
          IsSignedVal = RoseConstant.create(args[3], RoseBooleanType.create())
          return RoseBVGeneralSaturationOp(args[0], args[1], TargetBitwidthVal, \
                                          IsSignedVal, RoseUndefRegion())
        if isinstance(args[3], RoseValue):
          return RoseBVGeneralSaturationOp(args[0], args[1], TargetBitwidthVal, \
                                          args[3], RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue):
        if isinstance(args[3], bool):
          IsSignedVal = RoseConstant.create(args[3], RoseBooleanType.create())
          return RoseBVGeneralSaturationOp(args[0], args[1], args[2], \
                                            IsSignedVal, RoseUndefRegion())
        if isinstance(args[3], RoseValue):
          return RoseBVGeneralSaturationOp(args[0], args[1], args[2], \
                                              args[3], RoseUndefRegion())
    assert(False)
  
  def getSaturationKindPos(self):
    return 2
  
  def getInputBitVector(self):
    return self.getOperand(0)

  def getSaturationSize(self):
    return self.getOperand(1)

  def getSaturationKind(self):
    return self.getOperand(self.getSaturationKindPos())

  def to_rosette(self, NumSpace = 0, ReverseIndexing = False):
    assert ReverseIndexing == False
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += ("bvsaturate ")
    String += " " + self.getInputBitVector().getName()
    String += " " + str(self.getInputBitVector().getOutputBitwidth())
    String += " " + str(self.getOutputBitwidth())
    if isinstance(self.getSaturationKind(), RoseConstant):
      if self.getSaturationKind().getValue() == 1:
        String += " 1"
      else:
        String += " 0"
    else:
      String += " " + self.getSaturationKind().getName()
    String += "))\n"
    return String


