import re
from collections import namedtuple

C2ARMType = {
    "8x8": "8B",
    "8x16": "16B",
    "16x4": "4H",
    "16x8": "8H",
    "32x2": "2S",
    "32x4": "4S",
    "64x1": "1D",
    "64x2": "2D",
}

ARMSema = namedtuple('ARMSema', [
    'intrin', 'inst', 'params',
    'spec', 'rettype', 'ret_is_signed',
    'inst_form',
    'extensions',
    'imm_width',
    'xed',
    'elem_type',
    'preparation',
    'resolving',
])
Parameter = namedtuple(
    'Parameter', ['name', 'type', 'is_signed', 'is_imm', 'is_mask'])

# For intrinsic sorting

InstrDesc = namedtuple(
    "InstrDesc", ["name", "return_type", "arguments", "results",
                  "Arguments_Preparation", "Operation", "base_instruction", "operands", "instruction_group"]
)

VectorReg = namedtuple("VecReg", ["idx", "elements", "bitspec"])
VectorRegLane = namedtuple(
    "VecRegLane", ["idx", "elements", "bitspec", "lane", ])
CType = namedtuple("CType", ["basetype", "bits", "num"])

data_bits_spec = {
    "B": 8,
    "H": 16,
    "S": 32,
    "D": 64,
    "Q": 128,
}


def parse_reg(regname):
    scalar = re.compile("^([BDSHQXWrxR])(\w)$")   # WTF is rn and xn
    vector = re.compile("^V(\w)\.(\d*)([DSHBQ])$")
    immediate1 = re.compile("^#(\w*)$")
    immediate2 = re.compile("^#\((\w*)<<(\w*)\)$")  # WTF
    immediate3 = re.compile("^(imm\d*)$")  # WTF
    pointer = re.compile("^\[(\w*)\]$")
    vector_lane = re.compile(
        "^[VD](\w)\.([DSHB])\[(\w*)\]$")  # WTF is Dd.D[0]
    regname = regname.strip()
    if regname == "UNUSED":
        return None
    special_handling = {"32(Vd)": "Vd.2S"}
    if regname in special_handling:
        regname = special_handling[regname]
    if m := scalar.match(regname):
        return VectorReg(m.group(2), 1, m.group(1))
    elif m := vector.match(regname):
        return VectorReg(m.group(1), int(m.group(2)), m.group(3))
    elif m := vector_lane.match(regname):
        return VectorRegLane(m.group(1), 0, m.group(3), m.group(2))  # TODO:0?
    elif m := immediate1.match(regname):
        assert False, "Not implemented"
        newreg = m.group(1)
        # TODO: add them to somewhere
    elif m := immediate2.match(regname):
        assert False, "Not implemented"
        newreg = m.group(1)
        newreg = m.group(2)
        # TODO: add them to somewhere
    elif m := immediate3.match(regname):
        assert False, "Not implemented"
        newreg = m.group(1)
        # TODO: add them to somewhere
    elif m := pointer.match(regname):
        assert False, "Not implemented"
        newreg = m.group(1)
        # TODO: add them to somewhere
    else:
        print(regname)
        assert False, "Not implemented"


def parse_type(typename):
    scalar = re.compile("^(\D*)(\d*)_t$")
    vector = re.compile("^(\D*)(\d*)x(\d*)_t$")
    if m := scalar.match(typename):
        return CType(m.group(1), int(m.group(2)), 1)
    elif m := vector.match(typename):
        return CType(m.group(1), int(m.group(2)), int(m.group(3)))
    # elif typename == "const int":
    #     return SimpleType("const int")
    else:
        assert(False)


def get_total_bits(typed_reg):
    if isinstance(typed_reg, VectorReg):
        return data_bits_spec[typed_reg.bitspec]*typed_reg.elements
    if isinstance(typed_reg, VectorRegLane):
        return data_bits_spec[typed_reg.bitspec]*typed_reg.elements
    assert False


ARMGlobalConst = {"FALSE": False,
                  "TRUE": True,
                  "MemOp_LOAD": 0,
                  "MemOp_STORE": 1,
                  "MemOp_PREFETCH": 2,
                  "CountOp_CLZ": 0,
                  "CountOp_CLS": 1,
                  "CountOp_CNT": 2,
                  "LogicalOp_AND": 0,
                  "LogicalOp_EOR": 1,
                  "LogicalOp_ORR": 2,
                  "CompareOp_GT": 0,
                  "CompareOp_GE": 1,
                  "CompareOp_EQ": 2,
                  "CompareOp_LE": 3,
                  "CompareOp_LT": 4,
                  "VBitOp_VBIF": 0,
                  "VBitOp_VBIT": 1,
                  "VBitOp_VBSL": 2,
                  "VBitOp_VEOR": 3,
                  "ReduceOp_FMINNUM": 0,
                  "ReduceOp_FMAXNUM": 1,
                  "ReduceOp_FMIN": 2,
                  "ReduceOp_FMAX": 3,
                  "ReduceOp_FADD": 4,
                  "ReduceOp_ADD": 5}
ARMGlobalConstSTR = {
    "FALSE": False,
    "TRUE": True,
    "MemOp_LOAD": "00",
    "MemOp_STORE": "01",
    "MemOp_PREFETCH": "10",
    "CountOp_CLZ": "00",
    "CountOp_CLS": "01",
    "CountOp_CNT": "10",
    "LogicalOp_AND": "00",
    "LogicalOp_EOR": "01",
    "LogicalOp_ORR": "10",
    "CompareOp_GT": "000",
    "CompareOp_GE": "001",
    "CompareOp_EQ": "010",
    "CompareOp_LE": "011",
    "CompareOp_LT": "100",
    "VBitOp_VBIF": "00",
    "VBitOp_VBIT": "01",
    "VBitOp_VBSL": "10",
    "VBitOp_VEOR": "11",
    "ReduceOp_FMINNUM": "000",
    "ReduceOp_FMAXNUM": "001",
    "ReduceOp_FMIN": "010",
    "ReduceOp_FMAX": "011",
    "ReduceOp_FADD": "100",
    "ReduceOp_ADD": "101"
}
ReservedImmTypes = {
    "const int"
}
PointerType = {
    "int8_t const *",
    "int16_t const *",
    "int32_t const *",
    "int64_t const *",
    "uint8_t const *",
    "uint16_t const *",
    "uint32_t const *",
    "uint64_t const *",
    "int8_t *",
    "int16_t *",
    "int32_t *",
    "int64_t *",
    "uint8_t *",
    "uint16_t *",
    "uint32_t *",
    "uint64_t *",
}
ReservedVecTypes = {
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


def HighestSetBit(x: str):
    N = len(x)
    for i in range(N-1, -1, -1):
        if x[N-i-1] == '1':
            return i
    return -1


def LowestSetBit(x: str):
    N = len(x)
    for i in range(N):
        if x[N-i-1] == '1':
            return i
    return N


def ASLArrayIndex(x: str, idx: int, width: int):
    assert len(x) == width
    return x[width-idx-1]


def ASLArraySlice(x: str, hi: int, lo: int, width: int):
    assert len(x) == width
    return x[width-hi-1:width-lo]


def UInt(x: str):
    return int(x, 2)


def maskeq(f, mask):
    assert len(f) == len(mask)
    for i, j in zip(mask, f):
        if i != 'x' and i != j:
            return False
    return True


def get_arg_lo_hi(v):
    if "minimum" in v:
        assert "maximum" in v
        return (int(v["minimum"]), int(v["maximum"]))


def expand_instr(instr: InstrDesc):
    # - "Arguments_Preparation": {"a": {"register": "Vn.2S"}, "v": {"register": "Vm.2S"}, "lane": {"minimum": "0", "maximum": "1"}}
    expansion = [instr.name]
    for k, v in instr.Arguments_Preparation.items():
        if "minimum" in v:
            assert "maximum" in v
            # print(instr.name, k, v["minimum"], v["maximum"])
            exp = []
            lo, hi = get_arg_lo_hi(v)
            for i in range(lo, hi+1):
                assert "__" not in instr.name
                for j in expansion:
                    exp.append(f"{j}__{k}_{i}")
            expansion = exp
    return expansion


def extract_assignment_from_name(instrName: str):
    intrinsicname_assignment_list = instrName.split("__")
    assignment = {}
    for a in intrinsicname_assignment_list[1:]:
        i = a.split("_")
        assignment[i[0]] = int(i[1])
    return intrinsicname_assignment_list[0], assignment


PUT0_LANE_N_ELEM_DIFF = ["SMLAL", "UMLAL", "SMLSL", "UMLSL", "SQDMLAL",
                         "UQDMLAL", "SQDMLSL", "UQDMLSL", "SMULL", "UMULL", "SQDMULL", "UQDMULL"]
PUT0_LANE_N_ELEM_SAME = ["MLS", "MUL", "MLA",
                         "SQDMULH", "SDOT", "UDOT", "SQRDMLSH", "SQRDMLAH", "SQRDMULH"]
