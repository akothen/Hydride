from asl.ARMParser import get_parser
from asl.ARMAST import Instruction
from ARMIntrinsics import *
from ARMTypes import *
from ARMAST import *
import json


def LowestSetBit(x: str):
    N = len(x)
    for i in range(N):
        if x[N-i-1] == '1':
            return i
    return N


class DecodeContext:
    undefined = None
    symbolnotfound = None

    def __init__(self, fields):
        self.fields = fields
        self.result = {}

    def EQ(self, a, b):
        return a == b

    def symtable(self):
        # print(self.fields, self.result)
        return dict(self.fields, **self.result)

    def lookup(self, name):
        Z = self.symtable()
        if name not in Z:
            raise LookupError(f"Symbol {name} not found")
        return self.symtable()[name]

    def walkConstExprLV(self, AST: ASTNode):
        if isinstance(AST, Var):
            if AST.name.startswith("R"):
                assert False
            else:
                return AST.name
        else:
            print(AST)
            assert False

    def walkConstExprRV(self, AST: ASTNode):
        if isinstance(AST, Var):
            if AST.name.startswith("R"):
                return '00000'  # We just don't care about register
            else:
                return self.lookup(AST.name)
        elif isinstance(AST, Call):
            if AST.funcname == "UInt":
                return int(self.walkConstExprRV(AST.args[0]), 2)
            elif AST.funcname.startswith("Have"):
                return True
            elif AST.funcname == "LowestSetBit":
                return LowestSetBit(self.walkConstExprRV(AST.args[0]))
            print(AST)
            assert False
        elif isinstance(AST, BitVec):
            return AST.bv
        elif isinstance(AST, ArraySlice):
            obj = self.walkConstExprRV(AST.bv)
            assert type(obj) == str
            sliceRV = [self.walkConstExprRV(i) for i in AST.slices]
            wid = len(obj)
            print(AST)
            if len(sliceRV) == 1:
                return obj[wid-sliceRV[0]-1]
            if len(sliceRV) == 2:
                return obj[wid-sliceRV[0]-1:wid-sliceRV[1]]
            assert False
        elif isinstance(AST, Number):
            return AST.val
        elif isinstance(AST, IfElse):
            cond = self.walkConstExprRV(AST.cond)
            assert type(cond) == bool
            if cond:
                return self.walkConstExprRV(AST.then)
            else:
                return self.walkConstExprRV(AST.otherwise)
        elif isinstance(AST, UnaryExpr):
            a = self.walkConstExprRV(AST.a)
            if AST.op == "!":
                assert type(a) == bool
                return not a
            else:
                print(AST)
                assert False
        elif isinstance(AST, BinaryExpr):
            a = self.walkConstExprRV(AST.a)
            b = self.walkConstExprRV(AST.b)
            if AST.op == "<<":
                assert type(a) == int and type(b) == int
                return a << b
            elif AST.op == ">>":
                assert type(a) == int and type(b) == int
                return a >> b
            elif AST.op == "|":
                assert type(a) == bool and type(b) == bool
                return a | b
            elif AST.op == "&":
                assert type(a) == bool and type(b) == bool
                return a & b
            elif AST.op == "^":
                return a ^ b
            elif AST.op == "+":
                assert type(a) == int and type(b) == int
                return a + b
            elif AST.op == "-":
                assert type(a) == int and type(b) == int
                return a - b
            elif AST.op == "*":
                assert type(a) == int and type(b) == int
                return a*b
            elif AST.op == "DIV":
                assert type(a) == int and type(b) == int
                assert a % b == 0
                return a//b
            elif AST.op == ":":
                assert type(a) == str and type(b) == str
                return a+b
            elif AST.op == ">":
                assert type(a) == int and type(b) == int
                return a > b
            elif AST.op == "==":
                assert type(a) == type(b)
                if type(a) == str:
                    assert 'x' not in a and 'x' not in b
                return self.EQ(a, b)
            elif AST.op == "!=":
                assert type(a) == type(b)
                if type(a) == str:
                    assert 'x' not in a and 'x' not in b
                return not self.EQ(a, b)
            else:
                print(AST)
                assert False
        else:
            print(AST)
            assert False

    def walkConstExprStmt(self, AST: ASTNode):
        if isinstance(AST, list):
            for i in AST:
                self.walkConstExprStmt(i)
        elif isinstance(AST, VarDeclInit):
            self.result[self.walkConstExprLV(
                AST.decl.ids[0])] = self.walkConstExprRV(AST.expr)
        elif isinstance(AST, If):
            if self.walkConstExprRV(AST.cond):
                self.walkConstExprStmt(AST.then)
        elif isinstance(AST, Undefiend):
            raise NotImplementedError("Such field reaches undefined")
        elif isinstance(AST, VarsDecl):
            pass
        elif isinstance(AST, Match):
            for c in AST.cases:
                if isinstance(c, Case):  # not default
                    print(c)
                    if len(c.val) == 1:
                        if self.EQ(AST.val, self.walkConstExprRV(c.val[0])):
                            self.walkConstExprStmt(c.body)
                            break
                    else:
                        assert False
                else:
                    self.walkConstExprStmt(c.body)
                    break
        else:
            print(AST)
            assert False

    def walk(self, AST: ASTNode):
        try:
            return self.walkConstExprStmt(AST)
        except LookupError as e:
            self.symbolnotfound = e
            return {}
        except NotImplementedError as e:
            self.undefined = e
            return {}


def genPossibleOpcode(fields):
    qwq = [fields]
    for i, v in fields.items():
        if i.startswith('R'):
            continue
        if 'x' in v:
            # print(fields[i])
            # assert fields[i] == 'x'*len(fields[i])
            ln = fields[i].count('x')
            nqwq = []
            zz = fields[i]
            for z in range(2**ln):
                z = bin(z)[2:]
                z = '0'*(ln-len(z)) + z
                zz = fields[i]
                for j in z:
                    zz = zz.replace('x', j, 1)
                nqwq = nqwq + [dict(q, **{i: zz})for q in qwq]
            qwq = nqwq
    return qwq


print("loading...")
with open("intr.json", 'r') as fi:
    I = json.load(fi)
with open("asl/arm_instrs.sexpr") as f:
    data = f.read()
parser = get_parser()
print("parsing...")
Instrs: List[Instruction] = parser.parse(data)
print("parse done...")


def genAllSema():
    zzzz = set(EncodingFields.keys())
    map2AST = {}
    for i in Instrs:
        for j in i.instEncodings:
            if j.encName in zzzz:
                map2AST[j.encName] = ((i.instExecute),
                                      ASTShrink(j.encDecode))
    assert len(map2AST) == len(zzzz)
    print("map2AST done...")
    for encodings, f in EncodingFields.items():
        # print(encodings)
        if encodings == "aarch64_vector_logical":
            continue
        print(encodings, f[1])
        opcd = genPossibleOpcode(f[1])
        for i in opcd:
            D = DecodeContext(i)
            # print(encodings, i)
            D.walk(map2AST[encodings][1])
            if D.undefined:
                pass
                # print(i, 'undefined')
            elif D.symbolnotfound:
                print(encodings, D.symbolnotfound)
                # print(i, 'symbolnotfound')
            else:
                pass
                # print(i, D.result)
    # TODO: sema


if __name__ == "__main__":

    genAllSema()
