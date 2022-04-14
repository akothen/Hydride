from DSLParser import parse_dict
from semantics import semantics
from StructDef import StructDef
from InterpreterDef import InterpreterDef

dsl_list = parse_dict(semantics)

sd = StructDef()
idd = InterpreterDef()


print(sd.emit_struct_defs(dsl_list))
print(idd.emit_interpreter(dsl_list, sd))
