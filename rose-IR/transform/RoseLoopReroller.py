
from types import prepare_class
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *


def GetOffsetsBetweenPacks(Pack1 : list, Pack2 : list, OffsetsList : list = []):
  assert len(Pack1) == len(Pack2)
  if OffsetsList == []:
    #OffsetsList = list() * len(Pack1)
    for Index in range(len(Pack1)):
      OffsetsList.append(list())
  for Index in range(len(Pack1)):
    # If the operations have different opcodes or types, skip
    if Pack1[Index].getOpcode() != Pack2[Index].getOpcode():
      return None
    if Pack1[Index].getType() != Pack2[Index].getType():
      return None
    # Deal with call operations
    if isinstance(Pack1[Index], RoseCallOp):
      # Make sure that the callees for the operations are equal.
      if Pack1[Index].getCallee().getName() != Pack2[Index].getCallee().getName():
        return None
      OffsetsList[Index] =  None
      continue
    # If this operation has not indexing operands, add None
    if Pack1[Index].getNumNonBVOperands() == 0:
      OffsetsList[Index] =  None
      continue
    # Output bitwidths for bitvector ops must be equal
    if Pack1[Index].getOutputBitwidth() != Pack2[Index].getOutputBitwidth():
      return None
    # Get offsets between instructions
    LowIndex1 = Pack1[Index].getLowIndex()
    LowIndex2 = Pack2[Index].getLowIndex()
    HighIndex1 = Pack1[Index].getHighIndex()
    HighIndex2 = Pack2[Index].getHighIndex()
    if not isinstance(LowIndex1, RoseConstant) \
    or not isinstance(LowIndex2, RoseConstant) \
    or not isinstance(HighIndex1, RoseConstant) \
    or not isinstance(HighIndex2, RoseConstant):
      return None
    NewOffsetsList = []
    NewOffsetsList.append(LowIndex2.getValue() - LowIndex1.getValue())
    NewOffsetsList.append(HighIndex2.getValue() - HighIndex1.getValue())
    # Check if the given offsets match the newly computed offsets
    if OffsetsList[Index] == []:
      OffsetsList[Index] = NewOffsetsList
      continue
    if OffsetsList[Index] != NewOffsetsList:
      return None
  print(OffsetsList)
  return OffsetsList


def GetValidRerollableCandidates(RerollableCandidatePacks : list):
  print("++++++++++++++++++++++++++++++++++++++++++++++++")
  # Collect list of rerollable windows in a set.
  RerollableCandidatesList = list()
  PacksList = list()
  OffsetsList = list()
  for Pack in RerollableCandidatePacks:
    if PacksList == []:
      PacksList = [Pack]
      continue
    # Now check if the window should be added to the current window list.
    # If the window lenghts different, they cannot be part of a set.
    if len(PacksList[0]) != len(Pack):
      # This is the end of the window list.
      # If we didn't capture multiple windows, we must discard the list
      if len(PacksList) != 1:
        # Add the window list to the candidate list
        RerollableCandidatesList.append(PacksList)
      # Empty the list and continue
      PacksList = [Pack]
      continue
    # Now lets see if the window should be added to the window list
    CheckPack = PacksList[len(PacksList) - 1]
    NewOffsetsList = GetOffsetsBetweenPacks(CheckPack, Pack, OffsetsList)
    if NewOffsetsList == None:
      # This is the end of the window list.
      # If we didn't capture multiple windows, we must discard the list
      if len(PacksList) != 1:
        # Add the window list to the candidate list
        RerollableCandidatesList.append(PacksList)
      # Empty the list and continue
      PacksList = [Pack]
      continue
    # If the offsets list is empty. Fill it up.
    if OffsetsList == []:
      OffsetsList = NewOffsetsList
    assert OffsetsList == NewOffsetsList
    # Add the window to the list
    print("ADD WINDOW TO THE LIST")
    PacksList.append(Pack)
  # Put in the last window list
  if PacksList != []:
    # Now we have a window list we can add to the list
    # But it must end with bvinsert.
    RerollableCandidatesList.append(PacksList)

  for Pack in RerollableCandidatePacks:
    print("+++WINDOW:")
    for Op in Pack:
      Op.print()

  for PackList in RerollableCandidatesList:
    print("--WINDOW LIST:")
    for Pack in PackList:
      print("--WINDOW:")
      for Op in Pack:
        Op.print()
  return RerollableCandidatesList


def FuseCandidatePacks(RerollableCandidatePacks : list):  
  print("BEFORE FUSING:")
  for Pack in RerollableCandidatePacks:
    print("+++UNFUSED PACK:")
    for Op in Pack:
      Op.print()
  
  NewCandidatePacks = []
  NewPack = []
  for Pack in RerollableCandidatePacks:
    LastOp = Pack[len(Pack) - 1]
    assert isinstance(LastOp, RoseBVInsertSliceOp)
    if NewPack == []:
      NewPack = Pack
      continue
    # This op can be a candidate for being added to the window
    MergePacks = True
    for Op in Pack:
      for NewPackOp in NewPack:
        # Check if the bitvector opcode and bitvector operands match
        if Op.getOpcode() == NewPackOp.getOpcode():
          if isinstance(Op, RoseBitVectorOp):
            if Op.getBitVectorOperands() == NewPackOp.getBitVectorOperands():
              MergePacks = False
              break
          else:
            assert isinstance(Op, RoseCallOp)
            if Op.getCallee().getName() == NewPackOp.getCallee().getName():
              MergePacks = False
              break
    if MergePacks == True:
      NewPack.extend(Pack)
    else:
      # Add the new pack to the list of new candidate packs
      NewCandidatePacks.append(NewPack)
      NewPack = Pack
  
  if NewPack != []:
    NewCandidatePacks.append(NewPack)
  # We expect to see multiple new candidate packs
  if len(NewCandidatePacks) == 1:
    NewCandidatePacks = []
  print("AFTER FUSING:")
  for Pack in NewCandidatePacks:
    print("+++FUSED PACK:")
    for Op in Pack:
      Op.print()
  return NewCandidatePacks


def RunRerollerOnBlock(Block : RoseBlock, BlockToRerollableCandidatesMap : dict):
  print("RUN REROLLER ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Collect groups instructions that are rerollable.
  # This only works on bitvector operations.
  # Pack is the moving window through code that
  # collects rellolable set of operations.
  # A legal window will end with a bvinsert operation.
  RerollableCandidatePacks = []
  Pack = []
  TotalNumInsts = Block.getNumOperations()
  for Index in range(TotalNumInsts):
    Operation = Block.getOperation(Index)
    # Once we hit an instruction that cannot reroll, 
    # we quit if we have found some candidates already.
    # If not, we keep looking.
    if not isinstance(Operation, RoseBitVectorOp) \
    and not isinstance(Operation, RoseCallOp):
      Pack = []
      if len(RerollableCandidatePacks) == 0:
        continue
      else:
        break
    # Add the op to the window
    Pack.append(Operation)
    # The window ends with a bvinsert op. If we hit one,
    # start a new window.
    if isinstance(Operation, RoseBVInsertSliceOp):
      # Insert the window to the candidates list and empty the window
      RerollableCandidatePacks.append(Pack)
      Pack = []
  
  # We expect to see multiple packs
  if len(RerollableCandidatePacks) == 1:
    RerollableCandidatePacks = []
  
  # Fuse the packs that are fusible
  RerollableCandidatePacks = FuseCandidatePacks(RerollableCandidatePacks)

  # Get a set of rerollable sets
  RerollableCandidatesList = GetValidRerollableCandidates(RerollableCandidatePacks)
  print(RerollableCandidatesList)

  # Add the set to the block map
  BlockToRerollableCandidatesMap[Block] = RerollableCandidatesList
  return BlockToRerollableCandidatesMap


def RunRerollerOnRegion(Region, BlockToRerollableCandidatesMap : dict):
  # Iterate over all the contents of this region
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region.getChildren():
    # Run reroller on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunRerollerOnFunction(Abstraction)
      continue
    # Reroller only operates on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      Abstraction.print()
      BlockToRerollableCandidatesMap = RunRerollerOnRegion(Abstraction, \
                                            BlockToRerollableCandidatesMap)
      continue
    BlockToRerollableCandidatesMap = RunRerollerOnBlock(Abstraction, \
                                            BlockToRerollableCandidatesMap)
  return BlockToRerollableCandidatesMap


def GetLowOffsetsWithinPack(Pack : list):
  LowOffsetsList = list()
  StartIndex = None
  for Op in Pack:
    if isinstance(Op, RoseCallOp) or Op.getNumNonBVOperands() == 0:
      LowOffsetsList.append(None)
      continue
    # Now we are dealing with bitvector ops that index into bitvectors
    # First get the start index and get offsets relative to
    LowIndex = Op.getLowIndex()
    assert isinstance(LowIndex, RoseConstant)
    if StartIndex == None:
      StartIndex = LowIndex.getValue()
    LowOffsetsList.append(LowIndex.getValue() - StartIndex)
  return LowOffsetsList


def GetFirstLowIndexInPack(Pack : list):
  for Op in Pack:
    if isinstance(Op, RoseCallOp) or Op.getNumNonBVOperands() == 0:
      continue
    # Now we are dealing with bitvector ops that index into bitvectors
    # First get the start index and get offsets relative to
    assert isinstance(Op.getLowIndex(), RoseConstant)
    return Op.getLowIndex().getValue()
  return None


# We just get the difference between 2 different packs
def GetStepForRerolledLoop(Pack1 : list, Pack2 : list):
  assert len(Pack1) == len(Pack2)
  for Index in range(len(Pack1)):
    assert Pack1[Index].getOpcode() == Pack2[Index].getOpcode()
    assert Pack1[Index].getType() == Pack2[Index].getType()
    if isinstance(Pack1[Index], RoseCallOp):
      continue
    assert Pack1[Index].getOutputBitwidth() == Pack2[Index].getOutputBitwidth()
    if Pack1[Index].getNumNonBVOperands() == 0:
      continue
    # Get low offsets between instructions
    LowIndex1 = Pack1[Index].getLowIndex()
    LowIndex2 = Pack2[Index].getLowIndex()
    assert isinstance(LowIndex1, RoseConstant)
    assert isinstance(LowIndex2, RoseConstant)
    return (LowIndex2.getValue() - LowIndex1.getValue())
  return None


def RunRerollerOnFunction(Function : RoseFunction):
  print("RUN ON REROLLER FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Mapping root instruction to list of redundant instructions
  BlockToRerollableCandidatesMap = dict()

  # Run loop reroller on the given function
  BlockToRerollableCandidatesMap = RunRerollerOnRegion(Function, \
                                    BlockToRerollableCandidatesMap)
  
  # Now that the map is populated, we reroll all the candidates
  print("MAPPINGS:")
  print(BlockToRerollableCandidatesMap)
  RemovedOps = []
  for Block, RerollableCandidatesList in BlockToRerollableCandidatesMap.items():
    for PackList in RerollableCandidatesList:
      # Lets get the offsets across windows and other info for generating a loop
      LowOffsetsList = GetLowOffsetsWithinPack(PackList[0])
      Step = GetStepForRerolledLoop(PackList[0], PackList[1])
      Start = GetFirstLowIndexInPack(PackList[0])
      End = GetFirstLowIndexInPack(PackList[len(PackList) - 1])
      print("START:")
      print(Start)
      print("END:")
      print(End)
      print("STEP:")
      print(Step)
      print("LowOffsetsList:")
      print(LowOffsetsList)
      # Generate a loop
      Loop = RoseForLoop.create("iterator", End, Start, Step)
      Iterator = Loop.getIterator()
      # Map to track old and new ops.
      OldToNewOPsMap = dict()
      # Insert operations in the generated loop.
      for OpIndex, Op in enumerate(PackList[0]):
        # Handle ops that do not have indices in operands
        if isinstance(Op, RoseCallOp) or Op.getNumNonBVOperands() == 0:
          NewOp = Op.clone()
          for Index, Operand in enumerate(Op.getOperands()):
            NewOperand = OldToNewOPsMap.get(Operand, RoseUndefValue())
            if NewOperand == RoseUndefValue():
              # Operand is coming from some other source, just use 
              # the same operand as the old op.
              NewOperand = Op.getOperand(Index)
            NewOp.setOperand(Index, NewOperand)
          OldToNewOPsMap[Op] = NewOp
          Loop.addAbstraction(NewOp)
          continue
        # Handle instructions with indices as operands
        LowOffset = LowOffsetsList[OpIndex]
        assert LowOffset != None
        if LowOffset != 0:
          # Generate an add instruction
          LowOffsetVal = RoseConstant(LowOffset, Iterator.getType())
          LowIndex = RoseAddOp.create("low.offset." + str(OpIndex), [Iterator, LowOffsetVal]) 
          Loop.addAbstraction(LowIndex)
        else:
          LowIndex = Iterator
        OpBitWidthVal = RoseConstant(Op.getOutputBitwidth(), Iterator.getType())
        HighIndex = RoseAddOp.create("high.offset." + str(OpIndex), [LowIndex, OpBitWidthVal]) 
        Loop.addAbstraction(HighIndex)
        NewOp = Op.clone()
        for Index, Operand in enumerate(Op.getOperands()):
          if Index == Op.getLowIndexPos():
            NewOp.setOperand(Index, LowIndex)
            continue
          if Index == Op.getHighIndexPos():
            NewOp.setOperand(Index, HighIndex)
            continue
          if isinstance(Operand, RoseConstant):
            # Just copy this constant over
            NewOp.setOperand(Index, Operand)
            continue
          NewOperand = OldToNewOPsMap.get(Operand, RoseUndefValue())
          if NewOperand == RoseUndefValue():
            # Operand is coming from some other source, just use 
            # the same operand as the old op.
            NewOperand = Op.getOperand(Index)
          NewOp.setOperand(Index, NewOperand)
        OldToNewOPsMap[Op] = NewOp
        Loop.addAbstraction(NewOp)
      # This is the full loop
      Loop.print()
      # Now add the generated loop before the given block
      ParentRegion = Block.getParent()
      ParentRegion.print()
      Block.print()
      Index = ParentRegion.getPosOfChild(Block)
      ParentRegion.addRegionBefore(Index, Loop)
      print("PRINTING PARENT REGION BEFORE:")
      ParentRegion.print()
      print("PRINTING PARENT REGION AFTER:")
      ParentRegion.print()

      # Lets queue all the ops in the pack list to be removed
      for Pack in PackList:
        for Op in Pack:
          RemovedOps.append(Op)

  # Finaly, remove the ops.
  # Reverse the list of ops since we want to remove
  # uses of ops before the ops themselves.
  RemovedOps.reverse()
  for Operation in RemovedOps:
    Block = Operation.getParent()
    print("OPERATION TO BE ERASED:")
    Operation.print()
    Block.eraseOperation(Operation)
    Block.print()
    # If the block is empty now, we can remove it
    if Block.isEmpty():
      ParentRegion = Block.getParent()
      ParentRegion.eraseChild(Block)


# Runs Loop reroller
def Run(Function : RoseFunction):
  print("RUN LOOP REROLLER")
  RunRerollerOnFunction(Function)
  Function.print()


