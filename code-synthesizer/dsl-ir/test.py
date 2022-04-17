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

dsl_list = parse_dict(semantics)

vector_load_input_sizes = [64, 256, 1024]
vector_load_offsets = ["IDX_I", "IDX_I", "IDX_I"]
vector_load_num_elems = [4, 8, 16]
vector_load_precisions = [8, 8, 8]

vector_load = create_vector_load_dsl(
    input_vector_sizes = vector_load_input_sizes,
    offsets = vector_load_offsets,
    num_elem_sizes = vector_load_num_elems,
    precisions = vector_load_precisions
)

vector_load.print_instruction()


swizzle_input_sizes = [64, 256, 1024]
swizzle_precisions = [8, 8, 8]
swizzle_num_elems = [swizzle_input_sizes[i] // swizzle_precisions[i] for i in range(0,len(swizzle_precisions))]
swizzle_group_sizes = [3, 3, 3]
swizzle_lane_offsets = [0,0,1]
swizzle_dis_sizes = [1, 1, 1]
swizzle_rotate_sizes = ["IDX_J", "IDX_J", "IDX_J"]
swizzle_lane_sizes = [4 , 4 , 4]

swizzle_two = create_two_input_swizzle(
    input_vector_sizes = swizzle_input_sizes,
    num_elem_sizes = swizzle_num_elems,
    precisions = swizzle_precisions ,
    group_sizes = swizzle_group_sizes,
    lane_sizes = swizzle_lane_sizes,
    lane_offsets = swizzle_lane_offsets,
    dis_sizes = swizzle_dis_sizes,
    rotate_sizes = swizzle_rotate_sizes,

)


swizzle_two.print_instruction()


sys.exit(1)

sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
sp = parse_spec(specification)

gg = GrammarGenerator()


sample_dsl = dsl_list[:5]
sample_args = [dsl_inst.get_sample_context().context_args for dsl_inst in sample_dsl ]

print(gg.emit_grammar_layer(layer_dsl_insts = sample_dsl,
                            layer_dsl_args_list = sample_args))

"""

for dsl_inst in dsl_list:
    print(dsl_inst.get_semantics())

print(sd.emit_struct_defs(dsl_list))
print(idd.emit_interpreter(dsl_list, sd))
print(cd.emit_cost_model(dsl_list, sd))


print(sp.emit_spec_semantics())

for dsl_inst in dsl_list:
    if sp.consider_dsl_inst(dsl_inst):
        print(dsl_inst.get_semantics())
"""
