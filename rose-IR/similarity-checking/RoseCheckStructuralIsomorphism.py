#############################################################
#
# This tries to make given functions isomorphic for
# equivalence checking.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *


def AddLoopsAroundBlock(Block : RoseBlock):
  ParentRegion = Block.getParent()
  InsertionPoint = ParentRegion.getPosOfChild(Block)
  # Generate an empty loop that iterates only once
  Loop = RoseForLoop.create("dud.loop.iterator", 0, 1, 1)
  ParentRegion.addRegionBefore(InsertionPoint, Loop)


def HasRegionsOtherThanLoopsAndBlocks(Abstraction):
  for Region in Abstraction:
    if not isinstance(Region, RoseBlock) and not isinstance(Region, RoseForLoop):
      return False
    if HasRegionsOtherThanLoopsAndBlocks(Region) == False:
      return False
  return True


def SeeAddingLoopAroundBlockHelps(Block : RoseBlock, Loop : RoseForLoop):
  # Dive into the loop to see if it has cond or function region(s). If yes, then adding
  # loops around the given block would not help.
  if HasRegionsOtherThanLoopsAndBlocks(Loop) == False:
    return False
  # TODO: Handle other cases
  return True


def HandleRegionMismatch(Region1, Region2):
  assert type(Region1) != type(Region2)
  # For now let's just support wrapping blocks with loops
  if not isinstance(Region1, RoseBlock) \
    and not isinstance(Region1, RoseForLoop):
    return False
  if not isinstance(Region2, RoseBlock) \
    and not isinstance(Region2, RoseForLoop):
    return False
  # Now we may have to add more loops around one of the regions
  if isinstance(Region1, RoseBlock) and isinstance(Region2, RoseForLoop):
    # First make sure that it is possible to form match between region1 and region2
    if SeeAddingLoopAroundBlockHelps(Region1, Region2) == False:
      return False
    AddLoopsAroundBlock(Region1)
    return True
  if isinstance(Region1, RoseForLoop) and isinstance(Region2, RoseBlock):
    # First make sure that it is possible to form match between region1 and region2
    if SeeAddingLoopAroundBlockHelps(Region2, Region1) == False:
      return False
    AddLoopsAroundBlock(Region2)
    return True
  assert False


def FindBlocksToSplit(BlockList : list, NumRegions : int):
  # Track points at which blocks can be split
  SplitPoints = []
  for Block in BlockList:
    assert isinstance(Block, RoseBlock)
    # Track the bitvector values to which bvinserts in this block operate
    OpList = []
    BVList = []
    for Op in Block.getOperations():
      if isinstance(Op, RoseBVInsertSliceOp):
        if BVList == [] or Op.getInputBitVector() not in BVList:
          BVList.append(Op.getInputBitVector())
          OpList.append(Op)
    if len(OpList) > 1:
      # This block is a good candidate for splitting
      SplitPoints.extend(OpList)
  # if the number of split points discovered is less than the number of regions
  #  we need as a result of splitting blocks up, there is nothing to do.
  # TODO: See if we need to 
  assert len(SplitPoints) <= NumRegions 
  if len(SplitPoints) < NumRegions:
    return []
  return SplitPoints


def HandleMistmatchOfNumofChildren(Region1, Region2):
  assert Region1.getNumChildren() != Region2.getNumChildren()
  # For now let's just support wrapping blocks with loops
  if not isinstance(Region1, RoseForLoop):
    return False
  if not isinstance(Region2, RoseForLoop):
    return False
  # First make sure that it is possible to form match between region1 and region2
  if HasRegionsOtherThanLoopsAndBlocks(Region1) == False:
    return False
  if HasRegionsOtherThanLoopsAndBlocks(Region2) == False:
    return False
  # Now we have to see if one of the children is a block
  if Region1.getNumChildren() > Region2.getNumChildren():
    BlockList = []
    for Child in Region2:
      if isinstance(Child, RoseBlock):
        BlockList.append(Child)
    if BlockList == []:
      return False
    # Now let's try to see which block could be split up to surrounded by loop
    SplitPoints = FindBlocksToSplit(BlockList, \
                      Region1.getNumChildren() - Region2.getNumChildren())
    for SplitPoint in SplitPoints:
      Block = SplitPoint.getParent()
      # Split the block at the split point
      Pos = Block.getPosOfOperation(SplitPoints)
      if Pos + 1 != Block.getNumOperations():
        Block.splitAt(Pos + 1)
      AddLoopsAroundBlock(Block)
    return True
  # Handle Region1.getNumChildren() < Region2.getNumChildren() case
  BlockList = []
  for Child in Region2:
    if isinstance(Child, RoseBlock):
      BlockList.append(Child)
  if BlockList == []:
    return False
  # Now let's try to see which block could be split up to surrounded by loop
  SplitPoints = FindBlocksToSplit(BlockList, \
                    Region1.getNumChildren() - Region2.getNumChildren())
  for SplitPoint in SplitPoints:
    Block = SplitPoint.getParent()
    # Split the block at the split point
    Pos = Block.getPosOfOperation(SplitPoints)
    if Pos + 1 != Block.getNumOperations():
      Block.splitAt(Pos + 1)
    AddLoopsAroundBlock(Block)
  return True


# This could be used for checking structural isomorphism
# i.e. this region's and given region's types match up as
# we sequentially iterate over them.
# Note that this does not check whether two regions are
# equivalent or isomorphic in any other respect.
def FixMismatchInStructuralIsomorphism(Region1, Region2):
  # Check if the regions types are the same.
  if type(Region1) != type(Region2):
    ParentRegion1 = Region1.getParent()
    ParentRegion2 = Region2.getParent()
    assert ParentRegion1 != RoseUndefRegion()
    assert ParentRegion2 != RoseUndefRegion()
    if HandleRegionMismatch(Region1, Region2) == True:
      # Try again
      if FixMismatchInStructuralIsomorphism(ParentRegion1, ParentRegion2) == False:
        return False
    return False
  # If the regions are block, we stop here
  if isinstance(Region1, RoseAbstractions.RoseBlock):
    return True
  # Check if the keys are the same
  if Region1.getKeys() != Region2.getKeys():
    return False
  # Number of children in this and given region is the same
  # for all keys.
  if Region1.getKeys() != None:
    for Key in Region1.getKeys():
      if Region1.getNumChildren(Key) != Region2.getNumChildren(Key):
        ParentRegion1 = Region1.getParent()
        ParentRegion2 = Region2.getParent()
        assert ParentRegion1 != RoseUndefRegion()
        assert ParentRegion2 != RoseUndefRegion()
        if HandleMistmatchOfNumofChildren(Region1, Region2) == True:
          # Try again
          if FixMismatchInStructuralIsomorphism(ParentRegion1, ParentRegion2) == False:
            return False
        return False
    # Now iterate over all children for each key
    for Key in Region1.getKeys():
      for Index in range(Region1.getNumChildren(Key)):
        Child1 = Region1.getChild(Index, Key)
        Child2 = Region2.getChild(Index, Key)
        if FixMismatchInStructuralIsomorphism(Child1, Child2) == False:
          return False
  else:
    if Region1.getNumChildren() != Region2.getNumChildren():
      return False
    for Index in range(Region1.getNumChildren()):
      Child1 = Region1.getChild(Index)
      Child2 = Region2.getChild(Index)
      if FixMismatchInStructuralIsomorphism(Child2, Child2) == False:
        return False
  return True


def AreStructurallyIsomorphicFunctions(Function1 : RoseFunction, Function2 : RoseFunction):
  print("CHECK STRUCTURAL ISOMORPHISM OF FUNCTIONS:")
  print("FUNCTION1:")
  Function1.print()
  print("FUNCTION2:")
  Function2.print()
  # Check if the given functions are isomorphic structurally
  if Function1.isStructurallyIsomorphicWith(Function2) == True:
    return Function1, Function2

  # Functions are not structurally isomorphic. So we try to see where we can make
  # them structurally isomoephic. 
  # Note we can only add more loops and nothing else.
  # First clone the functions so we can work on the cloned copies of functions first
  ClonedFunction1 = Function1.clone()
  ClonedFunction2 = Function2.clone()
  if FixMismatchInStructuralIsomorphism(ClonedFunction1, ClonedFunction2) == True:
    return ClonedFunction1, ClonedFunction2
  return Function1, Function2


# Translates the given Rose IR function into Rosette
def Run(Function1 : RoseFunction, Function2 : RoseFunction):
  AreStructurallyIsomorphicFunctions(Function1, Function2)
  print("---\n\n\n\n\n")
  Function1.print()
  Function2.print()



