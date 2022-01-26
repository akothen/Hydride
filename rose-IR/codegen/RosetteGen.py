#############################################################
#
# This paas translate Rose IR into Rosette.
#
#############################################################


from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *


def GenerateRosetteForBlock(Block : RoseBlock, RosetteCode : str):
  print("GENERATE ROSETTE CODE FOR BLOCK")
  print("BLOCK:")
  print(Block)
  Block.print()
  # Gather all the bvinsert ops in this block
  OpList = list()
  for Operation in Block:
    if isinstance(Operation, RoseBVInsertSliceOp):
      OpList.append(Operation)
      continue
    RosetteCode += Operation.to_rosette()
  if len(OpList) == 1:
    return RosetteCode
  # See which bvinserts in the block are concatable
  ListOfPacks = []
  Pack = []
  for Op in OpList:
    if Pack == []:
      Pack = [Op]
      continue
    if not AreBitSlicesContiguous(Pack[len(Pack) - 1], Op):
      # Pack list ends here
      ListOfPacks.append(Pack)
      Pack = [Op]
      continue
    # Add the op to the current pack list
    Pack.append(Op)

  # TODO: Support multiple packlists in the list of packs
  assert len(ListOfPacks) == 1
  # Now concatenate the packs
  RosetteCode += "(concat"
  for Op in Pack:
    RosetteCode += " " +  Op.getInsertValue().getName()
  RosetteCode += ")\n"
  return RosetteCode
  

def GenerateRosetteForForLoop(Loop : RoseForLoop, RosetteCode : str):
  print("GENERATE ROSETTE CODE FOR LOOP")
  print("LOOP:")
  print(Loop)
  Loop.print()
  # To make codegen easy to handle for now, we'll assume that 
  # the loops 
  for Abstraction in Loop:
    if isinstance(Abstraction, RoseForLoop):
      RosetteCode += GenerateRosetteForForLoop(Abstraction, RosetteCode)
    if isinstance(Abstraction, RoseBlock):
      RosetteCode += GenerateRosetteForBlock(Abstraction, RosetteCode)
  return RosetteCode


def GenerateRosetteForRegion(Region, RosetteCode : str):
  # Iterate over all the contents of this function
  assert not isinstance(Region, RoseBlock)
  for Abstraction in Region:
    # Generate Rosette for a nested function
    if isinstance(Abstraction, RoseFunction):
      RosetteCode += GenerateRosetteForFunction(Abstraction, RosetteCode)
      continue
    # Generate Rosette for a loop
    if isinstance(Abstraction, RoseForLoop):
      RosetteCode += GenerateRosetteForForLoop(Abstraction, RosetteCode)
      continue
    if isinstance(Abstraction, RoseBlock):
      RosetteCode += GenerateRosetteForBlock(Abstraction, RosetteCode)
      continue
  RosetteCode += GenerateRosetteForRegion(Abstraction, RosetteCode)


def GenerateRosetteForFunction(Function : RoseFunction):
  print("GENERATE ROSETTE FUNCTION")
  print("FUNCTION:")
  Function.print()
  RosetteCode = ""
  # Generate Rosette for the given function
  GenerateRosetteForRegion(Function, RosetteCode : str)


# Translates the given Rose IR function into Rosette
def CodeGen(Function : RoseFunction):
  GenerateRosetteForFunction(Function)
  print("\n\n\n\n\n")
  Function.print()



