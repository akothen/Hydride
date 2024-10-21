from ARMTypes import *
from ARMAST import *
from ARMMeta import *
from ARMASTPrinter import getSemaAsString
DEBUG = False


def debug(*args, **kwargs):
    if DEBUG:
        print(*args, **kwargs)


class TypeInferencer:

    def __init__(self, func: ARMSema):
        self.inferedBits = {}
        self.endFlag = False
        self.func = func
        if "shift" in func.preparation:
            self.inferedBits["shift"] = 64

    def updateBits(self, name, bits):
        former = self.inferedBits.get(name, 0)
        assert bits < 1024
        self.inferedBits[name] = max(former, bits)
        debug(f'Infered {name} to {self.inferedBits[name]} bits')
        if self.inferedBits[name] != former:
            self.endFlag = False

    def visit(self, sema):
        def updateCommon(lhs, rhs, BW=0):
            debug(self.inferedBits)
            LBW = self.visitRV(lhs)
            RBW = self.visitRV(rhs)
            BW = max(BW, LBW, RBW)
            if BW:
                debug(
                    f'Downpressing {getSemaAsString(lhs)}:{LBW} and {getSemaAsString(rhs)}:{RBW} to {BW} bits')
                self.RVNeedsAtLeast(rhs, BW)
                self.LVNeedsAtLeast(lhs, BW)
        if isinstance(sema, list):
            res = []
            for s in sema:
                tmp = self.visit(s)
                if tmp:
                    if isinstance(tmp, list):
                        res += tmp
                    else:
                        res.append(tmp)
            assert None not in res
            return res
        elif isinstance(sema, VarsDecl):
            BW = self.visitRV(sema.basetype[1])
            for init in sema.init_list:
                if isinstance(init, VarDeclInit):
                    updateCommon(init.lhs, init.rhs, BW)

        elif isinstance(sema, For):
            self.visit(sema.stmts)
        elif isinstance(sema, Update):
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
        elif isinstance(sema, CaseBase):
            self.visit(sema.body)
        else:
            assert False, f'Unknown sema {sema}'
        return sema

    def LVNeedsAtLeast(self, sema, bits):
        if type(sema) == Var:
            self.updateBits(sema.name, bits)
        elif type(sema) == ElemSlice:
            # assert type(
            #     sema.esize) == Number and sema.esize.val >= bits, f'LVNeedsAtLeast {sema.esize.val} >= {bits}'
            pass

    def typeInt(self, sema: Call, bits):
        assert sema.funcname in ["Int", "SInt", "UInt"]
        if sema.funcname == "Int":
            if len(sema.args) == 2:
                sema.args.append(Number(bits))
            else:
                sema.args[2] = Number(max(bits, sema.args[2].val))
        else:
            if len(sema.args) == 1:
                sema.args.append(Number(bits))
            else:
                sema.args[1] = Number(max(bits, sema.args[1].val))

    def RVNeedsAtLeast(self, sema, bits):
        if type(sema) == Number:
            pass
        elif type(sema) == Var:
            self.updateBits(sema.name, bits)
        elif type(sema) == ElemSlice:
            self.LVNeedsAtLeast(sema.op, bits)
            # assert type(
            #     sema.esize) == Number and sema.esize.val >= bits, f'RVNeedsAtLeast {sema.esize.val} >= {bits} with {self.inferedBits}'
        elif isinstance(sema, VReg):
            pass
        elif isinstance(sema, VPartReg):
            pass
        elif isinstance(sema, ArrayIndex):
            self.RVNeedsAtLeast(sema.obj, bits)
            if len(sema.slices) == 1:
                self.RVNeedsAtLeast(sema.slices[0], bits)
        elif isinstance(sema, SliceRange):
            pass
            # hiv = self.visitNumber(sema.hi)
            # lov = self.visitNumber(sema.lo)
            # if hiv and lov:
            #     assert hiv-lov+1 >= bits
        # elif isinstance(sema, SatBinaryExpr):
        #     BW = max(self.visitRV(sema.satsize), bits)
        #     # if sema.op in ['<<']:
        #     #     self.RVNeedsAtLeast(sema.a, BW*2)
        #     #     self.RVNeedsAtLeast(sema.b, BW)
        #     # else:
        #     self.RVNeedsAtLeast(sema.a, BW*2)
        #     self.RVNeedsAtLeast(sema.b, BW*2)
        elif isinstance(sema, BinaryExpr):
            # if sema.op in ['<<']:
            #     self.RVNeedsAtLeast(sema.a, bits)
            #     self.RVNeedsAtLeast(sema.b, bits//2)
            # else:
            self.RVNeedsAtLeast(sema.a, bits)
            self.RVNeedsAtLeast(sema.b, bits)
        elif isinstance(sema, UnaryExpr):
            if sema.op in ['-']:
                self.RVNeedsAtLeast(sema.a, bits//2)
            else:
                self.RVNeedsAtLeast(sema.a, bits)
        elif isinstance(sema, Call):
            if sema.funcname in ["Min", "Max"]:
                self.RVNeedsAtLeast(sema.args[0], bits)
                self.RVNeedsAtLeast(sema.args[1], bits)
            if sema.funcname in ["Abs"]:
                self.RVNeedsAtLeast(sema.args[0], bits)
            if sema.funcname in ["SInt", "Int", "UInt"]:
                # self.RVNeedsAtLeast(sema.args[0], bits//2)
                self.typeInt(sema, bits)
            if sema.funcname in ["SatQ", "SignedSatQ", "UnsignedSatQ"]:
                assert type(sema.args[1]) is Number
                self.RVNeedsAtLeast(sema.args[0], sema.args[1].val)
        elif isinstance(sema, IfElseExpr):
            self.RVNeedsAtLeast(sema.otherwise, bits)
            self.RVNeedsAtLeast(sema.then, bits)
        else:
            assert False, breakpoint()

    def visitNumber(self, sema):
        if isinstance(sema, Number):
            return sema.val
        assert False, sema

    def rectify(self, val):
        bits = [8, 16, 32, 64]
        assert val >= 0
        for i in bits:
            if val < 2**i:
                return i
        assert False

    def rectifyBW(self, val):
        bits = [8, 16, 32, 64, 128]
        for i in bits:
            if val < i:
                return i
        assert False

    def visitRV(self, sema):

        if isinstance(sema, ArrayIndex):
            if len(sema.slices) == 1:
                return self.visitRV(sema.slices[0])
        elif isinstance(sema, ElemSlice):
            return self.visitNumber(sema.esize)
        elif isinstance(sema, VReg):
            pass
        elif isinstance(sema, VPartReg):
            pass
        elif isinstance(sema, SliceRange):
            hiv = self.visitNumber(sema.hi)
            if hiv:
                return self.rectifyBW(hiv)
        elif isinstance(sema, Var):
            return self.inferedBits.get(sema.name, 0)
        elif isinstance(sema, Number):
            return self.rectify(sema.val)
        elif isinstance(sema, BitVec):
            pass
        # elif isinstance(sema, SatBinaryExpr):
        #     BW = self.visitRV(sema.satsize)
        #     ABW = self.visitRV(sema.a)
        #     BBW = self.visitRV(sema.b)
        #     # if sema.op in ['<<']:
        #     #     return max(BW, ABW, BBW*2)//2
        #     return max(BW, ABW, BBW)//2
        elif isinstance(sema, BinaryExpr):
            ABW = self.visitRV(sema.a)
            BBW = self.visitRV(sema.b)
            # if sema.op in ['<<']:
            #     return max(ABW, BBW*2)
            return max(ABW, BBW)
        elif isinstance(sema, UnaryExpr):
            if sema.op in ['-']:
                if isinstance(sema.a, Var) and sema.a.name == 'shift':
                    pass
                else:
                    return self.visitRV(sema.a)*2
            return self.visitRV(sema.a)
        elif isinstance(sema, Call):
            if sema.funcname in ["Min", "Max"]:
                ABW = self.visitRV(sema.args[0])
                BBW = self.visitRV(sema.args[1])
                return max(ABW, BBW)
            if sema.funcname in ["SInt", "Int", "UInt"]:
                BW = self.visitRV(sema.args[0])*2
                self.typeInt(sema, BW)
                return BW
            if sema.funcname in ["SatQ", "SignedSatQ", "UnsignedSatQ"]:
                self.visitRV(sema.args[0])
                return self.visitRV(sema.args[1])
            if sema.funcname in ["Abs"]:
                return self.visitRV(sema.args[0])
        elif isinstance(sema, IfElseExpr):
            ABW = self.visitRV(sema.then)
            BBW = self.visitRV(sema.otherwise)
            return max(ABW, BBW)
        else:
            assert False, f'Unknown sema {sema}'
        return 0

    def go(self, sema):
        while not self.endFlag:
            self.endFlag = True
            self.visit(sema)
            # breakpoint()
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
            if sema.basetype[0] == "boolean":
                sema.basetype = ("bits", Number(1))
            if sema.basetype[0] == "integer":
                mx = 0
                for z in sema.init_list:
                    mx = max(mx, self.inferedBits[z.lhs.name])
                sema.basetype = ("bits", Number(mx))

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
    # interested = ["qshl", "qrshl", "rshr"]
    # interested = ["vaba_s16"]
    # interested = ["vabs"]
    for k, func in AllSema.items():
        if any(kk in k for kk in skip):
            continue
        if interested and not any(kk in k for kk in interested):
            continue
        k, assignment = extract_assignment_from_name(k)
        assert len(assignment) == 0
        # print(func.intrin, "\n".join(emitSema(func.spec)))
        # spec = ConstantReplacer(func, True, False, True).go(func.spec)
        spec = ConstantReplacer(func, True, True, True).go(func.spec)
        print(func.intrin, "\n".join(emitSema(func.spec)))
        # print(func.intrin, "\n".join(emitSema(spec)))
        spec = TypeInferencer(func).go(spec)
        # print(func.intrin, "\n".join(emitSema(spec)))
        # spec = SaturationReplacer().go(spec)
        # print(func.intrin, "\n".join(emitSema(spec)))
        # spec = ConstantReplacer(func, True, True).go(spec)
        print("-"*50)
        print("\n".join(emitSema(spec)))
        print("="*50)
        print()


if __name__ == "__main__":
    # DEBUG = True
    test()
