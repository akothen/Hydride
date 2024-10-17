##################################################################
#
# This pass makes sure that the function ends with a bv insert op.
#
##################################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


def RunAddBVInsertOpInFunction(Function: RoseFunction, Context: RoseContext):
    print("RUN BV INSERT AT END OF FUNCTION")
    print("FUNCTION:")
    Function.print()
    RetValue = Function.getReturnValue()
    if not isinstance(RetValue.getType(), RoseBitVectorType):
      return
    BlockList = Function.getRegionsOfType(RoseBlock)
    RetOp = None
    for Block in reversed(BlockList):
      print("BLOCK:")
      Block.print()
      if Block.getFunction() != Function:
        continue
      for Op in Block.getOperations():
        # If a bitvector insert of a user as an input vector,
        # we cannot apply this transformation.
        if isinstance(Op, RoseBVInsertSliceOp):
          if (Op.getInputBitVector() == RetValue):
            return
        if isinstance(Op, RoseReturnOp):
          RetOp = Op
    # Need to insert a bvinsert op
    NewRetValue = RoseValue.create(Context.genName("%" + "dst"), RetValue.getType())
    Low = RoseConstant.create(0, RoseIntegerType.create(32))
    High = RoseConstant.create(RetValue.getType().getBitwidth() - 1, \
                                RoseIntegerType.create(32))
    Bitwidth = RoseConstant.create(RetValue.getType().getBitwidth(), \
                                RoseIntegerType.create(32))
    InsertOp = RoseBVInsertSliceOp.create(RetValue, NewRetValue, Low, High, Bitwidth)
    RetOp.getParent().addOperationBefore(InsertOp, RetOp)
    RetOp.setOperand(0, NewRetValue)
    Function.setRetVal(NewRetValue)


def RunAddBVInsertOp(Function: RoseFunction, Context: RoseContext):
  RunAddBVInsertOpInFunction(Function, Context)
  for Abstraction in Function:
    if isinstance(Abstraction, RoseFunction):
      RunAddBVInsertOp(Abstraction, Context.getContextOfChildFunction(Abstraction))


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
    RunAddBVInsertOp(Function, Context)
    print("\n\n\n\n\n")
    Function.print()
