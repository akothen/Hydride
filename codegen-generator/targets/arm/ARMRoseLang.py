
from ARMTestCases import *
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


if __name__ == "__main__":
    func = vsubq_s16()
    Function = CompileSemantics(func, ARMRoseContext())
    from RosetteGen import GenerateRosetteForFunction
    RosetteCode = GenerateRosetteForFunction(Function, "")
    with open(f'rosette_test/{func.intrin}', 'w') as f:
        f.write(RosetteCode)
    print(RosetteCode)
