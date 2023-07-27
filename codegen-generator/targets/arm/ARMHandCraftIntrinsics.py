from ARMTypes import *
from ARMSemanticGen import parse_instr_attr
from ARMParser import SimpleParser
from ARMManualCorrectAST import ManualAST
HandCraftedIntrinsics = {"vcombine": ["vcombine_"+i+j for i in ["s", "u"]
                         for j in ["8", "16", "32", "64"]],
                         "vget": ["vget_"+k+i+j for k in ["low_", "high_"] for i in ["s", "u"]
                                  for j in ["8", "16", "32", "64"]],
                         }
HandCraftedField = {
    "vcombine": "combine_handcrafted",
    "vget": "get_handcrafted",
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


HandCraftedSema = {
    "vcombine": vcombineSema,
    "vget": vgetSema,
}
