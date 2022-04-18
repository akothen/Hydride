import sys
from DSLParser import parse_dict
from semantics import semantics
from PredefinedDSL import *
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef

from Specification import Specification, parse_spec
from test_spec import specification

from GrammarGenerator import GrammarGenerator

from Synthesizer import Synthesizer

dsl_list = parse_dict(semantics)


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
sp = parse_spec(specification)
gg = GrammarGenerator()

syn = Synthesizer(spec = sp, dsl_operators = dsl_list,
                  struct_definer = sd, grammar_generator = gg,
                  )


## Dumping contents into racket file
prefix = ";; "+"="*80 + "\n"
prefix += ";; "+" "*30 +" Automatically Generated File"+'\n'
prefix += ";; "+"="*80 + "\n"

sufix = "\n;; "+"="*80 + "\n"

print(prefix)


prefix = ";; "+"="*80 + "\n"
prefix += ";; "+" "*30 +" DSL Semantics"+'\n'
prefix += ";; "+"="*80 + "\n"

sufix = "\n;; "+"="*80 + "\n"

print(prefix)

print(dummy_vector_load_dsl.get_semantics())

for dsl_inst in dsl_list:
    print(dsl_inst.get_semantics())

print(sufix)

print(sd.emit_struct_defs(dsl_list))

print(idd.emit_interpreter(dsl_list, sd))

print(cd.emit_cost_model(dsl_list, sd))

print(syn.emit_synthesis_grammar())

print(sp.emit_specification())
