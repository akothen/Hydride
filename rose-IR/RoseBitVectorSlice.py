
from RoseType import RoseType
from RoseValue import RoseValue
from RoseConstants import RoseConstant, RoseUndefValue, RoseUndefRegion
import RoseAbstractions


class RoseBitVectorSlice(RoseValue):
  def __init__(self, OriginalVal : RoseValue, LowIndex : RoseValue, HighIndex : RoseValue,\
               Bitwidth : int, Parent = RoseUndefRegion()):
    # Some sanity checks
    assert OriginalVal != RoseUndefValue()
    assert OriginalVal.getType().isBitVectorTy()
    assert OriginalVal.getType().getBitwidth() >= Bitwidth
    if isinstance(LowIndex, RoseConstant):
      assert LowIndex.getValue() >= 0 and LowIndex.getValue() < OriginalVal.getType().getBitwidth()
    if isinstance(HighIndex, RoseConstant):
      assert HighIndex.getValue() >= 0 and HighIndex.getValue() < OriginalVal.getType().getBitwidth()
    if isinstance(LowIndex, RoseConstant) and isinstance(HighIndex, RoseConstant):
      assert HighIndex.getValue() >= LowIndex.getValue()
      assert (HighIndex.getValue() - LowIndex.getValue() + 1) == Bitwidth
    if Parent != RoseUndefRegion():
      assert isinstance(Parent, RoseAbstractions.RoseBlock)
    
    self.Parent = Parent
    self.HighIndex = HighIndex
    self.LowIndex = LowIndex
    self.Bitwidth = Bitwidth
    self.OriginalVal = OriginalVal
    if isinstance(LowIndex, RoseConstant) and isinstance(HighIndex, RoseConstant):
      Name = OriginalVal.getName() + "." + str(LowIndex.getValue()) + "." + str(HighIndex.getValue())
    elif isinstance(LowIndex, RoseConstant):
      Name = OriginalVal.getName() + "." + str(LowIndex.getValue()) + "." + str(Bitwidth)
    elif isinstance(LowIndex, RoseConstant):
      Name = OriginalVal.getName() + "." + str(HighIndex.getValue()) + "." + str(Bitwidth)
    else:
      Name = OriginalVal.getName() + "." + LowIndex.getName() + "." + HighIndex.getName()
    super().__init__(Name, RoseType.getBitVectorTy(Bitwidth))
  
  @staticmethod
  def create(*args):
    if len(args) == 5:
      # Signature: OriginalValue, LowIndex, HighIndex, Bitwidth, Parent
      if isinstance(args[0], RoseValue) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], int) \
      and isinstance(args[4], RoseAbstractions.RoseBlock):
        return RoseBitVectorSlice(args[0], args[1], args[2], args[3], args[4])
    if len(args) == 4:
      # Signature: OriginalValue, LowIndex, HighIndex, Bitwidth
      if isinstance(args[0], RoseValue) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], int):
        return RoseBitVectorSlice(args[0], args[1], args[2], args[3], RoseUndefRegion())
    assert(False)

  def __eq__(self, Other):
    if isinstance(Other, RoseUndefValue):
      return False
    assert isinstance(Other, RoseBitVectorSlice)
    return self.HighIndex == Other.HighIndex and self.LowIndex == Other.LowIndex \
       and self.OriginalVal == Other.OriginalVal and self.Parent == Other.Parent \
       and self.Bitwidth == Other.Bitwidth and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefValue):
      return True
    assert isinstance(Other, RoseBitVectorSlice)
    return self.HighIndex != Other.HighIndex or self.LowIndex != Other.LowIndex \
        or self.OriginalVal != Other.OriginalVal or self.Parent != Other.Parent \
        or self.Bitwidth != Other.Bitwidth or super().__ne__(Other)

  def getHighIndex(self):
    return self.HighIndex 
  
  def getLowIndex(self):
    return self.LowIndex
  
  def getOriginalBitVector(self):
    return self.OriginalVal
  
  def getParent(self):
    return self.Parent
  
  def setParent(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock)
    self.Parent = Block
  
  def print(self):
    print(self.getName())
