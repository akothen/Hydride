from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *


class GetVariants:

    def __init__(self, get_variant_name="get-variants"):
        self.get_variant_name = get_variant_name

    def emit_default_def(self, struct_definer):
        defaults = []

        # defaults.append("[(reg id) (reg id)]")
        # defaults.append("[(lit v) (lit v)]")

        for structs in default_structs:
            defaults.append(self.get_variant_names_def(
                structs, struct_definer, use_conditional=False))

        return ["\t{}".format(d) for d in defaults]

    def emit_fallback_def(self):
        return "\t[_ '()]"

    def emit_ctx_target_names_clause(self, ctx, sample_ctx, use_conditional=True):
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
                recursive_calls.append("({} {})".format(
                    self.get_variant_name, get_arg(idx).name))

        predicate = "(and " + predicate + ")"

        ctx_ops = "(list  \"" + ctx.name + "\")"

        ops_expr = " (append {} {})".format(ctx_ops, " ".join(recursive_calls))

        if use_conditional:
            return "[{} \n  {}]".format(predicate, ops_expr)
        else:
            return ops_expr

    def get_variant_names_def(self, dsl_inst, struct_definer, use_conditional=True):

        clause = ["(equal? prog {})".format(dsl_inst.name + "_dsl")]

        input_precs_str = self.get_dsl_input_precs(dsl_inst)
        input_sizes_str = self.get_dsl_input_sizes(dsl_inst)
        variants_str = self.get_variants_list(dsl_inst, struct_definer)

        clause += [input_precs_str, input_sizes_str, variants_str]

        filter_fn = self.get_filter_fn()

        relavent_indices = "(define relavent-indices (filter filter-fn (range 0 {})))".format(
            len(dsl_inst.contexts))

        relavent_variants = "(for/list ([i relavent-indices]) (list-ref variants i))"

        clause += [filter_fn, relavent_indices, relavent_variants]

        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def get_filter_fn(self):
        return """
            (define (filter-fn i)
              (define length-condition #f)
              (define prec-condition #f)

              (for/list ([l input-sizes])
                        (for/list ([l_ (list-ref input-size-dsl i)])
                                  (cond [(equal? l l_) (set! length-condition #t)] )
                                  )
                        )

              (for/list ([p input-precs])
                        (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                        )

              (and length-condition prec-condition)
              )
        """

    def get_dsl_input_precs(self, dsl_inst):
        definition = ["(define input-precs-dsl (list "]

        for ctx in dsl_inst.contexts:
            if ctx.in_precision != None:
                definition.append(str(ctx.in_precision))
            else:
                definition.append("-1")

        definition += [" ))"]

        return " ".join(definition)

    def get_dsl_input_sizes(self, dsl_inst):
        definition = ["(define input-size-dsl (list  "]

        for ctx in dsl_inst.contexts:
            sizes = "(list "

            for arg in ctx.context_args:
                if isinstance(arg, BitVector):
                    sizes += str(arg.size) + " "

            sizes += ")"

            definition += [sizes]

        definition += [") )"]

        return " ".join(definition)

    def get_variants_list(self, dsl_inst, struct_definer):

        variants = "(list "

        for ctx in dsl_inst.contexts:

            definition = ["(" + dsl_inst.name + "_dsl"]

            reg_idx = 0

            for arg in ctx.context_args:
                if isinstance(arg, BitVector):
                    definition += ["(reg (bv {} 8))".format(reg_idx)]
                    reg_idx += 1
                elif isinstance(arg, BoundedBitVector):
                    definition += ["(reg (bv {} 8))".format(reg_idx)]
                    reg_idx += 1
                elif isinstance(arg, ConstBitVector):
                    definition += [arg.get_dsl_value()]
                else:
                    definition.append(str(arg.value))

            definition += [")"]
            variants += " ".join(definition) + " \n"

        variants += ")"

        return "(define variants {})".format(variants)

    def emit_get_names(self, dsl_inst_list, struct_definer):
        ops_clauses = self.emit_default_def(struct_definer)

        ops_clauses += [self.get_variant_names_def(dsl_inst, struct_definer)
                        for dsl_inst in dsl_inst_list]

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " DSL Get Variants"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        get_bv_ops = "(define ({} prog input-sizes input-precs)\n (cond \n{}\n )\n)".format(
            self.get_variant_name, "\n".join(ops_clauses))
        return prefix + get_bv_ops + sufix
