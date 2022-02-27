###################################################################
#
# Some utility functions that could be useful for Similarity
# Checker.
#
###################################################################


from ast import Sub
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



def GetOpDeterminingLoopBounds(Loop : RoseForLoop):
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  FunctionOutput = Loop.getFunction().getReturnValue()
  Params = Loop.getFunction().getArgs()
  BVInsertOps = []
  BVExtractOps = []
  # Get the bvinserts to the output of the function that this belongs to.
  BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
  for Block in BlockList:
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == FunctionOutput:
          ParentLoop = Loop.getParentOfType(RoseForLoop)
          print("ParentLoop:")
          ParentLoop.print()
          if not isinstance(ParentLoop, RoseUndefRegion):
            if Op.getLowIndex() == ParentLoop.getIterator():
              continue
          BVInsertOps.append(Op)
      elif isinstance(Op, RoseBVExtractSliceOp):
        if Op.getInputBitVector() in Params:
          BVExtractOps.append(Op)

  if len(BVInsertOps) != 0:
      # But first make sure the bitwidth for all bvinserts is the same.    
    BitWidth = BVInsertOps[0].getOutputBitwidth()
    #if BitWidth != 1:
    for Op in BVInsertOps:
      assert Op.getOutputBitwidth() == BitWidth
    return [BVInsertOps[0]]
    #else:
      # But first make sure the bitwidth for all bvxtracts is the same.    
    #  BitWidth = BVExtractOps[0].getOutputBitwidth()
    #  for Op in BVExtractOps:
    #    assert Op.getOutputBitwidth() == BitWidth
  elif len(BVExtractOps) != 0:
    # But first make sure the bitwidth for all bvxtracts is the same.    
    BitWidth = BVExtractOps[0].getOutputBitwidth()
    for Op in BVExtractOps:
      assert Op.getOutputBitwidth() == BitWidth
    return BVExtractOps
  else:
    # Nothing to do here.
    return [RoseUndefValue()]





