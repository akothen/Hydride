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
  LoopList[0].setEndIndex(VectorSize)
  LoopList[0].setStep(LaneSize)
  LoopList[1].setStartIndex(LaneOffset)
  LoopList[1].setEndIndex(LaneSize)
  LoopList[1].setStep(ElemSize)

  def FixIndicesForBVOps(Op : RoseBitVectorOp, Visited : set):
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
    else:
      if Op.HighIndex() in Visited:
        return
      assert isinstance(Op.HighIndex(),  RoseAddOp)
      One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
      LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"), \
                                [Op.getOperand(Op.getBitwidthPos()), One])
      Block.addOperationBefore(LastIdx, Op.HighIndex())
      assert len(Op.HighIndex().getOperands()) == 2
      if isinstance(Op.HighIndex().getOperand(0), RoseConstant):
        Op.HighIndex().setOperand(0, LastIdx)
      else:
        assert isinstance(Op.HighIndex().getOperand(1), RoseConstant)
        Op.HighIndex().setOperand(1, LastIdx)
      Visited.add(Op.LowIndex())
      #Block.addOperationBefore(HighIndex, Op)
    Visited.add(LastIdx)
    Visited.add(HighIndex)

  def AddBitwidthValForUnknownVal(Op : RoseOperation, Param : RoseArgument, \
                                  BVValToBitwidthVal : dict, UnknownVal : list):
    UsersList = Op.getUsers()
    for User in UsersList:
      if User in UnknownVal:
        BVValToBitwidthVal[User] = Param
        for Operand in User.getOperands():
          if Operand in BVValToBitwidthVal:
            assert BVValToBitwidthVal[Op] == BVValToBitwidthVal[Operand]
          else:
             BVValToBitwidthVal[Operand] =  BVValToBitwidthVal[Op]

  BVValToBitwidthVal = dict()
  UnknownVal = list()
  BlockList = Function.getRegionsOfType(RoseBlock)
  BVIndexingOps = list()
  BVValToBitwidthVal = dict()
  NewArguments = list()
  for Block in BlockList:
    Visited = set()
    OpList = Block.getOperations()
    for Op in reversed(OpList):
      if Op in Visited:
        continue

    if Op.isSizeChangingOp():
      if Op in BVValToBitwidthVal:
        Op.setSizeOperand(BVValToBitwidthVal[Op])
        if Op.getOperand() not in BVValToBitwidthVal:
          UnknownVal.append(Op.getOperand())
        continue
      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                   Op.getOperand(1).getType()))
      Op.setOperand(1, Arg)
      BVValToBitwidthVal[Op] = Arg
      AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
      continue
    
    if Op.getOpcode().typesOfInputsAndOutputEqual():
      if Op in BVValToBitwidthVal:
        for Operand in Op.getOperands():
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
      else:
        for Operand in Op.getOperands():
          UnknownVal.append(Operand)
      continue

    if isinstance(Op, RoseBVExtractSliceOp):
      if Op in BVValToBitwidthVal:
        Op.setPrecision(BVValToBitwidthVal[Op])
      else:
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
                                                    Op.getOperand(3).getType()))
        Op.setOperand(3, Arg)
        BVValToBitwidthVal[Op] = Arg
        AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
      FixIndicesForBVOps(Op, Visited)
      continue

    if isinstance(Op, RoseBVInsertSliceOp):
      if Op.getLowIndex() == LoopList[0].getIterator():
        Op.setOperand(4, LaneSize)
        BVValToBitwidthVal[Op.getInsertVal()] = LaneSize
      else:
        Op.setOperand(4, ElemSize)
        BVValToBitwidthVal[Op.getInsertValue()] = ElemSize
      FixIndicesForBVOps(Op, Visited)
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



