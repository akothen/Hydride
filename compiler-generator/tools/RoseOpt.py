
import x86RoseLang

import RoseCSE
import RoseDCE
import RoseLoopReroller
import RoseFunctionInliner
import RoseExtractConstants
import RoseCanonicalize
import RoseOpCombine
import RosetteGen

from RoseFunctionInfo import *



class RoseCodeGen:
  # Keep a record of all target-specific APIs here
  TargetAPI = {
    "x86" : x86RoseLang
  }

  def __init__(self, Target):
    assert  Target in self.TargetAPI
    self.Target = Target
    self.FunctionInfoList = list()

  def codeGen(self, ExtractConstants : bool = False, FunctionInfo : RoseFunctionInfo = None):
    if FunctionInfo == None:
      self.FunctionInfoList = self.TargetAPI[self.Target].Compile()
      for FunctionInfo in self.FunctionInfoList:
        self.codeGen(ExtractConstants, FunctionInfo)
      return
    # Generate code for the function in the given function info
    Function = FunctionInfo.getLatestFunction()
    Context = FunctionInfo.getContext()
    Function = Function.clone()
    RoseLoopReroller.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    #RoseFunctionInliner.Run(Function, Context)
    RoseOpCombine.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    RoseCSE.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    RoseCanonicalize.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    RoseOpCombine.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    RoseCSE.Run(Function, Context)
    FunctionInfo.addFunctionAtNewStage(Function)
    Function = Function.clone()
    if ExtractConstants == True:
      RoseExtractConstants.Run(Function, Context)
      FunctionInfo.addFunctionAtNewStage(Function)
      Function = Function.clone()
    RosetteCode = RosetteGen.CodeGen(Function)
    FunctionInfo.addContext(Context)
    return RosetteCode




if __name__ == '__main__':
  Codegen = RoseCodeGen(Target="x86")
  Codegen.codeGen()

