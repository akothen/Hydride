#############################################################
#
# This pass removes dead operations. It helps make the
# Rose IR more readable and simplifies the code.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseMatrixOperations import *
from RoseContext import *


def RemoveRedundantBVInsertOps(Block: RoseBlock):
  BVInsertOpList = list()
  BVInsertToExtractMap = dict()
  BVInsertIsNotDeletable = set()
  for Operation in Block:
      if isinstance(Operation, RoseBVInsertSliceOp):
          # If this op is already in the map, we rempve the entry
          # from the map. TODO: Improve this, if neessary.
          for BVInsertOp, _ in BVInsertToExtractMap.items():
              if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
                  BVInsertToExtractMap.pop(Operation)
                  break
          # We only deal with cases where the indices are constants
          BVInsertOpLow = Operation.getLowIndex()
          BVInsertOpHigh = Operation.getHighIndex()
          if isinstance(BVInsertOpLow, RoseConstant) \
                  and isinstance(BVInsertOpHigh, RoseConstant):
              BVInsertOpList.append(Operation)
          continue
      if isinstance(Operation, RoseBVExtractSliceOp):
          for BVInsertOp in BVInsertOpList:
              if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
                  if Operation.getType().getBitwidth() \
                          <= BVInsertOp.getInsertValue().getType().getBitwidth():
                      # We only deal with cases where the indices are constants
                      BVExtractOpLow = Operation.getLowIndex()
                      BVExtractOpHigh = Operation.getHighIndex()
                      if isinstance(BVExtractOpLow, RoseConstant) \
                              and isinstance(BVExtractOpHigh, RoseConstant):
                          if BVInsertOp not in BVInsertToExtractMap:
                              BVInsertToExtractMap[BVInsertOp] = [Operation]
                          else:
                              BVInsertToExtractMap[BVInsertOp].append(
                                  Operation)
                          break
                      else:
                          BVInsertIsNotDeletable.add(BVInsertOp)
                  else:
                      BVInsertIsNotDeletable.add(BVInsertOp)

  # Now we replace the bvextracts with shift sand remove bvinserts.
  for BVInsertOp, BVExtractList in BVInsertToExtractMap.items():
      # Now we replace the bitvector being extracted from with the inserted
      # value to make the extraction more direct.
      BVInsertOpLow = BVInsertOp.getLowIndex()
      BVInsertOpHigh = BVInsertOp.getHighIndex()
      for BVExtractOp in BVExtractList:
          assert BVInsertOp.getOutputBitwidth() >= BVExtractOp.getOutputBitwidth()
          BVExtractOpLow = BVExtractOp.getLowIndex()
          BVExtractOpHigh = BVExtractOp.getHighIndex()
          # Compute the new low index
          if BVExtractOpLow.getValue() >= BVInsertOpLow.getValue():
              NewLow = RoseConstant.create(BVExtractOpLow.getValue() - BVInsertOpLow.getValue(),
                                            BVExtractOpLow.getType())
          else:
              # Cannot do much with this extract op
              BVInsertIsNotDeletable.add(BVInsertOp)
              continue
          # Compute the new high index
          if BVExtractOpLow.getValue() + BVExtractOp.getOutputBitwidth() \
                  <= BVInsertOpLow.getValue() + BVInsertOp.getOutputBitwidth():
              NewHigh = RoseConstant.create(NewLow.getValue() + BVExtractOp.getOutputBitwidth(),
                                            BVExtractOpHigh.getType())
          else:
              # Cannot do much with this extract op
              BVInsertIsNotDeletable.add(BVInsertOp)
              continue
          BVExtractOp.setOperand(0, BVInsertOp.getInsertValue())
          BVExtractOp.setOperand(1, NewLow)
          BVExtractOp.setOperand(2, NewHigh)

      # Remove the bvinsert op from the block if we are done with all its uses
      if BVInsertOp not in BVInsertIsNotDeletable:
          Block.eraseOperation(BVInsertOp)


def RunDCEOnBlock(Block: RoseBlock):
  print("RUN DCE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Gather all the ops in this block
  OpList = list()
  for Operation in Block:
      if isinstance(Operation, RoseBVInsertSliceOp) \
      or isinstance(Operation, RoseReturnOp) \
      or isinstance(Operation, RoseBVPadHighBitsOp) \
      or isinstance(Operation, RoseMatrixInsertRowOp) \
      or isinstance(Operation, RoseMatrixInsertRowsOp):
        continue
      OpList.append(Operation)
  # Iterate the list of operations in reverse order
  for Op in reversed(OpList):
      # If the Op has no uses, remove it!
      print("Op:")
      Op.print()
      print("Op.getNumUsers():")
      print(Op.getNumUsers())
      if Op.getNumUsers() == 0:
          Block.eraseOperation(Op)

  # Remove redundant bvinserts
  RemoveRedundantBVInsertOps(Block)

  # Check if the block is empty. If it is, remove the block
  if Block.getNumOperations() == 0:
      ParentRegion = Block.getParent()
      ParentKey = ParentRegion.getKeyForChild(Block)
      ParentRegion.eraseChild(Block, ParentKey)


def RunDCEOnFunction(Function: RoseFunction):
  print("RUN DCE ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run DCE on the given function
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
      RunDCEOnBlock(Block)


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
  RunDCEOnFunction(Function)
  print("\n\n\n\n\n")
  Function.print()
