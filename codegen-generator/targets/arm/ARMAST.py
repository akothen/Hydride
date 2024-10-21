import os
from collections import namedtuple
from typing import List, Tuple, Dict
from ARMTypes import ARMGlobalConst, asl_type_bits
import asl.ARMAST as asl

PARSER_ID_COUNTER = 0


def ResetUniqueID():
    global PARSER_ID_COUNTER
    PARSER_ID_COUNTER = 0


def GenUniqueID():
    global PARSER_ID_COUNTER
    ID = PARSER_ID_COUNTER
    PARSER_ID_COUNTER += 1
    return str(ID)


class ASTNode:
    pass


class ASTExpr(ASTNode):
    pass


class ASTStmt(ASTNode):
    pass


class Number(ASTExpr):
    val: int

    def __init__(self, val: int):
        self.val = val

    def __repr__(self):
        return f"Number({self.val.__repr__()})"

    def __eq__(self, other):
        if other.__class__ != Number:
            return False
        return self.val == other.val


class BitVec(ASTExpr):
    bv: str

    def __init__(self, bv: int):
        self.bv = bv

    def __repr__(self):
        return f"BitVec({self.bv.__repr__()})"


class SliceRange(ASTExpr):
    hi: ASTExpr
    lo: ASTExpr
    id: str
    wid: ASTExpr

    def __init__(self, hi: ASTExpr, lo: ASTExpr, id: str):
        self.lo, self.hi, self.id = lo, hi, id

    def __repr__(self):
        return f"SliceRange({self.hi.__repr__()}, {self.lo.__repr__()}, {self.id.__repr__()})"


class ArrayIndex(ASTExpr):
    obj: ASTExpr
    slices: List[ASTExpr]
    id: str

    def __init__(self, obj: ASTExpr, slices: List[ASTExpr], id: str):
        self.obj, self.slices, self.id = obj, slices, id

    def __repr__(self):
        return f"ArrayIndex({self.obj.__repr__()}, {self.slices.__repr__()}, {self.id.__repr__()})"


class ElemSlice(ASTExpr):
    op: ASTExpr
    cnt: ASTExpr
    esize: ASTExpr
    id: str

    def __init__(self, op: ASTExpr, cnt: ASTExpr, esize: ASTExpr, id: str):
        self.op, self.cnt, self.esize, self.id = op, cnt, esize, id

    def __repr__(self):
        return f"ElemSlice({self.op.__repr__()}, {self.cnt.__repr__()}, {self.esize.__repr__()}, {self.id.__repr__()})"


class VReg(ASTExpr):
    reg: ASTExpr
    id: str

    def __init__(self, reg: ASTExpr, id: str):
        self.reg, self.id = reg, id

    def __repr__(self):
        return f"VReg({self.reg.__repr__()}, {self.id.__repr__()})"


class VPartReg(ASTExpr):
    reg: ASTExpr
    part: ASTExpr
    id: str

    def __init__(self, reg: ASTExpr, part: ASTExpr, id: str):
        self.reg, self.part, self.id = reg, part, id

    def __repr__(self):
        return f"VPartReg({self.reg.__repr__()}, {self.part.__repr__()}, {self.id.__repr__()})"


class Var(ASTExpr):
    name: str
    id: str

    def __init__(self, name: str, id: str):
        self.name, self.id = name, id

    def __repr__(self):
        return f"Var({self.name.__repr__()}, {self.id.__repr__()})"


class Update(ASTStmt):
    lhs: ASTExpr
    rhs: ASTExpr

    def __init__(self, lhs: ASTExpr, rhs: ASTExpr):
        self.lhs, self.rhs = lhs, rhs

    def __repr__(self):
        return f"Update({self.lhs.__repr__()}, {self.rhs.__repr__()})"


class For(ASTStmt):
    iterator: Var
    begin: ASTExpr
    end: ASTExpr
    stmts: List[ASTStmt]
    inc: int
    id: str

    def __init__(self, iterator: Var, begin: ASTExpr, end: ASTExpr, stmts: List[ASTStmt], inc: int, id: str):
        self.iterator, self.begin, self.end, self.stmts, self.inc, self.id = iterator, begin, end, stmts, inc, id

    def __repr__(self):
        return f"For({self.iterator.__repr__()}, {self.begin.__repr__()}, {self.end.__repr__()}, {self.stmts.__repr__()}, {self.inc.__repr__()}, {self.id.__repr__()})"


class While(ASTStmt):
    cond: ASTExpr
    body: List[ASTStmt]
    id: str

    def __init__(self, cond: ASTExpr, body: List[ASTStmt], id: str):
        self.cond, self.body, self.id = cond, body, id

    def __repr__(self):
        return f"While({self.cond.__repr__()}, {self.body.__repr__()}, {self.id.__repr__()})"


class IfElseStmt(ASTStmt):
    cond: ASTExpr
    then: List[ASTStmt]
    otherwise: List[ASTStmt]
    id: str

    def __init__(self, cond: ASTExpr, then: List[ASTStmt], otherwise: List[ASTStmt], id: str):
        self.cond, self.then, self.otherwise, self.id = cond, then, otherwise, id

    def __repr__(self):
        return f"IfElseStmt({self.cond.__repr__()}, {self.then.__repr__()}, {self.otherwise.__repr__()}, {self.id.__repr__()})"


class IfElseExpr(ASTExpr):
    cond: ASTExpr
    then: ASTExpr
    otherwise: ASTExpr
    id: str

    def __init__(self, cond: ASTExpr, then: ASTExpr, otherwise: ASTExpr, id: str):
        self.cond, self.then, self.otherwise, self.id = cond, then, otherwise, id

    def __repr__(self):
        return f"IfElseExpr({self.cond.__repr__()}, {self.then.__repr__()}, {self.otherwise.__repr__()}, {self.id.__repr__()})"


class IfStmt(ASTStmt):
    cond: ASTExpr
    then: List[ASTStmt]
    id: str

    def __init__(self, cond: ASTExpr, then: List[ASTStmt], id: str):
        self.cond, self.then, self.id = cond, then, id

    def __repr__(self):
        return f"IfStmt({self.cond.__repr__()}, {self.then.__repr__()}, {self.id.__repr__()})"


class Call(ASTExpr):
    funcname: str
    args: List[ASTExpr]
    id: str

    def __init__(self, funcname: str, args: List[ASTExpr], id: str):
        self.funcname, self.args, self.id = funcname, args, id

    def __repr__(self):
        return f"Call({self.funcname.__repr__()}, {self.args.__repr__()}, {self.id.__repr__()})"


class BinaryExpr(ASTExpr):
    op: str
    a: ASTExpr
    b: ASTExpr
    id: str

    def __init__(self, op: str, a: ASTExpr, b: ASTExpr, id: str):
        self.op, self.a, self.b, self.id = op, a, b, id

    def __repr__(self):
        return f"BinaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.b.__repr__()}, {self.id.__repr__()})"


class SatBinaryExpr(BinaryExpr):
    unsigned: ASTExpr
    satsize: ASTExpr

    def __init__(self, op: str, a: ASTExpr, b: ASTExpr, satsize: ASTExpr, unsigned: ASTExpr, id: str):
        super().__init__(op, a, b, id)
        self.satsize = satsize
        self.unsigned = unsigned

    def createFromBinOp(be: BinaryExpr, satmode: Tuple[ASTExpr, ASTExpr]):
        return SatBinaryExpr(be.op, be.a, be.b, satmode[0], satmode[1], be.id)

    def __repr__(self):
        return f"SatBinaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.b.__repr__()}, {self.satsize.__repr__()}, {self.unsigned.__repr__()}, {self.id.__repr__()})"


class UnaryExpr(ASTExpr):
    op: str
    a: ASTExpr
    id: str

    def __init__(self, op: str, a: ASTExpr, id: str):
        self.op, self.a, self.id = op, a, id

    def __repr__(self):
        return f"UnaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.id.__repr__()})"


# class Select(ASTNode):
#     ['cond', 'then', 'otherwise', 'id']


class CaseBase(ASTStmt):
    body: List[ASTStmt]
    id: str

    def __init__(self, body: List[ASTStmt], id: str):
        self.body, self.id = body, id

    def __repr__(self):
        return f"CaseBase({self.body.__repr__()}, {self.id.__repr__()})"


class Case(CaseBase):
    val: ASTExpr

    def __init__(self, val: ASTExpr, body: List[ASTStmt], id: str):
        self.val, self.body, self.id = val, body, id

    def __repr__(self):
        return f"Case({self.val.__repr__()}, {self.body.__repr__()}, {self.id.__repr__()})"


class Match(ASTStmt):
    val: ASTExpr
    cases: List[ASTStmt]
    id: str

    def __init__(self, val: ASTExpr, cases: List[CaseBase], id: str):
        self.val, self.cases, self.id = val, cases, id

    def __repr__(self):
        return f"Match({self.val.__repr__()}, {self.cases.__repr__()}, {self.id.__repr__()})"

class VarDeclBase(ASTNode):
    pass

class VarDeclInit(VarDeclBase):
    lhs: Var
    rhs: ASTExpr
    id: str

    def __init__(self, lhs: Var, expr: ASTExpr, id: str):
        self.lhs, self.rhs, self.id = lhs, expr, id

    def __repr__(self):
        return f"VarDeclInit({self.lhs.__repr__()}, {self.rhs.__repr__()}, {self.id.__repr__()})"

class VarDeclUndef(VarDeclBase):
    lhs: Var
    id: str

    def __init__(self, lhs: Var, id: str):
        self.lhs, self.id = lhs, id

    def __repr__(self):
        return f"VarDeclUndef({self.lhs.__repr__()}, {self.id.__repr__()})"

from typing import Union

class VarsDecl(ASTStmt):
    init_list: List[VarDeclBase]
    basetype: Tuple[str, ASTExpr]
    id: str

    def __init__(self, init_list: List[VarDeclBase], basetype: Tuple[str, ASTNode], id: str):
        self.init_list, self.basetype, self.id = init_list, basetype, id

    def __repr__(self):
        return f"VarsDecl({self.init_list.__repr__()}, {self.basetype.__repr__()}, {self.id.__repr__()})"


class Undefined(ASTNode):
    def __repr__(self):
        return f"Undefiend()"


class SatException(Exception):
    pass


def ASTShrink_(AST):
    if isinstance(AST, list):
        w = [ASTShrink_(i) for i in AST]
        return [i for i in w if i is not None]
    if isinstance(AST, asl.StmtCall):
        return None  # Assume StmtCall useless
    elif isinstance(AST, asl.StmtVarDeclInit):
        return VarDeclInit(ASTShrink_(AST.symboldecl), ASTShrink_(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.StmtConstDecl):
        return VarDeclInit(ASTShrink_(AST.symboldecl), ASTShrink_(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.SymbolDecl):
        return VarsDecl([Var(AST.id, GenUniqueID())], ASTShrink_(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.StmtVarsDecl):
        return VarsDecl([Var(i, GenUniqueID()) for i in AST.ids], ASTShrink_(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.TypeRef):
        if AST.qid.id in asl_type_bits:
            return (AST.qid.id, Number(asl_type_bits[AST.qid.id]))
        raise NotImplementedError(f"{AST}")
    elif isinstance(AST, asl.TypeFun):  # Only Returns Type width
        if AST.id == "bits":
            return ("bits", ASTShrink_(AST.expr))
        raise NotImplementedError
    elif isinstance(AST, asl.ExprVarRef):
        if ASTShrink_(AST.qid) in ["sat", "sat1", "sat2"]:
            raise SatException("sat/sat1/sat2 is striped")
        return Var(ASTShrink_(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.LValVarRef):
        return Var(ASTShrink_(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.CasePatternIdentifier):
        return Number(ARMGlobalConst[AST.id])
        # return Var(AST.id, GenUniqueID())
    elif isinstance(AST, asl.LValArrayIndex):
        assert type(AST.slices) == list, f"{AST}"
        return ArrayIndex(ASTShrink_(AST.lvalexpr), ASTShrink_(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.QualifiedIdentifier):
        return AST.id
    elif isinstance(AST, asl.ExprIndex):
        assert type(AST.slices) == list, f"{AST}"
        return ArrayIndex(ASTShrink_(AST.expr), ASTShrink_(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.ExprSlice):
        assert type(AST.slices) == list, f"{AST}"
        # Patch for striping <7:0> on `vshl`s
        slice = ASTShrink_(AST.slices)
        # if len(slice) == 1 and isinstance(slice[0], SliceRange) and isinstance(slice[0].hi, Number) and isinstance(slice[0].lo, Number) and slice[0].hi.val == 7 and slice[0].lo.val == 0:
        #     return ASTShrink_(AST.expr)
        return ArrayIndex(ASTShrink_(AST.expr), slice, GenUniqueID())
    elif isinstance(AST, asl.LValSliceOf):
        assert type(AST.slices) == list, f"{AST}"
        return ArrayIndex(ASTShrink_(AST.lvalexpr), ASTShrink_(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.SliceRange):
        return SliceRange(ASTShrink_(AST.expr0), ASTShrink_(AST.expr1), GenUniqueID())
    elif isinstance(AST, asl.SliceSingle):
        return ASTShrink_(AST.expr)
    elif isinstance(AST, asl.StmtFor):
        return For(Var(AST.id, GenUniqueID()), ASTShrink_(AST.expr0), ASTShrink_(AST.expr1), ASTShrink_(AST.stmts), 1, GenUniqueID())
    elif isinstance(AST, asl.ExprLitInt):
        return Number(AST.integer)
    elif isinstance(AST, asl.ExprBinOp):
        return BinaryExpr(AST.binop[1:-1], ASTShrink_(AST.lhs), ASTShrink_(AST.rhs), GenUniqueID())
    elif isinstance(AST, asl.ExprUnOp):
        return UnaryExpr(AST.unop[1:-1], ASTShrink_(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.StmtAssign):
        return Update(ASTShrink_(AST.lvalexpr), ASTShrink_(AST.expr))
    elif isinstance(AST, asl.ExprCall):
        return Call(ASTShrink_(AST.qid), ASTShrink_(AST.exprs), GenUniqueID())
    elif isinstance(AST, asl.StmtIf):
        if AST.maybe_stmts != asl.Nothing():
            if len(AST.stmtifcases) == 1:
                return IfElse(ASTShrink_(AST.stmtifcases[0].expr), ASTShrink_(AST.stmtifcases[0].stmts), ASTShrink_(AST.maybe_stmts), GenUniqueID())
            else:
                print(AST)
                raise NotImplementedError
        else:
            if len(AST.stmtifcases) == 1:
                try:
                    return IfStmt(ASTShrink_(AST.stmtifcases[0].expr), ASTShrink_(AST.stmtifcases[0].stmts), GenUniqueID())
                except SatException as e:
                    return None
            else:
                print(AST)
                raise NotImplementedError
    elif isinstance(AST, asl.ExprLitBin):
        return BitVec(AST.bitvector)
    elif isinstance(AST, asl.StmtUndefined):
        return Undefined()
    elif isinstance(AST, asl.ExprIf):
        return IfElse(ASTShrink_(AST.exprtest), ASTShrink_(AST.exprresult), ASTShrink_(AST.exprelse), GenUniqueID())
    elif isinstance(AST, asl.ExprUnknown):
        return Number(0)
    elif isinstance(AST, asl.StmtCase):
        return Match(ASTShrink_(AST.expr), ASTShrink_(AST.casealternatives), GenUniqueID())
    elif isinstance(AST, asl.CaseWhen):
        if type(AST.casepatterns) == list:
            assert len(AST.casepatterns) == 1, f"{AST}"
            return Case(ASTShrink_(AST.casepatterns[0]), ASTShrink_(AST.stmts), GenUniqueID())
        return Case(ASTShrink_(AST.casepatterns), ASTShrink_(AST.stmts), GenUniqueID())
    elif isinstance(AST, asl.CaseOtherwise):
        return CaseBase(ASTShrink_(AST.stmts), GenUniqueID())
    elif isinstance(AST, asl.CasePatternMask):
        return BitVec(AST.mask)
    elif isinstance(AST, asl.CasePatternBin):
        return BitVec(AST.bitvector)
    elif isinstance(AST, asl.CasePatternInt):
        return Number(AST.integer)
    elif isinstance(AST, asl.ExprLitMask):
        return BitVec(AST.mask)
    elif isinstance(AST, asl.LValTuple):  # strip out sat
        assert AST.lvalexprs[1].qid.id in ["sat", "sat1", "sat2"]
        return ASTShrink_(AST.lvalexprs[0])
    else:
        print(AST)
        raise NotImplementedError


def ASTShrink(AST):
    ResetUniqueID()
    return ASTShrink_(AST)


def ASTcopy(AST):
    if isinstance(AST, str):
        return AST
    if isinstance(AST, Tuple):
        return tuple(ASTcopy(i) for i in AST)
    if isinstance(AST, list):
        return [ASTcopy(i) for i in AST]
    if isinstance(AST, Number):
        return Number(AST.val)
    if isinstance(AST, BitVec):
        return BitVec(AST.bv)
    if isinstance(AST, SliceRange):
        return SliceRange(ASTcopy(AST.hi), ASTcopy(AST.lo), AST.id)
    if isinstance(AST, ArrayIndex):
        return ArrayIndex(ASTcopy(AST.obj), ASTcopy(AST.slices), AST.id)
    if isinstance(AST, ElemSlice):
        return ElemSlice(ASTcopy(AST.op), ASTcopy(AST.cnt), ASTcopy(AST.esize), AST.id)
    if isinstance(AST, VReg):
        return VReg(ASTcopy(AST.reg), AST.id)
    if isinstance(AST, VPartReg):
        return VPartReg(ASTcopy(AST.reg), ASTcopy(AST.part), AST.id)
    if isinstance(AST, Var):
        return Var(AST.name, AST.id)
    if isinstance(AST, Update):
        return Update(ASTcopy(AST.lhs), ASTcopy(AST.rhs))
    if isinstance(AST, For):
        return For(ASTcopy(AST.iterator), ASTcopy(AST.begin), ASTcopy(AST.end), ASTcopy(AST.stmts), AST.inc, AST.id)
    if isinstance(AST, While):
        return While(ASTcopy(AST.cond), ASTcopy(AST.body), AST.id)
    if isinstance(AST, IfElseStmt):
        return IfElseStmt(ASTcopy(AST.cond), ASTcopy(AST.then), ASTcopy(AST.otherwise), AST.id)
    if isinstance(AST, IfElseExpr):
        return IfElseExpr(ASTcopy(AST.cond), ASTcopy(AST.then), ASTcopy(AST.otherwise), AST.id)
    if isinstance(AST, IfStmt):
        return IfStmt(ASTcopy(AST.cond), ASTcopy(AST.then), AST.id)
    if isinstance(AST, Call):
        return Call(AST.funcname, ASTcopy(AST.args), AST.id)
    if isinstance(AST, BinaryExpr):
        return BinaryExpr(AST.op, ASTcopy(AST.a), ASTcopy(AST.b), AST.id)
    if isinstance(AST, UnaryExpr):
        return UnaryExpr(AST.op, ASTcopy(AST.a), AST.id)
    if isinstance(AST, Case):
        return Case(ASTcopy(AST.val), ASTcopy(AST.body), AST.id)
    if isinstance(AST, CaseBase):
        return CaseBase(ASTcopy(AST.body), AST.id)
    if isinstance(AST, Match):
        return Match(ASTcopy(AST.val), ASTcopy(AST.cases), AST.id)
    if isinstance(AST, VarDeclInit):
        return VarDeclInit(ASTcopy(AST.lhs), ASTcopy(AST.rhs), AST.id)
    if isinstance(AST, VarDeclUndef):
        return VarDeclUndef(ASTcopy(AST.lhs), AST.id)
    if isinstance(AST, VarsDecl):
        return VarsDecl(ASTcopy(AST.init_list), ASTcopy(AST.basetype), AST.id)
    if isinstance(AST, Undefined):
        return Undefined()
    raise NotImplementedError(f"{AST}")


Flag = namedtuple(
    "Flag", "pair sat round base s2u narrow q x high lane n result type")
JSONDIR = os.environ.get("HYDRIDE_ROOT")+"/codegen-generator/targets/arm/"
