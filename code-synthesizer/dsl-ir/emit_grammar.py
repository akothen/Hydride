import sys
import time
import json
import subprocess as sb
from common.DSLParser import parse_dict
#from LatestSemantics import semantcs
from  x86SemanticsAllArgs import semantcs

from common.PredefinedDSL import *
from common.StructDef import StructDef
from interpreter.InterpreterDef import InterpreterDef
from utils.CostDef import CostDef
from utils.GetLengthDef import GetLengthDef
from legal_insts import legal_map
from Specification import Specification, parse_spec


from hexsemantics_new import semantics as hvx_semantics


from grammar_generator.TypedSimpleGrammarGenerator import TypedSimpleGrammarGenerator

from synthesizer.Synthesizer import Synthesizer
from synthesizer.StepWiseSynthesizer import StepWiseSynthesizer

INPUT_SPEC_NAME = sys.argv[1]
OUTPUT_GRAMMAR_FILE = sys.argv[2]
VF = int(sys.argv[3])
IS_SHUFFLE = int(sys.argv[4]) == 1
TARGET = sys.argv[5]
SCALE_FACTOR = 1

STEP=0
DEPTH=3

if len(sys.argv) >= 7:
    STEP = int(sys.argv[6])


if len(sys.argv) >= 8:
    DEPTH = int(sys.argv[7])


if len(sys.argv) >= 9:
    SCALE_FACTOR = int(sys.argv[8])



print("TARGET:", TARGET)




if TARGET == 'x86':
    dsl_list = parse_dict(semantcs)
else:
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

    sp.set_target(TARGET)


    write_to_file(rosette_imports.format(spec['name']))
    write_to_file(hydride_header)


    syn = StepWiseSynthesizer(spec = sp, dsl_operators = dsl_list,
                  struct_definer = sd, grammar_generator = gg,
                  contexts_per_dsl_inst = 2,
                  vectorization_factor = VF,
                  depth = DEPTH,
                  is_shuffle = IS_SHUFFLE,
                  legal_map = legal_map,
                  target = TARGET,
                  step = STEP,
                  scale_factor = SCALE_FACTOR
                  )


    grammar_name = spec['name']

    write_to_file(syn.emit_synthesis_grammar(main_grammar_name = grammar_name))

    dsl_subset = syn.dsl_subset


    subset_interpreter = idd.emit_interpreter(dsl_subset, sd, add_assertions = False, interpret_name = grammar_name+":interpret")

    subset_cost_model = cd.emit_cost_model(dsl_subset, sd, cost_name = grammar_name+":cost", use_label = False)


    write_to_file(subset_interpreter)

    write_to_file(subset_cost_model)



