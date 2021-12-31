
from RoseType import RoseType
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
    SubClassData = {}
    SubClassData["function"] = Function
    SubClassData["index"] = ArgIndex
    super().__init__(Name, Type, SubClassData)
  
  @staticmethod
  def create(Name : str, Type : RoseType, Function = RoseUndefValue(), ArgIndex : int = 0):
    return RoseArgument(Name, Type, Function, ArgIndex)

  def getArgIndex(self):
    return self.getSubClassData()["index"]
  
  def getFunction(self):
    return self.getSubClassData()["function"]
  
  def setFunction(self, Function):
    # Sanity checks
    assert isinstance(Function, RoseAbstractions.RoseFunction)
    assert Function.getArg(self.getArgIndex()).getType() == self.getType()
    self.setSubClassData(Function, "function")
  
  def print(self):
    print(self.getName())
