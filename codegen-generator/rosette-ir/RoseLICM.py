#############################################################
#
# This pass performs LICM.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseMatrixOperations import *
from RoseContext import *
from RoseUtilities import *


def IsindependentInLoop(Op : RoseOperation, Loop : RoseForLoop, IndependentOps : list):
  for Operand in Op.getOperands():
    if isinstance(Operand, RoseOperation):
      if Operand in IndependentOps:
        continue
      IndepenentOperand = True
      Parent = Op.getParent()
      while not isinstance(Parent, RoseUndefRegion):
        if Parent == Loop:
          IndepenentOperand = False
          break
        Parent = Parent.getParent()
      if IndepenentOperand == True:
        continue
      if IsindependentInLoop(Operand, Loop, IndependentOps) == False:
        return False
    else:
      if Operand == Loop.getIterator():
        return False
  return True
      

def RunLICMOnLoop(Loop : RoseForLoop):
  print("OLD LOOP:")
  Loop.print()
  LoopList = Loop.getRegionsOfType(RoseForLoop)
  for SubLoop in LoopList:
    RunLICMOnLoop(SubLoop)
  
  # Get all the loops that can be pushed out
  BlockList = Loop.getRegionsOfType(RoseBlock, 0)
  IndependentOps = list()
  for Block in BlockList:
    for Op in Block:
      #if isinstance(Op, (RoseBitVectorOp, RoseMatrixOp)):
      #  continue
      if IsindependentInLoop(Op, Loop, IndependentOps) == True:
        IndependentOps.append(Op)
  print("Len(IndependentOps):")
  print(len(IndependentOps))
  
  # Hoist independent ops out of the loop
  Preheader = Loop.getPreheader()
  if isinstance(Preheader, RoseUndefRegion):
    Preheader = RoseBlock.create()
    Key = Loop.getParent().getKeyForChild(Loop)
    Index = Loop.getParent().getPosOfChild(Loop, Key)
    Loop.getParent().addRegionBefore(Index, Preheader)
  else:
    assert isinstance(Preheader, RoseBlock)
  for Op in IndependentOps:
    Block = Op.getParent()
    Block.removeOperation(Op)
    if Block.isEmpty():
      Block.getParent().eraseChild(Block)
    Preheader.addOperation(Op)
    
  print("AFTER LOOP:")
  Loop.print()
    

def RunLICM(Function: RoseFunction, Context: RoseContext):
  print("BEFORE LICM:")
  Function.print()
  LoopList = Function.getRegionsOfType(RoseForLoop, 0)
  for Loop in LoopList:
    RunLICMOnLoop(Loop)
  for Abstraction in Function:
    # Run the pass on the nested function
    if isinstance(Abstraction, RoseFunction):
      RunLICM(Abstraction, Context.getContextOfChildFunction(Abstraction))


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
  RunLICM(Function, Context)
  print("\n\n\n\n\n")
  print("AFTER LICM:")
  Function.print()

