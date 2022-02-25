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
from RoseContext import *
from RoseSimilarityCheckerUtilities import *


def RunFixLoopsBooundsInLoop(Loop : RoseForLoop, Context : RoseContext):
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
    ReplaceUsesWithUniqueCopiesOf(Loop, OldIterator, IteratorReplacement, Context)
  print("NEW LOOP:")
  Loop.print()
  import RoseOpCombine
  RoseOpCombine.RunOpCombineOnRegion(Loop, Context)
  print("NEW LOOP:")
  Loop.print()
  #assert False


def RunFixLoopsBooundsInFunction(Region, Context : RoseContext):
  # Iterate over all the contents of this function
  for Abstraction in Region:
    assert not isinstance(Abstraction, RoseFunction)
    if isinstance(Abstraction, RoseForLoop):
      RunFixLoopsBooundsInLoop(Abstraction, Context)
    if not isinstance(Abstraction, RoseBlock):
      RunFixLoopsBooundsInFunction(Abstraction, Context)
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


def AddTwoNestedLoopsInFunction(Function : RoseFunction):
  # There are no loops in the code. Now we check if the code is all in one block
  # or there is some control flow (which we do not handle right now.)
  # TODO: Handle cases where control flow exists.
  NumBlocksAtLevel0 = Function.numLevelsOfRegion(RoseBlock, 0)
  assert NumBlocksAtLevel0 == 1
  [Block] = Function.getRegionsOfType(RoseBlock, 0)

  # Split the block first to separate out the return operation.
  # Look for the first bvinsert op from the bottom.
  # Just as a sanity check the last op in the block must be a 
  # return op.
  assert isinstance(Block.getTailChild(), RoseReturnOp)
  LastBVInsertOp = RoseUndefValue()
  for Op in reversed(Block.getOperations()):
    if isinstance(Op, RoseBVInsertSliceOp):
      # Found a bvinsert op! Check to see that this inserts into the 
      # function's return value.
      assert Op.getInputBitVector() == Function.getReturnValue()
      # Now split the block.
      Pos = Block.getPosOfOperation(Op)
      Block.splitAt(Pos + 1)
      LastBVInsertOp = Op
      break

  # Now another sanity check to see if there are 2 blocks at level zero
  assert not isinstance(LastBVInsertOp, RoseUndefValue)
  NumBlocksAtLevel0 = Function.numLevelsOfRegion(RoseBlock, 0)
  assert NumBlocksAtLevel0 == 2

  # Now we add a loop around the first block
  Block = LastBVInsertOp.getParent()
  # Use the return value of the function as the end and step
  Bitwidth = Function.getReturnValue().getType().getBitwidth()
  # Create the inner loop
  InnerLoop = RoseForLoop.create("%" + "inner.it", 0, Bitwidth, Bitwidth)
  # Add the first block to the inner loop and remove it from the function
  Function.eraseChild(Block)
  InnerLoop.addRegion(Block)
  # Create the outer loop and add the inner loop into the outer loop
  OuterLoop = RoseForLoop.create("%" + "outer.it", 0, Bitwidth, Bitwidth)
  OuterLoop.addRegion(InnerLoop)
  # Now add the loop to the function
  Function.addRegionBefore(0, OuterLoop)


def FixLoopNestingInFunction(Function : RoseFunction):
  # Get number of loops at different levels
  NumLoopsAtLevel0 = Function.numLevelsOfRegion(RoseForLoop, 0)
  if NumLoopsAtLevel0 == 0:
    AddTwoNestedLoopsInFunction(Function)
  elif NumLoopsAtLevel0 >= 1:
    AddOuterLoopInFunction(Function)


def FixBlocksWithMultipleBVInserts(Function : RoseFunction):
  BlockList = Function.getRegionsOfType(RoseBlock)
  # Iterate over the blocks to see if they have multiple bvinserts
  # to the function return value
  BlockToBVInsertOpsMap = dict()
  for Block in BlockList:
    BVInsertOpsList = list()
    for Op in Block:
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == Function.getReturnValue():
          BVInsertOpsList.append(Op)
    if len(BVInsertOpsList) > 1:
      BlockToBVInsertOpsMap[Block] = BVInsertOpsList
  
  # Split the blocks at bvinserts
  for Block, BVInsertOpsList in BlockToBVInsertOpsMap.items():
    # Only handle cases whose parents are loops
    Loop = Block.getParentOfType(RoseForLoop)
    if Loop == RoseUndefRegion():
      continue
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


def FixAccumulationCode(Function : RoseFunction):
  print("FIX ACCUMULATION CODE")
  BlockList = Function.getRegionsOfType(RoseBlock)
  AccumulationPatterFound = False
  NewInitInstructions = list()
  InitInstructions = list()
  for Block in reversed(BlockList):
    if len(NewInitInstructions) != 0:
      break
    # Look for accumulation pattern
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == Function.getReturnValue():
          # The bvinsert op has to be using the iterator
          Loop = Block.getParentOfType(RoseForLoop)
          if not isinstance(Loop, RoseUndefRegion):
            if Op.getLowIndex() != Loop.getIterator():
              break
            assert isinstance(Loop.getStep(), RoseConstant)
            if Loop.getStep().getValue() != Op.getOutputBitwidth():
              break
            assert isinstance(Loop.getEndIndex(), RoseConstant)
            if Loop.getEndIndex().getValue() != \
                      Op.getInputBitVector().getType().getBitwidth():
              break
          # Now go up the use-def chain. The inserted values
          # must be coming from a bvadd op.
          InsertValue = Op.getInsertValue()
          if not isinstance(InsertValue, RoseAddOp):
            # See if this is an extract op
            if isinstance(InsertValue, RoseBVExtractSliceOp):
              # If the extracted bitvector is a function argument
              if isinstance(InsertValue.getInputBitVector(), RoseArgument):
                if not isinstance(Loop, RoseUndefRegion):
                  if InsertValue.getLowIndex() == Loop.getIterator():
                    assert isinstance(Loop.getStep(), RoseConstant)
                    if Loop.getStep().getValue() == InsertValue.getOutputBitwidth():
                      if Loop.getEndIndex().getValue() == \
                                InsertValue.getInputBitVector().getType().getBitwidth():
                        assert len(NewInitInstructions) == 0
                        InitInstructions.append(Op)
                        InitInstructions.append(InsertValue)
                        NewInst = Op.clone()
                        NewInst.setOperand(0, InsertValue.getInputBitVector())
                        NewInst.setOperand(2, RoseConstant.create(0, \
                                          NewInst.getOperand(2).getType()))
                        NewInst.setOperand(3, \
                            RoseConstant.create(Loop.getEndIndex().getValue() - 1, \
                                          NewInst.getOperand(3).getType()))
                        NewInst.setOperand(4, \
                            RoseConstant.create(Loop.getEndIndex().getValue(), \
                                          NewInst.getOperand(3).getType()))
                        NewInitInstructions.append(NewInst)
                        continue
                break
            elif isinstance(InsertValue, RoseConstant):
              assert len( NewInitInstructions) == 0
              InitInstructions.append(Op)
              NewInst = Op.clone()
              NewInst.setOperand(2, RoseConstant.create(0, \
                                NewInst.getOperand(2).getType()))
              NewInst.setOperand(3, \
                  RoseConstant.create(Loop.getEndIndex().getValue() - 1, \
                                NewInst.getOperand(3).getType()))
              NewInst.setOperand(4, \
                  RoseConstant.create(Loop.getEndIndex().getValue(), \
                                NewInst.getOperand(3).getType()))
              NewInitInstructions.append(NewInst)
              continue
            break
          else:
            # One of the operands must be bvxtracting function's returning value
            for Operand in InsertValue.getOperands():
              if isinstance(Operand, RoseBVExtractSliceOp):
                if Operand.getInputBitVector() == Function.getReturnValue():
                  # The bvinsert op has to be using the iterator
                  if not isinstance(Loop, RoseUndefRegion()):
                    if Operand.getLowIndex() == Loop.getIterator():
                      if Loop.getStep().getValue() == Operand.getOutputBitwidth():
                        AccumulationPatterFound = True
                        break

  # Sanity check  
  if len( NewInitInstructions) == 0:
    assert AccumulationPatterFound == False
    return
    
  # Get the first block
  Region = Function.getChild(0)
  if not isinstance(Region, RoseBlock):
    # Create a new block
    FirstBlock = Block.create()
    Function.addRegionBefore(0, FirstBlock)
  else:
    FirstBlock = Region

  # Insert a bvinsert op in the first block of the given function
  for Op in NewInitInstructions:
    if FirstBlock.getNumOperations() == 0:
      FirstBlock.addRegion(Op)
    else:
      FirstBlock.addOperationBefore(0, Op)
  
  # Erase gathered ops
  ToBeErased = []
  for Op in InitInstructions:
    ToBeErased.append(Op)
  for Op in InitInstructions:
    IndexingOps = GatherIndexingOps(Op)
    for IndexingOp in IndexingOps:
      if IndexingOp not in ToBeErased:
        ToBeErased.append(IndexingOp)
  for Op in ToBeErased:
    Block = Op.getParent()
    Op.print()
    if not Function.hasUsesOf(Op):
      print("here")
      Block.eraseOperation(Op)
  
  

def CanonicalizeFunction(Function : RoseFunction, Context : RoseContext):
  print("CANONICALIZING FUNCTION")
  print("FUNCTION:")
  Function.print()
  # See if the function is already canonicalize
  #if IsFunctionInCanonicalForm(Function) == True:
  #  print("FUNCTION IS IN CANONICAL FORM")
  #  return

  # Make sure all blocks have only one bvinsert
  #FixBlocksWithMultipleBVInserts(Function)
  #if IsFunctionInCanonicalForm(Function) == True:
  #  print("_____FUNCTION IS IN CANONICAL FORM")
  #  return

  # Adjust the loop bounds
  print("ADJUST LOOP BOUNDS IN FUNCTION")
  RunFixLoopsBooundsInFunction(Function, Context)
  FixAccumulationCode(Function)
  if IsFunctionInCanonicalForm(Function) == True:
    print("_____FUNCTION IS IN CANONICAL FORM")
    return

  # We may need to add more loops
  FixLoopNestingInFunction(Function)
  if IsFunctionInCanonicalForm(Function):
    return


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  CanonicalizeFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()




