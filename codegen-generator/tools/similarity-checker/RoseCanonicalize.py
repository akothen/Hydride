#############################################################
#
# Changes the loop bounds to canonical form.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseContext import *
from RoseSimilarityCheckerUtilities import *
import RoseOpCombine


def RunFixLoopsBooundsInLoop(Loop : RoseForLoop, Context : RoseContext):
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()

  # Get the op that we can use to canonicalize the loop bounds
  PrimaryOps = GetOpDeterminingLoopBounds(Loop)
  print("PrimaryOps list:")
  print(PrimaryOps)
  if PrimaryOps == None:
    BlockList = Loop.getRegionsOfType(RoseBlock)
    for Block in BlockList:
      OpList = list()
      OpList.extend(Block.getOperations())
      for Op in OpList:
        if isinstance(Op, RoseBVInsertSliceOp):
          IndexingOps = GatherIndexingOps(Op)
          # Look for dependence of an indexing op to the iterator 
          # the given loop.
          for IndexingOp in IndexingOps:
            for Operand in IndexingOp.getOperands():
              if Operand == Loop.getIterator():
                # Now must look at the loop end if it is same
                # as the length of the input bitvector.
                assert isinstance(Loop.getEndIndex(), RoseConstant)
                if Loop.getEndIndex().getValue() \
                      != Op.getInputBitVector().getType().getBitwidth():
                  assert Loop.getEndIndex().getValue() \
                       < Op.getInputBitVector().getType().getBitwidth()
                  # Compute factor
                  LoopEnd = Loop.getEndIndex()
                  BitWidth = Op.getInputBitVector().getType().getBitwidth()
                  if BitWidth > LoopEnd.getValue():
                    Factor = BitWidth / LoopEnd.getValue()
                    assert Factor == int(Factor)
                    Factor = int(Factor)
                    Start = Loop.getStartIndex()
                    Step = Loop.getStep()
                    assert isinstance(Start, RoseConstant)
                    # Fix the loop bounds now
                    Loop.setStartIndex(Factor * Start.getValue())
                    Loop.setEndIndex(Factor * LoopEnd.getValue())
                    Loop.setStep(Factor * Step.getValue())
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
                    # Combine some ops in the loop
                    RoseOpCombine.RunOpCombineOnRegion(Loop, Context)
    return
  print("PrimaryOps:")
  PrimaryOps[0].print()
  BitWidth = PrimaryOps[0].getOutputBitwidth()

  # Go over the bvinserts/bvextracts and see if the bitwidth and loop step are the same.
  # Now see if the loop bounds need adjusting
  LoopStep = Loop.getStep()
  assert isinstance(LoopStep, RoseConstant)
  if BitWidth != LoopStep.getValue():
    # Compute factor
    #assert LoopStep.getValue() < BitWidth
    if BitWidth > LoopStep.getValue():
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
    else:
      Factor = LoopStep.getValue() / BitWidth
      assert Factor == int(Factor)
      Factor = int(Factor)
      # Assuming loop start and end are constant values as well.
      Start = Loop.getStartIndex()
      End = Loop.getEndIndex()
      assert isinstance(Start, RoseConstant)
      assert isinstance(End, RoseConstant)
      # Fix the loop bounds now
      Loop.setStartIndex(int(Start.getValue() / Factor))
      Loop.setEndIndex(int(End.getValue() / Factor))
      Loop.setStep(int(LoopStep.getValue() / Factor))
      # Now change the iterator name
      OldIterator = Loop.getIterator()
      Loop.setIteratorName(OldIterator.getName() + ".new")
      # Replace the old iterator value with new one
      NewIterator = Loop.getIterator()
      FactorVal = RoseConstant(Factor, NewIterator.getType())
      IteratorReplacement = RoseMulOp.create(OldIterator.getName() + ".new.mul", \
                              [NewIterator, FactorVal])
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
  # Combine some ops in the loop
  RoseOpCombine.RunOpCombineOnRegion(Loop, Context)
  print("NEW LOOP:")
  Loop.print()
  #assert False


def RunFixLoopsBoundsInRegion(Region, Context : RoseContext):
  # Iterate over all the contents of this function
  for Abstraction in Region:
    assert not isinstance(Abstraction, RoseFunction)
    if isinstance(Abstraction, RoseForLoop):
      RunFixLoopsBooundsInLoop(Abstraction, Context)
    if not isinstance(Abstraction, RoseBlock):
      RunFixLoopsBoundsInRegion(Abstraction, Context)
    print("REGION:")
    print(Abstraction)
    Abstraction.print()


def AddOuterLoopAroundRegions(ParentRegion, RegionList : list, ParentKey):
  # Sanity checks
  for Region in RegionList:
    assert Region.getParent() == ParentRegion
  Function = ParentRegion.getFunction()
  PrimaryOps = GetOpDeterminingLoopBoundsInBlockList(Function, RegionList)
  assert PrimaryOps != None
  print("PrimaryOps[0]:")
  PrimaryOps[0].print()
  Bitwidth = PrimaryOps[0].getOutputBitwidth()
  # Create a new loop
  Loop = RoseForLoop.create("%" + "outer.it", 0, Bitwidth, Bitwidth)
  RegionIndex = ParentRegion.getPosOfChild(RegionList[0], ParentKey)
  print("RegionIndex:")
  print(RegionIndex)
  # Add the regions in the parent region into the loop
  for Region in RegionList:
    ParentRegion.eraseChild(Region, ParentKey)
    Loop.addRegion(Region)
  # Add the loop in the parent region
  if RegionIndex == 0:
    ParentRegion.addRegion(Loop, ParentKey)
  else:
    ParentRegion.addRegionBefore(RegionIndex, Loop, ParentKey)
  print("ParentRegion:")
  ParentRegion.print()
  Loop.print()
  ParentRegion.getFunction().print()


def AddOuterLoopInFunction(Function : RoseFunction, Context : RoseContext):
  print("ADD OUTER LOOP IN FUNCTION")
  # Use the return value of the function as the end and step
  #Bitwidth = Function.getReturnValue().getType().getBitwidth()
  # Get the op that we can use to canonicalize the loop bounds
  LoopList = Function.getRegionsOfType(RoseForLoop, Level=0)
  assert len(LoopList) != 0
  MaxBitwidth = None
  InnerLoops = list()
  for Loop in LoopList:
    PrimaryOps = GetOpDeterminingOuterLoopBounds(Loop)
    if PrimaryOps == None:
      print("PrimaryOps is NONE")
      if MaxBitwidth != None:
        OuterLoop = RoseForLoop.create("%" + "outer.it", 0, MaxBitwidth, MaxBitwidth)
        Index = Function.getPosOfChild(InnerLoops[0])
        for InnerLoop in InnerLoops:
          Function.eraseChild(InnerLoop)
          OuterLoop.addRegion(InnerLoop)
        Function.addRegionBefore(Index, OuterLoop)
        MaxBitwidth = None
      continue
    # Find the maximum bitwidth and use that
    if MaxBitwidth == None:
      MaxBitwidth = PrimaryOps[0].getInputBitVector().getType().getBitwidth()
      print("PrimaryOps[0]:")
      PrimaryOps[0].print()
      for Op in PrimaryOps[1:]:
        print("PrimaryOp:")
        Op.print()
        if MaxBitwidth < Op.getInputBitVector().getType().getBitwidth():
          MaxBitwidth = Op.getInputBitVector().getType().getBitwidth()
    else:
      for Op in PrimaryOps:
        print("PrimaryOp:")
        Op.print()
        if MaxBitwidth < Op.getInputBitVector().getType().getBitwidth():
          MaxBitwidth = Op.getInputBitVector().getType().getBitwidth()
    InnerLoops.append(Loop)
  # If the outer loop has not been created and inserted in the function, let's
  # do that here.
  if MaxBitwidth != None:
    OuterLoop = RoseForLoop.create("%" + "outer.it", 0, MaxBitwidth, MaxBitwidth)
    Index = Function.getPosOfChild(InnerLoops[0])
    for InnerLoop in InnerLoops:
      Function.eraseChild(InnerLoop)
      OuterLoop.addRegion(InnerLoop)
    Function.addRegionBefore(Index, OuterLoop)


def AddTwoNestedLoopsInFunction(Function : RoseFunction):
  # There are no loops in the code. Now we check if the code is all in one block
  # or there is some control flow (which we do not handle right now.)
  # TODO: Handle cases where control flow exists.
  NumBlocksAtLevel0 = Function.numLevelsOfRegion(RoseBlock, Level=0)
  Blocks = Function.getRegionsOfType(RoseBlock, Level=0)
  for Block in Blocks:
    print("BLOCK IN FUNCTION:")
    Block.print()
  print("NumBlocksAtLevel0:")
  print(NumBlocksAtLevel0)
  print("Function:")
  Function.print()
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
  #PrimaryOps = GetOpDeterminingLoopBounds(Loop)
  PrimaryOps = GetOpDeterminingLoopBoundsInBlockList(Function, [Block])
  if isinstance(PrimaryOps[0], RoseBVInsertSliceOp):
    Bitwidth = PrimaryOps[0].getInsertValue().getType().getBitwidth()
  else:
    Bitwidth = PrimaryOps[0].getType().getBitwidth()
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


def FixLoopNestingInFunction(Function : RoseFunction, Context : RoseContext):
  # Get number of loops at different levels
  NumLoopsAtLevel0 = Function.numLevelsOfRegion(RoseForLoop, 0)
  print("NumLoopsAtLevel0:")
  print(NumLoopsAtLevel0)
  if NumLoopsAtLevel0 == 0:
    AddTwoNestedLoopsInFunction(Function)
    return
  # There are cases where there are subregions that are inlinable,
  # which means that there can be multiple loop nests at level zero.
  InlinableRegions = HasInlinableSubRegion(Function)
  if InlinableRegions != None:
    if len(InlinableRegions) != 0:
      AddOuterLoopInFunction(Function, Context)
      return
  if Function.numLevelsOfRegion(RoseForLoop, 1) == 0:
    # If one cond region has no loop but another does, add loop
    # around the other region.
    if Function.numLevelsOfRegion(RoseCond, 1) == 1:
      [CondRegion] = Function.getRegionsOfType(RoseCond, 1)
      if CondRegion.numLevelsOfRegion(RoseForLoop, 0) == 1:
        # Check what sub-region is a loop
        [RegionKey] = CondRegion.getKeysOfSubRegionsWithRegionOfType(RoseForLoop)
        if RegionKey == CondRegion.getKeyForThenRegion():
          KeyForRelevantRegion = CondRegion.getKeyForElseRegion()
        else:
          assert RegionKey == CondRegion.getKeyForElseRegion()
          KeyForRelevantRegion = CondRegion.getKeyForThenRegion()
        SubRegionList = CondRegion.getChildren(KeyForRelevantRegion)
        print("KeyForRelevantRegion:")
        print(KeyForRelevantRegion)
        # All the subregions must be blocks
        for SubRegion in SubRegionList:
          assert isinstance(SubRegion, RoseBlock)
        AddOuterLoopAroundRegions(CondRegion, SubRegionList, KeyForRelevantRegion)
        return
    print("ADDING OUTER LOOP IN FUNCTION")
    AddOuterLoopInFunction(Function, Context)
  return


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


def FixAccumulationCodeForBlockList(BlockList : list, Context : RoseContext):
  print("FIX ACCUMULATION CODE")
  if len(BlockList) == 0:
    return False
  Function = BlockList[0].getFunction()
  Function.print()
  #BlockList = Function.getRegionsOfType(RoseBlock)
  AccumulationPatterFound = False
  NewInitInstructions = list()
  InitInstructions = list()
  print("len(BlockList)")
  print(len(BlockList))

  def SanityChecks(Op : RoseBitVectorOp, Loop : RoseForLoop):
    Op.getLowIndex().print()
    Loop.getIterator().print()
    if Op.getLowIndex() != Loop.getIterator():
      print("BREAK1")
      return False
    assert isinstance(Loop.getStep(), RoseConstant)
    if Loop.getStep().getValue() != Op.getOutputBitwidth():
      print("BREAK2")
      return False
    assert isinstance(Loop.getEndIndex(), RoseConstant)
    if Loop.getEndIndex().getValue() != \
              Op.getInputBitVector().getType().getBitwidth():
      print("BREAK3")
      return False
    return True

  for Block in reversed(BlockList):
    assert isinstance(Block, RoseBlock)
    assert Function == Block.getFunction()
    # If this block is in the cond region, skip this block
    #if not isinstance(Block.getParentOfType(RoseCond), RoseUndefRegion):
    #  continue
    #if len(NewInitInstructions) != 0:
    #  break
    # Look for accumulation pattern
    Block.print()
    print("ITERATING ANOTHER BLOCK")
    for Op in reversed(Block.getOperations()):
      if isinstance(Op, RoseBVInsertSliceOp):
        if Op.getInputBitVector() == Function.getReturnValue():
          print("**********INSERT OP:")
          Op.print()
          # The bvinsert op has to be using the iterator
          Loop = Block.getParentOfType(RoseForLoop)
          if isinstance(Loop, RoseUndefRegion):
            break
          if SanityChecks(Op, Loop) == False:
            Loop =  Loop.getParentOfType(RoseForLoop)
            if isinstance(Loop, RoseUndefRegion):
              break
            if SanityChecks(Op, Loop) == False:
              break
          # Now go up the use-def chain. The inserted values
          # must be coming from a bvadd op.
          InsertValue = Op.getInsertValue()
          print("**********InsertValue:")
          InsertValue.print()
          # Skip any saturation ops
          if isinstance(InsertValue, RoseBVSSaturateOp) \
            or isinstance(InsertValue, RoseBVUSaturateOp):
            InsertValue = InsertValue.getInputBitVector()
          if not isinstance(InsertValue, RoseBVAddOp):
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
                        print("Op.print():")
                        Op.print()
                        #print("NewInitInstructions:")
                        #for Inst__ in NewInitInstructions:
                        #  print(Inst__)
                        #  print("^^^^^^^^")
                        #  Inst__.print()
                        print("=======================")
                        #assert len(NewInitInstructions) == 0
                        InitInstructions.append(Op)
                        InitInstructions.append(InsertValue)
                        # Replace the uses of function return value in extract ops with 
                        # init insert op's insert value.
                        print("Function.getUsersOf(Function.getReturnValue()):")
                        print(Function.getUsersOf(Function.getReturnValue()))
                        for User in Function.getUsersOf(Function.getReturnValue()):
                          if isinstance(User, RoseBVExtractSliceOp):
                            assert User.getInputBitVector() == Function.getReturnValue()
                            User.setOperand(0, InsertValue.getInputBitVector())
                        #NewInst = Op.clone()
                        #NewInst.setOperand(0, InsertValue.getInputBitVector())
                        #NewInst.setOperand(2, RoseConstant.create(0, \
                        #                  NewInst.getOperand(2).getType()))
                        #NewInst.setOperand(3, \
                        #    RoseConstant.create(Loop.getEndIndex().getValue() - 1, \
                        #                  NewInst.getOperand(3).getType()))
                        #NewInst.setOperand(4, \
                        #    RoseConstant.create(Loop.getEndIndex().getValue(), \
                        #                  NewInst.getOperand(3).getType()))
                        #print("NewInst:")
                        #NewInst.print()
                        #NewInitInstructions.append(NewInst)
                        continue
                break
            elif isinstance(InsertValue, RoseConstant):
              #assert len( NewInitInstructions) == 0
              InitInstructions.append(Op)
              # Replace the uses of function return value in extract ops with 
              # init insert op's insert value.
              print("Function.getUsersOf(Function.getReturnValue()):")
              print(Function.getUsersOf(Function.getReturnValue()))
              for User in Function.getUsersOf(Function.getReturnValue()):
                if isinstance(User, RoseBVExtractSliceOp):
                  assert User.getInputBitVector() == Function.getReturnValue()
                  User.setOperand(0, Op.getInsertValue())
              #NewInst = Op.clone()
              #NewInst.setOperand(2, RoseConstant.create(0, \
              #                  NewInst.getOperand(2).getType()))
              #NewInst.setOperand(3, \
              #    RoseConstant.create(Loop.getEndIndex().getValue() - 1, \
              #                  NewInst.getOperand(3).getType()))
              #NewInst.setOperand(4, \
              #    RoseConstant.create(Loop.getEndIndex().getValue(), \
              #                  NewInst.getOperand(3).getType()))
              #print("NewInst:")
              #NewInst.print()
              #NewInitInstructions.append(NewInst)
              continue
            break
          else:
            # One of the operands must be bvxtracting function's returning value
            for Operand in InsertValue.getOperands():
              if isinstance(Operand, RoseBVExtractSliceOp):
                if Operand.getInputBitVector() == Function.getReturnValue():
                  # The bvinsert op has to be using the iterator
                  if not isinstance(Loop, RoseUndefRegion):
                    if Operand.getLowIndex() == Loop.getIterator():
                      if Loop.getStep().getValue() == Operand.getOutputBitwidth():
                        AccumulationPatterFound = True
                        break

  # Sanity check  
  print("---NewInitInstructions:")
  print(NewInitInstructions)
  print("AccumulationPatterFound:")
  print(AccumulationPatterFound)
  if len(InitInstructions) == 0:
    #assert AccumulationPatterFound == False
    return False
  if AccumulationPatterFound == False:
    return False
    
  # Get the first block
  Region = Function.getChild(0)
  if not isinstance(Region, RoseBlock):
    # Create a new block
    FirstBlock = Block.create()
    Function.addRegionBefore(0, FirstBlock)
    print("ALLOCATED NEW BLOCK")
    print("----FirstBlock:")
    FirstBlock.print()
    print(FirstBlock)
  else:
    FirstBlock = Region

  # Insert a bvinsert op in the first block of the given function
  for Op in NewInitInstructions:
    print("NewInitInstructions:")
    Op.print()
    assert isinstance(Op, RoseBVInsertSliceOp)
    #Op.getInputBitVector().setName(NewInputBVName)
    print("FirstBlock:")
    FirstBlock.print()
    print(FirstBlock)
    if FirstBlock.getNumOperations() == 0:
      FirstBlock.addRegion(Op)
    else:
      FirstBlock.addOperationBefore(Op, FirstBlock.getOperation(0))
    
  print("INTERMEDIATE FUNCTION:")
  Function.print()
  # Erase gathered ops
  ToBeErased = []
  for Op in InitInstructions:
    print("INIT INSTRUCTION:")
    Op.print()
    ToBeErased.append(Op)
  for Op in InitInstructions:
    IndexingOps = GatherIndexingOps(Op)
    for IndexingOp in IndexingOps:
      if IndexingOp not in ToBeErased:
        ToBeErased.append(IndexingOp)
  for Op in reversed(ToBeErased):
    Block = Op.getParent()
    Op.print()
    if not Function.hasUsesOf(Op):
      print("here")
      Block.eraseOperation(Op)
  
  return True


def FixAccumulationCodeInFunction(Function : RoseFunction, Context : RoseContext):
  assert isinstance(Function, RoseFunction)
  SubRegions = list()
  SubRegions.extend(Function.getChildren())
  for SubRegion in SubRegions:
    if isinstance(SubRegion, RoseFunction):
      FixAccumulationCodeInFunction(SubRegion, Context)
      continue
    if isinstance(SubRegion, RoseForLoop):
      # If the loop contains cond regions, we need to fix accumulation code for
      # subregions in condregions one at a time.
      if SubRegion.containsRegionOfType(RoseCond, Level=0):
        CondRegions1 = list()
        CondRegions2 = list()
        CondRegions3 = list()
        for SubSubRegion in SubRegion:
          if isinstance(SubSubRegion, RoseCond):
            print("SubSubRegion.getKeyForThenRegion():")
            print(SubSubRegion.getKeyForThenRegion())
            CondRegions1.extend(SubSubRegion.getRegionsOfType(RoseBlock, \
                                Key=SubSubRegion.getKeyForThenRegion()))
            if SubSubRegion.hasElseIfRegion():
              print("SubSubRegion.getKeyForElseIfRegion():")
              print(SubSubRegion.getKeyForElseIfRegion())
              CondRegions2.extend(SubSubRegion.getRegionsOfType(RoseBlock, \
                                  Key=SubSubRegion.getKeyForElseIfRegion()))
            if SubSubRegion.hasElseRegion():
              print("SubSubRegion.getKeyForElseRegion():")
              print(SubSubRegion.getKeyForElseRegion())
              CondRegions3.extend(SubSubRegion.getRegionsOfType(RoseBlock, \
                                  Key=SubSubRegion.getKeyForElseRegion()))
            continue
          if isinstance(SubSubRegion, RoseBlock):
            CondRegions1.append(SubSubRegion)
            CondRegions2.append(SubSubRegion)
            CondRegions3.append(SubSubRegion)
            continue
          CondRegions1.extend(SubSubRegion.getRegionsOfType(RoseBlock))
          CondRegions2.extend(SubSubRegion.getRegionsOfType(RoseBlock))
          CondRegions3.extend(SubSubRegion.getRegionsOfType(RoseBlock))
        # Fix accumulation code now
        print("+++++++++++++++++++++++++++++++++++++++++")
        for Block in CondRegions1:
          print("BLOCK:")
          Block.print()
        print("+++++++++++++++++++++++++++++++++++++++++")
        FixAccumulationCodeForBlockList(CondRegions1, Context)
        print("+++++++++++++++++++++++++++++++++++++++++")
        for Block in CondRegions2:
          print("BLOCK:")
          Block.print()
        print("+++++++++++++++++++++++++++++++++++++++++")
        FixAccumulationCodeForBlockList(CondRegions2, Context)
        for Block in CondRegions3:
          print("BLOCK:")
          Block.print()
        print("+++++++++++++++++++++++++++++++++++++++++")
        FixAccumulationCodeForBlockList(CondRegions3, Context)
        continue
      BlockList = SubRegion.getRegionsOfType(RoseBlock)
      print("=========================================")
      for Block in BlockList:
        print("BLOCK:")
        Block.print()
      print("=========================================")
      FixAccumulationCodeForBlockList(BlockList, Context)
      continue


def SinkOpsIntoCondBlocks(Function : RoseFunction, Context : RoseContext):
  CondRegions = Function.getRegionsOfType(RoseCond)
  for CondRegion in CondRegions:
    Block = CondRegion.getRegionBefore()
    if not isinstance(Block, RoseBlock):
      continue
    OpList = []
    OpList.extend(Block.getOperations())
    for Op in reversed(OpList):
      ReplaceUsesWithUniqueCopiesOf(CondRegion, Op, Op, Context)


def BalanceCondRegions(Function : RoseFunction):
  CondRegions = Function.getRegionsOfType(RoseCond)
  for CondRegion in CondRegions:
    # Cond region should have an else region
    if CondRegion.hasElseRegion() == False:
      # Check if we can find a bvinsert outside of the parent loop
      ParentRegion = CondRegion.getParent()
      assert isinstance(ParentRegion, RoseForLoop)
      Preheader = ParentRegion.getPreheader()
      assert not isinstance(Preheader, RoseUndefRegion)
      PreheaderOps = list()
      PreheaderOps.extend(Preheader.getOperations())
      for Op in reversed(PreheaderOps):
        if isinstance(Op, RoseBVInsertSliceOp):
          if Op.getInputBitVector() == Function.getReturnValue():
            # Erase the block from the preheader
            #Preheader.eraseOperation(Op)
            # Add a new block
            NewBlock = RoseBlock.create()
            NewBlock.addOperation(Op.clone())
            CondRegion.addNewElseRegion(NewBlock)
            # If the preheaer is empty, remove that too
            #if Preheader.getNumOperations() == 0:
            #  ParentOfPreheader = Preheader.getParent()
            #  Key = ParentOfPreheader.getKeyForChild(Preheader)
            #  ParentOfPreheader.eraseChild(Preheader, Key)
            break


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

  SinkOpsIntoCondBlocks(Function, Context)
  BalanceCondRegions(Function)

  # Adjust the loop bounds
  print("ADJUST LOOP BOUNDS IN FUNCTION")
  RunFixLoopsBoundsInRegion(Function, Context)
  FixAccumulationCodeInFunction(Function, Context)
  if IsFunctionInCanonicalForm(Function) == True:
    print("_____FUNCTION IS IN CANONICAL FORM")
    return

  # We may need to add more loops
  FixLoopNestingInFunction(Function, Context)
  if IsFunctionInCanonicalForm(Function):
    return


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  CanonicalizeFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()


