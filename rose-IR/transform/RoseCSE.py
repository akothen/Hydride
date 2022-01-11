
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def RunCSEOnBlock(Block : RoseBlock, OpToOpMap : dict):
  print("RUN CSE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Visited = set()
  TotalNumInsts = Block.getNumOperations()
  for Index in range(TotalNumInsts):
    KeyOperation = Block.getOperation(Index)
    if KeyOperation in Visited:
      continue
    # Skip call instructions
    if isinstance(KeyOperation, RoseCallOp):
      Visited.insert(KeyOperation)
      continue
    # Iterate ahead and see if we find a matching instruction
    for CheckIndex in range(Index, TotalNumInsts):
      Operation = Block.getOperation(CheckIndex)
      if Operation in Visited:
        continue
      # Skip call instructions
      if isinstance(KeyOperation, RoseCallOp):
        Visited.insert(KeyOperation)
        continue
      if KeyOperation == Operation:
        print("EQUAL INSTRUCTIONS:")
        KeyOperation.print()
        Operation.print()
        if OpToOpMap.get(Operation, None) == None:
          OpToOpMap[KeyOperation] = [Operation]
        else:
          OpToOpMap[KeyOperation].append(Operation)
        Visited.insert(Operation)
    Visited.insert(KeyOperation)
  print(OpToOpMap)
  return OpToOpMap


def RunCSEOnRegion(Region, OpToOpMap : dict):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region.getChildren():
    # Run CSE on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunCSEOnFunction(Abstraction)
      continue
    # CSE only happens on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      Abstraction.print()
      OpToOpMap = RunCSEOnRegion(Abstraction, OpToOpMap)
      continue
    OpToOpMap = RunCSEOnBlock(Abstraction, OpToOpMap)
  return OpToOpMap


def RunCSEOnFunction(Function : RoseFunction):
  print("RUN ON CSE FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Mapping root instruction to list of redundant instructions
  OpToOpMap = dict()

  # Run CSE on the given function
  OpToOpMap = RunCSEOnRegion(Function, OpToOpMap)
  
  # Now that the map is populated, modify the given block
  RemovedOps = list()
  if Function.isTopLevelFunction():
    ParentRegion = Function
  else:
    ParentRegion = Function.getParent()
  for KeyOperation, OpList in OpToOpMap.items():
    for Operation in OpList:
      # Replace the uses this operation
      ParentRegion.replacesUsesWith(KeyOperation, Operation)
      RemovedOps.append(Operation)

  # Remove the dead operations
  for Operation in RemovedOps:
    Block = Operation.getParent()
    Block.erase(Operation)


# Runs a transformation
def Run(Function : RoseFunction):
  RunCSEOnFunction(Function)



