
from RoseType import RoseType
from RoseValue import RoseValue
from RoseRegion import RoseRegion


# Constant value (integer and float) class
class RoseConstant(RoseValue):
  def __init__(self, Value, Type : RoseType):
      self.Val = Value
      super().__init__(str(Value), Type)
  
  @staticmethod
  def create(Value, Bitwidth : int):
      if isinstance(Value, int):
          return RoseConstant(Value, RoseType.getIntegerTy(Bitwidth))
      if isinstance(Value, float):
          return RoseConstant(Value, RoseType.getFloatTy())
      exit()

  def getValue(self):
      return self.Val
  
  def print(self):
      print(self.Val)



class RoseUndefValue(RoseValue):
  def __init__(self):
      super().__init__("undef", RoseType.getUndefTy())
  
  def print(self):
      print(self.getName())


class RoseUndefRegion(RoseRegion):
  def __init__(self):
    super().__init__(None, None)

  def print(self):
    print("undef_reg")
