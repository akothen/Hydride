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
    scalar = re.compile("^([BDSHQXWrx])(\w)$")   # WTF is rn and xn
    vector = re.compile("^V(\w)\.(\d*)([DSHBQ])$")
    immediate1 = re.compile("^#(\w*)$")
    immediate2 = re.compile("^#\((\w*)<<(\w*)\)$")  # WTF
    immediate3 = re.compile("^(imm\d*)$")  # WTF
    pointer = re.compile("^\[(\w*)\]$")
    vector_lane = re.compile(
        "^[VD](\w)\.([DSHB])\[(\w*)\]$")  # WTF is Dd.D[0]
    regname = regname.strip()
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
