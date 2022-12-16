#############################################################
#
# This is the loop bounds scaling pass for Rose IR.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseBitVectorOperation import *
from RoseBitVectorOperations import *
from RoseOperations import *
from RoseContext import *
from RoseUtilities import *



def ScaleBoundsOfLoop(Loop : RoseForLoop, Context : RoseContext):
  # The loop bounds and step must be constants
  if not isinstance(Loop.getStartIndex(), RoseConstant):
    return False
  if not isinstance(Loop.getEndIndex(), RoseConstant):
    return False
  if not isinstance(Loop.getStep(), RoseConstant):
    return False
  Function = Loop.getFunction()
  Users = Function.getUsersOf(Loop.getIterator())
  print("len(Users):")
  print(len(Users))
  if len(Users) != 1:
    return False
  Op = Users[0]
  Op.print()
  if isinstance(Op, RoseMulOp) and len(Op.getOperands()) == 2:
    if isinstance(Op.getOperand(0), RoseConstant):
      Loop.setStartIndex(Op.getOperand(0).getValue() * Loop.getStartIndex().getValue())
      Loop.setEndIndex(Op.getOperand(0).getValue() * Loop.getEndIndex().getValue())
      Loop.setStep(Op.getOperand(0).getValue() * Loop.getStep().getValue())
    elif isinstance(Op.getOperand(1), RoseConstant):
      Loop.setStartIndex(Op.getOperand(1).getValue() * Loop.getStartIndex().getValue())
      Loop.setEndIndex(Op.getOperand(1).getValue() * Loop.getEndIndex().getValue())
      Loop.setStep(Op.getOperand(1).getValue() * Loop.getStep().getValue())
    Loop.setIteratorName(Context.genName(Loop.getIterator().getName() + ".new"))
    Loop.replaceUsesWith(Op, Loop.getIterator())
    Op.getParent().eraseOperation(Op)
    return True
  if isinstance(Op, RoseAddOp) and len(Op.getOperands()) == 2:
    if isinstance(Op.getOperand(0), RoseConstant):
      Loop.setStartIndex(Op.getOperand(0).getValue() + Loop.getStartIndex().getValue())
      Loop.setEndIndex(Op.getOperand(0).getValue() + Loop.getEndIndex().getValue())
      Loop.setStep(Op.getOperand(0).getValue() + Loop.getStep().getValue())
    elif isinstance(Op.getOperand(1), RoseConstant):
      Loop.setStartIndex(Op.getOperand(1).getValue() + Loop.getStartIndex().getValue())
      Loop.setEndIndex(Op.getOperand(1).getValue() + Loop.getEndIndex().getValue())
      Loop.setStep(Op.getOperand(1).getValue() + Loop.getStep().getValue())
    Loop.setIteratorName(Context.genName(Loop.getIterator().getName() + ".new"))
    Loop.replaceUsesWith(Op, Loop.getIterator())
    Op.getParent().eraseOperation(Op)
    return True
  return False
  

def RunLoopBoundsScalerOnFunction(Function : RoseFunction, Context : RoseContext):
  Function.print()
  LoopList = Function.getRegionsOfType(RoseForLoop)
  for Loop in LoopList:
    while ScaleBoundsOfLoop(Loop, Context) == True:
      continue

# Runs loop bounds scalinng pass
def Run(Function : RoseFunction, Context : RoseContext):
  print("RUN LOOP BOUNDS SCALER")
  RunLoopBoundsScalerOnFunction(Function, Context)
  Function.print()


