#############################################################
#
# This pass combines different operations and simplifies 
# the IR.
#
#############################################################


from ast import Constant
from re import L
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def OpCombinePatterns(FirstOp : RoseOperation, SecondOp : RoseOperation):
  print("OP COMBINE PATTENS")
  # Some sanity checks
  assert isinstance(FirstOp, RoseAddOp) \
      or isinstance(FirstOp, RoseSubOp) \
      or isinstance(FirstOp, RoseMulOp) \
      or isinstance(FirstOp, RoseDivOp)
  assert isinstance(SecondOp, RoseAddOp) \
      or isinstance(SecondOp, RoseSubOp) \
      or isinstance(SecondOp, RoseMulOp) \
      or isinstance(SecondOp, RoseDivOp)
  assert len(FirstOp.getOperands()) == 2
  assert len(SecondOp.getOperands()) == 2
  assert FirstOp.getParent() == SecondOp.getParent()

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
    return
  assert isinstance(ConstantOperand1, RoseConstant)
  ConstantOperand2, ConstantIndex2 = GetConstantOperation(SecondOp)
  if ConstantOperand2 == RoseUndefValue():
    return
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

  # Now we deal with different patterns
  # TODO: Add more patterns
  Block = FirstOp.getParent()
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
      Block = FirstOp.getParent()
      Block.eraseOperation(FirstOp)
    return
  
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
      return
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
        Block = FirstOp.getParent()
        Block.eraseOperation(FirstOp)
        return
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
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create("%new." + SecondOp.getName(), \
                        FirstOp.getOperand(NonConstantIndex1), NewOperand)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
        if ConstantOperand1.getValue() < ConstantOperand2.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create("%new." + SecondOp.getName(), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
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
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create("%new." + SecondOp.getName(), \
                        NewOperand, FirstOp.getOperand(NonConstantIndex1))
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
        if ConstantOperand1.getValue() < ConstantOperand2.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create("%new." + SecondOp.getName(), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
    return
  
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
      return
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
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Replace the operands of the second op
          SecondOp.setOperand(ConstantIndex2, NewOperand)
          SecondOp.setOperand(NonConstantIndex2, FirstOp.getOperand(NonConstantIndex1))
          # Delete the first op
          Block = FirstOp.getParent()
          Block.eraseOperation(FirstOp)
        return
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
          Block = FirstOp.getParent()
          Block.eraseOperation(FirstOp)
          return
        if ConstantOperand1.getValue() > ConstantOperand2.getValue():
          # result: z = mul x, (c1 / c2) when c1 > c2
          NewOperandVal = ConstantOperand1.getValue() / ConstantOperand2.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create("%new." + SecondOp.getName(), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
        return
    return

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
      return
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
        NewOp = RoseDivOp.create("%new." + SecondOp.getName(), \
                                  NewOperand, FirstOp.getOperand(NonConstantIndex1))
        Block.addOperationBefore(NewOp, SecondOp)
        SecondOp.replaceUsesWith(NewOp)
        # IMPORTANT: the second op must be removed before the first op.
        Block.eraseOperation(SecondOp)
        Block.eraseOperation(FirstOp)
        return
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
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new div instruction
          NewOp = RoseDivOp.create("%new." + SecondOp.getName(), \
                                    FirstOp.getOperand(NonConstantIndex1), NewOperand)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
        if ConstantOperand2.getValue() > ConstantOperand1.getValue():
          # result: z = mul x, (c2 / c1) when c2 > c1
          NewOperandVal = ConstantOperand2.getValue() / ConstantOperand1.getValue()
          if ConstantOperand1.getType().isIntegerTy():
            if NewOperandVal != int(NewOperandVal):
              # Nothing we can do here
              return
            NewOperandVal = int(NewOperandVal)
          NewOperand = RoseConstant.create(NewOperandVal, ConstantOperand1.getType())
          # Generate a new mul instruction
          NewOpOperands = [FirstOp.getOperand(NonConstantIndex1), NewOperand]
          NewOp = RoseMulOp.create("%new." + SecondOp.getName(), NewOpOperands)
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
        return
    return
  
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
      Block = FirstOp.getParent()
      Block.eraseOperation(FirstOp)
    return
  
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
      return
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
        Block = FirstOp.getParent()
        Block.eraseOperation(FirstOp)
        return
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
          NewOp = RoseSubOp.create("%new." + SecondOp.getName(), \
                        [FirstOp.getOperand(NonConstantIndex1), NewOperand])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
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
          NewOp = RoseSubOp.create("%new." + SecondOp.getName(), \
                        [NewOperand, FirstOp.getOperand(NonConstantIndex1)])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
    return

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
      return
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
        Block = FirstOp.getParent()
        Block.eraseOperation(FirstOp)
    return

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
      return
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
        NewOp = RoseSubOp.create("%new." + SecondOp.getName(), \
                                  [NewOperand, FirstOp.getOperand(NonConstantIndex1)])
        Block.addOperationBefore(NewOp, SecondOp)
        SecondOp.replaceUsesWith(NewOp)
        # IMPORTANT: the second op must be removed before the first op.
        Block.eraseOperation(SecondOp)
        Block.eraseOperation(FirstOp)
        return
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
          NewOp = RoseSubOp.create("%new." + SecondOp.getName(), \
                                    [FirstOp.getOperand(NonConstantIndex1), NewOperand])
          Block.addOperationBefore(NewOp, SecondOp)
          SecondOp.replaceUsesWith(NewOp)
          # IMPORTANT: the second op must be removed before the first op.
          Block.eraseOperation(SecondOp)
          Block.eraseOperation(FirstOp)
          return
    return


def RemoveRedundantBVInsertOps(Block : RoseBlock):
  BVInsertOpList = list()
  BVInsertToExtractMap = dict()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp):
      # If this op is already in the map, we rempve the entry
      # from the map. TODO: Imoprove this, if neessary.
      if Operation in BVInsertToExtractMap:
        BVInsertToExtractMap.pop(Operation)
      BVInsertOpList.append(Operation)
      continue
    if isinstance(Operation, RoseBVExtractSliceOp):
      for BVInsertOp in BVInsertOpList:
        if BVInsertOp.getInputBitVector() == Operation.getInputBitVector():
          if BVInsertOp not in BVInsertToExtractMap:
            BVInsertToExtractMap[BVInsertOp] = [Operation]
          else:
            BVInsertToExtractMap[BVInsertOp].append(Operation)
        break
  
  # Now we replace the bvextracts with shift sand remove bvinserts.
  for BVInsertOp, BVExtractList in BVInsertToExtractMap.items():
    # Now we replace the bitvector being extracted from with the inserted
    # value to make the extraction more direct.
    for BVExtractOp in BVExtractList:
      BVExtractOp.setOperand(0, BVInsertOp.getInsertValue())
    # Remove the bvinsert op from the block
    Block.eraseOperation(BVInsertOp)


def RunOpCombineOnBlock(Block : RoseBlock):
  print("RUN OP COMBINE ON BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()

  # Gather all the truncate and extract ops in this block
  OpList = list()
  for Operation in Block:
    # These instructions make good candidates for being combined
    if isinstance(Operation, RoseBVTruncateOp) \
    or isinstance(Operation, RoseBVExtractSliceOp):
      OpList.append(Operation)
    if isinstance(Operation, RoseAddOp) \
    or isinstance(Operation, RoseSubOp) \
    or isinstance(Operation, RoseMulOp) \
    or isinstance(Operation, RoseDivOp):
      if len(Operation.getOperands()) == 2:
        OpList.append(Operation)

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

    # Combine the primitiev ops
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
        OpCombinePatterns(NonConstantOperand, Op)

  # Remove the redundant bvinserts from the block
  RemoveRedundantBVInsertOps(Block)  


def RunOpCombineOnRegion(Region):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Run op simplification on a nested function
    if isinstance(Abstraction, RoseFunction):
      RunOpCombineOnFunction(Abstraction)
      continue
    # Op simplification only happens on blocks
    if not isinstance(Abstraction, RoseBlock):
      print("REGION:")
      print(Abstraction)
      Abstraction.print()
      RunOpCombineOnRegion(Abstraction)
      continue
    RunOpCombineOnBlock(Abstraction)


def RunOpCombineOnFunction(Function : RoseFunction):
  print("RUN ON OP COMBINE FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Run op simplification on the given function
  RunOpCombineOnRegion(Function)


# Runs a transformation
def Run(Function : RoseFunction):
  RunOpCombineOnFunction(Function)
  print("\n\n\n\n\n")
  Function.print()


