from VISASemaGenerator import SemaGenerator
from VISARoseCompiler import VISARoseContext, CompileSemantics
from VISASupportedIntrinsics import SupportedVISAIntrinsics
from VISAAST import *
from VISAMeta import *
import sys
from RosetteGen import GenerateRosetteForFunction
import logging


skip = ParseError + FlowControl + Stateful + Uncommon + CompileIssue


def Compile(OnlyCompileSupported=True):
    from RoseFunctionInfo import RoseFunctionInfo

    interested = []
    # interested = ['SHR','ASR','SHL']
    # interested = ['AVG']
    # interested = ['BFE']
    # interested = ['DIV']
    # interested = ['MOD']
    # interested = ['MAD_sat']
    # interested = ['MULH']
    # interested = ['DP4A']
    # interested = ['DPAS']
    AllSema = SemaGenerator(deserialize=True).getResult()
    if interested:
        AllSema = {k: v for k, v in AllSema.items(
        ) if k in interested or any(kk in k for kk in interested)}
    # SemaList = [SemaGenerator(deserialize=True).getSemaByName("vand_s8")]
    SemaList: List[VISASema] = []
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        # if OnlyCompileSupported and k not in SupportedVISAIntrinsics:
        #     continue
        SemaList.append(func)
    # print(SemaList)
    Hlog.info("SemaList length:")
    Hlog.info(len(SemaList))
    
    from VISAParser import SimpleParser
    S = SimpleParser()
    S.build()
    
    SemaList=[
        VISASema(intrin='VDPAS.W.A.SD.RC_16_D_D_D_D', inst='DPAS.W.A.SD.RC', params=[Parameter(name='src0', type='M', is_signed=True), Parameter(name='src1', type='M', is_signed=True), Parameter(name='src2', type='M', is_signed=True)], spec=S.parse(
"""
  if (Src1Precision == 16) {
        OPS_PER_CHAN = 2;
      } else if (Src1Precision == 8 || Src2Precision == 8) {
        OPS_PER_CHAN = 4;
      } else {
        OPS_PER_CHAN = 8;
      }
      
      SRC1_OPERANDS_PER_CHAN = 32 / (OPS_PER_CHAN * Src1Precision);

      k = 0;
      for (r = 0; r < RC; ++r)
      {
        temp = src0.R[r];
        for ( i = 0; i < exec_size; ++i )
        { // for each channel
          for (d = 0; d < SD; ++d )
          {
            temp.DW[i] = temp.DW[i];// + dot(OPS_PER_CHAN, src2.R[r].DW[d], src1.R[d].DW[i]);
          }
        }
        dst.R[r] = temp;
      }
"""), inst_form='DPAS.W.A.SD.RC    (<exec_size>) <dst> <src0> <src1> <src2>', rettype='M', flags={'sat': False, 'asr': False}, resolving={'exec_size': 16, 'type_map': {'src0': 'M', 'src1': 'M', 'src2': 'M', 'dst': 'M'}, 'Src0Precision': 32, 'Src1Precision': 8, 'Src2Precision': 8, 'DstPrecision': 32, 'RC':8, 'SD':8}, extensions=None),
    ]
    FunctionInfoList = []
    compiled = []
    compiledFamily = set()
    for Index, Spec in enumerate(SemaList):
        try:
            RootContext = VISARoseContext()
            Hlog.debug("RootContext---:")
            Hlog.debug(RootContext)
            Hlog.debug("Spec:")
            Hlog.debug(Spec)
            # Spec = pipeline(Spec)
            print(getSemaAsString(Spec.spec))
            FunctionInfo = RoseFunctionInfo()
            CompiledFunction = CompileSemantics(Spec, RootContext)
            FunctionInfo.addContext(RootContext)
            FunctionInfo.addRawSemantics(Spec)
            FunctionInfo.addFunctionAtNewStage(CompiledFunction)
            Hlog.debug("Index*****")
            Hlog.debug(Index)
            Hlog.debug("CompiledFunction:")
            CompiledFunction.print()
            # Hlog.debug(GenerateRosetteForFunction(CompiledFunction, ""))
            FunctionInfoList.append(FunctionInfo)
            compiled.append(Spec.intrin)
            compiledFamily.add(Spec.inst)
        except NotImplementedError as e:
            Hlog.warning("Failed to compile for %s: %s", Spec.intrin, e)
            # print(e)
            continue
    Hlog.info("FunctionInfoList length: %s", len(FunctionInfoList))
    Hlog.debug(compiledFamily)
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


def TestcaseGen2():
    from RoseCodeGenerator import RoseCodeGenerator
    CodeGenerator = RoseCodeGenerator(Target="VISA")
    FunctionInfoList = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    AllRosetteCode = "#lang rosette\n(require \"bvops.rkt\")\n"
    for FunctionInfo in FunctionInfoList:
        RosetteCode = GenerateRosetteForFunction(
            FunctionInfo.getLatestFunction(), "")
        AllRosetteCode += RosetteCode
    Hlog.info("Writing to rosette_test/compiled_new.rkt...")
    AllRosetteCode += "(provide (all-defined-out))"
    with open(f'rosette_test/compiled_new.rkt', 'w') as f:
        f.write(AllRosetteCode)


def TestWithTransormation():
    from RoseCodeGenerator import RoseCodeGenerator
    CodeGenerator = RoseCodeGenerator(Target="VISA")
    FunctionInfoList = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    # for FunctionInfo in FunctionInfoList:
    #     print(GenerateRosetteForFunction(FunctionInfo.getLatestFunction(), ""))


if __name__ == "__main__":

    DEBUG = True
    if "--gen" in sys.argv:
        TestcaseGen()
    elif "--gen2" in sys.argv:
        OnlyCompileSupported = True
        TestcaseGen2()
    elif "--cdbg" in sys.argv:
        Compile(False)
    else:
        TestWithTransormation()
