from collections import namedtuple
from typing import List
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
        return f"Number({self.val})"


class BitVec(ASTNode):
    bv: str

    def __init__(self, bv: int):
        self.bv = bv

    def __repr__(self):
        return f"BitVec({self.bv})"


class ArraySlice(ASTNode):
    bv: ASTNode
    slices: List[ASTNode]
    id: str
    wid: ASTNode

    def __init__(self, bv: ASTNode, slices: List[ASTNode], id: str):
        self.bv, self.slices, self.id = bv, slices, id

    def __repr__(self):
        return f"ArraySlice({self.bv}, {self.slices}, {self.id})"


class ArrayIndex(ASTNode):
    obj: ASTNode
    idxs: List[ASTNode]
    id: str

    def __init__(self, obj: ASTNode, idxs: List[ASTNode], id: str):
        self.obj, self.idxs, self.id = obj, idxs, id

    def __repr__(self):
        return f"ArrayIndex({self.obj}, {self.idxs}, {self.id})"


class Var(ASTNode):
    name: str
    id: str

    def __init__(self, name: str, id: str):
        self.name, self.id = name, id

    def __repr__(self):
        return f"Var({self.name}, {self.id})"


class Update(ASTNode):
    lhs: ASTNode
    rhs: ASTNode

    def __init__(self, lhs: ASTNode, rhs: ASTNode):
        self.lhs, self.rhs = lhs, rhs

    def __repr__(self):
        return f"Update({self.lhs}, {self.rhs})"


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
        return f"For({self.iterator}, {self.begin}, {self.end}, {self.stmts}, {self.inc}, {self.id})"


class While(ASTNode):
    cond: ASTNode
    body: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, body: List[ASTNode], id: str):
        self.cond, self.body, self.id = cond, body, id

    def __repr__(self):
        return f"While({self.cond}, {self.body}, {self.id})"


class IfElse(ASTNode):
    cond: ASTNode
    then: List[ASTNode]
    otherwise: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, then: List[ASTNode], otherwise: List[ASTNode], id: str):
        self.cond, self.then, self.otherwise, self.id = cond, then, otherwise, id

    def __repr__(self):
        return f"IfElse({self.cond}, {self.then}, {self.otherwise}, {self.id})"


class If(ASTNode):
    cond: ASTNode
    then: List[ASTNode]
    id: str

    def __init__(self, cond: ASTNode, then: List[ASTNode], id: str):
        self.cond, self.then, self.id = cond, then, id

    def __repr__(self):
        return f"If({self.cond}, {self.then}, {self.id})"


class Call(ASTNode):
    funcname: str
    args: List[ASTNode]
    id: str

    def __init__(self, funcname: str, args: List[ASTNode], id: str):
        self.funcname, self.args, self.id = funcname, args, id

    def __repr__(self):
        return f"Call({self.funcname}, {self.args}, {self.id})"


class BinaryExpr(ASTNode):
    op: str
    a: ASTNode
    b: ASTNode
    id: str

    def __init__(self, op: str, a: ASTNode, b: ASTNode, id: str):
        self.op, self.a, self.b, self.id = op, a, b, id

    def __repr__(self):
        return f"BinaryExpr({self.op}, {self.a}, {self.b}, {self.id})"


class UnaryExpr(ASTNode):
    op: str
    a: ASTNode
    id: str

    def __init__(self, op: str, a: ASTNode, id: str):
        self.op, self.a, self.id = op, a, id

    def __repr__(self):
        return f"UnaryExpr({self.op}, {self.a}, {self.id})"


# class Select(ASTNode):
#     ['cond', 'then', 'otherwise', 'id']


class CaseBase(ASTNode):
    body: List[ASTNode]
    id: str

    def __init__(self, body: List[ASTNode], id: str):
        self.body, self.id = body, id

    def __repr__(self):
        return f"CaseBase({self.body}, {self.id})"


class Case(CaseBase):
    val: ASTNode

    def __init__(self, val: ASTNode, body: List[ASTNode], id: str):
        self.val, self.body, self.id = val, body, id

    def __repr__(self):
        return f"Case({self.val}, {self.body}, {self.id})"


class Match(ASTNode):
    val: ASTNode
    cases: List[CaseBase]
    id: str

    def __init__(self, val: ASTNode, cases: List[CaseBase], id: str):
        self.val, self.cases, self.id = val, cases, id

    def __repr__(self):
        return f"Match({self.val}, {self.cases}, {self.id})"


class VarsDecl(ASTNode):
    ids: List[Var]
    width: ASTNode
    id: str

    def __init__(self, ids: List[Var], width: ASTNode, id: str):
        self.ids, self.width, self.id = ids, width, id

    def __repr__(self):
        return f"VarsDecl({self.ids}, {self.width}, {self.id})"


class VarDeclInit(ASTNode):
    decl: VarsDecl
    expr: ASTNode
    id: str

    def __init__(self, decl: VarsDecl, expr: ASTNode, id: str):
        self.decl, self.expr, self.id = decl, expr, id

    def __repr__(self):
        return f"VarDeclInit({self.decl}, {self.expr}, {self.id})"


class Undefiend(ASTNode):
    def __repr__(self):
        return f"Undefiend()"


class SatException(Exception):
    pass


def ASTShrink(AST):
    if isinstance(AST, list):
        w = [ASTShrink(i) for i in AST]
        return [i for i in w if i is not None]
    if isinstance(AST, asl.StmtCall):
        return None  # Assume StmtCall useless
    elif isinstance(AST, asl.StmtVarDeclInit):
        return VarDeclInit(ASTShrink(AST.symboldecl), ASTShrink(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.StmtConstDecl):
        return VarDeclInit(ASTShrink(AST.symboldecl), ASTShrink(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.SymbolDecl):
        return VarsDecl([Var(AST.id, GenUniqueID())], ASTShrink(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.StmtVarsDecl):
        return VarsDecl([Var(i, GenUniqueID()) for i in AST.ids], ASTShrink(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.TypeFun):  # Only Returns Type width
        if AST.id == "bits":
            return ASTShrink(AST.expr)
        raise NotImplementedError
    elif isinstance(AST, asl.ExprVarRef):
        if ASTShrink(AST.qid) in ["sat", "sat1", "sat2"]:
            raise SatException("sat/sat1/sat2 is striped")
        return Var(ASTShrink(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.LValVarRef):
        return Var(ASTShrink(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.CasePatternIdentifier):
        return Var(AST.id, GenUniqueID())
    elif isinstance(AST, asl.LValArrayIndex):
        return ArrayIndex(ASTShrink(AST.lvalexpr), ASTShrink(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.QualifiedIdentifier):
        return AST.id
    elif isinstance(AST, asl.ExprIndex):
        return ArrayIndex(ASTShrink(AST.expr), ASTShrink(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.ExprSlice):
        assert len(AST.slices) == 1
        return ArraySlice(ASTShrink(AST.expr), ASTShrink(AST.slices[0]), GenUniqueID())
    elif isinstance(AST, asl.LValSliceOf):
        assert len(AST.slices) == 1
        return ArraySlice(ASTShrink(AST.lvalexpr), ASTShrink(AST.slices[0]), GenUniqueID())
    elif isinstance(AST, asl.SliceRange):
        return [ASTShrink(AST.expr0), ASTShrink(AST.expr1)]
    elif isinstance(AST, asl.SliceSingle):
        return [ASTShrink(AST.expr)]
    elif isinstance(AST, asl.StmtFor):
        return For(Var(AST.id, GenUniqueID()), ASTShrink(AST.expr0), ASTShrink(AST.expr1), ASTShrink(AST.stmts), 1, GenUniqueID())
    elif isinstance(AST, asl.ExprLitInt):
        return Number(AST.integer)
    elif isinstance(AST, asl.ExprBinOp):
        return BinaryExpr(AST.binop[1:-1], ASTShrink(AST.lhs), ASTShrink(AST.rhs), GenUniqueID())
    elif isinstance(AST, asl.ExprUnOp):
        return UnaryExpr(AST.unop[1:-1], ASTShrink(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.StmtAssign):
        return Update(ASTShrink(AST.lvalexpr), ASTShrink(AST.expr))
    elif isinstance(AST, asl.ExprCall):
        return Call(ASTShrink(AST.qid), ASTShrink(AST.exprs), GenUniqueID())
    elif isinstance(AST, asl.StmtIf):
        if AST.maybe_stmts != asl.Nothing():
            if len(AST.stmtifcases) == 1:
                return IfElse(ASTShrink(AST.stmtifcases[0].expr), ASTShrink(AST.stmtifcases[0].stmts), ASTShrink(AST.maybe_stmts), GenUniqueID())
            else:
                print(AST)
                raise NotImplementedError
        else:
            if len(AST.stmtifcases) == 1:
                try:
                    return If(ASTShrink(AST.stmtifcases[0].expr), ASTShrink(AST.stmtifcases[0].stmts), GenUniqueID())
                except SatException as e:
                    return None
            else:
                print(AST)
                raise NotImplementedError
    elif isinstance(AST, asl.TypeRef):
        return 32
    elif isinstance(AST, asl.ExprLitBin):
        return BitVec(AST.bitvector)
    elif isinstance(AST, asl.StmtUndefined):
        return Undefiend()
    elif isinstance(AST, asl.ExprIf):
        return IfElse(ASTShrink(AST.exprtest), ASTShrink(AST.exprresult), ASTShrink(AST.exprelse), GenUniqueID())
    elif isinstance(AST, asl.ExprUnknown):
        return Number(0)
    elif isinstance(AST, asl.StmtCase):
        return Match(ASTShrink(AST.expr), ASTShrink(AST.casealternatives), GenUniqueID())
    elif isinstance(AST, asl.CaseWhen):
        return Case(ASTShrink(AST.casepatterns), ASTShrink(AST.stmts), GenUniqueID())
    elif isinstance(AST, asl.CaseOtherwise):
        return CaseBase(ASTShrink(AST.stmts), GenUniqueID())
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
        return ASTShrink(AST.lvalexprs[0])
    else:
        print(AST)
        raise NotImplementedError


Flag = namedtuple(
    "Flag", "pair sat round base s2u narrow q x high lane n result type")
