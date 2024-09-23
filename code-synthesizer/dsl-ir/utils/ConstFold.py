from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *


class ConstFold:

    def __init__(self, aggressive = False):

        # When enabled, the constant folding
        # aggressively simplies cases where
        # some of the operands are constant
        self.aggressive = aggressive
        return

    def emit_default_def(self, struct_definer,  const_fold_name="hydride:const-fold", interpret_name="hydride:interpret"):
        defaults = []

        defaults.append("[(dim-x id) (dim-x id)]")
        defaults.append("[(dim-y id) (dim-y id)]")
        defaults.append("[(idx-i id) (idx-i id)]")
        defaults.append("[(idx-j id) (idx-j id)]")
        defaults.append("[(reg id) (reg id) ]")
        defaults.append("[(buffer-index id type size) (buffer-index id type size) ]")

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

        partial_const_clauses = []
        # Insert aggressive simplification clauses
        if self.aggressive:

            # As we want to create symbolic holes we'll need to
            # the size of the symbolic arguments
            size_arg = None
            for idx, arg in enumerate(sample_ctx.context_args):
                if isinstance(arg, Integer) and "size_i" in arg.name:
                    size_arg = arg
                    break
            if size_arg != None:
                for idx, arg in enumerate(sample_ctx.context_args):
                    if isBitVectorType(arg):
                        reg_counter = 0
                        new_context = []
                        other_args_folded = []
                        for idx2, arg2 in enumerate(sample_ctx.context_args):
                            if idx2 == idx:
                                new_context.append(arg.name+"-folded")
                            elif isBitVectorType(arg2):
                                new_context.append("(reg (bv {} 4))".format(reg_counter))
                                other_args_folded.append(arg2.name+"-folded")
                                reg_counter += 1
                            else:
                                new_context.append(arg2.name)
                        partial_list_clause = ["[(lit? {})".format(arg.name+"-folded")]
                        holes = ["(?? (bitvector {}))".format(size_arg.name)] * reg_counter
                        test_env = "(define test-env (vector {}))".format(" ".join(holes))

                        test_expr = "(define test-expr ({} {}))".format(dsl_inst.get_dsl_name(), " ".join(new_context))

                        partial_list_clause.append(test_env)
                        partial_list_clause.append(test_expr)

                        test_result = "(define test-result ({} test-expr test-env))".format(interpret_name)

                        partial_list_clause.append(test_result)

                        condition_clauses = []

                        concrete_case = "[(concrete? test-result) (lit test-result)]"
                        condition_clauses.append(concrete_case)

                        for r in range(reg_counter):
                            equal_operand_case = "[(equal? test-result (vector-ref test-env {}))  {}]".format(r, other_args_folded[r])
                            condition_clauses.append(equal_operand_case)
                        else_case = "[else {}]".format(new_expr)
                        condition_clauses.append(else_case)

                        condition_stmt = "(cond {})".format("\n".join(condition_clauses))
                        partial_list_clause.append(condition_stmt)
                        partial_list_clause.append("]")
                        partial_const_clauses.append("\n".join(partial_list_clause))














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
        interpret += partial_const_clauses
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
