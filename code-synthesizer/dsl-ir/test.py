from DSLParser import parse_dict
from semantics import semantics
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef

dsl_list = parse_dict(semantics)

sd = StructDef()
idd = InterpreterDef()
cd = CostDef()


print(sd.emit_struct_defs(dsl_list))
print(idd.emit_interpreter(dsl_list, sd))
print(cd.emit_cost_model(dsl_list, sd))


"""
for dsl_inst in dsl_list:
    if dsl_inst.supports_config(input_precision = 8, output_precision = 16, lane_size = 64):
        dsl_inst.print_instruction()
        print(cd.emit_dsl_cost_def(dsl_inst, sd)[1])
"""
