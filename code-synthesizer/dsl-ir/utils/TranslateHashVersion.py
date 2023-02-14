from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *

class TranslateHashVersion:

    def __init__(self, translate_hash_name = "translate-expr", input_dsl = [] , output_dsl = []):
        self.translate_hash_name = translate_hash_name
        self.input_dsl = input_dsl
        self.output_dsl = output_dsl

    def emit_default_def(self, struct_definer ):
        defaults = []

        defaults.append("[(reg id) (string-append \"(reg \" (~s id) \")\")]")

        defaults.append("[(lit v) (string-append \"(lit \" (~s v) \")\")]")


        #for structs in default_structs:
        #    defaults.append(self.translate_expr_def(structs, struct_definer, use_conditional = False))

        return ["\t{}".format(d) for d in defaults]


    def emit_fallback_def(self):
        return "\t[_ '()]"



    def get_output_dsl_inst_for_ctx(self, target_inst_name):
        for dsl_inst in self.output_dsl:
            for ctx in dsl_inst.contexts:
                if ctx.name == target_inst_name:
                    return (dsl_inst, ctx)

        assert False, "Target inst "+target_inst_name+" is not in output dict"
        return None


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

            if isinstance(arg, BitVector) or isinstance(arg, ConstBitVector):
                recursive_calls.append("({} {})".format(self.translate_hash_name, get_arg(idx).name))

        predicate = "(and " + predicate +  ")"

        target_dsl, target_ctx = self.get_output_dsl_inst_for_ctx(ctx.name)



        translated_expr = "(string-append "  +"\"("+target_dsl.name+"_dsl \""

        recursive_call_idx = 0
        for idx, arg in enumerate(target_ctx.context_args):
            if isinstance(arg, Integer):
                translated_expr += "\"" + str(arg.value) +"\" " + "\" \" "
            elif isinstance(arg, Precision):
                translated_expr += "\"" + str(arg.value) +"\" "+ "\" \" "


            elif isinstance(arg, LaneSize):
                translated_expr += "\"" + str(arg.value) +"\" "+ "\" \" "


            elif isinstance(arg, BitVector) or isinstance(arg, ConstBitVector):
                assert (recursive_call_idx < len(recursive_calls)), " Unsupported case for " + target_ctx.name
                translated_expr += recursive_calls[recursive_call_idx]+" \" \""
                recursive_call_idx += 1
            else:
                assert False, "Unsupported arg type for translation"


        translated_expr += " \")\")"






        if use_conditional:
            return "[{} \n  {}]".format(predicate, translated_expr)
        else:
            return translated_expr




    def translate_expr_def(self, dsl_inst, struct_definer, use_conditional = True):

        clause = [struct_definer.emit_dsl_struct_use(dsl_inst)]


        cond_clauses = []
        # Iterate over contexts and condition on parameter values
        for ctx in dsl_inst.contexts:
            cond_clauses.append(self.emit_ctx_target_names_clause(ctx, dsl_inst.get_sample_context(), use_conditional = use_conditional))




        cond_clauses.append("[else (error \"Unable to translate for {}\")]".format(dsl_inst.name))
        cond_expr = "(cond \n\t\t"+"\n\t\t".join(cond_clauses) +"\n)\n"

        if use_conditional:
            clause.append(cond_expr)
        else:
            clause.append(cond_clauses[0])



        return "\t[{}\n\t]".format("\n\t\t".join(clause))

    def emit_translate_hash(self, dsl_inst_list, struct_definer):
        ops_clauses = self.emit_default_def(struct_definer)

        ops_clauses += [self.translate_expr_def(dsl_inst, struct_definer) for dsl_inst in dsl_inst_list]


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Translate Def"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"



        get_bv_ops = "(define ({} prog)\n (destruct prog\n{}\n )\n)".format( self.translate_hash_name , "\n".join(ops_clauses))
        return prefix + get_bv_ops + sufix

