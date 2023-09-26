from VISASemaGenerator import SemaGenerator
from VISARoseCompiler import VISARoseContext, CompileSemantics
from VISAAST import *
from VISAMeta import *
import sys
from RosetteGen import GenerateRosetteForFunction
DEBUG = True


def Compile():
    from RoseFunctionInfo import RoseFunctionInfo

    interested = []
    interested = ['VADD_sat_8_UQ']
    AllSema = SemaGenerator(deserialize=True).getResult()
    if interested:
        AllSema = {k: v for k, v in AllSema.items(
        ) if k in interested or any(kk in k for kk in interested)}
    # SemaList = [SemaGenerator(deserialize=True).getSemaByName("vand_s8")]
    SemaList = []
    for k, func in AllSema.items():
        SemaList.append(func)
    # print(SemaList)
    print("SemaList length:")
    print(len(SemaList))

    if SemaList == None:
        return [None]
    FunctionInfoList = []
    compiled = []
    for Index, Spec in enumerate(SemaList):
        try:
            RootContext = VISARoseContext()
            print("RootContext---:")
            print(RootContext)
            print("Spec:")
            print(Spec)
            # Spec = pipeline(Spec)
            print(getSemaAsString(Spec.spec))
            FunctionInfo = RoseFunctionInfo()
            CompiledFunction = CompileSemantics(Spec, RootContext)
            FunctionInfo.addContext(RootContext)
            FunctionInfo.addRawSemantics(Spec)
            FunctionInfo.addFunctionAtNewStage(CompiledFunction)
            print("Index*****")
            print(Index)
            print("CompiledFunction:")
            CompiledFunction.print()
            print(GenerateRosetteForFunction(CompiledFunction, ""))
            FunctionInfoList.append(FunctionInfo)
            compiled.append(Spec.intrin)
        except NotImplementedError as e:
            print("Failed to compile", Spec.intrin, e, file=sys.stderr)
            # print(e)
            continue
    print("FunctionInfoList length:", len(FunctionInfoList))
    print(compiled)
    # print(FunctionInfoList[0].getInVectorLength())
    return FunctionInfoList


def TestcaseGen():
    AllSema = SemaGenerator(deserialize=True).getResult()
    # AllSema = {k: AllSema[k] for k in ["vget_lane_u64__lane_0"]}
    compiled = []
    # TODO:these intrinsic cannot be convert to functional language easily
    # TODO: vdup_n_s64, vdup_n_u64 can be compiled by manually modify AST

    AllRosetteCode = "#lang rosette\n(require \"bvops.rkt\")\n"
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        try:
            # print("Compiling", k, file=sys.stderr)
            print(func.intrin, func)
            # func = pipeline(func)
            Function = CompileSemantics(func, VISARoseContext())
        except NotImplementedError as e:
            print("Failed to compile", k, e, file=sys.stderr)
            # print(e)
            continue
        compiled.append(k)
        RosetteCode = GenerateRosetteForFunction(Function, "")
        # print(RosetteCode)
        AllRosetteCode += RosetteCode
    print(len(compiled), "functions compiled:", file=sys.stderr)
    print(compiled, file=sys.stderr)
    print("Writing to rosette_test/compiled.rkt...")
    AllRosetteCode += "(provide (all-defined-out))"
    with open(f'rosette_test/compiled.rkt', 'w') as f:
        f.write(AllRosetteCode)


def TestWithTransormation():
    from RoseCodeGenerator import RoseCodeGenerator
    CodeGenerator = RoseCodeGenerator(Target="VISA")
    FunctionInfoList = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    for FunctionInfo in FunctionInfoList:
        print(GenerateRosetteForFunction(FunctionInfo.getLatestFunction(), ""))


if __name__ == "__main__":

    DEBUG = True
    if "--gen" in sys.argv:
        TestcaseGen()
    elif "--cdbg" in sys.argv:
        Compile()
    else:
        TestWithTransormation()
