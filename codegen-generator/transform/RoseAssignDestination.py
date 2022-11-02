#############################################################
#
# This pass makes sure that the function does not treat 
# function arguments as destination registers.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *



def RunAssignDestination(Function : RoseFunction, Context : RoseContext):
  print("RUN ASSIGN DESTINATIION ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run reg2reg on the given function
  BlockList = Function.getRegionsOfType(RoseBlock)
  BVInsertOpsToBeChanged = set()
  PaddingOpsToBeChanged = set()
  ReturnOpsToBeChanged = set()
  for Block in BlockList:
    for Op in Block:
      if isinstance(Op, RoseBVInsertSliceOp):
        if isinstance(Op.getInputBitVector(), RoseArgument):
          BVInsertOpsToBeChanged.add(Op)
        continue
      if isinstance(Op, RoseBVPadHighBitsOp):
        if isinstance(Op.getOperand(0), RoseArgument):
          PaddingOpsToBeChanged.add(Op)
        continue
      if isinstance(Op, RoseReturnOp):
        if isinstance(Op.getReturnedValue(), RoseArgument):
          ReturnOpsToBeChanged.add(Op)
        continue
  
  if len(BVInsertOpsToBeChanged) != 0:
    ReturnVal = Function.getReturnValue()
    NewReturnValue = RoseValue.create(Context.genName("%" + "dst"), ReturnVal.getType())
    for BVInsertOp in BVInsertOpsToBeChanged:
      assert isinstance(BVInsertOp, RoseBVInsertSliceOp)
      BVInsertOp.setOperand(1, NewReturnValue)
    for Op in PaddingOpsToBeChanged:
      assert isinstance(Op, RoseBVPadHighBitsOp)
      Op.setOperand(0, NewReturnValue)
    for Op in ReturnOpsToBeChanged:
      assert isinstance(Op, RoseReturnOp)
      Op.setOperand(0, NewReturnValue)
    Function.setRetVal(NewReturnValue)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunAssignDestination(Function, Context)
  print("\n\n\n\n\n")
  Function.print()

