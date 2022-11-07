import sys
import time
import json
import subprocess as sb
from DSLParser import parse_dict
#from LatestSemantics import semantcs
from merged_dict import semantcs
from PredefinedDSL import *
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef
from GetLengthDef import GetLengthDef
from legal_insts import legal_map
from Specification import Specification, parse_spec

from hvx_sema import hvx_semantics


from GrammarGenerator import GrammarGenerator
from TypedGrammarGenerator import TypedGrammarGenerator
from TypedSimpleGrammarGenerator import TypedSimpleGrammarGenerator
from SimpleGrammarGenerator import SimpleGrammarGenerator

from Synthesizer import Synthesizer

INPUT_SPEC_NAME = sys.argv[1]
OUTPUT_GRAMMAR_FILE = sys.argv[2]
VF = int(sys.argv[3])
IS_SHUFFLE = int(sys.argv[4]) == 1

dsl_list = parse_dict(hvx_semantics)

#print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
#print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
gg = TypedSimpleGrammarGenerator()
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

rosette_imports = """
#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)


;(provide {}_grammar_operations)

(provide (all-defined-out))

"""

spec = {}

with open(INPUT_SPEC_NAME, "r") as InputFile:
    spec = json.load(InputFile)

with open(OUTPUT_GRAMMAR_FILE, "w+") as OutputFile:
    def write_to_file(line):
        OutputFile.write(line + "\n")

    sp = parse_spec(spec)


    write_to_file(rosette_imports.format(spec['name']))
    write_to_file(hydride_header)


    syn = Synthesizer(spec = sp, dsl_operators = dsl_list,
                  struct_definer = sd, grammar_generator = gg,
                  contexts_per_dsl_inst = 1,
                  vectorization_factor = VF,
                  depth = 3,
                  is_shuffle = IS_SHUFFLE,
                  legal_map = legal_map
                  )


    grammar_name = spec['name']

    write_to_file(syn.emit_synthesis_grammar(main_grammar_name = grammar_name))

    dsl_subset = syn.dsl_subset

    print(dsl_subset)

    subset_interpreter = idd.emit_interpreter(dsl_subset, sd, add_assertions = False, interpret_name = grammar_name+":interpret")

    subset_cost_model = cd.emit_cost_model(dsl_subset, sd, cost_name = grammar_name+":cost", use_label = False)


    write_to_file(subset_interpreter)

    write_to_file(subset_cost_model)



