###################################################################
#
# This files contains all the regions represented in Rosette IR.
# The properties of abstractions are similar to that of abstractions
# in Rosette language i.e. arbitrary nesting of abstractions.
#
###################################################################


from RoseTypes import *
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
from RoseOperations import RoseReturnOp


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
    ArgTyList = [Arg.getType() for Arg in ArgsList]
    FunctionType = RoseFunctionType.create(ArgTyList, RetType)
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
        return RoseFunction(args[0], args[1], args[2], [], RoseUndefRegion())
    if len(args) == 2:
      if isinstance(args[0], str) and isinstance(args[1], RoseFunctionType):
        FunctionType = args[1]
        ArgTypeList = FunctionType.getArgList()
        ArgsList = []
        for ArgTy in ArgTypeList:
          # All arguments start out unmaed
          ArgsList.append(RoseArgument.create("", ArgTy, RoseUndefValue()))
        return RoseFunction(args[0], ArgsList, FunctionType.getReturnType(), [], RoseUndefRegion())
    assert(False)
    
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseUndefValue) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop) \
    or isinstance(Other, RoseCond):
        return False
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
    return hash(self.getRegionID())
    #return hash((self.getName(), self.getType(), self.getRegionID()))
  
  def clone(self, Suffix : str = "", ValueToValueMap : dict = dict(), ChangeID : bool = False):
    if Suffix == "" and ChangeID == False:
      return self.cloneRegion()
    ClonedArgsList = list()
    for Arg in self.getArgs():
      if Suffix != "":
        ClonedArg = Arg.clone(Arg.getName() + "." + Suffix, ChangeID)
      else:
        ClonedArg = Arg.clone(ChangeID=ChangeID)
      ValueToValueMap[Arg] = ClonedArg
      ClonedArgsList.append(ClonedArg)
    FunctionName = self.getName() + "." + Suffix
    ClonedFunction = RoseFunction.create(FunctionName, ClonedArgsList, \
                                        self.getType().getReturnType())
    ReturnValue = self.getReturnValue()
    if not isinstance(ReturnValue, RoseOperation) \
      and not isinstance(ReturnValue, RoseArgument):
      if Suffix != "":
        ClonedReturnVal = ReturnValue.clone(ReturnValue.getName() + "." + Suffix, ChangeID)
      else:
        ClonedReturnVal = ReturnValue.clone(ChangeID=ChangeID)
      ClonedFunction.setRetVal(ClonedReturnVal)
      ValueToValueMap[ReturnValue] = ClonedReturnVal
    for Abstraction in self:
      ClonedAbstraction = Abstraction.clone(Suffix, ValueToValueMap, ChangeID)
      ClonedFunction.addRegion(ClonedAbstraction)
    if ClonedFunction.getReturnValue().getType() == RoseUndefinedType() \
      and ClonedFunction.getReturnValue() == RoseUndefValue():
      BlockList = ClonedFunction.getRegionsOfType(RoseBlock)
      for Block in BlockList:
        for Op in Block:
          if isinstance(Op, RoseReturnOp):
            ClonedFunction.setRetVal(Op.getReturnedValue())
            break
        if ClonedFunction.getReturnValue() != RoseUndefValue():
          break
    return ClonedFunction

  def getNumArgs(self):
    return len(self.ArgList)
  
  def getArgs(self):
    return self.ArgList
  
  def getArg(self, Index):
    return self.ArgList[Index]

  def getIndexOfArg(self, Arg : RoseArgument):
    assert isinstance(Arg, RoseArgument)
    assert Arg in self.ArgList
    return self.ArgList.index(Arg)
  
  def getReturnValue(self):
    return self.RetVal
  
  def addArg(self, NewArg : RoseValue, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < len(self.ArgsList)
    assert self.ArgsList[ArgIndex].getType() == NewArg.getType()
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self)
    OldArg = self.ArgsList[ArgIndex]
    self.ArgsList[ArgIndex] = Arg
    self.replaceUsesWith(OldArg, Arg)

  def eraseArg(self, ArgIndex : int):
    # Some sanity checks
    assert ArgIndex < len(self.ArgList)
    # The argument to be erased must have no uses
    Arg = self.ArgList[ArgIndex]
    assert self.getNumUsersOf(Arg) == 0
    self.ArgList.remove(Arg)
    Arg.setFunction(RoseUndefRegion())
    ArgTyList = [Arg.getType() for Arg in self.ArgList]
    FunctionType = RoseFunctionType.create(ArgTyList, self.RetVal.getType())
    self.setType(FunctionType)

  def appendArg(self, NewArg : RoseValue):
    # Add the argument to this function and change the type of this function
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), RoseUndefValue())
    self.ArgList.append(Arg)
    ArgTyList = [Arg.getType() for Arg in self.ArgList]
    FunctionType = RoseFunctionType.create(ArgTyList, self.RetVal.getType())
    self.setType(FunctionType)
    # Set the parent of this argument to be this function
    self.ArgList[self.getNumArgs() - 1].setFunction(self)
    return self.ArgList[self.getNumArgs() - 1]

  def prependArg(self, NewArg : RoseValue):
    # Add the argument to this function and change the type of this function
    Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), RoseUndefValue())
    self.ArgList.insert(0, Arg)
    ArgTyList = [Arg.getType() for Arg in self.ArgList]
    FunctionType = RoseFunctionType.create(ArgTyList, self.RetVal.getType())
    self.setType(FunctionType)
    # Set the parent of this new argument
    self.ArgList[0].setFunction(self)
    return self.ArgList[0]

  def isTopLevelFunction(self):
    return (self.getParent() == RoseUndefRegion())
  
  def setRetValName(self, Name):
    self.RetVal = RoseValue(Name, self.getType().getReturnType())
  
  # Use this in *very* rare cases
  def setRetVal(self, Value):
    # Just some safety checks
    #assert isinstance(self.getType().getReturnType(), RoseUndefinedType)
    assert not isinstance(Value.getType(), RoseUndefinedType)
    # Set the return type first
    RetType = Value.getType()
    NewFunctionType = RoseFunctionType.create(self.getType().getArgList(), RetType)
    self.setType(NewFunctionType)
    # Do some sanity checks again
    assert self.getType() == NewFunctionType
    assert self.getType().getReturnType() == Value.getType()
    # Now set the return value
    #self.setRetValName(Value.getName())
    self.RetVal = Value
  
  def setArgName(self, Name, ArgIndex):
    # Some sanity checks
    assert ArgIndex < len(self.ArgsList)
    self.ArgsList[ArgIndex].setName(Name)

  def update(self, Function, ValueToValueMap : dict = dict(), ChangeID : bool = False):
    assert isinstance(Function, RoseFunction)
    print("UPDATING FUNCTION")
    # The type of the given function and this function
    # must be the same.
    assert Function.getType() == self.getType()
    # Update arguments
    self.ArgList = list()
    for Arg in Function.getArgs():
      ClonedArg = Arg.clone(ChangeID=ChangeID)
      ClonedArg.setFunction(self)
      print("ClonedArg:")
      ClonedArg.print()
      self.ArgList.append(ClonedArg)
      ValueToValueMap[Arg] = ClonedArg
    # Update the return value
    ReturnValue = Function.getReturnValue()
    if not isinstance(ReturnValue, RoseOperation) \
      and not isinstance(ReturnValue, RoseArgument):
      ClonedReturnVal = ReturnValue.clone(ChangeID=ChangeID)
      self.setRetVal(ClonedReturnVal)
      ValueToValueMap[ReturnValue] = ClonedReturnVal
    # Collect regions in this function to be erased
    RegionsToBeRemoved = list()
    RegionsToBeRemoved.extend(self.getChildren())
    for Abstraction in RegionsToBeRemoved:
      self.eraseChild(Abstraction)
    # Add new regions and remove the old regions
    for Abstraction in Function:
      ClonedAbstraction = Abstraction.clone("", ValueToValueMap, ChangeID)
      self.addRegion(ClonedAbstraction)
    if self.getReturnValue().getType() == RoseUndefinedType() \
      and self.getReturnValue() == RoseUndefValue():
      BlockList = self.getRegionsOfType(RoseBlock)
      for Block in BlockList:
        for Op in Block:
          if isinstance(Op, RoseReturnOp):
            self.setRetVal(Op.getReturnedValue())
            break
        if self.getReturnValue() != RoseUndefValue():
          break
    print("UPDATING FUNCTION")
    self.print()
    return

  def verify(self):
    # Verify the basic abstractions in the function
    if RoseRegion.verify() == False:
      return False
    # Verify the function type
    if not isinstance(self.getType(), RoseFunctionType):
      return False
    if self.getType().getNumArgs() != self.getNumArgs():
      return False
    # Verify the arguments
    for Index, Arg in enumerate(self.getArgs()):
      if Arg.getFunction() != self:
        return False
      if Arg.verify() == False:
        return False
      if self.getType().getArgType(Index) != Arg.getType():
        return False
    # Verify return value and type
    if self.getType().getReturnType() != self.getReturnValue().getType():
      return False
    BlockList = self.getRegionsOfType(RoseBlock)
    for Block in reversed(BlockList):
      for Op in Block:
        if isinstance(Op, RoseReturnOp):
          if Op.getOperand(0) != self.getReturnValue():
            return False
          break
    return True

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

  def __str__(self, NumSpace = 0):
    String = ""
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    # Print function signature first
    Func_Sig = Spaces + "function " + self.getName() + " ("
    for Index, Arg in enumerate(self.ArgList):
      Func_Sig += (" " + str(Arg.getType()) + " " + Arg.getName())
      if Index != len(self.ArgList) - 1:
        Func_Sig += ","
    Func_Sig += " ) {\n"
    String += Func_Sig
    String += RoseRegion.__str__(self, NumSpace + 1)
    String += (Spaces + "}\n")
    return String


####################################### ROSE BLOCK ############################################

# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
  def __init__(self, OpList : list, ParentRegion : RoseRegion):
    super().__init__(OpList, ParentRegion)

  @staticmethod
  def create(*args):
    if len(args) == 2:
      return RoseBlock(args[0], args[1])
    if len(args) == 1:
      return RoseBlock(args[0], RoseUndefRegion())
    if len(args) == 0:
      return RoseBlock([], RoseUndefRegion())
    assert False

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
    return super().__hash__()

  def clone(self, Suffix : str = "", ValueToValueMap : dict = dict(), ChangeID : bool = False):
    if Suffix == "" and ChangeID == False:
      return self.cloneRegion()
    ClonedBlock = RoseBlock.create()
    for Operation in self:
      ClonedOperation = Operation.cloneOperation(Suffix, ValueToValueMap, ChangeID)
      ClonedBlock.addRegion(ClonedOperation)
    return ClonedBlock
  
  def update(self, Block, ValueToValueMap : dict = dict(), ChangeID : bool = False):
    assert isinstance(Block, RoseBlock)
    # Erase all operations in this block
    RemoveOps = list()
    RemoveOps.extend(self.getOperations())
    for Op in RemoveOps:
      self.eraseOperation(Op)
    # Add ops from the given block to this block
    for Operation in Block.getOperations():
      ClonedOperation = Operation.cloneOperation("", ValueToValueMap, ChangeID)
      Block.addRegion(ClonedOperation)
    return

  def getOperations(self):
    return self.getChildren()

  def getOperation(self, Index):
    return self.getChild(Index)
  
  def getNumOperations(self):
    return self.getNumChildren()
  
  def getPosOfOperation(self, Operation):
    return self.getPosOfChild(Operation)
  
  def getUsersInRegion(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
      and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    Users = list()
    for Op in self.getOperations():
      if Op.usesValue(Abstraction):
        Users.append(Op)
    return Users

  def getNumUsersInRegion(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
      and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    NumUsers = 0
    for Op in self.getOperations():
      if Op.usesValue(Abstraction):
        NumUsers += 1
    return NumUsers

  # Insert the given op in the end of the block
  def addOperation(self, Operation : RoseOperation):
    if self.getNumOperations() > 0:
      Index = self.getNumChildren() - 1
      self.addOperationAfter(Operation, self.getOperation(Index))
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
    ParentKey = ParentRegion.getKeyForChild(self)
    BlockIndex = ParentRegion.getPosOfChild(self, ParentKey)
    # Collect all the ops for the new block
    OpsForNewBlock = self.getOperations()[Index:]
    # Remove the ops after the split point from this Block
    for Op in reversed(OpsForNewBlock):
      self.eraseChild(Op)
    # Create a new block and the new ops to it.
    NewBlock = self.create(OpsForNewBlock)
    assert isinstance(NewBlock, RoseBlock)
    # Add this new block to the parent region
    if BlockIndex == ParentRegion.getNumChildren(ParentKey) - 1:
      ParentRegion.addRegion(NewBlock, ParentKey)
    else:
      ParentRegion.addRegionBefore(BlockIndex + 1, NewBlock, ParentKey)
    return NewBlock

  def eraseOperation(self, Operation):
    assert isinstance(Operation, RoseOperation)
    # Ensure this operation does not have any uses left.
    # This is to prevent deletion of operations before their
    # uses are removed/fixed.
    Function = self.getFunction()
    assert not Function.hasUsesOf(Operation)
    self.eraseChild(Operation)
  
  # This helps remove an instruction from this block with
  # an expectation that operation will be used again.
  def removeOperation(self, Operation):
    self.eraseChild(Operation)
    return Operation



####################################### ROSE LOOP ############################################

# Class representing loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
  def __init__(self, IteratorName : str, Start : RoseValue, End : RoseValue, Step : RoseValue, 
              RegionList : list, ParentRegion : RoseRegion):
    self.Iterator = RoseValue.create(IteratorName, RoseIntegerType.create(32))
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
        Start = RoseConstant. create(args[1], RoseIntegerType.create(32))
        End = RoseConstant. create(args[2], RoseIntegerType.create(32))
        Step = RoseConstant. create(args[3], RoseIntegerType.create(32))
        return RoseForLoop(args[0], Start, End, Step, args[4], args[5])
    if len(args) == 5:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseValue) \
      and isinstance(args[4], list):
        return RoseForLoop(args[0], args[1], args[2], args[3], args[4], RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], int) \
      and isinstance(args[2], int) and isinstance(args[3], int) \
      and isinstance(args[4], list):
        Start = RoseConstant. create(args[1], RoseIntegerType.create(32))
        End = RoseConstant. create(args[2], RoseIntegerType.create(32))
        Step = RoseConstant. create(args[3], RoseIntegerType.create(32))
        return RoseForLoop(args[0], Start, End, Step, [], RoseUndefRegion())
    if len(args) == 4:
      if isinstance(args[0], str) and isinstance(args[1], RoseValue) \
      and isinstance(args[2], RoseValue) and isinstance(args[3], RoseValue):
        return RoseForLoop(args[0], args[1], args[2], args[3], [], RoseUndefRegion())
      if isinstance(args[0], str) and isinstance(args[1], int) \
      and isinstance(args[2], int) and isinstance(args[3], int):
        Start = RoseConstant. create(args[1], RoseIntegerType.create(32))
        End = RoseConstant. create(args[2], RoseIntegerType.create(32))
        Step = RoseConstant. create(args[3], RoseIntegerType.create(32))
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
    return super().__hash__()

  def clone(self, Suffix : str = "", ValueToValueMap : dict = dict(),  ChangeID : bool = False):
    if Suffix == "" and ChangeID == False:
      return self.cloneRegion()
    LoopStart = self.getStartIndex()
    if isinstance(LoopStart, RoseConstant):
      LoopStart = LoopStart.getValue()
    else:
      LoopStart = ValueToValueMap[LoopStart]
    LoopEnd = self.getEndIndex()
    if isinstance(LoopEnd, RoseConstant):
      LoopEnd = LoopEnd.getValue()
    else:
      LoopEnd = ValueToValueMap[LoopEnd]
    LoopStep = self.getStep()
    if isinstance(LoopStep, RoseConstant):
      LoopStep = LoopStep.getValue()
    else:
      LoopStep = ValueToValueMap[LoopStep]
    if Suffix != "":
      IteratorName = self.getIterator().getName() + "." + Suffix
    else:
      IteratorName = self.getIterator().getName()
    if isinstance(LoopStart, RoseValue) and not isinstance(LoopEnd, RoseValue):
      assert isinstance(LoopEnd, int)
      LoopEnd = RoseConstant(LoopEnd, LoopStart.getType())
    if isinstance(LoopEnd, RoseValue) and not isinstance(LoopStart, RoseValue):
      assert isinstance(LoopStart, int)
      LoopStart = RoseConstant(LoopStart, LoopEnd.getType())
    if isinstance(LoopStart, RoseValue) and not isinstance(LoopStep, RoseValue):
      assert isinstance(LoopStep, int)
      LoopStep = RoseConstant(LoopStep, LoopStart.getType())
    if isinstance(LoopStep, RoseValue) and not isinstance(LoopStart, RoseValue):
      assert isinstance(LoopStart, int)
      LoopStart = RoseConstant(LoopStart, LoopStep.getType())
      LoopEnd = RoseConstant(LoopEnd, LoopStep.getType())
    ClonedLoop = RoseForLoop.create(IteratorName, LoopStart, LoopEnd, LoopStep)
    ValueToValueMap[self.getIterator()] = ClonedLoop.getIterator()
    ValueToValueMap[self.getStartIndex()] = ClonedLoop.getStartIndex()
    ValueToValueMap[self.getEndIndex()] = ClonedLoop.getEndIndex()
    ValueToValueMap[self.getStep()] = ClonedLoop.getStep()
    for Abstraction in self:
      ClonedAbstraction = Abstraction.clone(Suffix, ValueToValueMap, ChangeID)
      ClonedLoop.addRegion(ClonedAbstraction)
    return ClonedLoop
  
  def update(self, Loop, ValueToValueMap : dict = dict(),  ChangeID : bool = False):
    assert isinstance(Loop, RoseForLoop)
    # Update the loop start, end and step
    LoopStart = Loop.getStartIndex()
    if not isinstance(LoopStart, RoseConstant):
      LoopStart = ValueToValueMap[LoopStart]
    self.setStartIndexVal(LoopStart)
    LoopEnd = Loop.getEndIndex()
    if not isinstance(LoopEnd, RoseConstant):
      LoopEnd = ValueToValueMap[LoopEnd]
    self.setEndIndexVal(LoopEnd)
    LoopStep = Loop.getStep()
    if not isinstance(LoopStep, RoseConstant):
      LoopStep = ValueToValueMap[LoopStep]
    self.setStepVal(LoopStep)
    # Set the iterator
    self.setIteratorName(Loop.getIterator().getName())
    ValueToValueMap[Loop.getIterator()] = self.getIterator()
    # Erase all regions in this loop
    RegionsToBeRemoved = list()
    RegionsToBeRemoved.extend(self.getChildren())
    for Abstraction in RegionsToBeRemoved:
      self.eraseChild(Abstraction)
    # Add new regions and remove the old regions
    for Abstraction in Loop:
      ClonedAbstraction = Abstraction.clone("", ValueToValueMap, ChangeID)
      self.addRegion(ClonedAbstraction)
    return

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
  
  def setIterator(self, IteratorVal : RoseValue):
    assert self.getIterator().getType() == IteratorVal.getType()
    self.Iterator = IteratorVal
  
  def setStartIndexVal(self, NewStart : RoseValue):
    assert self.Start.getType() == NewStart.getType()
    self.Start = NewStart
  
  def setStepVal(self, NewStep : RoseValue):
    assert self.Step.getType() == NewStep.getType()
    self.Step = NewStep

  def setEndIndexVal(self, NewEnd : RoseValue):
    assert self.End.getType() == NewEnd.getType()
    self.End = NewEnd
  
  # A preheader is a block that comes right before a loop
  def getPreheader(self):
    Parent = self.getParent()
    assert not isinstance(Parent, RoseUndefRegion)
    # Get the position of the loop in the parent region
    Key = Parent.getKeyForChild(self)
    PosIndex = Parent.getPosOfChild(self, Key)
    if PosIndex == 0:
      # There is no preheader
      return RoseUndefRegion()
    Preheader = Parent.getChild(PosIndex - 1, Key)
    if not isinstance(Preheader, RoseBlock):
      return RoseUndefRegion()
    return Preheader

  def getNumUsersInRegion(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
      and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    NumUsers = 0
    if self.getStartIndex() == Abstraction:
      NumUsers += 1
    if self.getEndIndex() == Abstraction:
      NumUsers += 1
    if self.getStep() == Abstraction:
      NumUsers += 1
    return NumUsers

  def replaceUsesWith(self, Abstraction, NewAbstraction):
    if self.getIterator() == Abstraction:
      self.setIterator(NewAbstraction)
    elif self.getStartIndex() == Abstraction:
      self.setStartIndexVal(NewAbstraction)
    elif self.getStep() == Abstraction:
      self.setStepVal(NewAbstraction)
    elif self.getEndIndex() == Abstraction:
      self.setEndIndexVal(NewAbstraction)
    super().replaceUsesWith(Abstraction, NewAbstraction)

  def verify(self):
    # Verify the basic abstractions in the loop
    if RoseRegion.verify() == False:
      return False
    # Verify the step and loop bounds
    if self.getIterator().getType() != self.getStartIndex().getType():
      return False
    if self.getStartIndex().getType() == self.getEndIndex().getType():
      return False
    if self.getStartIndex().getType() == self.getStep().getType():
      return False
    if isinstance(self.getStartIndex().getType(), RoseIntegerType):
      return False
    return True

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

  def __str__(self, NumSpace=0):
    String = ""
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    LoopHeader = Spaces + "for ([" + self.Iterator.getName() + " (range " \
        + self.getStartIndex().getName() + " " + self.getEndIndex().getName() \
        + " " + self.getStep().getName() + ")]) {\n"
    String += LoopHeader
    # Print regions in this loop
    String += super().__str__(NumSpace + 1)
    String += (Spaces + "}\n")
    return String


####################################### ROSE IF-ELSE ############################################

# Class representing If-else blocks
class RoseCond(RoseRegion):
  def __init__(self, Conditions : list, RegionsList : list, ParentRegion : RoseRegion):
    # Sanity check
    assert len(Conditions) > 0
    # Conditions must be a 1-bit bitvector or a boolean
    # Also, make sure that conditions are not the same.
    ConditionsSet = set()
    for Condition in Conditions:
      assert isinstance(Condition.getType(), RoseBitVectorType) \
        or isinstance(Condition.getType(), RoseBooleanType)
      if isinstance(Condition.getType(), RoseBitVectorType) \
              and isinstance(Condition.getType().getBitwidth(), int):
        assert Condition.getType().getBitwidth() == 1
      assert Condition not in ConditionsSet
      ConditionsSet.add(Condition)
    assert (len(Conditions) == len(RegionsList)) \
        or (len(Conditions) == len(RegionsList) - 1)
    Children = dict()
    Keys = list()
    Key = 0
    for RegionList in RegionsList:
      Children["Cond." + str(Key)] = RegionList
      Keys.append("Cond." + str(Key))
      Key += 1
    self.Conditions = Conditions
    super().__init__(Children, ParentRegion, Keys)
  
  @staticmethod
  def create(*args):
    if len(args) == 3:
      if isinstance(args[1], list):
        return RoseCond(args[0], args[1], args[2])
      assert isinstance(args[1], int)
      RegionsList = list()
      for _ in range(args[1]):
        RegionsList.append(list())
      return RoseCond(args[0], RegionsList, args[2])
    if len(args) == 2:
      if isinstance(args[1], list):
        return RoseCond(args[0], args[1], RoseUndefRegion())
      assert isinstance(args[1], int)
      RegionsList = list()
      for _ in range(args[1]):
        RegionsList.append(list())
      return RoseCond(args[0], RegionsList, RoseUndefRegion())
    assert False
  
  def __eq__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop):
        return False
    assert isinstance(Other, RoseCond)
    return self.Conditions == Other.Conditions and super().__eq__(Other)

  def __ne__(self, Other):
    if isinstance(Other, RoseUndefRegion) \
    or isinstance(Other, RoseFunction) \
    or isinstance(Other, RoseBlock) \
    or isinstance(Other, RoseForLoop):
        return True
    assert isinstance(Other, RoseCond)
    return self.Conditions != Other.Conditions or super().__ne__(Other)

  # Make rose cond regions hashable
  def __hash__(self):
    return super().__hash__()

  def clone(self, Suffix : str = "", ValueToValueMap : dict = dict(), ChangeID : bool = False):
    if Suffix == "" and ChangeID == False:
      return self.cloneRegion()
    ClonedConditions = list()
    for Condition in self.Conditions:
      ClonedConditions.append(ValueToValueMap[Condition])
    ClonedCondRegion = RoseCond.create(ClonedConditions, len(self.getKeys()))
    for Abstraction in self:
      ClonedAbstraction = Abstraction.clone(Suffix, ValueToValueMap, ChangeID)
      Key = self.getKeyForChild(Abstraction)
      ClonedCondRegion.addRegion(ClonedAbstraction, Key)
    return ClonedCondRegion

  def update(self, CondRegion, ValueToValueMap : dict = dict(), ChangeID : bool = False):
    assert isinstance(CondRegion, RoseCond)
    # Add the new conditions
    self.Conditions = list()
    for Condition in CondRegion.getConditions():
      self.Conditions.append(ValueToValueMap[Condition])
    # Remove all regions in this cond region
    RegionsToBeRemoved = list()
    for Abstraction in self:
      RegionsToBeRemoved.append(Abstraction)
    for Abstraction in RegionsToBeRemoved:
      self.eraseChild(Abstraction)
    # Add new regions and remove the old regions
    for Abstraction in CondRegion:
      ClonedAbstraction = Abstraction.clone("", ValueToValueMap, ChangeID)
      Key = self.getKeyForChild(Abstraction)
      self.addRegion(ClonedAbstraction, Key)
    return
  
  def getCondition(self, Index : int = 0):
    return self.Conditions[Index]
  
  def getConditions(self):
    return self.Conditions
  
  def setCondition(self, Idx, NewCondition):
    assert isinstance(NewCondition.getType(), RoseBitVectorType) \
      or isinstance(NewCondition.getType(), RoseBooleanType)
    self.Conditions[Idx] = NewCondition
  
  def getThenRegions(self):
    return self.getChildren(self.getKeyForThenRegion())
  
  def getElseRegions(self):
    return self.getChildren()[self.getKeyForElseRegion()]
  
  def getElseIfRegions(self):
    return self.getChildren()[self.getKeyForElseIfRegion()]
  
  def addThenRegion(self, Region):
    return self.addRegion(Region, self.getKeyForThenRegion())
  
  def addElseRegion(self, Region):
    return self.addRegion(Region, self.getKeyForElseRegion())

  def addAbstractionInThenRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, self.getKeyForThenRegion())
  
  def addAbstrctionInElseRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, self.getKeyForElseRegion())

  def addAbstrctionInElseIfRegion(self, Abstraction):
    return self.addAbstraction(Abstraction, self.getKeyForElseIfRegion())
  
  def addNewElseRegion(self, Abstraction):
    NewKey = len(self.getKeys())
    self.addNewKeyedRegion(NewKey, Abstraction)

  def addNewElseIfRegion(self, Condition, Abstraction):
    self.Conditions = Condition
    NewKey = len(self.getKeys())
    self.addNewKeyedRegion(NewKey, Abstraction)

  def getKeyForThenRegion(self):
    assert len(self.getKeys()) > 0
    return self.getKeys()[0]

  def getKeyForElseRegion(self):
    assert len(self.getKeys()) >= 2
    # Get the last key
    return self.getKeys()[-1]
  
  def getKeyForElseIfRegion(self):
    assert len(self.getKeys()) == 3
    return self.getKeys()[1]

  def hasElseRegion(self):
    return len(self.getKeys()) >= 2
  
  def hasElseIfRegion(self):
     return len(self.getKeys()) == 3

  def replaceUsesWith(self, Abstraction, NewAbstraction):
    for Index, Condition in enumerate(self.getConditions()):
      if Condition == Abstraction:
        self.setCondition(Index, NewAbstraction)
    super().replaceUsesWith(Abstraction, NewAbstraction)

  def getNumUsersInRegion(self, Abstraction):
    assert not isinstance(Abstraction, RoseUndefValue) \
      and not isinstance(Abstraction, RoseConstant)
    assert isinstance(Abstraction, RoseValue)
    NumUsers = 0
    for Condition in self.Conditions:
      if Condition == Abstraction:
        NumUsers += 1
    return NumUsers

  def verify(self):
    # Verify the basic abstractions in the cond region
    if RoseRegion.verify() == False:
      return False
    # Verify conditions
    if len(self.getConditions()) == 0:
      return False
    for Condition in self.getConditions():
      if not isinstance(Condition, RoseBooleanType) \
        and not isinstance(Condition, RoseBitVectorType):
        return False
      if Condition.getType().getBitwidth() != 1:
        return False
    return True

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Condition = Spaces + "if (" + str(self.Conditions[0].getType()) \
                       + " " + self.Conditions[0].getName() + ") {"
    print(Condition)
    # Print regions in this then regions
    for Region in self.getChildren(self.getKeyForThenRegion()):
      assert Region.getParent() == self
      Region.print(NumSpace + 1)
    # Printing other cond regions
    if len(self.getConditions()) >= 1:
      if len(self.getConditions()) >= 2:
        if len(self.getChildren()) > len(self.getConditions()):
          assert len(self.getChildren()) - 1 == len(self.getConditions())
          Conditions = self.Conditions[1:-1]
        else:
          assert len(self.getChildren()) == len(self.getConditions())
          Conditions = self.Conditions[1:]
        for Index, ConditionVal in enumerate(Conditions):
          Condition = Spaces + "} elif (" + str(ConditionVal.getType()) \
                      + " " + ConditionVal.getName() + ") {"
          print(Condition)
          # Print regions in this then regions
          for Region in self.getChildren(self.getKeys()[Index + 1]):
            assert Region.getParent() == self
            Region.print(NumSpace + 1)
      if len(self.getChildren()) > len(self.getConditions()):
        assert len(self.getChildren()) - 1 == len(self.getConditions())
        print(Spaces + "} else {")
        for Region in self.getChildren(self.getKeyForElseRegion()):
          assert Region.getParent() == self
          Region.print(NumSpace + 1)
    print(Spaces + "}")


  def __str__(self, NumSpace=0):
    String = ""
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Condition = Spaces + "if (" + str(self.Conditions[0].getType()) \
                       + " " + self.Conditions[0].getName() + ") {\n"
    String += Condition
    # Print regions in this then regions
    for Region in self.getChildren(self.getKeyForThenRegion()):
      assert Region.getParent() == self
      String += Region.__str__(NumSpace + 1)
    # Printing other cond regions
    if len(self.getConditions()) >= 1:
      if len(self.getConditions()) >= 2:
        if len(self.getChildren()) > len(self.getConditions()):
          assert len(self.getChildren()) - 1 == len(self.getConditions())
          Conditions = self.Conditions[1:-1]
        else:
          assert len(self.getChildren()) == len(self.getConditions())
          Conditions = self.Conditions[1:]
        for Index, ConditionVal in enumerate(Conditions):
          Condition = Spaces + "} elif (" + str(ConditionVal.getType()) \
                      + " " + ConditionVal.getName() + ") {\n"
          String += Condition
          # Print regions in this then regions
          for Region in self.getChildren(self.getKeys()[Index + 1]):
            assert Region.getParent() == self
            String += Region.__str__(NumSpace + 1)
      if len(self.getChildren()) > len(self.getConditions()):
        assert len(self.getChildren()) - 1 == len(self.getConditions())
        String += Spaces + "} else {\n"
        for Region in self.getChildren(self.getKeyForElseRegion()):
          assert Region.getParent() == self
          String += Region.__str__(NumSpace + 1)
    String += Spaces + "}\n"
    return String

