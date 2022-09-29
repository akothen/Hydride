import sys
import time
import json
import subprocess as sb
from DSLParser import parse_dict
from latest_semantics import semantcs
from PredefinedDSL import *
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef
from GetLengthDef import GetLengthDef

from Specification import Specification, parse_spec


from GrammarGenerator import GrammarGenerator
from TypedGrammarGenerator import TypedGrammarGenerator
from SimpleGrammarGenerator import SimpleGrammarGenerator

from Synthesizer import Synthesizer

INPUT_SPEC_NAME = sys.argv[1]
OUTPUT_GRAMMAR_FILE = sys.argv[2]
VF = int(sys.argv[3])

dsl_list = parse_dict(semantcs)

#print("Number of Target Agnostic DSL Instructions:\t",len(dsl_list))
#print("Number of Target Specific Instructions:\t",sum([len(inst.contexts) for inst in dsl_list]))


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
gg = TypedGrammarGenerator()
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


(provide {}_grammar_operations)

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
                  contexts_per_dsl_inst = 2,
                  vectorization_factor = VF,
                  depth = 3
                  )
    grammar_name = spec['name'] + "_grammar"
    write_to_file(syn.emit_synthesis_grammar(main_grammar_name = grammar_name))



