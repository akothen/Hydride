from enum import Enum
import print_rosette
import copy


class Base_Type(Enum):
    BITS = 0
    INT = 1
    ICONST = 3
    FP = 2
    UNKNOWN = 4


class Builtin_Type():
    def __init__(self, name, size, signed, vec, base_type):
        self.name = name
        self.size = size
        self.signed = signed
        self.vec = vec
        self.base_type = base_type

    def to_str(self):
        return self.name

    def is_vec(self):
        return self.vec

    def get_size(self):
        return self.size

    def is_signed(self):
        return self.signed

    def bit_based(self):
        return self.base_type == Base_Type.BITS or self.base_type == Base_Type.UNKNOWN or self.vec

    def int_based(self):
        return self.base_type == Base_Type.INT or self.base_type == Base_Type.ICONST or self.base_type == Base_Type.UNKNOWN

    def fp_based(self):
        return self.base_type == Base_Type.FP or self.base_type == Base_Type.UNKNOWN

    def is_unknown(self):
        return self.base_type == Base_Type.UNKNOWN

    def is_iconst(self):
        return self.base_type == Base_Type.ICONST or self.base_type == Base_Type.UNKNOWN

    def get_value(self):
        return self.name

    def dump(self):
        return "Name: {}\nSize: {}\nSign: {}\nBase: {}\nVec : {}\n".format(
            self.name, self.size, self.signed, self.base_type, self.vec)


def lct(a, b):
    assert compatible(a, b)
    if a.base_type.value < b.base_type.value:
        return a
    return b


def compatible(a, b):
    if a.base_type == b.base_type and a.vec == b.vec:
        return not a.is_unknown()
    if (a.int_based() or b.bit_based()) and (b.int_based() or b.bit_based()):
        return True
    if a.fp_based() and b.fp_based():
        return True
    if a.is_unknown() or b.is_unknown():
        return True
    return False


def Builtin_Type_Empty():
    return Builtin_Type(None, None, None, False, Base_Type.UNKNOWN)


class Rosette_Stmt():
    def __init__(self, val, builtin_type):
        self.val = val
        self.builtin_type = builtin_type

    def to_str(self):
        return self.val

    def get_type_info(self):
        return self.builtin_type

    def set_type_info(self, builtin_type):
        self.builtin_type = builtin_type

    def dump(self):
        return "----------------\n{}\n----------------\n{}\n----------------\n".format(
            self.builtin_type.dump(), self.val)


def apply_to_str(stmts):
    out = []
    for stmt in stmts:
        out.append(stmt.to_str())
    return out


def get_rosette_op(op, builtin_type):
    lookup_bin_op = {
        "*": "bvmul",
        "+": "bvadd",
        "-": "bvsub",
        # Signed or unsigned
        "/": "bv{}div",
        "%": "bvsmod",
    }

    lookup_op = {"|": "OR"}
    if op in lookup_op:
        return lookup_op[op]

    return op


def build_bitslice(bv, hi, lo):
    assert bv.get_type_info().base_type != Base_Type.FP or bv.get_type_info(
    ).bit_based(), bv.get_type_info().dump()

    bv_t = bv.get_type_info()
    bv_t.vec = True

    print("--------------\nBitslice: \n{}\n -> \n{}\n----------------------".
          format(bv.get_type_info().dump(), bv_t.dump()))
    return Rosette_Stmt(
        print_rosette.print_bitslice(bv.to_str(), hi.to_str(), lo.to_str()),
        bv_t)


def build_var(name, type_info):
    type_info.name = name
    return Rosette_Stmt(name, type_info)


def build_number(val):
    return Rosette_Stmt(print_rosette.print_number(val),
                        Builtin_Type(str(val), 4, 1, False, Base_Type.ICONST))


def build_update(lhs, rhs):
    print("Update:\n{}\n\n{}\n".format(lhs.dump(), rhs.dump()))
    if lhs.get_type_info().base_type == Base_Type.UNKNOWN:
        lht_t = lhs.get_type_info()
        print("From: {}".format(lhs.get_type_info().dump()))
        lht_t.base_type = rhs.get_type_info().base_type
        print("Setting to: {}".format(rhs.get_type_info().base_type))
        print("To: {}".format(lhs.get_type_info().dump()))
    return Rosette_Stmt(print_rosette.print_update(lhs.to_str(), rhs.to_str()),
                        rhs.get_type_info())


def build_for(iterator, begin, end, incr, body):
    body_str = apply_to_str(body)
    return Rosette_Stmt(
        print_rosette.print_for(iterator.to_str(), begin.to_str(),
                                end.to_str(), incr, body_str),
        Builtin_Type_Empty())


def build_binaryexpr(op, a, b):
    assert compatible(a.get_type_info(),
                      b.get_type_info()), "\n{}\nvs\n{}\n".format(
                          a.dump(), b.dump())
    return Rosette_Stmt(
        print_rosette.print_binaryexpr(op, a.to_str(), b.to_str()),
        lct(a.get_type_info(), b.get_type_info()))


def build_unaryexpr(op, a):
    return Rosette_Stmt(print_rosette.print_unaryexpr(op, a.to_str()),
                        a.get_type_info())


def build_if(cond, then, otherwise):
    then_str = apply_to_str(then)
    otherwise_str = apply_to_str(otherwise)

    then_end = then[len(then) - 1]
    otherwise_end = otherwise[len(otherwise) - 1]

    assert compatible(
        then_end.get_type_info(),
        otherwise_end.get_type_info()), "\n{}\n vs \n{}\n".format(
            then_end.dump(), otherwise_end.dump())
    return Rosette_Stmt(
        print_rosette.print_if(cond.to_str(), then_str, otherwise_str),
        lct(then_end.get_type_info(), otherwise_end.get_type_info()))


def build_call(func, args, type_info):
    args_str = apply_to_str(args)
    return Rosette_Stmt(print_rosette.print_call(func, args_str), type_info)


def build_select(cond, then, otherwise):
    return build_if(cond, then, otherwise)


def build_case(val, stmts):
    stmts_str = apply_to_str(stmts)

    return Rosette_Stmt(
        print_rosette.print_select(val.to_str(), stmts_str.to_str()),
        stmts[len(stmts) - 1].get_type_info())


def build_match(val, cases):
    cases_str = apply_to_str(cases)

    out_t = cases[0].get_type_info()
    for i in range(1, len(cases)):
        out_t = lct(out_t, cases[i].get_type_info())

    return Rosette_Stmt(
        print_rosette.print_match(val.to_str(), cases_str.to_str()), out_t)


def build_funcdef(name, params, body):
    params_str = apply_to_str(params)
    body_str = apply_to_str(body)

    body_end_t = body[len(body) - 1].get_type_info()
    return Rosette_Stmt(
        print_rosette.print_funcdef(name.to_str(), params_str.to_str(),
                                    body_str.to_str()), body_end_t)


def build_return(val):
    return "{}".format(val)
