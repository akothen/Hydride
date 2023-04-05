import sys
from ARMSemanticGen import SemaGenerator

VecTypes = {
    "int8x16_t",
    "int16x8_t",
    "int32x4_t",
    "int64x2_t",
    "uint8x16_t",
    "uint16x8_t",
    "uint32x4_t",
    "uint64x2_t",
    "int8x8_t",
    "int16x4_t",
    "int32x2_t",
    "int64x1_t",
    "uint8x8_t",
    "uint16x4_t",
    "uint32x2_t",
    "uint64x1_t",
    "int8_t",
    "int16_t",
    "int32_t",
    "int64_t",
    "uint8_t",
    "uint16_t",
    "uint32_t",
    "uint64_t",
}


def GenerateCTest(AllSema):
    CannotVerify = []
    for i, v in AllSema.items():
        tps = [vv.type for vv in v.params]
        try:
            if len(tps) == 1:
                assert tps[0] in VecTypes
                assert v.rettype in VecTypes
                print(f"Test1A({i}, {tps[0]}, {v.rettype});")
            elif len(tps) == 2:
                assert tps[0] in VecTypes
                assert tps[1] in VecTypes
                assert v.rettype in VecTypes
                print(
                    f"Test2A({i}, {tps[0]}, {tps[1]}, {v.rettype});")
            elif len(tps) == 3:
                assert tps[0] in VecTypes
                assert tps[1] in VecTypes
                assert tps[2] in VecTypes
                assert v.rettype in VecTypes
                print(
                    f"Test3A({i}, {tps[0]}, {tps[1]}, {tps[2]}, {v.rettype});")
            else:
                assert False
        except AssertionError:
            CannotVerify.append(i)

    print("Cannot verify", CannotVerify, file=sys.stderr)


if __name__ == "__main__":
    AllSema = SemaGenerator(deserialize=True).getResult()
    GenerateCTest(AllSema)
