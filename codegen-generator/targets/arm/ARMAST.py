import os
from collections import namedtuple
from typing import List, Tuple
from ARMTypes import ARMGlobalConst
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


class Number(ASTNode):
    val: int

    def __init__(self, val: int):
        self.val = val

    def __repr__(self):
        return f"Number({self.val.__repr__()})"


class BitVec(ASTNode):
    bv: str

    def __init__(self, bv: int):
        self.bv = bv

    def __repr__(self):
        return f"BitVec({self.bv.__repr__()})"


class SliceRange(ASTNode):
    hi: ASTNode
    lo: ASTNode
    id: str
    wid: ASTNode

    def __init__(self, hi: ASTNode, lo: ASTNode, id: str):
        self.lo, self.hi, self.id = lo, hi, id

    def __repr__(self):
        return f"SliceRange({self.hi.__repr__()}, {self.lo.__repr__()}, {self.id.__repr__()})"


class ArrayIndex(ASTNode):
    obj: ASTNode
    slices: List[ASTNode]
    id: str

    def __init__(self, obj: ASTNode, slices: List[ASTNode], id: str):
        self.obj, self.slices, self.id = obj, slices, id

    def __repr__(self):
        return f"ArrayIndex({self.obj.__repr__()}, {self.slices.__repr__()}, {self.id.__repr__()})"


class Var(ASTNode):
    name: str
    id: str

    def __init__(self, name: str, id: str):
        self.name, self.id = name, id

    def __repr__(self):
        return f"Var({self.name.__repr__()}, {self.id.__repr__()})"


class Update(ASTNode):
    lhs: ASTNode
    rhs: ASTNode

    def __init__(self, lhs: ASTNode, rhs: ASTNode):
        self.lhs, self.rhs = lhs, rhs

    def __repr__(self):
        return f"Update({self.lhs.__repr__()}, {self.rhs.__repr__()})"


class For(ASTNode):
    iterator: Var
    begin: ASTNode
    end: ASTNode
    stmts: List[ASTNode]
    inc: int
    id: str

    def __init__(self, iterator: Var, begin: ASTNode, end: ASTNode, stmts: List[ASTNode], inc: int, id: str):
        self.iterator, self.begin, self.end, self.stmts, self.inc, self.id = iterator, begin, end, stmts, inc, id

    def __repr__(self):
        return f"For({self.iterator.__repr__()}, {self.begin.__repr__()}, {self.end.__repr__()}, {self.stmts.__repr__()}, {self.inc.__repr__()}, {self.id.__repr__()})"


class While(ASTNode):
    cond: ASTNode
    body: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, body: List[ASTNode], id: str):
        self.cond, self.body, self.id = cond, body, id

    def __repr__(self):
        return f"While({self.cond.__repr__()}, {self.body.__repr__()}, {self.id.__repr__()})"


class IfElse(ASTNode):
    cond: ASTNode
    then: List[ASTNode]
    otherwise: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, then: List[ASTNode], otherwise: List[ASTNode], id: str):
        self.cond, self.then, self.otherwise, self.id = cond, then, otherwise, id

    def __repr__(self):
        return f"IfElse({self.cond.__repr__()}, {self.then.__repr__()}, {self.otherwise.__repr__()}, {self.id.__repr__()})"


class If(ASTNode):
    cond: ASTNode
    then: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, then: List[ASTNode], id: str):
        self.cond, self.then, self.id = cond, then, id

    def __repr__(self):
        return f"If({self.cond.__repr__()}, {self.then.__repr__()}, {self.id.__repr__()})"


class Call(ASTNode):
    funcname: str
    args: List[ASTNode]
    id: str

    def __init__(self, funcname: str, args: List[ASTNode], id: str):
        self.funcname, self.args, self.id = funcname, args, id

    def __repr__(self):
        return f"Call({self.funcname.__repr__()}, {self.args.__repr__()}, {self.id.__repr__()})"


class BinaryExpr(ASTNode):
    op: str
    a: ASTNode
    b: ASTNode
    id: str

    def __init__(self, op: str, a: ASTNode, b: ASTNode, id: str):
        self.op, self.a, self.b, self.id = op, a, b, id

    def __repr__(self):
        return f"BinaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.b.__repr__()}, {self.id.__repr__()})"


class UnaryExpr(ASTNode):
    op: str
    a: ASTNode
    id: str

    def __init__(self, op: str, a: ASTNode, id: str):
        self.op, self.a, self.id = op, a, id

    def __repr__(self):
        return f"UnaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.id.__repr__()})"


# class Select(ASTNode):
#     ['cond', 'then', 'otherwise', 'id']


class CaseBase(ASTNode):
    body: List[ASTNode]
    id: str

    def __init__(self, body: List[ASTNode], id: str):
        self.body, self.id = body, id

    def __repr__(self):
        return f"CaseBase({self.body.__repr__()}, {self.id.__repr__()})"


class Case(CaseBase):
    val: ASTNode

    def __init__(self, val: ASTNode, body: List[ASTNode], id: str):
        self.val, self.body, self.id = val, body, id

    def __repr__(self):
        return f"Case({self.val.__repr__()}, {self.body.__repr__()}, {self.id.__repr__()})"


class Match(ASTNode):
    val: ASTNode
    cases: List[CaseBase]
    id: str

    def __init__(self, val: ASTNode, cases: List[CaseBase], id: str):
        self.val, self.cases, self.id = val, cases, id

    def __repr__(self):
        return f"Match({self.val.__repr__()}, {self.cases.__repr__()}, {self.id.__repr__()})"


class VarsDecl(ASTNode):
    ids: List[Var]
    basetype: Tuple[str, ASTNode]
    id: str

    def __init__(self, ids: List[Var], basetype: Tuple[str, ASTNode], id: str):
        self.ids, self.basetype, self.id = ids, basetype, id

    def __repr__(self):
        return f"VarsDecl({self.ids.__repr__()}, {self.basetype.__repr__()}, {self.id.__repr__()})"


class VarDeclInit(ASTNode):
    decl: VarsDecl
    expr: ASTNode
    id: str

    def __init__(self, decl: VarsDecl, expr: ASTNode, id: str):
        self.decl, self.expr, self.id = decl, expr, id

    def __repr__(self):
        return f"VarDeclInit({self.decl.__repr__()}, {self.expr.__repr__()}, {self.id.__repr__()})"


class Undefiend(ASTNode):
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
        d = {
            "integer": 64,
            "boolean": 1,
            "CompareOp": 3,
            "MemOp": 2,
            "CountOp": 2,
            "LogicalOp": 2,
            "VBitOp": 2,
            "ReduceOp": 3,
            "bit": 1,
        }
        if AST.qid.id in d:
            return (AST.qid.id, Number(d[AST.qid.id]))
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
        if len(slice) == 1 and isinstance(slice[0], SliceRange) and isinstance(slice[0].hi, Number) and isinstance(slice[0].lo, Number) and slice[0].hi.val == 7 and slice[0].lo.val == 0:
            return ASTShrink_(AST.expr)
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
                    return If(ASTShrink_(AST.stmtifcases[0].expr), ASTShrink_(AST.stmtifcases[0].stmts), GenUniqueID())
                except SatException as e:
                    return None
            else:
                print(AST)
                raise NotImplementedError
    elif isinstance(AST, asl.ExprLitBin):
        return BitVec(AST.bitvector)
    elif isinstance(AST, asl.StmtUndefined):
        return Undefiend()
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


Flag = namedtuple(
    "Flag", "pair sat round base s2u narrow q x high lane n result type")
JSONDIR = os.environ.get("HYDRIDE_ROOT")+"/codegen-generator/targets/arm/"
