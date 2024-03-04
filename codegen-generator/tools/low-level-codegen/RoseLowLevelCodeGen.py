#############################################################
#
# This tool does codegen through LLVM
#
#############################################################


from RosetteLifter import RosetteLifter
from RoseLLVMCodeGen import LLVMCodeGen

import sys
import os


# ~/Hydride/llvm-project/build/lib/LLVMHydride.so
# x86_wrappers.c.ll
# -x86-hydride-legalize

def HandleLowLevelCodegenAIEVec(RosetteFileName: str, PathToLegalizerLib: str,
             PathToWrapperFile: str, LegalizationFlag: str,
             LLVMModuleName: str = None):
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
  LegalizeLLVMModuleName= LLVMIRModule.name + ".legalize.ll"
  LinkedLLVMModuleName = LLVMIRModule.name + ".linked.ll"
  with open(LinkedLLVMModuleName, "w") as Module, open(PathToWrapperFile, "r") as Declarations:
    # Brutally link the wrapper functions back to the module by appending them
    Module.write(LLVMIRModule.__repr__())
    Module.write(Declarations.read())
  Command = "opt -load {} -enable-new-pm=0 {} -adce -globaldce {} -S -o {}".format(
      PathToLegalizerLib, LegalizationFlag,
      LinkedLLVMModuleName, LegalizeLLVMModuleName)
  print(Command)
  os.system(Command)

def HandleLowLevelCodeGen(RosetteFileName : str, PathToLegalizerLib : str, \
                          PathToWrapperFile : str, LegalizationFlag : str, \
                          LLVMModuleName : str = None):
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
  # Legalize code
  print("EXECUTING:")
  OriginalLLVMModuleName = LLVMIRModule.name + ".ll"
  LinkedLLVMBCModuleName = LLVMIRModule.name + ".linked.bc"
  Command = "llvm-link  {} {} -o {}".format(OriginalLLVMModuleName, PathToWrapperFile, LinkedLLVMBCModuleName)
  print(Command)
  os.system(Command)
  print("EXECUTING:")
  LinkedLLVMModuleName = LLVMIRModule.name + ".linked.ll"
  Command = "llvm-dis  {} -o {}".format(LinkedLLVMBCModuleName, LinkedLLVMModuleName)
  print(Command)
  os.system(Command)
  print("EXECUTING:")
  LegalizeLLVMModuleName = LLVMIRModule.name + ".legalize.ll"
  Command = "opt -load {} -enable-new-pm=0 {} -adce -globaldce {} -S -o {}".format(PathToLegalizerLib, LegalizationFlag, \
                                                          LinkedLLVMModuleName, LegalizeLLVMModuleName)
  print(Command)
  os.system(Command)



# ARG 1: Rosette code to be lifted
# ARG 2: Path to Shared library that is the target-specific legalizer
# ARG 3: Path to LLVM wrapper file for a target (x86_wrappers.c.ll)
# ARG 4: Legalization flag (example: -x86-hydride-legalize)
# ARG 4 (optional): Name of LLVM module to be generated
if __name__ == '__main__':
  assert len(sys.argv[1:]) > 0
  RosetteFileName = sys.argv[1]
  PathToLegalizerLib = sys.argv[2]
  PathToWrapperFile = sys.argv[3]
  LegalizationFlag = sys.argv[4]
  if len(sys.argv[1:]) == 4:
    HandleLowLevelCodeGen(RosetteFileName, PathToLegalizerLib, LegalizationFlag, PathToWrapperFile)
  else:
    LLVMModuleName = sys.argv[5]
    if "aievec" in LegalizationFlag:
      # Different handling for AIEVec
      HandleLowLevelCodegenAIEVec(RosetteFileName, PathToLegalizerLib,
                PathToWrapperFile, LegalizationFlag, LLVMModuleName)
    else:
      HandleLowLevelCodeGen(RosetteFileName, PathToLegalizerLib, PathToWrapperFile,
                            LegalizationFlag, LLVMModuleName)

