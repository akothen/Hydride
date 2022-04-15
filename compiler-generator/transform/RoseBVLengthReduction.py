#############################################################
#
# This pass reduces length of relevant bitvector registers.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *
from RoseUtilities import *


def RunBVLengthReductionOnFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN BV LENGTH REDUCTION ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  assert isinstance(Function, RoseFunction)
  # Check if the return value is coming from the extract op.
  ReturnVal = Function.getReturnValue()
  print("ReturnVal:")
  ReturnVal.print()
  if isinstance(ReturnVal, RoseBVExtractSliceOp):
    print("ReturnVal.getInputBitVector():")
    ReturnVal.getInputBitVector().print()
    Block = ReturnVal.getParent()
    if ReturnVal.getInputBitVector().getType().getBitwidth() == ReturnVal.getType().getBitwidth():
      # Replace the return value with the input bitvector in the return op
      assert ReturnVal.getNumUsers() == 1
      ReturnVal.replaceUsesWith(ReturnVal.getInputBitVector())
      Function.setRetVal(ReturnVal.getInputBitVector())
      # Just remove this extract op
      Block.eraseOperation(ReturnVal)
    elif not isinstance(ReturnVal.getInputBitVector(), RoseOperation):
      # Get all the uses of the input vector of the return value
      Users = Function.getUsersOf(ReturnVal.getInputBitVector())
      NewReturnValue = RoseValue.create(Context.genName(), ReturnVal.getType())
      print("NewReturnValue:")
      NewReturnValue.print()
      # Replace all the return value input bitvectors with the new one.
      for User in Users:
        print("USER:")
        User.print()
        print("ReturnVal.getInputBitVector():")
        ReturnVal.getInputBitVector().print()
        Index = User.getIndexForOperand(ReturnVal.getInputBitVector())
        assert isinstance(Index, int)
        User.setOperand(Index, NewReturnValue)
        print("NEW USER:")
        User.print()
      # Just remove this extract op
      assert ReturnVal.getNumUsers() == 1
      Function.print()
      print("--ReturnVal:")
      ReturnVal.print()
      ReturnVal.replaceUsesWith(NewReturnValue)
      Function.setRetVal(NewReturnValue)
      print("---++++FUNCTION:")
      Function.print()
      Block.print()
      Block.eraseOperation(ReturnVal)
      print("BLOCK:")
      Block.print()
  
  # Look for child function
  for Abstraction in Function:
    print("Abstraction in function:")
    Abstraction.print()
    # Run the pass on the nested function
    if isinstance(Abstraction, RoseFunction):
      RunBVLengthReductionOnFunction(Abstraction, Context.getContextOfChildFunction(Abstraction))


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunBVLengthReductionOnFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()




