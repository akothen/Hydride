
from ARMSemanticGen import SemaGenerator
import ARMTestCases
from ARMRoseCompiler import ARMRoseContext, CompileSemantics
from ARMTypes import *
from ARMAST import *
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

skip = ['addlv', 'maxv', 'minv', 'rbit',
        'dot', 'aba', 'rev', 'ada', 'create', 'vdup_n_s64', 'vdup_n_u64', 'vcopy']


def Compile(InstName: str = None):
  from RoseFunctionInfo import RoseFunctionInfo

  if InstName == None:
    whitelist = []
    # whitelist = ["vshr"]
    interested = []
    # interested = ["vshr_n_u8"]
    # interested = ["max", "min"]
    # interested = ["vmovl_s8","vdupq_n_s16"]
    interested = ["shr"]
    AllSema = SemaGenerator(deserialize=True).getResult()
    if interested:
      AllSema = {k: v for k, v in AllSema.items(
      ) if k in interested or any(kk in k for kk in interested)}
    # SemaList = [SemaGenerator(deserialize=True).getSemaByName("vand_s8")]
    SemaList = []
    for k, func in AllSema.items():
      if any(kk in k for kk in skip):
        continue
      k, assignment = extract_assignment_from_name(k)
      if len(assignment) > 0:
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
    if any(kk in Spec.intrin for kk in skip):
      continue
    try:
      RootContext = ARMRoseContext()
      print("RootContext---:")
      print(RootContext)
      print("Spec:")
      print(Spec)
      FunctionInfo = RoseFunctionInfo()
      CompiledFunction = CompileSemantics(Spec, RootContext)
      FunctionInfo.addContext(RootContext)
      FunctionInfo.addRawSemantics(Spec)
      FunctionInfo.addFunctionAtNewStage(CompiledFunction)
      print("Index*****")
      print(Index)
      print("CompiledFunction:")
      CompiledFunction.print()
      FunctionInfoList.append(FunctionInfo)
      compiled.append(Spec.intrin)
    except NotImplementedError as e:
      print("Failed to compile", Spec.intrin, e, file=sys.stderr)
      # print(e)
      continue
  print("FunctionInfoList length:", len(FunctionInfoList))
  print(compiled)
  print(FunctionInfoList[0].getInVectorLength())
  return FunctionInfoList


def qwq():
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
  AllRosetteCode += "(provide (all-defined-out))"
  with open(f'rosette_test/compiled.rkt', 'w') as f:
    f.write(AllRosetteCode)


if __name__ == "__main__":
  # Compile()
  qwq()

  # print(RosetteCode)

  # with open(f'rosette_test/{func.intrin}', 'w') as f:
  #     f.write(RosetteCode)
  # print(RosetteCode)
