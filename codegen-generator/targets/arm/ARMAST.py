from collections import namedtuple
import asl.ARMAST as asl

PARSER_ID_COUNTER = 0


def GenUniqueID():
    global PARSER_ID_COUNTER
    ID = PARSER_ID_COUNTER
    PARSER_ID_COUNTER += 1
    return str(ID)


Number = namedtuple('Number', ['val'])
ArraySlice = namedtuple('ArraySlice', ['bv', 'slices', 'id'])
ArrayIndex = namedtuple('ArrayIndex', ['obj', 'idxs', 'id'])
Var = namedtuple('Var', ['name', 'id'])

Update = namedtuple('Update', ['lhs', 'rhs'])

For = namedtuple('For', ['iterator', 'begin', 'end', 'stmts', 'inc', 'id'])
While = namedtuple('While', ['cond', 'body', 'id'])

IfElse = namedtuple('IfElse', ['cond', 'then',  'otherwise', 'id'])
If = namedtuple('If', ['cond', 'then', 'id'])

Call = namedtuple('Call', ['funcname', 'args', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])

Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])

Match = namedtuple('Match', ['val', 'cases', 'id'])
Case = namedtuple('Case', ['val', 'stmts', 'id'])

VarsDecl = namedtuple('VarsDecl', ['ids', 'width'])
VarDeclInit = namedtuple('VarDeclInit', ['decl', 'expr', 'id'])


def ASTShrink(AST):
    if isinstance(AST, list):
        w = [ASTShrink(i) for i in AST]
        return [i for i in w if i is not None]
    if isinstance(AST, asl.StmtCall):
        return None  # Assume StmtCall useless
    elif isinstance(AST, asl.StmtVarDeclInit):
        return VarDeclInit(ASTShrink(AST.symboldecl), ASTShrink(AST.expr), GenUniqueID())
    elif isinstance(AST, asl.SymbolDecl):
        return VarsDecl(AST.id, ASTShrink(AST.ty))
    elif isinstance(AST, asl.StmtVarsDecl):
        return VarsDecl(AST.ids, ASTShrink(AST.ty))
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
        return For(AST.id, ASTShrink(AST.expr0), ASTShrink(AST.expr1), ASTShrink(AST.stmts), Number(1), GenUniqueID())
    elif isinstance(AST, asl.ExprLitInt):
        return Number(AST.integer)
    elif isinstance(AST, asl.ExprBinOp):
        return BinaryExpr(AST.binop, ASTShrink(AST.lhs), ASTShrink(AST.rhs), GenUniqueID())
    elif isinstance(AST, asl.StmtAssign):
        return Update(ASTShrink(AST.lvalexpr), ASTShrink(AST.expr))
    elif isinstance(AST, asl.ExprCall):
        return Call(ASTShrink(AST.qid), ASTShrink(AST.exprs), GenUniqueID())
    else:
        print(AST)
        assert False
