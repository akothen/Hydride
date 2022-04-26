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

from Specification import Specification, parse_spec
#from mul_spec import specification
from box_blur_spec import specification

from GrammarGenerator import GrammarGenerator

from Synthesizer import Synthesizer

dsl_list = parse_dict(cost_semantics)

print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
sp = parse_spec(specification)
gg = GrammarGenerator()

syn = Synthesizer(spec = sp, dsl_operators = dsl_list,
                  struct_definer = sd, grammar_generator = gg,
                  contexts_per_dsl_inst = 2,
                  vectorization_factor = 2,
                  depth = 3
                  )


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

    dsl_list = [dsl_inst for dsl_inst in dsl_list if syn.consider_dsl_inst(dsl_inst)]

    write_to_file(util_content)

    write_to_file(hydride_header)

    write_to_file("(displayln \"Running automatically generated file ... \")")

    prefix = ";; "+"="*80 + "\n"
    prefix += ";; "+" "*30 +" DSL Semantics"+'\n'
    prefix += ";; "+"="*80 + "\n"

    sufix = "\n;; "+"="*80 + "\n"

    write_to_file(prefix)

    write_to_file(dummy_vector_load_dsl.get_semantics())

    for dsl_inst in dsl_list:
        write_to_file(dsl_inst.get_semantics())

    write_to_file(sufix)

    write_to_file(sd.emit_struct_defs(dsl_list))

    write_to_file(idd.emit_interpreter(dsl_list, sd))

    write_to_file(cd.emit_cost_model(dsl_list, sd))

    grammar_name = "box_blur_grammar"

    write_to_file("(displayln \"Creating Grammar ...\")")
    write_to_file(syn.emit_synthesis_grammar(main_grammar_name = grammar_name))
    write_to_file("(displayln \"Grammar Created ...\")")

    write_to_file(sp.emit_specification())


    write_to_file("(displayln \"Beginning Synthesis ...\")")
    write_to_file(syn.emit_synthesis_query(grammar_name, optimize = False))
    write_to_file("(displayln \"Synthesis  Completed ...\")")

print("Generated File, now executing ...")
start_time = time.time()
sb.call("racket gen.rkt" , shell=True)
end_time = time.time()

print("Synthesis and verification took {} seconds ...".format(end_time - start_time))
