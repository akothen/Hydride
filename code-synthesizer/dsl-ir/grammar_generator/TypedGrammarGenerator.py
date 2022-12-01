from common.Types import *
from common.Instructions import *



class TypedGrammarGenerator:

    def __init__(self ):
        self.typed_contexts = {}




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

    def emit_lit_hole(self, bv_size, prec):
        splat_factor = bv_size // prec
        return "(lit (create-splat-bv (?? (bitvector {})) {}))".format(prec, splat_factor)


    def emit_lit_0(self, bv_size, prec):
        return "(lit (bv 0 (bitvector {})))".format(bv_size)

    def emit_lit_neg_1(self, bv_size, prec):
        return "(lit (bv -1 (bitvector {})))".format(bv_size)


    def emit_lit_1(self, bv_size, prec):
        splat_factor = bv_size // prec
        return "(lit (create-splat-bv (bv 1 (bitvector {})) {}))".format(prec, splat_factor)


    def emit_lit_imm(self, imm, bv_size, prec):
        splat_factor = bv_size // prec
        return "(lit (create-splat-bv (integer->bitvector {} (bitvector {})) {}))".format(imm, prec, splat_factor)

    def emit_lit_ramp(self, bv_size, prec):
        splat_factor = bv_size // prec
        create_ramp = "(create-tensor 1 {} {})".format(splat_factor, prec)
        return "(lit {})".format(create_ramp)



    def emit_lit_hole_clause(self, bv_size, prec, last_clause = False):
        condition = None

        if last_clause:
            condition = "\t[else"
        else:
            condition = "\t[(choose* #t #f)"

        hole =  self.emit_lit_hole(bv_size, prec)
        zero = self.emit_lit_0(bv_size, prec)
        one = self.emit_lit_1(bv_size, prec)
        neg_one = self.emit_lit_neg_1(bv_size, prec)
        ramp = self.emit_lit_ramp(bv_size, prec)

        imm_clauses = [self.emit_lit_imm(imm ,bv_size, imm_prec) for (imm,imm_prec) in self.imms if imm not in [1,0,-1] ]

        zero_clause = "[(choose* #t #f) {}]".format(zero)
        one_clause = "[(choose* #t #f) {}]".format(one)

        neg_one_clause = "[(choose* #t #f) {}]".format(neg_one)

        ramp_clause = "[(choose* #t #f) {}]".format(ramp)

        close = "]"

        hole_clause =  "\n\t".join([condition, hole, close])

        imm_clause = ["[(choose* #t #f) {}]".format(imm) for imm in imm_clauses]

        return "\n".join([zero_clause, one_clause, neg_one_clause] + imm_clause)


    def is_broadcast_like_operation(self, dsl_inst):
        ops = dsl_inst.get_semantics_ops_list()

        return all([op in ["sign-extend", "zero-extend", "extract", "concat"] for op in ops])


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
            clauses.append(self.emit_lit_hole_clause(lh[0], lh[1], last_clause = (idx == (len(lit_holes) - 1))))



        define_grammar = "(define ({} {} #:depth {})".format(layer_name, vars_name, depth_name)

        if len(clauses) == 0:
            return define_grammar +"\n" +assert_depth +"\n" +  "\t(apply choose* {})".format(vars_name)+"\n)\n"


        return define_grammar +"\n" +assert_depth +"\n" +"\t(cond" + "\n"+ choose_vars + "\n"+ extra_choose +"\n" +"\n" +"\n".join(clauses)+"\n\t)"+"\n)\n"


    def emit_typed_grammar_clause(self, dsl_inst, ctx , vars_name = "vars",
                             depth_name = "k",
                            last_clause = False):

        grammar_args = [arg for arg in ctx.context_args]
        grammar_clause = ["("]

        grammar_clause.append(dsl_inst.get_dsl_name())




        # Add a grammar hole for non-constant bitvector arguments of
        # the matching bitvector type
        for ga in grammar_args:

            if ga.is_hole:

                self.init_typed_context(ga.size)
                grammar_name = self.get_layer_name(ga.size)

                grammar_clause.append(self.emit_grammar_hole(vars_name, depth_name, grammar_name) +" "+ga.get_rkt_comment())
            else:
                grammar_clause.append(ga.get_dsl_value() +"\t\t\t\t"+ga.get_rkt_comment())

        combined = "\n\t\t".join(grammar_clause)


        # For specifications which require operating on differing bitwidths
        # , it's almost certain that some form of casting (up or down) will
        # be needed. Hence for valid inputs, add a fixed rule for cast ops
        # so a smaller depth can be used.
        is_broadcast_like = self.is_broadcast_like_operation(dsl_inst)


        joined_clause = []

        for idx, input_size in enumerate(self.input_sizes):
            if not is_broadcast_like:
                break

            clause = ["(", dsl_inst.get_dsl_name()]
            use_clause = True

            for ga in grammar_args:

                if ga.is_hole:

                    self.init_typed_context(ga.size)

                    if ga.size != input_size:
                        use_clause = False
                        break
                    reg_idx = "(bv {} (bitvector 4))".format(idx)
                    clause.append("(reg {})".format(reg_idx) +" "+ga.get_rkt_comment())
                else:
                    clause.append(ga.get_dsl_value() +"\t\t\t\t"+ga.get_rkt_comment())
            if use_clause:
                joined_clause.append(
                    "[(choose* #t #f)"+ "\n\t\t".join(clause) +" \n)]"
                )




        if last_clause:
            joined_clause += (["\t[else"] + [combined] + [")]"])
        else:
            joined_clause += (["\t[(choose* #t #f)"] + [combined] + [")]"])

        return "\n\t".join(joined_clause)


    def emit_choose_reg(self, reg_id):
        reg_idx = "(bv {} (bitvector 4))".format(reg_id)
        return "[(choose* #t #f) (reg  {})]".format(reg_idx)

    def emit_choose_lit(self, bv_size, prec):
        return self.emit_lit_hole_clause(bv_size,prec)

    def emit_typed_grammar_layer(self, layer_name = "grammar_layer", layer_dsl_insts = [], layer_dsl_args_list = [],
                                 layer_output_len = 256, vars_name = "vars", depth_name = "k",
                                 lit_holes = [], input_sizes = []):

        clauses = []

        # First list input registers and literals
        for idx, inp_size in enumerate(input_sizes):
            if inp_size == layer_output_len:
                clauses.append(self.emit_choose_reg(idx))

        for lit in lit_holes:
            if lit[0] == layer_output_len:
                clauses.append(self.emit_choose_lit(lit[0], lit[1]))




        for idx in range(0, len(layer_dsl_insts)):
            clauses.append(
                self.emit_typed_grammar_clause(layer_dsl_insts[idx],
                                               layer_dsl_args_list[idx],
                                               vars_name = vars_name,
                                               depth_name = depth_name,
                                               last_clause = (idx + 1 == len(layer_dsl_insts)))
            )


        assert_depth = "\t(assert (> {} 0))".format(depth_name)
        define_grammar = "(define ({} {} #:depth {})".format(layer_name, vars_name, depth_name)

        return define_grammar +"\n" +assert_depth +"\n" +"\t(cond" + "\n" +"\n".join(clauses)+"\n\t)"+"\n)\n"


    def init_typed_context(self, output_size):
        if output_size not in self.typed_contexts:
            self.typed_contexts[output_size] = { "ops": [], "ctx": [] , "name": self.get_layer_name(output_size), "lits" : [], "regs":  [] }




    def seperate_contexts_by_type(self, operation_dsl_insts,
                                  operation_dsl_args_list,
                                  top_level_grammar_name,
                                  return_type,
                                  lit_holes,
                                  input_sizes):

        for idx in range(0, len(operation_dsl_insts)):
            op = operation_dsl_insts[idx]
            ctx = operation_dsl_args_list[idx]

            output_size = ctx.out_vectsize


            self.init_typed_context(output_size)


            self.typed_contexts[output_size]["ops"].append(op)
            self.typed_contexts[output_size]["ctx"].append(ctx)


        for lit in lit_holes:
            self.init_typed_context(lit[0])

        for inp in input_sizes:
            self.init_typed_context(inp)


    def get_layer_name(self, bv_type):

        bv_type = int(bv_type)

        if bv_type == self.return_type:
            return self.operation_layer_name
        else:
            return self.operation_layer_name + "-bv"+str(bv_type)



    def emit_grammar(self,
                     operation_layer_name = "operations", operation_dsl_insts = [],
                     operation_dsl_args_list = [],
                     top_level_grammar_name = "synth_grammar",
                     top_level_grammar_args = [],
                     depth = 6,
                     return_type = 256,
                     lit_holes = [],
                     input_sizes = [],
                     imms = []
                     ):

        self.return_type = return_type
        self.operation_layer_name = operation_layer_name
        self.input_sizes = input_sizes
        self.imms = imms

        # Sort grammar operations into buckets identified by the return type
        # of the operation contexts

        self.seperate_contexts_by_type(operation_dsl_insts,
                                       operation_dsl_args_list,
                                       top_level_grammar_name,
                                       return_type,
                                       lit_holes,
                                       input_sizes)




        grammars = []

        for bv_sizes, grammar_context in self.typed_contexts.items():
            grammar_name = self.get_layer_name(bv_sizes)

            grammar = self.emit_typed_grammar_layer(layer_name = self.get_layer_name(bv_sizes),
                                                    layer_dsl_insts = grammar_context['ops'],
                                                    layer_dsl_args_list = grammar_context['ctx'],
                                                    layer_output_len = bv_sizes,
                                                    lit_holes = lit_holes,
                                                    input_sizes = input_sizes
                                                    )

            grammars.append(grammar)









        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" DSL Grammar"+'\n'
        prefix += ";; "+"="*80 + "\n"

        grammar_tree = "\n\n".join(grammars)

        sufix = "\n;; "+"="*80 + "\n"

        return prefix + "\n" + grammar_tree + "\n" + sufix










