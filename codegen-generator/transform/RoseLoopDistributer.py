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


# Loop distrubution is legal if multiple bvinserts in a single block
# are not inserting to contiguous bit slices.
def IsLoopDistrbutionLegal(InsertOps : list):
  if len(InsertOps) < 2:
    return False
  for Index, _ in enumerate(InsertOps[:-1]):
    if AreBitSlicesContiguous(InsertOps[Index], InsertOps[Index + 1]):
      return False
  return True


def RunLoopDistributerOnBlock(Block : RoseBlock, Context : RoseContext):
  # If the block is not inside a loop, we cannot distrbute the loop.
  if not isinstance(Block.getParent(), RoseForLoop):
    return
  
  Function = Block.getFunction()
  InsertOps = list()
  for Op in Block:
    if isinstance(Op, RoseBVInsertSliceOp):
      InsertOps.append(Op)

  if IsLoopDistrbutionLegal(InsertOps) == False:
    return

  OuterLoop = Block.getParent()
  for Op in InsertOps:
    ParentBlock = Op.getParent()
    if Op != InsertOps[-1]:
      ParentBlock.splitAt(ParentBlock.getPosOfOperation(Op) + 1)
    Loop = RoseForLoop.create(Context.genName("%" + "iterator"), \
                      OuterLoop.getStartIndex().getValue(), \
                      OuterLoop.getEndIndex().getValue(), OuterLoop.getStep().getValue())
    for Operation in ParentBlock:
      NewOperation = Operation.clone()
      # Replace the uses of the iterator of the outerloop with the 
      # iterator of the newly generated loop.
      if NewOperation.usesValue(OuterLoop.getIterator()):
        NewOperation.replaceUsesWith(OuterLoop.getIterator(), Loop.getIterator())
      Loop.addAbstraction(NewOperation)       
    ParentKey = OuterLoop.getKeyForChild(ParentBlock)
    Index = OuterLoop.getPosOfChild(ParentBlock, ParentKey)
    OuterLoop.addRegionBefore(Index, Loop, ParentKey)
    OuterLoop.eraseChild(ParentBlock, ParentKey)

  # Remove the outer loop
  ParentRegion = OuterLoop.getParent()
  ParentKey = ParentRegion.getKeyForChild(OuterLoop)
  for Region in OuterLoop:
    Index = ParentRegion.getPosOfChild(OuterLoop, ParentKey)
    print("--INDEX:")
    print(Index)
    print("REGION:")
    Region.print()
    ParentRegion.addRegionBefore(Index, Region.clone(), ParentKey)
  print("FUNCTION++++:")
  Function.print()
  ParentRegion.eraseChild(OuterLoop, ParentKey)


def RunLoopDistributerOnFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN LOOP DISTRIBUTER ON FUNCTION")
  print("FUNCTION:")
  Function.print()

  BlockList = list()
  BlockList.extend(Function.getRegionsOfType(RoseBlock))
  for Block in BlockList:
    RunLoopDistributerOnBlock(Block, Context)
  
  print("NEW FUNCTION:")
  Function.print()


# Runs loop distribution pass
def Run(Function : RoseFunction, Context : RoseContext):
  print("RUN LOOP DISTRIBUTER")
  RunLoopDistributerOnFunction(Function, Context)
  Function.print()


