from Instructions import DSLInstruction
from Types import *
from PredefinedDSL import *

class BindDef:

    def __init__(self):
        return


    def emit_default_def(self, struct_definer , env_name = "env"):
        defaults = []

        defaults.append("[(dim-x id) (dim-x id)]")
        defaults.append("[(dim-y id) (dim-y id)]")
        defaults.append("[(idx-i id) (idx-i id)]")
        defaults.append("[(idx-j id) (idx-j id)]")
        defaults.append("[(reg id) (vector-ref {} id)]".format(env_name))

        defaults.append("[(lit v) (lit v)]")

        defaults.append("[(nop v1) (nop (bind-expr v1 {}))]".format(env_name))
        defaults.append("[(idx-add i1 i2) (idx-add i1 i2)]")
        defaults.append("[(idx-mul i1 i2) (idx-mul i1 i2)]")

        defaults.append(self.emit_bind_def(dummy_vector_load_dsl, struct_definer)[1:])
        defaults.append(self.emit_bind_def(dummy_vector_swizzle_dsl, struct_definer)[1:])

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v v]"



    def emit_bind_def(self, dsl_inst, struct_definer , env_name = "env"):
        bind = [struct_definer.emit_dsl_struct_use(dsl_inst)]



        sample_ctx = dsl_inst.get_sample_context()

        sub_bind = []
        for idx,arg in enumerate(sample_ctx.context_args):
            if idx % 3 == 0 and idx != 0:
                sub_bind.append("\n\t\t")
            sub_bind.append("(bind-expr {} {})".format(arg.name, env_name))

        bind_cmd = "({} {})".format(dsl_inst.get_dsl_name(), " ".join(sub_bind))

        bind.append(bind_cmd)

        return "\t[ {}\n\t]".format("\n\t\t".join(bind))

    def emit_binder(self, dsl_inst_ls, struct_definer,  env_name = "env"):

        bind_clauses = self.emit_default_def(struct_definer , env_name = env_name)
        bind_clauses += [self.emit_bind_def(dsl_inst, struct_definer, env_name = env_name) for dsl_inst in dsl_inst_ls]
        bind_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Binder"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        binder = "(define (bind-expr prog {})\n (destruct prog\n{}\n )\n)".format(env_name, "\n".join(bind_clauses))
        return prefix + binder + sufix






