from ARMParser import get_parser, preprocess
from ARMAST import *
from ARMTypes import data_bits_spec
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
    instr = InstrDesc(**I[ID])
    Parser = get_parser()
    data = preprocess(OP[instr.Operation])
    return instr, None if instr.Operation == "NeonOperationId_00015" else Parser.parse(data)


defined_sym = {"FPSR": None, "FPCR": None}
undefined_sym = set()


def walk_AST(Node):
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


def parse_instr_attr(instr: InstrDesc):
    regs = instr.operands.split(",")
    # print(regs)
    # Modified Vm.4S[imm2] to Vm.S[imm2]
    scalar = re.compile("^([BDSHQXWrx])(\w)$")   # WTF is rn and xn
    vector = re.compile("^V(\w)\.(\d*)([DSHBQ])$")
    immediate1 = re.compile("^#(\w*)$")
    immediate2 = re.compile("^#\((\w*)<<(\w*)\)$")  # WTF
    immediate3 = re.compile("^(imm\d*)$")  # WTF
    pointer = re.compile("^\[(\w*)\]$")
    vector_lane = re.compile("^[VD](\w)\.([DSHB])\[(\w*)\]$")  # WTF is Dd.D[0]
    parsed_regs = []
    for reg in regs:
        reg = reg.strip()
        if m := scalar.match(reg):
            newreg = VectorReg(m.group(2), 1, m.group(1))
            parsed_regs.append(newreg)
        elif m := vector.match(reg):
            newreg = VectorReg(m.group(1), int(m.group(2)), m.group(3))
            parsed_regs.append(newreg)
        elif m := vector_lane.match(reg):
            newreg = VectorRegLane(m.group(1), m.group(3), m.group(2))
            parsed_regs.append(newreg)
        elif m := immediate1.match(reg):
            newreg = m.group(1)
        elif m := immediate2.match(reg):
            newreg = m.group(1)
            newreg = m.group(2)
            # TODO
        elif m := immediate3.match(reg):
            newreg = m.group(1)
        elif m := pointer.match(reg):
            newreg = m.group(1)
        else:
            assert(False)
    argtypes = [instr.return_type["value"]]+[' '.join(i.split()[:-1])
                                             for i in instr.arguments]
    parsed_types = []
    scalar = re.compile("^(\D*)(\d*)_t$")
    vector = re.compile("^(\D*)(\d*)x(\d*)_t$")
    for argtype in argtypes:
        if m := scalar.match(argtype):
            newargtype = CType(m.group(1), int(m.group(2)), 1)
        elif m := vector.match(argtype):
            newargtype = CType(m.group(1), int(m.group(2)), int(m.group(3)))
        elif argtype == "const int":
            newargtype = CType("const int", 32, 1)
        else:
            assert(False)
        parsed_types.append(newargtype)
    # Sanity check
    print(parsed_regs, parsed_types)
    # assert(len(parsed_regs) == len(parsed_types))
    for reg in parsed_regs:
        if isinstance(reg, VectorReg) and reg.elements != 1:
            assert(f"{reg.elements}{reg.bitspec}" in {
                "8B", "16B", "2H", "4H", "8H", "2S", "4S", "2D"})  # WTF is Vn.2H
    for typ in parsed_types:
        assert(typ.basetype in {"int", "uint",
               "float", "bfloat", "poly", "const int"})
    # for reg, typ in zip(parsed_regs, parsed_types):
    #     assert(reg.elements == typ.num)
    #     assert(data_bits_spec[reg.bitspec] == typ.bits)

    # if len(set(i.basetype for i in parsed_types)) != 1:
    #     print(parsed_regs, parsed_types)
    # Parse flags

    # TODO:defined sym


def parse_init(instr):
    global defined_sym
    defined_sym = {"FPSR": None, "FPCR": None}
    parse_instr_attr(instr)
    undefined_sym.clear()


def get_sema(ID):
    instr, op = get_instr(ID)
    print(ID, instr.name, instr.base_instruction, undefined_sym,
          instr.return_type["value"], instr.arguments, instr.Operation)
    if "lane" in instr.name:
        print("[Lane] not supported.")
        return
    if any([instr.base_instruction.startswith(i) for i in ["ST", "LD", "TB", "ZIP", "UZP"]]):
        print("[ST/LD/TB/ZIP/UZP] not supported.")
        return
    if any([instr.name.startswith(i) for i in ["vabdh"]]):
        print("[vabdh] not supported.")
        return
    if instr.Operation == "NeonOperationId_00015":
        print("[NeonOperationId_00015] not supported.")
        return
    parse_init(instr)
    # walk_AST(CompoundStmt(op, -1))


if __name__ == "__main__":
    # test_parse_operation()
    allll = 4344
    for i in range(allll):
        get_sema(i)
    # get_sema(22)


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
