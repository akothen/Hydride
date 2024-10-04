from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *
from interpreter.InterpreterConstraintsDef import *

class InterpreterDef:

    def __init__(self):
        self.constraints_def = InterpreterConstraintsDef()


    def emit_default_def(self, struct_definer , env_name = "env", add_assertions = True, interpret_name = "hydride:interpret"):
        defaults = []

        defaults.append("[(reg id) (vector-ref-bv {} id)]".format(env_name))
        defaults.append("[(buffer-index id ty size) (vector-ref {} id)]".format(env_name))

        defaults.append("[(lit v) v]")


        for structs in default_structs:
            defaults.append(self.emit_interpret_def(structs, struct_definer, add_assertions = add_assertions, interpret_name = interpret_name)[1:])


        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v (error \"Unrecognized Term in Interpreter\" v)]"

    def get_asserts(self, dsl_inst, struct_definer):
        return self.constraints_def.emit_dsl_interpreter_constraints(dsl_inst, struct_definer)


    def emit_interpret_def(self, dsl_inst, struct_definer  , add_assertions = True,  env_name = "env", interpret_name = "hydride:interpret"):
        interpret = []

        interpret = [struct_definer.emit_dsl_struct_use(dsl_inst)]


        assertions = []
        if add_assertions:
            assertions += self.get_asserts(dsl_inst, struct_definer)


        interpret += assertions


        sample_ctx = dsl_inst.get_sample_context()

        sub_interpret = []
        for idx,arg in enumerate(sample_ctx.context_args):
            if idx % 3 == 0 and idx != 0:
                sub_interpret.append("\n\t\t")

            if isBitVectorType(arg):
                sub_interpret.append("({} {} {})".format(interpret_name , arg.name, env_name))
            else:
                sub_interpret.append("{}".format(arg.name))

        interpret_fn_name = dsl_inst.name
        if not (sample_ctx.extensions is None) and 'halide' in sample_ctx.extensions:
            interpret_fn_name = "do-"+dsl_inst.name.replace("-vec","")


        interpret_cmd = "({} {})".format(interpret_fn_name, " ".join(sub_interpret))

        interpret.append(interpret_cmd)

        return "\t[ {}\n\t]".format("\n\t\t".join(interpret))

    def emit_interpreter(self, dsl_inst_ls, struct_definer, add_assertions = True, env_name = "env", interpret_name = "hydride:interpret"):

        interpret_clauses = self.emit_default_def(struct_definer , env_name = env_name, add_assertions = add_assertions, interpret_name = interpret_name)
        interpret_clauses += [self.emit_interpret_def(dsl_inst, struct_definer, env_name = env_name, add_assertions = add_assertions, interpret_name = interpret_name) for dsl_inst in dsl_inst_ls]
        interpret_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Interpreter"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        interpreter = "(define ({} prog {})\n (destruct prog\n{}\n )\n)".format(interpret_name, env_name, "\n".join(interpret_clauses))
        return prefix + interpreter + sufix







