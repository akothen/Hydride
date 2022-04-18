#############################################################
#
# Rosette code generator with all Rosette IR pass pipeline.
#
#############################################################


import x86RoseLang

import RoseCSE
import RoseDCE
import RoseBVLengthReduction
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
    print("START CODEGEN-----")
    if FunctionInfo == None:
      FunctionInfoList = self.TargetAPI[self.Target].Compile()
      for FunctionInfoIt in FunctionInfoList:
        print("START CODEGEN")
        print("-----Function NAEEM:")
        print(FunctionInfoIt.getLatestFunction().getName())
        self.codeGen(FunctionInfoIt, JustGenRosette, ExtractConstants)
        print(type(self))
        FunctionInfoIt.addCodeGenerator(self)
      return FunctionInfoList
    # Generate code for the function in the given function info
    Function = FunctionInfo.getLatestFunction()
    print("Function NAEEM:")
    print(Function.getName())
    Context = FunctionInfo.getContext()
    if JustGenRosette == False:
      Function = Function.clone()
      RoseBVLengthReduction.Run(Function, Context)
      FunctionInfo.addFunctionAtNewStage(Function)
      Function = Function.clone()
      RoseLoopReroller.Run(Function, Context)
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
      RoseFunctionInliner.Run(Function, Context)
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
      FunctionInfo.addTargetSpecificFunction(Function)
      Function = Function.clone()
      if ExtractConstants == True:
        ArgToConstantValsMap = dict()
        RoseExtractConstants.Run(Function, Context, ArgToConstantValsMap)
        FunctionInfo.addFunctionAtNewStage(Function)
        FunctionInfo.addArgsToConcreteMap(ArgToConstantValsMap)
        FunctionInfo.addTargetAgnosticFunction(Function)
        Function = Function.clone()
    RosetteCode = RosetteGen.CodeGen(Function)
    FunctionInfo.addContext(Context)
    print("END CODEGEN")
    print(RosetteCode)
    return RosetteCode



if __name__ == '__main__':
  CodeGenerator = RoseCodeGenerator(Target="x86")
  CodeGenerator.codeGen(JustGenRosette=False, ExtractConstants=True)



