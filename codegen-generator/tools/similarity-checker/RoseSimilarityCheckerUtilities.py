###################################################################
#
# Some utility functions that could be useful for Similarity
# Checker.
#
###################################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


# The cananonical for a function is a loop nest with 
# one outer loop and at least one inner loop. 
def IsFunctionInCanonicalForm(Function : RoseFunction):
  # This function must not have a parent
  if Function.isTopLevelFunction() == False:
    return False
  # This function must not contain other functions
  if Function.containsRegionOfType(RoseFunction) == True:
    return False
  OuterLoopFound = False
  InnerLoopsFound = False
  for Region in Function:
    # Make sure there aren't more than one bvinserts in a block
    if isinstance(Region, RoseBlock):
      BVInsertFound = False
      for Op in Region:
        if isinstance(Op, RoseBVInsertSliceOp):
          if BVInsertFound == True:
            return False
          BVInsertFound = True
      continue
    # The given function cannot contain regions other than loops
    if not isinstance(Region, RoseForLoop):
      return False
    if OuterLoopFound == True:
      return False
    OuterLoopFound = True
    InnerLoopStep = RoseUndefValue()
    for SubRegion in Region:
      # Make sure there aren't more than one bvinserts in a block
      if isinstance(SubRegion, RoseBlock):
        BVInsertFound = False
        for Op in SubRegion:
          if isinstance(Op, RoseBVInsertSliceOp):
            if BVInsertFound == True:
              return False
            BVInsertFound = True
        continue
      # This level of loop mustn't contain regions other than loops
      if not isinstance(SubRegion, RoseForLoop):
        return False
      InnerLoopsFound = True
      if InnerLoopStep == RoseUndefValue():
        InnerLoopStep = SubRegion.getStep()
      else:
        if InnerLoopStep.getValue() != SubRegion.getStep().getValue():
          return False
      InnerInnerLoopStep = RoseUndefValue()
      for SubSubRegion in SubRegion:
        # Make sure there aren't more than one bvinserts in a block
        if isinstance(SubSubRegion, RoseBlock):
          BVInsertFound = False
          for Op in SubSubRegion:
            if isinstance(Op, RoseBVInsertSliceOp):
              if BVInsertFound == True:
                return False
              BVInsertFound = True
          continue
        if isinstance(SubSubRegion, RoseForLoop):
          if InnerInnerLoopStep == RoseUndefValue():
            InnerInnerLoopStep = SubSubRegion.getStep()
          else:
            if InnerInnerLoopStep.getValue() != SubSubRegion.getStep().getValue():
              return False
  return (OuterLoopFound == True and InnerLoopsFound == True)


def GetBVExtractsToBeSkipped(Abstraction):
  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = set()
  CondRegions = Abstraction.getRegionsOfType(RoseCond)
  for CondRegion in CondRegions:
    Worklist = list()
    Worklist.append(CondRegion.getCondition())
    while len(Worklist) != 0:
      Operation = Worklist.pop()
      if not isinstance(Operation, RoseOperation):
        continue
      if Operation == CondRegion.getCondition():
        # This thing only applies if the conditions are coming from
        # extracting bits from masks.
        if not isinstance(Operation, RoseBVExtractSliceOp):
          continue
      if not isinstance(Operation, RoseBVExtractSliceOp):
        Worklist.extend(Operation.getOperands())
        continue
      SkipBVExtracts.add(Operation)
      break
  # Iterate over some blocks
  BlockList = Abstraction.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    for Op in Block:
      if isinstance(Op, RoseSelectOp):
        if isinstance(Op.getCondition(), RoseBVExtractSliceOp):
          Worklist = list()
          Worklist.append(Op.getCondition())
          while len(Worklist) != 0:
            Operation = Worklist.pop()
            if not isinstance(Operation, RoseOperation):
              continue
            if Operation == Op.getCondition():
              # This thing only applies if the conditions are coming from
              # extracting bits from masks.
              if not isinstance(Operation, RoseBVExtractSliceOp):
                continue
            if not isinstance(Operation, RoseBVExtractSliceOp):
              Worklist.extend(Operation.getOperands())
              continue
            SkipBVExtracts.add(Operation)
            break
  return SkipBVExtracts


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output 
# of the smallest bitwidth.
def GetOpDeterminingLoopBoundsInBlockList(Function : RoseFunction, BlockList : list, \
                                          SkipBVExtracts : list = list()):
  # Sanity check
  assert isinstance(Function, RoseFunction)
  # Now gather the bvinserts and bvextracts.
  FunctionOutput = Function.getReturnValue()
  Params = Function.getArgs()
  BVInsertOps = list()
  BVExtractOps = list()
  Result = list()
  #BlockToBVInsertOp = dict()
  for Block in BlockList:
    print("BLOCK IN BLOCKLIST:")
    Block.print()
    assert isinstance(Block, RoseBlock)
    assert Function == Block.getFunction()
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == FunctionOutput:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            #if Block in BlockToBVInsertOp:
            #  return None
            Result.append(Op)
            #BlockToBVInsertOp[Block] = Op
            continue
          #if Block in BlockToBVInsertOp:
          # return None
          BVInsertOps.append(Op)
          #BlockToBVInsertOp[Block] = Op
          continue
      if isinstance(Op, RoseBVExtractSliceOp):
        if Op in SkipBVExtracts:
          continue
        if Op.getInputBitVector() in Params:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            Result.append(Op)
            continue
          print("RELEVANT BV EXTRACT OP:")
          Op.print()
          BVExtractOps.append(Op)

  # If we already have some results in the result list, just return that
  if len(Result) != 0:
    print("RETUTNING RESULT")
    return Result

  # The bvinserts and bvextracts have output bitwidths that are integers 
  # (and not rose values).
  BitWidth = RoseUndefValue()
  if len(BVInsertOps) != 0:
    # But first make sure the bitwidth for all bvinserts is the same.    
    BitWidth = BVInsertOps[0].getOutputBitwidth()
    # Sanity check
    for Op in BVInsertOps[1:]:
      assert Op.getOutputBitwidth() == BitWidth
    Result.extend(BVInsertOps)
  
  if len(BVExtractOps) != 0:
    # Now check get extract ops with smallest output bitwidths
    ExtractBitWidth = BVExtractOps[0].getOutputBitwidth()
    for Op in BVExtractOps[1:]:
      Op.print()
      if ExtractBitWidth > Op.getOutputBitwidth():
        ExtractBitWidth = Op.getOutputBitwidth()
    if not isinstance(BitWidth, RoseUndefValue):
      if BitWidth > ExtractBitWidth:
        BitWidth = ExtractBitWidth
        # No bvinsert op is good here
        Result.clear()
    else:
      BitWidth = ExtractBitWidth
    for Op in BVExtractOps:
      print("Op.getOutputBitwidth():")
      print(Op.getOutputBitwidth())
      print("BitWidth:")
      print(BitWidth)
      if Op.getOutputBitwidth() == BitWidth:
        Result.append(Op)
  if len(Result) != 0:
    return Result
  return None


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output 
# of the smallest bitwidth.
def GetOpDeterminingLoopBounds(Loop : RoseForLoop):
  # Sanity check
  assert not isinstance(Loop, RoseUndefRegion)
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  # Get all the blocks in this loop at level 0.
  BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
  # Take into account any cond blocks in the loop
  CondRegions = Loop.getRegionsOfType(RoseCond, Level=0)
  for CondRegion in CondRegions:
    CondRegionBlockList = list()
    CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForThenRegion()))
    if CondRegion.hasElseIfRegion():
      CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForElseIfRegion()))
    if CondRegion.hasElseRegion():
      CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForElseRegion()))
    print("CondRegionBlockList:")
    for Block in CondRegionBlockList:
      print("BLOCK:")
      Block.print()
      print("*********")
    BlockList.extend(CondRegionBlockList)

  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = GetBVExtractsToBeSkipped(Loop)

  return GetOpDeterminingLoopBoundsInBlockList(Loop.getFunction(), BlockList, SkipBVExtracts)


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output 
# of the smallest bitwidth.
def GetOpDeterminingOuterLoopBoundsInBlockList(Function : RoseFunction, BlockList : list, \
                                              SkipBVExtracts : list = list()):
  # Sanity check
  assert isinstance(Function, RoseFunction)
  # Now gather the bvinserts and bvextracts.
  FunctionOutput = Function.getReturnValue()
  Params = Function.getArgs()
  Result = list()
  #BlockToBVInsertOp = dict()
  for Block in BlockList:
    print("BLOCK IN BLOCKLIST:")
    Block.print()
    assert isinstance(Block, RoseBlock)
    assert Function == Block.getFunction()
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == FunctionOutput:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            #if Block in BlockToBVInsertOp:
            #  return None
            #BlockToBVInsertOp[Block] = Op
            continue
          #if Block in BlockToBVInsertOp:
          # return None
          Result.append(Op)
          #BlockToBVInsertOp[Block] = Op
          continue
      if isinstance(Op, RoseBVExtractSliceOp):
        if Op in SkipBVExtracts:
          continue
        if Op.getInputBitVector() in Params:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            continue
          print("RELEVANT BV EXTRACT OP:")
          Op.print()
          Result.append(Op)

  # If we already have some results in the result list, just return that
  if len(Result) != 0:
    print("RETUTNING RESULT")
    return Result
  return None


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output 
# of the smallest bitwidth.
def GetOpDeterminingOuterLoopBounds(Loop : RoseForLoop):
  # Sanity check
  assert not isinstance(Loop, RoseUndefRegion)
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  # Get all the blocks in this loop at level 0.
  BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
  # Take into account any cond blocks in the loop
  CondRegions = Loop.getRegionsOfType(RoseCond, Level=0)
  for CondRegion in CondRegions:
    CondRegionBlockList = list()
    CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForThenRegion()))
    if CondRegion.hasElseIfRegion():
      CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForElseIfRegion()))
    if CondRegion.hasElseRegion():
      CondRegionBlockList.extend(CondRegion.getRegionsOfType(RoseBlock, Level=0, \
                                              Key=CondRegion.getKeyForElseRegion()))
    print("CondRegionBlockList:")
    for Block in CondRegionBlockList:
      print("BLOCK:")
      Block.print()
      print("*********")
    BlockList.extend(CondRegionBlockList)

  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = GetBVExtractsToBeSkipped(Loop)

  return GetOpDeterminingOuterLoopBoundsInBlockList(Loop.getFunction(), BlockList, SkipBVExtracts)


def GenConcreteValue(ConcreteValue : RoseConstant):
  assert isinstance(ConcreteValue, RoseConstant)
  if isinstance(ConcreteValue.getType(), RoseBitVectorType):
    if ConcreteValue.getType().getBitwidth() >= 4:
      Input = "(bv #x"
      HexVal = hex(ConcreteValue.getValue())
      HexValString = str(HexVal[2:])
      LeftOver = ConcreteValue.getType().getBitwidth() - len(HexValString)
      for _ in range(LeftOver):
        HexValString = "0" + HexValString
      Input += HexValString
      Input += " " + str(ConcreteValue.getType().getBitwidth()) + ")"
    else:
      Input = "(bv #b"
      HexVal = bin(ConcreteValue.getValue())
      HexValString = str(HexVal[2:])
      LeftOver = ConcreteValue.getType().getBitwidth() - len(HexValString)
      for _ in range(LeftOver):
        HexValString = "0" + HexValString
      Input += HexValString
      Input += " " + str(ConcreteValue.getType().getBitwidth()) + ")"    
  else:
    assert isinstance(ConcreteValue.getType(), RoseIntegerType) \
        or isinstance(ConcreteValue.getType(), RoseBooleanType)
    Input = str(ConcreteValue.getValue())
  return Input


# The names in Rosette IR need to be changed to names of instructions
# in LLVM IR.
def RoseIRToLLVM(Name : str):
  assert isinstance(Name, str)
  NameList = list(Name)
  Index = 0
  for Char in NameList:
    if Char != "_":
      break
    Index += 1
  Name = "".join(NameList[Index:])
  return "hydride_" + Name


