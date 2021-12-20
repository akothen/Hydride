from builtin_types import Builtin_Type
import builtin_types
from builtin_types import Base_Type
from build_rosette_types import Converter
import copy
from vprint import vprint, vvprint


def param_to_type(param, ele_t):
    lookup_type_size = {
        "__m64": 64,
        "__m128": 128,
        "__m128i": 128,
        "__m128d": 128,
        "__m256": 256,
        "__m256d": 256,
        "__m256i": 256,
        "__m512": 512,
        "__m512i": 512,
        "__m512d": 512
    }

    lookup_ele_t = {
        "SI8": Builtin_Type("", 8, True, False, Base_Type.INT),
        "char": Builtin_Type("", 8, True, False, Base_Type.INT),
        "SI16": Builtin_Type("", 16, True, False, Base_Type.INT),
        "short": Builtin_Type("", 16, True, False, Base_Type.INT),
        "SI32": Builtin_Type("", 32, True, False, Base_Type.INT),
        "int": Builtin_Type("", 32, True, False, Base_Type.INT),
        "const int": Builtin_Type("", 32, True, False, Base_Type.INT),
        "SI64": Builtin_Type("", 64, True, False, Base_Type.INT),
        "__int64": Builtin_Type("", 64, True, False, Base_Type.INT),
        "UI8": Builtin_Type("", 8, False, False, Base_Type.INT),
        "UI16": Builtin_Type("", 16, False, False, Base_Type.INT),
        "unsigned short": Builtin_Type("", 16, False, False, Base_Type.INT),
        "UI32": Builtin_Type("", 32, False, False, Base_Type.INT),
        "unsigned int": Builtin_Type("", 32, False, False, Base_Type.INT),
        "UI64": Builtin_Type("", 64, False, False, Base_Type.INT),
        "unsigned __int64": Builtin_Type("", 64, False, False, Base_Type.INT),
        "unsigned long": Builtin_Type("", 64, False, False, Base_Type.INT),
        "FP32": Builtin_Type("", 32, True, False, Base_Type.FP),
        "FP64": Builtin_Type("", 64, True, False, Base_Type.FP),
        "__mmask8": Builtin_Type("", 8, False, False, Base_Type.BITS),
        "__mmask16": Builtin_Type("", 16, False, False, Base_Type.BITS),
        "__mmask32": Builtin_Type("", 32, False, False, Base_Type.BITS),
        "__mmask64": Builtin_Type("", 64, False, False, Base_Type.BITS),
        "MASK": Builtin_Type("", 64, False, False, Base_Type.BITS),
        "M128": Builtin_Type("", 128, False, True, Base_Type.BITS),
        "M256": Builtin_Type("", 256, False, True, Base_Type.BITS),
        "M512": Builtin_Type("", 512, False, True, Base_Type.BITS)
    }

    name = param.name
    tname = param.type
    if bool(param.is_imm):
        if name == "imm8":
            return Builtin_Type(name, 8, True, False, Base_Type.ICONST)
        else:
            builtin_info = copy.deepcopy(lookup_ele_t[tname])
            builtin_info.name = name
            builtin_info.base_type = Base_Type.ICONST
            return builtin_info

    # non vector builtin type
    if tname in lookup_ele_t:
        builtin_info = copy.deepcopy(lookup_ele_t[tname])
        builtin_info.name = name
        return builtin_info

    assert tname in lookup_type_size, "Unknown type: {}".format(param)
    assert ele_t in lookup_ele_t, "Unknown ele type: {}".format(ele_t)

    inner_T = copy.deepcopy(lookup_ele_t[ele_t])
    inner_T.name = name + "-inner"
    builtin_info = Builtin_Type(name, lookup_type_size[tname], inner_T.signed,
                                True, Base_Type.VEC_OF)
    builtin_info.inner_T = inner_T
    return builtin_info


class x86_CVT():
    def __init__(self, spec):
        self.spec = spec

        self.intrin_name = spec.intrin
        self.params = spec.params
        self.definition = spec.spec
        self.rettype = spec.rettype
        self.ele_t = spec.elem_type

    def error_msg(self):
        return "{}\n\n{}".format(self.intrin_name, self.definition)

    def cvt_all(self):
        init_func_list = [
            Builtin_Type("FP32", 32, True, False, Base_Type.FP),
            Builtin_Type("FP64", 64, True, False, Base_Type.FP),
            Builtin_Type("SignExtend32", 32, True, False, Base_Type.INT),
            Builtin_Type("ZeroExtend16", 16, True, False, Base_Type.INT),
            Builtin_Type("Signed", 0, None, None, Base_Type.UNKNOWN),
            builtin_types.Builtin_Type_Empty("MIN"),
            builtin_types.Builtin_Type_Empty("MAX")
        ]
        init_param_list = []
        for param in self.params:
            init_param_list.append(param_to_type(param, self.ele_t))

        converter = Converter(init_func_list, init_param_list,
                              self.intrin_name)

        for spec in self.definition:
            converter.cvt_spec(spec)
            
        return converter.to_str()
