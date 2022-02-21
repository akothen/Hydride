BVValToBitwidthVal = map()
UnknownVal = list()
for Op in reversed(Block):
  if Op.isSizeChangingOp():
    if Op in BVValToBitwidthVal:
      Op.setSizeOperand(BVValToBitwidthVal[Op])
      if Op.getOperand() not in BVValToBitwidthVal:
        UnknownVal.append(Op.getOperand())
      continue
    Arg = ExtractConstant(Op.sizeOperand())
    BVValToBitwidthVal[Op] = Arg
    AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
    continue
  
  if Op.outputAndInputTypesAresSame():
    if Op in BVValToBitwidthVal:
      for Operand in Op.getOperands():
        BVValToBitwidthVal[Operand] = BVValToBitwidthVal[Op]
    else:
      for Operand in Op.getOperands():
        UnknownVal.append(Operand)
    continue

  if Op.getOpcode() == RoseBVExtractOp:
    if Op in BVValToBitwidthVal:
      Op.setPrecision(BVValToBitwidthVal[Op])
    else:
      Arg = ExtractConstant(Op.sizeOperand())
      BVValToBitwidthVal[Op] = Arg
      AddBitwidthValForUnknownVal(Op, Arg, BVValToBitwidthVal, UnknownVal)
    # high_index = low_index + (precision - 1)
    if Op.LowIndex().isConstant()
      ExtractConstant(Op.LowIndex())
    else:
      assert Op.HighIndex().getOpcode() == RoseAddOp
      LastIdx = RoseSubOp.create(Op.getPrecision(), 1)
      Op.HighIndex().setOperand(LastIdx)
    continue

  if Op.getOpcode() == RoseBVInsertOp:
    if Op.LowIndex() == LaneIndex:
      Op.setPrecision(lane_size)
      BVValToBitwidthVal[Op.getInsertVal()] = lane_size
    else:
      Op.setPrecision(elem_size)
      BVValToBitwidthVal[Op.getInsertVal()] = elem_size
    # high_index = low_index + (precision - 1)
    if Op.LowIndex().isConstant()
      ExtractConstant(Op.LowIndex())
    else:
      assert Op.HighIndex().getOpcode() == RoseAddOp
      LastIdx = RoseSubOp.create(Op.getPrecision(), 1)
      Op.HighIndex().setOperand(LastIdx)
      
