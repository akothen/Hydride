import argparse
import logging
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
    'extensions',
])
VISADoc = namedtuple('VISADoc', [
                     'Name', 'Opcode', 'Format', 'Semantics', 'Descritpion', 'Text', 'Notes'])
VISAText = namedtuple('VISAText',
                      'text format opname args saturable')
VISADesc = namedtuple('VISADesc',
                      'exec_sizes supported_type_map')
Parameter = namedtuple(
    'Parameter', ['name', 'type', 'is_signed'])


def VISATextIssue(VT: VISAText, args: dict):
    return VT.format.format(**args)


def VISATextParse(text: str):
    """
    [(<P>)] ADD[.sat] (<exec_size>) <dst> <src0> <src1>
    """
    text = text.split("//")[0].rstrip()
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
            parts.append(token.replace("[.sat]", r"{sat}"))
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
    assert "exec_size" in args, breakpoint()
    i = 0
    while True:
        if f"src{i}" in args:
            i += 1
        else:
            break
    assert i+2 == len(args), (text, args, i)
    args.remove("exec_size")
    args.remove("dst")
    fmt = " ".join(parts)

    return VISAText(text, fmt, opname, args, saturable)


def VISADescParse(desc: str, T: VISAText):
    def makeHomogenousType(Ty):
        d = {i: Ty for i in T.args}
        d['dst'] = Ty
        return d

    # assert "1 element" in desc
    exec_sizes = []
    spt = []
    if "1 element" in desc:
        exec_sizes.append(1)
    for i in [2, 4, 8, 16, 32]:
        if f"{i} elements" in desc:
            exec_sizes.append(i)
    assert exec_sizes
    if "Operand type maps" in desc:
        desc = desc.split(
            "Operand type maps")[-1].strip().split("#")[0].strip()
        while "**" in desc:
            st = desc.find("**")
            ed = desc.find("**", st+2)
            desc = desc[:st]+desc[ed+2:]
        desc = desc.replace("-", "")
        desc = ",".join(desc.split("\n")).split(",")
        desc = [i.strip() for i in desc]
        for i in SupportedTypes:
            if i in desc:
                spt.append(makeHomogenousType(i))
        return VISADesc(exec_sizes, spt)
    elif "**Supported Types:**" in desc:
        desc = desc.split(
            "**Supported Types:**")[-1].strip().split("\n")[0].strip()
        desc = desc.split(",")
        desc = [i.strip() for i in desc]
        for i in SupportedTypes:
            if i in desc:
                spt.append(makeHomogenousType(i))
        return VISADesc(exec_sizes, spt)
    elif T.opname == "SAD2":
        spt = [{"src0": 'UB', "src1": 'UB', "dst": 'UW'},
               {"src0": 'B', "src1": 'B', "dst": 'W'}]
        return VISADesc(exec_sizes, spt)
    elif T.opname == "SAD2ADD":
        spt = [{"src0": 'UB', "src1": 'UB', "dst": 'UW', 'src2': 'UW'},
               {"src0": 'B', "src1": 'B', "dst": 'W', 'src2': 'W'}]
        return VISADesc(exec_sizes, spt)
    assert False


ParseError = []
FlowControl = ["SEL", "SETP"]
Stateful = ["ADDC"]
Uncommon = ["BFREV", "ROL", "ROR"]
CompileIssue = ["CMP", "PLANE", "SAD2ADD", "SAD2"]

SupportedVISA = [
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
    "DPAS",  # Semantic too complicated
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
SupportedVISA = [i for i in SupportedVISA if i not in ParseError +
                  FlowControl+Stateful+Uncommon+CompileIssue]
SupportedTypes = [
    "UD", "D", "UW", "W", "UB", "B", "UQ", "Q", "M"
    # M denotes matrix for compile use, while document doesn't account for
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

VISADIR = os.environ.get("HYDRIDE_ROOT")+"/codegen-generator/targets/visa/"


class CustomFormatter(logging.Formatter):

    grey = "\x1b[38;20m"
    yellow = "\x1b[33;20m"
    red = "\x1b[31;20m"
    bold_red = "\x1b[31;1m"
    reset = "\x1b[0m"
    format = "%(asctime)s - %(name)s - %(message)s (%(filename)s:%(lineno)d)"

    FORMATS = {
        logging.DEBUG: grey + format + reset,
        logging.INFO: grey + format + reset,
        logging.WARNING: yellow + format + reset,
        logging.ERROR: red + format + reset,
        logging.CRITICAL: bold_red + format + reset
    }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno)
        formatter = logging.Formatter(log_fmt)
        return formatter.format(record)


parser = argparse.ArgumentParser()
parser.add_argument('-l',
                    '--log',
                    default='warning',
                    help='Provide logging level. Example --log debug, default=warning')
args, unknown = parser.parse_known_args()
Hlog = logging.getLogger("Hydride")
Hlog.setLevel(args.log.upper())

# create console handler with a higher log level
ch = logging.StreamHandler()
ch.setLevel(args.log.upper())

ch.setFormatter(CustomFormatter())

Hlog.addHandler(ch)
