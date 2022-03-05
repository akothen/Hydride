###################################################################
#
# Some utility functions that could be useful for Similarity
# Checker.
#
###################################################################


from ast import Sub
from re import L
from RoseType import RoseType
from RoseValue import RoseValue
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
      if not isinstance(Operation, RoseBVExtractSliceOp):
        Worklist.extend(Operation.getOperands())
        continue
      SkipBVExtracts.add(Operation)
      break
  return SkipBVExtracts


# The loop bounds must be determined by the bvinsert or bvextract to inputs/output 
# of the smallest bitwidth.
def GetOpDeterminingLoopBounds(Loop : RoseForLoop):
  # Sanity check
  assert not isinstance(Loop, RoseUndefRegion)
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  FunctionOutput = Loop.getFunction().getReturnValue()
  Params = Loop.getFunction().getArgs()
  BVInsertOps = []
  BVExtractOps = []
  # Get all the blocks in this loop at level 0.
  BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
  # Take into account any cond blocks in the loop
  CondRegions = Loop.getRegionsOfType(RoseCond, Level=0)
  for CondRegion in CondRegions:
    CondRegionBlockList = CondRegion.getRegionsOfType(RoseBlock, Level=0)
    BlockList.extend(CondRegionBlockList)

  SkipBVExtracts = GetBVExtractsToBeSkipped(Loop)

  # Now gather the bvinserts and bvextracts.
  Result = list()
  for Block in BlockList:
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        Op.print()
        if Op.getInputBitVector() == FunctionOutput:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            Result.append(Op)
            continue
          BVInsertOps.append(Op)
          continue
      if isinstance(Op, RoseBVExtractSliceOp):
        if Op in SkipBVExtracts:
          continue
        if Op.getInputBitVector() in Params:
          if isinstance(Op.getOutputBitwidth(), RoseArgument):
            Result.append(Op)
            continue
          BVExtractOps.append(Op)

  # If we already have some results in the result list, just return that
  if len(Result) != 0:
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
    for Op in BVExtractOps:
      if Op.getOutputBitwidth() == ExtractBitWidth:
        Result.append(Op)
    return Result
  
  return None


