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


def RunDCEOnBlock(Block : RoseBlock):
  print("RUN DCE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Gather all the ops in this block
  OpList = list()
  for Operation in Block:
    OpList.append(Operation)
  # Iterate the list of operations in reverse order
  OpList.reverse()
  for Op in OpList:
    # If the Op has no uses, remove it!
    if len(Op.getUsers()) == 0:
      Block.eraseOperation(Op)


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



