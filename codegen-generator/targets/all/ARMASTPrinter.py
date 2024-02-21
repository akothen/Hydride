from ARMAST import *
indentation = 0


def emitType(basetype):
    if basetype[0] == "bits":
        return f'bits('+emitSemaRV(basetype[1])+')'

    if basetype[0] in asl_type_bits:
        return f'{basetype[0]}'
    assert False, f'Unknown type {basetype}'


def getSemaAsString(sema):
    if isinstance(sema, (list, ASTStmt)):
        return "\n".join(emitSema(sema))
    if isinstance(sema, ASTExpr):
        return emitSemaRV(sema)
    return "?"


def emitSema(sema):
    global indentation
    if isinstance(sema, list):
        res = [' '*(indentation-4)+'{']
        for i in sema:
            res += emitSema(i)
        res += [' '*(indentation-4)+'}']
        return res
    if isinstance(sema, VarDeclInit):
        return f'{emitSemaRV(sema.lhs)} = {emitSemaRV(sema.rhs)}'
    if isinstance(sema, VarDeclUndef):
        return f'{emitSemaRV(sema.lhs)}'
    # elif isinstance(sema, IfElse):
    #     return [' '*indentation+f'({emitSema(sema.cond)} ? {emitSema(sema.cond)} : {emitSema(sema.otherwise)})']
    elif isinstance(sema, VarsDecl):
        return [' '*indentation+emitType(sema.basetype)+' '+', '.join([emitSema(i) for i in sema.init_list])+';']
    elif isinstance(sema, For):
        res = [
            ' '*indentation +
            f'for {emitSemaRV(sema.iterator)} = {emitSemaRV(sema.begin)} to {emitSemaRV(sema.end)}',
        ]
        indentation += 4
        res += emitSema(sema.stmts)
        indentation -= 4
        return res
    elif isinstance(sema, Update):
        return [' '*indentation+f'{emitSemaRV(sema.lhs)} = {emitSemaRV(sema.rhs)};']
    elif isinstance(sema, IfElseStmt):
        res = [
            ' '*indentation+f'if {emitSemaRV(sema.cond)} then'
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
            ' '*indentation+f'if {emitSemaRV(sema.cond)} then'
        ]
        indentation += 4
        res += emitSema(sema.then)
        indentation -= 4
        return res
    elif isinstance(sema, Match):
        res = [
            ' '*indentation+'case '+emitSemaRV(sema.val)+' of'
        ]
        indentation += 4
        res += emitSema(sema.cases)
        indentation -= 4
        return res
    elif isinstance(sema, Case):
        res = [
            ' '*indentation+'when '+emitSemaRV(sema.val)+' of'
        ]
        indentation += 4
        res += emitSema(sema.body)
        indentation -= 4
        return res
    elif isinstance(sema, Undefined):
        return [' '*indentation+f'UNDEFINED']
    elif isinstance(sema, CaseBase):
        res = [
            ' '*indentation+f'otherwise'
        ]
        indentation += 4
        res += emitSema(sema.body)
        indentation -= 4
        return res
    else:
        assert False, f'Unknown sema {sema}'


def emitSemaRV(sema):
    if isinstance(sema, ArrayIndex):
        return f'{emitSemaRV(sema.obj)}[{", ".join([emitSemaRV(i) for i in sema.slices])}]'
    if isinstance(sema, VPartReg):
        return f'Vpart[{emitSemaRV(sema.reg)}, {emitSemaRV(sema.part)}]'
    if isinstance(sema, VReg):
        return f'V[{emitSemaRV(sema.reg)}]'
    if isinstance(sema, ElemSlice):
        return f'Elem[{emitSemaRV(sema.op)}, {emitSemaRV(sema.cnt)}, {emitSemaRV(sema.esize)}]'
    if isinstance(sema, SliceRange):
        return f'{emitSemaRV(sema.lo)}~{emitSemaRV(sema.hi)}'
    elif isinstance(sema, Var):
        return sema.name
    elif isinstance(sema, Number):
        return str(sema.val)
    elif isinstance(sema, BitVec):
        return "'"+sema.bv+"'"
    elif isinstance(sema, SatBinaryExpr):
        # {{{sema.satsize,sema.unsigned}}}
        return f'({emitSemaRV(sema.a)} {sema.op}Q {emitSemaRV(sema.b)})'
    elif isinstance(sema, BinaryExpr):
        return f'({emitSemaRV(sema.a)} {sema.op} {emitSemaRV(sema.b)})'
    elif isinstance(sema, UnaryExpr):
        return f'({sema.op} {emitSemaRV(sema.a)})'
    elif isinstance(sema, Call):
        return f'{sema.funcname}({", ".join([emitSemaRV(i) for i in sema.args])})'
    elif isinstance(sema, IfElseExpr):
        return f'({emitSemaRV(sema.then)} if {emitSemaRV(sema.cond)} else {emitSemaRV(sema.otherwise)})'
    else:
        assert False, f'Unknown sema {sema}'
