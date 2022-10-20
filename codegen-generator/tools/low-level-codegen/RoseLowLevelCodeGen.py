#############################################################
#
# This tool does codegen through LLVM
#
#############################################################


from RosetteLifter import RosetteLifter
from RoseLLVMCodeGen import LLVMCodeGen



def HandleLowLevelCodeGen(RosetteFileName):
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
  LLVMIRModule = LLVMCodeGen(RoseIRFunctionToRoseLLVMCtx)
  print("LLVM MODULE")
  print(LLVMIRModule)
  Module = open(LLVMIRModule.name + ".ll", "a")
  Module.write(LLVMIRModule.__repr__())
  Module.close()



if __name__ == '__main__':
  RosetteFileName = "test.rkt"
  HandleLowLevelCodeGen(RosetteFileName)

