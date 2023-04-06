from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *

class ExtractExprDepth:

    def __init__(self, extract_name = "extract-expr"):
        self.extract_name = extract_name


    def emit_default_def(self, struct_definer ):
        defaults = []

        defaults.append("[(reg id) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))]")

        defaults.append("[(lit v) (values (lit v) num-consumed) ]")


        for structs in default_structs:
            defaults.append(self.emit_extract_def(structs, struct_definer, use_conditional = False))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self):
        return "\t[_ '()]"





    def emit_ctx_extract_clause(self, dsl_inst, ctx, sample_ctx, use_conditional = True):
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
                prev_num_consumed_name = ""

                if len(recursive_calls) == 0:
                    prev_num_consumed_name = "num-consumed"
                else:
                    prev_num_consumed_name = "num-consumed-{}".format(len(recursive_calls)-1)

                recursive_calls.append("({} {} {} (- depth 1))".format(self.extract_name, get_arg(idx).name, prev_num_consumed_name))

        predicate = "(and " + predicate +  ")" + "; " + ctx.name +"\n"

        define_values = []

        for idx, call in enumerate(recursive_calls):
            define_value = "(define-values (expr-{} num-consumed-{}) {})".format(idx,idx, call)
            define_values.append(define_value)


        definitions = "\n".join(define_values) + "\n"




        ops_expr = "(" + dsl_inst.get_dsl_name()  +" "

        index = 0


        for idx, arg in enumerate(ctx.context_args):

            if isinstance(arg, BitVector):
                ops_expr += "expr-{}".format(index)
                index += 1
            else:
                ops_expr += get_arg(idx).name

            ops_expr += " "

        ops_expr += ")"

        latest_num_consumed_name = "num-consumed"

        if len(recursive_calls) != 0:
            latest_num_consumed_name = "num-consumed-{}".format(len(recursive_calls)-1)

        ops_expr = "(values {} {})".format(ops_expr, latest_num_consumed_name)


        if use_conditional:
            return "[{} \n {} \n {}]".format(predicate, definitions, ops_expr)
        else:
            return definitions + "\n" + ops_expr




    def emit_extract_def(self, dsl_inst, struct_definer, use_conditional = True):
        self.struct_definer = struct_definer

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]


        cond_clauses = []
        # Iterate over contexts and condition on parameter values
        for ctx in dsl_inst.contexts:
            cond_clauses.append(self.emit_ctx_extract_clause(dsl_inst, ctx, dsl_inst.get_sample_context(), use_conditional = use_conditional))




        cond_clauses.append("[else (error \"Unable to extract  for {}\")]".format(dsl_inst.name))
        cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"

        if use_conditional:
            clause.append(cond_expr)
        else:
            clause.append(cond_clauses[0])



        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def emit_extract(self, dsl_inst_list, struct_definer):
        ops_clauses = self.emit_default_def(struct_definer)

        ops_clauses += [self.emit_extract_def(dsl_inst, struct_definer) for dsl_inst in dsl_inst_list]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Extract Subexpressions"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"


        condition = "(cond [(equal? depth 0) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))] \n[else\n(destruct prog\n{}\n )\n]\n)".format("\n".join(ops_clauses))

        get_bv_ops = "(define ({} prog num-consumed depth)\n {} \n)".format(self.extract_name , condition)
        return prefix + get_bv_ops + sufix

