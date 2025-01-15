import pprint
import pickle
from asl.ARMParser import get_parser
from asl.ARMAST import Instruction
from ARMTypes import *
from ARMAST import *
from typing import Dict
from ARMPipeline import pipeline

import json


class DecodeContext:
    undefined = None
    symbolnotfound = None

    def __init__(self, fields):
        self.fields = fields
        self.globals = ARMGlobalConst
        self.result = {}

    def EQ(self, a, b):
        assert type(a) == type(b)
        if type(a) == str and type(b) == str:
            return maskeq(a, b) or maskeq(b, a)
        return a == b

    def symtable(self):
        # print(self.fields, self.result, self.globals)
        return dict(self.fields, **self.result, **self.globals)

    def lookup(self, name):
        Z = self.symtable()
        if name not in Z:
            raise LookupError(f"Symbol {name} not found")
        return self.symtable()[name]

    def walkConstExprLV(self, AST: ASTNode):
        if isinstance(AST, Var):
            if AST.name.startswith("R"):
                assert AST.name == "Rmhi", f"{AST}"
            return AST.name
        else:
            print(AST)
            assert False

    def walkConstExprRV(self, AST: ASTNode):
        if isinstance(AST, Var):
            if AST.name.startswith("R") and AST.name != "R" and not AST.name.startswith("Reduce"):
                return '00000'  # We just don't care about register
            else:
                return self.lookup(AST.name)
        elif isinstance(AST, Call):
            if AST.funcname == "UInt":
                return UInt(self.walkConstExprRV(AST.args[0]))
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
        elif isinstance(AST, ArrayIndex):
            obj = self.walkConstExprRV(AST.obj)
            assert type(obj) == str
            sliceRV = [self.walkConstExprRV(i) for i in AST.slices]
            wid = len(obj)
            assert type(AST.slices) == list, f"{AST}"
            if len(sliceRV) == 1:
                if type(sliceRV[0]) == int:
                    return ASLArrayIndex(obj, sliceRV[0], wid)
                elif type(sliceRV[0]) == tuple:
                    return ASLArraySlice(obj, sliceRV[0][0], sliceRV[0][1], wid)

            print(sliceRV)
            assert False
        elif isinstance(AST, SliceRange):
            return (self.walkConstExprRV(AST.hi), self.walkConstExprRV(AST.lo))
        elif isinstance(AST, Number):
            return AST.val
        elif isinstance(AST, IfElseExpr):
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
                AST.lhs)] = self.walkConstExprRV(AST.rhs)
        elif isinstance(AST, VarDeclUndef):
            pass
        elif isinstance(AST, Update):
            self.result[self.walkConstExprLV(
                AST.lhs)] = self.walkConstExprRV(AST.rhs)
        elif isinstance(AST, IfStmt):
            if self.walkConstExprRV(AST.cond):
                self.walkConstExprStmt(AST.then)
        elif isinstance(AST, IfElseStmt):
            if self.walkConstExprRV(AST.cond):
                self.walkConstExprStmt(AST.then)
            else:
                self.walkConstExprStmt(AST.otherwise)
        elif isinstance(AST, Undefined):
            raise NotImplementedError("Such field reaches undefined")
        elif isinstance(AST, VarsDecl):
            self.walkConstExprStmt(AST.init_list)
        elif isinstance(AST, Match):
            Rval = self.walkConstExprRV(AST.val)
            for c in AST.cases:
                if isinstance(c, Case):  # not default
                    # print(c)
                    # if len(c.val) == 1:
                    if self.EQ(Rval, self.walkConstExprRV(c.val)):
                        self.walkConstExprStmt(c.body)
                        break
                    # else:
                    #     assert False
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


def parse_instr_attr(instr: InstrDesc, assign):
    from ARMTypes import ReservedVecTypes, ReservedImmTypes, PointerType

    def isSigned(t: str, var: str = ""):
        if "uint" in t:
            return False
        if "unsigned" in t:
            return False
        if var in instr.Arguments_Preparation:
            if "minimum" in instr.Arguments_Preparation[var]:
                lo, hi = get_arg_lo_hi(instr.Arguments_Preparation[var])
                return lo < 0
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
        Params.append(Parameter(nm, tp, isSigned(tp, nm),
                      tp in ReservedImmTypes, False))

    # - Parse return type:
    # - {"return_base_type": "int", "element_bit_size": "8", "value": "int8x8_t"}
    retSign = isSigned(instr.return_type["value"])

    # - Parse results: [{"Vd.8B": "result"}]
    # print(instr.results)
    preparation = {}
    assert len(instr.results) == 1, breakpoint()
    assert len(instr.results[0]) == 1
    if "void" not in instr.results[0]:
        reg = parse_reg(list(instr.results[0].keys())[0])
        preparation[reg.idx] = "returnVal"

    # - Parse preparation:
    # - {'a': {'register': 'Vn.8B'}, 'b': {'register': 'Vm.8B'}}
    # - {"a": {"register": "Vn.4H"}, "v": {"register": "Vm.4H"}, "lane": {"minimum": "0", "maximum": "3"}}
    # - results=[{'Vd.8B': 'result'}]
    # print(instr.name, instr.Arguments_Preparation.items())
    imm_width = None
    for k, v in instr.Arguments_Preparation.items():
        if v:
            if "register" in v:
                reg = parse_reg(v["register"])
                if reg:
                    preparation[reg.idx] = k
            else:
                lo, hi = get_arg_lo_hi(v)
                imm_width = (lo, hi)
                assert lo <= assign[k] <= hi, f"{lo} <= {assign[k]} <= {hi}"

        else:  # EOR3 gives empty b and c. LOL
            # print(instr.name, instr.base_instruction[0])
            assert instr.base_instruction[0] in ["EOR3", "RAX1", "BCAX", "XAR"]
            if k == "b":
                preparation["m"] = k
            if k == "c":
                preparation["a"] = k
    if any(i in instr.name for i in ["vclt", "vcle"]):  # LOL
        if "vcltz" not in instr.name and "vclez" not in instr.name:
            preparation["m"], preparation["n"] = preparation["n"], preparation["m"]
    return Params, retSign, preparation, imm_width


class SemaGenerator():
    '''
    SemaGenerator initialized by deserializing shouldn't call 
    getSemaByInstrDesc() cause we are not saving parsing files
    and map2AST
    '''

    def __init__(self, deserialize=False):
        self.result = {}
        with open(JSONDIR+"intr.json", 'r') as fi:
            self.I = json.load(fi)
        self.toI = {i["name"]: InstrDesc(**i) for i in self.I}
        if deserialize:
            self.deserialize()
        else:
            # from ARMIntrinsicClassify import Intrinsics2Encodings
            # print("loading...")
            # with open(JSONDIR+"asl/arm_instrs.sexpr") as f:
            #     data = f.read()
            # parser = get_parser()
            # print("parsing...")
            # Instrs: List[Instruction] = parser.parse(data)
            # print("parse done...")

            # encodingNames = set(Intrinsics2Encodings.values())
            # map2AST = {}
            # for i in Instrs:
            #     for j in i.instEncodings:
            #         if j.encName in encodingNames:
            #             wholeCode = j.encDecode
            #             if type(j.encDecode) != asl.Nothing:
            #                 wholeCode += i.instPostDecode
            #             map2AST[j.encName] = (
            #                 i.instExecute, wholeCode)
            # assert len(map2AST) == len(encodingNames)
            from ARMParser import map2AST
            self.map2AST = map2AST
            print("map2AST done...")

    def getSemaByInstrDesc(self, intrin, expandedName):
        from ARMIntrinsicClassify import Intrinsics2Encodings, Intrinsics2Fields
        # if intrin.name not in Intrinsics2Fields:
        #     return None
        expanded_name, assign = extract_assignment_from_name(expandedName)
        assert intrin.name == expanded_name, f"{intrin.name} != {expanded_name}"
        # assert False
        inst = intrin.base_instruction[0]
        field = Intrinsics2Fields[expandedName]
        enc = Intrinsics2Encodings[intrin.name]
        ASTs = self.map2AST[enc]

        D = DecodeContext(field)

        # print(expandedName, field)
        resolving = D.walk(ASTs[1])
        if D.undefined or D.symbolnotfound:
            breakpoint()
            print(D.undefined, D.symbolnotfound)
            print(expandedName)
            print(enc, field)
            assert False

        Params, signedness, preparation, imm_width = parse_instr_attr(
            intrin, assign)
        for k in preparation:
            del resolving[k]
        if "imm6" in assign:
            int6 = bin(assign["imm6"])[2:].zfill(6)
            resolving["imm6"] = int6
        return ARMSema(expandedName,
                       inst,
                       Params,
                       ASTs[0],
                       intrin.return_type["value"],
                       signedness,
                       f"{inst} {intrin.operands}",
                       None, imm_width, None, None,
                       preparation,
                       resolving,
                       enc,
                       )

    def getSemaByName(self, name):
        from ARMIntrinsicClassify import Intrinsics2Fields
        if self.result:
            return self.result.get(name, None)
        for i in Intrinsics2Fields:
            ii, assign = extract_assignment_from_name(i)
            if i == name or ii == name:
                return self.getSemaByInstrDesc(self.toI[ii], i)
        return None

    def SemaGenerator(self):
        assert False, "Deprecated"
        from ARMIntrinsicClassify import Intrinsics2Fields
        for i in Intrinsics2Fields:
            ii, assign = extract_assignment_from_name(i)
            yield self.getSemaByInstrDesc(self.toI[ii], i)

    def getResult(self) -> (Dict[str, ARMSema]):
        hirarch = {}
        if self.result:
            return self.result
        else:
            from ARMIntrinsicClassify import Intrinsics2Fields, ExpandName2Encoding
            for i in Intrinsics2Fields:
                ii, assign = extract_assignment_from_name(i)
                if (z := self.getSemaByInstrDesc(self.toI[ii], i)) is not None:
                    if i == ii:
                        self.result[i] = z
                    else:
                        hirarch[ii] = hirarch.get(ii, []) + [(i, z)]

        for k, v in hirarch.items():
            if not v:
                continue
            for ei, (i, z) in enumerate(v):
                if 'shift' not in z.resolving:
                    break
                shift = z.resolving['shift']
                del z.resolving['shift']
                if ei == 0:
                    store_z, store_i = z, i
                if i != store_i:
                    assert store_z.inst == z.inst
                    assert store_z.params == z.params
                    assert str(store_z.spec) == str(
                        z.spec), f"{store_z.spec} {z.spec}"
                    assert store_z.rettype == z.rettype
                    assert store_z.ret_is_signed == z.ret_is_signed
                    assert store_z.inst_form == z.inst_form
                    assert store_z.extensions == z.extensions
                    assert store_z.imm_width == z.imm_width
                    assert store_z.xed == z.xed
                    assert store_z.elem_type == z.elem_type
                    assert store_z.resolving == z.resolving
            else:
                z.preparation['shift'] = 'n'
                z = z._replace(intrin=k)
                self.result[k] = z
        # for k in self.result.keys():
        #   print(k)
        from ARMHandCraftIntrinsics import HandCraftedIntrinsics, HandCraftedSema
        for group, intrin_list in HandCraftedIntrinsics.items():
            for intrin in intrin_list:
                self.result[intrin] = HandCraftedSema[group](self.toI[intrin])

        for i in self.result:
            self.result[i] = pipeline(self.result[i])

        return self.result

    def serialize(self):
        self.result = self.getResult()
        with open(JSONDIR+'AllSema.pickle', 'wb') as f:
            pickle.dump(self.result, f)
        with open(JSONDIR+'ARMAllSema.py', 'w') as f:
            f.write("""from ARMTypes import *
from ARMAST import *
""")
            f.write(f"AllSema = {pprint.pformat(self.result, indent=4)}")

    def deserialize(self):
        # with open(JSONDIR+'AllSema.pickle', 'rb') as f:
        #     self.result = pickle.load(f)
        from ARMAllSema import AllSema

        self.result = AllSema


if __name__ == "__main__":
    # S.serialize()
    # print([i for i in S.SemaGenerator() if i is not None])
    S = SemaGenerator()
    # print(S.getSemaByName("vqshrun_n_s64__n_1"))
    # print(S.getSemaByName("vdot_s32").spec.__repr__())
    # print(S.getSemaByName("vabdl_s32").spec.__repr__())
    # S = SemaGenerator(deserialize=True)
    # print(S.getSemaByName("vsubq_s16"))
    S.serialize()
    # S.GenPy()
    # print(list(S.SemaGenerator()))
