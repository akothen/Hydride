
from RoseType import RoseType
from RoseValue import RoseValue
from RoseConstants import RoseUndefValue, RoseUndefRegion
import RoseAbstractions


class RoseBitVector(RoseValue):
  def __init__(self, Name : str, Bitwidth : int, LowIndex : int, HighIndex : int, Parent = RoseUndefRegion()):
    # Some sanity checks
    assert (HighIndex - LowIndex + 1) <= Bitwidth
    assert LowIndex >= 0 and LowIndex < Bitwidth
    assert HighIndex >= 0 and HighIndex < Bitwidth
    self.HighIndex = HighIndex
    self.LowIndex = LowIndex
    # The original value
    if LowIndex == 0 and HighIndex == Bitwidth - 1:
      self.OriginalVal = RoseUndefValue()
    else:
      self.OriginalVal = RoseBitVector(Name, Bitwidth, 0, Bitwidth - 1, Parent)
    super().__init__(Name, RoseType.getBitVectorTy(HighIndex - LowIndex + 1))
    # Set parent
    if Parent != RoseUndefRegion():
      assert isinstance(Parent, RoseAbstractions.RoseBlock)
    self.Parent = Parent
  
  @staticmethod
  def create(Name : str, Bitwidth : int, LowIndex : int, HighIndex : int, Parent = RoseUndefRegion()):
    return RoseBitVector(Name, Bitwidth, LowIndex, HighIndex)

  def __eq__(self, Other):
    if isinstance(Other, RoseUndefValue):
      return False
    assert isinstance(Other, RoseBitVector)
    return self.HighIndex == Other.HighIndex and self.LowIndex == Other.LowIndex \
       and self.OriginalVal == Other.OriginalVal and self.Parent == Other.Parent \
       and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefValue):
      return True
    assert isinstance(Other, RoseBitVector)
    return self.HighIndex != Other.HighIndex or self.LowIndex != Other.LowIndex \
        or self.OriginalVal != Other.OriginalVal or self.Parent != Other.Parent \
        or super().__ne__(Other)

  def getHighIndex(self):
    assert (self.HighIndex - self.LowIndex + 1) <= self.Bitwidth
    assert self.HighIndex >= 0 and self.HighIndex < self.Bitwidth
    return self.HighIndex 
  
  def getLowIndex(self):
    assert (self.HighIndex - self.LowIndex + 1) <= self.Bitwidth
    assert self.LowIndex >= 0 and self.LowIndex < self.Bitwidth
    return self.LowIndex
  
  def getOriginalBitVector(self):
    if self.OriginalVal == RoseUndefValue():
      return self
    return self.OriginalVal
  
  def getParent(self):
    return self.Parent
  
  def setParent(self, Block):
    assert isinstance(Block, RoseAbstractions.RoseBlock)
    self.Parent = Block
  
  def print(self):
    print(self.getName())
