
from RoseType import RoseType, RoseUndefinedType
from RoseValue import RoseValue
from RoseConstants import RoseUndefValue
import RoseAbstractions


class RoseArgument(RoseValue):
  def __init__(self, Name : str, Type : RoseType, Function, ArgIndex : int):
    # Some sanity checks
    if isinstance(Function, RoseUndefValue) == False:
      assert isinstance(Function, RoseAbstractions.RoseFunction)
      assert ArgIndex < Function.getNumArgs() 
      assert Function.getArg(ArgIndex).getType() == Type
    self.Callee = Function
    self.ArgIndex = ArgIndex
    super().__init__(Name, Type)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function = RoseUndefValue(), ArgIndex : int = 0):
    return RoseArgument(Name, Type, Function, ArgIndex)

  def __eq__(self, Other):
      if isinstance(Other, RoseUndefValue):
        return False
      assert isinstance(Other, RoseArgument)
      return self.ArgIndex == Other.ArgIndex and self.Callee == Other.Callee \
              and super().__eq__(Other)

  def __ne__(self, Other):
      if isinstance(Other, RoseUndefValue):
        return True
      assert isinstance(Other, RoseArgument)
      return self.ArgIndex != Other.ArgIndex or self.Callee != Other.Callee \
          or super().__ne__(Other)

  def getArgIndex(self):
    assert self.ArgIndex < self.Callee.getArg(self.getArgIndex()).getType()
    return self.ArgIndex
  
  def getFunction(self):
    return self.Callee
  
  def setFunction(self, Function):
    # Sanity checks
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    assert Function.getNumArgs() > self.ArgIndex
    assert Function.getArg(self.ArgIndex).getType() == self.getType()
    self.Callee = Function
  
  def print(self):
    print(self.getName())
