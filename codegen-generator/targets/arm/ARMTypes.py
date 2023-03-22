from ARMAST import CType, VectorReg, VectorRegLane
import re
# ctype_suffix = {
#     "8x8_t":(8,8)
#     "8x16_t":(8,16)
#     "16x4_t"
#     "16x8_t"
#     "32x2_t"
#     "32x4_t"
#     "64x1_t"
#     "64x2_t"
# }
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
    if m := scalar.match(regname):
        return VectorReg(m.group(2), 1, m.group(1))
    elif m := vector.match(regname):
        return VectorReg(m.group(1), int(m.group(2)), m.group(3))
    elif m := vector_lane.match(regname):
        assert False, "Not implemented"
        newreg = VectorRegLane(m.group(1), m.group(3), m.group(2))
        parsed_regs.append(newreg)
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
    elif typename == "const int":
        return CType("const int", 32, 1)
    else:
        assert(False)


def get_total_bits(typed_reg):
    if isinstance(typed_reg, VectorReg):
        return data_bits_spec[typed_reg.bitspec]*typed_reg.elements
    assert False


# def get_equiv_type(tb -> int):
#     return BitType(tb, 0)
