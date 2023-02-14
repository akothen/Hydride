from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *

class GetTargetNames:

    def __init__(self, get_target_name = "get-target-name"):
        self.get_target_name = get_target_name

    def emit_default_def(self, struct_definer ):
        defaults = []

        defaults.append("[(reg id) '()]")

        defaults.append("[(lit v) '()]")


        for structs in default_structs:
            defaults.append(self.get_target_names_def(structs, struct_definer, use_conditional = False))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self):
        return "\t[_ '()]"





    def emit_ctx_target_names_clause(self, ctx, sample_ctx, use_conditional = True):
        predicate = ""


        def get_arg(i):
            return sample_ctx.context_args[i]

        recursive_calls = []

        for idx, arg in enumerate(ctx.context_args):
            if isinstance(arg, Integer):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

            if isinstance(arg, Precision):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

            if isinstance(arg, LaneSize):
                predicate += " (equal? {} {})".format(get_arg(idx).name, arg.value)

            if isinstance(arg, BitVector):
                recursive_calls.append("({} {})".format(self.get_target_name, get_arg(idx).name))

        predicate = "(and " + predicate +  ")"



        ctx_ops = "(list  \""+ ctx.name + "\")"

        ops_expr = " (append {} {})".format(ctx_ops, " ".join(recursive_calls))


        if use_conditional:
            return "[{} \n  {}]".format(predicate, ops_expr)
        else:
            return ops_expr




    def get_target_names_def(self, dsl_inst, struct_definer, use_conditional = True):

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]


        cond_clauses = []
        # Iterate over contexts and condition on parameter values
        for ctx in dsl_inst.contexts:
            cond_clauses.append(self.emit_ctx_target_names_clause(ctx, dsl_inst.get_sample_context(), use_conditional = use_conditional))




        cond_clauses.append("[else (error \"Unable to get name  for {}\")]".format(dsl_inst.name))
        cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"

        if use_conditional:
            clause.append(cond_expr)
        else:
            clause.append(cond_clauses[0])



        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def emit_get_names(self, dsl_inst_list, struct_definer):
        ops_clauses = self.emit_default_def(struct_definer)

        ops_clauses += [self.get_target_names_def(dsl_inst, struct_definer) for dsl_inst in dsl_inst_list]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Get Names"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"



        get_bv_ops = "(define ({} prog)\n (destruct prog\n{}\n )\n)".format( self.get_target_name , "\n".join(ops_clauses))
        return prefix + get_bv_ops + sufix

