
from RoseType import RoseType
from RoseValue import RoseValue
from RoseFunction import RoseFunction


class RoseArgument(RoseValue):
  def __init__(self, Name : str, Type : RoseType, Function : RoseFunction, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < Function.getNumArgs() 
    self.Function = Function
    self.ArgIndex = ArgIndex
    super().__init__(Name, Type)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function : RoseFunction = 0, ArgIndex : int = 0):
    return RoseArgument(Name, Type, Function, ArgIndex)

  def getArgIndex(self):
    return self.ArgIndex
  
  def getFunction(self):
    return self.Function
  
  def setFunction(self, Function : RoseFunction):
    # Sanity check
    assert Function.getArg(self.ArgIndex).getType() == self.getType()
    self.Function = Function
  
  def print(self):
    print(self.Val)

    
