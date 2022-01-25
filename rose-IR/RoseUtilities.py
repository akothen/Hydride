###################################################################
#
# Some utility functions that could be useful for transformations
# and lowering/translation passes.
#
###################################################################


from operator import truediv
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def ComputeBitSliceWidth(Low : RoseValue, High : RoseValue, TotalBitwidth : int = None) -> int:
  # Strip any casts and size extensions away
  if isinstance(Low, RoseCastOp) \
  or isinstance(Low, RoseBVSignExtendOp) \
  or isinstance(Low, RoseBVZeroExtendOp):
    Low = Low.getOperand(0)
  if isinstance(High, RoseCastOp) \
  or isinstance(High, RoseBVSignExtendOp) \
  or isinstance(High, RoseBVZeroExtendOp):
    High = High.getOperand(0)
  
  # Handle easiest case first
  if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
    if TotalBitwidth != None:
      assert Low.getValue() >= 0 and Low.getValue() < TotalBitwidth
      assert High.getValue() >= 0 and High.getValue() < TotalBitwidth
    assert High.getValue() >= Low.getValue()
    return (High.getValue() - Low.getValue() + 1)
  
  # Either both high and low are constants or both are variables/operations.
  # Other cases are not taken into account.
  assert not isinstance(Low, RoseConstant)
  assert not isinstance(High, RoseConstant)

  # Just handle one _very_ common case where high = i + some_constant
  # Strip away any cast first
  assert isinstance(High, RoseAddOp)
  if isinstance(High.getOperand(0), RoseConstant):
    HighIndexValue = High.getOperand(1)
    ConstantHighIndex = High.getOperand(0)
  else:
    assert isinstance(High.getOperand(1), RoseConstant)
    HighIndexValue = High.getOperand(0)
    ConstantHighIndex = High.getOperand(1)
  # Strip any casts away
  if isinstance(HighIndexValue, RoseCastOp) \
  or isinstance(HighIndexValue, RoseBVSignExtendOp) \
  or isinstance(HighIndexValue, RoseBVZeroExtendOp):
    HighIndexValue = HighIndexValue.getOperand(0)
  # High index is expressed in terms of low index
  # TODO: Make this more general.
  print("HighIndexValue:")
  HighIndexValue.print()
  HighIndexValue.getType().print()
  print("Low:")
  Low.print()
  Low.getType().print()

  # Just handle one _very_ common case where low = i
  assert isinstance(HighIndexValue, RoseOperation)
  assert isinstance(Low, RoseOperation)
  if Low.isSameAs(HighIndexValue):
    return (ConstantHighIndex.getValue() + 1)
  
  # Now handle a rare case where low = i + some_constant
  assert isinstance(Low, RoseAddOp)
  if isinstance(Low.getOperand(0), RoseConstant):
    LowIndexValue = Low.getOperand(1)
    ConstantLowIndex = Low.getOperand(0)
  else:
    assert isinstance(Low.getOperand(1), RoseConstant)
    LowIndexValue = Low.getOperand(0)
    ConstantLowIndex = Low.getOperand(1)
  # Strip any casts away
  if isinstance(LowIndexValue, RoseCastOp) \
  or isinstance(LowIndexValue, RoseBVSignExtendOp) \
  or isinstance(LowIndexValue, RoseBVZeroExtendOp):
    LowIndexValue = LowIndexValue.getOperand(0)
  assert LowIndexValue.isSameAs(HighIndexValue)
  assert ConstantHighIndex.getValue() >= ConstantLowIndex.getValue()
  return (ConstantHighIndex.getValue() - ConstantLowIndex.getValue() + 1)


# Assumption here is that BVOp1 accesses lower indices than BVOp2
def AreBitSlicesContiguous(BVOp1 : RoseBitVectorOp, BVOp2 : RoseBitVectorOp) -> bool:
  # Some sanity checks
  assert isinstance(BVOp1, RoseBVInsertSliceOp) or isinstance(BVOp1, RoseBVExtractSliceOp)
  assert isinstance(BVOp2, RoseBVInsertSliceOp) or isinstance(BVOp2, RoseBVExtractSliceOp)
  assert isinstance(BVOp1.getOutputBitwidth() == BVOp2.getOutputBitwidth())
  Low1 = BVOp1.getLowIndex()
  Low2 = BVOp2.getLowIndex()
  # Expected difference between the low indices of the bitvectos
  Bitwidth = BVOp1.getOutputBitwidth()

  # Function used to strip off casts, and sign and zero extensions
  def StripCastsAndSizeExtensiosn(X : RoseOperation):
    if isinstance(X, RoseCastOp) \
    or isinstance(X, RoseBVSignExtendOp) \
    or isinstance(X, RoseBVZeroExtendOp):
      return X.getOperand(0)
    return X

  # Strip any casts and size extensions away
  Low1 = StripCastsAndSizeExtensiosn(Low1)
  Low2 = StripCastsAndSizeExtensiosn(Low2)
  
  # Handle easiest case first
  if isinstance(Low1, RoseConstant) and isinstance(Low2, RoseConstant):
    if (Low2.getValue() - Low1.getValue()) == Bitwidth:
      return True
    return False
  
  # Either both low indices are constants or both are variables/operations.
  # Other cases are not taken into account.
  assert not isinstance(Low1, RoseConstant)
  assert not isinstance(Low2, RoseConstant)

  # Just handle one _very_ common case where low2 = i + some_constant
  # Strip away any cast first
  assert isinstance(Low2, RoseAddOp)
  if isinstance(Low2.getOperand(0), RoseConstant):
    Low2IndexValue = Low2.getOperand(1)
    ConstantLow2Index = Low2.getOperand(0)
  else:
    assert isinstance(Low2.getOperand(1), RoseConstant)
    Low2IndexValue = Low2.getOperand(0)
    ConstantLow2Index = Low2.getOperand(1)
  # Strip any casts away
  Low2IndexValue = StripCastsAndSizeExtensiosn(Low2IndexValue)
  # High index is expressed in terms of low index
  # TODO: Make this more general.
  print("Low2IndexValue:")
  Low2IndexValue.print()
  Low2IndexValue.getType().print()
  print("Low1:")
  Low1.print()
  Low1.getType().print()

  # Just handle one _very_ common case where low1 = i
  assert isinstance(Low2IndexValue, RoseOperation)
  assert isinstance(Low1, RoseOperation)
  if Low1.isSameAs(Low2IndexValue):
    if ConstantLow2Index.getValue() == Bitwidth:
      return True
    return False
  
  # Now handle a rare case where low1 = i + some_constant
  assert isinstance(Low1, RoseAddOp)
  if isinstance(Low1.getOperand(0), RoseConstant):
    Low1IndexValue = Low1.getOperand(1)
    ConstantLow1Index = Low1.getOperand(0)
  else:
    assert isinstance(Low1.getOperand(1), RoseConstant)
    Low1IndexValue = Low1.getOperand(0)
    ConstantLow1Index = Low1.getOperand(1)
  # Strip any casts away
  Low1IndexValue = StripCastsAndSizeExtensiosn(Low1IndexValue)
  assert Low1IndexValue.isSameAs(Low2IndexValue)
  assert ConstantLow2Index.getValue() >= ConstantLow1Index.getValue()
  if (ConstantLow2Index.getValue() - ConstantLow1Index.getValue()) == Bitwidth:
    return True
  return False



