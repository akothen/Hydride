from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *


class ConstFold:

    def __init__(self):
        return

    def emit_default_def(self, struct_definer,  const_fold_name="hydride:const-fold", interpret_name="hydride:interpret"):
        defaults = []

        defaults.append("[(dim-x id) (dim-x id)]")
        defaults.append("[(dim-y id) (dim-y id)]")
        defaults.append("[(idx-i id) (idx-i id)]")
        defaults.append("[(idx-j id) (idx-j id)]")
        defaults.append("[(reg id) (reg id) ]")

        defaults.append("[(lit v) (lit v)]")

        defaults.append("[(nop v1) ({} v1)]".format(const_fold_name))
        defaults.append("[(idx-add i1 i2)(idx-add i1 i2) ]")
        defaults.append("[(idx-mul i1 i2) (idx-mul i1 i2) ]")

        for structs in default_structs:
            defaults.append(self.emit_const_fold_def(structs, struct_definer,
                            const_fold_name=const_fold_name, interpret_name=interpret_name)[1:])

        return ["\t{}".format(d) for d in defaults]

    def emit_fallback_def(self):
        return "\t[v (error \"Unrecognized expression\" v)]"

    def emit_is_lit(self, val):
        return "(lit? {})".format(val)

    def emit_fold_expr(self, expr, const_fold_name="hydride:const-fold"):
        folded_name = expr + "-folded"
        definition = "(define {} ({} {}))".format(
            folded_name, const_fold_name, expr)
        return (folded_name, definition)

    def emit_all_lit(self, vals):
        return "(and "+" ".join([self.emit_is_lit(val) for val in vals]) + ")"

    def emit_const_fold_def(self, dsl_inst, struct_definer, const_fold_name="hydride:const-fold", interpret_name="hydride:interpret"):
        interpret = [struct_definer.emit_dsl_struct_use(dsl_inst)]

        fold_subexpr = []
        fold_defs = []

        sample_ctx = dsl_inst.get_sample_context()

        new_expr = ["(", dsl_inst.get_dsl_name()]
        for idx, arg in enumerate(sample_ctx.context_args):

            if isBitVectorType(arg):
                (folded_name, definition) = self.emit_fold_expr(
                    arg.name, const_fold_name=const_fold_name)

                fold_subexpr.append(folded_name)
                fold_defs.append(definition)

                new_expr.append(folded_name)
            else:
                new_expr.append(arg.name)

        new_expr.append(")")

        new_expr = " ".join(new_expr)

        # In the case where not all the arguments
        # are constant, we return the expression
        # but with the (possibly simplified) arguments
        not_all_const_clause = "[else " + new_expr + "]"

        # In the case where all inputs are constant
        # we can evaluate the result of the computation
        # and create a 'lit'. Any expression consuming
        # this sub-expression may further be simplified
        # as a result.
        all_const_clause = []
        all_const_clause.append("[" + self.emit_all_lit(fold_subexpr))
        all_const_clause.append(
            "(lit ({} {} (vector)))".format(interpret_name, new_expr))
        all_const_clause.append("]")
        all_const_clause = "\n".join(all_const_clause)

        interpret += fold_defs

        interpret.append("(cond")
        interpret.append(all_const_clause)
        interpret.append(not_all_const_clause)
        interpret.append(")")

        return "\t[ {}\n\t]".format("\n\t\t".join(interpret))

    def emit_const_fold(self, dsl_inst_ls, struct_definer, const_fold_name="hydride:const-fold", interpret_name="hydride:interpret"):

        interpret_clauses = self.emit_default_def(
            struct_definer, const_fold_name=const_fold_name, interpret_name=interpret_name)
        interpret_clauses += [self.emit_const_fold_def(
            dsl_inst, struct_definer, const_fold_name=const_fold_name, interpret_name=interpret_name) for dsl_inst in dsl_inst_ls]
        interpret_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " DSL Constant Fold Expression"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        interpreter = "(define ({} prog )\n (destruct prog\n{}\n )\n)".format(
            const_fold_name, "\n".join(interpret_clauses))
        return prefix + interpreter + sufix
