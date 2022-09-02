#############################################################
#
# This is used to test if a target instruction compiles
# and executes on a given target -- this checks the validity
# of a given target instruction.
#
#############################################################


from copy import deepcopy

from RoseAbstractions import RoseFunction
from RoseContext import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
import Rosex86CCodeEmitter


class RoseValidityChecker():
  # Keep a record of all target-specific APIs here
  TargetAPI = {
    "x86" : Rosex86CCodeEmitter
  }

  def __init__(self, Target : str):
    # Save target 
    self.Target = Target

  def genRandomInputs(self, Function : RoseFunction):
    FuncArgs = Function.getArgs()
    ConcArgs = list()
    Counter = 0
    for Index in range(len(FuncArgs)):
      NewArg = list()
      for _ in range(SizeInBytes(FuncArgs[Index].getType().getBitwidth())):
        NewArg.append(Counter)
        Counter += 1
      ConcArgs.append(deepcopy(NewArg))
    return ConcArgs

  def createTestDir(self, DirName : str):
    assert isinstance(DirName, str)
    RunCommand("mkdir " + DirName)

  def isValid(self, FunctionInfo : RoseFunctionInfo):
    assert isinstance(FunctionInfo, RoseFunctionInfo)
    TestDirName = "test"
    self.createTestDir(TestDirName)
    Context = FunctionInfo.getContext()
    Function = FunctionInfo.getLatestFunction()
    assert isinstance(Context, RoseContext)
    CEmitter = self.TargetAPI[self.Target].CCodeEmitter(FunctionInfo)
    ConcArgs = self.genRandomInputs(Function)
    _, CErr = CEmitter.test(TestDirName, ConcArgs)
    return not CEmitter.isErrorFatal(CErr)



