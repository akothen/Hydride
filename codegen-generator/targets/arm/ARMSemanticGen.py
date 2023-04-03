import pickle
from asl.ARMParser import get_parser
from asl.ARMAST import Instruction
from ARMTypes import *
from ARMAST import *
import json


def HighestSetBit(x: str):
    N = len(x)
    for i in range(N-1, -1, -1):
        if x[N-i-1] == '1':
            return i
    return -1


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
        self.globals = {
            "FALSE": False,
            "TRUE": True,
            "MemOp_LOAD": "00",
            "MemOp_STORE": "01",
            "MemOp_PREFETCH": "10",
            "CountOp_CLZ": "00",
            "CountOp_CLS": "01",
            "CountOp_CNT": "10",
            "LogicalOp_AND": "00",
            "LogicalOp_EOR": "01",
            "LogicalOp_ORR": "10",
            "CompareOp_GT": "000",
            "CompareOp_GE": "001",
            "CompareOp_EQ": "010",
            "CompareOp_LE": "011",
            "CompareOp_LT": "100",
            "VBitOp_VBIF": "00",
            "VBitOp_VBIT": "01",
            "VBitOp_VBSL": "10",
            "VBitOp_VEOR": "11",
        }
        self.result = {}

    def EQ(self, a, b):
        return a == b

    def symtable(self):
        # print(self.fields, self.result)
        return dict(self.fields, **self.result, **self.globals)

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
            elif AST.funcname == "HighestSetBit":
                return HighestSetBit(self.walkConstExprRV(AST.args[0]))
            print(AST)
            assert False
        elif isinstance(AST, BitVec):
            return AST.bv
        elif isinstance(AST, ArraySlice):
            obj = self.walkConstExprRV(AST.bv)
            assert type(obj) == str
            sliceRV = [self.walkConstExprRV(i) for i in AST.slices]
            wid = len(obj)
            if len(sliceRV) == 1:
                return obj[wid-sliceRV[0]-1]
            if len(sliceRV) == 2:
                return obj[wid-sliceRV[0]-1:wid-sliceRV[1]]
            print(sliceRV)
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
            elif AST.op == "&&":
                assert type(a) == bool and type(b) == bool
                return a and b
            elif AST.op == "||":
                assert type(a) == bool and type(b) == bool
                return a or b
            # elif AST.op == "^":
            #     return a ^ b
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
                # print(a, b)
                assert a % b == 0
                return a//b
            elif AST.op == ":":
                assert type(a) == str and type(b) == str
                return a+b
            elif AST.op == ">":
                assert type(a) == int and type(b) == int
                return a > b
            elif AST.op == ">=":
                assert type(a) == int and type(b) == int
                return a >= b
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
        elif isinstance(AST, Update):
            self.result[self.walkConstExprLV(
                AST.lhs)] = self.walkConstExprRV(AST.rhs)
        elif isinstance(AST, If):
            if self.walkConstExprRV(AST.cond):
                self.walkConstExprStmt(AST.then)
        elif isinstance(AST, IfElse):
            if self.walkConstExprRV(AST.cond):
                self.walkConstExprStmt(AST.then)
            else:
                self.walkConstExprStmt(AST.otherwise)
        elif isinstance(AST, Undefiend):
            raise NotImplementedError("Such field reaches undefined")
        elif isinstance(AST, VarsDecl):
            pass
        elif isinstance(AST, Match):
            Rval = self.walkConstExprRV(AST.val)
            for c in AST.cases:
                if isinstance(c, Case):  # not default
                    # print(c)
                    if len(c.val) == 1:
                        if self.EQ(Rval, self.walkConstExprRV(c.val[0])):
                            self.walkConstExprStmt(c.body)
                            break
                    else:
                        assert False
                else:
                    # print(c)
                    assert c == AST.cases[-1]
                    self.walkConstExprStmt(c.body)
                    break
        else:
            print(AST)
            assert False

    def walk(self, AST: ASTNode):
        try:
            self.walkConstExprStmt(AST)
        except LookupError as e:
            self.symbolnotfound = e
            return {}
        except NotImplementedError as e:
            self.undefined = e
            return {}
        return self.result


def parse_instr_attr(instr: InstrDesc):
    ReservedVecTypes = {
        "int8x16_t",
        "int16x8_t",
        "int32x4_t",
        "int64x2_t",
        "uint8x16_t",
        "uint16x8_t",
        "uint32x4_t",
        "uint64x2_t",
        "int8x8_t",
        "int16x4_t",
        "int32x2_t",
        "int64x1_t",
        "uint8x8_t",
        "uint16x4_t",
        "uint32x2_t",
        "uint64x1_t",
        "int8_t",
        "int16_t",
        "int32_t",
        "int64_t",
        "uint8_t",
        "uint16_t",
        "uint32_t",
        "uint64_t",
    }
    ReservedImmTypes = {
        "const int"
    }
    PointerType = {
        "int8_t const *",
        "int16_t const *",
        "int32_t const *",
        "int64_t const *",
        "uint8_t const *",
        "uint16_t const *",
        "uint32_t const *",
        "uint64_t const *",
        "int8_t *",
        "int16_t *",
        "int32_t *",
        "int64_t *",
        "uint8_t *",
        "uint16_t *",
        "uint32_t *",
        "uint64_t *",
    }

    def isSigned(t: str):
        if "uint" in t:
            return False
        if "unsigned" in t:
            return False
        return True

    # - Parse Arguments_Preparation like:
    # - {"a": {"register": "Vn.8B"}, "b": {"register": "Vm.8B"}}

    # - Parse input type: ["int8x8_t a", "int8x8_t b"]
    Params = []
    for arg in instr.arguments:
        tp = ' '.join(arg.split()[:-1])
        nm = arg.split()[-1]
        # print(tp)
        assert tp in (ReservedVecTypes | ReservedImmTypes | PointerType)
        Params.append(Parameter(nm, tp, isSigned(tp),
                      tp in ReservedImmTypes, False))

    # - Parse return type:
    # - {"return_base_type": "int", "element_bit_size": "8", "value": "int8x8_t"}
    retSign = isSigned(instr.return_type["value"])

    # - Parse preparation:
    # - {'a': {'register': 'Vn.8B'}, 'b': {'register': 'Vm.8B'}}
    # - results=[{'Vd.8B': 'result'}]
    preparation = {}
    # print(instr.name, instr.Arguments_Preparation.items())
    for k, v in instr.Arguments_Preparation.items():
        if v:
            reg = parse_reg(v["register"])
            preparation[reg.idx] = k
        else:  # EOR3 gives empty b and c. LOL
            # print(instr.name, instr.base_instruction[0])
            assert instr.base_instruction[0] in ["EOR3", "RAX1", "BCAX"]
            if k == "b":
                preparation["m"] = k
            if k == "c":
                preparation["a"] = k
    # - Parse results: [{"Vd.8B": "result"}]
    # print(instr.results)
    assert len(instr.results) == 1
    assert len(instr.results[0]) == 1
    if "void" not in instr.results[0]:
        reg = parse_reg(list(instr.results[0].keys())[0])
        preparation[reg.idx] = "returnVal"
    return Params, retSign, preparation


class SemaGenerator():
    '''
    SemaGenerator initialized by deserializing shouldn't call 
    getSemaByInstrDesc() cause we are not saving parsing files
    and map2AST
    '''

    def __init__(self, deserialize=False):
        self.result = {}
        with open("intr.json", 'r') as fi:
            self.I = json.load(fi)
        if deserialize:
            self.deserialize()
        else:
            from ARMIntrinsicClassify import Intrinsics2Encodings, Intrinsics2Fields
            print("loading...")
            with open("asl/arm_instrs.sexpr") as f:
                data = f.read()
            parser = get_parser()
            print("parsing...")
            Instrs: List[Instruction] = parser.parse(data)
            print("parse done...")

            zzzz = set(Intrinsics2Encodings.values())
            map2AST = {}
            for i in Instrs:
                for j in i.instEncodings:
                    if j.encName in zzzz:
                        wholeCode = j.encDecode
                        if type(j.encDecode) != asl.Nothing:
                            wholeCode += i.instPostDecode
                        map2AST[j.encName] = (
                            i.instExecute, wholeCode)
            assert len(map2AST) == len(zzzz)
            self.map2AST = map2AST
            print("map2AST done...")

    def getSemaByInstrDesc(self, intrin):
        from ARMIntrinsicClassify import Intrinsics2Encodings, Intrinsics2Fields
        if intrin.name not in Intrinsics2Fields:
            return None
        # print(intrin)
        # assert False
        inst = intrin.base_instruction[0]
        field = Intrinsics2Fields[intrin.name]
        enc = Intrinsics2Encodings[intrin.name]
        ASTs = self.map2AST[enc]
        D = DecodeContext(field)

        resolving = D.walk(ASTShrink(ASTs[1]))
        if D.undefined or D.symbolnotfound:
            print(D.undefined, D.symbolnotfound)
            print(intrin.name)
            print(enc, field)
            assert False

        Params, signedness, preparation = parse_instr_attr(
            intrin)
        for k in preparation:
            del resolving[k]
        return ARMSema(intrin.name,
                       inst,
                       Params,
                       ASTShrink(ASTs[0]),
                       intrin.return_type["value"],
                       signedness,
                       f"{inst} {intrin.operands}",
                       None, None, None, None,
                       preparation,
                       resolving,
                       )

    def getSemaByName(self, name):
        if self.result:
            return self.result.get(name, None)
        for i in self.I:
            if i["name"] == name:
                return self.getSemaByInstrDesc(InstrDesc(**i))
        return None

    def SemaGenerator(self):
        for i in self.I:
            yield self.getSemaByInstrDesc(InstrDesc(**i))

    def getResult(self):
        if self.result:
            return self.result
        else:
            for i in self.I:
                if (z := self.getSemaByInstrDesc(InstrDesc(**i))) is not None:
                    self.result[i["name"]] = z
        return self.result

    def serialize(self):
        self.result = self.getResult()
        with open('AllSema.pickle', 'wb') as f:
            pickle.dump(self.result, f)

    def deserialize(self):
        with open('AllSema.pickle', 'rb') as f:
            self.result = pickle.load(f)


if __name__ == "__main__":
    # S.serialize()
    # print([i for i in S.SemaGenerator() if i is not None])
    # S = SemaGenerator()
    S = SemaGenerator(deserialize=True)
    print(S.getSemaByName("vsubq_s16"))
    # S.GenPy()
    # print(list(S.SemaGenerator()))
