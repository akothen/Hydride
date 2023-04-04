
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
    # AllSema = {"vaddq_s16": ARMTestCases.vaddq_s16()}
    compiled = []
    for k, func in AllSema.items():
        try:
            print("Compiling", k)
            print(func.intrin, func.spec)
            Function = CompileSemantics(func, ARMRoseContext())
        except NotImplementedError as e:
            print("Failed to compile", k)
            # print(e)
            continue
        compiled.append(k)
        # RosetteCode = GenerateRosetteForFunction(Function, "")
        # print(RosetteCode)
    print(len(compiled), "functions compiled:")
    print(compiled)

    # with open(f'rosette_test/{func.intrin}', 'w') as f:
    #     f.write(RosetteCode)
    # print(RosetteCode)
