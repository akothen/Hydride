import os
import re
from collections import namedtuple
VISASema = namedtuple('VISASema', [
    'intrin', 'inst', 'params',
    'spec',
    'inst_form',
    'rettype',
    'flags',
    'resolving',
])
VISADoc = namedtuple('VISADoc', [
                     'Name', 'Opcode', 'Format', 'Semantics', 'Descritpion', 'Text', 'Notes'])
VISAText = namedtuple('VISAText',
                      'text format opname args saturable')
Parameter = namedtuple(
    'Parameter', ['name', 'type', 'is_signed'])


def VISATextIssue(VT: VISAText, args: dict):
    return VT.format.format(**args)


def VISATextParse(text: str):
    """
    [(<P>)] ADD[.sat] (<exec_size>) <dst> <src0> <src1>
    """
    # <P> not supported yet
    saturable = False
    args = []
    parts = []
    assert "{" not in text and "}" not in text, text
    for token in text.split():
        if token == '[(<P>)]':
            continue
        if "<" not in token and ">" not in token:
            opname = token
            if "[.sat]" in opname:
                opname = opname.replace("[.sat]", "")
                saturable = True
            assert "[" not in opname and "]" not in opname and "sat" not in opname, opname
            parts.append(token)
            continue
        if "<" in token and ">" in token:
            fmt = token.replace("<", "{").replace(">", "}")
            aa = re.findall(r"<(.+?)>", token)
            assert len(aa) == 1

            args.append(aa[0])
            parts.append(fmt)
            continue
        assert False
    # sanity check
    assert "dst" in args
    assert "exec_size" in args
    i = 0
    while True:
        if f"src{i}" in args:
            i += 1
        else:
            break
    assert i+2 == len(args), (text, args, i)

    return VISAText(text, fmt, opname, args, saturable)


SuppportedVISA = [
    "ADD",
    "ADD3",
    "AND",
    "ASR",
    "AVG",
    "BFE",
    "BFI",
    "BFREV",
    "CMP",
    "DIV",
    "DIVM",
    "DP4A",
    # "DPAS",  # Semantic too complicated
    # "DPASW",  # Semantic too complicated
    "MAD",
    "MIN_MAX",
    "MOD",
    "MOV",
    "MUL",
    "MULH",
    "NOT",
    "OR",
    "PLN",
    "ROL",
    "ROR",
    "SAD2",
    "SAD2ADD",
    "SEL",
    "SETP",
    "SHL",
    "SHR",
    "XOR",

    # "MADW",  # Ambiguous Semantic
    # "MOVS",  # Ambiguous Semantic

    # "COS",  # float
    # "EXP",  # float
    # "FCVT",  # float
    # "FRC",  # float
    # "INV",  # float
    # "LOG",  # float
    # "LRP",  # float
    # "POW",  # float
    # "RNDD",  # float
    # "RNDE",  # float
    # "RNDU",  # float
    # "RNDZ",  # float
    # "RSQRT",  # float
    # "SIN",  # float
    # "SQRT",  # float
    # "SQRTM",  # float
    # "SRND",  # float

    # "CBIT",  # while
    # "FBH",  # while
    # "FBL",  # while
    # "LZD",  # while

    # "ADDR_ADD",  # ADDR
    # "BFN",  # .chan
    # "ADD3O",  # P[i] = overflow(((src0[i] + src1[i]) + src2[i]))
    # "ADDC",  # carry[i] = carry((src0[i] + src1[i]))
    # "SUBB",  # borrow

    # "DWORD_ATOMIC",  # surface
    # "GATHER",  # surface
    # "GATHER4_SCALED",  # surface
    # "GATHER4_TYPED",  # surface
    # "GATHER_SCALED",  # surface
    # "MEDIA_LD",  # surface
    # "MEDIA_ST",  # surface
    # "OWORD_LD",  # surface
    # "OWORD_LD_UNALIGNED",  # surface
    # "OWORD_ST",  # surface
    # "QW_GATHER",  # Surface
    # "QW_SCATTER",  # Surface
    # "SCATTER",  # surface
    # "SCATTER4_SCALED",  # surface
    # "SCATTER4_TYPED",  # surface
    # "SCATTER_SCALED",  # surface

    # "SVM_ATOMIC",  # *addresses
    # "SVM_BLOCK_LD",# *addresses
    # "SVM_BLOCK_ST",# *addresses
    # "SVM_GATHER",# *addresses
    # "SVM_GATHER4_SCALED",# *addresses
    # "SVM_SCATTER",# *addresses
    # "SVM_SCATTER4_SCALED",# *addresses
]
SupportedTypes = [
    "UD", "D", "UW", "W", "UB", "B", "UQ", "Q"
]
DataTypeBits = {
    "UD": 32,  # unsigned double word
    "D": 32,  # signed double word
    "UW": 16,  # unsigned word
    "W": 16,  # signed word
    "UB": 8,  # unsigned byte
    "B": 8,  # signed byte
    "DF": 64,  # double precision floating point
    "F": 32,  # single precision floating point
    "V": 32,  # packed integer vector
    "VF": 32,  # packed floating vector
    "BOOL": 1,  # boolean
    "UQ": 64,  # unsigned quad word
    "UV": 32,  # packed unsigned integer vector
    "Q": 64,  # signed quad word
    "HF": 16,  # half precision floating point
    "BF": 16,  # bfloat16
}

JSONDIR = os.environ.get("HYDRIDE_ROOT")+"/codegen-generator/targets/visa/"
