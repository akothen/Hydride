from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import default_structs



class ContainsDef:

    def __init__(self):
        return

    def emit_default_def(self, struct_definer, contains_name="repair:contains", interpreter_name = "repair:interpret-hydride"):
        defaults = []
        defaults.append("[(lit v) #f ]")
        defaults.append("[(reg id) #f ]")
        return ["\t{}".format(d) for d in defaults]

    def emit_dsl_contains_assert(self, operand_defs, expr_def, dsl_id):
        return "(equal? query-ref {})".format(dsl_id)

    def emit_dsl_operands_not_equal_result(self, operand_defs, expr_def, dsl_id):
        clauses = ["(not (equal? {} {}))".format(expr_def, od) for od in operand_defs]
        return clauses

    def set_dsl_id(self, dsl_list):
        for idx, dsl_inst in enumerate(dsl_list):
            dsl_inst.dsl_id = idx

    def can_allow_identity(self, dsl_inst):
        bv_ops = []
        for ctx in dsl_inst.contexts:
            bv_ops += ctx.get_bv_ops()
        bv_ops = list(set(bv_ops))
        VALID_IDENTITY_OPS = ["extract", "concat", "bvsmax", "bvumax", "bvsmin", "bvumin", "bvand", "bvor", "bvsgt", "bvugt",
                              "bvslt", "bvult"]
        for op in bv_ops:
            if op not in VALID_IDENTITY_OPS:
                return False
        return True
    def emit_dsl_contains_def(self, dsl_inst, struct_definer,  contains_name="repair:contains" , interpreter_name = "repair:interpret", env_name = "env"):

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]





        sample_ctx = dsl_inst.get_sample_context()

        sub_clause = []
        sub_defs = []
        operand_contains_def = []
        all_lits_constraint = []
        inputs_symbolics_constraint = []

        interpret_expr = "({} {} {})".format(interpreter_name , "prog", env_name)
        interpret_expr_def = "(define prog-interpret {})".format(interpret_expr)
        clause.append(interpret_expr_def)
        for idx,arg in enumerate(sample_ctx.context_args):
            if isBitVectorType(arg):
                interpret_operand = "({} {} {})".format(interpreter_name , arg.name, env_name)
                interpret_def = "(define {}-interpret {})".format(arg.name, interpret_operand)
                sub_clause.append(interpret_def)
                sub_defs.append("{}-interpret".format(arg.name))

                is_symbolic = "(symbolic? {}-interpret)".format(arg.name)
                inputs_symbolics_constraint.append(is_symbolic)
                operand_contains = "({} {} query-ref env)".format(contains_name, arg.name)
                operand_contains_def.append(operand_contains)

                is_lit = "(lit? {})".format(arg.name)
                all_lits_constraint.append(is_lit)

        clause += sub_clause

        result_concrete = " (symbolic? {})".format("prog-interpret")
        # If any input is symbolic, but the output is always concrete, then we don't want this case either
        symbolic_const = "" #"(and {} (or {}))".format(result_concrete, " ".join(inputs_symbolics_constraint))
        contains_assertion = self.emit_dsl_contains_assert(sub_defs, "prog-interpret",dsl_inst.dsl_id)
        not_equal_assertions = self.emit_dsl_operands_not_equal_result(sub_defs, "prog-interpret",dsl_inst.dsl_id)
        not_equal_assertions = "\n".join(not_equal_assertions)
        not_lit_assert = "(not (and {}))".format(" ".join(all_lits_constraint))
        assertions = [contains_assertion,  not_lit_assert, symbolic_const]

        if False and not self.can_allow_identity(dsl_inst):
            assertions.append(not_equal_assertions)

        check = "(and \n{}\n)".format("\n".join(assertions))
        check = "(or \n{} \n{})".format(check, "\n".join(operand_contains_def))
        clause.append(check)






        return "\t[ {}\n\t]".format("\n\t\t".join(clause))


    def emit_fallback_def(self):
        return "\t[v  (error \"Unrecognized Term in contain\" v)]"

    def emit_contains(self, dsl_list, struct_definer, contains_name="hydride:contains", interpreter_name = "hydride:interpret"):
        default_contains = self.emit_default_def(
            struct_definer)

        self.set_dsl_id(dsl_list)
        dsl_contains = [self.emit_dsl_contains_def(
            dsl_inst, struct_definer, contains_name=contains_name, interpreter_name = interpreter_name) for dsl_inst in dsl_list]

        contains_clauses = default_contains + dsl_contains + [self.emit_fallback_def()]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " DSL Contains Def"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        contains_model = "(define ({} prog query-ref env)\n (destruct prog\n{}\n )\n)".format(
            contains_name, "\n".join(contains_clauses))
        return prefix + contains_model + sufix
