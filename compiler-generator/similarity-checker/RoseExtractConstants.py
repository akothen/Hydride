#############################################################
#
# Extracts constants out of the given function.
#
#############################################################


from re import L
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
    Visited.add(LastIdx)
    return

  def FixIndicesForBVOpsInsideOfLoops(Op : RoseBitVectorOp, Visited : set):
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
      Visited.add(Op.getLowIndex())
      #Block.addOperationBefore(HighIndex, Op)
      Visited.add(LastIdx)
      Visited.add(Op.getLowIndex())
      Visited.add(Op.getHighIndex())
    return

  def AddBitwidthValForUnknownVal(Op : RoseOperation, Param : RoseArgument, \
                                  BVValToBitwidthVal : dict, UnknownVal : list):
    print("AddBitwidthValForUnknownVal:")
    Op.getParent().print()
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
        if Op in BVValToBitwidthVal:
          Op.setOperand(1, BVValToBitwidthVal[Op])
          if Op.getOperand(0) not in BVValToBitwidthVal:
            UnknownVal.append(Op.getOperand(0))
          continue
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                    Op.getOperand(1).getType()))
        Op.setOperand(1, Arg)
        BVValToBitwidthVal[Op] = Arg
        AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        continue
    
      if Op.getOpcode().typesOfInputsAndOutputEqual():
        print("typesOfInputsAndOutputEqual:")
        Op.print()
        if Op in BVValToBitwidthVal:
          for Operand in Op.getOperands():
            BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
        else:
          for Operand in Op.getOperands():
            UnknownVal.append(Operand)
        continue

      if isinstance(Op, RoseBVExtractSliceOp):
        Loop = Block.getParentOfType(RoseForLoop)
        if Loop == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          Visited.add(Op)
          continue
        if Op in GetOpDeterminingLoopBounds(Loop):
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          BVValToBitwidthVal[Op] = Loop.getStep()
          AddBitwidthValForUnknownVal(Op, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
        elif Op in BVValToBitwidthVal:
          Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
        else:
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                      Op.getOperand(3).getType()))
          Op.setOperand(3, Arg)
          BVValToBitwidthVal[Op] = Arg
          AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
        FixIndicesForBVOpsInsideOfLoops(Op, Visited)
        Visited.add(Op)
        continue

      if isinstance(Op, RoseBVInsertSliceOp):
        if Block.getParentOfType(RoseForLoop) == RoseUndefRegion():
          FixIndicesForBVOpsOutsideOfLoops(Op, Visited)
          Visited.add(Op)
          continue
        if Op.getLowIndex() == LoopList[0].getIterator():
          Op.setOperand(4, LaneSize)
          BVValToBitwidthVal[Op.getInsertValue()] = LaneSize
        else:
          Op.setOperand(4, ElemSize)
          BVValToBitwidthVal[Op.getInsertValue()] = ElemSize
        FixIndicesForBVOpsInsideOfLoops(Op, Visited)
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



