#############################################################
#
# This tool does codegen through LLVM
#
#############################################################


from RosetteLifter import RosetteLifter
from RoseLLVMCodeGen import LLVMCodeGen



def HandleLowLevelCodeGen(RosetteFileName, KernelName):
  # Build the Rose IR function and Rose LLVM context from Rosette code
  RosetteFile = open(RosetteFileName, "r")
  RosetteCode = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteCode.append(Line)
    Line = RosetteFile.readline()
  RosetteFile.close()
  Lifter = RosetteLifter()
  RoseIRFunction, RoseLLVMCtx = Lifter.lift(KernelName, RosetteCode)

  # Now generate LLVM module with the function in it
  LLVMIRModule = LLVMCodeGen(RoseIRFunction, RoseLLVMCtx)
  print("LLVM MODULE")
  print(LLVMIRModule)
  Module = open(LLVMIRModule.name + ".ll", "a")
  Module.write(LLVMIRModule.__repr__())
  Module.close()



if __name__ == '__main__':
  RosetteFileName = "test.rkt"
  FunctionName = "kernel"
  HandleLowLevelCodeGen(RosetteFileName, FunctionName)


