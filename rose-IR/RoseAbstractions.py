
from RoseType import RoseType, RoseFunctionType, RoseUndefinedType
from RoseValue import RoseValue
from RoseConstants import RoseUndef
from RoseOperation import RoseOperation
from RoseArgument import RoseArgument
from RoseRegion import RoseRegion


####################################### ROSE FUNCTION ############################################

# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
# A function is a region and a value
class RoseFunction(RoseValue, RoseRegion):
  def __init__(self, Name : str, ArgsList : list, RetType : RoseType, 
              RegionList : list, ParentRegion : RoseRegion):
    # Sanity checks
    for Arg in ArgsList:
        assert isinstance(Arg, RoseArgument)
    ArgTyList = [Arg.getType() for Arg in ArgsList]
    FunctionType = RoseType.getFunctionTy(ArgTyList, RetType)
    RoseValue.__init__(self, Name, FunctionType)
    SubClassData = {}
    SubClassData["return"] = RoseUndef()
    SubClassData["args"] = ArgsList
    RoseRegion.__init__(self, RegionList, ParentRegion, SubClassData)
    
  # Multiple constructors packaged into one
  @staticmethod
  def create(*args):
    if len(args) == 5:
      if isinstance(args[0], str) and isinstance(args[1], list) \
      and isinstance(args[2], RoseType) and isinstance(args[3], list) \
      and isinstance(args[4], RoseRegion):
        return RoseFunction(args[0], args[1], args[2], args[3], args[4])
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], list) \
      and isinstance(args[2], RoseType) and isinstance(args[3], list):
        return RoseFunction(args[0], args[1], args[2], args[3], None)
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], list) \
      and isinstance(args[2], RoseType):
        return RoseFunction(args[0], args[1], args[2], [], None)
    if len(args) == 2:
      if isinstance(args[0], str) and isinstance(args[1], RoseFunctionType):
        FunctionType = args[1]
        ArgTypeList = FunctionType.getArgList()
        ArgsList = []
        for ArgIndex, ArgTy in enumerate(ArgTypeList):
          # All arguments start out unmaed
          ArgsList.append(RoseArgument.create("", ArgTy, RoseUndef(), ArgIndex))
        Function = RoseFunction(args[0], ArgsList, FunctionType.getReturnType(), [], None)
        for ArgIndex, Arg in enumerate(ArgsList):
          Arg.setFunction(Function)
          Function.addArg(Arg, ArgIndex)
        return Function
    assert(False)
  
  def areChildrenValid(self):
    # Children do not have to be instances of regions
    for Child in self.getChildren():
      if self.isChildValid(Child) == False:
        return False
    return True
  
  def isChildValid(self, Child):
    if isinstance(Child, RoseFunction) \
    or isinstance(Child, RoseForLoop) \
    or isinstance(Child, RoseCond) \
    or isinstance(Child, RoseBlock):
      return True
    return False
    
  def getNumArgs(self):
    return len(self.getSubClassData()["args"])
  
  def getArg(self, Index):
    return self.getSubClassData()["args"][Index]
  
  def getReturnValue(self):
    return self.getSubClassData()["return"]
  
  def addArg(self, NewArg : RoseValue, ArgIndex : int):
    # Some sanity checks
    ArgsList = self.getSubClassData()["args"]
    assert ArgIndex < len(ArgsList)
    assert ArgsList[ArgIndex].getType() == NewArg.getType()
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self, ArgIndex)
    ArgsList = self.getSubClassData()["args"]
    ArgsList[ArgIndex] = Arg
    self.setSubClassData(ArgsList, "args")
    # TODO: Replace uses as well

  def isTopLevelFunction(self):
    return (self.getParent() == None)
  
  def setRetValName(self, Name):
    ReturnValue = RoseValue(Name, self.getType().getReturnType())
    self.setSubClassData(ReturnValue, "return")
  
  def setArgName(self, Name, ArgIndex):
    # Some sanity checks
    ArgsList = self.getSubClassData()["args"]
    assert ArgIndex < len(ArgsList)
    ArgsList[ArgIndex].setName(Name)
    self.setSubClassData(ArgsList, "args")

  def print(self):
    # Print function signature first
    Func_Sig = "(define (" + self.getName()
    for Arg in self.getSubClassData()["args"]:
      Func_Sig += (" " + Arg.getName())
    Func_Sig += ")"
    print(Func_Sig)
    # Print regions in this function
    RoseRegion.print()
    print(")")



####################################### ROSE BLOCK ############################################

# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
  def __init__(self, OpList : list, ParentRegion : RoseRegion):
    super().__init__(OpList, ParentRegion)
  
  @staticmethod
  def create(OpList : list, ParentRegion : RoseRegion):
    return RoseBlock(OpList, ParentRegion)
  
  def areChildrenValid(self):
    # Children do not have to be instances of regions
    for Child in self.getChildren():
      if self.isChildValid(Child) == False:
        return False
    return True
  
  def isChildValid(self, Child):
    if isinstance(Child, RoseOperation):
      return True
    return False

  def getOperations(self):
    return self.getChildren()
 


####################################### ROSE LOOP ############################################

# Class representing loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
  def __init__(self, IteratorName : str, Start : RoseValue, End : RoseValue, Step : RoseValue, 
              RegionList : list, ParentRegion : RoseRegion):
    SubClassData = {}
    SubClassData["iterator"] = RoseValue.create(IteratorName, RoseType.getIntegerTy())
    SubClassData["start"] = Start
    SubClassData["end"] = End
    SubClassData["step"] = Step
    super().__init__(RegionList, ParentRegion, SubClassData)
  
  @staticmethod
  def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue, 
                RegionList : list = [], ParentRegion : RoseRegion = None):
    return RoseForLoop(IteratorName, Start, End, Step, RegionList, ParentRegion)
  
  def areChildrenValid(self):
    # Children do not have to be instances of regions
    for Child in self.getChildren():
      if self.isChildValid(Child) == False:
        return False
    return True
  
  def isChildValid(self, Child):
    if isinstance(Child, RoseFunction) \
    or isinstance(Child, RoseForLoop) \
    or isinstance(Child, RoseCond) \
    or isinstance(Child, RoseBlock):
      return True
    return False

  def getIterator(self):
    return self.getSubClassData()["iterator"]
  
  def getStartIndex(self):
    return self.getSubClassData()["start"]

  def getEndIndex(self):
    return self.getSubClassData()["end"]

  def getStep(self):
    return self.getSubClassData()["step"]
  
  def setIteratorName(self, Name):
    self.Iterator = RoseValue.create(Name, self.Iterator.getType())

  def print(self):
    LoopHeader = "(for/list ([" + self.Iterator.getName() + " (range " \
        + self.getStartIndex().print() + " " + self.getEndIndex().print() \
        + " " + self.getStep().print() + ")])"
    print(LoopHeader)
    # Print regions in this loop
    super().print()
    print(")")


####################################### ROSE IF-THEN ############################################

# Class representing If-else blocks
class RoseCond(RoseRegion):
  def __init__(self, Condition : RoseValue, ThenRegionList : list, ElseRegionList : list, 
              ParentRegion : RoseRegion):
    Children = {}
    Children["then"] = ThenRegionList
    Children["else"] = ElseRegionList
    super().__init__(Children, ParentRegion, Condition)
  
  @staticmethod
  def create(Condition : RoseValue, ThenRegionList : list, ElseRegionList : list, 
              ParentRegion : RoseRegion):
    return RoseCond(Condition, ThenRegionList, ElseRegionList, ParentRegion)
  
  def areChildrenValid(self):
    # Children do not have to be instances of regions
    for Child in self.getChildren()["then"]:
      if self.isChildValid(Child) == False:
        return False
    for Child in self.getChildren()["else"]:
      if self.isChildValid(Child) == False:
        return False
    return True
  
  def isChildValid(self, Child):
    if isinstance(Child, RoseFunction) \
    or isinstance(Child, RoseForLoop) \
    or isinstance(Child, RoseCond) \
    or isinstance(Child, RoseBlock):
      return True
    return False
  
  def getCondition(self):
    return self.getSubClassData()
  
  def getThenRegions(self):
    return self.getChildren()["then"]
  
  def getElseRegions(self):
    return self.getChildren()["else"]
  
  def addThenRegion(self, Region):
    return self.addRegion(Region, "then")
  
  def addElseRegion(self, Region):
    return self.addRegion(Region, "else")

  def print(self):
    Condtiion = "(if (" + self.Condition.getName() + ")"
    print(Condtiion)
    # Print regions in this if-else blocks
    self.ThenRegionList.print()
    self.ElseRegionList.print()
    print(")")

