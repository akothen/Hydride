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


def HandleDPAS(vdoc: VISADoc) -> List[VISASema]:
    """
    DPAS.W.A.SD.RC (<exec_size>) <dst> <src0> <src1> <src1> -> 

    Now only generates the following two:
    DPAS.u4.u4.8.8 (16) UD UD UD UD
    DPAS.s4.s4.8.8 (16) D D D D

    Desired VISASema:
    VISASema(intrin='DPAS.s4.s4.8.8_16_D_D_D_D', inst='DPAS.W.A.SD.RC', params=[Parameter(name='src0', type='M', is_signed=True), Parameter(name='src1', type='M', is_signed=True), Parameter(name='src2', type='M', is_signed=True)], spec=S.parse(...), inst_form='DPAS.W.A.SD.RC    (<exec_size>) <dst> <src0> <src1> <src2>', rettype='M', flags={'sat': False, 'asr': False}, resolving={'exec_size': 16, 'type_map': {'src0': 'M', 'src1': 'M', 'src2': 'M', 'dst': 'M'}, 'Src0Precision': 32, 'Src1Precision': 8, 'Src2Precision': 8, 'DstPrecision': 32, 'RC':8, 'SD':8}, extensions=None),
    """
    tmp = []
    T = VISATextParse(vdoc.Text)
    D = VISADescParse(vdoc.Descritpion, T)

    sat = [False]
    exec_size = [16]
    types = [{'src0': 'UM', 'src1': 'UM', 'src2': 'UM', 'dst': 'UM'},
             {'src0': 'M', 'src1': 'M', 'src2': 'M', 'dst': 'M'}]
    for TyMap in types:
        for sz in exec_size:
            for s in sat:
                args = []
                rettype = TyMap['dst']
                subtype = "S4" if TyMap['src0'] == "M" else "U4"
                signature = "_"+rettype
                for i in T.args:
                    # Translate arg to VISAParameter
                    Ty = TyMap[i]
                    signature += "_"+Ty
                    args.append(Parameter(i, Ty, "U" not in Ty))
                S = SimpleParser()
                S.build()
                resolving = {"exec_size": sz,
                             'type_map': TyMap, 'RC': 8, 'SD': 8,
                             "Src1Precision": 8, "Src2Precision": 8}
                intrin = NameGen(T, s, sz, signature).replace(
                    ".W", "."+subtype).replace(".A", "."+subtype).replace("SD", "8").replace("RC", "8")
                tmp.append(VISASema(
                    intrin=intrin,
                    inst=T.opname,
                    params=args,
                    rettype=rettype,
                    spec=S.parse(vdoc.Semantics),
                    inst_form=vdoc.Text,
                    flags={"sat": s, "asr": "ASR" in T.opname},
                    resolving=resolving,
                    extensions=None))

    return tmp


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
                tmp.append(VISASema(
                    intrin=NameGen(T, s, sz, signature),
                    inst=T.opname,
                    params=args,
                    rettype=rettype,
                    spec=S.parse(vdoc.Semantics),
                    inst_form=vdoc.Text,
                    flags={"sat": s, "asr": "ASR" in T.opname},
                    resolving={"exec_size": sz, 'type_map': TyMap},
                    extensions=None))

    return tmp


def HandleMIN_MAX(vdoc: VISADoc) -> List[VISASema]:
    text = ["MIN[.sat] (<exec_size>) <dst> <src0> <src1>",
            "MAX[.sat] (<exec_size>) <dst> <src0> <src1>"]
    tmp = []
    sema = vdoc.Semantics
    for t in text:
        # VISA docs encode MIN/MAX in a single page so we need to split them
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
            elif vdoc.Name == "DPAS":
                AllSemantics += HandleDPAS(vdoc)
            else:
                AllSemantics += HandleCommon(vdoc)
        for i in AllSemantics:
            self.result[i.intrin] = i
        return self.result


if __name__ == "__main__":
    S = SemaGenerator(deserialize=False)
    S.serialize()
