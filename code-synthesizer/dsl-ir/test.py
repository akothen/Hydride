from DSLParser import parse_dict
from semantics import semantics
from StructDef import StructDef
from InterpreterDef import InterpreterDef
from CostDef import CostDef

from Specification import Specification, parse_spec
from test_spec import specification


dsl_list = parse_dict(semantics)


sd = StructDef()
idd = InterpreterDef()
cd = CostDef()
sp = parse_spec(specification)

for dsl_inst in dsl_list:
    print(dsl_inst.get_semantics())

print(sd.emit_struct_defs(dsl_list))
print(idd.emit_interpreter(dsl_list, sd))
print(cd.emit_cost_model(dsl_list, sd))


print(sp.emit_spec_semantics())

for dsl_inst in dsl_list:
    if sp.consider_dsl_inst(dsl_inst):
        print(dsl_inst.get_semantics())
