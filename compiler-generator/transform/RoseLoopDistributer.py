#############################################################
#
# This is the function loop distribution pass for Rose IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *
from RoseUtilities import *


def RunLoopDistributerOnBlock(Block : RoseBlock, Context : RoseContext):
  InsertOps = list()
  for Op in Block:
    if isinstance(Op, RoseBVInsertSliceOp):
      InsertOps.append(Op)
  if len(InsertOps) < 2:
    return

  for Op in InsertOps[:-1]:
    ParentBlock = Op.getParent()
    ParentBlock.splitAt(ParentBlock.getPosOfOperation(Op) + 1)
    Loop = RoseForLoop.create(Context.genName("%" + "iterator"), 0, \
                       Op.getOutputBitwidth(), Op.getOutputBitwidth())
    for Operation in ParentBlock:
      Loop.addAbstraction(Operation.clone())
    ParentRegion = ParentBlock.getParent()
    ParentKey = ParentRegion.getKeyForChild(ParentBlock)
    Index = ParentRegion.getPosOfChild(ParentBlock, ParentKey)
    ParentRegion.addRegionBefore(Index, Loop, ParentKey)
    ParentRegion.eraseChild(ParentBlock, ParentKey)


def RunLoopDistributerOnFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN LOOP DISTRIBUTER ON FUNCTION")
  print("FUNCTION:")
  Function.print()

  BlockList = list()
  BlockList.extend(Function.getRegionsOfType(RoseBlock))
  for Block in BlockList:
    RunLoopDistributerOnBlock(Block, Context)


# Runs loop distribution pass
def Run(Function : RoseFunction, Context : RoseContext):
  print("RUN FUNCTION INLINER")
  RunLoopDistributerOnFunction(Function, Context)
  Function.print()


