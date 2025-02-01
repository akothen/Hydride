from typing import List, Tuple, Dict


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


class Member(ASTExpr):
    obj: ASTExpr
    field: str

    def __init__(self, obj: ASTExpr, field: str):
        assert isinstance(obj, ASTExpr)
        self.obj, self.field = obj, field

    def __repr__(self):
        return f"Member({self.obj.__repr__()}, {self.field.__repr__()})"


class ArrayIndex(ASTExpr):
    obj: ASTExpr
    index: ASTExpr

    def __init__(self, obj: ASTExpr, slices: ASTExpr):
        assert isinstance(obj, ASTExpr)
        assert isinstance(slices, ASTExpr)
        self.obj, self.index = obj, slices

    def __repr__(self):
        return f"ArrayIndex({self.obj.__repr__()}, {self.index.__repr__()})"


class ArraySlice(ASTExpr):
    obj: ASTExpr
    hi: ASTExpr
    lo: ASTExpr

    def __init__(self, obj: ASTExpr, hi: ASTExpr, lo: ASTExpr):
        assert isinstance(obj, ASTExpr)
        assert isinstance(hi, ASTExpr)
        assert isinstance(lo, ASTExpr)
        self.obj, self.hi, self.lo = obj, hi, lo

    def __repr__(self):
        return f"ArraySlice({self.obj.__repr__()}, {self.hi.__repr__()}, {self.lo.__repr__()})"


class Var(ASTExpr):
    name: str

    def __init__(self, name: str):
        self.name = name

    def __repr__(self):
        return f"Var({self.name.__repr__()})"


class Update(ASTExpr):
    op: str
    a: ASTExpr
    b: ASTExpr

    def __init__(self, op: str, a: ASTExpr, b: ASTExpr):
        self.op, self.a, self.b = op, a, b

    def __repr__(self):
        return f"Update({self.op.__repr__()}, {self.a.__repr__()}, {self.b.__repr__()})"


class For(ASTStmt):
    init: ASTExpr
    cond: ASTExpr
    step: ASTExpr
    stmts: List[ASTStmt]

    def __init__(self, init: ASTExpr, cond: ASTExpr, step: ASTExpr, stmts: List[ASTStmt]):
        self.init, self.cond, self.step, self.stmts = init, cond, step, stmts

    def __repr__(self):
        return f"For({self.init.__repr__()}, {self.cond.__repr__()}, {self.step.__repr__()}, {self.stmts.__repr__()})"


class While(ASTStmt):
    cond: ASTExpr
    body: List[ASTStmt]

    def __init__(self, cond: ASTExpr, body: List[ASTStmt]):
        self.cond, self.body = cond, body

    def __repr__(self):
        return f"While({self.cond.__repr__()}, {self.body.__repr__()})"


class IfElseStmt(ASTStmt):
    cond: ASTExpr
    then: List[ASTStmt]
    otherwise: List[ASTStmt]

    def __init__(self, cond: ASTExpr, then: List[ASTStmt], otherwise: List[ASTStmt]):
        assert type(then) == list
        assert type(otherwise) == list
        self.cond, self.then, self.otherwise = cond, then, otherwise

    def __repr__(self):
        return f"IfElseStmt({self.cond.__repr__()}, {self.then.__repr__()}, {self.otherwise.__repr__()})"


class IfElseExpr(ASTExpr):
    cond: ASTExpr
    then: ASTExpr
    otherwise: ASTExpr

    def __init__(self, cond: ASTExpr, then: ASTExpr, otherwise: ASTExpr):
        self.cond, self.then, self.otherwise = cond, then, otherwise

    def __repr__(self):
        return f"IfElseExpr({self.cond.__repr__()}, {self.then.__repr__()}, {self.otherwise.__repr__()})"


class IfStmt(ASTStmt):
    cond: ASTExpr
    then: List[ASTStmt]

    def __init__(self, cond: ASTExpr, then: List[ASTStmt]):
        self.cond, self.then = cond, then

    def __repr__(self):
        return f"IfStmt({self.cond.__repr__()}, {self.then.__repr__()})"


class Call(ASTExpr):
    funcname: str
    args: List[ASTExpr]

    def __init__(self, funcname: str, args: List[ASTExpr]):
        self.funcname, self.args = funcname, args

    def __repr__(self):
        return f"Call({self.funcname.__repr__()}, {self.args.__repr__()})"


class BinaryExpr(ASTExpr):
    op: str
    a: ASTExpr
    b: ASTExpr

    def __init__(self, op: str, a: ASTExpr, b: ASTExpr):
        assert isinstance(a, ASTExpr)
        assert isinstance(b, ASTExpr)
        self.op, self.a, self.b = op, a, b

    def __repr__(self):
        return f"BinaryExpr({self.op.__repr__()}, {self.a.__repr__()}, {self.b.__repr__()})"


class UnaryExpr(ASTExpr):
    op: str
    a: ASTExpr

    def __init__(self, op: str, a: ASTExpr):
        assert isinstance(a, ASTExpr)
        self.op, self.a = op, a

    def __repr__(self):
        return f"UnaryExpr({self.op.__repr__()}, {self.a.__repr__()})"


class Declarator(ASTNode):
    pass


class VarDeclInit(Declarator):
    lhs: Var
    rhs: ASTExpr

    def __init__(self, lhs: Var, expr: ASTExpr):
        assert isinstance(lhs, Var)
        assert isinstance(expr, ASTExpr)
        self.lhs, self.rhs = lhs, expr

    def __repr__(self):
        return f"VarDeclInit({self.lhs.__repr__()}, {self.rhs.__repr__()})"


class VarDeclUndef(Declarator):
    lhs: Var

    def __init__(self, lhs: Var):
        self.lhs = lhs

    def __repr__(self):
        return f"VarDeclUndef({self.lhs.__repr__()})"


class VarsDecl(ASTStmt):
    init_list: List[Declarator]
    basetype: str

    def __init__(self, init_list: List[Declarator], basetype: str):
        self.init_list, self.basetype = init_list, basetype

    def __repr__(self):
        return f"VarsDecl({self.init_list.__repr__()}, {self.basetype.__repr__()})"


indentation = 0


class Annotator:
    def __init__(self, prefix: str = ""):
        self.prefix = prefix
        self.ID = 0

    def getID(self):
        self.ID += 1
        return self.prefix+str(self.ID-1)

    def AddID(self, sema: ASTNode):
        if isinstance(sema, list):
            for i in sema:
                self.AddID(i)
        else:
            sema.id = self.getID()
            for i in sema.__dict__.values():
                if isinstance(i, (ASTNode, List)):
                    self.AddID(i)


def getSemaAsString(sema):
    return "\n".join(emitSema(sema))


def emitSema(sema):
    global indentation
    if isinstance(sema, ASTExpr):
        return [' '*indentation+emitSemaRV(sema)+";"]
    if isinstance(sema, list):
        if len(sema) == 1:
            return emitSema(sema[0])
        if len(sema) == 0:
            return ["{}"]
        res = [' '*(indentation-4)+'{']
        for i in sema:
            res += emitSema(i)
        res += [' '*(indentation-4)+'}']
        return res
    elif isinstance(sema, VarDeclInit):
        return f'{emitSemaRV(sema.lhs)} = {emitSemaRV(sema.rhs)}'
    elif isinstance(sema, VarDeclUndef):
        return f'{emitSemaRV(sema.lhs)}'
    elif isinstance(sema, VarsDecl):
        return [' '*indentation+sema.basetype+' '+', '.join([emitSema(i) for i in sema.init_list])+';']
    elif isinstance(sema, For):
        res = [
            ' '*indentation +
            f'for({emitSemaRV(sema.init)};{emitSemaRV(sema.cond)};{emitSemaRV(sema.step)})',
        ]
        indentation += 4
        res += emitSema(sema.stmts)
        indentation -= 4
        return res
    elif isinstance(sema, While):
        res = [
            ' '*indentation +
            f'while ({emitSemaRV(sema.cond)})',
        ]
        indentation += 4
        res += emitSema(sema.body)
        indentation -= 4
        return res
    elif isinstance(sema, IfElseStmt):
        res = [
            ' '*indentation+f'if ({emitSemaRV(sema.cond)})'
        ]
        indentation += 4
        res += emitSema(sema.then)
        indentation -= 4
        res += [' '*indentation+f'else']
        indentation += 4
        res += emitSema(sema.otherwise)
        indentation -= 4
        return res
    elif isinstance(sema, IfStmt):
        res = [
            ' '*indentation+f'if ({emitSemaRV(sema.cond)})'
        ]
        indentation += 4
        res += emitSema(sema.then)
        indentation -= 4
        return res
    else:
        assert False, f'Unknown sema {sema}'


def emitSemaRV(sema):
    if isinstance(sema, ArrayIndex):
        return f'{emitSemaRV(sema.obj)}[{emitSemaRV(sema.index)}]'
    elif isinstance(sema, ArraySlice):
        return f'{emitSemaRV(sema.obj)}[{emitSemaRV(sema.hi)}:{emitSemaRV(sema.lo)}]'
    elif isinstance(sema, Var):
        return sema.name
    elif isinstance(sema, Number):
        return str(sema.val)
    elif isinstance(sema, Member):
        return emitSemaRV(sema.obj)+'.'+sema.field
    elif isinstance(sema, BinaryExpr):
        return f'({emitSemaRV(sema.a)} {sema.op} {emitSemaRV(sema.b)})'
    elif isinstance(sema, Update):
        return f'{emitSemaRV(sema.a)} {sema.op} {emitSemaRV(sema.b)}'
    elif isinstance(sema, UnaryExpr):
        return f'({sema.op} {emitSemaRV(sema.a)})'
    elif isinstance(sema, Call):
        return f'{sema.funcname}({", ".join([emitSemaRV(i) for i in sema.args])})'
    elif isinstance(sema, IfElseExpr):
        return f'({emitSemaRV(sema.cond)} ? {emitSemaRV(sema.then)} : {emitSemaRV(sema.otherwise)})'
    else:
        assert False, f'Unknown sema {sema}'