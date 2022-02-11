###################################################################
#
# Some utility functions that could be useful for Similarity
# Checker.
#
###################################################################


from ast import Sub
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
import RoseFixLoopBounds


# The cananonical for a function is a loop nest with 
# one outer loop and at least one inner loop. 
def IsFunctionInCanonicalForm(Function : RoseFunction):
  # This function must not have a parent
  if Function.isTopLevelFunction() == False:
    return False
  # This function must not contain other functions
  if Function.containsRegionOfType(RoseFunction) == True:
    return False
  OuterLoopFound = False
  InnerLoopsFound = False
  for Region in Function:
    # Ignore blocks
    if isinstance(Region, RoseBlock):
      continue
    # The given function cannot contain regions other than loops
    if not isinstance(Region, RoseForLoop):
      return False
    if OuterLoopFound == True:
      return False
    OuterLoopFound = True
    InnerLoopStep = RoseUndefValue()
    for SubRegion in Region:
      # Ignore blocks
      if isinstance(SubRegion, RoseBlock):
        continue
      # This level of loop mustn't contain regions other than loops
      if not isinstance(SubRegion, RoseForLoop):
        return False
      InnerLoopsFound = True
      if InnerLoopStep == RoseUndefValue():
        InnerLoopStep = SubRegion.getStep()
      else:
        if InnerLoopStep.getValue() != SubRegion.getStep().getValue():
          return False
      InnerInnerLoopStep = RoseUndefValue()
      for SubSubRegion in SubRegion:
        # No more loops should be found
        if SubSubRegion.containsRegionOfType(RoseFunction):
          return False
        if isinstance(SubSubRegion, RoseForLoop):
          if InnerInnerLoopStep == RoseUndefValue():
            InnerInnerLoopStep = SubSubRegion.getStep()
          else:
            if InnerInnerLoopStep.getValue() != SubSubRegion.getStep().getValue():
              return False
  return (OuterLoopFound == True and InnerLoopsFound == True)


def AdjustLoopBoundsInFunction(Function : RoseFunction):
  RoseFixLoopBounds.RunFixLoopsBooundsOnFunction(Function)
