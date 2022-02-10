#############################################################
#
# Changes the loop bounds to canonical form.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *


def RunFixLoopsBooundsOnLoop(Loop : RoseForLoop):
  print("FIX BOUNDS OF LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  FunctionOutput = Loop.getFunction().getReturnValue()
  BVInsertOps = []
  # Get the bvinserts to the output of the function that this belongs to.
  for Region in Loop:
    if isinstance(Region, RoseBlock):
      for Op in Region:
        if isinstance(Op, RoseBVInsertSliceOp):
          if Op.getInputBitVector() == FunctionOutput:
            BVInsertOps.append(Op)
    
  # Go over the bvinserts and see if the bitwidth and loop step are the same.
  # But first make sure the bitwidth for all bvinserts is the same.
  BitWidth = BVInsertOps[0].getOutputBitwidth()
  for Op in BVInsertOps:
    assert Op.getOutputBitwidth() == BitWidth
  # Now see if the loop bounds need adjusting
  LoopStep = Loop.getStep()
  assert isinstance(LoopStep, RoseConstant)
  if BitWidth != LoopStep.getValue():
    # Compute factor
    assert LoopStep.getValue() < BitWidth
    Factor = BitWidth / LoopStep.getValue()
    assert Factor == int(Factor)
    Factor = int(Factor)
    # Assuming loop start and end are constant values as well.
    Start = Loop.getStartIndex()
    End = Loop.getEndIndex()
    assert isinstance(Start, RoseConstant)
    assert isinstance(End, RoseConstant)
    # Fix the loop bounds now
    Loop.setStartIndex(Factor * Start.getValue())
    Loop.setEndIndex(Factor * End.getValue())
    Loop.setStep(Factor * LoopStep.getValue())
    # Now change the iterator name
    OldIterator = Loop.getIterator()
    Loop.setIteratorName("new." + OldIterator.getName())
    # Replace the old iterator value with new one
    NewIterator = Loop.getIterator()
    FactorVal = RoseConstant(Factor, NewIterator.getType())
    IteratorReplacement = RoseDivOp.create("replacement." + OldIterator.getName(), \
                             NewIterator, FactorVal)
    # Check if the loop's first child region is a block, if not we insert one
    if not isinstance(Loop.getChild(0), RoseBlock):
      Block = RoseBlock.create([IteratorReplacement])
      Loop.addRegionBefore(0, Block)
    else:
      Block = Loop.getChild(0)
      Block.addOperationBefore(IteratorReplacement, Block.getOperation(0))
    Loop.replaceUsesWith(OldIterator, IteratorReplacement)
  print("NEW LOOP:")
  Loop.print()


def RunFixLoopsBooundsOnRegion(Region):
  # Iterate over all the contents of this function
  for Abstraction in Region:
    if isinstance(Abstraction, RoseFunction):
      RunFixLoopsBooundsOnFunction(Abstraction)
      continue
    if isinstance(Abstraction, RoseForLoop):
      RunFixLoopsBooundsOnLoop(Abstraction)
      continue
    # Skip blocks
    if isinstance(Abstraction, RoseBlock):
      continue
    print("REGION:")
    print(Abstraction)
    Abstraction.print()
    RunFixLoopsBooundsOnRegion(Abstraction)


def RunFixLoopsBooundsOnFunction(Function : RoseFunction):
  print("FIX LOOP BOUNDS IN FUNCTION")
  print("FUNCTION:")
  Function.print()
  RunFixLoopsBooundsOnRegion(Function)


# Runs a transformation
def Run(Function : RoseFunction):
  RunFixLoopsBooundsOnFunction(Function)
  print("\n\n\n\n\n")
  Function.print()



