from Types import *
from Instructions import *



class SimpleGrammarGenerator:

    def __init__(self ):
        return



    def emit_grammar_hole(self, vars_name, depth_name, grammar_name, decrement = True):
        return "(expr)"

    def emit_grammar_clause(self, dsl_inst, grammar_args , vars_name = "vars",
                             depth_name = "k", grammar_name = "operations",
                            last_clause = False):

        grammar_clause = ["("]

        grammar_clause.append(dsl_inst.get_dsl_name())

        for ga in grammar_args:

            if ga.is_hole:
                grammar_clause.append(self.emit_grammar_hole(vars_name, depth_name, grammar_name) +" "+ga.get_rkt_comment())
            else:
                grammar_clause.append(ga.get_dsl_value() +"\t\t\t\t"+ga.get_rkt_comment())

        combined = "\n\t\t".join(grammar_clause)

        grammar_clause = ["\t"] + [combined] + [")"]

        return "\n\t".join(grammar_clause)

    def emit_lit_hole(self, bv_size, prec):
        splat_factor = bv_size // prec

        sym_bv_str = "(create-symbolic-bv {})".format(prec)
        sym_bv_str = "(?? (bitvector {}))".format(prec)
        return "(lit (create-splat-bv {} {}))".format(sym_bv_str, splat_factor)


    def emit_lit_0(self, bv_size, prec):
        return "(lit (bv 0 (bitvector {})))".format(bv_size)


    def emit_lit_1(self, bv_size, prec):
        splat_factor = bv_size // prec
        return "(lit (create-splat-bv (bv 1 (bitvector {})) {}))".format(prec, splat_factor)



    def emit_lit_hole_clause(self, bv_size, prec, last_clause = False):


        hole = "" # self.emit_lit_hole(bv_size, prec)
        zero = self.emit_lit_0(bv_size, prec)
        one = self.emit_lit_1(bv_size, prec)



        return "\n\t".join([hole,zero, one])




    def emit_other_grammar_reference(self, other_grammar, last_clause = False, vars_name = "vars",
                                     depth_name = "k"):
        command =  [self.emit_grammar_hole(vars_name, depth_name, other_grammar, decrement = False)]

        return "\n\t".join(command)


    def emit_grammar_layer(self, layer_name = "grammar_layer", layer_dsl_insts = [],
                           layer_dsl_args_list = [],
                           vars_name = "vars", depth_name = "k",
                           other_grammars = [],
                           lit_holes = [], num_inputs = None):

        assert len(layer_dsl_insts) == len(layer_dsl_args_list), "Each grammar rule should have an argument context"


        choose_vars = ""

        if num_inputs != None:
            for i in range(num_inputs):
                choose_vars += "(reg (bv {} 4)) ".format(i)





        clauses = []
        for i in range(0, len(layer_dsl_insts)):
            clauses.append(self.emit_grammar_clause(layer_dsl_insts[i], layer_dsl_args_list[i],
                                                    vars_name = vars_name, depth_name = depth_name,
                                                    grammar_name = layer_name, last_clause = (i == len(layer_dsl_insts) -1) and len(other_grammars) == 0 and len(lit_holes) == 0))


        for idx, lh in enumerate(lit_holes):
            clauses.append(self.emit_lit_hole_clause(lh[0], lh[1], last_clause = (idx == (len(lit_holes) - 1))))



        define_grammar = "(define-grammar ({} {})".format(layer_name+"_tree", vars_name)



        return define_grammar +"\n" +"\t[expr (choose" + "\n"+ choose_vars + "\n"  +"\n" +"\n".join(clauses)+"\n\t)]"+"\n)\n"



    def emit_grammar(self, memory_layer_name = "mem", memory_dsl_insts = [],
                     memory_dsl_args_list = [],
                     shuffle_layer_name = "shuffle", shuffle_dsl_insts = [],
                     shuffle_dsl_args_list = [],
                     operation_layer_name = "operations", operation_dsl_insts = [],
                     operation_dsl_args_list = [],
                     top_level_grammar_name = "synth_grammar",
                     top_level_grammar_args = [],
                     depth = 6,
                     lit_holes = [],
                     num_inputs = None):





        # Layer which performs the operations on the organized vectors
        operation_layer = self.emit_grammar_layer(layer_name = operation_layer_name,
                                            layer_dsl_insts = operation_dsl_insts,
                                            layer_dsl_args_list = operation_dsl_args_list,
                                                  # TEMP
                                                  lit_holes = lit_holes,
                                                  # TEMP
                                                other_grammars = [],
                                                  num_inputs = num_inputs)



        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Grammar"+'\n'
        prefix += ";; "+"="*80 + "\n"

        grammar_depth_fn = "(define ({} k) ({} 'a #:depth k ))\n".format(operation_layer_name, operation_layer_name+"_tree")


        grammar_tree =  operation_layer +"\n" +  grammar_depth_fn

        sufix = "\n;; "+"="*80 + "\n"

        return prefix + "\n" + grammar_tree + "\n" + sufix










