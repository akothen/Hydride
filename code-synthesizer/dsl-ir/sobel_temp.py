import sys
import time
import subprocess as sb
from DSLParser import parse_dict
from semantics import semantics
from semantics_with_costs import cost_semantics
from PredefinedDSL import *
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef
from GetLengthDef import GetLengthDef

from Specification import Specification, parse_spec
from sobel_spec import full_specs

from GrammarGenerator import GrammarGenerator

from Synthesizer import Synthesizer

dsl_list = parse_dict(cost_semantics)

print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
gg = GrammarGenerator()
gl = GetLengthDef(get_len_name = "get-length")



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

util_content = ""
with open("racket_utils.rkt", "r") as UtilFile:
    util_content = UtilFile.read()


with open("gen.rkt","w+") as RacketFile:
    def write_to_file(line):
        RacketFile.write(line + "\n")


    write_to_file(util_content)

    write_to_file(hydride_header)

    write_to_file("(displayln \"Running automatically generated file ... \")")


    for specification in full_specs:
        sp = parse_spec(specification)

        syn = Synthesizer(spec = sp, dsl_operators = dsl_list,
                      struct_definer = sd, grammar_generator = gg,
                      contexts_per_dsl_inst = 3,
                      vectorization_factor = 8,
                      depth = 3
                      )

        grammar_name = specification['name'] + "_grammar"

        write_to_file("(displayln \"Creating Grammar ...\")")
        write_to_file(syn.emit_synthesis_grammar(main_grammar_name = grammar_name))
        write_to_file("(displayln \"Grammar Created ...\")")




