from ARMSatTransform import SaturationReplacer
from ARMTypeInfer import TypeInferencer
from ARMConstantReplacer import ConstantReplacer
from ARMTypes import *
from ARMMeta import *
from ARMAST import *


def pipeline(func: ARMSema):
    # spec = ConstantReplacer(func, True, True, False).go(spec)
    spec = ConstantReplacer(func, False, False, True).go(ASTcopy(func.spec))
    # spec = TypeInferencer(func).go(spec)
    # spec = SaturationReplacer().go(spec)
    spec = ConstantReplacer(func, True, True, False).go(spec)
    return func._replace(spec=spec)


if __name__ == "__main__":
    from ARMSemanticGen import SemaGenerator
    from ARMParser import emitSema
    AllSema = SemaGenerator(deserialize=True).getResult()
    skip = memory_ops
    interested = []
    interested = ["vhadd_s16"]
    interested = ["vrshr_n_s64"]
    interested = ["vabs_s8"]
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        if interested and not any(kk in k for kk in interested):
            continue
        k, assignment = extract_assignment_from_name(k)
        assert len(assignment) == 0
        print(func)
        print("\n".join(emitSema(func.spec)))
        spec = pipeline(func).spec
        print("\n".join(emitSema(spec)))
