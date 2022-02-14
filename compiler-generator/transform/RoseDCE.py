#############################################################
#
# This pass removes dead operations. It helps make the 
# Rose IR more readable and simplifies the code.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def RemoveRedundantBVInsertOps(Block : RoseBlock):
  BVInsertOpList = list()
  BVInsertToExtractMap = dict()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp):
      # If this op is already in the map, we rempve the entry
      # from the map. TODO: Imoprove this, if neessary.
      if Operation in BVInsertToExtractMap:
        BVInsertToExtractMap.pop(Operation)
      BVInsertOpList.append(Operation)
      continue
    if isinstance(Operation, RoseBVExtractSliceOp):
      for BVInsertOp in BVInsertOpList:
        if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
          if Operation.getInputBitVector().getType().getBitwidth() \
                == BVInsertOp.getInsertValue().getType().getBitwidth():
            if BVInsertOp not in BVInsertToExtractMap:
              BVInsertToExtractMap[BVInsertOp] = [Operation]
            else:
              BVInsertToExtractMap[BVInsertOp].append(Operation)
            break
  
  # Now we replace the bvextracts with shift sand remove bvinserts.
  for BVInsertOp, BVExtractList in BVInsertToExtractMap.items():
    # Now we replace the bitvector being extracted from with the inserted
    # value to make the extraction more direct.
    for BVExtractOp in BVExtractList:
      BVExtractOp.setOperand(0, BVInsertOp.getInsertValue())
    # Remove the bvinsert op from the block
    Block.eraseOperation(BVInsertOp)


def RunDCEOnBlock(Block : RoseBlock):
  print("RUN DCE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Gather all the ops in this block
  OpList = list()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp) \
    or isinstance(Operation, RoseReturnOp):
      continue
    OpList.append(Operation)
  # Iterate the list of operations in reverse order
  for Op in reversed(OpList):
    # If the Op has no uses, remove it!
    if len(Op.getUsers()) == 0:
      Block.eraseOperation(Op)

  # Remove redundant bvinserts
  RemoveRedundantBVInsertOps(Block)


def RunDCEOnRegion(Region):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Run DCE on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunDCEOnFunction(Abstraction)
      continue
    # DCE only happens on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      print(Abstraction)
      Abstraction.print()
      RunDCEOnRegion(Abstraction)
      continue
    RunDCEOnBlock(Abstraction)


def RunDCEOnFunction(Function : RoseFunction):
  print("RUN ON OP SIMPLIFY FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run DCE on the given function
  RunDCEOnRegion(Function)


# Runs a transformation
def Run(Function : RoseFunction):
  RunDCEOnFunction(Function)
  print("\n\n\n\n\n")
  Function.print()




