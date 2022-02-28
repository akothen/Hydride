###################################################################
#
# Some utility functions that could be useful for transformations
# and lowering/translation passes.
#
###################################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *


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



def GetInvariantsInBlock(Block : RoseBlock, Invariants = dict()):
  assert not isinstance(Block, RoseUndefRegion)
  # Iterate over the block in reverse order and see 
  # if indexing operations are iterator independent.
  IndexingOp = set()
  for Op in reversed(Block.getOperations()):
    # Skip call and cast ops
    if isinstance(Op, RoseCallOp) or isinstance(Op, RoseCastOp):
      continue
    # Sign extending ops are considered to contain invariants
    if Op.isSizeChangingOp():
      assert isinstance(Op, RoseBitVectorOp)
      # Since this op is an indexing op, we can safely ignore it
      if Op in IndexingOp:
        IndexingOp.add(Op.getInputBitVector())
        continue
      # This op can be an invariant if it is not
      # directly used in a bvinsert op.
      Invariants[Op] = [Op.getOperand(1)]
      continue
    if isinstance(Op, RoseBitVectorOp) and Op.isIndexingBVOp():
      IndexingOp.add(Op)
      Low = Op.getLowIndex()
      High = Op.getHighIndex()
      if isinstance(Low, RoseConstant):
        Invariants[Op] = [Op.getLowIndexPos()]
      else:
        IndexingOp.add(Low)
      if isinstance(High, RoseConstant):
        if Invariants.get(Op, []) == []:
          Invariants[Op] = [Op.getHighIndexPos()]
        else:
          Invariants[Op].append(Op.getHighIndexPos())
      else:
        IndexingOp.add(High)      
      continue
    if Op in IndexingOp:
      for Operand in Op.getOperands():
        if isinstance(Operand, RoseConstant):
          continue
        IndexingOp.add(Operand)
      continue
    for OperandIndex, Operand in enumerate(Op.getOperands()):
      if isinstance(Operand, RoseConstant):
        if Invariants.get(Op, []) == []:
          Invariants[Op] = [OperandIndex]
        else:
          Invariants[Op].append(OperandIndex)
  return Invariants


def GetInvariantsInRegion(Abstraction, Invariants = dict()):
  assert not isinstance(Abstraction, RoseUndefRegion)
  if isinstance(Abstraction, RoseBlock):
    return GetInvariantsInBlock(Abstraction, Invariants)
  # Now iterate over all regions and extract all the invariants
  for Region in Abstraction:
    if isinstance(Region, RoseForLoop) \
    or isinstance(Region, RoseFunction):
      Invariants = GetInvariantsInRegion(Region, Invariants)
      continue
    if isinstance(Region, RoseBlock):
      GetInvariantsInBlock(Region, Invariants)
  return Invariants


def CloneAndInsertOperation(Operation : RoseOperation, \
                            InsertBefore : RoseOperation, Context : RoseContext):
  # Both operation and insertion point must be in the same block
  assert Operation.getParent() == InsertBefore.getParent()

  # If the insertion point and operation are the same, there is nothing to do
  if Operation == InsertBefore:
    return Operation

  # Get the current position of the operation in the block
  ParentBlock = Operation.getParent()
  InsertionPoint = ParentBlock.getPosOfOperation(InsertBefore)

  if InsertionPoint > ParentBlock.getPosOfOperation(Operation):
    return Operation
  
  # Deal with case: InsertionPoint < ParentBlock.getPosOfOperation(Operation)
  # We need to get operands that are defined before InsertBefore point
  OperandList = []
  for Operand in Operation.getOperands():
    if not isinstance(Operand, RoseOperation):
      OperandList.append(Operand)
      continue
    NewOperand = CloneAndInsertOperation(Operand, InsertBefore, Context)
    OperandList.append(NewOperand)
  # Clone and replace the operands in the operation
  ClonedOperation = Operation.clone(Context.genName(Operation.getName() + ".clone."))
  ClonedOperation.replaceOperands(OperandList)
  # Insert the op to the IR
  ParentBlock.addOperationBefore(ClonedOperation, InsertBefore)
  return ClonedOperation


# Replaces the uses of an operation in the given region with a new clone of the
# operation with each block. This is optimization friendly.
# The new abstraction must be an operation.
def ReplaceUsesWithUniqueCopiesOf(Region, Abstraction : RoseValue, NewAbstraction : RoseOperation, \
                                  Context : RoseContext):
  assert not isinstance(Abstraction, RoseUndefValue) \
    and not isinstance(Abstraction, RoseConstant) \
    and not isinstance(Abstraction, RoseFunction)
  assert isinstance(Abstraction, RoseValue)
  assert isinstance(NewAbstraction, RoseOperation)
  assert Abstraction.getType() == NewAbstraction.getType()

  NewOpToInsertBeforeMap = dict()
  if Region.getKeys() != None:
    for Key in Region.getKeys():
      for Child in Region.getChildren()[Key]:
        assert Region.isChildValid(Child)
      if isinstance(Child, RoseOperation):
        assert isinstance(Region, RoseBlock)
        if Child.usesValue(Abstraction):
          NewName = Context.genName(NewAbstraction.getName() + ".copy.")
          ClonedNewAbstraction = NewAbstraction.clone(NewName)
          Child.replaceUsesWith(Abstraction, ClonedNewAbstraction)
          #Region.addOperationBefore(ClonedNewAbstraction, Child)
          NewOpToInsertBeforeMap[ClonedNewAbstraction] = Child
      else:
        ReplaceUsesWithUniqueCopiesOf(Child, Abstraction, NewAbstraction, Context)
  else:
    for Child in Region.getChildren():
      assert Region.isChildValid(Child)
      if isinstance(Child, RoseOperation):
        assert isinstance(Region, RoseBlock)
        if Child.usesValue(Abstraction):
          NewName = Context.genName(NewAbstraction.getName() + ".copy.")
          ClonedNewAbstraction = NewAbstraction.clone(NewName)
          Child.replaceUsesWith(Abstraction, ClonedNewAbstraction)
          #Region.addOperationBefore(ClonedNewAbstraction, Child)
          NewOpToInsertBeforeMap[ClonedNewAbstraction] = Child
      else:
        ReplaceUsesWithUniqueCopiesOf(Child, Abstraction, NewAbstraction, Context)
  
  # Now add the new operations
  for NewOp, InsertBefore in NewOpToInsertBeforeMap.items():
    Region.addOperationBefore(NewOp, InsertBefore)



def GatherIndexingOps(Operation : RoseOperation):
  # Sanity checks
  assert isinstance(Operation, RoseBitVectorOp) 
  assert Operation.isIndexingBVOp()
  IndexingOps = list()
  Worklist = list()
  if isinstance(Operation.getLowIndex(), RoseOperation):
    Worklist.append(Operation.getLowIndex())
  if isinstance(Operation.getHighIndex(), RoseOperation):
    Worklist.append(Operation.getHighIndex())
  while len(Worklist) != 0:
    IndexingOp = Worklist.pop()
    IndexingOps.append(IndexingOp)
    # We can erase Op, but first get the operands
    for Operand in IndexingOp.getOperands():
      if isinstance(Operand, RoseOperation):
        Worklist.append(Operand)
  IndexingOps.reverse()
  return IndexingOps


def HasReductionPattern(Block : RoseBlock):
  print("HAS REDUCTION PATTERN")
  Loop = Block.getParentOfType(RoseForLoop)
  if isinstance(Loop, RoseUndefRegion):
    print("RETURN FALSE1")
    return False
  Op = Block.getOperation(len(Block.getOperations()) - 1)
  assert isinstance(Op, RoseBVInsertSliceOp)
  if Op.getInputBitVector() != Block.getFunction().getReturnValue():
    print("RETURN FALSE2")
    return False
  # The low index musst be dependent on the outer loop
  ParentLoop = Loop.getParentOfType(RoseForLoop)
  if isinstance(ParentLoop, RoseUndefRegion):
    print("RETURN FALSE3")
    return False
  if ParentLoop.getIterator() != Op.getLowIndex():
    print("RETURN FALSE4")
    return False
  ReductionOp = Op.getInsertValue()
  if isinstance(ReductionOp, RoseAddOp):
    print("RETURN FALSE5")
    return False
  for Operand in ReductionOp.getOperands():
    if isinstance(Operand, RoseBVExtractSliceOp):
      if Operand.getInputBitVector() == Block.getFunction().getReturnValue():
        print("RETURN TRUE")
        return True
  print("RETURN FALSE6")
  return False


def GetReductionOps(Block : RoseBlock):
  print("GET REDUCTION OPS")
  assert HasReductionPattern(Block)
  OpList = list()
  InsertOp = Block.getOperation(len(Block.getOperations()) - 1)
  for Operand in InsertOp.getInsertValue().getOperands():
    if isinstance(Operand, RoseBVExtractSliceOp):
      if Operand.getInputBitVector() == Block.getFunction().getReturnValue():
        for IndexingOp in GatherIndexingOps(Operand):
          if IndexingOp not in OpList:
            OpList.append(IndexingOp)
        OpList.append(Operand)
  OpList.append(InsertOp.getInsertValue())
  for IndexingOp in GatherIndexingOps(InsertOp):
    if IndexingOp not in OpList:
      OpList.append(IndexingOp)
  OpList.append(InsertOp)
  for Op in OpList:
    Op.print()
  return OpList

