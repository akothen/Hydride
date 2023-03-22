from ARMParser import get_parser, preprocess
from ARMAST import *
from ARMTypes import data_bits_spec, parse_reg, parse_type, get_total_bits
import json
import re
I = None
OP = None


def get_instr(ID):
    global I, OP
    if I is None or OP is None:
        with open("intr.json", 'r') as fi:
            I = json.load(fi)
        with open("op.json", 'r') as fo:
            OP = json.load(fo)
    return InstrDesc(**I[ID])


def get_and_parse_instr(ID):
    instr = get_instr(ID)

    print(ID, instr.name, instr.base_instruction,
          instr.return_type["value"], instr.arguments, instr.Operation)
    if "lane" in instr.name:
        print("[Lane] not supported.")
        return instr, None
    # if any([instr.base_instruction.startswith(i) for i in ["ST", "LD", "TB", "ZIP", "UZP"]]):
    #     print("[ST/LD/TB/ZIP/UZP] not supported.")
    #     return instr, None
    # if any([instr.name.startswith(i) for i in ["vabdh"]]):
    #     print("[vabdh] not supported.")
    #     return instr, None
    if instr.Operation == "NeonOperationId_00015":
        print("[NeonOperationId_00015] not supported.")
        return instr, None
    parse_init(instr)
    prolog, epilog = parse_instr_attr(instr)
    Parser = get_parser()
    data = preprocess(prolog+OP[instr.Operation]+epilog)
    print(data)
    return instr, Parser.parse(data)


undefined_sym = set()


def walk_AST(Node):
    '''This form is denser than OOP would be.'''
    if isinstance(Node, Number):
        pass
    elif isinstance(Node, HexNumber):
        pass
    elif isinstance(Node, BitString):
        pass
    elif isinstance(Node, RegV):
        walk_AST(Node.idx)
    elif isinstance(Node, RegVpart):
        walk_AST(Node.idx)
        walk_AST(Node.part)
    elif isinstance(Node, Elem):
        walk_AST(Node.op)
        walk_AST(Node.cnt)
        walk_AST(Node.esize)
    elif isinstance(Node, BitIndex):
        walk_AST(Node.obj)
        for n in Node.idxs:
            walk_AST(n)
    elif isinstance(Node, Var):
        if Node.name not in defined_sym:
            undefined_sym.add(Node.name)
    elif isinstance(Node, BitType):
        walk_AST(Node.size)
    elif isinstance(Node, SimpleType):
        pass
    elif isinstance(Node, VarDecl):
        walk_AST(Node.type)
        for decls in Node.obj:
            defined_sym[decls.name] = None
            walk_AST(decls)
    elif isinstance(Node, VarDeclDef):
        defined_sym[Node.obj.name] = None
        walk_AST(Node.type)
        walk_AST(Node.obj)
        walk_AST(Node.defi)
    elif isinstance(Node, For):
        defined_sym[Node.iterator.name] = None
        walk_AST(Node.iterator)
        walk_AST(Node.begin)
        walk_AST(Node.end)
        walk_AST(Node.body)
    elif isinstance(Node, IfElse):
        walk_AST(Node.cond)
        walk_AST(Node.then)
        walk_AST(Node.otherwise)
    elif isinstance(Node, IfElseExpr):
        walk_AST(Node.cond)
        walk_AST(Node.then)
        walk_AST(Node.otherwise)
    elif isinstance(Node, If):
        walk_AST(Node.cond)
        walk_AST(Node.then)
    elif isinstance(Node, Call):
        walk_AST(Node.funcname)
        for a in Node.args:
            walk_AST(a)
    elif isinstance(Node, BinaryExpr):
        walk_AST(Node.a)
        walk_AST(Node.b)
    elif isinstance(Node, UnaryExpr):
        walk_AST(Node.a)
    elif isinstance(Node, AssignExpr):
        walk_AST(Node.lhs)
        walk_AST(Node.rhs)
    elif isinstance(Node, PairAssignExpr):
        walk_AST(Node.lhs[0])
        if Node.lhs[1] is not None:
            walk_AST(Node.lhs[1])
        walk_AST(Node.rhs)
    elif isinstance(Node, ConcatAssignExpr):
        walk_AST(Node.lhs[0])
        walk_AST(Node.lhs[1])
        walk_AST(Node.rhs)
    elif isinstance(Node, FieldExpr):
        walk_AST(Node.obj)
    elif isinstance(Node, CompoundStmt):
        for stmt in Node.stmts:
            walk_AST(stmt)
    elif isinstance(Node, ReturnStmt):
        walk_AST(Node.ret)
    elif isinstance(Node, WhenStmt):
        assert False, "Not implement"  # TODO: implement the AST visitor
    elif isinstance(Node, Case):
        assert False, "Not implement"  # TODO: implement the AST visitor
        # Also update to walk sample
    else:
        print(Node)
        assert False, "Not a AST node"


def parse_instr_attr(instr: InstrDesc):
    # Note: Modified Vm.4S[imm2] to Vm.S[imm2] in intr.json

    # - Parse Arguments_Preparation like:
    # - {"a": {"register": "Vn.8B"}, "b": {"register": "Vm.8B"}}
    # It gives prolog:
    # V[n]=a;
    # V[m]=b;
    # And also records
    # a: bits(64)
    # b: bits(64)
    global defined_sym
    prolog = ""
    parsed_input_reg = []
    for a, reg in instr.Arguments_Preparation.items():
        if len(reg) == 1:
            assert list(reg.keys())[0] == "register"
            reg = parse_reg(list(reg.values())[0])
            parsed_input_reg.append(reg)

            prolog += f"V[{reg.idx}] = {a};\n"
            defined_sym[a] = TypedVar(BitType(get_total_bits(reg), 0), a, 0)
            defined_sym[reg.idx] = None
        else:
            assert "minimum" in reg and "maximum" in reg
            # not a reg

    # - Parse results: [{"Vd.8B": "result"}]
    # It gives epilog:
    # return V[d];
    assert len(instr.results) == 1
    assert len(instr.results[0]) == 1
    if "void" in instr.results[0]:
        epilog = ""
    else:
        reg = parse_reg(list(instr.results[0].keys())[0])
        parsed_result_reg = reg

        epilog = f"\nreturn V[{reg.idx}];"
        defined_sym[reg.idx] = None

    # - Parse input type: ["int8x8_t a", "int8x8_t b"]
    parsed_input_type = []
    for arg in instr.arguments:
        assert arg.split()[-1] in defined_sym
        arg = parse_type(' '.join(arg.split()[:-1]))
        parsed_input_type.append(arg)

    # - Parse return type:
    # - {"return_base_type": "int", "element_bit_size": "8", "value": "int8x8_t"}
    parsed_return_type = parse_type(instr.return_type["value"])
    esize = int(instr.return_type["element_bit_size"])

    # - Sanity check
    # print(parsed_regs, parsed_types)
    assert(len(parsed_input_reg) == len(parsed_input_type))
    for preg in parsed_input_reg:
        if isinstance(preg, VectorReg) and preg.elements != 1:
            assert(f"{preg.elements}{preg.bitspec}" in {
                "8B", "16B",  "4H", "8H", "2S", "4S", "2D"})  # WTF is Vn.2H
    for typ in parsed_input_type+[parsed_return_type]:
        assert(typ.basetype in {"int", "uint",
               "float", "bfloat", "poly", "const int"})
    allregs = parsed_input_reg+[parsed_result_reg]
    datasize = min(get_total_bits(reg) for reg in allregs)

    for regname, typ in zip(parsed_input_reg, parsed_input_type):
        assert(regname.elements == typ.num)
        assert(data_bits_spec[regname.bitspec] == typ.bits)
    assert (len(set(reg.elements for reg in allregs))
            == 1) != ("high" in instr.name)
    elements = parsed_result_reg.elements

    # - Parse flags
    def sub_op_func(instr: InstrDesc):
        options = {"add": False,
                   "sub": True}
        for k, v in options.items():
            if k in instr.name:
                return v  # ?
        return None

    def pair_func(instr: InstrDesc):
        return instr.name.startswith("vp")  # ?

    def unsigned_func(instr: InstrDesc):
        return instr.base_instruction.startswith("U")  # ?

    def part_func(instr: InstrDesc):
        return "high" in instr.name  # ?

    def round_func(instr: InstrDesc):
        return instr.name.startswith("vr")  # ?

    def rounding_func(instr: InstrDesc):
        return instr.name.startswith("vqr")  # ?

    def poly_func(instr: InstrDesc):
        return instr.name.split("_")[-1].startswith("p")  # ?

    def op1_neg_func(instr: InstrDesc):
        return instr.name.startswith("vfms")  # ?

    def opa_neg_func(instr: InstrDesc):
        return "_n_" in instr.name  # ?

    def abs_func(instr: InstrDesc):
        return False

    def and_test_func(instr: InstrDesc):
        return instr.name.startswith("vtst")
    flags = {
        "sub_op",
        "pair",
        "unsigned",
        "part",
        "round",
        "poly",
        "opa_neg",
        "op1_neg",
        "rounding",
        "abs",
        "and_test",
    }
    cur_flag = {}
    for flag in flags:
        cur_flag[flag] = locals()[flag+"_func"](instr)

    # - resolve unknown vars
    resolved = dict(esize=Number(esize),
                    datasize=Number(datasize),
                    elements=Number(elements),
                    **cur_flag)
    print(resolved)
    defined_sym = dict(defined_sym, **resolved)
    return prolog, epilog


def parse_init(instr):
    global defined_sym
    defined_sym = {"FPSR": None, "FPCR": None,
                   "FPAdd": None,
                   "FPSub": None,
                   "FPMul": None,
                   "FPDiv": None,
                   "FPNeg": None,
                   "FPMulAdd": None,
                   "FPMulX": None,
                   "FPAbs": None,
                   "PolynomialMult": None,
                   "CheckFPAdvSIMDEnabled64": None,
                   "Int": None,
                   "UInt": None,
                   "SInt": None,
                   "Ones": None,
                   "Zeros": None,
                   "SatQ": None,
                   "SignedSatQ": None,
                   "IsMerging": None,
                   "IsZero": None,
                   }
    undefined_sym.clear()


def get_sema(ID):
    instr, op = get_and_parse_instr(ID)
    if op is None:
        return
    walk_AST(CompoundStmt(op, -1))
    print(undefined_sym)
    assert len(undefined_sym) == 0


if __name__ == "__main__":
    # test_parse_operation()
    allll = 4344
    for i in range(1000):
        get_sema(i)
    # get_sema(22)
    # for i in range(allll):
    #     instr = get_instr(i)
    #     if "add" in instr.name:
    #         prototype = instr.return_type["value"]+" " + \
    #             instr.name+f"({', '.join(instr.arguments)})"
    #         print(instr.base_instruction, "<-", prototype)


def walk_AST_sample(Node):
    if isinstance(Node, Number):
        pass
    elif isinstance(Node, HexNumber):
        pass
    elif isinstance(Node, BitString):
        pass
    elif isinstance(Node, RegV):
        walk_AST(Node.idx)
    elif isinstance(Node, RegVpart):
        walk_AST(Node.idx)
        walk_AST(Node.part)
    elif isinstance(Node, Elem):
        walk_AST(Node.op)
        walk_AST(Node.cnt)
        walk_AST(Node.esize)
    elif isinstance(Node, BitIndex):
        walk_AST(Node.obj)
        for n in Node.idxs:
            walk_AST(n)
    elif isinstance(Node, Var):
        pass
    elif isinstance(Node, BitType):
        walk_AST(Node.size)
    elif isinstance(Node, VarDecl):
        walk_AST(Node.type)
        for decls in Node.obj:
            walk_AST(decls)
    elif isinstance(Node, VarDeclDef):
        walk_AST(Node.type)
        walk_AST(Node.obj)
        walk_AST(Node.defi)
    elif isinstance(Node, For):
        walk_AST(Node.iterator)
        walk_AST(Node.begin)
        walk_AST(Node.end)
        walk_AST(Node.body)
    elif isinstance(Node, IfElse):
        walk_AST(Node.cond)
        walk_AST(Node.then)
        walk_AST(Node.otherwise)
    elif isinstance(Node, IfElseExpr):
        walk_AST(Node.cond)
        walk_AST(Node.then)
        walk_AST(Node.otherwise)
    elif isinstance(Node, If):
        walk_AST(Node.cond)
        walk_AST(Node.then)
    elif isinstance(Node, Call):
        for a in Node.args:
            walk_AST(a)
    elif isinstance(Node, BinaryExpr):
        walk_AST(Node.a)
        walk_AST(Node.b)
    elif isinstance(Node, UnaryExpr):
        walk_AST(Node.a)
    elif isinstance(Node, AssignExpr):
        walk_AST(Node.lhs)
        walk_AST(Node.rhs)
    elif isinstance(Node, PairAssignExpr):
        walk_AST(Node.lhs[0])
        if Node.lhs[1] is not None:
            walk_AST(Node.lhs[1])
        walk_AST(Node.rhs)
    elif isinstance(Node, ConcatAssignExpr):
        walk_AST(Node.lhs[0])
        walk_AST(Node.lhs[1])
        walk_AST(Node.rhs)
    elif isinstance(Node, FieldExpr):
        walk_AST(Node.obj)
    elif isinstance(Node, CompoundStmt):
        for stmt in Node.stmts:
            walk_AST(stmt)
    elif isinstance(Node, WhenStmt):
        assert False, "Not implement"
    elif isinstance(Node, Case):
        assert False, "Not implement"
    else:
        print(Node)
        assert False, "Not a AST node"
