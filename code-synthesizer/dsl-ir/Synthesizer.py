from Types import *
from Instructions import *
from PredefinedDSL import *
import random

DEBUG = False

class Synthesizer:

    def __init__(self, spec = None, dsl_operators = [],
                 struct_definer = None, grammar_generator = None,
                 vectorization_factor = 8,
                 depth = 6,
                 contexts_per_dsl_inst = None):

        self.spec = spec
        self.dsl_operators = dsl_operators
        self.struct_definer = struct_definer
        self.grammar_generator = grammar_generator
        self.VF = vectorization_factor
        self.depth = depth
        self.output_slice_length = self.VF * self.spec.output_precision
        self.contexts_per_dsl_inst = contexts_per_dsl_inst
        self.input_sizes = [shape[0] * shape[1] * self.spec.input_precision for shape in self.spec.input_shapes]

        self.output_size = self.spec.get_output_size()


    def get_memory_loads(self):

        def create_scalar_mul(scale, rhs):
            scale_factor = Integer("scale", value = scale)

            if rhs == "dim-y":
                rhs = ShapeVariable(name = "dim-y")
            elif rhs == "dim-x":
                rhs = ShapeVariable(name = "dim-x")
            elif isinstance(rhs, OperandType):
                pass
            else:
                rhs = Integer("rhs_scalar", value = rhs)

            return IndexExpr(scale_factor, rhs, expr_type = IndexExprTypeEnum.Mul)

        load_factors = []#[1.0, 1.5]
        offset_exprs = [ create_affine_index_expr("dim-y", 1, None ), # (i * dim-y) + j
                        create_affine_index_expr("dim-y", 1, create_scalar_mul(1, "dim-y") ), # ((i+1) * dim-y) + j = (i * dim-y) + j + dim-y
                        create_affine_index_expr("dim-y", 1, create_scalar_mul(2, "dim-y"))
                        ]

        input_vector_sizes = []
        offsets = []
        num_elem_sizes = []
        precisions = []




        for lf in load_factors:
            for input_size in self.input_sizes:
                for of in offset_exprs:
                    num_elem = int(lf * self.VF)
                    offset =  of #create_affine_index_expr("dim-y", 1, None ) #"IDX_IJ"
                    precision = self.spec.input_precision

                    input_vector_sizes.append(input_size)
                    offsets.append(offset)
                    num_elem_sizes.append(num_elem)
                    precisions.append(precision)


        return create_vector_load_dsl(input_vector_sizes = input_vector_sizes,
                                      offsets = offsets,
                                      num_elem_sizes = num_elem_sizes,
                                      precisions = precisions)


    def get_memory_shuffles(self):
        load_factors = [1.0, 1.5]
        group_factors = [0.25, 0.5]#, 1.0]
        lane_offsets_factors = [0] #[0, "IDX_J"]
        dis_factors = [1]
        rotate_factors = [0]


        input_vector_sizes = []
        num_elem_sizes = []
        group_sizes = []
        dis_sizes = []
        rotate_sizes = []
        precisions = []
        lane_offsets = []
        lane_sizes = []




        for lf in load_factors:
            for input_size in self.input_sizes:
                for gf in group_factors:
                    for lo in lane_offsets_factors:
                        for d in dis_factors:
                            for r in rotate_factors:
                                input_vector_sizes.append(input_size)
                                num_elem_sizes.append(self.VF)
                                precisions.append(self.spec.input_precision)
                                lane_offsets.append(lo)
                                lane_sizes.append(self.VF)
                                group_sizes.append(int(gf * self.VF))
                                dis_sizes.append(d)
                                rotate_sizes.append(r)

        return create_two_input_swizzle(input_vector_sizes = input_vector_sizes,
                                        num_elem_sizes = num_elem_sizes,
                                        group_sizes = group_sizes,
                                        lane_offsets = lane_offsets,
                                        lane_sizes = lane_sizes,
                                        dis_sizes = dis_sizes,
                                        rotate_sizes = rotate_sizes,
                                        precisions = precisions)


    def get_top_level_grammar_args(self):
        registers = 0
        for arg in self.spec.args:
            if isinstance(arg, BitVector):
                registers +=1

        return ["(reg {})".format(i) for i in range(0, registers)]


    def get_lit_holes(self, use_lit_holes, bitvector_sizes):

        load_factors = [1.0]
        holes = []

        if use_lit_holes:
            holes = [int(lf * self.VF * self.spec.input_precision) for lf in load_factors]
            holes += bitvector_sizes
            # remove duplicates
            holes = list(set(holes))

        return holes

    def emit_synthesis_grammar(self, main_grammar_name = "synth_grammar", use_lit_holes = True):

        ## Memory loading layer
        spec_memory_loads = self.get_memory_loads()
        memory_dsl_insts = [spec_memory_loads] * len(spec_memory_loads.contexts)
        memory_dsl_args_list = [ctx.context_args for ctx in spec_memory_loads.contexts]

        # List of sizes of the bitvectors which may be produced
        # or consumed by either layers.
        bitvector_sizes = []

        ## Memory Shuffle layer
        spec_memory_shuffles = self.get_memory_shuffles()
        memory_shuffle_insts = [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list = [ctx.context_args for ctx in spec_memory_shuffles.contexts]


        ## Operation Layers

        operation_dsl_insts = []
        operation_dsl_args_list = []

        for dsl_inst in self.dsl_operators:

            if self.consider_dsl_inst(dsl_inst):
                operator_contexts = self.get_supported_context_for_dsl(dsl_inst, limit = self.contexts_per_dsl_inst)

                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx.context_args for ctx in operator_contexts]

                continue

            ## Including bitwise operations such as bitwise 'or',  'not', 'neg' & 'and'
            ## may enable more novel arithemetic results
            if False and self.consider_bitwise_heuristic(dsl_inst):
                print("BITWISE OPERATIONS INCLUDED")
                operator_contexts = self.get_supported_bitwise_context_for_dsl(dsl_inst, limit = self.contexts_per_dsl_inst)
                print("#bitwise contexts: ", len(operator_contexts))
                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx.context_args for ctx in operator_contexts]


        top_level_grammar_args = self.get_top_level_grammar_args()

        for context_args in operation_dsl_args_list:
            for ctx_arg in context_args:
                if isinstance(ctx_arg, BitVector):
                    bitvector_sizes.append(ctx_arg.size)


        for context_args in memory_shuffle_args_list:
            for ctx_arg in context_args:
                if isinstance(ctx_arg, BitVector):
                    bitvector_sizes.append(ctx_arg.size)

        bitvector_sizes = list(set(bitvector_sizes))


        lit_holes = self.get_lit_holes(use_lit_holes, bitvector_sizes)

        print("="*50)
        print("Number of Load DSL Instructions:\t",len(memory_dsl_args_list)+len(lit_holes) + len(top_level_grammar_args))
        print("Number of Shuffle DSL Instructions:\t",len(memory_shuffle_args_list))
        print("Number of DSL Compute Instructions:\t",len(operation_dsl_args_list))


        return self.grammar_generator.emit_grammar(
            memory_layer_name = main_grammar_name + "_mem",
            memory_dsl_insts = memory_dsl_insts,
            memory_dsl_args_list = memory_dsl_args_list,
            shuffle_layer_name = main_grammar_name + "_shuffle",
            shuffle_dsl_insts = memory_shuffle_insts,
            shuffle_dsl_args_list = memory_shuffle_args_list,
            operation_layer_name = main_grammar_name + "_operations",
            operation_dsl_insts = operation_dsl_insts,
            operation_dsl_args_list = operation_dsl_args_list,
            top_level_grammar_name = main_grammar_name,
            top_level_grammar_args = top_level_grammar_args,
            depth = self.depth,
            lit_holes = lit_holes
        )



    def get_random_bv(self, bv_size, name = "rand_val"):
        # If can be represented using Hex values
        if bv_size % 4  == 0:
            values = [str(i) for i in range(0,10)] + ["a","b","c", "d","e", "f"]
            bv_val ="#x" +  "".join(random.choices(values, k = bv_size // 4))
            return ConstBitVector(bv_val, bv_size, name = name )
        else:
            values = ["0","1"]
            bv_val ="#b" + "".join(random.choices(values, k = bv_size))
            return ConstBitVector(bv_val, bv_size, name = name )



    def create_concrete_spec_inputs(self, prefix = "cex_0_"):

        concrete_values = []
        definitions = []


        for arg in self.spec.args:
            if isinstance(arg, BitVector):
                bv_name = prefix+str(len(concrete_values))
                const_bv =  self.get_random_bv(arg.size, name = bv_name )
                concrete_values.append(const_bv)
                definitions.append(const_bv.get_rkt_definition())



        return (concrete_values, definitions)


    def create_concrete_inputs_vector(self, args_list, i_range, i_step,
                                      j_range, j_step):

        output_shape = self.spec.output_shape
        definitions = []
        concrete_vector_map = {}
        for idx, arg_tupple in enumerate(args_list):
            concrete_vector_map['args_{}'.format(idx)] = {}
            for i in range(0,i_range, i_step):
                concrete_vector_map['args_{}'.format(idx)][str(i)] = {}
                for j in range(0, j_range, j_step):
                    arg_names = [arg.name for arg in arg_tupple]

                    env_name = "env_{}_i{}_j{}".format(idx, i, j)
                    vector_args = arg_names + [str(i), str(j)] + [str(output_shape[0]), str(output_shape[1])]

                    vector_def = "(define {} (vector {}))".format(env_name, " ".join(vector_args))
                    definitions.append(vector_def)



                    concrete_vector_map['args_{}'.format(idx)][str(i)][str(j)] = env_name


        return concrete_vector_map , definitions

    def emit_vector_load(self, value, value_size, start_index, num_elem, precision):
        return "(vector-load {} {} {} {} {})".format(value, value_size, start_index, num_elem, precision)


    def emit_assert_eq(self, lhs, rhs):
        return "(assert (equal? {} {}))".format(lhs, rhs)

    def emit_synthesis_constraints(self, args_tupple_list , vector_map, grammar_name = "synth_grammar"):

        constraints = []

        for idx, arg_tupple in enumerate(args_tupple_list):
            spec_result = self.spec.emit_invoke_spec([arg.name for arg in arg_tupple])
            vmap_entry = vector_map['args_{}'.format(idx)]
            for i in vmap_entry:
                for j in vmap_entry[i]:
                    result_offset = (int(i) * self.spec.output_shape[1] + int(j))

                    spec_slice = self.emit_vector_load(spec_result, self.output_size, result_offset, self.VF, self.spec.output_precision)

                    interpret_cmd = "(interpret {} {})".format(grammar_name, vmap_entry[i][j])
                    constraints.append(
                        self.emit_assert_eq(interpret_cmd , spec_slice)
                    )

        return constraints




    def emit_evaluate_synth_res(self, prog):
        assert_sol = "(assert (sat? sol) \"Unsatisfiable\")"
        define_sol = "(define synth_res (evaluate {} sol))".format(prog)
        print_sol = "(pretty-print synth_res)"
        print_cost = "(displayln \"Cost:\")"
        print_cost += "\n" + "(println (cost synth_res))"


        return "\n".join([assert_sol, define_sol, print_sol, print_cost])



    def emit_synth_function_body(self, function_name , grammar_name, num_inputs, output_shape, i_step, j_step):
        bv_args = ["arg{}".format(i) for i in range(num_inputs)]
        argument_vector = "(vector {} i j num_rows num_cols)".format(" ".join(bv_args), output_shape[0], output_shape[1])

        func = ["\n"]
        func += ["(define ({} {} num_rows num_cols)".format(function_name, " ".join(bv_args))]
        func +=  ["\t(apply concat (for/list ([i (in-range 0 num_rows {})])".format(i_step)]
        func +=  ["\t\t(apply concat (for/list ([j (in-range 0 num_cols {})])".format(j_step)]
        func += ["\t\t\t(interpret {} {})".format(grammar_name, argument_vector)]
        func += ["\t\t))"]
        func += ["\t))"]
        func += [")"]

        synth_invoke_str = ("({}".format(function_name))+" {} " + ("{} {})".format(output_shape[0], output_shape[1]))

        return "\n".join(func), synth_invoke_str


    def emit_display_evaluate_symbolic(self, sym_label, cex_name = "cex"):
        display_str = ["(displayln \"{}\")".format(sym_label)]
        display_str += ["(println (evaluate {} {}))".format(sym_label, cex_name)]
        return display_str


    def emit_verification_query(self, synthesized_function_invoke_str , inputs ):
        sym_args = []

        for idx, arg in enumerate(inputs):
            sym_label = "arg_{}".format(idx)
            sym_arg = BitVector(sym_label, arg.size)
            sym_args.append(sym_arg)


        definitions = [arg.define_symbolic()[1] for arg in sym_args]
        sym_labels = [arg.define_symbolic()[0] for arg in sym_args]

        synth_invoke_str = synthesized_function_invoke_str.format(" ".join(sym_labels))
        spec_invoke_str = self.spec.emit_invoke_spec(sym_labels)

        verify_synth = ["\n"]
        verify_synth += ["(define cex (verify"]
        verify_synth += ["\t(begin"]
        verify_synth += ["\t\t"+self.emit_assert_eq(synth_invoke_str, spec_invoke_str)]
        verify_synth += ["\t)"]
        verify_synth += [" )"]
        verify_synth += [")"]

        verify_synth += ["(assert (sat? cex) \"Verification Passed!\")"]

        for sym_label in sym_labels:
            verify_synth += self.emit_display_evaluate_symbolic(sym_label, cex_name = "cex")

        def_str = "\n".join(["(clear-vc!)"] + definitions)
        verify_str = "\n".join(verify_synth)

        return def_str +"\n"+verify_str




    def emit_synthesis_query(self, program, optimize = False):
        new_values , new_defs = self.create_concrete_spec_inputs()

        vector_map, v_defs = self.create_concrete_inputs_vector([new_values],
                                                                self.spec.output_shape[0],
                                                                1,
                                                                self.spec.output_shape[1],
                                                                self.VF
                                                                )

        definitions = "\n".join(new_defs + v_defs)


        # Add Constraint calls
        constraints = self.emit_synthesis_constraints([new_values] , vector_map, grammar_name = program)

        constraints = "\n\t\t".join(["\t(begin"] + constraints + [")"])

        synthesis_query = None

        if optimize:
            synthesis_query = "(optimize \n #:minimize (list (cost {}))\n #:guarantee \n".format(program)
        else:
            synthesis_query = "(synthesize \n #:forall (list {} )\n #:guarantee \n".format(" ".join(v.name for v in new_values))


        eval_sketch = self.emit_evaluate_synth_res(program)
        synth_function, synth_invoke_str = self.emit_synth_function_body("synth_func", "synth_res" , len(new_values), self.spec.output_shape, 1, self.VF)
        verify_str = self.emit_verification_query(synth_invoke_str , new_values)



        prefix = ";; "+"="*80 + "\n"
        prefix += ";; "+" "*30 +" Synthesis Query"+'\n'
        prefix += ";; "+"="*80 + "\n"

        sufix = "\n;; "+"="*80 + "\n"

        return "\n".join([prefix , definitions , "\n" , "(define sol" ,"\n", synthesis_query , constraints  ,")\n)" ,"\n", eval_sketch ,"\n" , synth_function , verify_str ,sufix])





    def get_supported_context_for_dsl(self, dsl_inst, limit = None):
        assert self.consider_dsl_inst(dsl_inst), "Can not get supported contexts for dsl inst"

        contexts = []

        check = dsl_inst.name == "_mm_cvtepi16_epi64" and DEBUG

        if check:
            print("Here")

        for ctx in dsl_inst.contexts:

            if not ctx.has_output_size():
                continue

            if not ctx.has_input_size():
                continue

            supports_inputs_prec = ctx.supports_input_precision(self.spec.input_precision)
            supports_outputs_prec = ctx.supports_output_precision(self.spec.output_precision)
            supports_output_length = ctx.supports_output_size(self.output_slice_length)
            #supports_input_length = ctx.get_max_arg_size() < (int((self.VF * self.spec.input_precision * 1.5)))
            supports_input_length = any([ctx.supports_input_size(input_size) for input_size in self.input_sizes])

            if check:
                print(ctx.name, "Supports Input Prec:", supports_inputs_prec)
                print(ctx.name, "Supports Input Length:",supports_input_length)
                print(ctx.name,"Supports Output prec", supports_outputs_prec)
                print(ctx.name, "Supports Output Length:", supports_output_length)


            #if (supports_inputs_prec or supports_outputs_prec or supports_output_length) or supports_input_length :
            if (supports_inputs_prec and supports_input_length) and (supports_outputs_prec or supports_output_length):
                if check:
                    ctx.print_context()
                contexts.append(ctx)

        if limit != None and len(contexts) > limit:
            return contexts[:limit]


        return contexts








    # Checks whether the operations performed
    # by a DSL instruction form a contigous
    # slice of operations within the
    # specification
    def does_dsl_ops_overlap(self, dsl_inst, match_exact_order = False):
        spec_ops = self.spec.get_semantics_ops_list()
        dsl_ops = dsl_inst.get_semantics_ops_list()

        if dsl_inst.name in ["_mm512_mullo_epi16","_mm512_abs_epi64"] and DEBUG :
            print("Spec Ops", spec_ops)
            print("DSL Ops", dsl_ops)

        if match_exact_order:
            for idx in range(0, len(spec_ops) - len(dsl_ops) + 1):
                if spec_ops[idx:idx+len(dsl_ops)] == dsl_ops:
                    return True

            return False
        else:
            # Match in any order
            for bv_op in dsl_ops:
                if bv_op not in spec_ops and bv_op not in ["sign-extend", "extract"]:
                    return False
            return True




    # Check if the precisions of the specifications
    # and the DSL instruction overlap
    def does_dsl_configs_overlap(self, dsl_inst, match_all = False):


        if match_all:
            return  dsl_inst.supports_config(input_precision = self.spec.input_precision,
                                             output_precision = self.spec.output_precision,
                                             output_size = self.output_slice_length
                                             )
        else:

            if not dsl_inst.has_output_sizes_defined():
                return False

            if not dsl_inst.has_input_sizes_defined():
                return False

            supports_inputs_prec = dsl_inst.supports_input_precision(self.spec.input_precision)
            supports_outputs_prec = dsl_inst.supports_output_precision(self.spec.output_precision)

            supports_output_length = dsl_inst.supports_output_size(self.output_slice_length)

            supports_input_length = any([dsl_inst.supports_input_size(input_size) for input_size in self.input_sizes])

            #return (supports_inputs_prec or supports_outputs_prec) and (supports_output_length  or supports_input_length)
            return (supports_inputs_prec and supports_input_length) and (supports_outputs_prec or supports_output_length)


    def consider_bitwise_heuristic(self, dsl_inst):

        dsl_ops = dsl_inst.get_semantics_ops_list()
        bitwise_logical_ops = ["bvor", "bvxor", "bvand", "bvnot", "bvneg"]

        for op in dsl_ops:
            if op in bitwise_logical_ops:
                return True

        return False


    def get_supported_bitwise_context_for_dsl(self, dsl_inst, limit = None):
        assert self.consider_bitwise_heuristic(dsl_inst), "Can not get supported contexts for dsl inst"

        contexts = []

        for ctx in dsl_inst.contexts:
            if not ctx.has_output_size():
                continue

            if not ctx.has_input_size():
                continue

            supports_element_wise = any(
                [ctx.supports_input_size(input_size) and ctx.supports_output_size(input_size)
                 for input_size in self.input_sizes])




            if  supports_element_wise:
                contexts.append(ctx)

        if limit != None and len(contexts) > limit:
            return contexts[:limit]


        return contexts





    # Simple place holder
    def consider_dsl_inst(self, dsl_inst):
        if dsl_inst.name in ["_mm512_mullo_epi16"] and DEBUG:
            print("Going Over {}".format(dsl_inst.name))
            print("Config Overlaps?", self.does_dsl_configs_overlap(dsl_inst))
            print("Ops Overlaps?", self.does_dsl_ops_overlap(dsl_inst))


        ## Specific heuristics for supporting special cases

        ## For truncation, direct vector truncation may not be available,
        ## and may require up-casting before down-casting
        ## If the ops are always only extract --> Add sign extension intructions
        ## For truncation instruction only add those instructions which down-cast
        ## to required precisions






        return self.does_dsl_configs_overlap(dsl_inst) and self.does_dsl_ops_overlap(dsl_inst)





