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


def AddBitwidthValForUnknownVal(Op: RoseOperation, Param: RoseArgument,
                                BVValToBitwidthVal: dict, UnknownVal: set):
  print("AddBitwidthValForUnknownVal:")
  Op.getParent().print()
  print("---------")
  Op.print()
  # If the Op is in the UnkownVal list, remove it from the list
  assert BVValToBitwidthVal[Op] == Param
  assert Op not in UnknownVal
  Worklist = list()
  Worklist.extend(Op.getUsers())
  Visited = set()
  while len(Worklist) != 0:
    Operation = Worklist.pop()
    print("WORKLIST OP:")
    Operation.print()
    if Operation in Visited:
      continue
    Visited.add(Operation)
    # if Operation not in UnknownVal:
    #  continue
    if not isinstance(Operation, RoseOperation):
      continue
    if Operation.getOpcode().typesOfInputsAndOutputEqual():
      # Add this operation to the map
      Operation.setType(RoseBitVectorType.create(Param))
      BVValToBitwidthVal[Operation] = Param
      if Operation in UnknownVal:
        UnknownVal.remove(Operation)
    if isinstance(Op, RoseGeneralSaturableBitVectorOp) \
            or isinstance(Op, RoseSignAgnosticBitVectorOp):
      # Add this operation to the map
      Operation.setType(RoseBitVectorType.create(Param))
      BVValToBitwidthVal[Operation] = Param
      if Operation in UnknownVal:
        UnknownVal.remove(Operation)
    if Operation.getOpcode().typesOfInputsAndOutputEqual() \
            or Operation.getOpcode().typesOfOperandsAreEqual():
      # Add all the operands to the map if their sizes are unknown
      for Operand in Operation.getOperands():
        if not isinstance(Operand, RoseOperation) \
                and not isinstance(Operand, RoseArgument):
          continue
        if Operand in BVValToBitwidthVal:
          print("Operation:")
          Operation.print()
          print("Operand:")
          Operand.print()
          print("BVValToBitwidthVal[Operand].print():")
          BVValToBitwidthVal[Operand].print()
          print("Param:")
          Param.print()
          assert Operand not in UnknownVal
          assert Param == BVValToBitwidthVal[Operand]
          continue
        else:
          #assert Operand in UnknownVal
          Operand.setType(RoseBitVectorType.create(Param))
          BVValToBitwidthVal[Operand] = Param
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
          # Add all the users of this operand to the worklist
          if isinstance(Operand, RoseOperation):
            Worklist.extend(Operand.getUsers())
      # Add all the users of this operation to the worklist
      print("Operation.getUsers():")
      print(Operation.getUsers())
      print("Operation:")
      Operation.print()
      for User in Operation.getUsers():
        print("USER:")
        User.print()
      Worklist.extend(Operation.getUsers())
      for Operand in Operation.getOperands():
        # Add all the users of this operand to the worklist
        if isinstance(Operand, RoseOperation):
          print("ADDING USERS OF:")
          Operand.print()
          Worklist.extend(Operand.getUsers())
      continue
    if isinstance(Op, RoseGeneralSaturableBitVectorOp) \
            or isinstance(Op, RoseSignAgnosticBitVectorOp) \
            or isinstance(Op, RoseGeneralComparisonBitVectorOp):
      # Add all the operands to the map if their sizes are unknown.
      # Ignore the last operand.
      for Operand in Operation.getOperands()[:-1]:
        if not isinstance(Operand, RoseOperation) \
                and not isinstance(Operand, RoseArgument):
          continue
        if Operand in BVValToBitwidthVal:
          print("Operation:")
          Operation.print()
          print("Operand:")
          Operand.print()
          print("BVValToBitwidthVal[Operand].print():")
          BVValToBitwidthVal[Operand].print()
          assert Operand not in UnknownVal
          assert Param == BVValToBitwidthVal[Operand]
          continue
        else:
          #assert Operand in UnknownVal
          Operand.setType(RoseBitVectorType.create(Param))
          BVValToBitwidthVal[Operand] = Param
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
          print("OPERAND REMOVED FROM UNKNONW SET:")
          Operand.print()
      # Add all the users of this operation to the worklist
      print("Operation.getUsers():")
      print(Operation.getUsers())
      print("Operation:")
      Operation.print()
      for User in Operation.getUsers():
        print("USER:")
        User.print()
      Worklist.extend(Operation.getUsers())
      for Operand in Operation.getOperands():
        # Add all the users of this operand to the worklist
        if isinstance(Operand, RoseOperation):
          Worklist.extend(Operand.getUsers())
      continue
  return


def FixIndicesForBVOpsInsideOfLoops(Function: RoseFunction, Op: RoseBitVectorOp, Bitwidth: RoseValue,
                                    LoopIterator: RoseValue, LoopStep: RoseValue,
                                    Visited: set, Context: RoseContext, ArgToConstantValsMap: dict):
  print("Fix Indices For BVOps Inside Of Loops")
  print("OP:")
  Op.print()
  assert Op.isIndexingBVOp() == True
  Block = Op.getParent()
  assert not isinstance(Block, RoseUndefRegion)

  # Deal with easy cases where low_index == high_index
  if Op.getLowIndex() == Op.getHighIndex():
    BitwidthVal = Op.getOperand(Op.getBitwidthPos())
    if not isinstance(BitwidthVal, RoseConstant):
      One = RoseConstant.create(1, BitwidthVal.getType())
      LastIdx = RoseSubOp.create(Context.genName(
          "%" + "lastidx"), [BitwidthVal, One])
      HighIndex = RoseAddOp.create(Context.genName(
          "%" + "highidx"), [Op.getLowIndex(), LastIdx])
      Block.addOperationBefore(LastIdx, Op)
      Block.addOperationBefore(HighIndex, Op)
      Op.setOperand(Op.getHighIndexPos(), HighIndex)
      Visited.add(HighIndex)
      Visited.add(LastIdx)
      return

  # high_index = low_index + (precision - 1)
  if isinstance(Op.getLowIndex(), RoseConstant):
    Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                 Op.getLowIndex().getType()))
    ArgToConstantValsMap[Arg] = Op.getOperand(Op.getLowIndexPos()).clone()
    Op.setOperand(Op.getLowIndexPos(), Arg)
    One = RoseConstant.create(
        1, Op.getOperand(Op.getBitwidthPos()).getType())
    LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"),
                               [Op.getOperand(Op.getBitwidthPos()), One])
    Block.addOperationBefore(LastIdx, Op)
    HighIndex = RoseAddOp.create(Context.genName(
        "%" + "highidx"), [LastIdx, Op.getLowIndex()])
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
    # Deal with the high index
    if Op.getHighIndex() in Visited:
      return
    if Op.getLowIndex() != Op.getHighIndex():
      assert isinstance(Op.getHighIndex(),  RoseAddOp)
      One = RoseConstant.create(
          1, Op.getOperand(Op.getBitwidthPos()).getType())
      LastIdx = RoseSubOp.create(Context.genName("%" + "lastidx"),
                                 [Op.getOperand(Op.getBitwidthPos()), One])
      Block.addOperationBefore(LastIdx, Op.getHighIndex())
      assert len(Op.getHighIndex().getOperands()) == 2
      if isinstance(Op.getHighIndex().getOperand(0), RoseConstant):
        Op.getHighIndex().setOperand(0, LastIdx)
      else:
        Op.getHighIndex().print()
        assert isinstance(
            Op.getHighIndex().getOperand(1), RoseConstant)
        Op.getHighIndex().setOperand(1, LastIdx)
      Visited.add(LastIdx)
      Visited.add(Op.getHighIndex())
  return


def FixIndicesForBVOpsOutsideOfLoops(Op: RoseBitVectorOp, Visited: set,
                                     VectorSize: RoseArgument, Context: RoseContext):
  assert isinstance(Op.getLowIndex(), RoseConstant)
  assert isinstance(Op.getHighIndex(), RoseConstant)
  assert Op.getLowIndex().getValue() == 0
  assert Op.getHighIndex().getValue() == Op.getOutputBitwidth() - 1
  One = RoseConstant.create(1, Op.getOperand(Op.getBitwidthPos()).getType())
  LastIdx = RoseSubOp.create(Context.genName(
      "%" + "lastidx"), [VectorSize, One])
  Block = Op.getParent()
  Block.addOperationBefore(LastIdx, Op)
  Op.setOperand(Op.getHighIndexPos(), LastIdx)
  Op.setOperand(Op.getBitwidthPos(), VectorSize)
  Op.setType(RoseBitVectorType.create(VectorSize))
  Visited.add(LastIdx)
  return


def ExtractBVSignedness(Function: RoseFunction, SizeExtOp: RoseBVSizeExensionOp,
                        ArgToConstantValsMap: dict, OpsWithUnknownExtensionKind: set,
                        Visited: set, Context: RoseContext):
  print("SizeExtOp:")
  SizeExtOp.print()
  assert isinstance(SizeExtOp, RoseBVSizeExensionOp)
  Worklist = list()
  Worklist.append(SizeExtOp.getInputBitVector())
  if isinstance(SizeExtOp.getInputBitVector(), RoseBVExtractSliceOp):
    ExtensionKindArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                              SizeExtOp.getOperand(SizeExtOp.getExtensionKindPos()).getType()))
    ArgToConstantValsMap[ExtensionKindArg] = \
        SizeExtOp.getOperand(SizeExtOp.getExtensionKindPos()).clone()
    SizeExtOp.setOperand(SizeExtOp.getExtensionKindPos(), ExtensionKindArg)
    return True
  # Trace back to see what ops affect the signedness of the size extension op
  ExtKindList = list()
  Worklist = [SizeExtOp.getInputBitVector()]
  while len(Worklist) != 0:
    Op = Worklist.pop()
    if isinstance(Op, RoseOperation):
      if Op.getOpcode().typesOfInputsAndOutputEqual() \
              or Op.getOpcode().typesOfOperandsAreEqual():
        Worklist.extend(Op.getOperands())
        continue
      if isinstance(Op, RoseBVSizeExensionOp):
        if isinstance(Op.getOperand(Op.getExtensionKindPos()), RoseConstant):
          OpsWithUnknownExtensionKind.add(SizeExtOp)
          return False
        ExtKindList.append(Op.getOperand(Op.getExtensionKindPos()))
        continue
      if isinstance(Op, RoseBVExtractSliceOp):
        ExtensionKindArg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                                  SizeExtOp.getOperand(SizeExtOp.getExtensionKindPos()).getType()))
        ArgToConstantValsMap[ExtensionKindArg] = \
            SizeExtOp.getOperand(
                SizeExtOp.getExtensionKindPos()).clone()
        SizeExtOp.setOperand(
            SizeExtOp.getExtensionKindPos(), ExtensionKindArg)
        return True
  # OR the extension kind operands
  OrOp = RoseOrOp.create(Context.genName("%" + "extkind"), ExtKindList[:2])
  Block = SizeExtOp.getParent()
  Block.addOperationBefore(OrOp, SizeExtOp)
  Visited.add(OrOp)
  if len(ExtKindList) > 2:
    for Operation in ExtKindList[2:]:
      OrOp = RoseOrOp.create(Context.genName(
          "%" + "extkind"), [OrOp, Operation])
      Block.addOperationBefore(OrOp, SizeExtOp)
      Visited.add(OrOp)
  SizeExtOp.setOperand(SizeExtOp.getExtensionKindPos(), OrOp)
  return True


def ComputeBitvectorValue(RoseElemVal, Bitwidth):
  ElementVal = RoseElemVal.getValue()
  ElemBitwidth = RoseElemVal.getType().getBitwidth()
  NumElem = int(Bitwidth / ElemBitwidth)
  if ElemBitwidth >= 4:
    ElemValStr = str(hex(ElementVal))
    Diff = ElemBitwidth - (4 * len(ElemValStr[2:]))
    if Diff != 0:
      Zeros = ""
      for _ in range(int(Diff / 4)):
        Zeros += "0"
      ElemValStr = ElemValStr[:2] + Zeros + ElemValStr[2:]
  else:
    ElemValStr = str(bin(ElementVal))
  print("ElemValStr:")
  print(ElemValStr)
  BitvectorValStr = ""
  for _ in range(NumElem):
    BitvectorValStr += ElemValStr[2:]
  BitvectorValStr = ElemValStr[:2] + BitvectorValStr
  print("BitvectorValStr:")
  print(BitvectorValStr)
  if ElemBitwidth >= 4:
    return int(BitvectorValStr, 16)
  return int(BitvectorValStr, 2)


def DealWithSkippedBVExtracts(Function: RoseFunction, SkipBVExtracts: list,
                              Context: RoseContext):
  print("DealWithSkippedBVExtracts")
  CondRegions = Function.getRegionsOfType(RoseCond)
  Conditions = dict()
  for CondRegion in CondRegions:
    for Condition in CondRegion.getConditions():
      Conditions[Condition] = CondRegion
  for Op in SkipBVExtracts:
    if Op in Conditions:
      NewOp = RoseBVEQOp.create(Context.genName(
          "%" + "cond"), Op, RoseConstant(1, Op.getType()))
      print("Op:")
      Op.print()
      print("NewOp:")
      NewOp.print()
      Op.getParent().addOperationAfter(NewOp, Op)
      #Function.replaceUsesWith(Op, NewOp)
      for CondRegion in CondRegions:
        for Idx, Condition in enumerate(CondRegion.getConditions()):
          print("Condition:")
          Condition.print()
          print("OP:")
          Op.print()
          if Op == Condition:
            CondRegion.setCondition(Idx, NewOp)
  # Iterate over some blocks
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    OpList = list()
    OpList.extend(Block.getOperations())
    for Op in OpList:
      if isinstance(Op, RoseSelectOp):
        if Op.getCondition() in SkipBVExtracts:
          NewOp = RoseBVEQOp.create(Context.genName("%" + "cond"), Op.getCondition(),
                                    RoseConstant(1, Op.getCondition().getType()))
          print("Op condition:")
          Op.getCondition().print()
          print("NewOp:")
          NewOp.print()
          Op.getParent().addOperationBefore(NewOp, Op)
          Op.setOperand(0, NewOp)
  print("DONE DealWithSkippedBVExtracts")
  Function.print()
  return


def ExtractConstantsFromBlock(Block: RoseBlock, BVValToBitwidthVal: dict,
                              Visited: set, UnknownVal: set,  IndexingOps: set,
                              LoopList: list, SkipBVExtracts: set,
                              CondBlocksBVInsertsMap: dict, Context: RoseContext,
                              ArgToConstantValsMap: dict):
  print("EXTRACTING CONSTANTS FROM BLOCK")
  Block.print()
  # Some sanity checks
  #assert len(LoopList) > 1
  Function = Block.getFunction()
  OpList = []
  OpList.extend(Block.getOperations())
  Loop = Block.getParentOfType(RoseForLoop)
  print("PRINTING LOOP:")
  Loop.print()
  OpBitwidthEqLoopStepList = list()
  if not isinstance(Loop, RoseUndefRegion):
    OpBitwidthEqLoopStepList = GetOpDeterminingLoopBoundsFor(
        [Loop])  # GetOpDeterminingLoopBounds(Loop)
  if isinstance(OpBitwidthEqLoopStepList, list):
    print("EXTRACTING CONSTANTS FROM BLOCK")
    Block.print()
    for Op in OpBitwidthEqLoopStepList:
      print("OpBitwidthEqLoopStepList:")
      Op.print()
  else:
    OpBitwidthEqLoopStepList = []
  print("--------OpBitwidthEqLoopStepList:")
  print(OpBitwidthEqLoopStepList)
  IndicesToBitwidth = dict()
  OpsWithUnknownExtensionKind = set()
  for Op in reversed(OpList):
    print("TRY OP:")
    Op.print()
    if Op in Visited:
      print("ALREADY VISITED")
      continue

    if len(Op.getOperands()) == 1:
      if not isinstance(Op.getType(), RoseVoidType):
        Operand = Op.getOperand(0)
        if Op not in BVValToBitwidthVal:
          UnknownVal.add(Op)
          UnknownVal.add(Operand)
        else:
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
          Operand.setType(Op.getType())
      continue

    if isinstance(Op, RoseDivOp):
      print("DIV OP:")
      if Loop != RoseUndefRegion():
        if isinstance(Op.getOperand(1), RoseConstant):
          if Op.getOperand(0) == Loop.getIterator():
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                         Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(1).clone()
            Op.setOperand(1, Arg)
            Visited.add(Op)
            continue

    # if Op.isSizeChangingOp():
    #   print("++++++=isSizeChangingOp OP IN OPLIST:")
    #   Op.print()
    #   # if this is an indexing op, we can ignore it
    #   if Op in IndexingOps:
    #     continue
    #   if isinstance(Op, RoseBVSizeExensionOp):
    #     ExtractBVSignedness(Function, Op, ArgToConstantValsMap, \
    #                   OpsWithUnknownExtensionKind, Visited, Context)
    #     OpsToTry = set()
    #     OpsToTry.update(OpsWithUnknownExtensionKind)
    #     for Operation in OpsToTry:
    #       if ExtractBVSignedness(Function, Operation, ArgToConstantValsMap, \
    #                     OpsWithUnknownExtensionKind, Visited, Context) == True:
    #         OpsWithUnknownExtensionKind.remove(Operation)
    #   if Op in BVValToBitwidthVal:
    #     Op.setOperand(1, BVValToBitwidthVal[Op])
    #     Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
    #     BVValToBitwidthVal[Op] =  Op.getOperand(1)
    #     if Op.getOperand(0) not in BVValToBitwidthVal:
    #       UnknownVal.add(Op.getOperand(0))
    #     continue
    #   print("====SIZE EXTENSION OP:")
    #   Op.print()
    #   Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
    #                                               Op.getOperand(1).getType()))
    #   ArgToConstantValsMap[Arg] = Op.getOperand(1).clone()
    #   Op.setOperand(1, Arg)
    #   Op.setType(RoseBitVectorType.create(Arg))
    #   BVValToBitwidthVal[Op] = Arg
    #   print("NEW OP:")
    #   Op.print()
    #   Op.getType().print()
    #   if Op in UnknownVal:
    #     UnknownVal.remove(Op)
    #   AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
    #   continue

    if isinstance(Op, RoseBVSizeExensionOp):
      # Abstract away the signedness operand
      if isinstance(Op.getExtensionKind(), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getExtensionKind().getType()))
        ArgToConstantValsMap[Arg] = Op.getExtensionKind().clone()
        Op.setOperand(Op.getExtensionKindPos(), Arg)
      # Fall through

    if isinstance(Op, RoseBVGeneralSaturationOp):
      # Abstract away the signedness operand
      if isinstance(Op.getSaturationKind(), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getSaturationKind().getType()))
        ArgToConstantValsMap[Arg] = Op.getSaturationKind().clone()
        Op.setOperand(Op.getSaturationKindPos(), Arg)
      # Fall through

    if Op.isSizeChangingOp():
      print("++++++=isSizeChangingOp OP IN OPLIST:")
      Op.print()
      # if this is an indexing op, we can ignore it
      if Op in IndexingOps:
        continue
      if Op in BVValToBitwidthVal:
        Op.setOperand(1, BVValToBitwidthVal[Op])
        Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
        BVValToBitwidthVal[Op] = Op.getOperand(1)
        if Op.getOperand(0) not in BVValToBitwidthVal:
          UnknownVal.add(Op.getOperand(0))
        continue
      if isinstance(Op.getOperand(1), RoseConstant):
        if Op.getOperand(1).getValue() == 192:  # ARM Saturation specification
          continue
      print("====SIZE EXTENSION OP:")
      Op.print()
      Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                   Op.getOperand(1).getType()))
      ArgToConstantValsMap[Arg] = Op.getOperand(1).clone()
      Op.setOperand(1, Arg)
      Op.setType(RoseBitVectorType.create(Arg))
      BVValToBitwidthVal[Op] = Arg
      print("NEW OP:")
      Op.print()
      Op.getType().print()
      if Op in UnknownVal:
        UnknownVal.remove(Op)
      AddBitwidthValForUnknownVal(
          Op, Arg, BVValToBitwidthVal, UnknownVal)
      continue

    if isinstance(Op, RoseGeneralSaturableBitVectorOp):
      print("RoseGeneralSaturableBitVectorOp:")
      Op.print()
      if Op in BVValToBitwidthVal:
        # Skip the final operand
        for OperandIndex, Operand in enumerate(Op.getOperands()[:-1]):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            BVValToBitwidthVal[Op.getOperand(
                OperandIndex)] = BVValToBitwidthVal[Op]
            continue
          print("SETTING TYPE FOR Operand:")
          Operand.print()
          Operand.setType(Op.getType())
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
      else:
        UnknownVal.add(Op)
        # Skip the final operand
        for OperandIndex, Operand in enumerate(Op.getOperands()[:-1]):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            UnknownVal.add(Op.getOperand(OperandIndex))
            continue
          if Operand not in BVValToBitwidthVal:
            Operand.setType(Op.getType())
            UnknownVal.add(Operand)
      # Account for the saturation qualifier
      print("Op.getSaturationQualifierID():")
      Op.getSaturationQualifierID().print()
      if isinstance(Op.getSaturationQualifierID(), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getSaturationQualifierID().getType()))
        ArgToConstantValsMap[Arg] = Op.getSaturationQualifierID(
        ).clone()
        Op.setOperand(Op.getSaturationQualifierIDPos(), Arg)
      continue

    if isinstance(Op, RoseSignAgnosticBitVectorOp):
      print("RoseSignAgnosticBitVectorOp:")
      Op.print()
      if Op in BVValToBitwidthVal:
        # Skip the final operand
        for OperandIndex, Operand in enumerate(Op.getOperands()[:-1]):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            BVValToBitwidthVal[Op.getOperand(
                OperandIndex)] = BVValToBitwidthVal[Op]
            continue
          print("SETTING TYPE FOR Operand:")
          Operand.print()
          Operand.setType(Op.getType())
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
      else:
        UnknownVal.add(Op)
        # Skip the final operand
        for OperandIndex, Operand in enumerate(Op.getOperands()[:-1]):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            UnknownVal.add(Op.getOperand(OperandIndex))
            continue
          if Operand not in BVValToBitwidthVal:
            Operand.setType(Op.getType())
            UnknownVal.add(Operand)
      # Account for the sign qualifier
      print("Op.getSignID():")
      Op.getSignID().print()
      if isinstance(Op.getSignID(), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getSignID().getType()))
        ArgToConstantValsMap[Arg] = Op.getSignID().clone()
        Op.setOperand(Op.getSignIDPos(), Arg)
      continue

    if isinstance(Op, RoseGeneralComparisonBitVectorOp):
      print("RoseGeneralComparisonBitVectorOp:")
      Op.print()
      # if this is an indexing op, we can ignore it
      if Op in IndexingOps:
        continue
      if Op not in BVValToBitwidthVal:
        print("ADDING OP IN UNKNOWN SET")
        Op.print()
        UnknownVal.add(Op)
      # Get the type to use for all operands
      CommonType = RoseUndefinedType()
      CommonBitwidthVal = RoseUndefValue()
      for Operand in Op.getOperands()[:-1]:
        if Operand in BVValToBitwidthVal:
          CommonType = Operand.getType()
          CommonBitwidthVal = BVValToBitwidthVal[Operand]
          break
      for OperandIndex, Operand in enumerate(Op.getOperands()[:-1]):
        if isinstance(Operand, RoseConstant):
          # Abstract away this constant value
          if isinstance(Operand.getType(), RoseBitVectorType):
            Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                          Operand.getType()))
          else:
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                         Operand.getType()))
          ArgToConstantValsMap[Arg] = Op.getOperand(
              OperandIndex).clone()
          Op.setOperand(OperandIndex, Arg)
        if not isinstance(CommonType, RoseUndefinedType):
          assert not isinstance(CommonBitwidthVal, RoseUndefValue)
          Op.getOperand(OperandIndex).setType(CommonType)
          print("CommonType:")
          CommonType.print()
          # if Op.getOperand(OperandIndex) not in BVValToBitwidthVal:
          BVValToBitwidthVal[Op.getOperand(
              OperandIndex)] = CommonBitwidthVal
          # Op.getOperand(OperandIndex).getType().getBitwidth()
          if Op.getOperand(OperandIndex) in UnknownVal:
            UnknownVal.remove(Op.getOperand(OperandIndex))
        if Op.getOperand(OperandIndex) not in BVValToBitwidthVal:
          print("ADDING OPERAND TO UNKNOWN SET")
          Op.getOperand(OperandIndex).print()
          UnknownVal.add(Op.getOperand(OperandIndex))
          continue
      # Account for the sign qualifier
      print("Op.getSignID():")
      Op.getSignID().print()
      if isinstance(Op.getSignID(), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getSignID().getType()))
        ArgToConstantValsMap[Arg] = Op.getSignID().clone()
        Op.setOperand(Op.getSignIDPos(), Arg)
      continue

    if Op.getOpcode().typesOfInputsAndOutputEqual():
      print("typesOfInputsAndOutputEqual:")
      Op.print()
      if Op in BVValToBitwidthVal:
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            BVValToBitwidthVal[Op.getOperand(
                OperandIndex)] = BVValToBitwidthVal[Op]
            continue
          print("SETTING TYPE FOR Operand:")
          Operand.print()
          Operand.setType(Op.getType())
          BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
          if Operand in UnknownVal:
            UnknownVal.remove(Operand)
      else:
        UnknownVal.add(Op)
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            UnknownVal.add(Op.getOperand(OperandIndex))
            continue
          if Operand not in BVValToBitwidthVal:
            Operand.setType(Op.getType())
            UnknownVal.add(Operand)
      continue

    if Op.getOpcode().typesOfOperandsAreEqual():
      print("typesOfOperandsAreEqual:")
      Op.print()
      # if this is an indexing op, we can ignore it
      if Op in IndexingOps:
        continue
      if Op not in BVValToBitwidthVal:
        print("ADDING OP IN UNKNOWN SET")
        Op.print()
        UnknownVal.add(Op)
      # Get the type to use for all operands
      CommonType = RoseUndefinedType()
      CommonBitwidthVal = RoseUndefValue()
      for Operand in Op.getOperands():
        if Operand in BVValToBitwidthVal:
          CommonType = Operand.getType()
          CommonBitwidthVal = BVValToBitwidthVal[Operand]
          break
      for OperandIndex, Operand in enumerate(Op.getOperands()):
        if isinstance(Operand, RoseConstant):
          # Abstract away this constant value
          if isinstance(Operand.getType(), RoseBitVectorType):
            Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                          Operand.getType()))
          else:
            Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                         Operand.getType()))
          ArgToConstantValsMap[Arg] = Op.getOperand(
              OperandIndex).clone()
          Op.setOperand(OperandIndex, Arg)
        if not isinstance(CommonType, RoseUndefinedType):
          assert not isinstance(CommonBitwidthVal, RoseUndefValue)
          Op.getOperand(OperandIndex).setType(CommonType)
          print("CommonType:")
          CommonType.print()
          # if Op.getOperand(OperandIndex) not in BVValToBitwidthVal:
          BVValToBitwidthVal[Op.getOperand(
              OperandIndex)] = CommonBitwidthVal
          # Op.getOperand(OperandIndex).getType().getBitwidth()
          if Op.getOperand(OperandIndex) in UnknownVal:
            UnknownVal.remove(Op.getOperand(OperandIndex))
        if Op.getOperand(OperandIndex) not in BVValToBitwidthVal:
          print("ADDING OPERAND TO UNKNOWN SET")
          Op.getOperand(OperandIndex).print()
          UnknownVal.add(Op.getOperand(OperandIndex))
          continue
      continue

    if isinstance(Op, RoseSelectOp):
      if Op in BVValToBitwidthVal:
        for OperandIndex, Operand in enumerate(Op.getOperands()):
          # Skip the condition operand
          if OperandIndex == 0:
            continue
          if isinstance(Operand, RoseConstant):
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Op.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Op.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            BVValToBitwidthVal[Op.getOperand(
                OperandIndex)] = BVValToBitwidthVal[Op]
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
            # Abstract away this constant value
            if isinstance(Operand.getType(), RoseBitVectorType):
              Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                            Operand.getType()))
            else:
              Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                           Operand.getType()))
            ArgToConstantValsMap[Arg] = Op.getOperand(
                OperandIndex).clone()
            Op.setOperand(OperandIndex, Arg)
            UnknownVal.add(Op.getOperand(OperandIndex))
            continue
          UnknownVal.add(Operand)
      continue

    if isinstance(Op, RoseBVPadHighBitsOp):
      # Extract the number of padded bits
      if isinstance(Op.getOperand(1), RoseConstant):
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getOperand(1).getType()))
        ArgToConstantValsMap[Arg] = Op.getOperand(1).clone()
        Op.setOperand(1, Arg)
      Visited.add(Op)
      continue

    if isinstance(Op, RoseBVExtractSliceOp):
      print("---EXTRACT OP:")
      Op.print()
      Bitwidth = Op.getOperand(Op.getBitwidthPos())
      # if Op not in SkipBVExtracts:
      print("OP IS NOT IN SKIP EXTRACT OPS LIST")
      if Loop == RoseUndefRegion():
        if len(LoopList) > 0:
          FixIndicesForBVOpsOutsideOfLoops(
              Op, Visited, LoopList[0].getEndIndex(), Context)
        BVValToBitwidthVal[Op] = Op.getOperand(Op.getBitwidthPos())
        if Op in UnknownVal:
          UnknownVal.remove(Op)
        AddBitwidthValForUnknownVal(Op, Op.getOperand(
            Op.getBitwidthPos()), BVValToBitwidthVal, UnknownVal)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
        Visited.add(Op)
        IndicesToBitwidth[(Op.getLowIndex(), Op.getHighIndex())] = Op.getOperand(
            Op.getBitwidthPos())
        continue
      if Op in BVValToBitwidthVal:
        Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
        Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
        BVValToBitwidthVal[Op] = Op.getOperand(Op.getBitwidthPos())
        print("^^^^^^^^EXTRACT OP:")
        Op.print()
      elif Op in OpBitwidthEqLoopStepList:
        Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
        Op.setType(RoseBitVectorType.create(Loop.getStep()))
        BVValToBitwidthVal[Op] = Loop.getStep()
        if Op in UnknownVal:
          UnknownVal.remove(Op)
        print("MODIFIED EXTRACT OP:")
        Op.print()
        AddBitwidthValForUnknownVal(
            Op, Loop.getStep(), BVValToBitwidthVal, UnknownVal)
        print("********EXTRACT OP:")
        Op.print()
      elif (Op.getLowIndex(), Op.getHighIndex()) in IndicesToBitwidth:
        BitwidthVal = IndicesToBitwidth[(
            Op.getLowIndex(), Op.getHighIndex())]
        Op.setOperand(Op.getBitwidthPos(), BitwidthVal)
        Op.setType(RoseBitVectorType.create(BitwidthVal))
        BVValToBitwidthVal[Op] = Op.getOperand(Op.getBitwidthPos())
        if Op in UnknownVal:
          UnknownVal.remove(Op)
        print("++++-EXTRACT OP:")
        Op.print()
      else:
        # Add a new argument
        Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                     Op.getOperand(Op.getBitwidthPos()).getType()))
        ArgToConstantValsMap[Arg] = Op.getOperand(3).clone()
        Op.setOperand(Op.getBitwidthPos(), Arg)
        Op.setType(RoseBitVectorType.create(Arg))
        BVValToBitwidthVal[Op] = Arg
        if Op in UnknownVal:
          UnknownVal.remove(Op)
        AddBitwidthValForUnknownVal(
            Op, Arg, BVValToBitwidthVal, UnknownVal)
        print("------EXTRACT OP:")
        Op.print()
      if Loop != RoseUndefRegion():
        print("EXTRACT OP:")
        Op.print()
        FixIndicesForBVOpsInsideOfLoops(Function, Op, Bitwidth, Loop.getIterator(),
                                        Loop.getStep(), Visited, Context,
                                        ArgToConstantValsMap)
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
      Visited.add(Op)
      IndicesToBitwidth[(Op.getLowIndex(), Op.getHighIndex())] = Op.getOperand(
          Op.getBitwidthPos())
      continue

    if isinstance(Op, RoseBVInsertSliceOp):
      print("---INSERT OP:")
      Op.print()
      #CorrespondingCondOp = RoseUndefValue()
      CorrespondingCondOps = None
      if Op in CondBlocksBVInsertsMap:
        CorrespondingCondOps = CondBlocksBVInsertsMap[Op]
      if Loop == RoseUndefRegion():
        FixIndicesForBVOpsOutsideOfLoops(
            Op, Visited, LoopList[0].getEndIndex(), Context)
        Visited.add(Op)
        if isinstance(Op.getInsertValue(), RoseConstant):
          # Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
          #                                              Op.getType()))
          #ArgToConstantValsMap[Arg] = Op.getOperand(0).clone()
          #Op.setOperand(0, Arg)
          FullBitvectorVal = ComputeBitvectorValue(Op.getInsertValue(),
                                                   Op.getInputBitVector().getType().getBitwidth())
          Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                        Op.getInputBitVector().getType()))
          # Generate an extract op
          if isinstance(Op.getOperand(Op.getBitwidthPos()), RoseConstant):
            ExtractOp = RoseBVExtractSliceOp.create(Context.genName(), Arg,
                                                    Op.getLowIndex(), Op.getHighIndex(), Op.getOperand(Op.getBitwidthPos()))
          else:
            ExtractOp = RoseBVExtractSliceOp.create(Context.genName(), Arg,
                                                    Op.getLowIndex(), Op.getHighIndex(),
                                                    ArgToConstantValsMap[Op.getOperand(Op.getBitwidthPos())])
            ExtractOp.setOperand(
                ExtractOp.getBitwidthPos(), Op.getOperand(Op.getBitwidthPos()))
          Block.addOperationBefore(ExtractOp, Op)
          ArgToConstantValsMap[Arg] = RoseConstant(
              FullBitvectorVal, Op.getInputBitVector().getType())
          # Op.getInsertValue().clone()
          #Op.setOperand(0, Arg)
          Op.setOperand(0, ExtractOp)
        Op.getInsertValue().setType(RoseBitVectorType.create(
            Op.getOperand(Op.getBitwidthPos())))
        BVValToBitwidthVal[Op.getInsertValue()] = Op.getOperand(
            Op.getBitwidthPos())
        # Add indexing ops in a set
        for IndexingOp in GatherIndexingOps(Op):
          IndexingOps.add(IndexingOp)
        # Map the output bitwidth of corresponding bvinsert, if any.
        if CorrespondingCondOps != None:
          for CorrespondingCondOp in CorrespondingCondOps:
            if CorrespondingCondOp in CondBlocksBVInsertsMap:
              BVValToBitwidthVal[CorrespondingCondOp] = BVValToBitwidthVal[Op]
        IndicesToBitwidth[(Op.getLowIndex(), Op.getHighIndex())] = Op.getOperand(
            Op.getBitwidthPos())
        continue
      Bitwidth = Op.getOperand(Op.getBitwidthPos())
      if Loop == LoopList[0]:
        Op.setOperand(Op.getBitwidthPos(), LoopList[0].getStep())
        BVValToBitwidthVal[Op] = Loop.getStep()
      elif Loop.getParentOfType(RoseForLoop) != LoopList[0]:
        print("Op.getLowIndex():")
        Op.getLowIndex().print()
        print("LoopList[0]:")
        LoopList[0].print()
        assert Op.getLowIndex() != LoopList[0].getIterator()
        Op.setOperand(Op.getBitwidthPos(), LoopList[0].getStep())
        # Op.setType(RoseBitVectorType.create(LoopList[0].getStep()))
        BVValToBitwidthVal[Op] = Loop.getStep()
      else:
        if Op.getLowIndex() == LoopList[0].getIterator():
          Op.setOperand(Op.getBitwidthPos(), LoopList[0].getStep())
          # Op.setType(RoseBitVectorType.create(LoopList[0].getStep()))
          BVValToBitwidthVal[Op] = LoopList[0].getStep()
        elif Op in OpBitwidthEqLoopStepList:
          Op.setOperand(Op.getBitwidthPos(), Loop.getStep())
          # Op.setType(RoseBitVectorType.create(Loop.getStep()))
          BVValToBitwidthVal[Op] = Loop.getStep()
        elif Op in BVValToBitwidthVal:
          print("HERE")
          Op.setOperand(Op.getBitwidthPos(), BVValToBitwidthVal[Op])
          # Op.setType(RoseBitVectorType.create(BVValToBitwidthVal[Op]))
          BVValToBitwidthVal[Op] = Op.getOperand(Op.getBitwidthPos())
        elif (Op.getLowIndex(), Op.getHighIndex()) in IndicesToBitwidth:
          BitwidthVal = IndicesToBitwidth[(
              Op.getLowIndex(), Op.getHighIndex())]
          Op.setOperand(Op.getBitwidthPos(), BitwidthVal)
          # Op.setType(RoseBitVectorType.create(BitwidthVal))
          BVValToBitwidthVal[Op] = Op.getOperand(Op.getBitwidthPos())
        else:
          # Add a new argument
          Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                       Op.getOperand(Op.getBitwidthPos()).getType()))
          ArgToConstantValsMap[Arg] = Op.getOperand(
              Op.getBitwidthPos()).clone()
          Op.setOperand(Op.getBitwidthPos(), Arg)
          # Op.setType(RoseBitVectorType.create(Arg))
          BVValToBitwidthVal[Op] = Arg
      print("-----Op.getInsertValue():")
      Op.getInsertValue().print()
      BVValToBitwidthVal[Op.getInsertValue()] = BVValToBitwidthVal[Op]
      FixIndicesForBVOpsInsideOfLoops(Function, Op, Bitwidth, Loop.getIterator(),
                                      Loop.getStep(), Visited, Context,
                                      ArgToConstantValsMap)
      print("BVINSERT OP:")
      Op.print()
      Visited.add(Op)
      if isinstance(Op.getInsertValue(), RoseConstant):
        # Arg = Function.appendArg(RoseArgument.create(Context.genName("%" + "arg"), \
        #                                              Op.getType()))
        FullBitvectorVal = ComputeBitvectorValue(Op.getInsertValue(),
                                                 Op.getInputBitVector().getType().getBitwidth())
        Arg = Function.prependArg(RoseArgument.create(Context.genName("%" + "arg"),
                                                      Op.getInputBitVector().getType()))
        # Generate an extract op
        if isinstance(Op.getOperand(Op.getBitwidthPos()), RoseConstant):
          ExtractOp = RoseBVExtractSliceOp.create(Context.genName(), Arg,
                                                  Op.getLowIndex(), Op.getHighIndex(), Op.getOperand(Op.getBitwidthPos()))
        else:
          ExtractOp = RoseBVExtractSliceOp.create(Context.genName(), Arg,
                                                  Op.getLowIndex(), Op.getHighIndex(),
                                                  ArgToConstantValsMap[Op.getOperand(Op.getBitwidthPos())])
          ExtractOp.setOperand(
              ExtractOp.getBitwidthPos(), Op.getOperand(Op.getBitwidthPos()))
        Block.addOperationBefore(ExtractOp, Op)
        ArgToConstantValsMap[Arg] = RoseConstant(
            FullBitvectorVal, Op.getInputBitVector().getType())
        # Op.getInsertValue().clone()
        #Op.setOperand(0, Arg)
        Op.setOperand(0, ExtractOp)
      print("********Op.getInsertValue():")
      Op.getInsertValue().print()
      print(Op.getInsertValue().ID)
      print(id(Op.getInsertValue()))
      print(type(Op.getInsertValue()))
      Op.getInsertValue().setType(RoseBitVectorType.create(
          Op.getOperand(Op.getBitwidthPos())))
      print(Op.getInsertValue().getType())
      for Arg in Block.getFunction().getArgs():
        print("ARG:")
        Arg.print()
        print(Arg.ID)
        Arg.getType().print()
        print(id(Arg))
      print("********************")
      # Add indexing ops in a set
      for IndexingOp in GatherIndexingOps(Op):
        IndexingOps.add(IndexingOp)
      # Map the output bitwidth of corresponding bvinsert, if any.
      if CorrespondingCondOps != None:
        for CorrespondingCondOp in CorrespondingCondOps:
          if not isinstance(CorrespondingCondOp, RoseUndefValue):
            if CorrespondingCondOp in CondBlocksBVInsertsMap \
                    and Op in BVValToBitwidthVal:
              print("CorrespondingCondOp:")
              CorrespondingCondOp.print()
              BVValToBitwidthVal[CorrespondingCondOp] = BVValToBitwidthVal[Op]
      IndicesToBitwidth[(Op.getLowIndex(), Op.getHighIndex())] = Op.getOperand(
          Op.getBitwidthPos())
      continue
  return


def MapBVInsertsInCondBlocks(Function: RoseFunction):
  print("FUNCTION:")
  Function.print()
  print("MapBVInsertsInCondBlocks:")
  CondBlocksBVInsertsMap = dict()

  # Lambda function
  def ExtractBVInsertsToRetVal(Regions: list):
    OpList = list()
    LocalCondBlocksBVInsertsMap = dict()
    for Region in Regions:
      if isinstance(Region, RoseBlock):
        for Op in Region.getOperations():
          if isinstance(Op, RoseBVInsertSliceOp):
            # if Op.getInputBitVector() == Function.getReturnValue():
            OpList.append(Op)
      elif isinstance(Region, RoseCond):
        MapBVInsertsInCondRegion(Region, LocalCondBlocksBVInsertsMap)
    for Op, ItemOps in LocalCondBlocksBVInsertsMap.items():
      assert isinstance(ItemOps, list)
      if Op not in OpList:
        OpList.append(Op)
      if Op not in CondBlocksBVInsertsMap:
        CondBlocksBVInsertsMap[Op] = ItemOps
      else:
        CondBlocksBVInsertsMap[Op].extend(ItemOps)
    return OpList

  def MapBVInsertsInCondRegion(CondRegion: RoseCond, LocalCondBlocksBVInsertsMap: dict):
    # Initialize the dictionary with a list for every keyed subregion
    #KeyedSubRegions = dict()
    KeyedSubRegionsBVInsertOps = dict()
    for Key in CondRegion.getKeys():
      KeyedSubRegionsBVInsertOps[Key] = ExtractBVInsertsToRetVal(
          CondRegion.getChildren(Key))
    # Map all bvinserts to each other
    for Key, BVInsertOps in KeyedSubRegionsBVInsertOps.items():
      for CheckKey, CheckBVInsertOps in KeyedSubRegionsBVInsertOps.items():
        if Key == CheckKey:
          continue
        for BVInsertOp in BVInsertOps:
          for CheckBVInsertOp in CheckBVInsertOps:
            if BVInsertOp not in LocalCondBlocksBVInsertsMap:
              LocalCondBlocksBVInsertsMap[BVInsertOp] = [
                  CheckBVInsertOp]
            else:
              LocalCondBlocksBVInsertsMap[BVInsertOp].append(
                  CheckBVInsertOp)
            if CheckBVInsertOp not in LocalCondBlocksBVInsertsMap:
              LocalCondBlocksBVInsertsMap[CheckBVInsertOp] = [
                  BVInsertOp]
            else:
              LocalCondBlocksBVInsertsMap[CheckBVInsertOp].append(
                  BVInsertOp)
            print("BVInsertOp <-> CheckBVInsertOp:")
            BVInsertOp.print()
            CheckBVInsertOp.print()

  CondRegions = Function.getRegionsOfType(RoseCond)
  print("len(CondRegions):")
  print(len(CondRegions))
  for CondRegion in CondRegions:
    # This is only application on cond regions for which all bvinserts
    # are of the same size.
    BlockList = list()
    for Key in CondRegion.getKeys():
      BlockList.extend(CondRegion.getRegionsOfType(
          RoseBlock, Level=0, Key=Key))
    Bitwidth = RoseUndefValue()
    SkipCondRegion = False
    for Block in BlockList:
      for Op in Block:
        if isinstance(Op, RoseBVInsertSliceOp):
          if isinstance(Bitwidth, RoseUndefValue):
            Bitwidth = Op.getOperand(Op.getBitwidthPos())
            continue
          if Bitwidth != Op.getOperand(Op.getBitwidthPos()):
            SkipCondRegion = True
            break
      if SkipCondRegion == True:
        break
    if SkipCondRegion == True:
      continue
    print("CondRegion:")
    CondRegion.print()
    MapBVInsertsInCondRegion(CondRegion, CondBlocksBVInsertsMap)
  return CondBlocksBVInsertsMap


def ExtractConstants(Function: RoseFunction, Context: RoseContext,
                     ArgToConstantValsMap: dict):
  # If there are multiple sibling inner loops, then we deal with it differently
  # if len(Function.getRegionsOfType(RoseForLoop, Level=1)) > 1:
  #  ExtractConstantsMultipleLoops(Function, Context, ArgToConstantValsMap)
  #  return

  # Fix the loop bounds
  OuterLoopList = Function.getRegionsOfType(RoseForLoop, 0)
  for OuterLoop in OuterLoopList:
    # Fix the bounds of this outer loop.
    VectorSize = Function.appendArg(RoseArgument.create(Context.genName("%vectsize"),
                                                        OuterLoop.getIterator().getType()))
    ArgToConstantValsMap[VectorSize] = OuterLoop.getEndIndex().clone()
    OuterLoop.setEndIndexVal(VectorSize)
    OuterLaneSize = Function.appendArg(RoseArgument.create(Context.genName("%outerlanesize"),
                                                           OuterLoop.getIterator().getType()))
    ArgToConstantValsMap[OuterLaneSize] = OuterLoop.getStep().clone()
    OuterLoop.setStepVal(OuterLaneSize)
    # Fix the bounds of the inner loops
    InnerLoops = OuterLoop.getRegionsOfType(RoseForLoop)
    for InnerLoop in InnerLoops:
      InnerLaneOffset = Function.appendArg(RoseArgument.create(Context.genName("%innerlaneoffset"),
                                                               InnerLoop.getIterator().getType()))
      ArgToConstantValsMap[InnerLaneOffset] = InnerLoop.getStartIndex(
      ).clone()
      InnerLoop.setStartIndexVal(InnerLaneOffset)
      InnerLaneSize = Function.appendArg(RoseArgument.create(Context.genName("%innerlanesize"),
                                                             InnerLoop.getIterator().getType()))
      ArgToConstantValsMap[InnerLaneSize] = InnerLoop.getEndIndex(
      ).clone()
      InnerLoop.setEndIndexVal(InnerLaneSize)
      InnerElemSize = Function.appendArg(RoseArgument.create(Context.genName("%elemsize"),
                                                             InnerLoop.getIterator().getType()))
      ArgToConstantValsMap[InnerElemSize] = InnerLoop.getStep().clone()
      InnerLoop.setStepVal(InnerElemSize)
  Function.print()

  # Handle accumulation code
  Visited = set()
  BVValToBitwidthVal = dict()
  # ExtractConstantsFromAccumulationCode(Function, BVValToBitwidthVal, \
  #                                    Context, ArgToConstantValsMap, Visited)

  # Replace the inserted constants by new arguments
  #ReplaceInsertedConstantBVWithArg(Function, Context, ArgToConstantValsMap)
  print("*********Function:")
  Function.print()

  # Gather bvextract ops that index into masks and serve as conditions for
  # cond regions in the function. We will not need to extract output bitwidths
  # of these ops because the bitwidth of conditions for bitwidths is always one.
  SkipBVExtracts = GetBVExtractsToBeSkipped(Function)
  for Op in SkipBVExtracts:
    print("*******SkipBVExtracts:")
    Op.print()

  # Find mapping between two similar bvinserts in different condblocks
  CondBlocksBVInsertsMap = MapBVInsertsInCondBlocks(Function)

  DealWithSkippedBVExtracts(Function, SkipBVExtracts, Context)

  print("@@@@@@@@@@@@@@@@@@!!!!!!Function:")
  Function.print()
  for Block in Function.getRegionsOfType(RoseBlock):
    for Op in Block:
      if isinstance(Op, RoseBVInsertSliceOp):
        print("bvinsert op:")
        Op.print()
        print("Op.getInputBitVector():")
        Op.getInputBitVector().print()
        print(Op.getInputBitVector().ID)
        print("Function.getReturnValue():")
        Function.getReturnValue().print()
        print(Function.getReturnValue().ID)

  UnknownVal = set()
  BlockList = Function.getRegionsOfType(RoseBlock)
  #LoopList = Function.getRegionsOfType(RoseForLoop)
  IndexingOps = set()
  for Block in BlockList:
    print("---Block in List:")
    Block.print()
    LoopList = list()
    Parent = Block.getParentOfType(RoseForLoop)
    while not isinstance(Parent, RoseUndefRegion):
      LoopList.append(Parent)
      Parent = Parent.getParentOfType(RoseForLoop)
    LoopList.reverse()
    for Loop in LoopList:
      print("^^^^^^LOOP LIST:")
      Loop.print()
    print("len(LoopList):")
    print(len(LoopList))
    print("Block:")
    Block.print()
    ExtractConstantsFromBlock(Block, BVValToBitwidthVal, Visited, UnknownVal,
                              IndexingOps, LoopList, SkipBVExtracts,
                              CondBlocksBVInsertsMap, Context, ArgToConstantValsMap)
  Function.print()
  print("NEW FUNCTION ^^^^")


def ExtractConstantsFromFunction(Function: RoseFunction,
                                 Context: RoseContext, ArgToConstantValsMap: dict):
  print("EXTRACT CONSTANTS IN FUNCTION")
  print("FUNCTION:")
  Function.print()
  # The function must be in the canonical form
  #assert IsFunctionInCanonicalForm(Function) == True
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
def Run(Function: RoseFunction, Context: RoseContext,
        ArgToConstantValsMap: dict):
  ExtractConstantsFromFunction(Function, Context,  ArgToConstantValsMap)
  print("\n\n\n\n\n")
  Function.print()
