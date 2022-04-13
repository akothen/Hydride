from DSLParser import parse_dict
from semantics import semantics

dsl_list = parse_dict(semantics)

for dsl_inst in dsl_list:
    dsl_inst.print_instruction()

