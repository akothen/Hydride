#############################################################
#
# This paas translate Rose IR into textual Rosette code.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *


def GenerateRosetteForSatOp(Op : RoseBitVectorOp, NumSpace = 0):
  assert isinstance(Op, RoseBVSSaturateOp) or isinstance(Op, RoseBVUSaturateOp)
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  if isinstance(Op, RoseBVSSaturateOp):
    String = Spaces + "(define " + Op.getName() + " (SSat "
    for Operand in Op.getOperands():
      String += Operand.getName() + " "
    String += "))\n"
    return String
  # Account for usat op
  String = Spaces + "(define " + Op.getName() + " (USat "
  for Operand in Op.getOperands():
    String += Operand.getName() + " "
  String += "))\n"
  return String


def GetSkippedBVInsertIndexingOps(Operation : RoseBVInsertSliceOp):
  # Sanity checks
  assert isinstance(Operation, RoseBVInsertSliceOp)
  Worklist = list()
  ToBeSkipped = list()
  if isinstance(Operation.getLowIndex(), RoseOperation):
    if len(Operation.getLowIndex().getUsers())  == 1:
      Worklist.append(Operation.getLowIndex())
      ToBeSkipped.append(Operation.getLowIndex())
  if isinstance(Operation.getHighIndex(), RoseOperation):
    if len(Operation.getHighIndex().getUsers())  == 1:
      Worklist.append(Operation.getHighIndex())
      ToBeSkipped.append(Operation.getHighIndex())
  while len(Worklist) != 0:
    IndexingOp = Worklist.pop()
    if IndexingOp not in ToBeSkipped:
      continue
    if isinstance(IndexingOp, RoseOperation):
      for Operand in IndexingOp.getOperands():
        if isinstance(Operand, RoseOperation):
          # This operand can be skipped if the users are
          # ops to be skipped.
          CanBeSkipped = True
          for User in Operand.getUsers():
            if User not in ToBeSkipped:
              CanBeSkipped = False
              break
          if CanBeSkipped == True:
            ToBeSkipped.append(Operand)
          Worklist.append(Operand)
  ToBeSkipped.reverse()
  print("ToBeSkipped:")
  for Op in ToBeSkipped:
    Op.print()
  print("++++++++++++++++++++++++")
  return ToBeSkipped


def GenerateRosetteForBlock(Block : RoseBlock, RosetteCode : str, \
                                      NumSpace = 0, SkipOps = list()):
  print("GENERATE ROSETTE CODE FOR BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()

  # Collect the indexing ops of bvinserts. These ops will be skipped
  # when generating Rosette code.
  IndexingOps = list()
  for Op in Block:
    if isinstance(Op, RoseBVInsertSliceOp):
      IndexingOps.extend(GetSkippedBVInsertIndexingOps(Op))

  BVInsertOpsList = list()
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  LastOp = RoseUndefValue()
  for Operation in Block:
    # Skip certain ops
    if Operation in SkipOps:
      continue
    # May need to skip indexing op
    if Operation in IndexingOps:
      if len(Operation.getUsers()) == 1:
        continue
    # Ignore return ops
    if isinstance(Operation, RoseReturnOp):
      continue
    # Gather bvinsert ops
    if isinstance(Operation, RoseBVInsertSliceOp):
      if Block.getParentOfType(RoseForLoop) == RoseUndefRegion():
        RosetteCode += Spaces + "(define " + Operation.getInputBitVector().getName() \
            + " " + Operation.getInsertValue().getName() + ")\n"
      else:
        BVInsertOpsList.append(Operation)
      continue
    LastOp = Operation
    # Extracts are dealt with a little differently
    if isinstance(Operation, RoseBVExtractSliceOp):
      # There are situations where value being extracted is defined
      # outside a loop. In Rosette, the indexing into bitvectors takes
      # place from right to left, instead of left to right. So we need
      # to reverse the order of extraction as well.
      if Operation.getInputBitVector() in Block.getOperations():
        RosetteCode += Operation.to_rosette(NumSpace, ReverseIndexing=True)
        continue
    if isinstance(Operation, RoseBVSSaturateOp) \
      or isinstance(Operation, RoseBVUSaturateOp):
      RosetteCode += GenerateRosetteForSatOp(Operation, NumSpace)
      continue
    print("Operation:")
    Operation.print()
    RosetteCode += Operation.to_rosette(NumSpace)
  
  if len(SkipOps) != 0:
    RosetteCode += Spaces + LastOp.getName() + "\n"
    return RosetteCode

  print(BVInsertOpsList)
  if not (len(BVInsertOpsList) > 1):
    if len(BVInsertOpsList) == 1:
      Block = BVInsertOpsList[0].getParent()
      if isinstance(BVInsertOpsList[0].getInsertValue(), RoseConstant):
        Result = bin(BVInsertOpsList[0].getInsertValue().getValue()).replace("0b", "#b")
        print("RESULT:")
        print(Result)
        if type(BVInsertOpsList[0].getOutputBitwidth()) == int:
          RosetteCode += Spaces + "(bv " + Result + " " \
                        + str(BVInsertOpsList[0].getOutputBitwidth()) + ")\n"
        else:
          print(BVInsertOpsList[0].getOutputBitwidth().getName())
          RosetteCode += Spaces + "(bv " + Result + " " \
                        + BVInsertOpsList[0].getOutputBitwidth().getName() + ")\n"      
      else:
        RosetteCode += Spaces + BVInsertOpsList[0].getInsertValue().getName() + "\n"
    return RosetteCode
  
  # See which bvinserts in the block are concatable
  ListOfPacks = list()
  Pack = list()
  for Op in BVInsertOpsList:
    if Pack == []:
      Pack = [Op]
      continue
    print("AreBitSlicesContiguous:")
    if not AreBitSlicesContiguous(Pack[len(Pack) - 1], Op):
      print("FALSE")
      # Pack list ends here
      ListOfPacks.append(Pack)
      Pack = [Op]
      continue
    print("TRUE")
    # Add the op to the current pack list
    Pack.append(Op)
  if len(Pack) != 0:
    ListOfPacks.append(Pack)

  # TODO: Support multiple packlists in the list of packs
  print(ListOfPacks)
  assert len(ListOfPacks) == 1
  # Now concatenate the packs
  RosetteCode += "(concat"
  for Op in Pack:
    RosetteCode += " " +  Op.getInsertValue().getName()
  RosetteCode += ")\n"
  return RosetteCode


def GenerateRosetteForCondRegion(CondRegion : RoseCond, RosetteCode : str, NumSpace : int = 0):
  # Generate the condition first
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  TmpRosetteCode = Spaces + "(if (equal? " + CondRegion.getCondition().getName() + " (bv #b1 1))\n"
  TmpRosetteCode  += Spaces + " (begin\n"
  for Abstraction in CondRegion.getThenRegions():
    if isinstance(Abstraction, RoseBlock):
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
    continue
  TmpRosetteCode += Spaces + " )\n"
  TmpRosetteCode += Spaces + " (begin\n"
  for Abstraction in CondRegion.getElseRegions():
    if isinstance(Abstraction, RoseBlock):
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
    continue
  TmpRosetteCode += Spaces + " )\n"

  print("RosetteCode after generating loop")
  print(TmpRosetteCode)
  TmpRosetteCode += (Spaces + ")\n")
  RosetteCode += TmpRosetteCode
  return RosetteCode


def GenerateRosetteForForLoop(Loop : RoseForLoop, RosetteCode : str, NumSpace : int = 0, \
                          VisitedLoop : list = list(), SkipOpsMap : dict = dict()):
  if Loop not in VisitedLoop:
    # Check if there is a reduction pattern to deal with.
    BlockList = Loop.getRegionsOfType(RoseBlock)
    ReductionBlockList = []
    for Block in BlockList:
      if HasReductionPattern(Block):
        ReductionBlockList.append(Block)
    if ReductionBlockList != []:
      LoopList = Loop.getRegionsOfType(RoseForLoop)
      VisitedLoop.extend(LoopList)

    # Get all the operations to skip
    SkipOpsMap = dict()
    for Block in ReductionBlockList:
      SkipOpsMap[Block] = []
      SkipOpsMap[Block].extend(GetReductionOps(Block))

  # Generate loop header
  Spaces = ""
  print(range(NumSpace))
  for _ in range(NumSpace):
    Spaces += " "
  TmpRosetteCode = Spaces + "(for/list ([" + Loop.getIterator().getName() + " (reverse (range " \
    + Loop.getStartIndex().getName() + " " + Loop.getEndIndex().getName() \
    + " " + Loop.getStep().getName() + "))])\n"

  for Abstraction in Loop:
    if isinstance(Abstraction, RoseForLoop):
      TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode, \
                                        NumSpace + 1, VisitedLoop, SkipOpsMap)
      continue
    if isinstance(Abstraction, RoseCond):
      TmpRosetteCode = GenerateRosetteForCondRegion(Abstraction, TmpRosetteCode, NumSpace + 1)
      continue
    if isinstance(Abstraction, RoseBlock):
      if Abstraction in SkipOpsMap:
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, \
                                                           NumSpace + 1, SkipOpsMap[Abstraction])
      else:
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
      continue
  
  TmpRosetteCode += (Spaces + ")\n")
  print("RosetteCode after generating loop")
  print(TmpRosetteCode)

  IsReductionLoop = False
  ReductionVal = RoseUndefValue()
  Epilogue = ""
  BlockList = Loop.getRegionsOfType(RoseBlock, Level=0)
  for Block in BlockList:
    if Block in SkipOpsMap:
      Epilogue += "))\n"
      IsReductionLoop = True
      ExtractOp = RoseUndefValue()
      for Op in SkipOpsMap[Block]:
        print("SkipOpsMap[Block]:")
        Op.print()
        if isinstance(Op, RoseBVExtractSliceOp):
          ExtractOp = Op
          Epilogue += Op.to_rosette(NumSpace)
          continue
        if isinstance(Op, RoseBVAddOp):
          for Operand in Op.getOperands():
            if ExtractOp == Operand:
              continue
            ReductionVal = Operand
            break
          Epilogue += Spaces + "(define " + Op.getName() + " (bvadd " \
                    + ReductionVal.getName() + ".sum " + ExtractOp.getName() + "))\n"
          Epilogue += Spaces + Op.getName() + "\n"
          break
        if isinstance(Op, RoseBVInsertSliceOp):
          continue
        Epilogue += Op.to_rosette(NumSpace)
  
  TmpRosetteCode += Epilogue
  if IsReductionLoop == True:
    TmpRosetteCode = Spaces + "(define " + ReductionVal.getName() + ".sum\n" \
                      +  "(apply\n" + Spaces + "bvadd\n" + TmpRosetteCode
  else:
    TmpRosetteCode = Spaces + "(apply\n" + Spaces + "concat\n" + TmpRosetteCode
    TmpRosetteCode += (Spaces + ")\n")
  RosetteCode += TmpRosetteCode
  return RosetteCode


def GenerateRosetteForRegion(Region, RosetteCode : str, NumSpace = 0):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Generate Rosette for a nested function
    if isinstance(Abstraction, RoseFunction):
      RosetteCode = GenerateRosetteForFunction(Abstraction, RosetteCode, NumSpace)
      continue
    # Generate Rosette for a loop
    if isinstance(Abstraction, RoseForLoop):
      RosetteCode = GenerateRosetteForForLoop(Abstraction, RosetteCode, NumSpace)
      continue
    # Generate Rosette for block
    if isinstance(Abstraction, RoseBlock):
      RosetteCode = GenerateRosetteForBlock(Abstraction, RosetteCode, NumSpace)
      continue
    RosetteCode = GenerateRosetteForRegion(Abstraction, RosetteCode, NumSpace)
  return RosetteCode


def GenerateRosetteForFunction(Function : RoseFunction, RosetteCode : str, NumSpace = 0):
  print("GENERATE ROSETTE FUNCTION")
  print("FUNCTION:")
  Function.print()
  # Generate function header
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  RosetteCode += Spaces + "(define (" + Function.getName() + " "
  for Arg in Function.getArgs():
    RosetteCode += " " + Arg.getName()
  RosetteCode += " )\n"
  # Generate Rosette code for the given function
  #if Function.getReturnValue() != RoseUndefValue():
  #  RosetteCode += "(define  " + Function.getReturnValue().getName() + "\n"
  RosetteCode = GenerateRosetteForRegion(Function, RosetteCode)
  print("RosetteCode after region")
  print(RosetteCode)
  #if Function.getReturnValue() != RoseUndefValue():
    #RosetteCode += ")\n"
    #RosetteCode += Function.getReturnValue().getName() + "\n"
  RosetteCode += (Spaces + ")\n")
  return RosetteCode


# Translates the given Rose IR function into Rosette
def CodeGen(Function : RoseFunction):
  RosetteCode = ""
  RosetteCode = GenerateRosetteForFunction(Function, RosetteCode)
  print("---\n\n\n\n\n")
  Function.print()
  print("---\n\n\n\n\n")
  print(RosetteCode)
  return RosetteCode



