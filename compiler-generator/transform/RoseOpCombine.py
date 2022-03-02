#############################################################
#
# This pass combines different operations and simplifies 
# the IR.
#
#############################################################


import re
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *
from RoseUtilities import *


def OpCombineMultiplePatterns(FirstOp : RoseOperation, SecondOp : RoseOperation, \
                              Context : RoseContext):
  print("OP COMBINE PATTENS")
  print("FirstOp:")
  FirstOp.print()
  print("SecondOp:")
  SecondOp.print()
  # Some sanity checks
  assert isinstance(FirstOp, RoseAddOp) \
      or isinstance(FirstOp, RoseSubOp) \
      or isinstance(FirstOp, RoseMulOp) \
      or isinstance(FirstOp, RoseDivOp)
  assert isinstance(SecondOp, RoseAddOp) \
      or isinstance(SecondOp, RoseSubOp) \
      or isinstance(SecondOp, RoseMulOp) \
      or isinstance(SecondOp, RoseDivOp)
  if len(FirstOp.getOperands()) != 2 \
  or len(SecondOp.getOperands()) != 2:
    return False
  if FirstOp.getParent() != SecondOp.getParent():
    return False

  # Important requirement: SecondOp is a user of FirstOp
  assert SecondOp.getOperand(0) == FirstOp \
      or SecondOp.getOperand(1) == FirstOp

  # Important requirement that operands of the first op 
  # must be operations.
  if not isinstance(FirstOp.getOperand(0), RoseOperation) \
    or not isinstance(FirstOp.getOperand(1), RoseOperation):
    return False
  
  # Lambda function
  def GetConstantOperation(Op : RoseOperation):
    if isinstance(Op.getOperand(0), RoseConstant) \
    and not isinstance(Op.getOperand(1), RoseConstant):
      return Op.getOperand(0), 0
    elif not isinstance(Op.getOperand(0), RoseConstant) \
    and isinstance(Op.getOperand(1), RoseConstant):
      return Op.getOperand(1), 1
    return RoseUndefValue(), None
  
  # Get the constant operands
  ConstantOperand1_1, ConstantIndex1_1  = GetConstantOperation(FirstOp.getOperand(0))
  if ConstantOperand1_1 == RoseUndefValue():
    return False
  assert isinstance(ConstantOperand1_1, RoseConstant)
  ConstantOperand1_2, ConstantIndex1_2  = GetConstantOperation(FirstOp.getOperand(1))
  if ConstantOperand1_2 == RoseUndefValue():
    return False
  assert isinstance(ConstantOperand1_2, RoseConstant)
  ConstantOperand2, ConstantIndex2 = GetConstantOperation(SecondOp)
  if ConstantOperand2 == RoseUndefValue():
    return False
  assert isinstance(ConstantOperand2, RoseConstant)
  assert ConstantOperand1_1.getType() == ConstantOperand1_2.getType()
  assert ConstantOperand1_2.getType() == ConstantOperand2.getType()
  if ConstantIndex1_1 == 0:
    NonConstantIndex1_1 = 1
  else:
    NonConstantIndex1_1 = 0
  if ConstantIndex1_2 == 0:
    NonConstantIndex1_2 = 1
  else:
    NonConstantIndex1_2 = 0
  if ConstantIndex2 == 0:
    NonConstantIndex2 = 1
  else:
    NonConstantIndex2 = 0
  print("ConstantOperand1_1:")
  print(ConstantOperand1_1)
  print("ConstantOperand1_2:")
  print(ConstantOperand1_2)
  print("ConstantOperand2:")
  print(ConstantOperand2)

  Block = FirstOp.getParent()
  FirstOp_1 = FirstOp.getOperand(0)
  FirstOp_2 = FirstOp.getOperand(1)

  # Now we deal with different patterns
  # TODO: Add more patterns
  if isinstance(FirstOp, RoseAddOp) \
  and isinstance(SecondOp, RoseMulOp) \
  and isinstance(FirstOp_1, RoseDivOp) \
  and isinstance(FirstOp_2, RoseDivOp) \
  and ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
    if len(FirstOp_1.getUsers()) == 1 and len(FirstOp_2.getUsers()) == 1 \
    and len(FirstOp.getUsers()) == 1:
      if ConstantIndex1_1 == 1 and ConstantIndex1_2 == 1:
        if ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
          # first_op_1:  y1 = div x1, c
          # first_op_2:  y2 = div x2, c
          # first_op:     y = add y1, y2
          # second_op:    z = mul y, c
          # result:       z = add x1, x2
          NewOp = RoseAddOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  [FirstOp_1.getOperand(NonConstantIndex1_1), \
                                  FirstOp_2.getOperand(NonConstantIndex1_2)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # Delete the relevant ops
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          Block.eraseOperation(FirstOp_1)
          Block.eraseOperation(FirstOp_2)
          return True
    return False

  if isinstance(FirstOp, RoseSubOp) \
  and isinstance(SecondOp, RoseMulOp) \
  and isinstance(FirstOp_1, RoseDivOp) \
  and isinstance(FirstOp_2, RoseDivOp) \
  and ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
    if len(FirstOp_1.getUsers()) == 1 and len(FirstOp_2.getUsers()) == 1 \
    and len(FirstOp.getUsers()) == 1:
      if ConstantIndex1_1 == 1 and ConstantIndex1_2 == 1:
        if ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
          # first_op_1:  y1 = div x1, c
          # first_op_2:  y2 = div x2, c
          # first_op:     y = sub y1, y2
          # second_op:    z = mul y, c
          # result:       z = add x1, x2
          NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  [FirstOp_1.getOperand(NonConstantIndex1_1), \
                                  FirstOp_2.getOperand(NonConstantIndex1_2)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # Delete the relevant ops
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          Block.eraseOperation(FirstOp_1)
          Block.eraseOperation(FirstOp_2)
          return True
    return False

  if isinstance(FirstOp, RoseAddOp) \
  and isinstance(SecondOp, RoseDivOp) \
  and isinstance(FirstOp_1, RoseMulOp) \
  and isinstance(FirstOp_2, RoseMulOp) \
  and ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
    if len(FirstOp_1.getUsers()) == 1 and len(FirstOp_2.getUsers()) == 1 \
    and len(FirstOp.getUsers()) == 1:
      if ConstantIndex2 == 1:
        if ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
          # first_op_1:  y1 = mul x1, c
          # first_op_2:  y2 = mul x2, c
          # first_op:     y = add y1, y2
          # second_op:    z = div y, c
          # result:       z = add x1, x2
          NewOp = RoseAddOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  [FirstOp_1.getOperand(NonConstantIndex1_1), \
                                  FirstOp_2.getOperand(NonConstantIndex1_2)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # Delete the relevant ops
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          Block.eraseOperation(FirstOp_1)
          Block.eraseOperation(FirstOp_2)
          return True
    return False

  if isinstance(FirstOp, RoseSubOp) \
  and isinstance(SecondOp, RoseDivOp) \
  and isinstance(FirstOp_1, RoseMulOp) \
  and isinstance(FirstOp_2, RoseMulOp) \
  and ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
    if len(FirstOp_1.getUsers()) == 1 and len(FirstOp_2.getUsers()) == 1 \
    and len(FirstOp.getUsers()) == 1:
      if ConstantIndex2 == 1:
        if ConstantOperand1_1.getValue() == ConstantOperand1_2.getValue():
          # first_op_1:  y1 = mul x1, c
          # first_op_2:  y2 = mul x2, c
          # first_op:     y = sub y1, y2
          # second_op:    z = div y, c
          # result:       z = add x1, x2
          NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  [FirstOp_1.getOperand(NonConstantIndex1_1), \
                                  FirstOp_2.getOperand(NonConstantIndex1_2)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # Delete the relevant ops
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          Block.eraseOperation(FirstOp_1)
          Block.eraseOperation(FirstOp_2)
          return True
    return False


# One operand of each of FirstOp and SecondOp have to be constants.
def OpCombinePatterns(FirstOp : RoseOperation, SecondOp : RoseOperation, Context : RoseContext):
  print("OP COMBINE PATTENS")
  print("FirstOp:")
  FirstOp.print()
  print("SecondOp:")
  SecondOp.print()
  # Some sanity checks
  assert isinstance(FirstOp, RoseAddOp) \
      or isinstance(FirstOp, RoseSubOp) \
      or isinstance(FirstOp, RoseMulOp) \
      or isinstance(FirstOp, RoseDivOp)
  assert isinstance(SecondOp, RoseAddOp) \
      or isinstance(SecondOp, RoseSubOp) \
      or isinstance(SecondOp, RoseMulOp) \
      or isinstance(SecondOp, RoseDivOp)
  if len(FirstOp.getOperands()) != 2 \
  or len(SecondOp.getOperands()) != 2:
    return False
  if FirstOp.getParent() != SecondOp.getParent():
    return False

  # Important requirement: SecondOp is a user of FirstOp
  assert SecondOp.getOperand(0) == FirstOp \
      or SecondOp.getOperand(1) == FirstOp
  
  # Lambda function
  def GetConstantOperation(Op : RoseOperation):
    if isinstance(Op.getOperand(0), RoseConstant) \
    and not isinstance(Op.getOperand(1), RoseConstant):
      return Op.getOperand(0), 0
    elif not isinstance(Op.getOperand(0), RoseConstant) \
    and isinstance(Op.getOperand(1), RoseConstant):
      return Op.getOperand(1), 1
    return RoseUndefValue(), None
  
  # Get the constant operands
  ConstantOperand1, ConstantIndex1  = GetConstantOperation(FirstOp)
  if ConstantOperand1 == RoseUndefValue():
    return False
  assert isinstance(ConstantOperand1, RoseConstant)
  ConstantOperand2, ConstantIndex2 = GetConstantOperation(SecondOp)
  if ConstantOperand2 == RoseUndefValue():
    return False
  assert isinstance(ConstantOperand2, RoseConstant)
  assert ConstantOperand1.getType() == ConstantOperand2.getType()
  if ConstantIndex1 == 0:
    NonConstantIndex1 = 1
  else:
    NonConstantIndex1 = 0
  if ConstantIndex2 == 0:
    NonConstantIndex2 = 1
  else:
    NonConstantIndex2 = 0
  print("ConstantOperand1:")
  print(ConstantOperand1)
  print("ConstantOperand2:")
  print(ConstantOperand2)

  Block = FirstOp.getParent()

  # Now we deal with different patterns
  # TODO: Add more patterns
  if isinstance(FirstOp, RoseMulOp) \
  and isinstance(SecondOp, RoseMulOp):
    if len(FirstOp.getUsers()) == 1:
      # first_op:  y = mul x, c1
      # second_op: z = mul y, c2
      # result: z = mul x, (c1 * c2) 
      NewOperandVal = ConstantOperand2.getValue() * ConstantOperand1.getValue()
      NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand2.getType())
      # Replace the operands of the second op
      SecondOp.setOperand(ConstantIndex2, NewOperand)
      SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
      # Delete the first op
      Block.eraseOperation(FirstOp)
      return True
    return False
  
  if isinstance(FirstOp, RoseDivOp) \
  and isinstance(SecondOp, RoseDivOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ((ConstantIndex1 == 0 and ConstantIndex2 == 1) \
      or (ConstantIndex1 == 0 and ConstantIndex2 == 0)):
      # See cases 3 and 4 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      if (ConstantIndex1 == 1 and ConstantIndex2 == 1) \
      or (ConstantIndex1 == 1 and ConstantIndex2 == 0):
        # Case 1:
        # first_op:  y = div x, c1
        # second_op: z = div y, c2
        # result: z = div x, (c1 * c2) 
        # Case 2:
        # first_op:  y = div x, c1
        # second_op: z = div c2, y
        # result: z = div (c1 * c2), x
        NewOperandVal = ConstantOperand2.getValue() * ConstantOperand1.getValue()
        NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand2.getType())
        # Replace the operands of the second op
        SecondOp.setOperand(ConstantIndex2, NewOperand)
        SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
        # Delete the first op
        Block.eraseOperation(FirstOp)
        return True
      if ConstantIndex1 == 0 and ConstantIndex2 == 0:
       # Case 3:
        # first_op:  y = div c1, x
        # second_op: z = div c2, y
        # result: z = div x, (c1 / c2) when c1 > c2
        # result: z = mul x, (c2 / c1) when c2 > c1
        # result: z = x                when c1 == c2 (dealt with already)
        if ConstantOperand1.getValue() > ConstantOperand2.getValue():
          # result: z = div x, (c1 / c2) when c1 > c2
          NewOperandVal = ConstantOperand1.getValue() / ConstantOperand2.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create(Context.genName(SecondOp.getName() + ".new"), \
                        FirstOp.getOperand(NonConstantIndex1), NewOperand)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
        if ConstantOperand1.getValue() < ConstantOperand2.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create(Context.genName(SecondOp.getName() + ".new"), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
      if ConstantIndex1 == 0 and ConstantIndex2 == 1:
        # Case 4:
        # first_op:  y = div c1, x
        # second_op: z = div y, c2
        # result: z = div (c1 / c2), x when c1 > c2
        # result: z = mul x, (c2 / c1) when c2 > c1
        # result: z = x                when c1 == c2 (dealt with already)
        if ConstantOperand1.getValue() > ConstantOperand2.getValue():
          # result: z = div x, (c1 / c2) when c1 > c2
          NewOperandVal = ConstantOperand1.getValue() / ConstantOperand2.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create(Context.genName(SecondOp.getName() + ".new"), \
                        NewOperand, FirstOp.getOperand(NonConstantIndex1))
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
        if ConstantOperand1.getValue() < ConstantOperand2.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create(Context.genName(SecondOp.getName() + ".new"), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
    return False
  
  if isinstance(FirstOp, RoseMulOp) \
  and isinstance(SecondOp, RoseDivOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ConstantIndex2 == 1:
      # See cases 2 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      if ConstantIndex2 == 0:
        # Case 1:
        # first_op:  y = mul c1, x
        # second_op: z = div c2, y
        # result: z = div (c2 / c1), x when c2 > c1
        # result: z = No change        when c1 > c2
        # result: z = No change        when c1 == c2
        if ConstantOperand2.getValue() > ConstantOperand1.getValue():
          # result: z = div (c2 / c1), x when c2 > c1
          # Replace the operands of the second op
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Replace the operands of the second op
          SecondOp.setOperand(ConstantIndex2, NewOperand)
          SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
          # Delete the first op
          Block.eraseOperation(FirstOp)
          return True
        return False
      if ConstantIndex2 == 1:
        # Case 2:
        # first_op:  y = mul c1, x
        # second_op: z = div y, c2
        # result: z = div x, (c2 / c1) when c2 > c1
        # result: z = mul x, (c1 / c2) when c1 > c2
        # result: z = x                when c1 == c2 (already handled)
        if ConstantOperand2.getValue() > ConstantOperand1.getValue():
          # result: z = div x, (c2 / c1) when c2 > c1
          # Replace the operands of the second op
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Replace the operands of the second op
          SecondOp.setOperand(ConstantIndex2, NewOperand)
          SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
          # Delete the first op
          Block.eraseOperation(FirstOp)
          return True
        if ConstantOperand1.getValue() > ConstantOperand2.getValue():
          # result: z = mul x, (c1 / c2) when c1 > c2
          NewOperandVal = ConstantOperand1.getValue() / ConstantOperand2.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create(Context.genName(SecondOp.getName() + ".new"), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
    return False

  if isinstance(FirstOp, RoseDivOp) \
  and isinstance(SecondOp, RoseMulOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ConstantIndex1 == 1:
      # See cases 2 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      if ConstantIndex1 == 0:
        # Case 1:
        # first_op:  y = div c1, x
        # second_op: z = mul c2, y
        # result: z = div (c2 * c1), x
        # Replace the operands of the second op
        NewOperandVal = ConstantOperand2.getValue() * ConstantOperand1.getValue()
        NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
        # Generate a new div instruction
        NewOp = RoseDivOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  NewOperand, FirstOp.getOperand(NonConstantIndex1))
        Block.addOperationBefore(NewOp, SecondOp)
        SecondOp.replaceUsesWith(NewOp)
        # IMPORTANT: the second op must be removed before the first op.
        Block.eraseOperation(SecondOp)
        Block.eraseOperation(FirstOp)
        return True
      if ConstantIndex1 == 1:
        # Case 2:
        # first_op:  y = div x, c1
        # second_op: z = mul c2, y
        # result: z = div x, (c1 / c2) when c1 > c2
        # result: z = mul x, (c2 / c1) when c2 > c1
        # result: z = x                when c1 == c2 (already handled)
        if ConstantOperand1.getValue() > ConstantOperand2.getValue():
          # result: z = div x, (c1 / c2) when c1 > c2
          NewOperandVal = ConstantOperand1.getValue() / ConstantOperand2.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                    FirstOp.getOperand(NonConstantIndex1), NewOperand)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
        if ConstantOperand2.getValue() > ConstantOperand1.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return False
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create(Context.genName(SecondOp.getName() + ".new"), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
    return False
  
  # More patterns
  if isinstance(FirstOp, RoseAddOp) \
  and isinstance(SecondOp, RoseAddOp):
    if len(FirstOp.getUsers()) == 1:
      NewOperandVal = ConstantOperand2.getValue() + ConstantOperand1.getValue()
      NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand2.getType())
      # Replace the operands of the second op
      SecondOp.setOperand(ConstantIndex2, NewOperand)
      SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
      # Delete the first op
      Block.eraseOperation(FirstOp)
      return True
    return False
  
  if isinstance(FirstOp, RoseSubOp) \
  and isinstance(SecondOp, RoseSubOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ((ConstantIndex1 == 0 and ConstantIndex2 == 1) \
      or (ConstantIndex1 == 0 and ConstantIndex2 == 0)):
      # See cases 3 and 4 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      if (ConstantIndex1 == 1 and ConstantIndex2 == 1) \
      or (ConstantIndex1 == 1 and ConstantIndex2 == 0):
        # Case 1:
        # first_op:  y = sub x, c1
        # second_op: z = sub y, c2
        # result: z = sub x, (c1 + c2) 
        # Case 2:
        # first_op:  y = sub x, c1
        # second_op: z = sub c2, y
        # result: z = sub (c1 + c2), x
        NewOperandVal = ConstantOperand2.getValue() + ConstantOperand1.getValue()
        NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand2.getType())
        # Replace the operands of the second op
        SecondOp.setOperand(ConstantIndex2, NewOperand)
        SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
        # Delete the first op
        Block.eraseOperation(FirstOp)
        return True
      if ConstantIndex1 == 0 and ConstantIndex2 == 0:
       # Case 3:
        # first_op:  y = sub c1, x
        # second_op: z = sub c2, y
        # result: z = sub x, (c1 - c2) when c1 != c2
        # result: z = x                when c1 == c2 (dealt with already)
        if ConstantOperand1.getValue() != ConstantOperand2.getValue():
          # result: z = sub x, (c1 - c2) when c1 != c2
          NewOperandVal = ConstantOperand1.getValue() - ConstantOperand2.getValue()
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new sub instruction
          NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                        [FirstOp.getOperand(NonConstantIndex1), NewOperand])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
      if ConstantIndex1 == 0 and ConstantIndex2 == 1:
        # Case 4:
        # first_op:  y = sub c1, x
        # second_op: z = sub y, c2
        # result: z = sub (c1 - c2), x when c1 != c2
        # result: z = x                when c1 == c2 (dealt with already)
        if ConstantOperand1.getValue() != ConstantOperand2.getValue():
          # result: z = sub (c1 - c2), x when c1 != c2
          NewOperandVal = ConstantOperand1.getValue() - ConstantOperand2.getValue()
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                        [NewOperand, FirstOp.getOperand(NonConstantIndex1)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
    return False

  if isinstance(FirstOp, RoseAddOp) \
  and isinstance(SecondOp, RoseSubOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ConstantIndex2 == 1:
      # See cases 2 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      # Case 1:
      # first_op:  y = add c1, x
      # second_op: z = sub c2, y
      # result: z = sub (c2 - c1), x when c2 != c1
      # result: z = No change        when c1 == c2 (don't care)
      # Case 2:
      # first_op:  y = add c1, x
      # second_op: z = sub y, c2
      # result: z = sub x, (c2 - c1) when c2 != c1
      # result: z = x                when c1 == c2 (already handled)
      if ConstantOperand2.getValue() != ConstantOperand1.getValue():
        # result: z = sub (c2 - c1), x when c2 != c1
        # Replace the operands of the second op
        NewOperandVal = ConstantOperand2.getValue() - ConstantOperand1.getValue()
        NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
        # Replace the operands of the second op
        SecondOp.setOperand(ConstantIndex2, NewOperand)
        SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
        # Delete the first op
        Block.eraseOperation(FirstOp)
        return True
    return False

  if isinstance(FirstOp, RoseSubOp) \
  and isinstance(SecondOp, RoseAddOp):
    # Deal with the case where both instructions could be removed
    if ConstantOperand1.getValue() == ConstantOperand2.getValue() \
    and ConstantIndex1 == 1:
      # See cases 2 below.
      # result: z = x when c2 == c1
      # Just replace the uses of the second op
      SecondOp.replaceUsesWith(FirstOp.getOperand(NonConstantIndex1))
      # IMPORTANT: the second op must be removed before the first op.
      Block.eraseOperation(SecondOp)
      # Remove the first op only if it has no more uses
      if len(FirstOp.getUsers()) == 0:
        Block.eraseOperation(FirstOp)
      return True
    if len(FirstOp.getUsers()) == 1:
      if ConstantIndex1 == 0:
        # Case 1:
        # first_op:  y = sub c1, x
        # second_op: z = add c2, y
        # result: z = sub (c2 + c1), x
        # Replace the operands of the second op
        NewOperandVal = ConstantOperand2.getValue() + ConstantOperand1.getValue()
        NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
        # Generate a new div instruction
        NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                  [NewOperand, FirstOp.getOperand(NonConstantIndex1)])
        Block.addOperationBefore(NewOp, SecondOp)
        SecondOp.replaceUsesWith(NewOp)
        # IMPORTANT: the second op must be removed before the first op.
        Block.eraseOperation(SecondOp)
        Block.eraseOperation(FirstOp)
        return True
      if ConstantIndex1 == 1:
        # Case 2:
        # first_op:  y = sub x, c1
        # second_op: z = add c2, y
        # result: z = sub x, (c1 - c2) when c1 != c2
        # result: z = x                when c1 == c2 (already handled)
        if ConstantOperand1.getValue() != ConstantOperand2.getValue():
          # result: z = sub x, (c1 - c2) when c1 != c2
          NewOperandVal = ConstantOperand1.getValue() - ConstantOperand2.getValue()
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new sub instruction
          NewOp = RoseSubOp.create(Context.genName(SecondOp.getName() + ".new"), \
                                    [FirstOp.getOperand(NonConstantIndex1), NewOperand])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return True
    return False


def RemoveRedundantBVInsertOps(Block : RoseBlock):
  BVInsertOpList = list()
  BVInsertToExtractMap = dict()
  BVInsertIsNotDeletable = set()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp):
      # If this op is already in the map, we rempve the entry
      # from the map. TODO: Imoprove this, if neessary.
      for BVInsertOp, _ in BVInsertToExtractMap.items():
        if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
          BVInsertToExtractMap.pop(Operation)
          break
      # We only deal with cases where the indices are constants
      BVInsertOpLow = Operation.getLowIndex()
      BVInsertOpHigh= Operation.getHighIndex()
      if isinstance(BVInsertOpLow, RoseConstant) \
        and isinstance(BVInsertOpHigh, RoseConstant):
        BVInsertOpList.append(Operation)
      continue
    if isinstance(Operation, RoseBVExtractSliceOp):
      for BVInsertOp in BVInsertOpList:
        if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
          if Operation.getType().getBitwidth() \
                <= BVInsertOp.getInsertValue().getType().getBitwidth():
            # We only deal with cases where the indices are constants
            BVExtractOpLow = Operation.getLowIndex()
            BVExtractOpHigh = Operation.getHighIndex()
            if isinstance(BVExtractOpLow, RoseConstant) \
              and isinstance(BVExtractOpHigh, RoseConstant):
              if BVInsertOp not in BVInsertToExtractMap:
                BVInsertToExtractMap[BVInsertOp] = [Operation]
              else:
                BVInsertToExtractMap[BVInsertOp].append(Operation)
              break
            else:
              BVInsertIsNotDeletable.add(BVInsertOp)
          else:
            BVInsertIsNotDeletable.add(BVInsertOp)
  
  # Now we replace the bvextracts with shift sand remove bvinserts.
  for BVInsertOp, BVExtractList in BVInsertToExtractMap.items():
    # Now we replace the bitvector being extracted from with the inserted
    # value to make the extraction more direct.
    BVInsertOpLow = BVInsertOp.getLowIndex()
    BVInsertOpHigh = BVInsertOp.getHighIndex()
    for BVExtractOp in BVExtractList:
      assert BVInsertOp.getOutputBitwidth() >= BVExtractOp.getOutputBitwidth()
      BVExtractOpLow = BVExtractOp.getLowIndex()
      BVExtractOpHigh = BVExtractOp.getHighIndex()
      # Compute the new low index
      if BVExtractOpLow.getValue() >= BVInsertOpLow.getValue():
        NewLow = RoseConstant.create(BVExtractOpLow.getValue() - BVInsertOpLow.getValue(), \
                                    BVExtractOpLow.getType())
      else:
        # Cannot do much with this extract op
        BVInsertIsNotDeletable.add(BVInsertOp)
        continue
      # Compute the new high index
      if BVExtractOpLow.getValue() + BVExtractOp.getOutputBitwidth() \
            <= BVInsertOpLow.getValue() + BVInsertOp.getOutputBitwidth():
        NewHigh = RoseConstant.create(NewLow.getValue() + BVExtractOp.getOutputBitwidth() - 1,\
                                  BVExtractOpHigh.getType())
      else:
        # Cannot do much with this extract op
        BVInsertIsNotDeletable.add(BVInsertOp)
        continue
      BVExtractOp.setOperand(0, BVInsertOp.getInsertValue())
      BVExtractOp.setOperand(1, NewLow)
      BVExtractOp.setOperand(2, NewHigh)
    
    # Remove the bvinsert op from the block if we are done with all its uses
    if BVInsertOp not in BVInsertIsNotDeletable:
      Block.eraseOperation(BVInsertOp)



def CombineSizeExtendingOps(Operation : RoseOperation, Context : RoseContext):
  print("COMBINE SIZE EXTENDING OPS")
  assert isinstance(Operation, RoseBVZeroExtendOp) \
      or isinstance(Operation, RoseBVSignExtendOp)

  # The given op must have only one user
  if len(Operation.getUsers()) != 1:
    # Nothing to do
    return

  # We can support a few patterns here
  InputOp = Operation.getInputBitVector()
  if not isinstance(InputOp, RoseOperation):
    return
  Block = InputOp.getParent()
  if len(InputOp.getUsers()) != 1:
    # Nothing to do
    return

  if InputOp.getOpcode() == Operation.getOpcode():
    assert Operation.getOutputBitwidth() >= InputOp.getOutputBitwidth()
    Operation.setOperand(0, InputOp.getInputBitVector())
    # Erase the old input op
    Block.eraseOperation(InputOp)
  
  return
  

def CombineSizeExtendingIndexingOps(Operation : RoseOperation, Context : RoseContext):
  print("COMBINE SIZE EXTENDING OPS")
  assert isinstance(Operation, RoseBVZeroExtendOp) \
      or isinstance(Operation, RoseBVSignExtendOp)

  # The given op must have only one user
  if len(Operation.getUsers()) != 1:
    # Nothing to do
    return

  # We can support a few patterns here
  InputOp = Operation.getInputBitVector()
  if not isinstance(InputOp, RoseOperation):
    return
  Block = InputOp.getParent()
  if len(InputOp.getUsers()) != 1:
    # Nothing to do
    return

  if InputOp.getOpcode() == Operation.getOpcode():
    assert Operation.getOutputBitwidth() >= InputOp.getOutputBitwidth()
    Operation.setOperand(0, InputOp.getInputBitVector())
    # Erase the old input op
    Block.eraseOperation(InputOp)
    return
  
  # Another case is where incoming input op is an op with same 
  # input and output type.
  # TODO: Make this more general
  if not InputOp.getOpcode().typesOfInputsAndOutputEqual():
    return
  
  # Some sanity checking
  for Operand in InputOp.getOperands():
    if isinstance(Operand, RoseConstant):
      continue
    if not isinstance(Operand, RoseOperation):
      # Nothing to do
      return
    if Operand.getOpcode() != Operation.getOpcode():
      # Nothing to do
      return
    # All of these operands mmust have only one user
    if len(InputOp.getUsers()) != 1:
      # Nothing to do
      return
  
  # The allowable operands are size extending ops or constants.
  NewOperandList = list()
  ToBeErased = list()
  for Operand in InputOp.getOperands():
    if isinstance(Operand, RoseConstant):
      NewConstant = RoseConstant.create(Operand.getValue(), Operation.getType())
      NewOperandList.append(NewConstant)
      continue
    assert Operation.getOutputBitwidth() >= Operand.getOutputBitwidth()
    # Generate a new op
    Name = Context.genName(Operand.getName() + ".new")
    NewOp = NewSizeExtendOp(Name, Operand.getOpcode(), \
                  Operand.getInputBitVector(), Operation.getOutputBitwidth())
    # Add this new op before the insert op
    Block.addOperationBefore(NewOp, InputOp)
    NewOperandList.append(NewOp)
    ToBeErased.append(Operand)
  
  # Generate the new input op and it to the block
  Name = Context.genName(InputOp.getName() + ".new")
  NewInputOp = GenerateOpWithSameInputsAndOutputType(Name, \
                        InputOp.getOpcode(), NewOperandList)
  Block.addOperationBefore(NewInputOp, InputOp)
  # Replace the uses of the give size extending ip with this new input op
  Operation.replaceUsesWith(NewInputOp)
  # Erase the op now
  Block.eraseOperation(Operation)
  Block.eraseOperation(InputOp)
  for Operand in ToBeErased:
    Block.eraseOperation(Operand)


def RunOpCombineOnBlock(Block : RoseBlock, Context : RoseContext):
  print("RUN OP COMBINE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()

  # Collect the indexing ops
  IndexingOps = set()
  for Operation in Block:
    if isinstance(Operation, RoseBVExtractSliceOp) \
    or isinstance(Operation, RoseBVInsertSliceOp):
      for IndexingOp in GatherIndexingOps(Operation):
        print("INDEXING OPS:")
        IndexingOp.print()
        IndexingOps.add(IndexingOp)

  # Gather all the truncate and extract ops in this block
  OpList = list()
  for Operation in Block:
    # These instructions make good candidates for being combined
    if isinstance(Operation, RoseBVTruncateOp) \
    or isinstance(Operation, RoseBVExtractSliceOp):
      OpList.append(Operation)
      continue
    if isinstance(Operation, RoseAddOp) \
    or isinstance(Operation, RoseSubOp) \
    or isinstance(Operation, RoseMulOp) \
    or isinstance(Operation, RoseDivOp):
      if len(Operation.getOperands()) == 2:
        OpList.append(Operation)
        continue
    #if Operation in IndexingOps:
    if isinstance(Operation, RoseBVZeroExtendOp) \
    or isinstance(Operation, RoseBVSignExtendOp):
      print("INDEXING OP ADDED:")
      OpList.append(Operation)
      continue

  # Now deal with all the truncate ops in this block
  for Op in OpList:
    if isinstance(Op, RoseBVTruncateOp):
      if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
        # Check if the only use of this extract op is the truncate op
        ExtractOp = Op.getInputBitVector()
        if len(ExtractOp.getUsers()) == 1:
          # Replace this extract and truncate instruction with a new extarct op
          TotalBitwidth = ExtractOp.getOutputBitwidth()
          TruncBitwidth = Op.getOutputBitwidth()
          assert TotalBitwidth > TruncBitwidth
          High = ExtractOp.getHighIndex()
          # Compute the new low index
          if isinstance(High, RoseConstant):
            NewLow = RoseConstant.create(High.getValue() - TruncBitwidth + 1, High.getType())
          else:
            # Subtract the high index with the trucnate bitwidth
            Offset = RoseConstant.create(TruncBitwidth - 1, High.getType())
            NewLow = RoseSubOp.create("new.low.index." + ExtractOp.getName(), [High, Offset])
            # Add this new low index computation to the IR
            Block.addOperationBefore(NewLow, ExtractOp)
          # Generate the new operation now
          ExtractOp.getInputBitVector().print()
          ExtractOp.getInputBitVector().getType().print()
          print(type(ExtractOp.getInputBitVector()))
          TruncBitwidthVal = RoseConstant(TruncBitwidth, High.getType())
          NewOp = RoseBVExtractSliceOp.create("new." + ExtractOp.getName(), \
                                    ExtractOp.getInputBitVector(), NewLow, High, TruncBitwidthVal)
          # Add this new operation to the block and replace the uses of older op
          Block.addOperationBefore(NewOp, ExtractOp)
          Op.replaceUsesWith(NewOp)
          # Remove the truncate and the replaced extract op.
          # IMPORTANT: the truncate op must be removed before the extract op.
          Block.eraseOperation(Op)
          Block.eraseOperation(ExtractOp)
          continue
      # Nothing to be done except to replace this truncate op with 
      # an extract op.
      TotalBitwidth = Op.getInputBitVector().getOutputBitwidth()
      TruncBitwidth = Op.getOutputBitwidth()
      assert TotalBitwidth > TruncBitwidth
      High = RoseConstant.create(TotalBitwidth - 1, Op.getOperand(1).getType())
      Low = RoseConstant.create(TotalBitwidth - TruncBitwidth, Op.getOperand(1).getType())
      TruncBitwidthVal = RoseConstant(TruncBitwidth, Op.getOperand(1).getType())
      NewOp = RoseBVExtractSliceOp.create("new." + Op.getName(), Op.getInputBitVector(), \
                                          Low, High, TruncBitwidthVal)
      # Add this new operation to the block and replace the uses of older op
      Block.addOperationBefore(NewOp, Op)
      Op.replaceUsesWith(NewOp)
      # The truncate op must be removed
      Block.eraseOperation(Op)
      continue
    # Now deal with extract op whose operand is an extract op.
    # Note that this could be thought of the general case of 
    # what we have dealt with above.
    if isinstance(Op, RoseBVExtractSliceOp):
      if isinstance(Op.getInputBitVector(), RoseBVExtractSliceOp):
        SecondExtractOp = Op
        # Check if the only use of this extract op is the only use
        FirstExtractOp = SecondExtractOp.getInputBitVector()
        if len(FirstExtractOp.getUsers()) == 1:
          # Replace this first and second instruction with a new extarct op
          FirstExtractBitwidth = FirstExtractOp.getOutputBitwidth()
          SecondExtractBitwidth = SecondExtractOp.getOutputBitwidth()
          assert FirstExtractBitwidth > SecondExtractBitwidth
          FirstLow = FirstExtractOp.getLowIndex()
          SecondLow = SecondExtractOp.getLowIndex()
          SecondHigh= SecondExtractOp.getHighIndex()
          # Compute the new low index
          if isinstance(SecondLow, RoseConstant) and isinstance(FirstLow, RoseConstant):
            NewLow = RoseConstant.create(FirstLow.getValue() + SecondLow.getValue(), SecondLow.getType())
          else:
            NewLow = RoseAddOp.create("new.low.index." + SecondExtractOp.getName(), [FirstLow, SecondLow])
            # Add this new low index computation to the IR
            Block.addOperationBefore(NewLow, FirstExtractOp)
          # Compute the new high index
          if isinstance(SecondHigh, RoseConstant) and isinstance(FirstLow, RoseConstant):
            NewHigh = RoseConstant.create(FirstLow.getValue() + SecondHigh.getValue(), SecondHigh.getType())
          else:
            NewHigh = RoseAddOp.create("new.high.index." + SecondExtractOp.getName(), [FirstLow, SecondHigh])
            # Add this new low index computation to the IR
            Block.addOperationBefore(NewHigh, FirstExtractOp)
          # Generate the new operation now
          BitwidthVal = RoseConstant(SecondExtractBitwidth, NewHigh.getType())
          NewOp = RoseBVExtractSliceOp.create("new." + FirstExtractOp.getName(), \
                                FirstExtractOp.getInputBitVector(), NewLow, NewHigh, BitwidthVal)
          # Add this new operation to the block and replace the uses of older op
          Block.addOperationBefore(NewOp, FirstExtractOp)
          SecondExtractOp.replaceUsesWith(NewOp)
          # IMPORTANT: Remove the second extract before removing the first one
          Block.eraseOperation(SecondExtractOp)
          Block.eraseOperation(FirstExtractOp)
      continue

    # Combine the primitive ops
    print("------OPERATION:")
    Op.print()
    if isinstance(Op, RoseAddOp) \
      or isinstance(Op, RoseSubOp) \
      or isinstance(Op, RoseMulOp) \
      or isinstance(Op, RoseDivOp):
      # One of the operations must be constant
      if isinstance(Op.getOperand(0), RoseConstant) \
      and not isinstance(Op.getOperand(1), RoseConstant):
        NonConstantOperand = Op.getOperand(1)
      elif not isinstance(Op.getOperand(0), RoseConstant) \
      and isinstance(Op.getOperand(1), RoseConstant):
        NonConstantOperand = Op.getOperand(0)
      else:
        # We do not simplify ops here
        continue
      print("NonConstantOperand:")
      NonConstantOperand.print()
      if isinstance(NonConstantOperand, RoseAddOp) \
      or isinstance(NonConstantOperand, RoseSubOp) \
      or isinstance(NonConstantOperand, RoseMulOp) \
      or isinstance(NonConstantOperand, RoseDivOp):
        if not OpCombinePatterns(NonConstantOperand, Op, Context):
          OpCombineMultiplePatterns(NonConstantOperand, Op, Context)
      continue
      
    # Combine some size extending ops
    if isinstance(Op, RoseBVZeroExtendOp) \
    or isinstance(Op, RoseBVSignExtendOp):
      if Op in IndexingOps:
        CombineSizeExtendingIndexingOps(Op, Context)
      else:
        # NOTE: Not 100% sure if this is OK to support.
        CombineSizeExtendingOps(Op, Context)
      continue

  # Remove the redundant bvinserts from the block
  RemoveRedundantBVInsertOps(Block)  


def RunOpCombineOnRegion(Region, Context : RoseContext):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Run op simplification on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunOpCombineOnFunction(Abstraction, Context)
      continue
    # Op simplification only happens on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      print(Abstraction)
      Abstraction.print()
      RunOpCombineOnRegion(Abstraction, Context)
      continue
    RunOpCombineOnBlock(Abstraction, Context)


def RunOpCombineOnFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN ON OP COMBINE FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run op simplification on the given function
  RunOpCombineOnRegion(Function, Context)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunOpCombineOnFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()



