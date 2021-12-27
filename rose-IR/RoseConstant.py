from RoseType import RoseType
from RoseValue import RoseValue


# Constant value (integer and float) class
class RoseConstant(RoseValue):
  def __init__(self, Value, Type : RoseType):
      self.Val = Value
      super().__init__("", Type)
  
  @staticmethod
  def create(Value, Bitwidth : int):
      if isinstance(Value, int):
          return RoseConstant(Value, RoseType.getIntegerTy(Bitwidth))
      exit()

  def getValue(self):
      return self.Val
  
  def print(self):
      print(self.Val)
