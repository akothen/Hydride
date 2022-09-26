#############################################################
#
# This pass inlines subregions into another regions.
# This is useful when results are written to some temporary
# registers in a subregion and then the results in temporary 
# registers are used again in another region.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *
from RoseUtilities import *


def RunSubRegionInliner(Function : RoseFunction, Context : RoseContext):
  print("RUN SUBREGION INLINER ON FUNCTION")
  print("FUNCTION:")
  Function.print()
  assert isinstance(Function, RoseFunction)
  InsertOps = list()
  ExtractOps = list()
  BlockList = Function.getRegionsOfType(RoseBlock)
  for Block in BlockList:
    for Op in Block:
      if isinstance(Op, RoseBVInsertSliceOp):
        if not isinstance(Op.getInputBitVector(), RoseArgument):
          if Op.getInputBitVector() != Function.getReturnValue():
            InsertOps.append(Op)
        continue
      if isinstance(Op, RoseBVExtractSliceOp):
        if not isinstance(Op.getInputBitVector(), RoseArgument):
          if Op.getInputBitVector() != Function.getReturnValue():
            ExtractOps.append(Op)
        continue
  if len(ExtractOps) == 0:
    return
  assert len(InsertOps) != 0
  # Check if extract ops and insert ops are in disjoint regions.
  # This means that the only common parent region must be the function.
  ExtractOpToInsertRegion = dict()
  InsertRegionToExtractOps = dict()
  for InsertOp in InsertOps:
    for ExtractOp in ExtractOps:
      if ExtractOp.getInputBitVector() != InsertOp.getInputBitVector():
        continue
      InsertRegion = InsertOp.getParent()
      ExtractRegion = ExtractOp.getParent()
      if InsertRegion == ExtractRegion:
        continue
      while InsertRegion.getParent() != ExtractRegion.getParent():
        InsertRegion = InsertRegion.getParent()
        ExtractRegion = ExtractRegion.getParent()
      if isinstance(InsertRegion.getParent() , RoseFunction):
        assert isinstance(ExtractRegion.getParent(), RoseFunction)
        ExtractOpToInsertRegion[ExtractOp] = InsertRegion
        if InsertRegion not in InsertRegionToExtractOps:
          InsertRegionToExtractOps[InsertRegion] = [ExtractOp]
        else:
          InsertRegionToExtractOps[InsertRegion].append(ExtractOp)
  # Inline the insert regions before extract ops
  for ExtractOp, InsertRegion in ExtractOpToInsertRegion:
    Block = ExtractOp.getParent()
    ParentRegion = Block.getParent()
    Key = ParentRegion.getKeyForChild(Block)
    Index = ParentRegion.getPosOfChild(Block, Key)
    ParentRegion.addRegionBefore(Index, InsertRegion.clone(), Key)
    assert InsertRegion in InsertRegionToExtractOps
    assert len(InsertRegionToExtractOps[InsertRegion]) == 1
    ParentRegion = InsertRegion.getParent()
    Key = ParentRegion.getKeyForChild(InsertRegion)
    ParentRegion.eraseChild(InsertRegion, Key)


# Runs a transformation
def Run(Function : RoseFunction, Context : RoseContext):
  RunSubRegionInliner(Function, Context)
  print("\n\n\n\n\n")
  Function.print()

