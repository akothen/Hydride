from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *

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
        defaults.append("[(reg id) (bvlength (vector-ref-bv {} id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC".format(env_name))

        defaults.append("[(lit v) (bvlength v)]")

        defaults.append("[(nop v1) ({} v1 {})]".format( self.get_prec_name,env_name))
        defaults.append("[(idx-add i1 i2) 1]".format(env_name, env_name))
        defaults.append("[(idx-mul i1 i2) 1]".format(env_name, env_name))

        #defaults.append(self.emit_get_len_def(dummy_vector_load_dsl, struct_definer)[1:])


        # Special case handling for vector loads

        load_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_load_dsl)
        load_args = dummy_vector_load_dsl.get_sample_context().context_args
        load_prec_expr = "{}".format(load_args[4].name)
        #defaults.append("[{} {}]".format(load_dsl_use, load_prec_expr))

        # Special case handling for two input swizzle

        swizzle_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_swizzle_dsl)
        swizzle_args = dummy_vector_swizzle_dsl.get_sample_context().context_args
        swizzle_prec_expr = "{}".format(swizzle_args[2].name)
        defaults.append("[{} {}]".format(swizzle_dsl_use, swizzle_prec_expr))


        # Special case handling for vector two interleave

        dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_two_interleave_dsl)
        args = dummy_vector_two_interleave_dsl.get_sample_context().context_args
        len_expr = "{}".format(args[3].name)
        defaults.append("[{} {}]".format(dsl_use, len_expr))


        # Special case handling for vector  interleave

        dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_interleave_dsl)
        args = dummy_vector_interleave_dsl.get_sample_context().context_args
        len_expr = "{}".format(args[2].name)
        defaults.append("[{} {}]".format(dsl_use, len_expr))


        # Special case handling for vector  deinterleave

        dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_deinterleave_dsl)
        args = dummy_vector_deinterleave_dsl.get_sample_context().context_args
        len_expr = "{}".format(args[2].name)
        defaults.append("[{} {}]".format(dsl_use, len_expr))


        # Special case handling for llvm vector shuffle

        dsl_use = struct_definer.emit_dsl_struct_use(dummy_llvm_shuffle_dsl)
        args = dummy_llvm_shuffle_dsl.get_sample_context().context_args
        len_expr = "{}".format(args[3].name)
        defaults.append("[{} {}]".format(dsl_use, len_expr))


        # Special case handling for llvm vector SIMD operations
        for dsl_struct in llvm_simd_structs:
            dsl_use = struct_definer.emit_dsl_struct_use(dsl_struct)
            args = dsl_struct.get_sample_context().context_args
            len_expr = "{} ".format(args[3].name)
            defaults.append("[{} {}]".format(dsl_use, len_expr))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self, env_name = "env"):
        return "\t[v 1]"


    def emit_ctx_bounded_prec_clause(self, ctx, sample_ctx):

        def get_arg(i):
            return sample_ctx.context_args[i]


        conditional = "(cond\n"

        for out_prec, setting in ctx.out_bound_map.items():

            arg_name = get_arg(setting[0]).name

            condition = "(equal? {} (lit (bv {} (bitvector {}))) )".format(arg_name, setting[1], ctx.get_bounded_bv_size())

            clause = "[{} {}]".format(condition, out_prec)
            conditional += clause +"\n"



        conditional += ")\n"


        return conditional



    # Sample context sample ctx is used to define
    # argument names
    def emit_ctx_prec_clause(self, ctx, sample_ctx):
        predicate = ""
        size_expr = ""



        def get_arg(i):
            return sample_ctx.context_args[i]

        for idx, arg in enumerate(ctx.context_args):
            if isinstance(arg, Integer):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

            if isinstance(arg, Precision):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

            if isinstance(arg, LaneSize):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

        predicate = "(and " + predicate +  ")"


        # If context contains a bounded variable, we can simply check the
        # value of the bounded variable
        if ctx.is_bounded:
           size_expr =  self.emit_ctx_bounded_prec_clause(ctx, sample_ctx)
           return "[{} {}]".format(predicate, size_expr)



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
            cond_clauses.append(self.emit_ctx_prec_clause(ctx, dsl_inst.get_sample_context()))

        cond_clauses.append("[else (error \"Unable to infer prec for {}\")]".format(dsl_inst.name))

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

