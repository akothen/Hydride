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

  def FixIndicesForBVOpsInsideOfLoops(Op : RoseBitVectorOp, \
                                      LoopStep : RoseValue, Visited : set):
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
      Op.getLowIndex().print()
      # Deal with the low index first
      if isinstance(Op.getLowIndex(), RoseOperation) and Op.getLowIndex() not in Visited:
        # Now we have to deal with the low index that is a mul op
        if isinstance(Op.getLowIndex(),  RoseMulOp):
          # Look for the constant operand and replace it with op_out_bitwidth = c * loop_step
          DivOp = RoseDivOp.create(Context.genName("%" + "factor"), Op.getOutputBitwidth(), LoopStep)
          Block.addOperationBefore(DivOp, Op.getLowIndex())
          assert len(Op.getLowIndex().getOperands()) == 2
          if isinstance(Op.getLowIndex().getOperand(0), RoseConstant):
            Op.getLowIndex().setOperand(0, DivOp)
          else:
            assert isinstance(Op.getLowIndex().getOperand(1), RoseConstant)
            Op.getLowIndex().setOperand(1, DivOp)
          Visited.add(DivOp)
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

  def AddBitwidthValForUnknownVal(Op : RoseOperation, Param : RoseArgument, \
                                  BVValToBitwidthVal : dict, UnknownVal : list):
    print("AddBitwidthValForUnknownVal:")
    Op.getParent().print()
    # If the Op is in the UnkownVal list, remove it from the list
    if Op in UnknownVal:
      UnknownVal.remove(Op)
    UsersList = Op.getUsers()
    for User in UsersList:
      if User in UnknownVal:
        BVValToBitwidthVal[User] = Param
        for Operand in User.getOperands():
          if Operand in BVValToBitwidthVal:
            Op.print()
            BVValToBitwidthVal[Op].print()
            Operand.print()
            BVValToBitwidthVal[Operand].print()
            assert BVValToBitwidthVal[Op] == BVValToBitwidthVal[Operand]
          else:
             BVValToBitwidthVal[Operand] =  BVValToBitwidthVal[Op]
    return

  BVValToBitwidthVal = dict()
  UnknownVal = list()
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    print("Block in List:")
    Block.print()
  BVValToBitwidthVal = dict()
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
    print("-------OP IN OPLIST:")
    for Operation__ in reversed(OpList):
      Operation__.print()
    for Op in reversed(OpList):
      print("++++++=OP IN OPLIST:")
      Op.print()
      print("-----------------------------")
      Op.print()
      if Op in Visited:
        print("ALREADY VISITED")
        continue

      if Op.isSizeChangingOp():
        print("++++++=isSizeChangingOp OP IN OPLIST:")
        Op.print()
        if Op in BVValToBitwidthVal:
          Op.setOperand(1, BVValToBitwidthVal[Op])
          if Op.getOperand(0) not in BVValToBitwidthVal:
            UnknownVal.append(Op.getOperand(0))
          continue
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                    Op.getOperand(1).getType()))
        Op.setOperand(1, Arg)
        BVValToBitwidthVal[Op] = Arg
        for Val in UnknownVal:
          print("UNKNOWN VAL:")
          Val.print()
        AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        continue
    
      if Op.getOpcode().typesOfInputsAndOutputEqual():
        print("typesOfInputsAndOutputEqual:")
        Op.print()
        if Op in BVValToBitwidthVal:
          for Operand in Op.getOperands():
            BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
        else:
          UnknownVal.append(Op)
          for Operand in Op.getOperands():
            UnknownVal.append(Operand)
        continue

      if isinstance(Op, RoseBVExtractSliceOp):
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          Visited.add(Op)
          continue
        if Op in OpBitwidthEqLoopStepList:
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          BVValToBitwidthVal[Op] = Loop.getStep()
          AddBitwidthValForUnknownVal(Op, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
        elif Op in BVValToBitwidthVal:
          Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
        else:
          # Add a new argument
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                            Op.getOperand(Op.getBitwidthPos()).getType()))
          Op.setOperand(3, Arg)
          BVValToBitwidthVal[Op] = Arg
          AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        FixIndicesForBVOpsInsideOfLoops(Op, Loop.getStep(), Visited)
        Visited.add(Op)
        continue

      if isinstance(Op, RoseBVInsertSliceOp):
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          Visited.add(Op)
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
        FixIndicesForBVOpsInsideOfLoops(Op, Loop.getStep(), Visited)
        print("BVINSERT OP:")
        Op.print()
        Visited.add(Op)
        print("----****-OP IN OPLIST:")
        for Operation__ in reversed(OpList):
          Operation__.print()
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



