#############################################################
#
# This helps check if an instuction is valid on the given 
# target.
#
#############################################################


from RoseCodeEmitter import *
from x86Types import *
from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseSimilarityCheckerUtilities import *
import Rosex86CCodeEmitter


class RoseISAValidityChecker:
  # Keep a record of all target-specific APIs here
  TargetAPI = {
    "x86" : x86RoseLang,
    #"Hexagon" : HexRoseLang,
    "ARM": ARMRoseLang,
  }

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

  def createTestDir(self, DirName : str):
    assert isinstance(DirName, str)
    RunCommand("mkdir " + DirName)

  def checkValidityOnTarget(self, InstName : str, TargetName : str):
    # We will emit C code with C builtins and try to compile
    # and execute them, if we fail, we will not generate wrappers
    # for those instructions.
    [FunctionInfo] = self.TargetAPI[TargetName].Compile(InstName)
    if FunctionInfo == None:
      print("INVALID INSTRUCTION")
      return False
    TestDirName = InstName + "_test"
    self.createTestDir(TestDirName)
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    return self.isInstValid(TestDirName, FunctionInfo)

  def isInstValid(self, TestDirName : str, FunctionInfo : RoseFunctionInfo):
    # Emit C code, compile and execute this instuction and check 
    # if the error is fatal.
    Function = FunctionInfo.getLatestFunction()
    CEmitter = Rosex86CCodeEmitter.CCodeEmitter(FunctionInfo)
    ConcArgs = self.genRandomInputs(Function)
    _, CErr = CEmitter.test(TestDirName, ConcArgs)
    if CEmitter.isErrorFatal(CErr) == True:
      print("FATAL ERROR")
      print("INVALID INSTRUCTION")
      return False
    print("VALID instruction")
    return True

if __name__ == '__main__':
  Checker = RoseISAValidityChecker()
  Result = Checker.checkValidityOnTarget("_mm_movepi64_pi64", "x86")
  print("RESULT:")
  print(Result)
  Result = Checker.checkValidityOnTarget("_mm_cvtsi128_si64x", "x86")
  print("RESULT:")
  print(Result)


