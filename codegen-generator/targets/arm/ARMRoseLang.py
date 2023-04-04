
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

from RosetteGen import GenerateRosetteForFunction
if __name__ == "__main__":
    AllSema = SemaGenerator(deserialize=True).getResult()
    # AllSema = {k: AllSema[k] for k in ["vrax1q_u64"]}
    compiled = []
    # Across vector cannot be convert to SSA easily
    skip = ['addlv', 'maxv', 'minv', 'abd']
    import sys
    AllRosetteCode = "#lang rosette\n"
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        try:
            print("Compiling", k)
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
    with open(f'rosette_test/Test.rkt', 'w') as f:
        f.write(AllRosetteCode)
    # print(RosetteCode)

    # with open(f'rosette_test/{func.intrin}', 'w') as f:
    #     f.write(RosetteCode)
    # print(RosetteCode)
