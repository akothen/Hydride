
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

  # An abstraction can be an operation or a region
  def addAbstraction(self, Abstraction):
    print("METHOD ADDING ABSTRACTION:")
    print(Abstraction)
    if isinstance(Abstraction, RoseRegion):
      self.addRegion(Abstraction)
      return
    elif isinstance(Abstraction, RoseOperation):
      # This is a little more difficult. First try to get RoseBlock
      TailRegion = self.getTailChild()
      if not isinstance(TailRegion, RoseBlock) \
      or isinstance(TailRegion, RoseUndefRegion):
        # Add a new block first
        Block = RoseBlock.create([])
        Block.addRegion(Abstraction)
        self.addRegion(Block)
      else:
        TailRegion.addRegion(Abstraction)
        self.updateTailChild(TailRegion)
      return
    assert False

  # Replace the given abstraction with a new one
  def replaceAbstraction(self, OldAbstraction, NewAbstraction):
    assert type(OldAbstraction) == type(NewAbstraction)
    assert self.isChildValid(NewAbstraction)
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      if type(OldAbstraction) == type(Child):
        if Child == OldAbstraction:
          Index = self.getChildren().index(OldAbstraction)
          self.replaceRegion(NewAbstraction, Index)
          return True
      if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
        return True
    return False
  
  # Replaces the uses of an operation 
  def replaceUsesWith(self, Abstraction, NewAbstraction):
    print("REPLACES USES IN FUNCTION")
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant) \
       and not isinstance(Abstraction, RoseFunction)
    assert not isinstance(NewAbstraction, RoseUndefValue) \
       and not isinstance(NewAbstraction, RoseFunction)
    assert isinstance(Abstraction, RoseValue)
    assert isinstance(NewAbstraction, RoseValue)
    assert Abstraction.getType() == NewAbstraction.getType()
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      Child.replaceUsesWith(Abstraction, NewAbstraction)

  # Sees if the given operation or function or argument has any uses
  def hasUsesOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      if Child.hasUsesOf(Abstraction) == True:
        return True
    return False

  # Get all users of the given value
  def getUsersOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    Users = []
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      Users.extend(Child.getUsersOf(Abstraction))
    return Users

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
    return hash((tuple(self.getOperations()), self.getRegionID()))
  
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
  
  # Replace the given abstraction with a new one
  def replaceAbstraction(self, OldAbstraction, NewAbstraction):
    assert type(OldAbstraction) == type(NewAbstraction)
    assert self.isChildValid(NewAbstraction)
    for Child in self.getChildren():
      if type(OldAbstraction) == type(Child):
        if Child == OldAbstraction:
          Index = self.getChildren().index(OldAbstraction)
          self.replaceRegion(NewAbstraction, Index)
          return True
    return False

  def getOperations(self):
    return self.getChildren()

  def getOperation(self, Index):
    return self.getChild(Index) 
  
  def getNumOperations(self):
    return self.getNumChildren()
  
  def getPosOfOperation(self, Operation):
    return self.getPosOfChild(Operation)
  
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
  
  # Replaces the uses of an operation 
  def replaceUsesWith(self, Abstraction, NewAbstraction):
    print("REPLACE USES IN BLOCK")
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant) \
       and not isinstance(Abstraction, RoseFunction)
    assert not isinstance(NewAbstraction, RoseUndefValue) \
       and not isinstance(NewAbstraction, RoseFunction)
    assert isinstance(Abstraction, RoseValue)
    assert isinstance(NewAbstraction, RoseValue)
    assert Abstraction.getType() == NewAbstraction.getType()
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      #print("INSTRUCTION BEFORE:")
      #Child.print()
      Child.replaceUsesWith(Abstraction, NewAbstraction)
      #print("INSTRUCTION AFTER:")
      #Child.print()

  # Sees if the given operation or function or argument has any uses
  def hasUsesOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      if Child.usesValue(Abstraction) == True:
        return True
    return False

  # Get all users of the given value
  def getUsersOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    Users = []
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      if Child.usesValue(Abstraction):
        Users.append(Child)
    return Users
  
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
  
  # An abstraction can be an operation and region
  def addAbstraction(self, Abstraction):
    if isinstance(Abstraction, RoseRegion):
      self.addRegion(Abstraction)
      return
    elif isinstance(Abstraction, RoseOperation):
      # This is a little more difficult. First try to get RoseBlock
      TailRegion = self.getTailChild()
      if not isinstance(TailRegion, RoseBlock) \
      or isinstance(TailRegion, RoseUndefRegion):
        # Add a new block first
        Block = RoseBlock.create([])
        Block.addRegion(Abstraction)
        self.addRegion(Block)
      else:
        TailRegion.addRegion(Abstraction)
        self.updateTailChild(TailRegion)
      return
    assert False
  
  # Replace the given abstraction with a new one
  def replaceAbstraction(self, OldAbstraction, NewAbstraction):
    assert type(OldAbstraction) == type(NewAbstraction)
    assert self.isChildValid(NewAbstraction)
    for Child in self.getChildren():
      if type(OldAbstraction) == type(Child):
        if Child == OldAbstraction:
          Index = self.getChildren().index(OldAbstraction)
          self.replaceRegion(NewAbstraction, Index)
          return True
      if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
        return True
    return False
  
  # Replaces the uses of an operation 
  def replaceUsesWith(self, Abstraction, NewAbstraction):
    print("REPLACE USES IN LOOP")
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant) \
       and not isinstance(Abstraction, RoseFunction)
    assert not isinstance(NewAbstraction, RoseUndefValue) \
       and not isinstance(NewAbstraction, RoseFunction)
    assert isinstance(Abstraction, RoseValue)
    assert isinstance(NewAbstraction, RoseValue)
    assert Abstraction.getType() == NewAbstraction.getType()
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      Child.replaceUsesWith(Abstraction, NewAbstraction)
  
  # Sees if the given operation or function or argument has any uses
  def hasUsesOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      if Child.hasUsesOf(Abstraction) == True:
        return True
    return False

  # Get all users of the given value
  def getUsersOf(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
       and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    Users = []
    for Child in self.getChildren():
      assert self.isChildValid(Child)
      Users.extend(Child.getUsersOf(Abstraction))
    return Users

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    LoopHeader = Spaces + "for ([" + self.Iterator.getName() + " (range " \
        + str(self.getStartIndex()) + " " + str(self.getEndIndex()) \
        + " " + str(self.getStep()) + ")]) {"
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
    return self.Condition
  
  def getThenRegions(self):
    return self.getChildren()["then"]
  
  def getElseRegions(self):
    return self.getChildren()["else"]
  
  def addThenRegion(self, Region):
    return self.addRegion(Region, "then")
  
  def addElseRegion(self, Region):
    return self.addRegion(Region, "else")
  
  # An abstraction can be an operation and region
  def addAbstraction(self, Abstraction, Key):
    assert Key == "then" or Key == "else"
    if isinstance(Abstraction, RoseRegion):
      self.addRegion(Abstraction, Key)
      return
    elif isinstance(Abstraction, RoseOperation):
      # This is a little more difficult. First try to get RoseBlock
      TailRegion = self.getTailChild(Key)
      if not isinstance(TailRegion, RoseBlock) \
      or isinstance(TailRegion, RoseUndefRegion):
        # Add a new block first
        Block = RoseBlock.create([])
        Block.addRegion(Abstraction)
        self.addRegion(Block, Key)
      else:
        TailRegion.addRegion(Abstraction)
        self.updateTailChild(TailRegion, Key)
      return
    assert False

  def addAbstractionInThenRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, "then")
  
  def addAbstrctionInElseRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, "else")
  
  def getKeyForThenRegion(self):
    return "then"

  def getKeyForElseRegion(self):
    return "else"  

  # Replace the given abstraction with a new one
  def replaceAbstraction(self, OldAbstraction, NewAbstraction, Key = None):
    if Key != None:
      assert type(OldAbstraction) == type(NewAbstraction)
      assert self.isChildValid(NewAbstraction)
      for Child in self.getChildren()[Key]:
        if type(OldAbstraction) == type(Child):
          if Child == OldAbstraction:
            Index = self.getChildren()[Key].index(OldAbstraction)
            self.replaceRegion(NewAbstraction, Index, Key)
            return True
        if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
          return True
    else:
      if self.replaceAbstraction(OldAbstraction, NewAbstraction, "then"):
        return True
      if self.replaceAbstraction(OldAbstraction, NewAbstraction, "else"):
        return True
    return False

  # Replaces the uses of an operation 
  def replaceUsesWith(self, Abstraction, NewAbstraction, Key = None):
    if Key != None:
      print("REPLACES USES IN FUNCTION")
      assert not isinstance(Abstraction, RoseUndefValue) \
        and not isinstance(Abstraction, RoseConstant) \
        and not isinstance(Abstraction, RoseFunction)
      assert not isinstance(NewAbstraction, RoseUndefValue) \
        and not isinstance(NewAbstraction, RoseFunction)
      assert isinstance(Abstraction, RoseValue)
      assert isinstance(NewAbstraction, RoseValue)
      assert Abstraction.getType() == NewAbstraction.getType()
      for Child in self.getChildren()[Key]:
        assert self.isChildValid(Child)
        Child.replaceUsesWith(Abstraction, NewAbstraction)
    else:
      self.replaceUsesWith(Abstraction, NewAbstraction, "then")
      self.replaceUsesWith(Abstraction, NewAbstraction, "else")

  # Sees if the given operation or function or argument has any uses
  def hasUsesOf(self, Abstraction, Key = None):
    if Key != None:
      assert not isinstance(Abstraction, RoseUndefValue) \
        and not isinstance(Abstraction, RoseConstant)
      assert isinstance(Abstraction, RoseValue)
      for Child in self.getChildren()[Key]:
        assert self.isChildValid(Child)
        if Child.hasUsesOf(Abstraction) == True:
          return True
    else:
      if self.hasUsesOf(Abstraction, "then"):
        return True
      if self.hasUsesOf(Abstraction, "else"):
        return True
    return False

  # Get all users of the given value
  def getUsersOf(self, Abstraction, Key = None):
    if Key != None:
      assert not isinstance(Abstraction, RoseUndefValue) \
        and not isinstance(Abstraction, RoseConstant)
      assert isinstance(Abstraction, RoseValue)
      Users = []
      for Child in self.getChildren()[Key]:
        assert self.isChildValid(Child)
        Users.extend(Child.getUsersOf(Abstraction))
    else:
      Users = []
      Users.extend(self.getUsersOf(Abstraction, "then"))
      Users.extend(self.getUsersOf(Abstraction, "else"))
    return Users

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Condtiion = Spaces + "if (" + self.Condition.getName() + ") {"
    print(Condtiion)
    # Print regions in this if-else blocks
    for Region in self.getThenRegions():
      Region.print(NumSpace + 1)
    print(Spaces + "} else {")
    for Region in self.getElseRegions():
      Region.print(NumSpace + 1)
    print(Spaces + "}")


