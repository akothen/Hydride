#############################################################
#
# This paas translate Rose IR into textual Rosette code.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *


def LoopHeaderToString(Loop : RoseForLoop,  NumSpace : int = 0):
  # Generate loop header
  Spaces = ""
  print(range(NumSpace))
  for _ in range(NumSpace):
    Spaces += " "
  String = Spaces + "(for/list ([" + Loop.getIterator().getName() + " (reverse (range " \
    + Loop.getStartIndex().getName() + " " + Loop.getEndIndex().getName() \
    + " " + Loop.getStep().getName() + "))])\n"
  return String


def GenBVTruncateOp(TruncOp : RoseBVTruncateOp, NumSpace = 0):
  InputOp = TruncOp.getInputBitVector()
  assert isinstance(InputOp, RoseBVExtractSliceOp)
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  Name = TruncOp.getName()
  LowIndexName = Name + ".low.idx"
  HighIndexName = Name + ".high.idx"
  String = Spaces + "(define " + HighIndexName + " "  \
          + "(- " + InputOp.getOutputBitwidth().getName() + " 1))\n"
  String += Spaces + "(define " + LowIndexName + " "  \
          + "(- " + HighIndexName + " " \
          + TruncOp.getOperand(1).getName() + " -1 ))\n"
  String += Spaces + "(define " + Name + " ("
  String += (InputOp.Opcode.getRosetteOp() + " ")
  String += " " + HighIndexName
  String += " " + LowIndexName
  String += " " + TruncOp.getInputBitVector().getName()
  String += "))\n"
  return String


def GenerateRosetteForBlock(Block : RoseBlock, RosetteCode : str, \
                                      NumSpace = 0, SkipOps = list()):
  print("GENERATE ROSETTE CODE FOR BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  BVInsertOpsList = list()
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  LastOp = RoseUndefValue()
  for Operation in Block:
    # Skip certain ops
    if Operation in SkipOps:
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
    if isinstance(Operation, RoseBVTruncateOp):
      RosetteCode += GenBVTruncateOp(Operation, NumSpace)
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
  TmpRosetteCode = LoopHeaderToString(Loop, NumSpace)

  # To make codegen easy to handle for now, we'll assume that 
  for Abstraction in Loop:
    if isinstance(Abstraction, RoseForLoop):
      TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode, \
                                        NumSpace + 1, VisitedLoop, SkipOpsMap)
    if isinstance(Abstraction, RoseBlock):
      if Abstraction in SkipOpsMap:
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, \
                                                           NumSpace + 1, SkipOpsMap[Abstraction])
      else:
        TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
  
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
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


def GenerateRosetteForForLoop1(Loop : RoseForLoop, RosetteCode : str, NumSpace : int = 0):
  print("GENERATE ROSETTE CODE FOR LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  # Generate loop header
  TmpRosetteCode = LoopHeaderToString(Loop, NumSpace)

  # To make codegen easy to handle for now, we'll assume that 
  for Abstraction in Loop:
    if isinstance(Abstraction, RoseForLoop):
      TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode, NumSpace + 1)
    if isinstance(Abstraction, RoseBlock):
      TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
  
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  TmpRosetteCode += (Spaces + ")\n")
  print("RosetteCode after generating loop")
  print(TmpRosetteCode)
  TmpRosetteCode = Spaces + "(apply\n" + Spaces + "concat\n" + TmpRosetteCode
  TmpRosetteCode += (Spaces + ")\n")
  RosetteCode += TmpRosetteCode
  return RosetteCode


#def to_rosette(self, NumSpace = 0):
#  Spaces = ""
#  for _ in range(NumSpace):
#    Spaces += " "
#  String = Spaces + "(if (" + self.Condition.getName() + ") \n"
#  # Print regions in this if-else blocks
#  for Region in self.getThenRegions():
#    String += Region.to_rosette(NumSpace + 1)
#  for Region in self.getElseRegions():
#    String += Region.to_rosette(NumSpace + 1)
#  String += (Spaces + ")\n")
#  return String


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



