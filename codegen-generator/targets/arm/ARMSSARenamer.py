from ARMTypes import *
from ARMAST import *
from ARMMeta import *


class SSARenamer:
    '''If a variable defined twice, rename the second one to a new name.
    '''

    def __init__(self):
        self.var_cnt: Dict[str, int] = {}
        self.var_map: Dict[str, str] = {}

    def encodeName(self, name, cnt):
        return f'{name}_{cnt}'

    def Def(self, name):
        if name not in self.var_cnt:
            self.var_cnt[name] = 0
            self.var_map[name] = name
        else:
            self.var_map[name] = self.encodeName(name, self.var_cnt[name])
            self.var_cnt[name] += 1
        return self.var_map[name]

    def Use(self, name):
        return self.var_map.get(name, name)

    def visit(self, sema):
        def updateCommon(lhs, rhs):
            self.visitRV(rhs)
            self.visitLV(lhs)

        if isinstance(sema, list):
            for s in sema:
                self.visit(s)
        elif isinstance(sema, VarsDecl):
            self.visitRV(sema.basetype[1])
            self.visit(sema.init_list)
        elif isinstance(sema, For):
            self.visitLV(sema.iterator)
            self.visitRV(sema.begin)
            self.visitRV(sema.end)
            self.visit(sema.stmts)
        elif isinstance(sema, (Update, VarDeclInit)):
            updateCommon(sema.lhs, sema.rhs)
        elif isinstance(sema, IfElseStmt):
            self.visitRV(sema.cond)
            self.visit(sema.then)
            self.visit(sema.otherwise)
        elif isinstance(sema, IfStmt):
            self.visitRV(sema.cond)
            self.visit(sema.then)
        elif isinstance(sema, Match):
            self.visitRV(sema.val)
            self.visit(sema.cases)
        elif isinstance(sema, Case):
            self.visitRV(sema.val)
            self.visit(sema.body)
        elif isinstance(sema, Undefined):
            pass
        elif isinstance(sema, VarDeclUndef):
            pass
        elif isinstance(sema, CaseBase):
            self.visit(sema.body)
        else:
            assert False, f'Unknown sema {sema}'

    def visitLV(self, sema):
        if isinstance(sema, Var):
            self.Def(sema.name)
        elif isinstance(sema, (ElemSlice, VReg, VPartReg)):
            pass
        else:
            assert False, f'Unknown sema {sema}'

    def visitRV(self, sema):
        if isinstance(sema, list):
            for z in sema:
                self.visitRV(z)
        elif isinstance(sema, ArrayIndex):
            self.visitRV(sema.slices)
        elif isinstance(sema, ElemSlice):
            self.visitRV(sema.op)
            self.visitRV(sema.cnt)
            self.visitRV(sema.esize)
        elif isinstance(sema, VReg):
            pass
        elif isinstance(sema, VPartReg):
            pass
        elif isinstance(sema, SliceRange):
            self.visitRV(sema.hi)
            self.visitRV(sema.lo)
        elif isinstance(sema, Var):
            sema.name = self.Use(sema.name)
        elif isinstance(sema, Number):
            pass
        elif isinstance(sema, BitVec):
            pass
        elif isinstance(sema, BinaryExpr):
            self.visitRV(sema.a)
            self.visitRV(sema.b)
        elif isinstance(sema, UnaryExpr):
            self.visitRV(sema.a)
        elif isinstance(sema, Call):
            self.visitRV(sema.args)
        elif isinstance(sema, IfElseExpr):
            self.visitRV(sema.cond)
            self.visitRV(sema.then)
            self.visitRV(sema.otherwise)
        else:
            assert False, f'Unknown sema {sema}'
        return 0

    def go(self, sema):
        self.visit(sema)
        return self.replaceResult(sema)

    def replaceResult(self, sema):
        if isinstance(sema, list):
            res = []
            for s in sema:
                tmp = self.replaceResult(s)
                if tmp:
                    if isinstance(tmp, list):
                        res += tmp
                    else:
                        res.append(tmp)
            return res
        elif isinstance(sema, VarsDecl):
            new_list = []
            for z in sema.init_list:
                if z.lhs.name in self.var_cnt:
                    for i in range(self.var_cnt[z.lhs.name]):
                        new_list.append(VarDeclUndef(
                            Var(self.encodeName(z.lhs.name, i), z.lhs.id+f'_derived{i}'), z.id + f'_derived{i}'))
            sema.init_list += new_list
        elif isinstance(sema, For):
            sema.stmts = self.replaceResult(sema.stmts)
        elif isinstance(sema, Update):
            pass
        elif isinstance(sema, IfElseStmt):
            sema.then = self.replaceResult(sema.then)
            sema.otherwise = self.replaceResult(sema.otherwise)
        elif isinstance(sema, IfStmt):
            sema.then = self.replaceResult(sema.then)
        elif isinstance(sema, Match):
            sema.cases = self.replaceResult(sema.cases)
        elif isinstance(sema, Case):
            sema.body = self.replaceResult(sema.body)
        elif isinstance(sema, Undefined):
            pass
        elif isinstance(sema, CaseBase):
            sema.body = self.replaceResult(sema.body)
        else:
            assert False, f'Unknown sema {sema}'
        return sema


def test():
    from ARMSemanticGen import SemaGenerator
    from ARMParser import emitSema
    from ARMConstantReplacer import ConstantReplacer
    from ARMSatTransform import SaturationReplacer
    AllSema = SemaGenerator(deserialize=True).getResult()
    skip = memory_ops
    interested = []
    interested = ["vaddhn_high_s16"]
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        if interested and not any(kk in k for kk in interested):
            continue
        k, assignment = extract_assignment_from_name(k)
        assert len(assignment) == 0
        print(func.intrin)
        print("\n".join(emitSema(func.spec)))
        spec = SSARenamer().go(func.spec)
        print("\n".join(emitSema(spec)))


if __name__ == "__main__":
    test()
