
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *

# Kinds of operations CSE must be skipped on
def SkipOperation(Operation : RoseOperation):
  return isinstance(Operation, RoseCallOp) \
      or isinstance(Operation, RoseBVInsertSliceOp) \
      or isinstance(Operation, RoseBVExtractSliceOp)


def RunCSEOnBlock(Block : RoseBlock, OpToOpMap : dict):
  print("RUN CSE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  Visited = set()
  TotalNumOps = Block.getNumOperations()
  for Index in range(TotalNumOps):
    KeyOperation = Block.getOperation(Index)
    if KeyOperation in Visited:
      continue
    # Skip certain operations
    if SkipOperation(KeyOperation):
      Visited.add(KeyOperation)
      continue
    # Iterate ahead and see if we find a matching instruction
    for CheckIndex in range(Index + 1, TotalNumOps):
      Operation = Block.getOperation(CheckIndex)
      print("KEY OEPRATION:")
      KeyOperation.print()
      print("OEPRATION:")
      Operation.print()
      if Operation in Visited:
        continue
      # Skip certain operations
      if SkipOperation(KeyOperation):
        Visited.add(KeyOperation)
        continue
      if KeyOperation.isSameAs(Operation):
        print("EQUAL INSTRUCTIONS:")
        KeyOperation.print()
        Operation.print()
        if OpToOpMap.get(KeyOperation, []) == []:
          OpToOpMap[KeyOperation] = [Operation]
        else:
          OpToOpMap[KeyOperation].append(Operation)
        Visited.add(Operation)
    Visited.add(KeyOperation)
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
  print("MAPPINGS:")
  print(OpToOpMap)
  RemovedOps = list()
  if Function.isTopLevelFunction():
    ParentRegion = Function
  else:
    ParentRegion = Function.getParent()
  for KeyOperation, OpList in OpToOpMap.items():
    print(KeyOperation)
    print(type(KeyOperation))
    for Operation in OpList:
      # Replace the uses this operation
      ParentRegion.replaceUsesWith(Operation, KeyOperation)
      RemovedOps.append(Operation)

  # Remove the dead operations
  for Operation in RemovedOps:
    Block = Operation.getParent()
    print("OPERATION TO BE ERASED:")
    Operation.print()
    Block.eraseOperation(Operation)
    Block.print()


# Runs a transformation
def Run(Function : RoseFunction):
  RunCSEOnFunction(Function)
  Function.print()



