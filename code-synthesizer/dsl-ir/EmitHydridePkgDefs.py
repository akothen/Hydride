import sys
import time
import subprocess as sb
from DSLParser import parse_dict
from latest_semantics import semantcs
from PredefinedDSL import *
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef
from GetLengthDef import GetLengthDef
from GetOutPrecDef import GetOutPrecDef
from IRPrinter import IRPrinter
from BindDef import BindDef
from Specification import Specification, parse_spec

from GrammarGenerator import GrammarGenerator

from Synthesizer import Synthesizer

dsl_list = parse_dict(semantcs)

print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
#sp = parse_spec(specification)
gg = GrammarGenerator()
gl = GetLengthDef(get_len_name = "get-length")
gp = GetOutPrecDef(get_prec_name = "get-prec")
ip = IRPrinter(printer_name = "hydride-printer")
bd = BindDef()


hydride_header = """;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================
"""



with open("gen.rkt","w+") as RacketFile:
    def write_to_file(line):
        RacketFile.write(line + "\n")


    write_to_file(hydride_header)


    prefix = ";; "+"="*80 + "\n"
    prefix += ";; "+" "*30 +" DSL Semantics"+'\n'
    prefix += ";; "+"="*80 + "\n"

    write_to_file(prefix)

    for dsl_inst in dsl_list:
        write_to_file(dsl_inst.get_semantics())

    sufix = "\n;; "+"="*80 + "\n"
    write_to_file(sufix)

    write_to_file(sd.emit_struct_defs(dsl_list))


    write_to_file(cd.emit_cost_model(dsl_list, sd))

    write_to_file(idd.emit_interpreter(dsl_list, sd, add_assertions = False))

    write_to_file(gl.emit_get_length(dsl_list, sd))

    write_to_file(gp.emit_get_prec(dsl_list, sd))

    write_to_file(ip.emit_dsl_printer(dsl_list, sd, prog_name = "prog"))

    write_to_file(bd.emit_binder(dsl_list ,sd))





print("Generated File, now executing ...")

