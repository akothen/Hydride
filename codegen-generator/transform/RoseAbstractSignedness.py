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
    if isinstance(Op, RoseBVSdivOp):
      NewOp = RoseBVGeneralDivOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUdivOp):
      NewOp = RoseBVGeneralDivOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSremOp):
      NewOp = RoseBVGeneralRemOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUremOp):
      NewOp = RoseBVGeneralRemOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSmaxOp):
      NewOp = RoseBVGeneralMaxOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUmaxOp):
      NewOp = RoseBVGeneralMaxOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSminOp):
      NewOp = RoseBVGeneralMinOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUminOp):
      NewOp = RoseBVGeneralMinOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperands())
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVULTOp):
      NewOp = RoseBVGeneralLTOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSLTOp):
      NewOp = RoseBVGeneralLTOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVULEOp):
      NewOp = RoseBVGeneralLEOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSLEOp):
      NewOp = RoseBVGeneralLEOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUGTOp):
      NewOp = RoseBVGeneralGTOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSGTOp):
      NewOp = RoseBVGeneralGTOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVUGEOp):
      NewOp = RoseBVGeneralGEOp.createUnsigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
    if isinstance(Op, RoseBVSGEOp):
      NewOp = RoseBVGeneralGEOp.createSigned(Context.genName(Op.getName() + ".ab"), \
                  Op.getOperand(0), Op.getOperand(1))
      Op.replaceUsesWith(NewOp)
      Block.addOperationBefore(NewOp, Op)
      Block.eraseOperation(Op)
      continue
  return


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


