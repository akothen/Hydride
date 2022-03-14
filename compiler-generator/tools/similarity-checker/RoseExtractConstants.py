#############################################################
#
# Extracts constants out of the given function.
#
#############################################################


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
      Operation.setType(RoseBitVectorType.create(Param))
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
          Operand.setType(RoseBitVectorType.create(Param))
          BVValToBitwidthVal[Operand] = Param
          UnknownVal.remove(Operand)
          # Add all the users of this operand to the worklist
          Worklist.extend(Operand.getUsers())
      # Add all the users of this operation to the worklist
      Worklist.extend(Operation.getUsers())
      continue
  return


def FixLowIndices(Op : RoseBitVectorOp, Bitwidth : RoseValue, LoopIterator : RoseValue, \
                LoopStep : RoseValue, Visited : set, Context : RoseContext):
  # Now we have to deal with the low index that is a mul op
  LowIndex = Op.getLowIndex()
  if LowIndex in Visited:
    return
  Block = Op.getParent()
  if isinstance(LowIndex,  RoseMulOp):
    assert len(LowIndex.getOperands()) == 2
    if isinstance(LowIndex.getOperand(0), RoseConstant):
      if LowIndex.getOperand(0) == Bitwidth:
        LowIndex.setOperand(0, Op.getOutputBitwidth())
        Visited.add(LowIndex)
        if isinstance(LowIndex.getOperand(1), RoseOperation):
          IntermediateOp = LowIndex.getOperand(1)
          assert IntermediateOp.getOpcode().typesOfOperandsAreEqual() \
            and IntermediateOp.getOpcode().typesOfInputsAndOutputEqual()
          assert len(IntermediateOp.getOperands()) == 2
          if IntermediateOp in Visited:
            return
          DivOp = IntermediateOp.getOperand(0)
          if isinstance(DivOp, RoseDivOp):
            if DivOp in Visited:
              return
            if isinstance(DivOp.getOperand(1), RoseConstant):
              if DivOp.getOperand(1) == Bitwidth:
                DivOp.setOperand(0, Op.getOutputBitwidth())
                Visited.add(DivOp)
                return
          else:
            DivOp = IntermediateOp.getOperand(1)
            if isinstance(DivOp, RoseDivOp):
              if DivOp in Visited:
                return
              if isinstance(DivOp.getOperand(0), RoseConstant):
                if DivOp.getOperand(1) == Bitwidth:
                  DivOp.setOperand(1, Op.getOutputBitwidth())
                  Visited.add(DivOp)
                  return
    elif isinstance(LowIndex.getOperand(1), RoseConstant):
      if LowIndex.getOperand(1) == Bitwidth:
        LowIndex.setOperand(1, Op.getOutputBitwidth())
        Visited.add(LowIndex)
        if isinstance(LowIndex.getOperand(0), RoseOperation):
          IntermediateOp = LowIndex.getOperand(0)
          assert IntermediateOp.getOpcode().typesOfOperandsAreEqual() \
            and IntermediateOp.getOpcode().typesOfInputsAndOutputEqual()
          assert len(IntermediateOp.getOperands()) == 2
          if IntermediateOp in Visited:
            return
          DivOp = IntermediateOp.getOperand(0)
          if isinstance(DivOp, RoseDivOp):
            if DivOp in Visited:
              return
            if isinstance(DivOp.getOperand(1), RoseConstant):
              if DivOp.getOperand(1) == Bitwidth:
                DivOp.setOperand(1, Op.getOutputBitwidth())
                Visited.add(DivOp)
                return
          else:
            DivOp = IntermediateOp.getOperand(1)
            if isinstance(DivOp, RoseDivOp):
              if DivOp in Visited:
                return
              if isinstance(DivOp.getOperand(0), RoseConstant):
                if DivOp.getOperand(1) == Bitwidth:
                  DivOp.setOperand(1, Op.getOutputBitwidth())
                  Visited.add(DivOp)
                  return
    
    if isinstance(LowIndex.getOperand(0), RoseOperation):
      DivOp = LowIndex.getOperand(0)
      if isinstance(DivOp, RoseDivOp):
        if DivOp in Visited:
          return
        assert isinstance(LowIndex.getOperand(1), RoseConstant)
        LowIndex.setOperand(1, Op.getOutputBitwidth())
        assert isinstance(DivOp.getOperand(1), RoseConstant)
        DivOp.setOperand(1, LoopStep)
        Visited.add(DivOp)
        Visited.add(Op.getLowIndex())
        return
    elif isinstance(LowIndex.getOperand(1), RoseOperation):
      DivOp = LowIndex.getOperand(1)
      if isinstance(DivOp, RoseDivOp):
        if DivOp in Visited:
          return
        assert isinstance(LowIndex.getOperand(0), RoseConstant)
        LowIndex.setOperand(1, Op.getOutputBitwidth())
        assert isinstance(DivOp.getOperand(1), RoseConstant)
        DivOp.setOperand(1, LoopStep)
        Visited.add(DivOp)
        Visited.add(LowIndex)
        return
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
      Visited.add(LowIndex)
      return

  if isinstance(LowIndex, RoseOperation):
    if LowIndex.getOpcode().typesOfInputsAndOutputEqual() \
      or LowIndex.getOpcode().typesOfOperandsAreEqual():
      assert len(LowIndex.getOperands()) == 2
      if isinstance(LowIndex.getOperand(0), RoseDivOp):
        DivOp = LowIndex.getOperand(0)
        if isinstance(DivOp.getOperand(1), RoseConstant):
          assert DivOp.getOperand(0) == LoopIterator
          DivOp.setOperand(1, LoopStep)
          Visited.add(DivOp)
          return
      elif isinstance(LowIndex.getOperand(1), RoseDivOp):
        DivOp = LowIndex.getOperand(1)
        if isinstance(DivOp.getOperand(1), RoseConstant):
          assert DivOp.getOperand(0) == LoopIterator
          DivOp.setOperand(1, LoopStep)
          Visited.add(DivOp)
          return


def FixIndicesForBVOpsInsideOfLoops(Function : RoseFunction, Op : RoseBitVectorOp, Bitwidth : RoseValue, \
                                    LoopIterator : RoseValue, LoopStep : RoseValue, \
                                    Visited : set, SkipBVExtracts : set, Context : RoseContext, \
                                    ArgToConstantValsMap : dict):
  print("Fix Indices For BVOps Inside Of Loops")
  assert Op.isIndexingBVOp() == True
  Block = Op.getParent()
  assert not isinstance(Block, RoseUndefRegion)

  if Op in SkipBVExtracts:
    assert Op.getOutputBitwidth() == 1
    LowIndex = Op.getLowIndex()
    assert Op.getHighIndex() == LowIndex
    if isinstance(LowIndex, RoseOperation):
      if isinstance(LowIndex,  RoseDivOp):
         DivOp = LowIndex
      elif LowIndex.getOpcode().typesOfInputsAndOutputEqual() \
        or LowIndex.getOpcode().typesOfOperandsAreEqual():
        if isinstance(LowIndex.getOperand(0), RoseDivOp):
          DivOp = LowIndex.getOperand(0)
        elif isinstance(LowIndex.getOperand(1), RoseDivOp):
          DivOp = LowIndex.getOperand(0)
        else:
          return
      else:
        return
      if isinstance(DivOp,  RoseDivOp):
        assert len(DivOp.getOperands()) == 2
        if isinstance(DivOp.getOperand(1), RoseConstant):
          assert DivOp.getOperand(0) == LoopIterator
          DivOp.setOperand(1, LoopStep)
          Visited.add(DivOp.getOperand(1))
          Visited.add(DivOp)
    return

  # high_index = low_index + (precision - 1)
  if isinstance(Op.getLowIndex(), RoseConstant):
    Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                Op.getLowIndex().getType()))
    ArgToConstantValsMap[Arg] = Op.getOperand(Op.getLowIndexPos())
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
    FixLowIndices(Op, Bitwidth, LoopIterator, LoopStep, Visited, Context)
    # Now deal with the high index
    if Op.getHighIndex() in Visited:
      return
    if Op.getLowIndex() != Op.getHighIndex():
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


def FixIndicesForBVOpsOutsideOfLoops(Op : RoseBitVectorOp, Visited : set, \
                                    VectorSize : RoseArgument, Context : RoseContext):
  assert isinstance(Op.getLowIndex(), RoseConstant)
  assert isinstance(Op.getHighIndex(), RoseConstant)
  assert Op.getLowIndex().getValue() == 0
  assert Op.getHighIndex().getValue() == Op.getOutputBitwidth() - 1
  One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
  LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"), [VectorSize, One])
  Block = Op.getParent()
  Block.addOperationBefore(LastIdx, Op)
  Op.setOperand(Op.getHighIndexPos(), LastIdx)
  Op.setOperand(Op.getBitwidthPos(), VectorSize)
  Op.setType(RoseBitVectorType.create(VectorSize))
  Visited.add(LastIdx)
  return


def ExtractConstantsFromBlock(Block : RoseBlock, BVValToBitwidthVal : dict, \
                              Visited : set, UnknownVal : set,  IndexingOps : set, \
                              LoopList : list, SkipBVExtracts : set, \
                              CondBlocksBVInsertsMap : dict, Context : RoseContext, \
                              ArgToConstantValsMap : dict):
  # Some sanity checks
  assert len(LoopList) > 1
  Function = Block.getFunction()
  print("EXTRACTING CONSTANTS FROM BLOCK")
  Block.print()
  OpList = []
  OpList.extend(Block.getOperations())
  Loop = Block.getParentOfType(RoseForLoop)
  OpBitwidthEqLoopStepList = list()
  if not isinstance(Loop, RoseUndefRegion):
    OpBitwidthEqLoopStepList = GetOpDeterminingLoopBounds(Loop)
  for Op in OpBitwidthEqLoopStepList:
    print("OpBitwidthEqLoopStepList:")
    Op.print()
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
        Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
        BVValToBitwidthVal[Op] =  Op.getOperand(1)
        if Op.getOperand(0) not in BVValToBitwidthVal:
          UnknownVal.add(Op.getOperand(0))
        continue
      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                  Op.getOperand(1).getType()))
      ArgToConstantValsMap[Arg] = Op.getOperand(1)
      Op.setOperand(1, Arg)
      Op.setType(RoseBitVectorType.create(Arg))
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
                                                          Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(OperandIndex)
            Op.setOperand(OperandIndex, Arg)
            continue
          Operand.setType(Op.getType())
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
      else:
        UnknownVal.add(Op)
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                          Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(OperandIndex)
            Op.setOperand(OperandIndex, Arg)
            continue       
          Operand.setType(Op.getType())
          UnknownVal.add(Operand)
      continue
  
    if Op.getOpcode().typesOfOperandsAreEqual():
      print("typesOfOperandsAreEqual:")
      Op.print()
      if Op not in BVValToBitwidthVal:
        UnknownVal.add(Op)
      # Get the type to use for all operands
      CommonType = Op.getOperand(0).getType()
      for Operand in Op.getOperands():
        if Operand in BVValToBitwidthVal:
          CommonType = Operand.getOperand()
          break
      for OperandIndex, Operand in enumerate(Op.getOperands()):
        if isinstance(Operand, RoseConstant):
          # Abstract away this constant value
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                        CommonType))
          ArgToConstantValsMap[Arg] = Op.getOperand(OperandIndex)
          Op.setOperand(OperandIndex, Arg)
          continue
        Operand.setType(CommonType)
        if Operand not in BVValToBitwidthVal:
          UnknownVal.add(Operand)
          continue
      continue

    if isinstance(Op, RoseSelectOp):
      if Op in BVValToBitwidthVal:
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          # Skip the condition operand
          if OperandIndex == 0:
            continue
          if isinstance(Operand, RoseConstant):
            if Op.getType().getBitwidth() != 1:
              # Abstract away this constant value
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                            Op.getType()))
              ArgToConstantValsMap[Arg] = Op.getOperand(OperandIndex)
              Op.setOperand(OperandIndex, Arg)
              continue
          Operand.setType(Op.getType())
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
      else:
        UnknownVal.add(Op)
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          # Skip the condition operand
          if OperandIndex == 0:
            continue
          if isinstance(Operand, RoseConstant):
            if Op.getType().getBitwidth() != 1:
              # Abstract away this constant value
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                            Operand.getType()))
              ArgToConstantValsMap[Arg] = Op.getOperand(OperandIndex)
              Op.setOperand(OperandIndex, Arg)
              continue
          UnknownVal.add(Operand)
      continue

    if isinstance(Op, RoseBVExtractSliceOp):
      print("---EXTRACT OP:")
      Op.print()
      Bitwidth = Op.getOperand(Op.getBitwidthPos())
      if Op not in SkipBVExtracts:
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited, LoopList[0].getEndIndex(), Context)
          BVValToBitwidthVal[Op] =  Op.getOperand(Op.getBitwidthPos())
          # Add indexing ops in a set
          for IndexingOp in GatherIndexingOps(Op):
            IndexingOps.add(IndexingOp)
          Visited.add(Op)
          continue
        if Op in OpBitwidthEqLoopStepList:
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          Op.setType(RoseBitVectorType.create(Loop.getStep()))
          BVValToBitwidthVal[Op] = Loop.getStep()
          if Op in UnknownVal:
            UnknownVal.remove(Op)
          AddBitwidthValForUnknownVal(Op, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
        elif Op in BVValToBitwidthVal:
          Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
          Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
          BVValToBitwidthVal[Op] =  Op.getOperand(Op.getBitwidthPos())
        else:
          # Add a new argument
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                            Op.getOperand(Op.getBitwidthPos()).getType()))
          ArgToConstantValsMap[Arg] = Op.getOperand(3)
          Op.setOperand(Op.getBitwidthPos(), Arg)
          Op.setType(RoseBitVectorType.create(Arg))
          BVValToBitwidthVal[Op] = Arg
          if Op in UnknownVal:
            UnknownVal.remove(Op)
          AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
      if Loop != RoseUndefRegion():
        FixIndicesForBVOpsInsideOfLoops(Function, Op, Bitwidth, Loop.getIterator(), \
                                      Loop.getStep(), Visited, SkipBVExtracts, Context, \
                                      ArgToConstantValsMap)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
      Visited.add(Op)
      continue

    if isinstance(Op, RoseBVInsertSliceOp):
      print("---INSERT OP:")
      Op.print()
      if Loop == RoseUndefRegion():
        FixIndicesForBVOpsOutsideOfLoops(Op, Visited, LoopList[0].getEndIndex(), Context)
        Visited.add(Op)
        if isinstance(Op.getInsertValue(), RoseConstant):
          # If the insert value is 1-bit long, then no need to extract it.
          if Op.getInsertValue().getType().getBitwidth() != 1:
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                          Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(0)
            Op.setOperand(0, Arg)
        Op.getInsertValue().setType(RoseBitVectorType.create(Op.getOperand(Op.getBitwidthPos())))
        BVValToBitwidthVal[Op.getInsertValue()] =  Op.getOperand(Op.getBitwidthPos())
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
        continue
      Bitwidth = Op.getOperand(Op.getBitwidthPos())
      assert Loop.getParentOfType(RoseForLoop) == LoopList[0]
      if Op.getLowIndex() == LoopList[0].getIterator():
        Op.setOperand(Op.getBitwidthPos(), LoopList[0].getStep())
        Op.setType(RoseBitVectorType.create(LoopList[0].getStep()))
        BVValToBitwidthVal[Op] = LoopList[0].getStep()
      elif Op in OpBitwidthEqLoopStepList:
        Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
        Op.setType(RoseBitVectorType.create(Loop.getStep()))
        BVValToBitwidthVal[Op] = Loop.getStep()
      elif Op in BVValToBitwidthVal:
        Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
        Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
        BVValToBitwidthVal[Op] =  Op.getOperand(Op.getBitwidthPos())
      else:
        # Add a new argument
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                          Op.getOperand(Op.getBitwidthPos()).getType()))
        ArgToConstantValsMap[Arg] = Op.getOperand(Op.getBitwidthPos())
        Op.setOperand(Op.getBitwidthPos(), Arg)
        Op.setType(RoseBitVectorType.create(Arg))
        BVValToBitwidthVal[Op] = Arg
      BVValToBitwidthVal[Op.getInsertValue()] = BVValToBitwidthVal[Op]
      FixIndicesForBVOpsInsideOfLoops(Function, Op, Bitwidth, Loop.getIterator(), \
                                      Loop.getStep(), Visited, SkipBVExtracts, Context, \
                                      ArgToConstantValsMap)
      print("BVINSERT OP:")
      Op.print()
      Visited.add(Op)
      if isinstance(Op.getInsertValue(), RoseConstant):
        # If the insert value is 1-bit long, then no need to extract it.
        if Op.getInsertValue().getType().getBitwidth() != 1:
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                        Op.getType()))
          ArgToConstantValsMap[Arg] = Op.getInsertValue()
          Op.setOperand(0, Arg)
      Op.getInsertValue().setType(RoseBitVectorType.create(Op.getOperand(Op.getBitwidthPos())))
      # Add indexing ops in a set
      for IndexingOp in GatherIndexingOps(Op):
        IndexingOps.add(IndexingOp)
      # Map the output bitwidth of corresponding bvinsert, if any.
      if Op in CondBlocksBVInsertsMap:
        BVValToBitwidthVal[CondBlocksBVInsertsMap[Op]] = BVValToBitwidthVal[Op]
      continue
  return


def MapBVInsertsInCondBlocks(Function : RoseFunction):
  # Lambda function
  def ExtractBVInsertsToRetVal(Regions : list):
    OpList = list()
    for Region in Regions:
      if isinstance(Region, RoseBlock):
        for Op in Region.getOperations():
          if isinstance(Op, RoseBVInsertSliceOp):
            if Op.getInputBitVector() == Function.getReturnValue():
              OpList.append(Op)
    return OpList

  CondBlocksBVInsertsMap = dict()
  CondRegions = Function.getRegionsOfType(RoseCond)
  for CondRegion in CondRegions:
    ThenRegions = list()
    ElseRegions = list()
    ThenRegions.extend(CondRegion.getThenRegions())
    ElseRegions.extend(CondRegion.getElseRegions())
    ThenBVInsertOps = ExtractBVInsertsToRetVal(ThenRegions)
    ElseBVInsertOps = ExtractBVInsertsToRetVal(ElseRegions)
    assert len(ThenBVInsertOps) == len(ElseBVInsertOps)
    for Index, _ in enumerate(ThenBVInsertOps):
      CondBlocksBVInsertsMap[ThenBVInsertOps[Index]] = ElseBVInsertOps[Index]
      CondBlocksBVInsertsMap[ElseBVInsertOps[Index]] = ThenBVInsertOps[Index]
  return CondBlocksBVInsertsMap


def ExtractConstants(Function : RoseFunction, Context : RoseContext, \
                     ArgToConstantValsMap : dict):
  # If there are multiple sibling inner loops, then we deal with it differently
  if len(Function.getRegionsOfType(RoseForLoop, Level=1)) > 1:
    ExtractConstantsMultipleLoops(Function, Context, ArgToConstantValsMap)
    return

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

  # Map the args to the concrete values
  ArgToConstantValsMap[VectorSize] = LoopList[0].getEndIndex()
  ArgToConstantValsMap[LaneSize] = LoopList[0].getStep()
  ArgToConstantValsMap[ElemSize] = LoopList[1].getStep()
  ArgToConstantValsMap[LaneOffset] = LoopList[1].getStartIndex()

  # Overwrite loop bounds and step
  LoopList[0].setEndIndexVal(VectorSize)
  LoopList[0].setStepVal(LaneSize)
  LoopList[1].setStartIndexVal(LaneOffset)
  LoopList[1].setEndIndexVal(LaneSize)
  LoopList[1].setStepVal(ElemSize)

  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = GetBVExtractsToBeSkipped(Function)

  # Find mapping between two similar bvinserts in different condblocks
  CondBlocksBVInsertsMap = MapBVInsertsInCondBlocks(Function)

  UnknownVal = set()
  BlockList = Function.getRegionsOfType(RoseBlock)
  BVValToBitwidthVal = dict()
  IndexingOps = set()
  Visited = set()
  for Block in BlockList:
    print("---Block in List:")
    Block.print()
    ExtractConstantsFromBlock(Block, BVValToBitwidthVal, Visited, \
                              UnknownVal,  IndexingOps, LoopList, SkipBVExtracts,\
                              CondBlocksBVInsertsMap, Context, ArgToConstantValsMap)
  Function.print()
  print("NEW FUNCTION ^^^^")


def FixDFGIsomorphism(Pack1 : list, Pack2 : list):
  print("FixDFGIsomorphism")
  # We need to see if we can make these two packs isomorphic.
  # First step is to see where the DFG isomorphism is violated
  # and correct it if it has to do with one special case --
  # missing add indexing op (addition to zero).

  def GetNumBVOps(Pack : list):
    NumExtractOps = 0
    NumInsertOps = 0
    NumOtherBVOps = 0
    for Op in Pack:
      if isinstance(Op, RoseBVExtractSliceOp):
        NumExtractOps += 1
      elif isinstance(Op, RoseBVInsertSliceOp):
        NumInsertOps += 1
      elif isinstance(Op, RoseBitVectorOp):
        NumOtherBVOps += 1
    return NumExtractOps, NumInsertOps, NumOtherBVOps

  def GatherIndexingOpsInPack(Pack : list):
    IndexingToBVOpsMap = dict()
    for Op in reversed(Pack):
      if isinstance(Op, RoseBVExtractSliceOp) \
      or isinstance(Op, RoseBVInsertSliceOp):
        IndexingOps = GatherIndexingOps(Op)
        for IndexingOp in IndexingOps:
          IndexingToBVOpsMap[IndexingOp] = Op
    return IndexingToBVOpsMap

  # Op1 is an add ops and op2 is not.
  def FixPack(Op1 : RoseOperation, Op2 : RoseOperation, \
              Pack : list, OpsList1 : list, OpsList2 : list, \
              Visited : list):
    print("---------FIXING PACK")
    # See if adding on Add op before Op2 would do.
    if not isinstance(Op1, RoseAddOp):
      return False
    if len(Op1.getOperands()) != 2:
      return False
    if not isinstance(Op1.getOperand(0), RoseConstant) \
    and not isinstance(Op1.getOperand(1), RoseConstant):
      return False
    # Generate a new add op
    Zero = RoseConstant(0, Op2.getType())
    NewOp2 = RoseAddOp.create(Op2.getName() + ".new", [Op2, Zero])
    print("NEW ADD OP:")
    NewOp2.print()
    # Replace the uses of Op2 with NewOp2
    Op2.replaceUsesWith(NewOp2)
    # Add the new op to the block
    Block = Op2.getParent()
    assert isinstance(Block, RoseBlock)
    Block.addOperationAfter(NewOp2, Op2)
    print("+++++NEW BLOCK:")
    Block.print()
    # Consider all other instructions
    OpsList1.extend(Op1.getOperands())
    OpsList2.extend(NewOp2.getOperands())
    # Extend the pack
    Index = Pack.index(Op2)
    Pack.insert(Index + 1, NewOp2)
    # Fix the visited ops list
    Visited.remove(Op2)
    Visited.add(NewOp2)
    print("NEW BLOCK:")
    Block.print()
    print("---AFTER PACK:")
    for Op in Pack:
      Op.print()
    return True

  # First get number of different number of bv ops
  NumExtractOps1, NumInsertOps1, NumOtherBVOps1 = GetNumBVOps(Pack1)
  NumExtractOps2, NumInsertOps2, NumOtherBVOps2 = GetNumBVOps(Pack2)
  if NumExtractOps1 != NumExtractOps2 \
  or NumInsertOps1 != NumInsertOps2 \
  or NumOtherBVOps1 != NumOtherBVOps2:
    return False

  # Gather all the indexing ops
  IndexingToBVOpsMap1 = GatherIndexingOpsInPack(Pack1)
  IndexingToBVOpsMap2 = GatherIndexingOpsInPack(Pack2)

  # Reverse iterate the packs
  OpsList1 =[Pack1[len(Pack1) - 1]]
  OpsList2 =[Pack2[len(Pack2) - 1]]
  Visited = set()
  while len(OpsList1) != 0:
    #print("OpsList1:")
    #print(OpsList1)
    #print("OpsList2:")
    #print(OpsList2)
    assert len(OpsList1) == len(OpsList2)
    Op1 = OpsList1.pop()
    Op2 = OpsList2.pop()
    print("***&&&&&&&&OP1:")
    Op1.print()
    Op1.getType().print()
    print("***&&&&&&&&OP2:")
    Op2.print()
    Op2.getType().print()
    # Skip constants
    if isinstance(Op1, RoseConstant) \
    and isinstance(Op2, RoseConstant):
      continue
    if not isinstance(Op1, RoseOperation):
      if isinstance(Op2, RoseOperation):
        return False
      # If op1 and op2 are simple values, we can skip
      if isinstance(Op1, RoseValue) \
      and isinstance(Op2, RoseValue):
        if Op1.getType() != Op2.getType():
          return False
        continue
      if Op1 != Op2:
        return False
      continue
    if not isinstance(Op2, RoseOperation):
      if isinstance(Op1, RoseOperation):
        return False
      # If op1 and op2 are simple values, we can skip
      if isinstance(Op1, RoseValue) \
      and isinstance(Op2, RoseValue):
        if Op1.getType() != Op2.getType():
          return False
        continue
      if Op1 != Op2:
        return False
      continue
    if Op1 in Visited:
      if not Op2 in Visited:
         return False
      continue
    if Op2 in Visited:
      if not Op1 in Visited:
         return False
      continue
    Visited.add(Op1)
    Visited.add(Op2)
    print("--OP1:")
    Op1.print()
    print("--OP2:")
    Op2.print()
    # If the operations have different opcodes or types, skip
    if Op1.getOpcode() != Op2.getOpcode():
      print("OPCODES ARE NOT THE SAME")
      # Check if one of the ops is an indexing op
      if Op1 in IndexingToBVOpsMap1:
        print("Op1 in IndexingToBVOpsMap1")
        print("OP1:")
        Op1.print()
        print("OP2:")
        Op2.print()
        if FixPack(Op2, Op1, Pack1, OpsList2, OpsList1, Visited) == True:
          continue
      elif  Op2 in IndexingToBVOpsMap2:
        print("Op2 in IndexingToBVOpsMap2")
        print("OP1:")
        Op1.print()
        print("OP2:")
        Op2.print()
        if FixPack(Op1, Op2, Pack2, OpsList1, OpsList2, Visited) == True:
          continue
      return False
    if Op1.getType() != Op2.getType():
      return False
    if len(Op1.getOperands()) != len(Op2.getOperands()):
      return False
    # Deal with call operations
    if isinstance(Op1, RoseCallOp):
      assert isinstance(Op2, RoseCallOp)
      # Make sure that the callees for the operations are equal.
      if Op1.getCallee().getName() != Op2.getCallee().getName():
        return False
      OpsList1.extend(Op1.getCallOperands())
      OpsList2.extend(Op2.getCallOperands())
      continue
    # If this operation has not indexing operands, add None
    if (isinstance(Op1, RoseBVExtractSliceOp) or isinstance(Op1, RoseBVInsertSliceOp)) \
    and Op1.isIndexingBVOp() ==  True:
      # Output bitwidths for bitvector ops must be equal
      if Op1.getOutputBitwidth() != Op2.getOutputBitwidth():
        return False
      OpsList1.extend(Op1.getBitVectorOperands())
      OpsList1.append(Op1.getLowIndex())
      OpsList1.append(Op1.getHighIndex())
      OpsList2.extend(Op2.getBitVectorOperands())
      OpsList2.append(Op2.getLowIndex())
      OpsList2.append(Op2.getHighIndex())
      continue
    # See if the packs need fixing
    MoveOn = False
    print("++++++++++++++++++++++++++++++++++++++++++++++")
    for OpIndex in range(len(Op1.getOperands())):
      Operand1 = Op1.getOperand(OpIndex)
      Operand2 = Op2.getOperand(OpIndex)
      print("Operand1:")
      Operand1.print()
      print("Operand2:")
      Operand2.print()
      if isinstance(Operand1, RoseConstant):
        if not isinstance(Operand2, RoseConstant):
          if Op1 in IndexingToBVOpsMap1:
            print("------Op1 in IndexingToBVOpsMap1")
            print("OP1:")
            Op1.print()
            print("OP2:")
            Op2.print()
            if FixPack(Op1, Op2, Pack2, OpsList1, OpsList2, Visited) == True:
              MoveOn = True
              break
          continue
      if isinstance(Operand2, RoseConstant):
        if not isinstance(Operand1, RoseConstant):
          if Op2 in IndexingToBVOpsMap2:
            print("-----Op2 in IndexingToBVOpsMap1")
            print("OP1:")
            Op1.print()
            print("OP2:")
            Op2.print()
            if FixPack(Op2, Op1, Pack1, OpsList2, OpsList1, Visited) == True:
              MoveOn = True
              break
          continue
    if MoveOn == True:
      continue
    
    # Consider all other instructions
    OpsList1.extend(Op1.getOperands())
    OpsList2.extend(Op2.getOperands())
  # We are done exploring the DFGs
  print("+++AFTER PACK1:")
  for Op in Pack1:
    Op.print()
  print("+++++AFTER PACK2:")
  for Op in Pack2:
    Op.print()
  return True  


def FixIndicesForBVOpsInsideOfLoopsMultipleLoops(Function : RoseFunction, Op : RoseBitVectorOp, \
                                    LoopIterator : RoseValue, LoopStep : RoseValue, 
                                    KeyOp : RoseBitVectorOp, KeyOpToIndexArg : dict, \
                                    Visited : set, SkipBVExtracts : set, Context : RoseContext, \
                                    ArgToConstantValsMap : dict):
  assert Op.isIndexingBVOp() == True
  Block = Op.getParent()
  assert not isinstance(Block, RoseUndefRegion)
  if Op in SkipBVExtracts:
    assert Op.getOutputBitwidth() == 1
    LowIndex = Op.getLowIndex()
    assert Op.getHighIndex() == LowIndex
    if isinstance(LowIndex, RoseOperation):
      if isinstance(LowIndex,  RoseDivOp):
         DivOp = LowIndex
      elif LowIndex.getOpcode().typesOfInputsAndOutputEqual() \
        or LowIndex.getOpcode().typesOfOperandsAreEqual():
        if isinstance(LowIndex.getOperand(0), RoseDivOp):
          DivOp = LowIndex.getOperand(0)
        elif isinstance(LowIndex.getOperand(1), RoseDivOp):
          DivOp = LowIndex.getOperand(0)
        else:
          return
      else:
        return
      if isinstance(DivOp,  RoseDivOp):
        assert len(DivOp.getOperands()) == 2
        if isinstance(DivOp.getOperand(1), RoseConstant):
          assert DivOp.getOperand(0) == LoopIterator
          DivOp.setOperand(1, LoopStep)
          Visited.add(DivOp.getOperand(1))
          Visited.add(DivOp)
    return

  # high_index = low_index + (precision - 1)
  if isinstance(Op.getLowIndex(), RoseConstant):
    if Op == KeyOp:
      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                  Op.getLowIndex().getType()))
      KeyOpToIndexArg[KeyOp] = Arg
    else:
      Arg = KeyOpToIndexArg[KeyOp]
    ArgToConstantValsMap[Arg] = Op.getOperand(Op.getLowIndexPos())
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
      #if isinstance(LowIndex , RoseAddOp):
      #  assert len(LowIndex.getOperands()) == 2
      #  if isinstance(LowIndex.getOperand(0), RoseConstant):
      #    if LowIndex.getOperand(0).getValue() == 0:
      #      Operand = LowIndex.getOperand(1)
      #      LowIndex.replaceUsesWith(Operand)
      #      Visited.add(LowIndex)
      #      Block.eraseOperation(LowIndex)
      #      LowIndex = Operand
      #  else:
      #    assert isinstance(LowIndex.getOperand(1), RoseConstant)
      #    if LowIndex.getOperand(1).getValue() == 0:
      #      Operand = LowIndex.getOperand(0)
      #      LowIndex.replaceUsesWith(Operand)
      #      Visited.add(LowIndex)
      #      Block.eraseOperation(LowIndex)
       #     LowIndex = Operand
      if isinstance(LowIndex,  RoseMulOp):
        assert len(LowIndex.getOperands()) == 2
        if isinstance(LowIndex.getOperand(0), RoseOperation):
          DivOp = LowIndex.getOperand(0)
          if isinstance(DivOp, RoseDivOp):
            assert isinstance(LowIndex.getOperand(1), RoseConstant)
            LowIndex.setOperand(1, Op.getOutputBitwidth())
            assert isinstance(DivOp.getOperand(1), RoseConstant)
            DivOp.setOperand(1, LoopStep)
            Visited.add(DivOp)
            Visited.add(Op.getLowIndex())
        elif isinstance(LowIndex.getOperand(1), RoseOperation):
          DivOp = LowIndex.getOperand(1)
          if isinstance(DivOp, RoseDivOp):
            assert isinstance(LowIndex.getOperand(0), RoseConstant)
            LowIndex.setOperand(1, Op.getOutputBitwidth())
            assert isinstance(DivOp.getOperand(1), RoseConstant)
            DivOp.setOperand(1, LoopStep)
            Visited.add(DivOp)
            Visited.add(Op.getLowIndex())
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
          Visited.add(Op.getLowIndex())
      #elif isinstance(LowIndex, RoseAddOp):
      #  assert len(LowIndex.getOperands()) == 2
      #  if isinstance(LowIndex.getOperand(0), RoseConstant):
      #    if Op == KeyOp:
      #      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
      #                                      LowIndex.getOperand(0).getType()))
      #      KeyOpToIndexArg[KeyOp] = Arg
      #    else:
      #      Arg = KeyOpToIndexArg[KeyOp]
      #    LowIndex.setOperand(0, Arg)
      #  elif isinstance(LowIndex.getOperand(1), RoseConstant):
      #    if Op == KeyOp:
      #      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
      #                                      LowIndex.getOperand(1).getType()))
      #      KeyOpToIndexArg[KeyOp] = Arg
      #    else:
      #      Arg = KeyOpToIndexArg[KeyOp]
      #    LowIndex.setOperand(1, Arg)         
    #Visited.add(Op.getLowIndex())
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


def ExtractConstantsFromMultipleBlocks(BlockList : RoseBlock, BVValToBitwidthVal : dict, \
                              Visited : set, UnknownVal : set,  IndexingOps : set, \
                              LoopList : list, SkipBVExtracts : set, CondBlocksBVInsertsMap : dict, \
                              Context : RoseContext, ArgToConstantValsMap : dict):
  print("ExtractConstantsFromMultipleBlocks")
  # Some sanity checks
  assert len(LoopList) > 1
  assert len(BlockList) > 1
  # The blocks in the block list must have the isomorphic
  OpToKeyOpMap = dict()
  KeyBlock = BlockList[0]
  for Block in BlockList[1:]:
    #assert DFGsOfBlocksAreIsomorphic(Block, KeyBlock) == True
    Map = MapIsomorphicDFGsOfBlocks(Block, KeyBlock, FixDFGIsomorphism)
    assert Map != None
    OpToKeyOpMap.update(Map)

  # Collect ops which helped determining the loop bounds during canonicalization
  OpBitwidthEqLoopStepList = list()
  for Block in BlockList:
    Loop = Block.getParentOfType(RoseForLoop)
    if not isinstance(Loop, RoseUndefRegion):
      OpBitwidthEqLoopStepList.extend(GetOpDeterminingLoopBounds(Loop))

  # Gather all the ops in the blocks
  OpListMap = dict()
  for Block in BlockList:
    OpList = []
    OpList.extend(Block.getOperations())
    OpList.reverse()
    OpListMap[Block] = OpList

  Function = KeyBlock.getFunction()
  print("EXTRACTING CONSTANTS FROM KEY BLOCK")
  KeyBlock.print()
  KeyOpToArg = dict()
  KeyOpToIndexArg = dict()
  for OpIndex, KeyOp in enumerate(OpListMap[KeyBlock]):
    if KeyOp in Visited:
      print("ALREADY VISITED")
      KeyOp.print()
      # Sanity check
      for Block in BlockList[1:]:
        OpListMap[Block][OpIndex].print()
        assert OpListMap[Block][OpIndex] in Visited
      continue

    if KeyOp.isSizeChangingOp():
      print("++++++=isSizeChangingOp OP IN OPLIST:")
      KeyOp.print()
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        # if this is an indexing op, we can ignore it
        if Operation in IndexingOps:
          continue
        if Operation in BVValToBitwidthVal:
          Operation.setOperand(1, BVValToBitwidthVal[Operation])
          if Operation.getOperand(0) not in BVValToBitwidthVal:
            UnknownVal.add(Operation.getOperand(0))
          continue
        if Operation == KeyOp:
          NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                      Operation.getOperand(1).getType()))
          KeyOpToArg[KeyOp] = NewArg
        else:
          print("OpToKeyOpMap[Operation].print()")
          OpToKeyOpMap[Operation].print()
          NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
        ArgToConstantValsMap[NewArg] = Operation.getOperand(1)
        Operation.setOperand(1, NewArg)
        BVValToBitwidthVal[Operation] = NewArg
        if Operation in UnknownVal:
          UnknownVal.remove(Operation)
        AddBitwidthValForUnknownVal(Operation, NewArg, BVValToBitwidthVal, UnknownVal)
      continue
  
    if KeyOp.getOpcode().typesOfInputsAndOutputEqual():
      print("typesOfInputsAndOutputEqual:")
      KeyOp.print()
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        if Operation in BVValToBitwidthVal:
          for OperandIndex, Operand in enumerate(Operation.getOperands()):
            if isinstance(Operand, RoseConstant):
              if Operation == KeyOp:
                # Abstract away this constant value
                NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                              Operand.getType()))
                KeyOpToArg[KeyOp] = NewArg
              else:
                print("OpToKeyOpMap[Operation].print()")
                OpToKeyOpMap[Operation].print()
                NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
              ArgToConstantValsMap[NewArg] = Operation.getOperand(OperandIndex)
              Operation.setOperand(OperandIndex, NewArg)
              continue
            BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Operation]
            if Operand in UnknownVal:
              UnknownVal.remove(Operand)
        else:
          UnknownVal.add(Operation)
          for OperandIndex, Operand in enumerate(Operation.getOperands()):
            if isinstance(Operand, RoseConstant):
              if Operation == KeyOp:
                # Abstract away this constant value
                NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                              Operand.getType()))
                KeyOpToArg[KeyOp] = NewArg
              else:
                print("OpToKeyOpMap[Operation].print()")
                OpToKeyOpMap[Operation].print()
                NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
              ArgToConstantValsMap[NewArg] = Operation.getOperand(OperandIndex)
              Operation.setOperand(OperandIndex, NewArg)
              continue       
            UnknownVal.add(Operand)
      continue
  
    if KeyOp.getOpcode().typesOfOperandsAreEqual():
      print("typesOfOperandsAreEqual:")
      KeyOp.print()
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        if Operation not in BVValToBitwidthVal:
          UnknownVal.add(Operation)
        for OperandIndex, Operand in enumerate(Operation.getOperands()):
          if isinstance(Operand, RoseConstant):
            if Operation == KeyOp:
              # Abstract away this constant value
              NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                            Operand.getType()))
              KeyOpToArg[KeyOp] = NewArg
            else:
              print("OpToKeyOpMap[Operation].print()")
              OpToKeyOpMap[Operation].print()
              NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
            ArgToConstantValsMap[NewArg] = Operation.getOperand(OperandIndex)
            Operation.setOperand(OperandIndex, NewArg)
            continue
          if Operand not in BVValToBitwidthVal:
            UnknownVal.add(Operand)
      continue

    if isinstance(KeyOp, RoseSelectOp):
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        if Operation in BVValToBitwidthVal:
          for OperandIndex, Operand in enumerate(Operation.getOperands()):
            # Skip the condition operand
            if OperandIndex == 0:
              continue
            if isinstance(Operand, RoseConstant):
              if Operation.getType().getBitwidth() != 1:
                if Operation == KeyOp:
                  # Abstract away this constant value
                  NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                                Operand.getType()))
                  KeyOpToArg[KeyOp] = NewArg
                else:
                  print("OpToKeyOpMap[Operation].print()")
                  OpToKeyOpMap[Operation].print()
                  NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
                ArgToConstantValsMap[NewArg] = Operation.getOperand(OperandIndex)
                Operation.setOperand(OperandIndex, NewArg)
                continue
            BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Operation]
            if Operand in UnknownVal:
              UnknownVal.remove(Operand)
        else:
          UnknownVal.add(Operation)
          for OperandIndex, Operand in enumerate(Operation.getOperands()):
            # Skip the condition operand
            if OperandIndex == 0:
              continue
            if isinstance(Operand, RoseConstant):
              if Operation.getType().getBitwidth() != 1:
                if Operation == KeyOp:
                  # Abstract away this constant value
                  NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                                Operand.getType()))
                  KeyOpToArg[KeyOp] = NewArg
                else:
                  print("OpToKeyOpMap[Operation].print()")
                  OpToKeyOpMap[Operation].print()
                  NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
                ArgToConstantValsMap[NewArg] = Operation.getOperand(OperandIndex)
                Operation.setOperand(OperandIndex, NewArg)
                continue       
            UnknownVal.add(Operand)
      continue

    if isinstance(KeyOp, RoseBVExtractSliceOp):
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        Loop = Block.getParentOfType(RoseForLoop)
        if Operation not in SkipBVExtracts:
          if Loop == RoseUndefRegion():
            FixIndicesForBVOpsOutsideOfLoops(Operation, Visited, LoopList[0].getEndIndex(), Context)
            # Add indexing ops in a set
            for IndexingOp in GatherIndexingOps(Operation):
              IndexingOps.add(IndexingOp)
            Visited.add(Operation)
            continue
          if Operation in OpBitwidthEqLoopStepList:
            Operation.setOperand(Operation.getBitwidthPos(), Loop.getStep())
            BVValToBitwidthVal[Operation] = Loop.getStep()
            if Operation in UnknownVal:
              UnknownVal.remove(Operation)
            AddBitwidthValForUnknownVal(Operation, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
          elif Operation in BVValToBitwidthVal:
            Operation.setOperand(Operation.getBitwidthPos(), BVValToBitwidthVal[Operation])
          else:
            if Operation == KeyOp:
              # Add a new argument
              NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                        Operation.getOperand(Operation.getBitwidthPos()).getType()))
              KeyOpToArg[KeyOp] = NewArg
            else:
              print("OpToKeyOpMap[Operation].print()")
              OpToKeyOpMap[Operation].print()
              NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
            ArgToConstantValsMap[NewArg] = Operation.getOperand(3)
            Operation.setOperand(3, NewArg)
            BVValToBitwidthVal[Operation] = NewArg
            if Operation in UnknownVal:
              UnknownVal.remove(Operation)
            AddBitwidthValForUnknownVal(Operation, NewArg, BVValToBitwidthVal, UnknownVal)
        if Loop != RoseUndefRegion():
          FixIndicesForBVOpsInsideOfLoopsMultipleLoops(Function, Operation, Loop.getIterator(), \
                                          Loop.getStep(), KeyOp, KeyOpToIndexArg, Visited, \
                                          SkipBVExtracts, Context, ArgToConstantValsMap)
          # Add indexing ops in a set
          for IndexingOp in GatherIndexingOps(Operation):
            IndexingOps.add(IndexingOp)
        Visited.add(Operation)
      continue

    if isinstance(KeyOp, RoseBVInsertSliceOp):
      for Block in BlockList:
        Operation = OpListMap[Block][OpIndex]
        Loop = Block.getParentOfType(RoseForLoop)
        if isinstance(Operation.getInsertValue(), RoseConstant):
          if Operation == KeyOp:
            # If the insert value is 1-bit long, then no need to extract it.
            if Operation.getInsertValue().getType().getBitwidth() != 1:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                          Operation.getInsertValue().getType()))
              ArgToConstantValsMap[Arg] = Operation.getOperand(0)
              Operation.setOperand(0, Arg)
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Operation, Visited, LoopList[0].getEndIndex(), Context)
          Visited.add(Operation)
          # Add indexing ops in a set
          for IndexingOp in GatherIndexingOps(Operation):
            IndexingOps.add(IndexingOp)
          continue
        assert Loop.getParentOfType(RoseForLoop) == LoopList[0]
        if Operation.getLowIndex() == LoopList[0].getIterator():
          Operation.setOperand(Operation.getBitwidthPos(), LoopList[0].getStep())
          BVValToBitwidthVal[Op] = LoopList[0].getStep()
        elif Operation in OpBitwidthEqLoopStepList:
          Operation.setOperand(Operation.getBitwidthPos(), Loop.getStep())
          BVValToBitwidthVal[Operation] = Loop.getStep()
        #elif Operation in BVValToBitwidthVal:
        #  Operation.setOperand(Operation.getBitwidthPos(), BVValToBitwidthVal[Op])
        else:
          if Operation == KeyOp:
            # Add a new argument
            NewArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                      Operation.getOperand(Operation.getBitwidthPos()).getType()))
            KeyOpToArg[KeyOp] = NewArg
          else:
            print("OpToKeyOpMap[Operation].print()")
            OpToKeyOpMap[Operation].print()
            NewArg = KeyOpToArg[KeyOp] #KeyOpToArg[OpToKeyOpMap[Operation]]
          ArgToConstantValsMap[NewArg] = Operation.getOperand(4)
          Operation.setOperand(4, NewArg)
          BVValToBitwidthVal[Operation] = NewArg
        BVValToBitwidthVal[Operation.getInsertValue()] = BVValToBitwidthVal[Operation]
        FixIndicesForBVOpsInsideOfLoopsMultipleLoops(Function, Operation, Loop.getIterator(), \
                                        Loop.getStep(), KeyOp, KeyOpToIndexArg, Visited, \
                                        SkipBVExtracts, Context, ArgToConstantValsMap)
        print("BVINSERT OP:")
        Operation.print()
        Visited.add(Operation)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Operation):
          IndexingOps.add(IndexingOp)
        # Map the output bitwidth of corresponding bvinsert, if any.
        #if Operation in CondBlocksBVInsertsMap:
        #  BVValToBitwidthVal[CondBlocksBVInsertsMap[Operation]] = BVValToBitwidthVal[Operation]
        continue
  
  return


def ExtractConstantsMultipleLoops(Function : RoseFunction, Context : RoseContext, \
                                  ArgToConstantValsMap : dict):
  print("ExtractConstantsMultipleLoops")
  # Sanity check
  InnerLoopsList = Function.getRegionsOfType(RoseForLoop, Level=1)
  NumInnerLoops = len(InnerLoopsList)
  assert NumInnerLoops > 1

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

  FunctionRegList = Function.getChildren()
  # The function cannot be empty
  assert len(FunctionRegList) > 0
  # If the first region in this function is not a block, then insert one.
  if not isinstance(FunctionRegList[0], RoseBlock):
    FirstBlock = RoseBlock.create()
    Function.addRegionBefore(0, FirstBlock)
  else:
    FirstBlock = FunctionRegList[0]

  # Compute the points at which the sibling loops "break".
  # First, compute the first breaking point
  VisitedOps = set()
  NumInnerLoopsVal = RoseConstant.create(NumInnerLoops, LaneSize.getType())
  FirstBreak = RoseDivOp.create(Context.genName("%" + "break"), LaneSize, NumInnerLoopsVal)
  FirstBlock.addOperation(FirstBreak)
  VisitedOps.add(FirstBreak)
  # Go over all the loops
  PreviousBreak = RoseUndefValue()
  for Index in range(NumInnerLoops):
    # Deal with some special cases to keep the IR simple
    if Index == 0:
      ArgToConstantValsMap[LaneOffset] = InnerLoopsList[Index].getStartIndex()
      InnerLoopsList[Index].setStartIndexVal(LaneOffset)
      ArgToConstantValsMap[ElemSize] = InnerLoopsList[Index].getStep()
      InnerLoopsList[Index].setStepVal(ElemSize)
      PreviousBreak = FirstBreak
      InnerLoopsList[Index].setEndIndexVal(FirstBreak)
      continue
    # Compute the lane offset for this loop
    NewLaneOffset = RoseAddOp.create(Context.genName("%new.lane.offset"), \
                                    [PreviousBreak, LaneOffset])
    FirstBlock.addOperation(NewLaneOffset)
    VisitedOps.add(NewLaneOffset)
    InnerLoopsList[Index].setStartIndexVal(NewLaneOffset)
    InnerLoopsList[Index].setStepVal(ElemSize)
    if Index == NumInnerLoops - 1:
      InnerLoopsList[Index].setEndIndexVal(LaneSize)
    else:
      Factor = RoseConstant.create(Index + 1, FirstBreak.getType())
      PreviousBreak = RoseMulOp.create(Context.genName("%" + "break"), \
                                        [Factor, FirstBreak])
      VisitedOps.add(PreviousBreak)
      FirstBlock.addOperation(PreviousBreak)
      InnerLoopsList[Index].setEndIndexVal(PreviousBreak)

  # Map args to concrete values
  ArgToConstantValsMap[VectorSize] = LoopList[0].getEndIndex()
  ArgToConstantValsMap[LaneSize] = LoopList[0].getStep()

  # Overwrite loop bounds and step of the outer loop
  LoopList[0].setEndIndexVal(VectorSize)
  LoopList[0].setStepVal(LaneSize)

  # Map the blocks in the inner loops
  BlocksInInnerLoops = list()
  BlocksInInnerLoopsMap = dict() 
  for Loop in InnerLoopsList:
    BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
    if BlocksInInnerLoops == []:
       BlocksInInnerLoops = BlockList
       # init the map
       for Block in BlockList:
         BlocksInInnerLoopsMap[Block]= [Block]
       continue
    # Sanity check. Number of blocks in all inner loops must 
    # be the same.
    assert len(BlocksInInnerLoops) == len(BlockList)
    for Index, Block in enumerate(BlocksInInnerLoops):
      BlocksInInnerLoopsMap[Block].append(BlockList[Index])

  Function.print()
  print("FUNCTION SO FAR ^^^^")

  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = GetBVExtractsToBeSkipped(Function)

  # Find mapping between two similar bvinserts in different condblocks
  CondBlocksBVInsertsMap = MapBVInsertsInCondBlocks(Function)

  # Lets extract constants now
  UnknownVal = set()
  BVValToBitwidthVal = dict()
  IndexingOps = set()
  VisitedBlocks = set()
  # First extract constants from the inner loops
  for Block in BlocksInInnerLoops:
    BlockList = BlocksInInnerLoopsMap[Block]
    ExtractConstantsFromMultipleBlocks(BlockList,\
                                    BVValToBitwidthVal, VisitedOps, UnknownVal, \
                                    IndexingOps, LoopList, SkipBVExtracts, \
                                    CondBlocksBVInsertsMap, Context, ArgToConstantValsMap)
    # Mark these blocks as visited
    for OtherBlocks in BlockList:
      VisitedBlocks.add(OtherBlocks)

  # Extract constants from remaining blocks
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    print("---Block in List:")
    Block.print()
    if Block in VisitedBlocks:
      continue
    ExtractConstantsFromBlock(Block, BVValToBitwidthVal, VisitedOps, \
                      UnknownVal, IndexingOps, LoopList, SkipBVExtracts, \
                      CondBlocksBVInsertsMap, Context, ArgToConstantValsMap)

  Function.print()
  print("NEW FUNCTION ^^^^")



def ExtractConstantsFromFunction(Function : RoseFunction, \
                    Context : RoseContext, ArgToConstantValsMap : dict):
  print("EXTRACT CONSTANTS IN FUNCTION")
  print("FUNCTION:")
  Function.print()
  # The function must be in the canonical form
  assert IsFunctionInCanonicalForm(Function) == True

  ExtractConstants(Function, Context, ArgToConstantValsMap)

  # Get all the invariants
  InvariantsMap = GetInvariantsInRegion(Function)
  print("+====================+++++_")
  print(InvariantsMap)
  for Key, Val in InvariantsMap.items():
    print("--------")
    print(Key)
    print(Val)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext, \
        ArgToConstantValsMap : dict):
  ExtractConstantsFromFunction(Function, Context,  ArgToConstantValsMap)
  print("\n\n\n\n\n")
  Function.print()



