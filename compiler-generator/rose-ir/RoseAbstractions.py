
from RoseType import RoseType, RoseFunctionType
from RoseValue import RoseValue
from RoseRegion import RoseRegion


####################################### ROSE UNDEF REGION #######################################

class RoseUndefRegion(RoseRegion):
  def __init__(self):
    super().__init__(None, None)
  
  def __str__(self):
    return "undef_region"

  def print(self):
    print("undef_region")


from RoseValues import RoseUndefValue, RoseOperation, RoseArgument, RoseConstant


####################################### ROSE FUNCTION ############################################

# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
# A function is a region and a value
class RoseFunction(RoseValue, RoseRegion):
  def __init__(self, Name : str, ArgsList : list, RetType : RoseType, 
              RegionList : list, ParentRegion : RoseRegion):
    # Sanity checks
    for ArgIndex, Arg in enumerate(ArgsList):
        assert isinstance(Arg, RoseArgument)
    print("ArgsList:")
    print(ArgsList)
    ArgTyList = [Arg.getType() for Arg in ArgsList]
    FunctionType = RoseType.getFunctionTy(ArgTyList, RetType)
    self.ArgList = ArgsList
    self.RetVal = RoseUndefValue()
    for ArgIndex, Arg in enumerate(ArgsList):
      self.ArgList[ArgIndex].setFunction(self)
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
        return RoseFunction(args[0], args[1], args[2], args[3], RoseUndefRegion())
    if len(args) == 3:
      if isinstance(args[0], str) and isinstance(args[1], list) \
      and isinstance(args[2], RoseType):
        print(args[0])
        print(args[1])
        print(args[2])
        return RoseFunction(args[0], args[1], args[2], [], RoseUndefRegion())
    if len(args) == 2:
      if isinstance(args[0], str) and isinstance(args[1], RoseFunctionType):
        FunctionType = args[1]
        ArgTypeList = FunctionType.getArgList()
        ArgsList = []
        for ArgIndex, ArgTy in enumerate(ArgTypeList):
          # All arguments start out unmaed
          ArgsList.append(RoseArgument.create("", ArgTy, RoseUndefValue(), ArgIndex))
        return RoseFunction(args[0], ArgsList, FunctionType.getReturnType(), [], RoseUndefRegion())
    assert(False)
    
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop) \
    or isinstance(Other, RoseCond):
        return False
    print(type(Other))
    assert isinstance(Other, RoseFunction)
    return self.RetVal == Other.RetVal and self.ArgList == Other.ArgList \
        and RoseValue.__eq__(self, Other) and RoseRegion.__eq__(self, Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop) \
    or isinstance(Other, RoseCond):
        return True
    assert isinstance(Other, RoseFunction)
    return self.RetVal != Other.RetVal or self.ArgList != Other.ArgList \
        or RoseValue.__ne__(self, Other) or RoseRegion.__ne__(self, Other)
  
  # Make rose functions hashable
  def __hash__(self):
    return hash((self.getName(), self.getType(), self.getRegionID()))

  def getNumArgs(self):
    return len(self.ArgList)
  
  def getArgs(self):
    return self.ArgList
  
  def getArg(self, Index):
    return self.ArgList[Index]
  
  def getReturnValue(self):
    return self.RetVal
  
  def addArg(self, NewArg : RoseValue, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < len(self.ArgsList)
    assert self.ArgsList[ArgIndex].getType() == NewArg.getType()
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self, ArgIndex)
    OldArg = self.ArgsList[ArgIndex]
    self.ArgsList[ArgIndex] = Arg
    self.replaceUsesWith(OldArg, Arg)

  def appendArg(self, NewArg : RoseValue):
    # Add the argument to this function and change the type of this function
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), \
                              RoseUndefValue(), self.getNumArgs() )
    self.ArgList.append(Arg)
    ArgTyList = [Arg.getType() for Arg in self.ArgList]
    FunctionType = RoseType.getFunctionTy(ArgTyList, self.RetVal.getType())
    self.setType(FunctionType)
    # Set the parent of this argument to be this function
    self.ArgList[self.getNumArgs() - 1].setFunction(self)
    return self.ArgList[self.getNumArgs() - 1]

  def isTopLevelFunction(self):
    return (self.getParent() == RoseUndefRegion())
  
  def setRetValName(self, Name):
    self.RetVal = RoseValue(Name, self.getType().getReturnType())
  
  # Use this in *very* rare cases
  def setRetVal(self, Value):
    # Just some safety checks
    assert self.getType().getReturnType().isUndefTy()
    assert not Value.getType().isUndefTy()
    # Set the return type first
    RetType = Value.getType()
    NewFunctionType = RoseType.getFunctionTy(self.getType().getArgList(), RetType)
    self.setType(NewFunctionType)
    # Do some sanity checks again
    assert self.getType() == NewFunctionType
    assert self.getType().getReturnType() == Value.getType()
    # Now set the name for the return value
    self.setRetValName(Value.getName())
  
  def setArgName(self, Name, ArgIndex):
    # Some sanity checks
    assert ArgIndex < len(self.ArgsList)
    self.ArgsList[ArgIndex].setName(Name)

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    # Print function signature first
    Func_Sig = Spaces + "function " + self.getName() + " ("
    for Index, Arg in enumerate(self.ArgList):
      Func_Sig += (" " + str(Arg.getType()) + " " + Arg.getName())
      if Index != len(self.ArgList) - 1:
        Func_Sig += ","
    Func_Sig += " ) {"
    print(Func_Sig)
    RoseRegion.print(self, NumSpace + 1)
    print(Spaces + "}")



####################################### ROSE BLOCK ############################################

# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
  def __init__(self, OpList : list, ParentRegion : RoseRegion):
    super().__init__(OpList, ParentRegion)
  
  @staticmethod
  def create(OpList : list = [], ParentRegion : RoseRegion = RoseUndefRegion()):
    return RoseBlock(OpList, ParentRegion)
  
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseForLoop) \
    or isinstance(Other, RoseCond):
        return False
    assert isinstance(Other, RoseBlock)
    return super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseForLoop) \
    or isinstance(Other, RoseCond):
        return True
    assert isinstance(Other, RoseBlock)
    return super().__ne__(Other)

  # Make rose blocks hashable
  def __hash__(self):
    #return hash((tuple(self.getOperations()), self.getRegionID()))
    return hash(self.getRegionID())

  def getOperations(self):
    return self.getChildren()

  def getOperation(self, Index):
    return self.getChild(Index) 
  
  def getNumOperations(self):
    return self.getNumChildren()
  
  def getPosOfOperation(self, Operation):
    return self.getPosOfChild(Operation)
  
  # Insert the given op in the end of the block
  def addOperation(self, Operation : RoseOperation):
    if self.getNumOperations() > 0:
      Index = self.getNumChildren() - 1
      self.addRegionBefore(Index, Operation)
    else:
      self.addRegion(Operation)

  def addOperationBefore(self, Operation : RoseOperation, InsertBefore : RoseOperation):
    Index = self.getPosOfOperation(InsertBefore)
    self.addRegionBefore(Index, Operation)
  
  def addOperationAfter(self, Operation : RoseOperation, InsertAfter : RoseOperation):
    Index = self.getPosOfOperation(InsertAfter)
    # See if we are inserting at the end of the block
    if Index == self.getNumChildren() - 1:
      self.addRegion(Operation)
    else:
      InsertBefore = self.getChild(Index + 1)
      self.addOperationBefore(Operation, InsertBefore)
  
  # Split this block at the given point
  def splitAt(self, Index):
    assert Index < len(self.getOperations())
    print("SPLITTING BLOCK")
    # Get this position of this block in the parent region
    ParentRegion = self.getParent()
    BlockIndex = ParentRegion.getPosOfChild(self)
    # Collect all the ops for the new block
    OpsForNewBlock = self.getOperations()[Index:]
    # Remove the ops after the split point from this Block
    for Op in reversed(OpsForNewBlock):
      self.eraseChild(Op)
    # Create a new block and the new ops to it.
    NewBlock = self.create(OpsForNewBlock)
    assert isinstance(NewBlock, RoseBlock)
    # Add this new block to the parent region
    if BlockIndex == ParentRegion.getNumChildren() - 1:
      ParentRegion.addRegion(NewBlock)
    else:
      ParentRegion.addRegionBefore(BlockIndex + 1, NewBlock)
    return NewBlock

  def eraseOperation(self, Operation):
    assert isinstance(Operation, RoseOperation)
    # Ensure this operation does not have any uses left.
    # This is to prevent deletion of operations before their
    # uses are removed/fixed.
    print("OPERATION TO BE ERASED:")
    #Operation.print()
    Function = self.getFunction()
    #self.print()
    Operation.print()
    assert not Function.hasUsesOf(Operation)
    self.eraseChild(Operation)


####################################### ROSE LOOP ############################################

# Class representing loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
  def __init__(self, IteratorName : str, Start : RoseValue, End : RoseValue, Step : RoseValue, 
              RegionList : list, ParentRegion : RoseRegion):
    self.Iterator = RoseValue.create(IteratorName, RoseType.getIntegerTy(32))
    self.Start = Start
    self.End = End
    self.Step = Step
    super().__init__(RegionList, ParentRegion)
    
  # Multiple constructors packaged into one
  @staticmethod
  def create(*args):
    if len(args) == 6:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseValue) \
      and isinstance(args[4], list) and isinstance(args[5], RoseRegion):
        return RoseForLoop(args[0], args[1], args[2], args[3], args[4], args[5])
      if isinstance(args[0], str) and isinstance(args[1], int) \
      and isinstance(args[2], int) and isinstance(args[3], int) \
      and isinstance(args[4], list) and isinstance(args[5], RoseRegion):
        Start = RoseConstant. create(args[1], RoseType.getIntegerTy(32))
        End = RoseConstant. create(args[2], RoseType.getIntegerTy(32))
        Step = RoseConstant. create(args[3], RoseType.getIntegerTy(32))
        return RoseForLoop(args[0], Start, End, Step, args[4], args[5])
    if len(args) == 5:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseValue) \
      and isinstance(args[4], list):
        return RoseForLoop(args[0], args[1], args[2], args[3], args[4], RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], int) \
      and isinstance(args[2], int) and isinstance(args[3], int) \
      and isinstance(args[4], list):
        Start = RoseConstant. create(args[1], RoseType.getIntegerTy(32))
        End = RoseConstant. create(args[2], RoseType.getIntegerTy(32))
        Step = RoseConstant. create(args[3], RoseType.getIntegerTy(32))
        return RoseForLoop(args[0], Start, End, Step, [], RoseUndefRegion())
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseValue):
        return RoseForLoop(args[0], args[1], args[2], args[3], [], RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], int) \
      and isinstance(args[2], int) and isinstance(args[3], int):
        Start = RoseConstant. create(args[1], RoseType.getIntegerTy(32))
        End = RoseConstant. create(args[2], RoseType.getIntegerTy(32))
        Step = RoseConstant. create(args[3], RoseType.getIntegerTy(32))
        return RoseForLoop(args[0], Start, End, Step, [], RoseUndefRegion()) 
    assert(False)

  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseCond):
        return False
    assert isinstance(Other, RoseForLoop)
    return self.Iterator == Other.Iterator and self.Start == Other.Start \
        and self.End == Other.End and self.Step == Other.Step and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseCond):
        return True
    assert isinstance(Other, RoseForLoop)
    return self.Iterator != Other.Iterator or self.Start != Other.Start \
        or self.End != Other.End or self.Step != Other.Step or super().__ne__(Other)

  # Make rose loops hashable
  def __hash__(self):
    return hash((self.Iterator, self.Start, self.End, self.Step, self.getRegionID()))

  def getIterator(self):
    return self.Iterator
  
  def getStartIndex(self):
    return self.Start

  def getEndIndex(self):
    return self.End

  def getStep(self):
    return self.Step

  # Note that this does not replace the uses of the iterator
  def setIteratorName(self, Name):
    self.Iterator = RoseValue.create(Name, self.Iterator.getType())
  
  def setStartIndex(self, NewStart : int):
    self.Start = RoseConstant(NewStart, self.Start.getType())
  
  def setStep(self, NewStep : int):
    self.Step = RoseConstant(NewStep, self.Step.getType())

  def setEndIndex(self, NewEnd : int):
    self.End = RoseConstant(NewEnd, self.End.getType())
  
  def setStartIndexVal(self, NewStart : RoseValue):
    assert self.Start.getType() == NewStart.getType()
    self.Start = NewStart
  
  def setStepVal(self, NewStep : RoseValue):
    assert self.Step.getType() == NewStep.getType()
    self.Step = NewStep

  def setEndIndexVal(self, NewEnd : RoseValue):
    assert self.End.getType() == NewEnd.getType()
    self.End = NewEnd

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    LoopHeader = Spaces + "for ([" + self.Iterator.getName() + " (range " \
        + self.getStartIndex().getName() + " " + self.getEndIndex().getName() \
        + " " + self.getStep().getName() + ")]) {"
    print(LoopHeader)
    # Print regions in this loop
    super().print(NumSpace + 1)
    print(Spaces + "}")


####################################### ROSE IF-THEN ############################################

# Class representing If-else blocks
class RoseCond(RoseRegion):
  def __init__(self, Condition : RoseValue, ThenRegionList : list, ElseRegionList : list, 
              ParentRegion : RoseRegion):
    # Condition must be a 1-bit bitvector or a boolean
    assert Condition.getType().isBitVectorTy() or Condition.getType().isBooleanTy()
    if Condition.getType().isBitVectorTy():
      assert Condition.getType().getBitwidth() == 1
    Children = {}
    Children["then"] = ThenRegionList
    Children["else"] = ElseRegionList
    self.Condition = Condition
    super().__init__(Children, ParentRegion, ["then", "else"])
  
  @staticmethod
  def create(Condition : RoseValue, ThenRegionList : list = [], ElseRegionList : list = [], 
              ParentRegion : RoseRegion = RoseUndefRegion()):
    return RoseCond(Condition, ThenRegionList, ElseRegionList, ParentRegion)
  
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop):
        return False
    assert isinstance(Other, RoseCond)
    return self.Condition == Other.Condition and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop):
        return True
    assert isinstance(Other, RoseCond)
    return self.Condition != Other.Condition or super().__ne__(Other)

  # Make rose loops hashable
  def __hash__(self):
    return hash((self.Condition, self.getRegionID()))

  def getCondition(self):
    return self.Condition
  
  def getThenRegions(self):
    return self.getChildren()["then"]
  
  def getElseRegions(self):
    return self.getChildren()["else"]
  
  def addThenRegion(self, Region):
    return self.addRegion(Region, "then")
  
  def addElseRegion(self, Region):
    return self.addRegion(Region, "else")

  def addAbstractionInThenRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, "then")
  
  def addAbstrctionInElseRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, "else")
  
  def getKeyForThenRegion(self):
    return "then"

  def getKeyForElseRegion(self):
    return "else"

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Condtiion = Spaces + "if (" + str(self.Condition.getType()) \
                       + " " + self.Condition.getName() + ") {"
    print(Condtiion)
    # Print regions in this if-else blocks
    for Region in self.getThenRegions():
      Region.print(NumSpace + 1)
    print(Spaces + "} else {")
    for Region in self.getElseRegions():
      Region.print(NumSpace + 1)
    print(Spaces + "}")

