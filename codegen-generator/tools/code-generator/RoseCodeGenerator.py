#############################################################
#
# Rosette code generator with all Rosette IR pass pipeline.
#
#############################################################


import x86RoseLang
import HexRoseLang

import RoseCSE
import RoseDCE
import RoseBVLengthReduction
import RoseLoopReroller
import RoseLoopDistributer
import RoseFunctionInliner
import RoseExtractConstants
import RoseCanonicalize
import RoseOpCombine
import RoseOpSimplify
import RosetteGen
import RoseReg2Reg
import RoseAssignDestination
import RoseAbstractSignedness
import RoseSinkBVInsertOps

import multiprocessing


class RoseCodeGenerator:
    # Keep a record of all target-specific APIs here
    TargetAPI = {
        "x86": x86RoseLang,
        "Hexagon": HexRoseLang,
    }

    def __init__(self, Target: str):
        assert Target in self.TargetAPI
        self.Target = Target
        self.JustGenRosette = None
        self.ExtractConstants = None

    def codeGenFunction(self, FunctionInfo):
        # Generate code for the function in the given function info
        Function = FunctionInfo.getLatestFunction()
        print("Function NAEEM:")
        print(Function.getName())
        Context = FunctionInfo.getContext()
        print("EXTERACTED CONTEXT FROM FUNCTIONINFO")
        Context.print()
        if self.JustGenRosette == False:
            Function = Function.clone()
            Context.print()
            RoseSinkBVInsertOps.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            RoseReg2Reg.Run(Function, Context)
            Context.print()
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseAssignDestination.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseBVLengthReduction.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseLoopReroller.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            # Function = Function.clone()
            # RoseOpSimplify.Run(Function, Context)
            # FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseOpCombine.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            # Function = Function.clone()
            # RoseCSE.Run(Function, Context)
            # FunctionInfo.addFunctionAtNewStage(Function)
            # Function = Function.clone()
            # RoseDCE.Run(Function, Context)
            # FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseLoopDistributer.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseOpSimplify.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseOpCombine.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseCSE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseDCE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseFunctionInliner.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseOpCombine.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseCSE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseDCE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseCanonicalize.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseOpCombine.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseCSE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            Function = Function.clone()
            Context.print()
            RoseDCE.Run(Function, Context)
            FunctionInfo.addFunctionAtNewStage(Function)
            FunctionInfo.addTargetSpecificFunction(Function)
            Function = Function.clone()
            if self.ExtractConstants == True:
                # Write the Rose IR function to a file
                # File = open("semantics.ll", "a")
                # File.write(str(Function))
                # File.write("\n")
                # File.close()
                Context.print()
                RoseAbstractSignedness.Run(Function, Context)
                FunctionInfo.addFunctionAtNewStage(Function)
                Function = Function.clone()
                ArgToConstantValsMap = dict()
                RoseExtractConstants.Run(
                    Function, Context, ArgToConstantValsMap)
                FunctionInfo.addFunctionAtNewStage(Function)
                FunctionInfo.addArgsToConcreteMap(ArgToConstantValsMap)
                FunctionInfo.addTargetAgnosticFunction(Function)
                Function = Function.clone()
                # File = open("semantics.ll", "a")
                # File.write(str(Function))
                # File.write("#---------------------------------------------------------------------\n\n\n\n")
                # ile.close()
        RosetteCode = RosetteGen.CodeGen(Function)
        FunctionInfo.addContext(Context)
        print("END CODEGEN")
        print(RosetteCode)
        return FunctionInfo

    def codeGen(self, FunctionInfo=None, JustGenRosette: bool = False,
                ExtractConstants: bool = False, NumThreads: int = 1):
        print("START CODEGEN-----")
        self.JustGenRosette = JustGenRosette
        self.ExtractConstants = ExtractConstants
        if FunctionInfo == None:
            FunctionInfoList = self.TargetAPI[self.Target].Compile()
            if NumThreads == 1:
                for FunctionInfoIt in FunctionInfoList:
                    print("START CODEGEN")
                    print("-----Function NAEEM:")
                    print(FunctionInfoIt.getLatestFunction().getName())
                    self.codeGenFunction(FunctionInfoIt)
                    print(type(self))
                    FunctionInfoIt.addCodeGenerator(self)
                return FunctionInfoList
            else:
                Pool = multiprocessing.Pool(NumThreads)
                Result = list()
                for FunctionInfo in Pool.imap_unordered(self.codeGenFunction, FunctionInfoList):
                    Result.append(FunctionInfo)
                return Result
        return self.codeGenFunction(FunctionInfo)


if __name__ == '__main__':
    CodeGenerator = RoseCodeGenerator(Target="Hexagon")
    # CodeGenerator = RoseCodeGenerator(Target="x86")
    CodeGenerator.codeGen(JustGenRosette=False, ExtractConstants=True)
