from ARMTypes import *
from ARMAST import *
from ARMMeta import *


class ConstantReplacer:

    def __init__(self, func: ARMSema, FoldExpr=False, FoldBranch=False, Strip07=False):
        self.resolving = func.resolving
        self.foldExpr = FoldExpr
        self.foldBranch = FoldBranch
        self.strip07 = Strip07

    def visit(self, sema):
        if isinstance(sema, list):
            res = []
            for s in sema:
                tmp = self.visit(s)
                if tmp:
                    if isinstance(tmp, list):
                        res += tmp
                    else:
                        res.append(tmp)
            return res
        elif isinstance(sema, VarDeclInit):
            sema.lhs = self.visitRV(sema.lhs)
            sema.rhs = self.visitRV(sema.rhs)
            # if type(sema.lhs) == Var and type(sema.rhs) == Number:
            #     self.resolving[sema.lhs.name] = sema.rhs.val
        elif isinstance(sema, VarDeclUndef):
            pass
        elif isinstance(sema, VarsDecl):
            if sema.basetype[0] == "bits":
                sema.basetype = (
                    sema.basetype[0], self.visitRV(sema.basetype[1]))
            sema.init_list = self.visit(sema.init_list)
        elif isinstance(sema, For):
            sema.iterator = self.visitRV(sema.iterator)
            sema.begin = self.visitRV(sema.begin)
            sema.end = self.visitRV(sema.end)
            sema.stmts = self.visit(sema.stmts)
        elif isinstance(sema, Update):
            sema.lhs = self.visitRV(sema.lhs)
            sema.rhs = self.visitRV(sema.rhs)
            # if type(sema.lhs) == Var and type(sema.rhs) == Number:
            #     self.resolving[sema.lhs.name] = sema.rhs.val
        elif isinstance(sema, IfElseStmt):
            sema.cond = self.visitRV(sema.cond)
            sema.then = self.visit(sema.then)
            sema.otherwise = self.visit(sema.otherwise)
            if self.foldBranch and type(sema.cond) == Number:
                return sema.then if sema.cond.val else sema.otherwise
        elif isinstance(sema, IfStmt):
            sema.cond = self.visitRV(sema.cond)
            sema.then = self.visit(sema.then)
            if self.foldBranch and type(sema.cond) == Number:
                return sema.then if sema.cond.val else None
        elif isinstance(sema, Match):
            sema.val = self.visitRV(sema.val)
            sema.cases = self.visit(sema.cases)
            if self.foldBranch and type(sema.val) == Number:
                for case in sema.cases:
                    if type(case) == Case:
                        if type(case.val) == Number and case.val.val == sema.val.val:
                            return self.visit(case.body)
                    elif type(case) == CaseBase:
                        return self.visit(case.body)
                    else:
                        assert False, f'Unknown case {case}'
        elif isinstance(sema, Case):
            sema.val = self.visitRV(sema.val)
            sema.body = self.visit(sema.body)
        elif isinstance(sema, Undefined):
            pass
        elif isinstance(sema, CaseBase):
            sema.body = self.visit(sema.body)
        else:
            assert False, f'Unknown sema {sema}'
        return sema

    def visitRV(self, sema):
        if isinstance(sema, list):
            for i, s in enumerate(sema):
                sema[i] = self.visitRV(s)
        elif isinstance(sema, ArrayIndex):
            if len(sema.slices) == 1 and isinstance(sema.slices[0], SliceRange) and self.strip07:
                # Patch for striping <7:0> on `vshl`s
                qvq = sema.slices[0]
                if qvq.lo == Number(0) and qvq.hi == Number(7):
                    return self.visitRV(sema.obj)
            sema.obj = self.visitRV(sema.obj)
            sema.slices = self.visitRV(sema.slices)
        elif isinstance(sema, ElemSlice):
            sema.op = self.visitRV(sema.op)
            sema.cnt = self.visitRV(sema.cnt)
            sema.esize = self.visitRV(sema.esize)
        elif isinstance(sema, VReg):
            sema.reg = self.visitRV(sema.reg)
        elif isinstance(sema, VPartReg):
            sema.reg = self.visitRV(sema.reg)
            sema.part = self.visitRV(sema.part)
        elif isinstance(sema, SliceRange):
            sema.lo = self.visitRV(sema.lo)
            sema.hi = self.visitRV(sema.hi)
        elif isinstance(sema, Var):
            if sema.name in self.resolving and self.foldExpr:
                assert type(self.resolving[sema.name]) in [
                    int, bool], self.resolving[sema.name]
                return Number(int(self.resolving[sema.name]))
        elif isinstance(sema, Number):
            pass
        elif isinstance(sema, BitVec):
            pass
        elif isinstance(sema, BinaryExpr):
            sema.a = self.visitRV(sema.a)
            sema.b = self.visitRV(sema.b)
            if type(sema.a) == Number and type(sema.b) == Number:
                if self.foldExpr:
                    qwq = {"DIV": "//"}
                    op = qwq.get(sema.op, sema.op)
                    return Number(eval(f'{sema.a.val} {op} {sema.b.val}'))
                elif sema.op in ['*']:
                    return Number(eval(f'{sema.a.val} {sema.op} {sema.b.val}'))
            if self.foldExpr:
                return self.constantFold(sema)
        elif isinstance(sema, UnaryExpr):
            sema.a = self.visitRV(sema.a)
            if self.foldExpr and type(sema.a) == Number:
                qwq = {"!": "not"}
                op = qwq.get(sema.op, sema.op)
                return Number(int(eval(f'{op} {sema.a.val}')))
        elif isinstance(sema, Call):
            sema.args = self.visitRV(sema.args)
        elif isinstance(sema, IfElseExpr):
            sema.cond = self.visitRV(sema.cond)
            sema.then = self.visitRV(sema.then)
            sema.otherwise = self.visitRV(sema.otherwise)
            if self.foldExpr and type(sema.cond) == Number:
                return sema.then if sema.cond.val else sema.otherwise
        else:
            assert False, f'Unknown sema {sema}'
        return sema

    def constantFold(self, sema: ASTExpr):
        if isinstance(sema, BinaryExpr):
            if sema.op in ['+']:
                if sema.a == Number(0):
                    return self.constantFold(sema.b)
                elif sema.b == Number(0):
                    return self.constantFold(sema.a)
            if sema.op in ['-', '>>', '<<']:
                if sema.b == Number(0):
                    return self.constantFold(sema.a)
            if sema.op in ['*']:
                if sema.a == Number(0) or sema.b == Number(0):
                    return Number(0)
                elif sema.a == Number(1):
                    return self.constantFold(sema.b)
                elif sema.b == Number(1):
                    return self.constantFold(sema.a)
        return sema

    def go(self, sema):
        return self.visit(sema)


def test():
    from ARMSemanticGen import SemaGenerator
    from ARMParser import emitSema
    AllSema = SemaGenerator(deserialize=True).getResult()
    skip = memory_ops
    interested = []
    interested = ["vdup_n_s16"]
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        if interested and not any(kk in k for kk in interested):
            continue
        k, assignment = extract_assignment_from_name(k)
        assert len(assignment) == 0
        print(func)
        print("\n".join(emitSema(func.spec)))
        spec = ConstantReplacer(func).go(func.spec)
        print("\n".join(emitSema(spec)))


if __name__ == "__main__":
    test()
