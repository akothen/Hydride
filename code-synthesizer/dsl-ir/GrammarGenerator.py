from Types import *
from Instructions import *

class GrammarGenerator:

    def __init__(self ):
        return



    def emit_grammar_hole(self, vars_name, depth_name, grammar_name):
        return "({} {} #:depth (- {} 1))".format(grammar_name, vars_name, depth_name)

    def emit_grammar_clause(self, dsl_inst, grammar_args , vars_name = "vars",
                             depth_name = "k", grammar_name = "operations"):

        grammar_clause = ["("]

        grammar_clause.append(dsl_inst.get_dsl_name())

        for ga in grammar_args:

            if ga.is_hole:
                grammar_clause.append(self.emit_grammar_hole(vars_name, depth_name, grammar_name) +" "+ga.get_rkt_comment())
            else:
                grammar_clause.append(ga.get_dsl_value() +"\t\t\t\t"+ga.get_rkt_comment())

        combined = "\n\t\t".join(grammar_clause)

        grammar_clause = ["\t[(choose* #t #f)"] + [combined] + [")]"]

        return "\n\t".join(grammar_clause)

    def emit_grammar_layer(self, layer_name = "grammar_layer", layer_dsl_insts = [],
                           layer_dsl_args_list = [],
                           vars_name = "vars", depth_name = "k"):

        assert len(layer_dsl_insts) == len(layer_dsl_args_list), "Each grammar rule should have an argument context"

        assert_depth = "\t(assert (> {} 0))".format(depth_name)
        choose_vars = "\t[(choose* #t #f) (apply choose* {})]".format(vars_name)

        clauses = []
        for i in range(0, len(layer_dsl_insts)):
            clauses.append(self.emit_grammar_clause(layer_dsl_insts[i], layer_dsl_args_list[i],
                                                    vars_name = vars_name, depth_name = depth_name,
                                                    grammar_name = layer_name))
        define_grammar = "(define ({} {} #:depth {})".format(layer_name, vars_name, depth_name)

        return define_grammar +"\n" +assert_depth +"\n" +"\t(cond" + "\n"+ choose_vars +"\n" +"\n".join(clauses)+"\n\t)"+"\n)\n"



    def emit_grammar(self, memory_layer_name = "mem", memory_dsl_insts = [],
                     memory_dsl_args_list = [],
                     operation_layer_name = "operations", operation_dsl_insts = [],
                     operation_dsl_args_list = [],
                     top_level_grammar_name = "synth_grammar"):

        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Grammar"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"










