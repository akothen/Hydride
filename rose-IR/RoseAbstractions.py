
from RoseType import RoseType, RoseFunctionType
from RoseValue import RoseValue
from RoseOperation import RoseOperation
from RoseFunctionCall import RoseFunctionCall
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
    self.ReturnValue = None
    self.ArgList = ArgsList
    ArgTyList = [Arg.getType() for Arg in ArgsList]
    FunctionType = RoseType.getFunctionTy(ArgTyList, RetType)
    print(type(FunctionType))
    RoseValue.__init__(self, Name, FunctionType)
    RoseRegion.__init__(self, RegionList, ParentRegion)
    
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
          ArgsList.append(RoseArgument.create("", ArgTy, None, ArgIndex))
        Function = RoseFunction(args[0], ArgsList, FunctionType.getReturnType(), [], None)
        for ArgIndex, Arg in enumerate(ArgsList):
          Arg.setFunction(Function)
          Function.addArg(Arg, ArgIndex)
        return Function
    assert(False)
    
  def getNumArgs(self):
    return len(self.ArgList)
    
  def getArg(self, Index):
    return self.ArgList[Index]
  
  def getReturnValue(self):
    return self.ReturnValue
  
  def addArg(self, NewArg : RoseValue, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < len(self.ArgList)
    assert self.ArgList[ArgIndex].getType() == NewArg.getType()
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self, ArgIndex)
    self.ArgList[ArgIndex] = Arg
    # TODO: Replace uses as well

  def isTopLevelFunction(self):
    return (self.getParent() == None)
  
  def setRetValName(self, Name):
    self.ReturnValue = RoseValue(Name, self.getType().getReturnType())
  
  def setArgName(self, Name, ArgIndex):
    # Some sanity checks
    assert ArgIndex < len(self.ArgList)
    self.ArgList[ArgIndex].setName(Name)

  def print(self):
    # Print function signature first
    Func_Sig = "(define (" + self.getName()
    for Arg in self.ArgList:
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
    # Sanity check
    for Op in OpList:
      print(type(Op))
      assert isinstance(Op, RoseOperation) \
          or isinstance(Op, RoseFunctionCall)
    super().__init__(OpList, ParentRegion)
  
  @staticmethod
  def create(OpList : list, ParentRegion : RoseRegion):
    return RoseBlock(OpList, ParentRegion)

  def getOps(self):
    return self.getChildren()
 


####################################### ROSE LOOP ############################################

# Class representing loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
  def __init__(self, IteratorName : str, Start : RoseValue, End : RoseValue, Step : RoseValue, 
              RegionList : list, ParentRegion : RoseRegion):
    # Loop header information
    self.Iterator = RoseValue.create(IteratorName, RoseType.getIntegerTy())
    self.Start = Start
    self.End = End
    self.Step = Step
    
    # Loop region body
    super().__init__(RegionList, ParentRegion)
  
  @staticmethod
  def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue, 
                RegionList : list, ParentRegion : RoseRegion):
    return RoseForLoop(IteratorName, Start, End, Step, RegionList, ParentRegion)
    
  #@staticmethod
  #def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue):
  #    return RoseForLoop(IteratorName, Start, End, Step, [], None)

  def getIterator(self):
    return self.Iterator
  
  def getStartIndex(self):
    return self.Start

  def getEndIndex(self):
    return self.End

  def getStep(self):
    return self.Step
  
  def setIteratorName(self, Name):
    self.Iterator = RoseValue.create(Name, self.Iterator.getType())

  def print(self):
    LoopHeader = "(for/list ([" + self.Iterator.getName() + " (range " \
        + self.Start.print() + " " + self.End.print() + " " + self.Step.print() + ")])"
    print(LoopHeader)
    # Print regions in this loop
    super().print()
    print(")")

