
from RoseType import RoseType
from RoseValue import RoseValue
from RoseConstant import RoseUndef
import RoseAbstractions


class RoseArgument(RoseValue):
  def __init__(self, Name : str, Type : RoseType, Function, ArgIndex : int):
    # Some sanity checks
    if not isinstance(Function, RoseUndef):
      assert isinstance(Function, RoseAbstractions.RoseFunction)
      assert ArgIndex < Function.getNumArgs() 
      assert Function.getArg(ArgIndex).getType() == Type
    self.Function = Function
    self.ArgIndex = ArgIndex
    super().__init__(Name, Type)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function = RoseUndef(), ArgIndex : int = 0):
    return RoseArgument(Name, Type, Function, ArgIndex)

  def getArgIndex(self):
    return self.ArgIndex
  
  def getFunction(self):
    return self.Function
  
  def setFunction(self, Function):
    # Sanity checks
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    assert Function.getArg(self.ArgIndex).getType() == self.getType()
    self.Function = Function
  
  def print(self):
    print(self.Val)
