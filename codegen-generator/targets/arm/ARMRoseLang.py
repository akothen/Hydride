
from ARMSemanticGen import SemaGenerator
from ARMRoseCompiler import ARMRoseContext, CompileSemantics
from ARMPipeline import pipeline
from ARMTypes import *
from ARMAST import *
from ARMMeta import *
import ARMArithTransformPass
from ARMASTPrinter import getSemaAsString
# CheckFPAdvSIMDEnabled64();
# bits(datasize) operand1 = V[n];
# bits(datasize) operand2 = V[m];
# bits(datasize) result;
# bits(esize) element1;
# bits(esize) element2;

# for e = 0 to elements-1
#     element1 = Elem[operand1, e, esize];
#     element2 = Elem[operand2, e, esize];
#     if sub_op then
#         Elem[result, e, esize] = element1 - element2;
#     else
#         Elem[result, e, esize] = element1 + element2;

# V[d] = result;
import sys
from RosetteGen import GenerateRosetteForFunction
DEBUG = True
skip = notSSA + ['vcopy']


def Compile(InstName: str = None):
    skipForSimilarity = skip + [
        'and', 'bsl', 'bic', 'eor', 'orr', 'orn',  # Extract can't handle
        'addv', 'paddd'  # Transformation can't handle them
    ]
    from RoseFunctionInfo import RoseFunctionInfo

    if InstName == None:
        whitelist = []
        # whitelist = ["vshr"]
        interested = []
        # interested = ["vaba_s16"]
        # interested = ["vshr_n_u8"]
        # interested = ["max", "min"]
        # interested = ["vmovl_s8","vdupq_n_s16"]
        # interested = ["vshl", "vqshl", "vrshl", "vqrshl"]
        # interested = ["_n_"]
        # interested = ["vaddvq_u8", 'vdot_u32']
        # interested = ["addv"]
        # interested = ["dot",  "ada"]
        # interested = ["vshr"]
        # interested = ["vmovl_u16"]
        # interested = ["vbic_u16","vbic_u8",]
        # interested = ["get","combine"]
        # interested = ["paddl"]
        # interested = ['qrdmulh', 'qdmulh']
        # interested = ['vabal_high_s16']
        # interested = ['vshr_n_s16']
        # interested = ['vqdmlal_high_n_s16']
        # interested = ['vqdmulh_s16']
        # interested = ["v"+i+"shl_" for i in ['qr','q','r',""]]
        # interested = ["aarch64_vector_arithmetic_binary_uniform_shift_sisd","aarch64_vector_arithmetic_binary_uniform_shift_simd"]
        # interested = ['vcge_u32', 'vclt_u16', 'vclt_s16']
        # interested = ['zip']
        # interested = ['vqshl']
        # interested = ['vtrn1_s8']
        # interested = ['vdot_s32']
        # interested = ["vqmovn_u16"]
        # interested = ["vcgez"]
        AllSema = SemaGenerator(deserialize=True).getResult()
        if interested:
            AllSema = {k: v for k, v in AllSema.items(
            ) if k in interested or v.belongs_to in interested or any(kk in k for kk in interested)}
        # SemaList = [SemaGenerator(deserialize=True).getSemaByName("vand_s8")]
        SemaList = []
        for k, func in AllSema.items():
            if any(kk in k for kk in skipForSimilarity):
                continue
            k, assignment = extract_assignment_from_name(k)
            if len(assignment) >= 1:
                continue  # skip the immediates
            # if len(assignment) != 1 and (k in whitelist or any(kk in k for kk in whitelist)):
            #   continue  #shr stuffs
            SemaList.append(func)
        # print(SemaList)
        print("SemaList length:")
        print(len(SemaList))
    else:
        print("PARSING INSTRUCTION")
        SemaList = [SemaGenerator(deserialize=True).getSemaByName(InstName)]
        print("SemaList length:")
        print(len(SemaList))

    if SemaList == None:
        return [None]
    FunctionInfoList = []
    compiled = []
    for Index, Spec in enumerate(SemaList):
        # if Index < 1100:
        #     continue
        if any(kk in Spec.intrin for kk in skipForSimilarity):
            print("Skip spec", Spec.intrin, e, file=sys.stderr)
            continue
        try:
            RootContext = ARMRoseContext()
            print("RootContext---:")
            print(RootContext)
            print("Spec:")
            print(Spec)
            # Spec = pipeline(Spec)
            print(getSemaAsString(Spec.spec))
            FunctionInfo = RoseFunctionInfo()
            CompiledFunction = CompileSemantics(Spec, RootContext)
            if DEBUG:
                ARMArithTransformPass.Run(CompiledFunction, RootContext)
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
            Function = CompileSemantics(func, ARMRoseContext())
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


def TestcaseGen2():
    from RoseCodeGenerator import RoseCodeGenerator
    CodeGenerator = RoseCodeGenerator(Target="ARM")
    FunctionInfoList = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    AllRosetteCode = "#lang rosette\n(require \"bvops.rkt\")\n"
    for FunctionInfo in FunctionInfoList:
        RosetteCode = GenerateRosetteForFunction(
            FunctionInfo.getLatestFunction(), "")
        AllRosetteCode += RosetteCode
    print("Writing to rosette_test/compiled_new.rkt...")
    AllRosetteCode += "(provide (all-defined-out))"
    with open(f'rosette_test/compiled_new.rkt', 'w') as f:
        f.write(AllRosetteCode)


def TestWithTransormation():
    from RoseCodeGenerator import RoseCodeGenerator
    CodeGenerator = RoseCodeGenerator(Target="ARM")
    FunctionInfoList = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    for FunctionInfo in FunctionInfoList:
        print(GenerateRosetteForFunction(FunctionInfo.getLatestFunction(), ""))


if __name__ == "__main__":

    DEBUG = True
    if "--gen" in sys.argv:
        TestcaseGen2()
    if "--gen0" in sys.argv:
        TestcaseGen()
    elif "--cdbg" in sys.argv:
        Compile()
    else:
        TestWithTransormation()

    # TestcaseGen()

    # print(RosetteCode)

    # with open(f'rosette_test/{func.intrin}', 'w') as f:
    #     f.write(RosetteCode)
    # print(RosetteCode)
