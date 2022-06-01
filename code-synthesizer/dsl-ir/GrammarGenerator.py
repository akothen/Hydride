from Types import *
from Instructions import *



class GrammarGenerator:

    def __init__(self ):
        return



    def emit_grammar_hole(self, vars_name, depth_name, grammar_name, decrement = True):
        if decrement:
            return "({} {} #:depth (- {} 1))".format(grammar_name, vars_name, depth_name)
        else:
            return "({} {} #:depth {})".format(grammar_name, vars_name, depth_name)

    def emit_grammar_clause(self, dsl_inst, grammar_args , vars_name = "vars",
                             depth_name = "k", grammar_name = "operations",
                            last_clause = False):

        grammar_clause = ["("]

        grammar_clause.append(dsl_inst.get_dsl_name())

        for ga in grammar_args:

            if ga.is_hole and dsl_inst.name == "vector-load":
                grammar_clause.append("(apply choose* {})".format(vars_name))
            elif ga.is_hole:
                grammar_clause.append(self.emit_grammar_hole(vars_name, depth_name, grammar_name) +" "+ga.get_rkt_comment())
            else:
                grammar_clause.append(ga.get_dsl_value() +"\t\t\t\t"+ga.get_rkt_comment())

        combined = "\n\t\t".join(grammar_clause)

        if last_clause:
            grammar_clause = ["\t[else"] + [combined] + [")]"]
        else:
            grammar_clause = ["\t[(choose* #t #f)"] + [combined] + [")]"]

        return "\n\t".join(grammar_clause)

    def emit_lit_hole(self, bv_size):
        return "(lit (create-symbolic-bv {}))".format(bv_size)

    def emit_lit_hole_clause(self, bv_size, last_clause = False):
        condition = None

        if last_clause:
            condition = "\t[else"
        else:
            condition = "\t[(choose* #t #f)"

        hole = self.emit_lit_hole(bv_size)

        close = "]"

        return "\n\t".join([condition, hole, close])



    def emit_other_grammar_reference(self, other_grammar, last_clause = False, vars_name = "vars",
                                     depth_name = "k"):
        command = []
        if last_clause:
            command = ["\t[else"] + [self.emit_grammar_hole(vars_name, depth_name, other_grammar, decrement = False)] +["]"]
        else:
            command = ["\t[(choose* #t #f)"] + [self.emit_grammar_hole(vars_name, depth_name, other_grammar, decrement = False)] +["]"]

        return "\n\t".join(command)


    def emit_grammar_layer(self, layer_name = "grammar_layer", layer_dsl_insts = [],
                           layer_dsl_args_list = [],
                           vars_name = "vars", depth_name = "k",
                           other_grammars = [],
                           lit_holes = []):

        assert len(layer_dsl_insts) == len(layer_dsl_args_list), "Each grammar rule should have an argument context"

        assert_depth = "\t(assert (> {} 0))".format(depth_name)
        choose_vars = "\t[(choose* #t #f) (apply choose* {})]".format(vars_name)

        clauses = []
        for i in range(0, len(layer_dsl_insts)):
            clauses.append(self.emit_grammar_clause(layer_dsl_insts[i], layer_dsl_args_list[i],
                                                    vars_name = vars_name, depth_name = depth_name,
                                                    grammar_name = layer_name, last_clause = (i == len(layer_dsl_insts) -1) and len(other_grammars) == 0 and len(lit_holes) == 0))
        for idx, og in enumerate(other_grammars):
            clauses.append(self.emit_other_grammar_reference(og, last_clause = (len(lit_holes) == 0) and (idx == len(other_grammars) -1), vars_name = vars_name,
                                                             depth_name = depth_name))


        for idx, lh in enumerate(lit_holes):
            clauses.append(self.emit_lit_hole_clause(lh, last_clause = (idx == (len(lit_holes) - 1))))



        define_grammar = "(define ({} {} #:depth {})".format(layer_name, vars_name, depth_name)

        return define_grammar +"\n" +assert_depth +"\n" +"\t(cond" + "\n"+ choose_vars +"\n" +"\n".join(clauses)+"\n\t)"+"\n)\n"



    def emit_grammar(self, memory_layer_name = "mem", memory_dsl_insts = [],
                     memory_dsl_args_list = [],
                     shuffle_layer_name = "shuffle", shuffle_dsl_insts = [],
                     shuffle_dsl_args_list = [],
                     operation_layer_name = "operations", operation_dsl_insts = [],
                     operation_dsl_args_list = [],
                     top_level_grammar_name = "synth_grammar",
                     top_level_grammar_args = [],
                     depth = 6,
                     lit_holes = []):





        # Leaves in the grammar tree to load from memory
        mem_layer = self.emit_grammar_layer(layer_name = memory_layer_name,
                                            layer_dsl_insts = memory_dsl_insts,
                                            layer_dsl_args_list = memory_dsl_args_list,
                                            lit_holes = lit_holes)

        # TODO: Shuffle layer
        shuffle_layer = self.emit_grammar_layer(layer_name = shuffle_layer_name,
                                            layer_dsl_insts = shuffle_dsl_insts,
                                            layer_dsl_args_list = shuffle_dsl_args_list,
                                                other_grammars = [memory_layer_name])

        # Layer which performs the operations on the organized vectors
        operation_layer = self.emit_grammar_layer(layer_name = operation_layer_name,
                                            layer_dsl_insts = operation_dsl_insts,
                                            layer_dsl_args_list = operation_dsl_args_list,
                                                other_grammars = [shuffle_layer_name])

        top_level_grammar = "(define {} ({} (list {}) #:depth {} ))".format(top_level_grammar_name,
                                                                            operation_layer_name,
                                                                            " ".join(top_level_grammar_args),
                                                                            depth)


        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Grammar"+'\n'
        prefix += ";; "+"="*80 + "\n"

        grammar_tree = mem_layer + "\n" + shuffle_layer  + "\n" + operation_layer +"\n" + top_level_grammar

        sufix = "\n;; "+"="*80 + "\n"

        return prefix + "\n" + grammar_tree + "\n" + sufix










