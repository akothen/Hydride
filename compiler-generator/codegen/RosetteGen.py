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


def GenerateRosetteForBlock(Block : RoseBlock, RosetteCode : str, NumSpace = 0):
  print("GENERATE ROSETTE CODE FOR BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  BVInsertOpsList = list()
  for Operation in Block:
    # Ignore return ops
    if isinstance(Operation, RoseReturnOp):
      continue
    # Gather bvinsert ops
    if isinstance(Operation, RoseBVInsertSliceOp):
      BVInsertOpsList.append(Operation)
      continue
    # Extracts are dealt with a little differently
    if isinstance(Operation, RoseBVExtractSliceOp):
      # There are situations where value being extracted is defined
      # outside a loop. In Rosette, the indexing into bitvectors takes
      # place from right to left, instead of left to right. So we need
      # to reverse the order of extraction as well.
      if Operation.getInputBitVector() in Block.getOperations():
        RosetteCode += Operation.to_rosette(NumSpace, ReverseIndexing=True)
        continue
    RosetteCode += Operation.to_rosette(NumSpace)
  
  print(BVInsertOpsList)
  if not (len(BVInsertOpsList) > 1):
    if len(BVInsertOpsList) == 1:
      Spaces = ""
      for _ in range(NumSpace):
        Spaces += " "
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
  

def GenerateRosetteForForLoop(Loop : RoseForLoop, RosetteCode : str, NumSpace = 0):
  print("GENERATE ROSETTE CODE FOR LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  # Generate loop header
  Spaces = ""
  for _ in range(NumSpace):
    Spaces += " "
  TmpRosetteCode = Spaces + "(for/list ([" + Loop.getIterator().getName() + " (reverse (range " \
    + str(Loop.getStartIndex()) + " " + str(Loop.getEndIndex()) \
    + " " + str(Loop.getStep()) + "))])\n"

  # To make codegen easy to handle for now, we'll assume that 
  for Abstraction in Loop:
    if isinstance(Abstraction, RoseForLoop):
      TmpRosetteCode = GenerateRosetteForForLoop(Abstraction, TmpRosetteCode, NumSpace + 1)
    if isinstance(Abstraction, RoseBlock):
      TmpRosetteCode = GenerateRosetteForBlock(Abstraction, TmpRosetteCode, NumSpace + 1)
  
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
  if Function.getReturnValue() != RoseUndefValue():
    RosetteCode += "(define  " + Function.getReturnValue().getName() + "\n"
  RosetteCode = GenerateRosetteForRegion(Function, RosetteCode)
  print("RosetteCode after region")
  print(RosetteCode)
  if Function.getReturnValue() != RoseUndefValue():
    RosetteCode += ")\n"
    RosetteCode += Function.getReturnValue().getName() + "\n"
  RosetteCode += (Spaces + ")\n")
  return RosetteCode


# Translates the given Rose IR function into Rosette
def CodeGen(Function : RoseFunction):
  RosetteCode = ""
  RosetteCode = GenerateRosetteForFunction(Function, RosetteCode)
  print("---\n\n\n\n\n")
  print(RosetteCode)




