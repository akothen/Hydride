from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *


class VisitorDef:

    def __init__(self):
        return

    def emit_default_def(self, struct_definer,  visitor_name="hydride:visitor"):
        defaults = []

        defaults.append("[(dim-x id) (fn prog)]")
        defaults.append("[(dim-y id) (fn prog)]")
        defaults.append("[(idx-i id) (fn prog)]")
        defaults.append("[(idx-j id) (fn prog)]")
        defaults.append("[(reg id) (fn prog) ]")

        defaults.append("[(lit v) (fn prog)]")

        defaults.append("[(nop v1) ({} v1 fn)]".format(visitor_name))
        defaults.append("[(idx-add i1 i2) (fn prog) ]")
        defaults.append("[(idx-mul i1 i2) (fn prog) ]")

        for structs in default_structs:
            defaults.append(self.emit_visitor_def(
                structs, struct_definer, visitor_name=visitor_name)[1:])

        return ["\t{}".format(d) for d in defaults]

    def emit_fallback_def(self):
        return "\t[_ (error \"Unrecognized expression\")]"

    def emit_visit_expr(self, expr, visitor_name="hydride:visitor"):
        folded_name = expr + "-visited"
        definition = "(define {} ({} {} fn))".format(
            folded_name, visitor_name, expr)
        return (folded_name, definition)

    def emit_visitor_def(self, dsl_inst, struct_definer, visitor_name="hydride:visitor"):
        interpret = [struct_definer.emit_dsl_struct_use(dsl_inst)]

        fold_subexpr = []
        fold_defs = []

        sample_ctx = dsl_inst.get_sample_context()

        new_expr = ["(", dsl_inst.get_dsl_name()]
        for idx, arg in enumerate(sample_ctx.context_args):

            if isBitVectorType(arg):
                (folded_name, definition) = self.emit_visit_expr(
                    arg.name, visitor_name=visitor_name)

                fold_subexpr.append(folded_name)
                fold_defs.append(definition)

                new_expr.append(folded_name)
            else:
                new_expr.append(arg.name)

        new_expr.append(")")

        new_expr = " ".join(new_expr)

        interpret += fold_defs

        interpret += ["(fn {})".format(new_expr)]

        return "\t[ {}\n\t]".format("\n\t\t".join(interpret))

    def emit_visitor(self, dsl_inst_ls, struct_definer, visitor_name="hydride:visitor"):

        interpret_clauses = self.emit_default_def(
            struct_definer, visitor_name=visitor_name)
        interpret_clauses += [self.emit_visitor_def(
            dsl_inst, struct_definer, visitor_name=visitor_name) for dsl_inst in dsl_inst_ls]
        interpret_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 + " Hydride Visitor "+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        interpreter = "(define ({} prog fn)\n (destruct prog\n{}\n )\n)".format(
            visitor_name, "\n".join(interpret_clauses))
        return prefix + interpreter + sufix
