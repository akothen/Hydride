#############################################################
#
# This pass removes punches holes into the code i.e. 
# insert opaque calls that represent holes in the code.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *




def PunchHolesInFunction(Function : RoseFunction, Context : RoseContext):
  print("RUN ON OP SIMPLIFY FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Look for extracts
  BlockList = Function.getRegionsOfType(RoseBlock)
  HoleList = list()
  HoleMap = dict()
  for Block in BlockList:
    OpList = list()
    OpList.extend(Block.getOperations())
    for Op in OpList:
      if isinstance(Op, RoseBVExtractSliceOp):
        if Op.getLowIndex() in HoleMap:
          continue
        HoleArgsList = [Op.getLowIndex()]
        # Add all the iterators of parent loops to the hole arg list
        Parent = Block.getParentOfType(RoseForLoop)
        while Parent != RoseUndefRegion():
          HoleArgsList.append(Parent.getIterator())
          Parent = Parent.getParentOfType(RoseForLoop)
        HoleFunction = Context.genName(".hole")
        Hole = RoseOpaqueCallOp.create(Context.genName(),\
                RoseConstant(HoleFunction, RoseStringType.create(len(HoleFunction))), \
                HoleArgsList, Op.getLowIndex().getType())
        # Replace all uses of low index with this hole
        HoleMap[Op.getLowIndex()] = Hole
        Users = Function.getUsersOf(Op.getLowIndex())
        Users[0].getParent().addOperationBefore(Hole, Users[0])
        Function.replaceUsesWith(Op.getLowIndex(), Hole)
        HoleList.append(Hole)
  return HoleList


def PunchHoles(Function : RoseFunction, Context : RoseContext):
  HoleList = PunchHolesInFunction(Function, Context)
  print("\n\n\n\n\n")
  Function.print()
  return HoleList



