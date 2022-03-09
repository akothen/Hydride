#############################################################
#
# Rosette code generator with all Rosette IR pass pipeline.
#
#############################################################


import x86RoseLang

import RoseCSE
import RoseDCE
import RoseLoopReroller
import RoseFunctionInliner
import RoseExtractConstants
import RoseCanonicalize
import RoseOpCombine
import RosetteGen


class RoseCodeGenerator:
  # Keep a record of all target-specific APIs here
  TargetAPI = {
    "x86" : x86RoseLang
  }

  def __init__(self, Target : str):
    assert  Target in self.TargetAPI
    self.Target = Target

  def codeGen(self, FunctionInfo = None, JustGenRosette : bool = False, \
                    ExtractConstants : bool = False):
    if FunctionInfo == None:
      FunctionInfoList = self.TargetAPI[self.Target].Compile()
      for FunctionInfo in FunctionInfoList:
        self.codeGen(FunctionInfo, JustGenRosette, ExtractConstants)
        FunctionInfo.addCodeGenerator(self)
      return FunctionInfoList
    # Generate code for the function in the given function info
    Function = FunctionInfo.getLatestFunction()
    Context = FunctionInfo.getContext()
    if JustGenRosette == False:
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
      RoseDCE.Run(Function, Context)
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
  CodeGenerator = RoseCodeGenerator(Target="x86")
  CodeGenerator.codeGen(JustGenRosette=True, ExtractConstants=True)




