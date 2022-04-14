from DSLParser import parse_dict
from semantics import semantics
from StructDef import StructDef

dsl_list = parse_dict(semantics)

sd = StructDef()

for dsl_inst in dsl_list:
    print(sd.emit_dsl_struct(dsl_inst))

