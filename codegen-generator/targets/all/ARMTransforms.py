from ARMAST import *


class SaturationReplacer:
    satMode = False

    def __init__(self):
        pass

    def run(self, sema):
        global indentation
        if isinstance(sema, list):
            for s in sema:
                self.run(s)
        if isinstance(sema, VarDeclInit):
            self.run(sema.decl)
            self.run(sema.expr)
        elif isinstance(sema, VarsDecl):
            self.run(sema.ids)
            if sema.basetype[0]:
                self.run(sema.basetype[0])
        elif isinstance(sema, For):
            self.runRV(sema.iterator)
            self.runRV(sema.begin)
            self.runRV(sema.end)
            self.run(sema.stmts)
        elif isinstance(sema, Update):
            self.run(sema.lhs)
            self.runRV(sema.rhs)
        elif isinstance(sema, IfElse):
            self.runRV(sema.cond)
            self.run(sema.then)
            self.run(sema.otherwise)
        elif isinstance(sema, If):
            self.runRV(sema.cond)
            self.run(sema.then)
        elif isinstance(sema, Match):
            self.runRV(sema.val)
            self.run(sema.cases)
        elif isinstance(sema, Case):
            self.runRV(sema.val)
            self.run(sema.body)
        elif isinstance(sema, Undefined):
            pass
        elif isinstance(sema, CaseBase):
            self.run(sema.body)
        else:
            assert False, f'Unknown sema {sema}'

    def runRV(self, sema):
        if isinstance(sema, ArrayIndex):
            return f'{emitSemaRV(sema.obj)}[{",".join([emitSemaRV(i) for i in sema.slices])}]'
        if isinstance(sema, SliceRange):
            return f'{emitSemaRV(sema.lo)}~{emitSemaRV(sema.hi)}'
        elif isinstance(sema, Var):
            return sema.name
        elif isinstance(sema, Number):
            return str(sema.val)
        elif isinstance(sema, BitVec):
            return "'"+sema.bv+"'"
        elif isinstance(sema, BinaryExpr):
            return f'({emitSemaRV(sema.a)} {sema.op} {emitSemaRV(sema.b)})'
        elif isinstance(sema, UnaryExpr):
            return f'({sema.op} {emitSemaRV(sema.a)})'
        elif isinstance(sema, Call):
            return f'{sema.funcname}({", ".join([emitSemaRV(i) for i in sema.args])})'
        elif isinstance(sema, IfElse):
            return f'({emitSemaRV(sema.then)} if {emitSemaRV(sema.cond)} else {emitSemaRV(sema.otherwise)})'
        else:
            assert False, f'Unknown sema {sema}'
