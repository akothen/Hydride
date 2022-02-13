#############################################################
#
# Changes the loop bounds to canonical form.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseSimilarityCheckerUtilities import *


def RunFixLoopsBooundsInLoop(Loop : RoseForLoop):
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  FunctionOutput = Loop.getFunction().getReturnValue()
  Params = Loop.getFunction().getArgs()
  BVInsertOps = []
  BVExtractOps = []
  # Get the bvinserts to the output of the function that this belongs to.
  for Region in Loop:
    if isinstance(Region, RoseBlock):
      for Op in Region:
        if isinstance(Op, RoseBVInsertSliceOp):
          if Op.getInputBitVector() == FunctionOutput:
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
  else:
    # Nothing to do here.
    return

  # Go over the bvinserts/bvextracts and see if the bitwidth and loop step are the same.
  # Now see if the loop bounds need adjusting
  LoopStep = Loop.getStep()
  assert isinstance(LoopStep, RoseConstant)
  if BitWidth != LoopStep.getValue():
    # Compute factor
    assert LoopStep.getValue() < BitWidth
    Factor = BitWidth / LoopStep.getValue()
    assert Factor == int(Factor)
    Factor = int(Factor)
    # Assuming loop start and end are constant values as well.
    Start = Loop.getStartIndex()
    End = Loop.getEndIndex()
    assert isinstance(Start, RoseConstant)
    assert isinstance(End, RoseConstant)
    # Fix the loop bounds now
    Loop.setStartIndex(Factor * Start.getValue())
    Loop.setEndIndex(Factor * End.getValue())
    Loop.setStep(Factor * LoopStep.getValue())
    # Now change the iterator name
    OldIterator = Loop.getIterator()
    Loop.setIteratorName(OldIterator.getName() + ".new")
    # Replace the old iterator value with new one
    NewIterator = Loop.getIterator()
    FactorVal = RoseConstant(Factor, NewIterator.getType())
    IteratorReplacement = RoseDivOp.create(OldIterator.getName() + ".new.div", \
                            NewIterator, FactorVal)
    # Check if the loop's first child region is a block, if not we insert one
    if not isinstance(Loop.getChild(0), RoseBlock):
      Block = RoseBlock.create([IteratorReplacement])
      Loop.addRegionBefore(0, Block)
    else:
      Block = Loop.getChild(0)
      Block.addOperationBefore(IteratorReplacement, Block.getOperation(0))
    Loop.replaceUsesWith(OldIterator, IteratorReplacement)
  print("NEW LOOP:")
  Loop.print()


def RunFixLoopsBooundsInFunction(Region):
  # Iterate over all the contents of this function
  for Abstraction in Region:
    assert not isinstance(Abstraction, RoseFunction)
    if isinstance(Abstraction, RoseForLoop):
      RunFixLoopsBooundsInLoop(Abstraction)
      continue
    print("REGION:")
    print(Abstraction)
    Abstraction.print()


def AddOuterLoopInFunction(Function : RoseFunction):
  # Use the return value of the function as the end and step
  Bitwidth = Function.getReturnValue().getType().getBitwidth()
  # Create a new loop
  Loop = RoseForLoop.create("%" + "outer.it", 0, Bitwidth, Bitwidth)
  # Add the regions in the function into the loop
  RegionList = list()
  for Region in Function:
    RegionList.append(Region)
  # The last region has the return operation
  LastRegion = RegionList[len(RegionList) - 1]
  ReturnOpFound = False
  for Op in LastRegion:
    if isinstance(Op, RoseReturnOp):
      ReturnOpFound = True
      break
  assert ReturnOpFound == True
  RegionList.pop(len(RegionList) - 1)
  for Region in RegionList:
    Function.eraseChild(Region)
    Loop.addRegion(Region)
  # Now add the loop to the function
  Function.addRegionBefore(0, Loop)


def FixBlocksWithMultipleBVInserts(Function : RoseFunction):
  BlockList = Function.getRegionsOfType(RoseBlock)
  # Iterate over the blocks to see if they have multiple bvinserts
  BlockToBVInsertOpsMap = dict()
  for Block in BlockList:
    BVInsertOpsList = list()
    for Op in Block:
      if isinstance(Op, RoseBVInsertSliceOp):
        BVInsertOpsList.append(Op)
    if len(BVInsertOpsList) > 1:
      BlockToBVInsertOpsMap[Block] = []
      for BVInsertOp in BVInsertOpsList:
        BlockToBVInsertOpsMap[Block].append(BVInsertOp)
  
  # Split the blocks at bvinserts
  for Block, BVInsertOpsList in BlockToBVInsertOpsMap.items():
    # Only handle cases whose parents are loops
    Loop = Block.getParent()
    assert isinstance(Loop, RoseForLoop)
    BlockList = list()
    for SplitPoint in BVInsertOpsList:
      # Split the block at the split point
      ParentBlock = SplitPoint.getParent()
      Pos = ParentBlock.getPosOfOperation(SplitPoint)
      if Pos + 1 != ParentBlock.getNumOperations():
        ParentBlock.splitAt(Pos + 1)
      BlockList.append(ParentBlock)
    # Now extact the blocks in the blocklist from the loop
    # and add loops around them and add them back.
    ParentOfLoop = Loop.getParent()
    LoopPos = ParentOfLoop.getPosOfChild(Loop)
    LoopList = list()
    BlockList = BlockList[1:] # Leave out the original (first) block
    Index = 1
    for ChildBlock in BlockList:
      Loop.eraseChild(ChildBlock)
      NewLoop = RoseForLoop.create(Loop.getIterator().getName() + str(Index),\
                                  Loop.getStartIndex().getValue(), Loop.getEndIndex().getValue(), \
                                  Loop.getStep().getValue())
      NewLoop.addRegion(ChildBlock)
      # Replace the uses of old iterator with the new one
      NewLoop.replaceUsesWith(Loop.getIterator(), NewLoop.getIterator())
      LoopList.append(NewLoop)
      Index += 1
    # Now add the new loops back to the function
    InsertBefore = LoopPos + 1
    for NewLoop in LoopList:
      ParentOfLoop.addRegionBefore(LoopPos, NewLoop)
      InsertBefore += 1
      

def CanonicalizeFunction(Function : RoseFunction):
  print("CANONICALIZING FUNCTION")
  print("FUNCTION:")
  Function.print()
  # See if the function is already canonicalize
  if IsFunctionInCanonicalForm(Function) == True:
    print("FUNCTION IS IN CANONICAL FORM")
    return

  # Make sure all blocks have only one bvinsert
  FixBlocksWithMultipleBVInserts(Function)
  if IsFunctionInCanonicalForm(Function) == True:
    print("_____FUNCTION IS IN CANONICAL FORM")
    return

  # Adjust the loop bounds
  print("ADJUST LOOP BOUNDS IN FUNCTION")
  RunFixLoopsBooundsInFunction(Function)
  if IsFunctionInCanonicalForm(Function) == True:
    print("_____FUNCTION IS IN CANONICAL FORM")
    return

  # There should be only one high-level loop
  #if Function.numLevelsOfRegion(RoseForLoop, Level=0) != 1:
    # Need to add a loop at the high level -- this is a very common case
  AddOuterLoopInFunction(Function)
  if IsFunctionInCanonicalForm(Function):
    return


# Runs a transformation
def Run(Function : RoseFunction):
  CanonicalizeFunction(Function)
  print("\n\n\n\n\n")
  Function.print()



