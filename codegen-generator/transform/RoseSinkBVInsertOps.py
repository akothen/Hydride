#############################################################
#
# This pass sinks overlapping bvinserts into cond regions.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *
from RoseUtilities import *


def RunBVInsertOpSinkInFunction(Function: RoseFunction, Context: RoseContext):
  print("RUN BV INSERT OP SINK ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  print(Function.getRegionID())
  Context.print()
  assert isinstance(Function, RoseFunction)
  # Get pre-cond-region headers for all cond region
  CondRegions = Function.getRegionsOfType(RoseCond)
  for CondRegion in CondRegions:
      # Get preheaders
      ConditionBlocksToCondRegion = dict()
      for Condition in CondRegion.getConditions():
          if isinstance(Condition, RoseOperation):
              if Condition.getParent() not in ConditionBlocksToCondRegion:
                  ConditionBlocksToCondRegion[Condition.getParent()] = CondRegion
      # If a preheader has a bvinsert and it overlaps with bvinserts
      # in cond regions.
      for ConditionBlock, CondRegion in ConditionBlocksToCondRegion.items():
          for Op in ConditionBlock:
              if isinstance(Op, RoseBVInsertSliceOp):
                  # Look for bvinserts in cond regions.
                  BVInsertOps = list()
                  for Key in CondRegion.getKeys():
                      for SubRegion in CondRegion.getChildren(Key):
                          if isinstance(SubRegion, RoseBlock):
                              # There must be only one bvinsert
                              BVInsertOp = RoseUndefValue()
                              for CheckOp in SubRegion:
                                  if isinstance(CheckOp, RoseBVInsertSliceOp):
                                      assert isinstance(
                                          BVInsertOp, RoseUndefValue)
                                      BVInsertOp = CheckOp
                              if isinstance(BVInsertOp, RoseUndefValue):
                                  continue
                              BVInsertOps.append(BVInsertOp)
                  # If the bitslices overlap with all the bvinserts in the cond regions
                  SinkOp = True
                  for BVInsertOp in BVInsertOps:
                      if Op.getInputBitVector() != BVInsertOp.getInputBitVector():
                          SinkOp = False
                          break
                      if DoBitSlicesOverlap(Op, BVInsertOp) == False:
                          SinkOp = False
                          break
                  if SinkOp == True:
                      for BVInsertOp in BVInsertOps:
                          assert isinstance(Op.getLowIndex(), RoseConstant) \
                              and isinstance(Op.getHighIndex(), RoseConstant)
                          assert isinstance(BVInsertOp.getLowIndex(), RoseConstant) \
                              and isinstance(BVInsertOp.getHighIndex(), RoseConstant)
                          assert Op.getInsertValue() != BVInsertOp.getInsertValue()
                          InputBitvector = Op.getInputBitVector()
                          if Op.getLowIndex().getValue() >= BVInsertOp.getLowIndex().getValue():
                              if Op.getHighIndex().getValue() > BVInsertOp.getHighIndex().getValue():
                                  # Generate the new bvinsert
                                  LowIndex = RoseConstant.create(BVInsertOp.getHighIndex().getValue()
                                                                  - Op.getLowIndex().getValue() + 1, Op.getLowIndex().getType())
                                  HighIndex = RoseConstant.create(Op.getHighIndex().getValue() - Op.getLowIndex().getValue(),
                                                                  Op.getHighIndex().getType())
                                  Bitwidth = RoseConstant.create(Op.getHighIndex().getValue()
                                                                  - BVInsertOp.getHighIndex().getValue(), Op.getLowIndex().getType())
                                  NewBVExtractOp = RoseBVExtractSliceOp.create(Context.genName(Op.getInsertValue().getName()),
                                                                                Op.getInsertValue(), LowIndex, HighIndex, Bitwidth)
                                  NewOpLowIndex = RoseConstant.create(BVInsertOp.getHighIndex().getValue() + 1,
                                                                      Op.getHighIndex().getType())
                                  NewBVInsertOp = RoseBVInsertSliceOp.create(NewBVExtractOp, InputBitvector,
                                                                              NewOpLowIndex, Op.getHighIndex(), Bitwidth)
                                  print("+NEW BVINSERT OP:")
                                  NewBVInsertOp.print()
                                  BVInsertOp.getParent().addOperationAfter(NewBVInsertOp, BVInsertOp)
                                  BVInsertOp.getParent().addOperationAfter(NewBVExtractOp, BVInsertOp)
                          else:
                              if Op.getHighIndex().getValue() <= BVInsertOp.getHighIndex().getValue():
                                  # Generate the new bvinsert
                                  LowIndex = RoseConstant.create(
                                      0, Op.getLowIndex().getType())
                                  HighIndex = RoseConstant.create(BVInsertOp.getLowIndex().getValue()
                                                                  - Op.getLowIndex().getValue() - 1, Op.getHighIndex().getType())
                                  Bitwidth = RoseConstant.create(BVInsertOp.getLowIndex().getValue()
                                                                  - Op.getLowIndex().getValue(), Op.getLowIndex().getType())
                                  NewBVExtractOp = RoseBVExtractSliceOp.create(Context.genName(Op.getInsertValue().getName()),
                                                                                Op.getInsertValue(), LowIndex, HighIndex, Bitwidth)
                                  NewOpHighIndex = RoseConstant.create(BVInsertOp.getLowIndex().getValue() - 1,
                                                                        Op.getHighIndex().getType())
                                  NewBVInsertOp = RoseBVInsertSliceOp.create(NewBVExtractOp, InputBitvector,
                                                                              Op.getLowIndex(), NewOpHighIndex, Bitwidth)
                                  print("+++NEW BVINSERT OP:")
                                  NewBVInsertOp.print()
                                  BVInsertOp.getParent().addOperationBefore(NewBVExtractOp, BVInsertOp)
                                  BVInsertOp.getParent().addOperationBefore(NewBVInsertOp, BVInsertOp)
                              else:
                                  # Generate the new bvinserts
                                  LowIndex1 = RoseConstant.create(
                                      0, Op.getLowIndex().getType())
                                  HighIndex1 = RoseConstant.create(BVInsertOp.getLowIndex().getValue()
                                                                    - Op.getLowIndex().getValue() - 1, Op.getHighIndex().getType())
                                  Bitwidth1 = RoseConstant.create(BVInsertOp.getLowIndex().getValue()
                                                                  - Op.getLowIndex().getValue(), Op.getLowIndex().getType())
                                  NewBVExtractOp1 = RoseBVExtractSliceOp.create(Context.genName(Op.getInsertValue().getName()),
                                                                                Op.getInsertValue(), LowIndex1, HighIndex1, Bitwidth1)
                                  NewOpHighIndex = RoseConstant.create(BVInsertOp.getLowIndex().getValue() - 1,
                                                                        Op.getHighIndex().getType())
                                  NewBVInsertOp1 = RoseBVInsertSliceOp.create(NewBVExtractOp1, InputBitvector,
                                                                              Op.getLowIndex(), NewOpHighIndex, Bitwidth1)
                                  print("+++++NEW BVINSERT OP1:")
                                  NewBVInsertOp1.print()
                                  BVInsertOp.getParent().addOperationBefore(NewBVExtractOp1, BVInsertOp)
                                  BVInsertOp.getParent().addOperationBefore(NewBVInsertOp1, BVInsertOp)
                                  LowIndex2 = RoseConstant.create(BVInsertOp.getHighIndex().getValue()
                                                                  - Op.getLowIndex().getValue() + 1, Op.getLowIndex().getType())
                                  HighIndex2 = RoseConstant.create(Op.getOutputBitwidth() - Op.getLowIndex().getValue() - 1,
                                                                    Op.getHighIndex().getType())
                                  Bitwidth2 = RoseConstant.create(Op.getOutputBitwidth() - BVInsertOp.getLowIndex().getValue()
                                                                  + Op.getLowIndex().getValue() - BVInsertOp.getOutputBitwidth(),
                                                                  Op.getLowIndex().getType())
                                  NewBVExtractOp2 = RoseBVExtractSliceOp.create(Context.genName(Op.getInsertValue().getName()),
                                                                                Op.getInsertValue(), LowIndex2, HighIndex2, Bitwidth2)
                                  NewOpLowIndex = RoseConstant.create(BVInsertOp.getHighIndex().getValue() + 1,
                                                                      Op.getHighIndex().getType())
                                  NewBVInsertOp2 = RoseBVInsertSliceOp.create(NewBVExtractOp2, InputBitvector,
                                                                              NewOpLowIndex, Op.getHighIndex(), Bitwidth2)
                                  print("+++++NEW BVINSERT OP2:")
                                  NewBVInsertOp2.print()
                                  BVInsertOp.getParent().addOperationAfter(NewBVInsertOp2, BVInsertOp)
                                  BVInsertOp.getParent().addOperationAfter(NewBVExtractOp2, BVInsertOp)
                      print("OPERATION TO BE REMOVED:")
                      Op.print()
                      ConditionBlock.eraseOperation(Op)


def RunBVInsertOpSink(Function: RoseFunction, Context: RoseContext):
  RunBVInsertOpSinkInFunction(Function, Context)
  for Abstraction in Function:
    if isinstance(Abstraction, RoseFunction):
      print("Abstraction:")
      Abstraction.print()
      print(Abstraction.getRegionID())
      Context.print()
      RunBVInsertOpSink(Abstraction, Context.getContextOfChildFunction(Abstraction))


# Runs a transformation
def Run(Function: RoseFunction, Context: RoseContext):
  RunBVInsertOpSink(Function, Context)
  print("\n\n\n\n\n")
  Function.print()
