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


# class Match(ASTNode):
#     ['val', 'cases', 'id']


# class Case(ASTNode):
#     ['val', 'stmts', 'id']


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


def ASTShrink(AST):
    if isinstance(AST, list):
        w = [ASTShrink(i) for i in AST]
        return [i for i in w if i is not None]
    if isinstance(AST, asl.StmtCall):
        return None  # Assume StmtCall useless
    elif isinstance(AST, asl.StmtVarDeclInit):
        return VarDeclInit(ASTShrink(AST.symboldecl), ASTShrink(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.SymbolDecl):
        return VarsDecl([Var(AST.id, GenUniqueID())], ASTShrink(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.StmtVarsDecl):
        return VarsDecl([Var(i, GenUniqueID()) for i in AST.ids], ASTShrink(AST.ty), GenUniqueID())
    elif isinstance(AST, asl.TypeFun):  # Only Returns Type width
        if AST.id == "bits":
            return ASTShrink(AST.expr)
        assert False
    elif isinstance(AST, asl.ExprVarRef):
        return Var(ASTShrink(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.LValVarRef):
        return Var(ASTShrink(AST.qid), GenUniqueID())
    elif isinstance(AST, asl.LValArrayIndex):
        return ArrayIndex(ASTShrink(AST.lvalexpr), ASTShrink(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.QualifiedIdentifier):
        return AST.id
    elif isinstance(AST, asl.ExprIndex):
        return ArrayIndex(ASTShrink(AST.expr), ASTShrink(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.ExprSlice):
        return ArraySlice(ASTShrink(AST.expr), ASTShrink(AST.slices), GenUniqueID())
    elif isinstance(AST, asl.SliceSingle):
        return ASTShrink(AST.expr)
    elif isinstance(AST, asl.StmtFor):
        return For(Var(AST.id, GenUniqueID()), ASTShrink(AST.expr0), ASTShrink(AST.expr1), ASTShrink(AST.stmts), 1, GenUniqueID())
    elif isinstance(AST, asl.ExprLitInt):
        return Number(AST.integer)
    elif isinstance(AST, asl.ExprBinOp):
        return BinaryExpr(AST.binop[1:-1], ASTShrink(AST.lhs), ASTShrink(AST.rhs), GenUniqueID())
    elif isinstance(AST, asl.StmtAssign):
        return Update(ASTShrink(AST.lvalexpr), ASTShrink(AST.expr))
    elif isinstance(AST, asl.ExprCall):
        return Call(ASTShrink(AST.qid), ASTShrink(AST.exprs), GenUniqueID())
    elif isinstance(AST, asl.StmtIf):
        if AST.maybe_stmts:
            if len(AST.stmtifcases) == 1:
                return IfElse(ASTShrink(AST.stmtifcases[0].expr), ASTShrink(AST.stmtifcases[0].stmts), ASTShrink(AST.maybe_stmts), GenUniqueID())
            else:
                print(AST)
                assert False
        else:
            return If(ASTShrink(AST.stmtifcases.expr), ASTShrink(AST.stmtifcases.stmts), GenUniqueID())
    else:
        print(AST)
        assert False
