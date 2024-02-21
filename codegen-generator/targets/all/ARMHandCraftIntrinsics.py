from ARMTypes import *
from ARMSemanticGen import parse_instr_attr
from ARMParser import SimpleParser
from ARMManualCorrectAST import ManualAST
from ARMReadableSemantics import map2Code
HandCraftedIntrinsics = {"vcombine": ["vcombine_"+i+j for i in ["s", "u"]
                         for j in ["8", "16", "32", "64"]],
                         "vget": ["vget_"+k+i+j for k in ["low_", "high_"] for i in ["s", "u"]
                                  for j in ["8", "16", "32", "64"]],
                         #  "vpad_l": ["vpad"+d+"l"+k+i+j for d in ["a", "d"]for k in ["", "q"] for i in ["_s", "_u"]
                         #             for j in ["8", "16", "32"]],
                         "vzip": ["vzip_"+i+j for i in ["s", "u"] for j in ["8", "16", "32"]
                                  ]
                         }
HandCraftedField = {
    "vcombine": "combine_handcrafted",
    "vget": "get_handcrafted",
    # "vpad_l": "pad_l_handcrafted",
}


def vcombineSema(instr: InstrDesc) -> ARMSema:
    Params, signedness, preparation, imm_width = parse_instr_attr(
        instr, {})
    s = SimpleParser()
    s.build()
    return ARMSema(instr.name,
                   "DUP+INS",
                   Params,
                   s.parse(ManualAST["combine_handcrafted"]["execute"]),
                   instr.return_type["value"],
                   signedness,
                   f"?",
                   None, imm_width, None, None,
                   preparation,
                   {'datasize': 64},
                   "combine_handcrafted",
                   )


def vgetSema(instr: InstrDesc) -> ARMSema:
    Params, signedness, preparation, imm_width = parse_instr_attr(
        instr, {})
    s = SimpleParser()
    s.build()
    return ARMSema(instr.name,
                   "DUP",
                   Params,
                   s.parse(ManualAST["get_handcrafted"]["execute"]),
                   instr.return_type["value"],
                   signedness,
                   f"DUP Vd.1D,Vn.D[1]",
                   None, imm_width, None, None,
                   preparation,
                   {'part': 1 if "high" in instr.name else 0, 'datasize': 64},
                   "get_handcrafted",
                   )


def vzipSema(instr: InstrDesc) -> ARMSema:
    Params, signedness, preparation, imm_width = parse_instr_attr(
        instr._replace(results=[{"Vd.8B": "result"}]), {})
    s = SimpleParser()
    s.build()
    # breakpoint()
    esize = int(instr.name.split("_")[-1][1:])
    return ARMSema(instr.name,
                   "ZIP1 ZIP2",
                   Params,
                   s.parse(
                       ManualAST["zip_handcrafted"]["execute"]),
                   instr.return_type["value"],
                   signedness,
                   None,
                   None, imm_width, None, None,
                   preparation,
                   {'datasize': 64,
                    'esize': esize,
                    'pairs': 64//esize,
                    },
                   "get_handcrafted",
                   )


# def vpad_lSema(instr: InstrDesc) -> ARMSema:
#     Params, signedness, preparation, imm_width = parse_instr_attr(
#         instr, {})
#     s = SimpleParser()
#     s.build()
#     datasize = 128 if 'q' in instr.name else 64
#     esize = int(instr.name.split("_")[1:])
#     elements = datasize // (2*esize)
#     return ARMSema(instr.name,
#                    "_AD_LP",
#                    Params,
#                    s.parse(ManualAST["pad_l_handcrafted"]["execute"]),
#                    instr.return_type["value"],
#                    signedness,
#                    f"?",
#                    None, imm_width, None, None,
#                    preparation,
#                    {'datasize': datasize,
#                     'esize': esize,
#                     'elements': elements,
#                     'acc': 1 if "ada" in instr.name else 0,
#                     'unsigned': 1 if '_u' in instr.name else 0,
#                     },
#                    "pad_l_handcrafted",
#                    )


HandCraftedSema = {
    "vcombine": vcombineSema,
    "vget": vgetSema,
    "vzip": vzipSema,
    # "vpad_l": vpad_lSema,
}
