from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *

class ScaleDef:

    def __init__(self, base_vect_size = None):
        self.base_vect_size = base_vect_size


    def emit_default_def(self, struct_definer ,  scale_name = "hydride:scale-expr"):
        defaults = []

        defaults.append("[(reg id) (reg id) ]")

        # Replace literal with the same exact value represented in higher bitwidth
        # defaults.append("[(lit v) (lit (integer->bitvector (bitvector->integer v) (bitvector (* scale-factor (bvlength v)))))]")

        # Replace literal with the same value concatenated scale-factor times to itself
        defaults.append("[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]")



        for structs in default_structs:
            defaults.append(self.emit_scale_def(structs, struct_definer, scale_name = scale_name , conditional = False )[1:])


        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self):
        return "\t[_ (error \"Unrecognized expression\")]"






    def emit_scale_def(self, dsl_inst, struct_definer, scale_name = "hydride:scale-expr", conditional = True):
        interpret = [struct_definer.emit_dsl_struct_use(dsl_inst)]

        fold_subexpr = []
        fold_defs = []


        sample_ctx = dsl_inst.get_sample_context()

        new_expr = []

        if conditional:
            clauses = []
            for ctx in dsl_inst.contexts:
                # Current knobs specific to X86
                if ctx.can_scale_context(scale_factor = 4):
                    condition = "[(and "
                    scalable_arg_indices = ctx.get_scalable_args_idx(base_vector_size = None)
                    for idx, arg in enumerate(ctx.context_args):
                        if idx in scalable_arg_indices:
                            condition += " (equal? {} {})".format(sample_ctx.context_args[idx].name, (arg.value // 4))

                    condition += ")\n"

                    condition+= "("+dsl_inst.get_dsl_name()+"\n"
                    for idx,arg in enumerate(sample_ctx.context_args):
                        if idx in scalable_arg_indices:
                            condition += ("(* scale-factor {})\n".format(arg.name))
                        elif isinstance(arg, BitVector):
                            condition += ("({} {} scale-factor)\n".format(scale_name, arg.name))
                        else:
                            condition += (arg.name)+"\n"
                    condition += ")\n"
                    condition += "]"

                    clauses.append(condition)

            clauses.append("[else (error \"Unable to identify how to scale up \" prog)]")

            new_expr.append("(cond ")
            new_expr += clauses
            new_expr.append(")")

        else:
            new_expr = ["(", dsl_inst.get_dsl_name()]
            context_scalable_args_idx = sample_ctx.get_scalable_args_idx(base_vector_size = self.base_vect_size)
            for idx,arg in enumerate(sample_ctx.context_args):
                if idx in context_scalable_args_idx:
                    new_expr.append("(* scale-factor {})".format(arg.name))
                elif isinstance(arg, BitVector):
                    new_expr.append("({} {} scale-factor)".format(scale_name, arg.name))
                else:
                    new_expr.append(arg.name)
            new_expr.append(")")

        interpret += new_expr


        return "\t[ {}\n\t]".format("\n\t\t".join(interpret))

    def emit_scale(self, dsl_inst_ls, struct_definer, scale_name = "hydride:scale-expr"):

        interpret_clauses = self.emit_default_def(struct_definer, scale_name = scale_name)
        interpret_clauses += [self.emit_scale_def(dsl_inst, struct_definer, scale_name = scale_name) for dsl_inst in dsl_inst_ls if dsl_inst.supports_scaling()]
        interpret_clauses.append(self.emit_fallback_def())

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" Hydride Scale Expression "+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        interpreter = "(define ({} prog scale-factor)\n (destruct prog\n{}\n )\n)".format(scale_name, "\n".join(interpret_clauses))
        return prefix + interpreter + sufix







