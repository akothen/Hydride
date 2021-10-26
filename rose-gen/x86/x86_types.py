import copy
from builtin_types import Builtin_Type
from builtin_types import Base_Type


def str_to_type(tname):
    lookup_tname = {
        "bit": Builtin_Type("", 1, False, False, Base_Type.BITS),
        "SI8": Builtin_Type("", 8, True, False, Base_Type.INT),
        "char": Builtin_Type("", 8, True, False, Base_Type.INT),
        "SI16": Builtin_Type("", 16, True, False, Base_Type.INT),
        "short": Builtin_Type("", 16, True, False, Base_Type.INT),
        "word": Builtin_Type("", 16, True, False, Base_Type.INT),
        "SI32": Builtin_Type("", 32, True, False, Base_Type.INT),
        "int": Builtin_Type("", 32, True, False, Base_Type.INT),
        "const int": Builtin_Type("", 32, True, False, Base_Type.INT),
        "SI64": Builtin_Type("", 64, True, False, Base_Type.INT),
        "__int64": Builtin_Type("", 64, True, False, Base_Type.INT),
        "UI8": Builtin_Type("", 8, False, False, Base_Type.INT),
        "byte": Builtin_Type("", 8, False, False, Base_Type.BITS),
        "UI16": Builtin_Type("", 16, False, False, Base_Type.INT),
        "unsigned short": Builtin_Type("", 16, False, False, Base_Type.INT),
        "UI32": Builtin_Type("", 32, False, False, Base_Type.INT),
        "unsigned int": Builtin_Type("", 32, False, False, Base_Type.INT),
        "UI64": Builtin_Type("", 64, False, False, Base_Type.INT),
        "unsigned __int64": Builtin_Type("", 64, False, False, Base_Type.INT),
        "unsigned long": Builtin_Type("", 64, False, False, Base_Type.INT),
        "FP32": Builtin_Type("", 32, True, False, Base_Type.FP),
        "FP64": Builtin_Type("", 64, True, False, Base_Type.FP),
        "dword": Builtin_Type("", 32, False, False, Base_Type.INT),
        "qword": Builtin_Type("", 64, False, False, Base_Type.INT),
        "__mmask8": Builtin_Type("", 8, False, False, Base_Type.BITS),
        "__mmask16": Builtin_Type("", 16, False, False, Base_Type.BITS),
        "__mmask32": Builtin_Type("", 32, False, False, Base_Type.BITS),
        "__mmask64": Builtin_Type("", 64, False, False, Base_Type.BITS),
        "MASK": Builtin_Type("", 64, False, False, Base_Type.BITS),
        "M128": Builtin_Type("", 128, False, True, Base_Type.BITS),
        "M256": Builtin_Type("", 256, False, True, Base_Type.BITS),
        "M512": Builtin_Type("", 512, False, True, Base_Type.BITS),
        "m128": Builtin_Type("", 128, False, True, Base_Type.BITS),
        "m256": Builtin_Type("", 256, False, True, Base_Type.BITS),
        "m512": Builtin_Type("", 512, False, True, Base_Type.BITS),
        "m128i": Builtin_Type("", 128, False, True, Base_Type.INT),
        "m256i": Builtin_Type("", 256, False, True, Base_Type.INT),
        "m512i": Builtin_Type("", 512, False, True, Base_Type.INT),
        "m128d": Builtin_Type("", 128, True, True, Base_Type.FP),
        "m256d": Builtin_Type("", 256, True, True, Base_Type.FP),
        "m512d": Builtin_Type("", 512, True, True, Base_Type.FP)
    }

    assert tname in lookup_tname, tname
    return copy.deepcopy(lookup_tname[tname])
