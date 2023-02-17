from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *
import sys

class IRPrinter:

    def __init__(self, printer_name = "hydride-printer"):

        self.printer_name = printer_name

    def emit_default_def(self, struct_definer ):
        defaults = []

        defaults.append("[(dim-x id) (string-append \"\\n\"  \"(dim-x \" (~s id) \")\")]")
        defaults.append("[(dim-y id) (string-append \"\\n\" \"(dim-y \" (~s id) \")\")]")
        defaults.append("[(idx-i id) (string-append \"\\n\" \"(idx-i \" (~s id) \")\")]")
        defaults.append("[(idx-j id) (string-append \"\\n\" \"(idx-j \" (~s id) \")\")]")
        defaults.append("[(reg id) (string-append  \"\\n\" \"(reg \" (~s  (bitvector->natural id)) \")\")]")

        defaults.append("[(lit v) (string-append   \"(lit \" (~s v) \")\")]")

        defaults.append("[(nop v1) (string-append \"\\n\" \"(nop \" ({} v1) \")\")]".format( self.printer_name))
        defaults.append("[(idx-add i1 i2) (string-append \"\\n\" \"(idx-add \" (~s i1) (~s i2) \")\" )]")
        defaults.append("[(idx-mul i1 i2) (string-append \"\\n\" \"(idx-mul \" (~s i1) (~s i2) \")\" )]")

        #defaults.append(self.emit_get_len_def(dummy_vector_load_dsl, struct_definer)[1:])


        # Special case handling for vector loads

        load_dsl_use = struct_definer.emit_dsl_struct_use(dummy_vector_load_dsl)
        load_args = dummy_vector_load_dsl.get_sample_context().context_args
        load_len_str = "(string-append \"({} \"".format(dummy_vector_load_dsl.get_dsl_name())
        load_len_expr = "(* {} {})".format(load_args[3].name, load_args[4].name)

        #defaults.append(self.emit_print_clause(dummy_vector_load_dsl, struct_definer))

        # Special case handling for two input swizzle

        #defaults.append(self.emit_print_clause(dummy_vector_swizzle_dsl, struct_definer))


        for structs in default_structs:
            defaults.append(self.emit_print_clause(structs, struct_definer))



        return ["\t{}".format(d) for d in defaults]

    def emit_print_clause(self, dsl_inst, struct_definer):
        return "[{} \n\t(string-append \"\\n\" \n\t{}\n\t{} \"\\n\")]".format(struct_definer.emit_dsl_struct_use(dsl_inst),
                                                   self.emit_base_print_expr(dsl_inst),
                                                   self.emit_output_type_str(dsl_inst, struct_definer))

    def emit_base_print_expr(self, dsl_inst):
        str_expr = "(string-append \"({} \" ".format(dsl_inst.get_dsl_name())
        ir_args = dsl_inst.get_sample_context().context_args

        input_prec_arg = None


        # Identify argument corresponding to input precision
        for ir_arg in ir_args:
            if isinstance(ir_arg, Precision) and ir_arg.input_precision:
                input_prec_arg = ir_arg
                break

            if isinstance(ir_arg, LaneSize) and ir_arg.input_precision:
                input_prec_arg = ir_arg
                break


        # Similarity checking may have folded
        # the argument when all are the same
        if input_prec_arg == None:
            input_precisions = [ctx.in_precision for ctx in dsl_inst.contexts]
            ip_0 = input_precisions[0]
            all_same = all([(ip == ip_0) and (ip != None) for ip in input_precisions])

            if all_same:
                input_prec_arg = Integer(str(ip_0), value = ip_0)




        #assert input_prec_arg != None, "DSL Inst must contain input precision argument "+dsl_inst.name

        for ir_arg in ir_args:
            # Literals don't have any precision information generated during synthesis, hence we use
            # the user of the literals value to identify its type information.

            lit_typeinfo = ""

            # Fallback to default printer
            # as DSL inst provides no precision information
            if input_prec_arg == None :
                lit_typeinfo = "({} {})".format(self.printer_name, ir_arg.name)
            else:
                lit_typeinfo = "(begin (define-values (num_elem arg_prec) (cond [(< (/ (get-length {} (vector 0)) {}) 1)  (values  (/ (get-length {} (vector 0)) (get-prec {} (vector 0))) (/ (get-prec {} (vector 0))) )] [else (values (/ (get-length {} (vector 0)) {}) {})]))".format(ir_arg.name, input_prec_arg.name, ir_arg.name, ir_arg.name, ir_arg.name, ir_arg.name, input_prec_arg.name, input_prec_arg.name)
                #lit_typeinfo = "(begin (define num_elem (/ (get-length {} (vector 0)) {})) ".format(ir_arg.name, input_prec_arg.name)
                lit_typeinfo += "(string-append ({} {}) \" ; \" \"<\" {} \" x i\" {} \">\" \"\\n\" )".format(self.printer_name, ir_arg.name, "(~s num_elem)", "(~s " + "arg_prec" +")")
                lit_typeinfo += ")"


            conditional_printer = "(if (lit? {}) {} ({} {})) \" \"".format(ir_arg.name, lit_typeinfo, self.printer_name, ir_arg.name)
            str_expr += "{} \" \" ".format(conditional_printer)

        str_expr += "\")\")"

        return str_expr


    def emit_output_type_str(self, dsl_inst, struct_definer, get_len_name = "get-length", get_prec_name = "get-prec" , prog_name = "prog"):
        out_prec_arg = None



        get_prec_expr = "({} {} (vector 0))".format(get_prec_name, prog_name )
        num_elem_str = "(~s (/ ({} {} (vector 0)) {}) )".format(get_len_name, prog_name, get_prec_expr)
        prec_str = "(~s {})".format(get_prec_expr)




        return "(string-append \";\" \"<\" {} \" x \" \"i\" {} \">\")".format(num_elem_str, prec_str)


    def emit_fallback_def(self):
        return "\t[v (~s v)]"









    def emit_dsl_printer(self, dsl_inst_list, struct_definer, prog_name = "prog"):
        print_clauses = self.emit_default_def(struct_definer)

        print_clauses += [self.emit_print_clause(dsl_inst, struct_definer) for dsl_inst in dsl_inst_list]

        print_clauses += [self.emit_fallback_def()]



        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Custom Printer"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"



        print_prog  = "(define ({}  {})\n (destruct {}\n{}\n )\n)".format(
            self.printer_name , prog_name, prog_name, "\n".join(print_clauses))
        return prefix + print_prog + sufix

