from VISAParser import SimpleParser
from VISAAST import getSemaAsString
import os
import sys
from pathlib import Path
from VISAMeta import *
from VISAMarkdownParser import parseMarkdown
from typing import List


def NameGen(op, sat, exec_size, Ty):
    return f"V{op}{'_sat' if sat else ''}_{exec_size}_{Ty}"


def HandleCommon(vdoc: VISADoc) -> List[VISASema]:
    """
    [(<P>)] ADD[.sat] (<exec_size>) <dst> <src0> <src1> -> 2*6*6
    """
    tmp = []
    T = VISATextParse(vdoc.Text)
    if T.saturable:
        sat = [True, False]
    else:
        sat = [False]
    exec_size = [1, 2, 4, 8, 16, 32]
    types = SupportedTypes
    for Ty in types:
        for sz in exec_size:
            for s in sat:
                args = []
                for i in T.args:
                    args.append(Parameter(i, Ty, "U" not in Ty))
                S = SimpleParser()
                S.build()
                tmp.append(VISASema(
                    intrin=NameGen(T.opname, s, sz, Ty),
                    inst=T.opname,
                    params=args,
                    rettype=Ty,
                    spec=S.parse(vdoc.Semantics),
                    inst_form=vdoc.Text,
                    flags={"sat": s},
                    resolving={"exec_size": sz}))

    return tmp


def HandleMIN_MAX(vdoc: VISADoc) -> List[VISASema]:
    text = ["MIN[.sat] (<exec_size>) <dst> <src0> <src1>",
            "MAX[.sat] (<exec_size>) <dst> <src0> <src1>"]
    tmp = []
    for t in text:
        tmp += HandleCommon(vdoc._replace(Text=t))
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
    def __init__(self, deserialize=False) -> None:
        self.result = {}
        if deserialize:
            self.deserialize()

    def deserialize(self):
        from AllSema import AllSema
        self.result = AllSema

    def serialize(self):
        import pprint
        self.result = self.getResult()
        with open(JSONDIR+'AllSema.py', 'w') as f:
            f.write("""from VISAAST import *
""")
            f.write(f"AllSema = {pprint.pformat(self.result, indent=4)}")

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
        for visa in SuppportedVISA:
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
    S = SemaGenerator()
    S.serialize()
