
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


from RoseValues import RoseUndefValue, RoseOperation, RoseArgument


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
    if isinstance(Other, RoseUndefRegion):
        return False
    assert isinstance(Other, RoseFunction)
    return self.RetVal == Other.RetVal and self.ArgList == Other.ArgList \
        and RoseValue.__eq__(self, Other) and RoseRegion.__eq__(self, Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion):
        return True
    assert isinstance(Other, RoseFunction)
    return self.RetVal != Other.RetVal or self.ArgList != Other.ArgList \
        or RoseValue.__ne__(self, Other) or RoseRegion.__ne__(self, Other)
  
  def getNumArgs(self):
    return len(self.ArgList)
  
  def getArg(self, Index):
    return self.ArgList[Index]
  
  def getReturnValue(self):
    return self.RetVal
  
  def addArg(self, NewArg : RoseValue, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < len(self.ArgsList)
    assert self.ArgsList[ArgIndex].getType() == NewArg.getType()
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self, ArgIndex)
    self.ArgsList[ArgIndex] = Arg
    # TODO: Replace uses as well

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

  # An abstraction can be an operation and region
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
      if type(OldAbstraction) == type(Child):
        if Child == OldAbstraction:
          Index = self.getChildren().index(OldAbstraction)
          self.replaceRegion(NewAbstraction, Index)
          return True
      if Child.replaceAbstraction(OldAbstraction, NewAbstraction) == True:
        return True
    return False

  def print(self):
    # Print function signature first
    Func_Sig = "function " + self.getName() + " ("
    for Arg in self.ArgList:
      Func_Sig += (" " + Arg.getName())
    Func_Sig += " ) {"
    print(Func_Sig)
    RoseRegion.print(self)
    print("}")



####################################### ROSE BLOCK ############################################

# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
  def __init__(self, OpList : list, ParentRegion : RoseRegion):
    super().__init__(OpList, ParentRegion)
  
  @staticmethod
  def create(OpList : list = [], ParentRegion : RoseRegion = RoseUndefRegion()):
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
  
  @staticmethod
  def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue, 
                RegionList : list = [], ParentRegion : RoseRegion = RoseUndefRegion()):
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

  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion):
        return False
    assert isinstance(Other, RoseForLoop)
    return self.Iterator == Other.Iterator and self.Start == Other.Start \
        and self.End == Other.End and self.Step == Other.Step and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion):
        return True
    assert isinstance(Other, RoseForLoop)
    return self.Iterator != Other.Iterator or self.Start != Other.Start \
        or self.End != Other.End or self.Step != Other.Step or super().__ne__(Other)

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
  
  def print(self):
    print(self.getStartIndex())
    self.getStartIndex().print()
    print(self.getEndIndex())
    self.getEndIndex().print()
    LoopHeader = "(for ([" + self.Iterator.getName() + " (range " \
        + str(self.getStartIndex()) + " " + str(self.getEndIndex()) \
        + " " + str(self.getStep()) + ")])"
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
    self.Condition = Condition
    super().__init__(Children, ParentRegion)
  
  @staticmethod
  def create(Condition : RoseValue, ThenRegionList : list = [], ElseRegionList : list = [], 
              ParentRegion : RoseRegion = RoseUndefRegion()):
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
  
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion):
        return False
    assert isinstance(Other, RoseCond)
    return self.Condition == Other.Condition and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion):
        return True
    assert isinstance(Other, RoseCond)
    return self.Condition != Other.Condition or super().__ne__(Other)

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
      if self.replaceAbstraction(self, OldAbstraction, NewAbstraction, "then"):
        return True
      if self.replaceAbstraction(self, OldAbstraction, NewAbstraction, "else"):
        return True
    return False

  def print(self):
    Condtiion = "(if (" + self.Condition.getName() + ")"
    print(Condtiion)
    # Print regions in this if-else blocks
    self.ThenRegionList.print()
    self.ElseRegionList.print()
    print(")")

