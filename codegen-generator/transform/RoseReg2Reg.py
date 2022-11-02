#############################################################
#
# This pass eliminates some redundant bvinserts and 
# bvextracts. This pass is like mem2reg except this is
# more like reg2reg.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *



def RemoveBVExtractOps(BVExtractOp : RoseBVExtractSliceOp, ReplacementVal : RoseValue):
  assert isinstance(BVExtractOp, RoseBVExtractSliceOp)
  assert isinstance(ReplacementVal, RoseValue)
  Block = BVExtractOp.getParent()
  Function = Block.getFunction()
  # Remove the bvextract
  Lowindex = BVExtractOp.getLowIndex()
  HighIndex = BVExtractOp.getHighIndex()
  BVExtractOp.replaceUsesWith(ReplacementVal)
  Block.eraseOperation(BVExtractOp)  
  # Remove indexing ops
  Worklist = [Lowindex, HighIndex]
  while len(Worklist) != 0:
    Operation = Worklist.pop()
    if Function.getNumUsersOf(Operation) == 0:
      Block.eraseOperation(Operation)


def PerformReg2RegOnBlock(Block : RoseBlock):
  BVInsertOpList = list()
  BVInsertToExtractMap = dict()
  BVInsertIsNotDeletable = set()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp):
      BVInsertOpList.append(Operation)
      continue
    if isinstance(Operation, RoseBVExtractSliceOp):
      # Try to map the bvextract op to the closest bvinsert op
      for BVInsertOp in reversed(BVInsertOpList):
        if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
          if Operation.getType().getBitwidth() \
                == BVInsertOp.getInsertValue().getType().getBitwidth():
            if BVInsertOp not in BVInsertToExtractMap:
              BVInsertToExtractMap[BVInsertOp] = [Operation]
            else:
              BVInsertToExtractMap[BVInsertOp].append(Operation)
            break
          else:
            BVInsertIsNotDeletable.add(BVInsertOp)
  
  # Now we replace the bvextracts with shift sand remove bvinserts.
  for BVInsertOp, BVExtractList in BVInsertToExtractMap.items():
    # Now we replace the bitvector being extracted from with the inserted
    # value to make the extraction more direct.
    for BVExtractOp in BVExtractList:
      assert BVInsertOp.getOutputBitwidth() == BVExtractOp.getOutputBitwidth()
      # If the new low and high indices match, we can remove the bvextract
      # and bvinsert op.
      if isinstance(BVExtractOp.getLowIndex(), RoseConstant) \
        and isinstance(BVInsertOp.getLowIndex(), RoseConstant):
        if BVExtractOp.getLowIndex().getValue() == BVInsertOp.getLowIndex().getValue():
          # Remove the bvextract
          RemoveBVExtractOps(BVExtractOp, BVInsertOp.getInsertValue())
        else:
          # Cannot do much with this extract op
          BVInsertIsNotDeletable.add(BVInsertOp)
          continue
      elif isinstance(BVExtractOp.getHighIndex(), RoseConstant) \
        and isinstance(BVInsertOp.getHighIndex(), RoseConstant):
        if BVExtractOp.getHighIndex().getValue() == BVInsertOp.getHighIndex().getValue():
          # Remove the bvextract
          RemoveBVExtractOps(BVExtractOp, BVInsertOp.getInsertValue())
        else:
          # Cannot do much with this extract op
          BVInsertIsNotDeletable.add(BVInsertOp)
          continue
      elif isinstance(BVExtractOp.getLowIndex(), RoseOperation) \
        and isinstance(BVInsertOp.getLowIndex(), RoseOperation):
        if BVExtractOp.getLowIndex().isSameAs(BVInsertOp.getLowIndex()):
          # Remove the bvextract
          RemoveBVExtractOps(BVExtractOp, BVInsertOp.getInsertValue())
        else:
          # Cannot do much with this extract op
          BVInsertIsNotDeletable.add(BVInsertOp)
          continue
      else:
        # Cannot do much with this extract op
        BVInsertIsNotDeletable.add(BVInsertOp)
        continue
    
    # Remove the bvinsert op from the block if we are done with all its uses
    if BVInsertOp not in BVInsertIsNotDeletable:
      # Remove the bvinsert op
      Lowindex = BVInsertOp.getLowIndex()
      HighIndex = BVInsertOp.getHighIndex()
      Block.eraseOperation(BVInsertOp)
      # Remove indexing ops
      Worklist = [Lowindex, HighIndex]
      while len(Worklist) != 0:
        Operation = Worklist.pop()
        if Block.getParent().getNumUsersOf(Operation) == 0:
          Block.eraseOperation(Operation)


def RunReg2Reg(Function : RoseFunction):
  print("RUN REG 2 REG ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run reg2reg on the given function
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    PerformReg2RegOnBlock(Block)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunReg2Reg(Function)
  print("\n\n\n\n\n")
  Function.print()

