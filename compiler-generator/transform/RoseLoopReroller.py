
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseUtilities import *

import numpy as np
import math


# Useful for debugging
def PrintPack(Pack : list):
  print("PRINTING PACK:")
  for Op in Pack:
    Op.print()


def GetOffsetsBetweenPacks(Pack1 : list, Pack2 : list, OffsetsList : list = []):
  #print("GetOffsetsBetweenPacks:")
  #print("PACK1:")
  #for Op in Pack1:
  #  Op.print()
  #print("PACK2:")
  #for Op in Pack2:
  #  Op.print()
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
    if Pack1[Index].isIndexingBVOp() == False:
      OffsetsList[Index] =  None
      continue
    # If the bitvector values for the bitvector ops are
    # different, offset compuation is meaningless.
    #print(Pack1[Index].getBitVectorOperands())
    #print(Pack2[Index].getBitVectorOperands())
    if Pack1[Index].getInputBitVector() != Pack2[Index].getInputBitVector():
      #print("^^^^^^^^^^")
      #print("PACK1:")
      #Pack1[Index].print()
      #print("PACK2:")
      #Pack2[Index].print()
      #print("HERE")
      return None
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
  #print(OffsetsList)
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
    # The DFGs for the packs have to be the same
    CheckDFGsAreIsomorphic = DFGsAreIsomorphic(CheckPack, Pack)
    print("CheckDFGsAreIsomorphic:")
    print(CheckDFGsAreIsomorphic)
    if CheckDFGsAreIsomorphic == False:
      # This is the end of the window list.
      # If we didn't capture multiple windows, we must discard the list
      if len(PacksList) != 1:
        # Add the window list to the candidate list
        RerollableCandidatesList.append(PacksList)
      # Empty the list and continue
      PacksList = [Pack]
      continue
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

  # Now filter out all cases where there is only one pack list
  TempRerollableCandidatesList = RerollableCandidatesList
  for PackList in TempRerollableCandidatesList:
    if len(PackList) == 1:
      RerollableCandidatesList.remove(PackList)
      continue
  print("-------RerollableCandidatesList:")
  print(RerollableCandidatesList)

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


# This is necessary to ensure that 2 packs are rerollable.
def DFGsAreIsomorphic(Pack1 : list, Pack2 : list):
  #print("DATAFLOW PATTERNS ARE SAME")
  if len(Pack1) != len(Pack2):
    return False
  #print("PACK1:")
  #for Op in Pack1:
  #  Op.print()
  #print("PACK2:")
  #for Op in Pack2:
  #  Op.print()
  # Reverse iterate the packs
  OpsList1 =[Pack1[len(Pack1) - 1]]
  OpsList2 =[Pack2[len(Pack2) - 1]]
  Visited = set()
  while len(OpsList1) != 0:
    #print("OpsList1:")
    #print(OpsList1)
    #print("OpsList2:")
    #print(OpsList2)
    assert len(OpsList1) == len(OpsList2)
    Op1 = OpsList1.pop()
    Op2 = OpsList2.pop()
    if Op1 in Visited:
      if not Op2 in Visited:
         return False
      continue
    if Op2 in Visited:
      if not Op1 in Visited:
         return False
      continue
    Visited.add(Op1)
    Visited.add(Op2)
    if not isinstance(Op1, RoseOperation):
      if isinstance(Op2, RoseOperation):
        return False
      if Op1 != Op2:
        return False
      continue
    if not isinstance(Op2, RoseOperation):
      if isinstance(Op1, RoseOperation):
        return False
      if Op1 != Op2:
        return False
      continue
    #print("OP1:")
    #Op1.print()
    #print("OP2:")
    #Op2.print()
    # If the operations have different opcodes or types, skip
    if Op1.getOpcode() != Op2.getOpcode():
      return False
    if Op1.getType() != Op2.getType():
      return False
    # Deal with call operations
    if isinstance(Op1, RoseCallOp):
      assert isinstance(Op2, RoseCallOp)
      # Make sure that the callees for the operations are equal.
      if Op1.getCallee().getName() != Op2.getCallee().getName():
        return False
      OpsList1.extend(Op1.getCallOperands())
      OpsList2.extend(Op2.getCallOperands())
      continue
    # If this operation has not indexing operands, add None
    if Op1.isIndexingBVOp() ==  True:
      # Output bitwidths for bitvector ops must be equal
      if Op1.getOutputBitwidth() != Op2.getOutputBitwidth():
        return False
      OpsList1.extend(Op1.getBitVectorOperands())
      OpsList2.extend(Op2.getBitVectorOperands())
      continue
    # Consider all other instructions
    OpsList1.extend(Op1.getOperands())
    OpsList2.extend(Op2.getOperands())
  # We are done exploring the DFGs
  return True


def FuseCandidatePacks(RerollableCandidatePacks : list):  
  print("BEFORE FUSING:")
  for Pack in RerollableCandidatePacks:
    print("+++UNFUSED PACK:")
    for Op in Pack:
      Op.print()
  
  NewCandidatePacks = []
  NewPack = []
  AllowPackExtension = None  # We do not know yet
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
      if AllowPackExtension != False:
        NewPack.extend(Pack)
        AllowPackExtension = True
      else:
        # Since packs are not allowed to extend,
        # create a new pack.
        NewCandidatePacks.append(NewPack)
        NewPack = Pack
    else:
      # Add the new pack to the list of new candidate packs
      if AllowPackExtension == None:
        print("FUSION OF PACKS NOT ALLOWD!!")
        AllowPackExtension = False
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

  print("+++=RerollableCandidatesList:")
  print(RerollableCandidatesList)
  print(len(RerollableCandidatesList))

  # Add the set to the block map
  BlockToRerollableCandidatesMap[Block] = RerollableCandidatesList
  return BlockToRerollableCandidatesMap


def RunRerollerOnRegion(Region, BlockToRerollableCandidatesMap : dict):
  # Iterate over all the contents of this region
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region: #Region.getChildren():
    # Run reroller on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunRerollerOnFunction(Abstraction)
      continue
    # Reroller only operates on blocks
    if not isinstance(Abstraction, RoseBlock):
      Abstraction.print()
      BlockToRerollableCandidatesMap = RunRerollerOnRegion(Abstraction, \
                                            BlockToRerollableCandidatesMap)
      continue
    if FixReductionPatternToMakeBlockRerollable(Abstraction) == False:
      continue
    BlockToRerollableCandidatesMap = RunRerollerOnBlock(Abstraction, \
                                            BlockToRerollableCandidatesMap)
  return BlockToRerollableCandidatesMap


# The assumption here is that the relationship between the 
# indices is of the form: A * iterator + B. 
# We need to find A and B for every indexed bitvector operation.
def GetLowOffsetsWithinPack(Pack1 : list, Pack2 : list):
  assert DFGsAreIsomorphic(Pack1, Pack2) == True
  # Get the low index for the first bvinsert op in the pack
  StartIndex1 = None
  StartIndex2 = None
  for Index in range(len(Pack1)):
    Op1 = Pack1[Index]
    Op2 = Pack2[Index]
    if isinstance(Op1, RoseBVInsertSliceOp):
      assert isinstance(Op2, RoseBVInsertSliceOp)
      assert isinstance(Op1.getLowIndex(), RoseConstant)
      assert isinstance(Op2.getLowIndex(), RoseConstant)
      StartIndex1 = Op1.getLowIndex().getValue()
      StartIndex2 = Op2.getLowIndex().getValue()
      break
  assert StartIndex1 != None
  assert StartIndex2 != None
  print("StartIndex1:")
  print(StartIndex1)
  print("StartIndex2:")
  print(StartIndex2)
  LowOffsetsList = list()
  CoFactactorsList = list()
  for Index in range(len(Pack1)):
    Op1 = Pack1[Index]
    Op2 = Pack2[Index]
    if isinstance(Op1, RoseCallOp) or Op1.isIndexingBVOp() == 0:
      assert isinstance(Op2, RoseCallOp) or Op2.isIndexingBVOp() == 0
      LowOffsetsList.append(None)
      CoFactactorsList.append(None)
      continue
    # Now we are dealing with bitvector ops that index into bitvectors
    # First get the start index and get offsets relative to
    LowIndex1 = Op1.getLowIndex()
    LowIndex2 = Op2.getLowIndex()
    assert isinstance(LowIndex1, RoseConstant)
    assert isinstance(LowIndex2, RoseConstant)
    # Solve the linear equations
    # C1 * outer_iterator + C2 * innner_iterator + Offset = 
    Cofactor = (LowIndex2.getValue() - LowIndex1.getValue())\
                           / (StartIndex2 - StartIndex1)
    if Cofactor == int(Cofactor):
      Cofactor = int(Cofactor)
    print("--OP1:")
    Op1.print()
    print("--OP2:")
    Op2.print()
    print("LowIndex1.getValue():")
    print(LowIndex1.getValue())
    print("LowIndex2.getValue():")
    print(LowIndex2.getValue())
    print("FLOAT COFACTOR:")
    print((LowIndex2.getValue() - LowIndex1.getValue())\
                           / (StartIndex2 - StartIndex1))
    print("Cofactor:")
    print(Cofactor)
    Offset = LowIndex1.getValue() - (Cofactor * StartIndex1)
    assert Offset == int(Offset)
    Offset = int(Offset)
    print("Offset:")
    print(Offset)
    LowOffsetsList.append(Offset)
    CoFactactorsList.append(Cofactor)
  return LowOffsetsList, CoFactactorsList


def GetFirstLowIndexInPack(Pack : list):
  print("GetFirstLowIndexInPack:")
  for Op in Pack:
    Op.print()
  StartIndex = None
  for Op in Pack:
    if isinstance(Op, RoseBVInsertSliceOp):
      assert isinstance(Op.getLowIndex(), RoseConstant)
      StartIndex = Op.getLowIndex().getValue()
      break
  assert StartIndex != None
  return StartIndex


def GetStepForRerolledLoop(Pack1 : list, Pack2 : list):
  assert DFGsAreIsomorphic(Pack1, Pack2) == True
  # We just get the difference between 2 different packs
  Offset = None
  for Index in range(len(Pack1)):
    if isinstance(Pack1[Index], RoseBVInsertSliceOp):
      assert isinstance(Pack2[Index], RoseBVInsertSliceOp)
      LowIndex1 = Pack1[Index].getLowIndex()
      LowIndex2 = Pack2[Index].getLowIndex()
      assert isinstance(LowIndex1, RoseConstant)
      assert isinstance(LowIndex2, RoseConstant)
      Offset = (LowIndex2.getValue() - LowIndex1.getValue())
      break
  assert Offset != None
  return Offset


# This aims to see if the rerollable packs can be rerolled more again
def GetValidCandidatesRerollableTwice(RerollableCandidatesList):
  print("****************************************************")
  print("RerollableCandidatesList:")
  for PackList in RerollableCandidatesList:
    print("PACKLIST:")
    for Pack in PackList:
      print("PACK:")
      for Op in Pack:
        Op.print()
  # Puts packlists that are isomorphic together
  CandidateListsOfIsomorphicPackLists = []
  IsomorphicPackLists = []
  MergedPackList = []
  OffsetsList = []
  for  PackListIndex in range(len(RerollableCandidatesList)):
    if PackListIndex in MergedPackList:
      continue
    PackList = RerollableCandidatesList[PackListIndex]
    if IsomorphicPackLists == []:
      IsomorphicPackLists = [PackList]
      MergedPackList.append(PackListIndex)
    for CheckPackListIndex in range((PackListIndex + 1), len(RerollableCandidatesList)):
      if CheckPackListIndex in MergedPackList:
        continue
      CheckPackList = RerollableCandidatesList[CheckPackListIndex]
      # We try to look for isomorphism between the data flows
      # of packlists.
      TailPackList = IsomorphicPackLists[len(IsomorphicPackLists) - 1]
      print("TailPackList:")
      for Op in TailPackList[0]:
          Op.print()
      print("CheckPackList[0]:")
      for Op in CheckPackList[0]:
          Op.print()
      CheckDFGsAreIsomorphic = DFGsAreIsomorphic(TailPackList[0], CheckPackList[0])
      print("++++CheckDFGsAreIsomorphic:")
      print(CheckDFGsAreIsomorphic)
      if CheckDFGsAreIsomorphic == False:
        # Nothing to do here, just skip this pack list
        continue
      # Now we check if the offsets are equal
      NewOffsetsList = GetOffsetsBetweenPacks(TailPackList[0], CheckPackList[0], OffsetsList)
      print("++++NewOffsetsList:")
      print(NewOffsetsList)
      if NewOffsetsList == None:
        # Nothing to do here, just skip this pack list
        continue
      # If the offsets list is empty. Fill it up.
      if OffsetsList == []:
        OffsetsList = NewOffsetsList
      assert OffsetsList == NewOffsetsList
      MergedPackList.append(CheckPackListIndex)
      IsomorphicPackLists.append(CheckPackList)
    if len(IsomorphicPackLists) != 1:
      CandidateListsOfIsomorphicPackLists.append(IsomorphicPackLists)
    # Reset the lists. Note that we do not reset the offset list because we expect
    # the offset list to be the same across rerolled loops.
    IsomorphicPackLists = []
    #OffsetsList = []
  print("================================================")
  for PackLists in CandidateListsOfIsomorphicPackLists:
    print("+++++++PACKLISTS:")
    for PackList in PackLists:
      print("-------PACKLIST:")
      for Pack in PackList:
        print("PACK:")
        for Op in Pack:
          Op.print()
  return CandidateListsOfIsomorphicPackLists


def PerformRerollingOnce(Block: RoseBlock, RerollableCandidatesList : list, \
                         IteratorSuffix : int, RemovedOps : list):
  # Reroll the candidares in the list
  for PackList in RerollableCandidatesList:
    # Lets get the offsets across windows and other info for generating a loop
    LowOffsetsList, CoFactactorsList = GetLowOffsetsWithinPack(PackList[0], PackList[1])
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
    # Because of the way ranges in Rosette work, we have to add step to end before
    # generating a loop
    End += Step
    Loop = RoseForLoop.create("iterator." + str(IteratorSuffix), Start, End, Step)
    IteratorSuffix += 1
    Iterator = Loop.getIterator()
    # Map to track old and new ops.
    OldToNewOPsMap = dict()
    # Insert operations in the generated loop.
    for OpIndex, Op in enumerate(PackList[0]):
      # Handle ops that do not have indices in operands
      if isinstance(Op, RoseCallOp) or Op.isIndexingBVOp() == 0:
        NewOp = Op.clone()
        for Index, Operand in enumerate(Op.getOperands()):
          # If the operand is a constant value, we just copy constants over
          if isinstance(Operand, RoseConstant):
            NewOperand = Op.getOperand(Index)
          else:
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
      LowCofactor = CoFactactorsList[OpIndex]
      assert LowCofactor != None
      if LowCofactor == 1:
        ScaledIterator = Iterator
      elif LowCofactor == 0:
        ScaledIterator = RoseConstant(0, Iterator.getType())
      else:
        if type(LowCofactor) != int:
          LowCofactor = int(1 / LowCofactor)
          LowCofactorVal = RoseConstant(LowCofactor, Iterator.getType())
          ScaledIterator = RoseDivOp.create("low.cofactor." + str(OpIndex), Iterator, LowCofactorVal)
        else:
          LowCofactorVal = RoseConstant(LowCofactor, Iterator.getType())
          ScaledIterator = RoseMulOp.create("low.cofactor." + str(OpIndex), [Iterator, LowCofactorVal])
        Loop.addAbstraction(ScaledIterator)
      LowOffset = LowOffsetsList[OpIndex]
      assert LowOffset != None
      if LowOffset != 0:
      # Generate an add instruction
        LowOffsetVal = RoseConstant(LowOffset, ScaledIterator.getType())
        LowIndex = RoseAddOp.create("low.offset." + str(OpIndex), [ScaledIterator, LowOffsetVal]) 
        Loop.addAbstraction(LowIndex)
      else:
        LowIndex = ScaledIterator
      OpBitWidthVal = RoseConstant(Op.getOutputBitwidth() - 1, ScaledIterator.getType())
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


# Assumption here is that the indices are expressed as:
# C1 * outer_iterator + C2 * innner_iterator + Offset = BitSlice_Index
# We try to find C1, C2 and Offset for every bitslice.
def GetIndexRelationsAcrossPacks(ListOfCandidatePackLists):
  print("GetIndexRelationsAcrossPacks:")
  print(ListOfCandidatePackLists)
  Pack1 = ListOfCandidatePackLists[0][0]
  Pack2 = ListOfCandidatePackLists[0][1]
  Pack3 = ListOfCandidatePackLists[1][0]
  print("------------------")
  print(Pack1)
  PrintPack(Pack1)
  PrintPack(Pack2)
  PrintPack(Pack3)
  # Check if the candidate packs are isomorphic.
  assert DFGsAreIsomorphic(Pack1, Pack2) == True
  assert DFGsAreIsomorphic(Pack1, Pack3) == True
  # Get the low index for the first bvinsert op in the pack
  StartIndex1 = None
  StartIndex2 = None
  StartIndex3 = None
  for Index in range(len(Pack1)):
    Op1 = Pack1[Index]
    Op2 = Pack2[Index]
    Op3 = Pack3[Index]
    if isinstance(Op1, RoseBVInsertSliceOp):
      assert isinstance(Op2, RoseBVInsertSliceOp)
      assert isinstance(Op1.getLowIndex(), RoseConstant)
      assert isinstance(Op2.getLowIndex(), RoseConstant)
      assert isinstance(Op3.getLowIndex(), RoseConstant)
      StartIndex1 = Op1.getLowIndex().getValue()
      StartIndex2 = Op2.getLowIndex().getValue()
      StartIndex3 = Op3.getLowIndex().getValue()
      break
  assert StartIndex1 != None
  assert StartIndex2 != None
  assert StartIndex3 != None
  print("StartIndex1:")
  print(StartIndex1)
  print("StartIndex2:")
  print(StartIndex2)
  print("------StartIndex3:")
  print(StartIndex3)
  Pack1LaneIndex = 0
  Pack2LaneIndex = 0
  # StartIndex is total index into the vector. It is supposed
  # to be the index into a lane. So adjust for that.
  Pack3LaneIndex = StartIndex3 - StartIndex1
  StartIndex3 = StartIndex1

  # Function to round numbers
  def Round(X):
    def Truncate(number, digits) -> float:
      stepper = 10.0 ** digits
      return math.trunc(stepper * number) / stepper
    # Truncate first
    print("X: ")
    print(X)
    X = Truncate(X, 2)
    # See if more rounding is needed
    print("TRUNCATED X: ")
    print(X)
    if X == 0:
      return X
    if (1/X) % 2 == 0:
      return X
    if X != int(X):
      if (X + 0.01) == int(X + 0.01):
        X = X + 0.01
        return X
      assert (X - 0.01) == int(X - 0.01)
      X = X - 0.01
      return X
    return X

  LowOffsetsList = list()
  CoFactactorsList1 = list()
  CoFactactorsList2 = list()
  for Index in range(len(Pack1)):
    Op1 = Pack1[Index]
    Op2 = Pack2[Index]
    Op3 = Pack3[Index]
    if isinstance(Op1, RoseCallOp) or Op1.isIndexingBVOp() == False:
      assert isinstance(Op2, RoseCallOp) or Op2.isIndexingBVOp() == False
      assert isinstance(Op3, RoseCallOp) or Op3.isIndexingBVOp() == False
      LowOffsetsList.append(None)
      CoFactactorsList1.append(None)
      CoFactactorsList2.append(None)
      continue
    # Now we are dealing with bitvector ops that index into bitvectors
    # First get the start index and get offsets relative to
    LowIndex1 = Op1.getLowIndex()
    LowIndex2 = Op2.getLowIndex()
    LowIndex3 = Op3.getLowIndex()
    assert isinstance(LowIndex1, RoseConstant)
    assert isinstance(LowIndex2, RoseConstant)
    assert isinstance(LowIndex3, RoseConstant)
    print("--OP1:")
    Op1.print()
    print("--OP2:")
    Op2.print()
    print("LowIndex1.getValue():")
    print(LowIndex1.getValue())
    print("LowIndex2.getValue():")
    print(LowIndex2.getValue())
    print("LowIndex3.getValue():")
    print(LowIndex3.getValue())
    print("StartIndex1:")
    print(StartIndex1)
    print("StartIndex2:")
    print(StartIndex2)
    print("StartIndex3:")
    print(StartIndex3)
    # Solve the linear equations
    # C1 * outer_iterator + C2 * innner_iterator + Offset = BitSlice_Index
    A = np.array([[Pack1LaneIndex,  StartIndex1, 1], [Pack2LaneIndex, StartIndex2, 1], \
                 [Pack3LaneIndex, StartIndex3, 1]])
    B = np.array([LowIndex1.getValue(), LowIndex2.getValue(), LowIndex3.getValue()])
    X =  np.linalg.solve(A, B)
    Cofactor1 = Round(X[0])
    Cofactor2 = Round(X[1])
    Offset = Round(X[2])
    print("Cofactor1:")
    print(Cofactor1)
    print("Cofactor2:")
    print(Cofactor2)
    print("Offset:")
    print(Offset)
    if Cofactor1 == int(Cofactor1):
      Cofactor1 = int(Cofactor1)
    if Cofactor2 == int(Cofactor2):
      Cofactor2 = int(Cofactor2)
    assert Offset == int(Offset)
    Offset = int(Offset)
    LowOffsetsList.append(Offset)
    CoFactactorsList1.append(Cofactor1)
    CoFactactorsList2.append(Cofactor2)
  return LowOffsetsList, CoFactactorsList1, CoFactactorsList2


def PerformRerollingTwice(Block: RoseBlock, ListOfCandidateIsomorphicPackLists : list, \
                          IteratorSuffix : int, RemovedOps : list):
  # Generate the outer loop that wraps around all the packlists
  ListOfCandidatePackLists = ListOfCandidateIsomorphicPackLists[0]
  FirstLoopPack = ListOfCandidatePackLists[0][0]
  SecondLoopPack = ListOfCandidatePackLists[1][0]
  LastLoopPack = ListOfCandidatePackLists[len(ListOfCandidatePackLists) - 1][0]
  OutStart = GetFirstLowIndexInPack(FirstLoopPack)
  OutEnd = GetFirstLowIndexInPack(LastLoopPack)
  OutStep = GetStepForRerolledLoop(FirstLoopPack, SecondLoopPack)
  # Account for how Rosette expects the loop bounds to be expressed.
  OutEnd += OutStep
  OuterLoop = RoseForLoop.create("iterator.lane", OutStart, OutEnd, OutStep)
  OutIterator = OuterLoop.getIterator()
  # Now pack the code for inner loops
  for ListOfPackLists in ListOfCandidateIsomorphicPackLists: 
   # Lets get the offsets across windows and other info for generating a loop
    LowOffsetsList, CoFactactorsList1, CoFactactorsList2 = \
                GetIndexRelationsAcrossPacks(ListOfPackLists)
    print("LowOffsetsList:")
    print(LowOffsetsList)
    print("CoFactactorsList1:")
    print(CoFactactorsList1)
    print("CoFactactorsList2:")
    print(CoFactactorsList2)
    PackList = ListOfPackLists[0]
    Step = GetStepForRerolledLoop(PackList[0], PackList[1])
    Start = GetFirstLowIndexInPack(PackList[0])
    End = GetFirstLowIndexInPack(PackList[len(PackList) - 1])
    print("START:")
    print(Start)
    print("END:")
    print(End)
    print("STEP:")
    print(Step)
    # Because of the way ranges in Rosette work, we have to add step to end before
    # generating a loop
    End += Step
    Loop = RoseForLoop.create("iterator." + str(IteratorSuffix), Start, End, Step)
    IteratorSuffix += 1
    Iterator = Loop.getIterator()
    # Map to track old and new ops.
    OldToNewOPsMap = dict()
    # Insert operations in the generated loop.
    for OpIndex, Op in enumerate(PackList[0]):
      # Handle ops that do not have indices in operands
      if isinstance(Op, RoseCallOp) or Op.isIndexingBVOp() == 0:
        NewOp = Op.clone()
        for Index, Operand in enumerate(Op.getOperands()):
          # If the operand is a constant value, we just copy constants over
          if isinstance(Operand, RoseConstant):
            NewOperand = Op.getOperand(Index)
          else:
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
      print("HANDLING THE INSTRUCTIONS WITH INDICES AS OPERANDS")
      LowCofactor1 = CoFactactorsList1[OpIndex]
      assert LowCofactor1 != None
      if LowCofactor1 == 1:
        ScaledIterator1 = OutIterator
      elif LowCofactor1 == 0:
        ScaledIterator1 = RoseConstant(0, OutIterator.getType())
      else:
        if type(LowCofactor1) != int:
          LowCofactor1 = int(1 / LowCofactor1)
          LowCofactorVal1 = RoseConstant(LowCofactor1, OutIterator.getType())
          ScaledIterator1 = RoseDivOp.create("low.out.cofactor." + str(OpIndex), OutIterator, LowCofactorVal1)
        else:
          LowCofactorVal1 = RoseConstant(LowCofactor1, OutIterator.getType())
          ScaledIterator1 = RoseMulOp.create("low.out.cofactor." + str(OpIndex), [OutIterator, LowCofactorVal1])
        Loop.addAbstraction(ScaledIterator1)
      LowCofactor2 = CoFactactorsList2[OpIndex]
      assert LowCofactor2 != None
      if LowCofactor2 == 1:
        ScaledIterator2 = Iterator
      elif LowCofactor2 == 0:
        ScaledIterator2 = RoseConstant(0, Iterator.getType())
      else:
        if type(LowCofactor2) != int:
          LowCofactor2 = int(1 / LowCofactor2)
          LowCofactorVal2 = RoseConstant(LowCofactor2, Iterator.getType())
          ScaledIterator2 = RoseDivOp.create("low.cofactor." + str(OpIndex), Iterator, LowCofactorVal2)
        else:
          LowCofactorVal2 = RoseConstant(LowCofactor2, Iterator.getType())
          ScaledIterator2 = RoseMulOp.create("low.cofactor." + str(OpIndex), [Iterator, LowCofactorVal2])
        Loop.addAbstraction(ScaledIterator2)
      if isinstance(ScaledIterator1, RoseConstant) and ScaledIterator1.getValue() == 0:
        ScaledIterator = ScaledIterator2
      elif isinstance(ScaledIterator2, RoseConstant) and ScaledIterator2.getValue() == 0:
        ScaledIterator = ScaledIterator1
      else:
        ScaledIterator = RoseAddOp.create("low.scaled.it." + str(OpIndex), [ScaledIterator1, ScaledIterator2])
        Loop.addAbstraction(ScaledIterator)
      LowOffset = LowOffsetsList[OpIndex]
      assert LowOffset != None
      if LowOffset != 0:
      # Generate an add instruction
        LowOffsetVal = RoseConstant(LowOffset, ScaledIterator.getType())
        LowIndex = RoseAddOp.create("low.offset." + str(OpIndex), [ScaledIterator, LowOffsetVal]) 
        Loop.addAbstraction(LowIndex)
      else:
        LowIndex = ScaledIterator
      OpBitWidthVal = RoseConstant(Op.getOutputBitwidth() - 1, ScaledIterator.getType())
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
    # Now add the generated loop before the generated outer loop
    OuterLoop.addAbstraction(Loop)
    print("PRINT OUTER LOOP")
    OuterLoop.print()
    # Lets queue all the ops in the pack lists to be removed
    for PackList in ListOfPackLists:
      for Pack in PackList:
        for Op in Pack:
          RemovedOps.append(Op)
  
  # Now add the outer loop to the rest of the IR
  ParentRegion = Block.getParent()
  ParentRegion.print()
  Block.print()
  Index = ParentRegion.getPosOfChild(Block)
  ParentRegion.addRegionBefore(Index, OuterLoop)
  print("PRINTING PARENT REGION BEFORE:")
  ParentRegion.print()
  print("PRINTING PARENT REGION AFTER:")
  ParentRegion.print()


def PerformRerolling(BlockToRerollableCandidatesMap : dict):
  print("PERFORMING REROLLING")
  RemovedOps = []
  IteratorSuffix = 0
  # Iterate over the candidate lists for different blocks
  # and reroll as much as possible.
  for Block, RerollableCandidatesList in BlockToRerollableCandidatesMap.items():
    ListOfCandidateIsomorphicPackLists = GetValidCandidatesRerollableTwice(RerollableCandidatesList)
    print(len(ListOfCandidateIsomorphicPackLists))
    if ListOfCandidateIsomorphicPackLists != []:
      print("PERFORMING REROLLING TWICE")
      PerformRerollingTwice(Block, ListOfCandidateIsomorphicPackLists, \
                            IteratorSuffix, RemovedOps)
    else:
      print("PERFORMING REROLLING ONCE")
      PerformRerollingOnce(Block, RerollableCandidatesList, IteratorSuffix, RemovedOps)
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


def FixReductionPatternToMakeBlockRerollable(Block : RoseBlock):
  print("FIX REDUCTION PATTERN TO MAKE BLOCK REROLLABLE")
  print("FixReductionPatternToMakeBlockRerollable")
  # Look for chains of bvadd ops
  BVAddChain = list()
  BVInsertOp = RoseUndefValue()
  for Op in reversed(Block.getOperations()):
    if isinstance(Op, RoseBVInsertSliceOp):
      # Go up the use-def chain to look for add ops
      if isinstance(Op.getInsertValue(), RoseBVAddOp):
        Worklist = [Op.getInsertValue()]
        while len(Worklist) != 0:
          AddOp = Worklist.pop()
          BVAddChain.append(AddOp)
          for Operand in AddOp.getOperands():
            if isinstance(Operand, RoseBVAddOp) \
            and Operand.getParent() == Block:
              Worklist.append(Operand)
        BVInsertOp = Op
        break
  if len(BVAddChain) == 0 or len(BVAddChain) == 1 \
    or BVInsertOp == RoseUndefValue():
    return False
  
  # One of the bvadds must be coming from external source
  # (some other block or function argument).
  TempValues = []
  ExternalOperand = []
  for Op in BVAddChain:
    for Operand in Op.getOperands():
      if Operand not in Block:
        ExternalOperand.append(Operand)
        continue
      if isinstance(Operand, RoseBVExtractSliceOp) \
      and isinstance(Operand.getInputBitVector(), RoseArgument):
        ExternalOperand.append(Operand)
        continue
      print("####Operand:")
      Operand.print()
      TempValues.append(Operand)
  if TempValues == [] or ExternalOperand == []:
    return False

  # Insert bvinserts after TempValues
  for Op in TempValues:
    InsertionPoint = Block.getPosOfOperation(Op) + 1
    InsertBefore = Block.getChild(InsertionPoint)
    LowIndex = BVInsertOp.getLowIndex()
    HighIndex = BVInsertOp.getHighIndex()
    if isinstance(LowIndex, RoseOperation):
      LowIndex = CloneAndInsertOperation(LowIndex, InsertBefore)
    if isinstance(HighIndex, RoseOperation):
      HighIndex = CloneAndInsertOperation(HighIndex, InsertBefore)
    print("LowIndex:")
    LowIndex.print()
    print("HighIndex:")
    HighIndex.print()
    BitwidthVal = RoseConstant.create(BVInsertOp.getOutputBitwidth(), \
                                      LowIndex.getType())
    ExtractOp = RoseBVExtractSliceOp.create(Op.getName() + ".ext", \
                                          BVInsertOp.getInputBitVector(), \
                                          LowIndex, HighIndex, BitwidthVal)
    print("Op:")
    Op.print()
    AddOp = RoseBVAddOp.create(Op.getName() + ".acc", [ExtractOp, Op])
    InsertOp = RoseBVInsertSliceOp.create(AddOp, BVInsertOp.getInputBitVector(), \
                                          LowIndex, HighIndex, BitwidthVal)
    Block.addOperationBefore(ExtractOp, InsertBefore)
    Block.addOperationBefore(AddOp, InsertBefore)
    Block.addOperationBefore(InsertOp, InsertBefore)

  print("FIXED BLOCK:")
  Block.print()

  return True


def RunRerollerOnFunction(Function : RoseFunction):
  print("RUN ON REROLLER FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Mapping root instruction to list of redundant instructions
  BlockToRerollableCandidatesMap = dict()

  # Run loop reroller on the given function
  BlockToRerollableCandidatesMap = RunRerollerOnRegion(Function, \
                                    BlockToRerollableCandidatesMap)
  # Time to perform some rerolling
  PerformRerolling(BlockToRerollableCandidatesMap)


# Runs Loop reroller
def Run(Function : RoseFunction):
  print("RUN LOOP REROLLER")
  RunRerollerOnFunction(Function)
  print("___________")
  print("\n\n\n\n")
  Function.print()



