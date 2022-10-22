#############################################################
#
# This tool does codegen through LLVM
#
#############################################################


from RosetteLifter import RosetteLifter
from RoseLLVMCodeGen import LLVMCodeGen

import sys


def HandleLowLevelCodeGen(RosetteFileName : str, LLVMModuleName : str = None):
  # Build the Rose IR function and Rose LLVM context from Rosette code
  RosetteFile = open(RosetteFileName, "r")
  RosetteCode = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteCode.append(Line)
    Line = RosetteFile.readline()
  RosetteFile.close()
  Lifter = RosetteLifter()
  RoseIRFunctionToRoseLLVMCtx = Lifter.lift(RosetteCode)
  assert isinstance(RoseIRFunctionToRoseLLVMCtx, dict)

  # Now generate LLVM module with the functions in it
  LLVMIRModule = LLVMCodeGen(RoseIRFunctionToRoseLLVMCtx, LLVMModuleName)
  print("LLVM MODULE")
  print(LLVMIRModule)
  Module = open(LLVMIRModule.name + ".ll", "w")
  Module.write(LLVMIRModule.__repr__())
  Module.close()


if __name__ == '__main__':
  assert len(sys.argv[1:]) > 0
  RosetteFileName = sys.argv[1]
  if len(sys.argv[1:]) == 1:
    HandleLowLevelCodeGen(RosetteFileName)
  else:
    LLVMModuleName = sys.argv[2]
    HandleLowLevelCodeGen(RosetteFileName, LLVMModuleName)

