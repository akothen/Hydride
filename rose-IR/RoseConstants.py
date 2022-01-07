
from RoseType import RoseBooleanType, RoseType
from RoseValue import RoseValue
from RoseRegion import RoseRegion


# Constant value (integer and float) class
class RoseConstant(RoseValue):
  def __init__(self, Value, Type : RoseType):
    self.Val = Value
    super().__init__(str(Value), Type)
  
  @staticmethod
  def create(Value, Type :  RoseType):
    return RoseConstant(Value, Type)

  def __eq__(self, Other):
    assert isinstance(Other, RoseConstant)
    return self.Val == Other.Val and super().__eq__(Other)

  def __ne__(self, Other):
    assert isinstance(Other, RoseConstant)
    return self.Val != Other.Val or super().__ne__(Other)
  
  def __str__(self):
    return str(self.Val)

  def getValue(self):
    return self.Val
  
  def print(self):
    print(self.Val)



class RoseUndefValue(RoseValue):
  def __init__(self):
    super().__init__("undef", RoseType.getUndefTy())
  
  def __str__(self):
    return self.getName()
  
  def print(self):
    print(self.getName())


class RoseUndefRegion(RoseRegion):
  def __init__(self):
    super().__init__(None, None)
  
  def __str__(self):
    return "undef_region"

  def print(self):
    print("undef_region")

 
