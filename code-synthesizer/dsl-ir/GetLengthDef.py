from Instructions import DSLInstruction
from Types import *
from PredefinedDSL import *

class GetLengthDef:

    def __init__(self, get_len_name = "get-length"):
        self.get_len_name = get_len_name

        # List of DSL Instructions for which the
        # length is ambigous
        self.unclear_lengths = []

    def emit_default_def(self, struct_definer , env_name = "env"):
        defaults = []

        defaults.append("[(dim-x id) 1]".format(env_name, env_name))
        defaults.append("[(dim-y id) 1]".format(env_name, env_name))
        defaults.append("[(idx-i id) 1]".format(env_name, env_name))
        defaults.append("[(idx-j id) 1]".format(env_name, env_name))
        defaults.append("[(reg id) (bvlength (vector-ref {} id))]".format(env_name))

        defaults.append("[(lit v) (bvlength v)]")

        defaults.append("[(nop v1) ({} v1 {})]".format( self.get_len_name,env_name))
        defaults.append("[(idx-add i1 i2) 1]".format(env_name, env_name))
        defaults.append("[(idx-mul i1 i2) 1]".format(env_name, env_name))

        #defaults.append(self.emit_get_len_def(dummy_vector_load_dsl, struct_definer)[1:])


        # Special case handling for vector loads

        load_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_load_dsl)
        load_args = dummy_vector_load_dsl.get_sample_context().context_args
        load_len_expr = "(* {} {})".format(load_args[3].name, load_args[4].name)
        defaults.append("[{} {}]".format(load_dsl_use, load_len_expr))

        # Special case handling for two input swizzle

        swizzle_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_swizzle_dsl)
        swizzle_args = dummy_vector_swizzle_dsl.get_sample_context().context_args
        swizzle_len_expr = "(* (/ {} {}) (* 2 {}) {})".format(
            swizzle_args[2].name, swizzle_args[5].name, swizzle_args[6].name, swizzle_args[3].name
        )
        defaults.append("[{} {}]".format(swizzle_dsl_use, swizzle_len_expr))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v 1]"


    def get_output_size_operand(self, dsl_inst):

        sample_ctx = dsl_inst.get_sample_context()


        for idx, arg in enumerate(sample_ctx.context_args):
            if isinstance(arg, Integer):
                if arg.name.startswith("size") and "_o" in arg.name:
                    return arg


        return None



    def emit_ctx_len_clause(self, ctx):
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



        if size_expr == "" and ctx.out_vectsize != None:
            size_expr = str(ctx.out_vectsize)

        for idx, arg in enumerate(ctx.context_args):
            if isinstance(arg, Integer):
                if arg.name.startswith("size") and "_o" in arg.name and size_expr == "":
                    size_expr = str(arg.value)


        if size_expr == "" and ctx.out_vectsize == None:
            print("UNKNOWN SIZE")
            size_expr = "-1 ; Unable to reason about length\n"

        if ctx.name in ["_mm256_movm_epi64", "_mm_movm_epi16", "_mm512_movm_epi64"]:
            ctx.print_context()



        return "[{} {}]".format(predicate, size_expr)




    def emit_get_len_def(self, dsl_inst, struct_definer,
                         env_name = "env"):

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]


        output_size_arg = self.get_output_size_operand(dsl_inst)

        cond_clauses = []
        # Iterate over contexts and condition on parameter values
        for ctx in dsl_inst.contexts:
            cond_clauses.append(self.emit_ctx_len_clause(ctx))

        if len(cond_clauses) == 1:
            clause.append(output_size_arg.name)
        else:
            cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"
            clause.append(cond_expr)
        """

        if output_size_arg != None:
            assert output_size_arg != None, "DSL instruction does not define output size"

            #clause.append(output_size_arg.name)
            cond_clauses = []
            # Iterate over contexts and condition on parameter values
            for ctx in dsl_inst.contexts:
                cond_clauses.append(self.emit_ctx_len_clause(ctx))

            if len(cond_clauses) == 1:
                clause.append(output_size_arg.name)
            else:
                cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"
                clause.append(cond_expr)


        else:
            self.unclear_lengths.append(dsl_inst)
            clause.append("-1 ;; Unable to reason about length")
        """



        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def emit_get_length(self, dsl_inst_list, struct_definer, env_name = "env"):
        length_clauses = self.emit_default_def(struct_definer, env_name = env_name)

        length_clauses += [self.emit_get_len_def(dsl_inst, struct_definer, env_name = env_name) for dsl_inst in dsl_inst_list]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Get Length"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"


        print("Unable to infer lengths for {} DSL Instructions: ".format(len(self.unclear_lengths)))

        get_len = "(define ({} prog {})\n (destruct prog\n{}\n )\n)".format( self.get_len_name , env_name, "\n".join(length_clauses))
        return prefix + get_len + sufix

