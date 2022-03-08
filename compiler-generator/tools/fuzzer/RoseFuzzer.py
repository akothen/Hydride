
from enum import Enum, auto
from copy import deepcopy
from RoseAbstractions import RoseFunction
from RoseContext import *
from RosetteCodeEmitter import *
import Rosex86CCodeEmitter


def SizeInBytes(Size):
  if Size < 8:
      return 1
  Numbytes = int(Size / 8)
  assert Numbytes * 8 == Size
  return Numbytes


class RoseFuzzer():
  class ERR(Enum):
    NONE = auto()
    NEQ = auto()
    ROSE = auto()
    C = auto()
    BOTH = auto()

  def __init__(self, FunctionToSema : dict, FunctionToContext : dict):
    self.FunctionToSema = FunctionToSema
    self.FunctionToContext = FunctionToContext

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
    for Function, _ in self.FunctionToSema.items():
      RosetteOut, RosetteErr, COut, CErr, Result = self.fuzzInstruction(Function)
      self.dumpResults(File, Function, RosetteOut, RosetteErr, COut, CErr, Result)
    File.close()

  def fuzzInstruction(self, Function : RoseFunction):
    assert Function in self.FunctionToSema
    assert Function in self.FunctionToContext
    Sema = self.FunctionToSema[Function]
    Context = self.FunctionToContext[Function]
    assert isinstance(Context, RoseContext)
    RosetteEmitter = RosetteCodeEmitter(Function, Sema, Context)
    CEmitter = Rosex86CCodeEmitter.CCodeEmitter(Function, Sema)
    ConcArgs = self.genRandomInputs(Function)
    RosetteOut, RosetteErr = RosetteEmitter.test(ConcArgs)
    COut, CErr = CEmitter.test(ConcArgs)
    Result = self.compareResults(RosetteOut, RosetteErr, COut, CErr)
    return RosetteOut, RosetteErr, COut, CErr, Result

  def dumpResults(self, File, Function, RosetteOut, RosetteErr, COut, CErr, Result):
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
  Sema, Context, Function = x86RoseLang.Compile()
  FunctionToSema = dict()
  FunctionToContext = dict()
  FunctionToSema[Function] = Sema
  FunctionToContext[Function] = Context
  Fuzzer = RoseFuzzer(FunctionToSema, FunctionToContext)
  Fuzzer.fuzz()

  
