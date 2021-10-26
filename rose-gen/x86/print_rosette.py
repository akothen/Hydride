def print_bitslice(bv, hi, lo):
    return "(extract {} {} {})".format(hi, lo, bv)


def print_var(name):
    return name


def print_number(val):
    return val


def print_sliced_update(lhs, rhs):
    return "(concat {} {})".format(lhs, rhs)


def print_update(lhs, rhs):
    return "(define {} {})".format(lhs, rhs)


def print_for(iterator, begin, end, incr, body):
    return "(for/list ([{} (in-range {} {} {})]) {})".format(
        iterator, begin, end, incr, body)


def print_while(cond, body):
    return "(while ({}) {})".format(cond, body)


def print_int_binaryexpr(op, a, b):
    lookup_int_op = {
        "AND": "bitwise-and",
        "&": "bitwise-and",
        "OR": "bitwise-or",
        "|": "bitwise-or",
        "XOR": "bitwise-xor",
        "^": "bitwise-xor",
        "NOT": "bitwise-not",
        "~": "bitwise-not",
        "%": "modulo",
        "==": "=",
        "!=": "not =",
        "<": "<",
        ">": ">",
        "<=": "<=",
        ">=": ">=",
        "*": "*",
        "+": "+",
        "-": "-",
        "/": "/"
    }

    lookup_shift_op = {"<<": "arithmetic-shift", ">>": "arithmetic-shift"}

    assert op in lookup_int_op or op in lookup_shift_op, "Unknown int op: \"{}\"".format(
        op)

    if op in lookup_int_op:
        return "({} {} {})".format(lookup_int_op[op], a, b)
    else:
        if op == "<<":
            return "({} {} {})".format(lookup_shift_op[op], a, b)
        else:
            # Negate b for right shift
            return "({} {} (- 0 {}))".format(lookup_shift_op[op], a, b)


def print_bv_binaryexpr(op, a, b, signed):
    lookup_signed_bv_op = {
        ">": ["bv[SIGNED]gt", "s", "u"],
        ">=": ["bv[SIGNED]ge", "s", "u"],
        "<": ["bv[SIGNED]lt", "s", "u"],
        "<=": ["bv[SIGNED]le", "s", "u"],
        ">>": ["bv[SIGNED]shr", "a", "l"],
        "/": ["bv[SIGNED]div", "s", "u"]
    }

    lookup_bv_op = {
        "AND": "bvand",
        "&": "bvand",
        "<<": "bvshl",
        "OR": "bvor",
        "|": "bvor",
        "XOR": "bvxor",
        "^": "bvxor",
        "==": "bveq",
        "!=": "not bveq",
        "*": "bvmul",
        "+": "bvadd",
        "-": "bvsub",
        # Signed or unsigned
        "%": "bvsmod",
    }
    assert op in lookup_bv_op or op in lookup_signed_bv_op, "Unknown bv op: \"{}\"".format(
        op)

    bv_op = None
    if op in lookup_bv_op:
        bv_op = lookup_bv_op[op]
    else:
        bv_op_info = lookup_signed_bv_op[op]
        bv_op = bv_op_info[0]
        sign_replace = bv_op_info[1]
        if not signed:
            sign_replace = bv_op_info[2]
        bv_op = bv_op.replace("[SIGNED]", sign_replace)
    return "({} {} {})".format(bv_op, a, b)


def print_fp_binaryexpr(op, a, b):
    lookup_fp_op = {
        "AND": "fpand",
        "OR": "fpor",
        "XOR": "fpxor",
        "==": "fpeq",
        "<": "fplt",
        "<=": "fple",
        ">": "fpgt",
        ">=": "fpge",
        "!=": "fpne",
        "*": "fpmul",
        "+": "fpadd",
        "-": "fpsub",
        # Signed or unsigned
        "/": "fpsdiv",
        "%": "fpsmod",
    }
    assert op in lookup_fp_op, "Unknown fp op: \"{}\"".format(op)
    fp_op = lookup_fp_op[op]
    return "({} {} {})".format(fp_op, a, b)


def print_int_unaryexpr(op, a):
    lookup_int_op = {
        "NOT": "bitwise-not",
        "~": "bitwise-not",
    }

    lookup_neg_op = {"NEG": True, "-": True}
    assert op in lookup_int_op or op in lookup_neg_op, "Unknown unary op: \"{}\"".format(
        op)
    if op in lookup_int_op:
        return "({} {})".format(lookup_int_op[op], a)
    else:
        return "(- 0 {})".format(a)


def print_bv_unaryexpr(op, a):
    lookup_bv_op = {"NOT": "bvnot", "~": "bvnot", "NEG": "bvneg", "-": "bvneg"}
    assert op in lookup_bv_op, "Unknown unary op: \"{}\"".format(op)

    return "({} {})".format(lookup_bv_op[op], a)


def print_fp_unaryexpr(op, a):
    lookup_fp_op = {"NOT": "fpnot", "~": "fpnot", "NEG": "fpneg", "-": "fpneg"}
    assert op in lookup_fp_op, "Unknown unary op: \"{}\"".format(op)
    return "({} {})".format(lookup_fp_op[op], a)


def print_if(cond, then, otherwise):
    return "(if ({}) {} {})".format(cond, then, otherwise)


def print_call(func, args):
    return "({} {})".format(func, args)


def print_select(cond, then, otherwise):
    return print_if(cond, then, otherwise)


def print_case(val, stmts):
    return "[({}) {}]".format(val, stmts)


def print_match(val, cases):
    return "(case ({}) {})".format(val, cases)


def print_funcdef(name, params, body):
    return "(define ({} {}){})".format(name, params, body)


def print_return(val):
    return "{}".format(val)
