from VISAParser import SimpleParser
from VISAAST import getSemaAsString
import os
import sys
from pathlib import Path
from VISAMeta import *
from VISAMarkdownParser import parseMarkdown
from typing import List


def NameGen(op: VISAText, sat, exec_size, signature):
    return f"V{op.opname}{'_sat' if sat else ''}_{exec_size}{signature}"


def HandleCommon(vdoc: VISADoc) -> List[VISASema]:
    """
    [(<P>)] ADD[.sat] (<exec_size>) <dst> <src0> <src1> -> 2*6*6
    """
    tmp = []
    T = VISATextParse(vdoc.Text)
    D = VISADescParse(vdoc.Descritpion, T)

    if T.saturable:
        sat = [True, False]
    else:
        sat = [False]
    exec_size = D.exec_sizes
    types = D.supported_type_map
    Hlog.debug(D)
    # exec_size = [1, 2, 4, 8, 16, 32]
    # types = SupportedTypes
    for TyMap in types:
        for sz in exec_size:
            for s in sat:
                args = []
                rettype = TyMap['dst']
                signature = "_"+rettype
                for i in T.args:
                    Ty = TyMap[i]
                    signature += "_"+Ty
                    args.append(Parameter(i, Ty, "U" not in Ty))
                S = SimpleParser()
                S.build()
                resolving = {"exec_size": sz, 'type_map': TyMap}
                for Reg,Ty in TyMap.items():
                    resolving[Reg.capitalize()+"Precision"]=DataTypeBits[Ty]
                tmp.append(VISASema(
                    intrin=NameGen(T, s, sz, signature),
                    inst=T.opname,
                    params=args,
                    rettype=rettype,
                    spec=S.parse(vdoc.Semantics),
                    inst_form=vdoc.Text,
                    flags={"sat": s, "asr": "ASR" in T.opname},
                    resolving=resolving,
                    extensions=None))

    return tmp


def HandleMIN_MAX(vdoc: VISADoc) -> List[VISASema]:
    text = ["MIN[.sat] (<exec_size>) <dst> <src0> <src1>",
            "MAX[.sat] (<exec_size>) <dst> <src0> <src1>"]
    tmp = []
    sema = vdoc.Semantics
    for t in text:
        if "MIN" in t:
            to_replace = "/max"
        else:
            to_replace = "min/"
        tmp += HandleCommon(vdoc._replace(Text=t,
                            Semantics=sema.replace(to_replace, "")))
    return tmp


def HandleCMP(vdoc: VISADoc) -> List[VISASema]:
    """
    CMP.rel_op  (<exec_size>) <dst> <src0> <src1> -> 6*6*8
    """
    rel_ops = ["EQ", "NE", "LT", "LE", "GT", "GE"]
    symbols = ["==", "!=", "<", "<=", ">", ">="]
    sema = vdoc.Semantics
    text = vdoc.Text
    tmp = []
    for op, sym in zip(rel_ops, symbols):
        tmp += HandleCommon(
            vdoc._replace(Semantics=sema.replace("rel_op", sym),
                          Text=text.replace(".rel_op", "_"+op)))
    return tmp


class SemaGenerator:
    def __init__(self, deserialize=True) -> None:
        self.result = {}
        if deserialize:
            self.deserialize()

    def deserialize(self):
        from AllSema import AllSema
        self.result = AllSema

    def serialize(self):
        import pprint
        self.result = self.getResult()
        with open(VISADIR+'AllSema.py', 'w') as f:
            f.write("""from VISAAST import *
from VISAMeta import VISASema, Parameter
""")
            f.write(f"AllSema = {pprint.pformat(self.result, indent=4)}")
        Hlog.info("Serialized %s sema", len(self.result))

    def getResult(self) -> List[VISASema]:
        '''
        ADD[.sat] (<exec_size>) <dst> <src0> <src1> -> 2*6

        CMP.rel_op  (<exec_size>) <dst> <src0> <src1> -> 6*6*6*6

        MIN[.sat] (<exec_size>) <dst> <src0> <src1> |
        MAX[.sat] (<exec_size>) <dst> <src0> <src1> -> 2*2*6*6*6
        '''
        if self.result:
            return self.result
        AllSemantics = []
        for visa in SupportedVISA:
            Hlog.debug(f"Processing {visa}")
            vdoc = parseMarkdown(f"{visa}.md")
            if vdoc.Name == "MIN_MAX":
                AllSemantics += HandleMIN_MAX(vdoc)
            elif vdoc.Name == "CMP":
                AllSemantics += HandleCMP(vdoc)
            else:
                AllSemantics += HandleCommon(vdoc)
        for i in AllSemantics:
            self.result[i.intrin] = i
        return self.result


if __name__ == "__main__":
    S = SemaGenerator(deserialize=False)
    S.serialize()
