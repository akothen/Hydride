
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *


def GetOffsetsBetweenWindows(Window1 : list, Window2 : list, OffsetsList : list = []):
  assert len(Window1) == len(Window2)
  if OffsetsList == []:
    #OffsetsList = list() * len(Window1)
    for Index in range(len(Window1)):
      OffsetsList.append(list())
  for Index in range(len(Window1)):
    NonBVOperands1 = Window1[Index].getNonBitVectorOperands()
    NonBVOperands2 = Window2[Index].getNonBitVectorOperands()
    if len(NonBVOperands1) != len(NonBVOperands2):
      return None
    # Get offsets between instructions
    NewOffsetsList = []
    for OperandIndex in range(len(NonBVOperands1)):
      if not isinstance(NonBVOperands1[OperandIndex], RoseConstant):
        return None
      if not isinstance(NonBVOperands2[OperandIndex], RoseConstant):
        return None
      NewOffsetsList.append(NonBVOperands2[OperandIndex].getValue() - NonBVOperands1[OperandIndex].getValue())
    # Check if the given offsets match the newly computed offsets
    print(OffsetsList)
    if OffsetsList[Index] == []:
      OffsetsList[Index] = NewOffsetsList
      continue
    if OffsetsList[Index] != NewOffsetsList:
      return None
  return OffsetsList


def GetValidRerollableCandidates(RerollableCandidateWindows : list):
  # Collect list of rerollable windows in a set.
  RerollableCandidatesList = list()
  WindowsList = list()
  OffsetsList = list()
  for Window in RerollableCandidateWindows:
    if WindowsList == []:
      WindowsList.append(Window)
      continue
    # Now check if the window should be added to the current window list.
    # If the window lenghts different, they cannot be part of a set.
    if len(WindowsList[0]) != len(Window):
      # This is the end of the window list.
      # If we didn't capture multiple windows, we must discard the list
      if len(WindowsList) != 1:
        # Add the window list to the candidate list
        RerollableCandidatesList.append(WindowsList)
      # Empty the list and continue
      WindowsList = list()
      continue
    # Now lets see if the window should be added to the window list
    NewOffsetsList = GetOffsetsBetweenWindows(WindowsList[0], Window, OffsetsList)
    if NewOffsetsList == None:
      # This is the end of the window list.
      # If we didn't capture multiple windows, we must discard the list
      if len(WindowsList) != 1:
        # Add the window list to the candidate list
        RerollableCandidatesList.append(WindowsList)
      # Empty the list and continue
      WindowsList = list()
      continue
    # If the offsets list is empty. Fill it up.
    if OffsetsList == []:
      OffsetsList = NewOffsetsList
    assert OffsetsList == NewOffsetsList
    # Add the window to the list
    WindowsList.append(Window)
  return RerollableCandidatesList


def RunRerollerOnBlock(Block : RoseBlock, BlockToRerollableCandidatesMap : dict):
  print("RUN REROLLER ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Collect groups instructions that are rerollable.
  # This only works on bitvector operations.
  # Window is the moving window through code that
  # collects rellolable set of operations.
  # A legal window will end with a bvinsert operation.
  RerollableCandidateWindows = []
  Window = []
  TotalNumInsts = Block.getNumOperations()
  for Index in range(TotalNumInsts):
    Operation = Block.getOperation(Index)
    # Once we hit an instruction that cannot reroll, 
    # we quit if we have found some candidates already.
    # If not, we keep looking.
    if not isinstance(Operation, RoseCallOp) \
    and not isinstance(Operation, RoseBitVectorOp):
      if len(RerollableCandidateWindows) == 0:
        continue
      else:
        break
    if Window == []:
      Window.append(Operation)
      continue
    # This op can be a candidate for being added to the window
    PutOpInWindow = True
    for Op in Window:
      # Check if the bitvector opcode and bitvector operands match
      if Op.getOpcode() == Operation.getOpcode() \
      and Op.getBitVectorOperands() == Operation.getBitVectorOperands():
          PutOpInWindow = False
          break
    if PutOpInWindow == True:
      Window.append(Operation)
    else:
      # This is the end of the window. Assert that this window
      # ends with a bvinsert operation.
      assert len(Window) > 0
      LastOp = Window[len(Window) - 1]
      assert isinstance(LastOp, RoseBVInsertSliceOp)
      # Insert the window to the candidates list and empty the window
      RerollableCandidateWindows.append(Window)
      Window = []

  # Get a set of rerollable sets
  RerollableCandidatesList = GetValidRerollableCandidates(RerollableCandidateWindows)
  print(RerollableCandidatesList)

  # Add the set to the block map
  BlockToRerollableCandidatesMap[Block] = RerollableCandidatesList
  print("BlockToRerollableCandidatesMap:")
  print(BlockToRerollableCandidatesMap)
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


def RunRerollerOnFunction(Function : RoseFunction):
  print("RUN ON REROLLER FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Mapping root instruction to list of redundant instructions
  BlockToRerollableCandidatesMap = dict()

  # Run loop reroller on the given function
  BlockToRerollableCandidatesMap = RunRerollerOnRegion(Function, \
                                    BlockToRerollableCandidatesMap)
  
  # Now that the map is populated, modify the given block
  print("MAPPINGS:")
  print(BlockToRerollableCandidatesMap)


# Runs Loop reroller
def Run(Function : RoseFunction):
  print("RUN LOOP REROLLER")
  RunRerollerOnFunction(Function)
  Function.print()



