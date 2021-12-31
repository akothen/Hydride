
from RoseType import RoseType
from RoseValue import RoseValue


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



class RoseUndef(RoseValue):
  def __init__(self):
      super().__init__("undef", RoseType.getUndefTy())
  
  @staticmethod
  def create():
        return RoseUndef()
  
  def print(self):
      print(self.getName())
 
