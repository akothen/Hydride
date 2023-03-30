from asl.ARMParser import get_parser
from ARMTestCases import aarch64_vector_arithmetic_binary_uniform_mul_fp16_extended_sisd as data
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
# BEGIN
#     element1 = Elem[operand1, e, esize];
#     element2 = Elem[operand2, e, esize];
#     Elem[result, e, esize] = FPMul(element1, element2, FPCR[]);
# END
# V[d] = result;


if __name__ == "__main__":
    Parser = get_parser('inst')
    encoding = Parser.parse(data)
    realExe = ASTShrink(encoding.instExecute)
    resolving = {
        "datasize": 128,
        "esize": 16,
        "elements": 8,
    }
    preparation = {
        "n": "a",
        "m": "b",
        "d": "result",
    }
    print(realExe)
    Sema = ARMSema(
        "vmul_f32",
        "FMUL",
        ["float32x2_t", "float32x2_t"],
        realExe,
        "float32x2_t",
        True,
        "FMUL Vd.2S,Vn.2S,Vm.2S",
        None, None, None, None,
        preparation, resolving
    )
    # CompileSemantics(Sema, ARMRoseContext())
