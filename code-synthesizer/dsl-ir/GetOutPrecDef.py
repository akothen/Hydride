from Instructions import DSLInstruction
from Types import *
from PredefinedDSL import *

class GetOutPrecDef:

    def __init__(self, get_prec_name = "get-prec"):
        self.get_prec_name = get_prec_name

        # List of DSL Instructions for which the
        # length is ambigous
        self.unclear_lengths = []

    def emit_default_def(self, struct_definer , env_name = "env"):
        defaults = []

        defaults.append("[(dim-x id) 1]".format(env_name, env_name))
        defaults.append("[(dim-y id) 1]".format(env_name, env_name))
        defaults.append("[(idx-i id) 1]".format(env_name, env_name))
        defaults.append("[(idx-j id) 1]".format(env_name, env_name))
        defaults.append("[(reg id) (bvlength (vector-ref {} id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC".format(env_name))

        defaults.append("[(lit v) (bvlength v)]")

        defaults.append("[(nop v1) ({} v1 {})]".format( self.get_prec_name,env_name))
        defaults.append("[(idx-add i1 i2) 1]".format(env_name, env_name))
        defaults.append("[(idx-mul i1 i2) 1]".format(env_name, env_name))

        #defaults.append(self.emit_get_len_def(dummy_vector_load_dsl, struct_definer)[1:])


        # Special case handling for vector loads

        load_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_load_dsl)
        load_args = dummy_vector_load_dsl.get_sample_context().context_args
        load_prec_expr = "{}".format(load_args[4].name)
        defaults.append("[{} {}]".format(load_dsl_use, load_prec_expr))

        # Special case handling for two input swizzle

        swizzle_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_swizzle_dsl)
        swizzle_args = dummy_vector_swizzle_dsl.get_sample_context().context_args
        swizzle_prec_expr = "{}".format(swizzle_args[2].name)
        defaults.append("[{} {}]".format(swizzle_dsl_use, swizzle_prec_expr))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v 1]"





    def emit_ctx_prec_clause(self, ctx):
        predicate = ""
        size_expr = ""

        for idx, arg in enumerate(ctx.context_args):
            if isinstance(arg, Integer):
                predicate += " (equal? {} {})".format(arg.name, arg.value)

            if isinstance(arg, Precision):
                predicate += " (equal? {} {})".format(arg.name, arg.value)

            if isinstance(arg, LaneSize):
                predicate += " (equal? {} {})".format(arg.name, arg.value)

        predicate = "(and " + predicate +  ")"



        if size_expr == "" and ctx.out_precision != None:
            size_expr = str(ctx.out_precision)

        for idx, arg in enumerate(ctx.context_args):
            if isinstance(arg, Precision):
                if arg.output_precision and size_expr == "":
                    size_expr = arg.name


        if size_expr == "" and ctx.out_precision == None:
            print("UNKNOWN Precision")
            size_expr = "-1 ; Unable to reason about precision\n"


        return "[{} {}]".format(predicate, size_expr)




    def emit_get_prec_def(self, dsl_inst, struct_definer,
                         env_name = "env"):

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]



        cond_clauses = []
        # Iterate over contexts and condition on parameter values
        for ctx in dsl_inst.contexts:
            cond_clauses.append(self.emit_ctx_prec_clause(ctx))

        cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"
        clause.append(cond_expr)



        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def emit_get_prec(self, dsl_inst_list, struct_definer, env_name = "env"):
        prec_clauses = self.emit_default_def(struct_definer, env_name = env_name)

        prec_clauses += [self.emit_get_prec_def(dsl_inst, struct_definer, env_name = env_name) for dsl_inst in dsl_inst_list]

        prec_clauses += self.emit_fallback_def(env_name = env_name)


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Get Output Precision"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"



        get_len = "(define ({} prog {})\n (destruct prog\n{}\n )\n)".format( self.get_prec_name , env_name, "\n".join(prec_clauses))
        return prefix + get_len + sufix
