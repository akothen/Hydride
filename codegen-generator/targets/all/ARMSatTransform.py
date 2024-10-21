from ARMTypes import *
from ARMAST import *
from ARMMeta import *

DEBUG = False


def debug(self, *args, **kwargs):
    if DEBUG:
        print(*args, **kwargs)


class SaturationReplacer:

    def __init__(self):
        self.consumedBySat: Dict[str, Tuple[bool, int]] = {}
        self.satmode: Tuple[ASTNode, ASTNode] = None  # esize, unsigned
        self.endFlag: bool = False
        self.finalReplace: bool = False

    def visit(self, sema):
        def updateCommon(lhs, rhs):
            LHSsat = [x for x in self.visitLV(
                lhs) if x in self.consumedBySat]
            if len(LHSsat) == 0:
                rhs = self.visitRV(rhs)
            elif len(LHSsat) == 1:
                debug("Found", LHSsat, "on LHS")
                debug("Satmode for", sema)
                self.satmode = self.consumedBySat[LHSsat[0]]
                rhs = self.visitRV(rhs)
                self.satmode = None
                debug("Remove satmode for", sema)
            else:
                assert False,  f'Invalid LHS {LHSsat}'
            return (lhs, rhs)

        if isinstance(sema, list):
            for i, s in enumerate(sema):
                sema[i] = self.visit(s)
        elif isinstance(sema, VarDeclInit):
            (sema.lhs, sema.rhs) = updateCommon(sema.lhs, sema.rhs)
        elif isinstance(sema, VarDeclUndef):
            pass
        elif isinstance(sema, VarsDecl):
            # TODO: sema.basetype
            sema.init_list = self.visit(sema.init_list)
        elif isinstance(sema, For):
            sema.iterator = self.visitRV(sema.iterator)
            sema.begin = self.visitRV(sema.begin)
            sema.end = self.visitRV(sema.end)
            sema.stmts = self.visit(sema.stmts)
        elif isinstance(sema, Update):
            (sema.lhs, sema.rhs) = updateCommon(sema.lhs, sema.rhs)
        elif isinstance(sema, IfElseStmt):
            sema.cond = self.visitRV(sema.cond)
            sema.then = self.visit(sema.then)
            sema.otherwise = self.visit(sema.otherwise)
        elif isinstance(sema, IfStmt):
            sema.cond = self.visitRV(sema.cond)
            sema.then = self.visit(sema.then)
        elif isinstance(sema, Match):
            sema.val = self.visitRV(sema.val)
            sema.cases = self.visit(sema.cases)
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

    def visitLV(self, sema):
        if isinstance(sema, list):
            res = []
            for s in sema:
                res += self.visitLV(s)
            return res
        elif isinstance(sema, ElemSlice):
            sema.cnt = self.visitRV(sema.cnt)
            sema.esize = self.visitRV(sema.esize)
            return self.visitLV(sema.op)
        elif isinstance(sema, ArrayIndex):
            sema.slices = self.visitRV(sema.slices)
            return self.visitLV(sema.obj)
        elif isinstance(sema, VReg):
            sema.reg = self.visitRV(sema.reg)
            return []
        elif isinstance(sema, VPartReg):
            sema.reg = self.visitRV(sema.reg)
            sema.part = self.visitRV(sema.part)
            return []
        elif isinstance(sema, SliceRange):
            sema.lo = self.visitRV(sema.lo)
            sema.hi = self.visitLV(sema.hi)
        elif isinstance(sema, Var):
            return [sema.name]
        else:
            assert False, f'Unknown sema {sema}'

    def visitRV(self, sema):
        if isinstance(sema, list):
            for i, s in enumerate(sema):
                sema[i] = self.visitRV(s)
        elif isinstance(sema, ArrayIndex):
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
            if self.satmode is not None:
                # debug(sema.name, "is consumed by", self.satmode)
                if sema.name not in self.consumedBySat:
                    self.endFlag = False
                self.consumedBySat[sema.name] = self.satmode
        elif isinstance(sema, Number):
            pass
        elif isinstance(sema, BitVec):
            pass
        elif isinstance(sema, SatBinaryExpr):
            pass
        elif isinstance(sema, BinaryExpr):
            # TODO: sema.op

            if self.satmode is not None:
                if sema.op in ['+', '-', '*']:
                    sema.a = self.visitRV(sema.a)
                    sema.b = self.visitRV(sema.b)
                    self.endFlag = False
                    debug("a1")
                    return SatBinaryExpr.createFromBinOp(sema, self.satmode)
                if sema.op in ['<<', '>>']:  # safe at some degree
                    sema.a = self.visitRV(sema.a)
                    self.endFlag = False
                    debug("a2")
                    return SatBinaryExpr.createFromBinOp(sema, self.satmode)
                else:
                    assert self.checkConstant(
                        sema), f'Unknown variable sat leaf {sema}'
            else:
                sema.a = self.visitRV(sema.a)
                sema.b = self.visitRV(sema.b)
        elif isinstance(sema, UnaryExpr):
            sema.a = self.visitRV(sema.a)
            if self.satmode is not None:
                assert sema.op == '-'
                return SatBinaryExpr('-', Number(0),  sema.a, self.satmode[0], self.satmode[1], sema.id)
        elif isinstance(sema, Call):
            # TODO: sema.funcname

            if sema.funcname == "SignedSatQ":
                self.satmode = (sema.args[1], Number(0))
                tmp = self.visitRV(sema.args[0])
                self.satmode = None
                return tmp
            elif sema.funcname == "UnsignedSatQ":
                self.satmode = (sema.args[1], Number(1))
                tmp = self.visitRV(sema.args[0])
                self.satmode = None
                return tmp
            elif sema.funcname == "SatQ":
                self.satmode = (sema.args[1], sema.args[2])
                tmp = self.visitRV(sema.args[0])
                self.satmode = None
                return tmp
            elif sema.funcname in ['Int', "SInt", "UInt"]:
                pass  # assume they are not consumer of any sat
            elif sema.funcname in ['Abs']:
                if self.satmode:
                    sema.funcname = 'AbsQ'
                    sema.satmode = self.satmode
            elif sema.funcname in ['AbsQ']:
                if self.finalReplace:
                    sema.funcname = 'Abs'
                    return Call('SatQ', [sema, sema.satmode[0], sema.satmode[1]], sema.id+".derive")
            else:
                sema.args = self.visitRV(sema.args)
        elif isinstance(sema, IfElseExpr):
            sema.then = self.visitRV(sema.then)
            sema.cond = self.visitRV(sema.cond)
            sema.otherwise = self.visitRV(sema.otherwise)
        else:
            assert False, f'Unknown sema {sema}'
        return sema

    def go(self, sema):
        while not self.endFlag:
            self.endFlag = True
            sema = self.visit(sema)
        self.finalReplace = True
        return self.visit(sema)


def test():
    from ARMSemanticGen import SemaGenerator
    from ARMParser import emitSema
    AllSema = SemaGenerator(deserialize=True).getResult()
    skip = memory_ops
    interested = []
    interested = ["vabdl_s32"]
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        if interested and not any(kk in k for kk in interested):
            continue
        k, assignment = extract_assignment_from_name(k)
        assert len(assignment) == 0
        print(func.intrin)
        print("\n".join(emitSema(func.spec)))
        spec = SaturationReplacer().go(func.spec)
        print("\n".join(emitSema(spec)))


if __name__ == "__main__":
    test()
