#############################################################
#
# This pass modifies the saturation ops and related ops, 
# and size extending ops to sign agnostic instructions.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


def RunAbstractSignednessOnBlock(Block : RoseBlock, Context : RoseContext):
  OpList = list()
  OpList.extend(Block.getOperations())
  for Op in OpList:
    if isinstance(Op, RoseBVZeroExtendOp):
      FalseVal = RoseConstant.create(0, RoseBooleanType.create())
      NewOp = RoseBVSizeExensionOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getInputBitVector(), Op.getExtensionSize(), FalseVal)
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSignExtendOp):
      TrueVal = RoseConstant.create(1, RoseBooleanType.create())
      NewOp = RoseBVSizeExensionOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getInputBitVector(), Op.getExtensionSize(), TrueVal)
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUSaturateOp):
      FalseVal = RoseConstant.create(0, RoseBooleanType.create())
      NewOp = RoseBVGeneralSaturationOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getInputBitVector(), Op.getSaturationSize(), FalseVal)
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSSaturateOp):
      TrueVal = RoseConstant.create(1, RoseBooleanType.create())
      NewOp = RoseBVGeneralSaturationOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getInputBitVector(), Op.getSaturationSize(), TrueVal)
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVAddOp):
      if Op.noSignedWrapAllowed() == True:
        NewOp = RoseBVGeneralAddOp.createNSW(Context.genName(Op.getName() + ".ab"), \
                    Op.getOperands())
        Op.replaceUsesWith(NewOp)
        Block.addOperationBefore(NewOp, Op)
        Block.eraseOperation(Op)
        continue
      if Op.noUnsignedWrapAllowed() == True:
        NewOp = RoseBVGeneralAddOp.createNUW(Context.genName(Op.getName() + ".ab"), \
                    Op.getOperands())
        Op.replaceUsesWith(NewOp)
        Block.addOperationBefore(NewOp, Op)
        Block.eraseOperation(Op)
        continue
      assert Op.wrappingAllowed() == True
      NewOp = RoseBVGeneralAddOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSubOp):
      if Op.noSignedWrapAllowed() == True:
        NewOp = RoseBVGeneralSubOp.createNSW(Context.genName(Op.getName() + ".ab"), \
                    Op.getOperands())
        Op.replaceUsesWith(NewOp)
        Block.addOperationBefore(NewOp, Op)
        Block.eraseOperation(Op)
        continue
      if Op.noUnsignedWrapAllowed() == True:
        NewOp = RoseBVGeneralSubOp.createNUW(Context.genName(Op.getName() + ".ab"), \
                    Op.getOperands())
        Op.replaceUsesWith(NewOp)
        Block.addOperationBefore(NewOp, Op)
        Block.eraseOperation(Op)
        continue
      assert Op.wrappingAllowed() == True
      NewOp = RoseBVGeneralSubOp.create(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    
      


def RunAbstractSignedness(Function : RoseFunction, Context : RoseContext):
  print("RUN ABSTRACT SIGNEDNESS ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run reg2reg on the given function
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    RunAbstractSignednessOnBlock(Block, Context)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunAbstractSignedness(Function, Context)
  print("\n\n\n\n\n")
  Function.print()

