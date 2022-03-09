#############################################################
#
# Rosette code fuzzer to compare rosette code correctness
# against vendor-provided C intrinsics.
#
#############################################################


from enum import Enum, auto
from copy import deepcopy
from RoseAbstractions import RoseFunction
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *

import Rosex86CCodeEmitter


def SizeInBytes(Size):
  if Size < 8:
      return 1
  Numbytes = int(Size / 8)
  assert Numbytes * 8 == Size
  return Numbytes


class RoseFuzzer():
  # Error codes
  class ERR(Enum):
    NONE = auto()
    NEQ = auto()
    ROSE = auto()
    C = auto()
    BOTH = auto()

  # Keep a record of all target-specific APIs here
  TargetAPI = {
    "x86" : Rosex86CCodeEmitter
  }

  def __init__(self, Target : str):
    # Generate code for all semantics first
    CodeGenerator = RoseCodeGenerator(Target)
    self.FunctionInfoList = CodeGenerator.codeGen()
    # Save target 
    self.Target = Target

  def genRandomInputs(self, Function : RoseFunction):
    FuncArgs = Function.getArgs()
    ConcArgs = []
    Counter = 0
    for Index in range(len(FuncArgs)):
      NewArg = []
      for _ in range(SizeInBytes(FuncArgs[Index].getType().getBitwidth())):
        NewArg.append(Counter)
        Counter += 1
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def fuzz(self):
    File = open("FUZZ_RESULTS", "w+")
    for FunctionInfo in self.FunctionInfoList:
      assert isinstance(FunctionInfo, RoseFunctionInfo)
      RosetteOut, RosetteErr, COut, CErr, Result = self.fuzzInstruction(FunctionInfo)
      self.dumpResults(File, FunctionInfo, RosetteOut, RosetteErr, COut, CErr, Result)
    File.close()

  def fuzzInstruction(self, FunctionInfo : RoseFunctionInfo):
    Sema = FunctionInfo.getRawSemantics()
    Context = FunctionInfo.getContext()
    Function = FunctionInfo.getLatestFunction()
    assert isinstance(Context, RoseContext)
    RosetteEmitter = RosetteCodeEmitter(FunctionInfo)
    CEmitter = self.TargetAPI[self.Target].CCodeEmitter(FunctionInfo)
    ConcArgs = self.genRandomInputs(Function)
    RosetteOut, RosetteErr = RosetteEmitter.test(ConcArgs)
    COut, CErr = CEmitter.test(ConcArgs)
    Result = self.compareResults(RosetteOut, RosetteErr, COut, CErr)
    return RosetteOut, RosetteErr, COut, CErr, Result

  def dumpResults(self, File, FunctionInfo, RosetteOut, RosetteErr, COut, CErr, Result):
    Function = FunctionInfo.getLatestFunction()
    assert isinstance(Function, RoseFunction)
    try:
      FmtOut = "-----------------------------\n"
      FmtOut += "{} - STDOUT:\n{}\n"
      FmtOut += "-----------------------------\n"
      FmtOut += "{} - STDERR:\n{}\n"
      FmtOut += "-----------------------------\n\n"
      Rose_Out = FmtOut.format("Rosette", RosetteOut, "Rosette", RosetteErr)
      C_Out = FmtOut.format("C", COut, "C", CErr)
      Res = "Result: " + str(Result) + "\n"
      File.write(Function.getName() + "\n")
      File.write(Rose_Out)
      File.write(C_Out)
      File.write(Res)
    except IOError:
      assert False

  def compareResults(self, RosetteOut, RosetteErr, COut, CErr):
    Rose_Err = False
    C_Err = False
    if (RosetteErr is not None) and (RosetteErr != ""):
        Rose_Err = True
    if (CErr is not None) and (CErr != ""):
        C_Err = True
    if C_Err and Rose_Err:
        return self.ERR.BOTH
    if C_Err:
        return self.ERR.C
    if Rose_Err:
        return self.ERR.ROSE
    if COut != RosetteOut:
        return self.ERR.NEQ
    return self.ERR.NONE


if __name__ == '__main__':
  Fuzzer = RoseFuzzer("x86")
  Fuzzer.fuzz()


