#############################################################
#
# Extracts constants out of the given function.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseSimilarityCheckerUtilities import *



def AddBitwidthValForUnknownVal(Op : RoseOperation, Param : RoseArgument, \
                                BVValToBitwidthVal : dict, UnknownVal : set):
  print("AddBitwidthValForUnknownVal:")
  Op.getParent().print()
  print("---------")
  Op.print()
  # If the Op is in the UnkownVal list, remove it from the list
  assert BVValToBitwidthVal[Op] == Param
  assert Op not in UnknownVal
  Worklist = list()
  Worklist.extend(Op.getUsers())
  while len(Worklist) != 0:
    Operation = Worklist.pop()
    if Operation not in UnknownVal:
      continue
    if not isinstance(Operation, RoseOperation):
      continue
    if Operation.getOpcode().typesOfInputsAndOutputEqual():
      # Add this operation to the map
      BVValToBitwidthVal[Operation] = Param
      UnknownVal.remove(Operation)
    if Operation.getOpcode().typesOfInputsAndOutputEqual() \
    or Operation.getOpcode().typesOfOperandsAreEqual():
      # Add all the operands to the map if their sizes are unknown
      for Operand in Operation.getOperands():
        if not isinstance(Operand, RoseOperation):
          continue
        if Operand in BVValToBitwidthVal:
          Operation.print()
          Operand.print()
          BVValToBitwidthVal[Operand].print()
          assert Operand not in UnknownVal
          assert Param == BVValToBitwidthVal[Operand]
          continue
        else:
          assert Operand in UnknownVal
          BVValToBitwidthVal[Operand] = Param
          UnknownVal.remove(Operand)
          # Add all the users of this operand to the worklist
          Worklist.extend(Operand.getUsers())
      # Add all the users of this operation to the worklist
      Worklist.extend(Operation.getUsers())
      continue
  return

def FixIndicesForBVOpsInsideOfLoops(Function : RoseFunction, Op : RoseBitVectorOp, \
                                    LoopStep : RoseValue, Visited : set, Context : RoseContext):
  assert Op.isIndexingBVOp() == True
  Block = Op.getParent()
  assert not isinstance(Block, RoseUndefRegion)
  # high_index = low_index + (precision - 1)
  if isinstance(Op.getLowIndex(), RoseConstant):
    Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                Op.getLowIndex().getType()))
    Op.setOperand(Op.getLowIndexPos(), Arg)
    One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
    LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"), \
                              [Op.getOperand(Op.getBitwidthPos()), One])
    Block.addOperationBefore(LastIdx, Op)
    HighIndex = RoseAddOp.create(Context.genName("%" + "highidx"), [LastIdx, Op.getLowIndex()])
    Block.addOperationBefore(HighIndex, Op)
    Op.setOperand(Op.getHighIndexPos(), HighIndex)
    Visited.add(HighIndex)
    Visited.add(LastIdx)
  else:
    print("PRINT OP:")
    Op.print()
    Op.getParent().print()
    print("--------------------")
    Op.getLowIndex().print()
    LowIndex = Op.getLowIndex()
    # Deal with the low index first
    if isinstance(LowIndex, RoseOperation) and LowIndex not in Visited:
      # Now we have to deal with the low index that is a mul op
      if isinstance(LowIndex,  RoseMulOp):
        assert len(LowIndex.getOperands()) == 2
        if isinstance(LowIndex.getOperand(0), RoseOperation):
          DivOp = LowIndex.getOperand(0)
          assert isinstance(DivOp, RoseDivOp)
          assert isinstance(LowIndex.getOperand(1), RoseConstant)
          LowIndex.setOperand(1, Op.getOutputBitwidth())
          assert isinstance(DivOp.getOperand(1), RoseConstant)
          DivOp.setOperand(1, LoopStep)
        elif isinstance(LowIndex.getOperand(1), RoseOperation):
          DivOp = LowIndex.getOperand(1)
          assert isinstance(DivOp, RoseDivOp)
          assert isinstance(LowIndex.getOperand(0), RoseConstant)
          LowIndex.setOperand(1, Op.getOutputBitwidth())
          assert isinstance(DivOp.getOperand(1), RoseConstant)
          DivOp.setOperand(1, LoopStep)
        else:
          # Look for the constant operand and replace it with op_out_bitwidth = c * loop_step
          print(Op.getOutputBitwidth())
          DivOp = RoseDivOp.create(Context.genName("%" + "factor"), Op.getOutputBitwidth(), LoopStep)
          Block.addOperationBefore(DivOp, Op.getLowIndex())
          if isinstance(Op.getLowIndex().getOperand(0), RoseConstant):
            Op.getLowIndex().setOperand(0, DivOp)
          else:
            assert isinstance(Op.getLowIndex().getOperand(1), RoseConstant)
            Op.getLowIndex().setOperand(1, DivOp)
        Visited.add(DivOp)
      elif isinstance(LowIndex, RoseAddOp):
        assert len(LowIndex.getOperands()) == 2
        if isinstance(LowIndex.getOperand(0), RoseConstant):
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                          LowIndex.getOperand(0).getType()))
          LowIndex.setOperand(0, Arg)
        elif isinstance(LowIndex.getOperand(1), RoseConstant):
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                          LowIndex.getOperand(1).getType()))
          LowIndex.setOperand(1, Arg)         
    Visited.add(Op.getLowIndex())
    # Now deal with the high index
    if Op.getHighIndex() in Visited:
      return
    assert isinstance(Op.getHighIndex(),  RoseAddOp)
    One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
    LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"), \
                              [Op.getOperand(Op.getBitwidthPos()), One])
    Block.addOperationBefore(LastIdx, Op.getHighIndex())
    assert len(Op.getHighIndex().getOperands()) == 2
    if isinstance(Op.getHighIndex().getOperand(0), RoseConstant):
      Op.getHighIndex().setOperand(0, LastIdx)
    else:
      Op.getHighIndex().print()
      assert isinstance(Op.getHighIndex().getOperand(1), RoseConstant)
      Op.getHighIndex().setOperand(1, LastIdx)
    Visited.add(LastIdx)
    Visited.add(Op.getHighIndex())
  return


def ExtractConstants(Function : RoseFunction, Context : RoseContext):
  # Get all the induction variables
  LoopList = Function.getRegionsOfType(RoseForLoop)
  for Loop in LoopList:
    print("PRINTING LOOP")
    Loop.print()
  Iterators = [Loop.getIterator() for Loop in LoopList]

  # Generate rose arguments for vector length, lane size and element size
  VectorSize = Function.appendArg(RoseArgument.create("%vectsize", Iterators[0].getType()))
  LaneSize = Function.appendArg(RoseArgument.create("%" + "lanesize", Iterators[0].getType()))
  ElemSize = Function.appendArg(RoseArgument.create("%" + "elemsize", Iterators[1].getType()))
  LaneOffset = Function.appendArg(RoseArgument.create("%" + "laneoffset", Iterators[1].getType()))
  Function.print()

  # Overwrite loop bounds and step
  LoopList[0].setEndIndexVal(VectorSize)
  LoopList[0].setStepVal(LaneSize)
  LoopList[1].setStartIndexVal(LaneOffset)
  LoopList[1].setEndIndexVal(LaneSize)
  LoopList[1].setStepVal(ElemSize)

  def FixIndicesForBVOpsOutsideOfLoops(Op : RoseBitVectorOp, Visited : set):
    assert isinstance(Op.getLowIndex(), RoseConstant)
    assert isinstance(Op.getHighIndex(), RoseConstant)
    assert Op.getLowIndex().getValue() == 0
    assert Op.getHighIndex().getValue() == Op.getOutputBitwidth() - 1
    One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
    LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"), [VectorSize, One])
    Block.addOperationBefore(LastIdx, Op)
    Op.setOperand(Op.getHighIndexPos(), LastIdx)
    Op.setOperand(Op.getBitwidthPos(), VectorSize)
    Visited.add(LastIdx)
    return

  UnknownVal = set()
  BlockList = Function.getRegionsOfType(RoseBlock)
  BVValToBitwidthVal = dict()
  IndexingOps = set()
  for Block in BlockList:
    print("---Block in List:")
    Block.print()
    Visited = set()
    OpList = []
    OpList.extend(Block.getOperations())
    Loop = Block.getParentOfType(RoseForLoop)
    OpBitwidthEqLoopStepList = list()
    if not isinstance(Loop, RoseUndefRegion):
      OpBitwidthEqLoopStepList = GetOpDeterminingLoopBounds(Loop)
    for Op in reversed(OpList):
      if Op in Visited:
        print("ALREADY VISITED")
        continue

      if Op.isSizeChangingOp():
        print("++++++=isSizeChangingOp OP IN OPLIST:")
        Op.print()
        # if this is an indexing op, we can ignore it
        if Op in IndexingOps:
          continue
        if Op in BVValToBitwidthVal:
          Op.setOperand(1, BVValToBitwidthVal[Op])
          if Op.getOperand(0) not in BVValToBitwidthVal:
            UnknownVal.add(Op.getOperand(0))
          continue
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                    Op.getOperand(1).getType()))
        Op.setOperand(1, Arg)
        BVValToBitwidthVal[Op] = Arg
        if Op in UnknownVal:
          UnknownVal.remove(Op)
        AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        continue
    
      if Op.getOpcode().typesOfInputsAndOutputEqual():
        print("typesOfInputsAndOutputEqual:")
        Op.print()
        if Op in BVValToBitwidthVal:
          for OperandIndex, Operand in enumerate(Op.getOperands()):
            if isinstance(Operand, RoseConstant):
              # Abstract away this constant value
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                           Operand.getType()))
              Op.setOperand(OperandIndex, Arg)
              continue
            BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
            if Operand in UnknownVal:
              UnknownVal.remove(Operand)
        else:
          UnknownVal.add(Op)
          for OperandIndex, Operand in enumerate(Op.getOperands()):
            if isinstance(Operand, RoseConstant):
              # Abstract away this constant value
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                           Operand.getType()))
              Op.setOperand(OperandIndex, Arg)
              continue       
            UnknownVal.add(Operand)
        continue
    
      if Op.getOpcode().typesOfOperandsAreEqual():
        print("typesOfOperandsAreEqual:")
        Op.print()
        if Op not in BVValToBitwidthVal:
          UnknownVal.add(Op)
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                          Operand.getType()))
            Op.setOperand(OperandIndex, Arg)
            continue
          if Operand not in BVValToBitwidthVal:
            UnknownVal.add(Operand)
        continue

      if isinstance(Op, RoseSelectOp):
        if isinstance(Op.getThenValue(), RoseConstant):
          # Abstract away this constant value
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                        Op.getThenValue().getType()))
          Op.setOperand(1, Arg)
        if isinstance(Op.getElseValue(), RoseConstant):
          # Abstract away this constant value
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                        Op.getElseValue().getType()))
          Op.setOperand(2, Arg)
        continue

      if isinstance(Op, RoseBVExtractSliceOp):
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          # Add indexing ops in a set
          for IndexingOp in GatherIndexingOps(Op):
            IndexingOps.add(IndexingOp)
          continue
        if Op in OpBitwidthEqLoopStepList:
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          BVValToBitwidthVal[Op] = Loop.getStep()
          if Op in UnknownVal:
            UnknownVal.remove(Op)
          AddBitwidthValForUnknownVal(Op, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
        elif Op in BVValToBitwidthVal:
          Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
        else:
          # Add a new argument
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                            Op.getOperand(Op.getBitwidthPos()).getType()))
          Op.setOperand(3, Arg)
          BVValToBitwidthVal[Op] = Arg
          if Op in UnknownVal:
            UnknownVal.remove(Op)
          AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        FixIndicesForBVOpsInsideOfLoops(Function, Op, Loop.getStep(), Visited, Context)
        Visited.add(Op)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
        continue

      if isinstance(Op, RoseBVInsertSliceOp):
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          Visited.add(Op)
          # Add indexing ops in a set
          for IndexingOp in GatherIndexingOps(Op):
            IndexingOps.add(IndexingOp)
          continue
        if Op.getLowIndex() == LoopList[0].getIterator():
          Op.setOperand(Op.getBitwidthPos(), LaneSize)
          BVValToBitwidthVal[Op] = LaneSize
        elif Op in OpBitwidthEqLoopStepList:
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          BVValToBitwidthVal[Op] = Loop.getStep()
        else:
          # Add a new argument
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                            Op.getOperand(Op.getBitwidthPos()).getType()))
          Op.setOperand(4, Arg)
          BVValToBitwidthVal[Op] = Arg
        BVValToBitwidthVal[Op.getInsertValue()] = BVValToBitwidthVal[Op]
        FixIndicesForBVOpsInsideOfLoops(Function, Op, Loop.getStep(), Visited, Context)
        print("BVINSERT OP:")
        Op.print()
        Visited.add(Op)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
        continue
      
  Function.print()
  print("NEW FUNCTION ^^^^")


def ExtractConstantsFromFunction(Function : RoseFunction, Context : RoseContext):
  print("EXTRACT CONSTANTS IN FUNCTION")
  print("FUNCTION:")
  Function.print()
  # The function must be in the canonical form
  assert IsFunctionInCanonicalForm(Function) == True

  ExtractConstants(Function, Context)

  # Get all the invariants
  InvariantsMap = GetInvariantsInRegion(Function)
  print("+====================+++++_")
  print(InvariantsMap)
  for Key, Val in InvariantsMap.items():
    print("--------")
    print(Key)
    print(Val)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  ExtractConstantsFromFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()



