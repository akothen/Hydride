from Instructions import DSLInstruction
from Types import *

class InterpreterDef:

    def __init__(self):
        return


    def emit_default_def(self, env_name = "env"):
        defaults = []

        defaults.append("[(idx-i id) (vector-ref {} (- (vector-length {}) 2))]".format(env_name, env_name))
        defaults.append("[(idx-j id) (vector-ref {} (- (vector-length {}) 1))]".format(env_name, env_name))
        defaults.append("[(reg id) (vector-ref {} id)]".format(env_name))

        defaults.append("[(lit v) v]")

        defaults.append("[(nop v1) (interpret v1 {})]".format(env_name))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v v]"

    def emit_interpret_def(self, dsl_inst, struct_definer  , add_assertions = True,  env_name = "env"):
        interpret = [struct_definer.emit_dsl_struct_use(dsl_inst)]

        if add_assertions:
            pass


        sample_ctx = dsl_inst.get_sample_context()

        sub_interpret = []
        for idx,arg in enumerate(sample_ctx.context_args):
            if idx % 3 == 0 and idx != 0:
                sub_interpret.append("\n\t\t")
            sub_interpret.append("(interpret {} {})".format(arg.name, env_name))

        interpret_cmd = "({} {})".format(dsl_inst.name, " ".join(sub_interpret))

        interpret.append(interpret_cmd)

        return "\t[ {}\n\t]".format("\n\t\t".join(interpret))

    def emit_interpreter(self, dsl_inst_ls, struct_definer, add_assertions = True, env_name = "env"):

        interpret_clauses = self.emit_default_def(env_name = env_name)
        interpret_clauses += [self.emit_interpret_def(dsl_inst, struct_definer, env_name = env_name) for dsl_inst in dsl_inst_ls]
        interpret_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Interpreter"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        interpreter = "(define (interpret prog {})\n (destruct prog\n{}\n )\n)".format(env_name, "\n".join(interpret_clauses))
        return prefix + interpreter + sufix







