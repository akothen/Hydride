from common.Types import *
from common.Instructions import *
from common.PredefinedDSL import *
import random
from ShuffleList import ShuffleList

DEBUG = True
DEBUG_LIST = ["hexagon_V6_vadduwsat_128B"]
SKIP_LIST = []

MUST_INCLUDE = [ ]
USE_BW_ALGO = False
ENABLE_SHUFFLE = True
UPCAST_OPERATIONS = False
USE_LIT_HOLES = True
PRUNE_BVOP_VARIANTS = True

ENABLE_PRUNING = False # True
FLEXIBLE_CASTING =  True



# Any shuffle operation producing bitvectors more than
# this size can be pruned earlier without the solver
# having to worry about it
MAX_BW_SIZE =  2048


BASE_VECT_SIZE = 1024

# Bound the number of swizzle operations in the
# grammar
SWIZZLE_BOUND = 5

class SynthesizerBase:

    def __init__(self, spec = None, dsl_operators = [],
                 struct_definer = None, grammar_generator = None,
                 vectorization_factor = 8,
                 depth = 6,
                 contexts_per_dsl_inst = None,
                 is_shuffle = False,
                 target = "x86",
                 legal_map = {}
                 ):

        print("Creating Synthesizer with target:", target)
        self.spec = spec
        self.target = target
        self.dsl_operators = dsl_operators
        self.struct_definer = struct_definer
        self.grammar_generator = grammar_generator
        self.VF = vectorization_factor
        self.depth = depth
        self.output_slice_length = self.spec.output_shape[0] * self.spec.output_shape[1] * self.spec.output_precision #self.VF * self.spec.output_precision
        self.contexts_per_dsl_inst = contexts_per_dsl_inst
        if self.spec.contains_conditional():
            self.contexts_per_dsl_inst = max(contexts_per_dsl_inst, 3)
        self.is_shuffle = is_shuffle
        self.input_sizes = []


        for idx, shape in enumerate(self.spec.input_shapes):
            self.input_sizes.append(
                shape[0] * shape[1] * self.spec.input_precision[idx]

            )

        self.output_size = self.spec.get_output_size()
        self.legal_map = legal_map

        self.set_target_settings()

    def set_target_settings(self):

        global_var = globals()
        if self.target == 'x86':
            global_var['FLEXIBLE_CASTING'] = False
            global_var['ENABLE_PRUNING'] = True
            global_var['MAX_BW_SIZE'] = 1024
            global_var['BASE_VECT_SIZE'] = None
            global_var['SWIZZLE_BOUND'] = 5
        elif self.target == "hvx":
            print("Setting hvx target settings")
            global_var['FLEXIBLE_CASTING'] = True
            global_var['ENABLE_PRUNING'] = True
            global_var['MAX_BW_SIZE'] = 2048
            global_var['BASE_VECT_SIZE'] = 1024
            global_var['SWIZZLE_BOUND'] = 6



    # Prints the number number of target agnostic
    # classes and the total number of contexts
    # associated with each target agnostic class
    def print_dsl_stats(self):
        num_operations = len(self.dsl_operators)

        num_ctxs = sum([len(dsl_inst.contexts) for dsl_inst in self.dsl_operators])

        print("="*20, "DSL Stats", "="*20)
        print("Number of Target Agnostic Classes:", num_operations)
        print("Number of Concrete contexts:", num_ctxs)
        print("="*40)


    def is_instruction_legal(self, name):
        if self.target == 'hvx':
            return True

        if self.is_shuffle:
            return True

        SPECIAL_CASE = ["div", "rem"]
        for sc in SPECIAL_CASE:
            if sc in name:
                return True

        return (self.legal_map[name] == 1)

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
                    offset =  of
                    precision = self.spec.input_precision[0]

                    input_vector_sizes.append(input_size)
                    offsets.append(offset)
                    num_elem_sizes.append(num_elem)
                    precisions.append(precision)


        return create_vector_load_dsl(input_vector_sizes = input_vector_sizes,
                                      offsets = offsets,
                                      num_elem_sizes = num_elem_sizes,
                                      precisions = precisions)



    def get_single_interleave_shuffles(self):
        memo = []

        input_vector_sizes = []
        precisions = []

        for idx, input_size in enumerate(self.input_sizes):
            if not ENABLE_SHUFFLE:
                continue

            #if input_size <= 32:
            #    continue

            precision = self.spec.input_precision[idx]
            number_elems = self.spec.input_shapes[idx][1]

            # Scalar case, no need to shuffle
            if number_elems == 1:
                continue

            datum = (input_size,precision)

            if datum in memo:
                continue
            else:
                memo.append(datum)

            input_vector_sizes.append(input_size)
            precisions.append(precision)

        return create_interleave_dsl(
            input_vector_sizes = input_vector_sizes,
            precisions = precisions
        )


    def get_single_deinterleave_shuffles(self):
        memo = []

        input_vector_sizes = []
        precisions = []

        for idx, input_size in enumerate(self.input_sizes):
            if not ENABLE_SHUFFLE:
                continue

            #if input_size <= 32:
            #    continue

            precision = self.spec.input_precision[idx]
            number_elems = self.spec.input_shapes[idx][1]

            # Scalar case, no need to shuffle
            if number_elems == 1:
                continue

            datum = (input_size,precision)

            if datum in memo:
                continue
            else:
                memo.append(datum)

            input_vector_sizes.append(input_size)
            precisions.append(precision)

        return create_deinterleave_dsl(
            input_vector_sizes = input_vector_sizes,
            precisions = precisions
        )


    def get_two_interleave_shuffles(self):
        memo = []

        input_vector_sizes = []
        precisions = []

        for idx, input_size in enumerate(self.input_sizes):
            if not ENABLE_SHUFFLE:
                continue

            if input_size <= 32:
                continue

            precision = self.spec.input_precision[idx]
            number_elems = self.spec.input_shapes[idx][1]

            # Scalar case, no need to shuffle
            if number_elems == 1:
                continue

            if input_size * 2 > MAX_BW_SIZE:
                continue

            datum = (input_size,precision)

            if datum in memo:
                continue
            else:
                memo.append(datum)

            input_vector_sizes.append(input_size)
            precisions.append(precision)

        return create_interleave_two_dsl(
            input_vector_sizes = input_vector_sizes,
            precisions = precisions
        )



    def get_memory_two_input_shuffles(self):
        load_factors = [1.0]
        group_factors = [0.25, 0.5]#, 1.0]
        lane_offsets_factors = [0] #[0, "IDX_J"]
        dis_factors = [1]
        rotate_factors = [0]
        num_elems_factors = [self.VF, int(0.5 * self.VF)]
        lane_size_factors = [self.VF, int(0.5 * self. VF)]


        input_vector_sizes = []
        num_elem_sizes = []
        group_sizes = []
        dis_sizes = []
        rotate_sizes = []
        precisions = []
        lane_offsets = []
        lane_sizes = []

        first_half_memo = []
        def first_half_concat_pattern(num_elems, type_size, input_size):
            datum = (input_size, type_size)

            if datum in first_half_memo:
                return
            else:
                first_half_memo.append(datum)

            input_vector_sizes.append(input_size) #256
            num_elem_sizes.append(num_elems) # 256 / 16 = 16
            precisions.append(type_size)
            lane_offsets.append(0)
            lane_sizes.append(num_elems)
            group_sizes.append(int(num_elems * 0.5))
            dis_sizes.append(1)
            rotate_sizes.append(0)


        second_half_memo = []
        def second_half_concat_pattern(num_elems, type_size, input_size):
            datum = (input_size, type_size)

            if datum in second_half_memo:
                return
            else:
                second_half_memo.append(datum)

            input_vector_sizes.append(input_size)
            num_elem_sizes.append(int(0.5 * num_elems))
            precisions.append(type_size)
            lane_offsets.append(0)
            lane_sizes.append(int(0.5 * num_elems))
            group_sizes.append(int(num_elems * 0.5))
            dis_sizes.append(1)
            rotate_sizes.append(0)


        first_half_interleave_memo = []
        def first_half_interleave_pattern(num_elems, type_size, input_size):
            datum = (input_size, type_size)

            if datum in first_half_interleave_memo:
                return
            else:
                first_half_interleave_memo.append(datum)

            input_vector_sizes.append(input_size)
            num_elem_sizes.append(num_elems)
            precisions.append(type_size)
            lane_offsets.append(0)
            lane_sizes.append(num_elems)
            group_sizes.append(int(num_elems * 0.5))
            dis_sizes.append(int(num_elems * 0.5))
            rotate_sizes.append(0)


        second_half_interleave_memo = []
        def second_half_interleave_pattern(num_elems, type_size, input_size):
            datum = (input_size, type_size)

            if datum in second_half_interleave_memo:
                return
            else:
                second_half_interleave_memo.append(datum)

            input_vector_sizes.append(input_size)
            num_elem_sizes.append(int(0.5 * num_elems))
            precisions.append(type_size)
            lane_offsets.append(0)
            lane_sizes.append(num_elems)
            group_sizes.append(int(num_elems * 0.5))
            dis_sizes.append(int(num_elems * 0.5))
            rotate_sizes.append(0)

        for idx, input_size in enumerate(self.input_sizes):
            if not ENABLE_SHUFFLE:
                continue


            #if input_size <= 32:
            #    continue


            # 16, 16
            precision = self.spec.input_precision[idx]

            # 16, 16
            number_elems = self.spec.input_shapes[idx][1]

            # Scalar case, no need to shuffle
            if number_elems == 1:
                continue

            first_half_concat_pattern(number_elems , precision, input_size)
            second_half_concat_pattern(number_elems, precision, input_size)

            first_half_interleave_pattern(number_elems, precision, input_size)
            second_half_interleave_pattern(number_elems, precision, input_size)



        skip_sizes = []

        for lf in load_factors:
            for idx ,input_size in enumerate(self.input_sizes):
                datum = (input_size, self.spec.input_precision[idx])

                if datum in skip_sizes:
                    continue
                else:
                    skip_sizes.append(datum)

                for gf in group_factors:
                    for lo in lane_offsets_factors:
                        for d in dis_factors:
                            for r in rotate_factors:

                                continue

                                input_vector_sizes.append(int(input_size * lf))
                                num_elem_sizes.append(self.VF)
                                precisions.append(self.spec.input_precision[idx])
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
            holes += bitvector_sizes
            # remove duplicates
            holes = list(set(holes))

        if len(holes) == 0  :
            return []


        max_prec = max(self.spec.input_precision, default = 32)

        min_prec = min(self.spec.input_precision, default = 32)

        pairs = []

        for hole in holes:
            if hole % max_prec != 0:
                pairs.append((hole, hole))
            else:
                pairs.append((hole, max_prec))

            if min_prec == max_prec:
                continue

            if hole % min_prec != 0:
                pairs.append((hole, hole))
            else:
                pairs.append((hole, min_prec))



        return pairs

    def emit_synthesis_grammar(self, main_grammar_name = "synth_grammar", use_lit_holes = USE_LIT_HOLES):
        pass


    # Sort the operations and contexts together such that
    # higher scoring contexts have a lower index
    def sort_operations(self, ops, ctxs):
        indices = range(0,len(ops))
        sorted_indices = sorted(indices, key = lambda i : self.score_context(ops[i] , ctxs[i]) )

        sorted_ops = []
        sorted_ctxs = []

        for idx in reversed(sorted_indices):
            sorted_ops.append(ops[idx])
            sorted_ctxs.append(ctxs[idx])


        return (sorted_ops,sorted_ctxs)


    def prune_low_score_ops(self, ops, ctxs, score = 2):
        if self.target == 'hvx':
            return (ops, ctxs)
        indices = [i for i in range(len(ops)) if self.score_context(ops[i], ctxs[i]) > score ]
        pruned_ops = [ops[i] for i in indices]
        pruned_ctxs = [ctxs[i] for i in indices]

        return (pruned_ops, pruned_ctxs)


    # If enabled, aggressively prunes those instructions
    # which contain a different variant of a bvop
    # from that present in the spec. For example,
    # if the spec contains 'bvaddnsw' but not 'bvadd',
    # and `bvnuw`, we will prune those operations using
    # using `bvadd` and `bvnuw`
    def prune_variant_bvops(self, ops, ctxs):

        if not PRUNE_BVOP_VARIANTS:
            return (ops, ctxs)

        spec_ops = self.spec.get_semantics_ops_list()

        def op_has_variant(op):
            for variant_list in BV_OP_VARIANTS:
                if op in variant_list:
                    return variant_list
            return []

        disallowed_ops = []

        for op in spec_ops:
            op_variant = op_has_variant(op)

            for var in op_variant:
                # Only variants which are in the spec are allowed
                if var not in spec_ops:
                    disallowed_ops.append(var)

        print("Disallowed bvops: ", disallowed_ops)
        pruned_ops = []
        pruned_ctxs = []

        for idx in range(len(ops)):
            dsl_ops = ops[idx].get_semantics_ops_list()

            to_insert = True
            for op in dsl_ops:
                if op in disallowed_ops:
                    to_insert = False
                    break
            if to_insert:
                pruned_ops.append(ops[idx])
                pruned_ctxs.append(ctxs[idx])
            else:
                print("Pruning ",ctxs[idx], "due to bv op variants")



        return (pruned_ops, pruned_ctxs)


    def prune_ops_relying_on_imm(self, ops, ctxs):
        # Imms used in specification, conservatively keep
        # all operations
        #if self.spec.imms != []:
        #    return (ops, ctxs)

        smallest_imm = min([imm[1] for imm in self.spec.imms], default = self.output_slice_length)
        smallest_input = min(self.input_sizes, default = self.output_slice_length)
        smallest_output = self.output_slice_length

        smallest_bv_size = min(smallest_input, smallest_output, smallest_imm)

        if BASE_VECT_SIZE != None:
            smallest_bv_size = min(smallest_bv_size, BASE_VECT_SIZE)

        pruned_ops = []
        pruned_ctxs = []

        for i in range(len(ops)):
            op_i = ops[i]
            ctx_i = ctxs[i]

            min_ctx_bvs = min(ctx_i.get_output_size(), ctx_i.get_min_arg_size())

            if min_ctx_bvs < smallest_bv_size:
                if DEBUG:
                    print("Smallest output", ctx_i.get_output_size(), "Smallest input:", ctx_i.get_min_arg_size())
                    print("Pruning", ctx_i.name, "as it has an argument of size",min_ctx_bvs, "which is smaller than", smallest_bv_size)
                continue
            else:
                pruned_ops.append(op_i)
                pruned_ctxs.append(ctx_i)

        print("Prunning Based of non-immediate usage pruned", len(ops) - len(pruned_ops), "instructions ... ")
        return (pruned_ops, pruned_ctxs)



    # Certain ops may take the elements to smaller element types
    # i.e. precisions, than what may be available in the spec.
    #, we can trivially prune these ops (when there is no bvssat
    # bvusat involved)
    def prune_ops_relying_on_precision(self, ops, ctxs):

        spec_ops = self.spec.get_semantics_ops_list()


        """
        if "bvssat" in spec_ops:
            return (ops,ctxs)
        if "bvusat" in spec_ops:
            return (ops,ctxs)
        """



        smallest_imm = min([imm[1] for imm in self.spec.imms], default = self.spec.output_precision)
        smallest_input = min(self.spec.input_precision, default = self.spec.output_precision)
        smallest_output = self.spec.output_precision

        smallest_bv_prec = min(smallest_input, smallest_output, smallest_imm)

        print("Smallest input precision for spec:", smallest_bv_prec)

        pruned_ops = []
        pruned_ctxs = []

        for i in range(len(ops)):
            op_i = ops[i]
            ctx_i = ctxs[i]


            dsl_ops = op_i.get_semantics_ops_list()

            # If operations are just byte rearrangements allow them
            if all([op in ["extract", "concat"] for op in dsl_ops]):
                pruned_ops.append(op_i)
                pruned_ctxs.append(ctx_i)
                continue


            min_ctx_bvs = min(ctx_i.out_precision, ctx_i.in_precision)

            if min_ctx_bvs < smallest_bv_prec:
                if DEBUG:
                    print("Pruning", ctx_i.name, "as it has an argument of precision ",min_ctx_bvs, "which is smaller than", smallest_bv_prec)
                continue
            else:
                pruned_ops.append(op_i)
                pruned_ctxs.append(ctx_i)

        print("Prunning Based of precisions", len(ops) - len(pruned_ops), "instructions ... ")
        return (pruned_ops, pruned_ctxs)



    def reduce_operations(self, operation_insts, operation_contexts, bound = None):

        if bound == None or bound > len(operation_insts):
            print("EARLY RETURN FROM REDUCE")
            return (operation_insts, operation_contexts)

        # Filter broadcast like operations seperately from compute/shuffle operations
        # Hence we limit the % of broadcast like operationsto be 25% and 75% of the operations
        # will be compute/shuffle



        upcast_ops = []
        upcast_ctxs = []


        downcast_ops = []
        downcast_ctxs = []

        compute_ops = []
        compute_ctxs = []

        MAX_OCCURANCES = 2

        names = []

        # Higher scoring contexts for a given op would be towards the beginning  of
        # the list
        for i in (range(0, len(operation_insts))):
            op = operation_insts[i]
            ctx = operation_contexts[i]

            if names.count(op.name) == MAX_OCCURANCES:
                continue

            names.append(op.name)

            if self.is_downcast_like_operation(op,ctx):
                downcast_ops.append(op)
                downcast_ctxs.append(ctx)
            elif self.is_upcast_like_operation(op, ctx):
                upcast_ops.append(op)
                upcast_ctxs.append(ctx)
            else :
                compute_ops.append(op)
                compute_ctxs.append(ctx)


        num_broadcasts_actual = len(upcast_ops) + len(downcast_ops)
        print("Actual Broadcast ops", num_broadcasts_actual)
        print("Actual Compute ops", len(compute_ops))


        num_broadcasts = min(int(bound * 0.50), num_broadcasts_actual)
        num_computes = bound - num_broadcasts

        # if allocated more rules than are actually
        # present, then re-distribute to broadcast
        # ops
        if num_computes > len(compute_ops):
            num_broadcasts = bound - len(compute_ops)
            num_computes = len(compute_ops)



        print("Num Broadcasts:", num_broadcasts)
        print("Num Computes:", num_computes)

        inserted_names = []

        def get_top_N_ops(ops, ctxs, N):

            indices = range(0,len(ops))
            sorted_indices = sorted(indices, key = lambda i : self.score_context(ops[i] , ctxs[i]) )


            globally_sorted_operation_insts = []
            globally_sorted_operation_contexts = []


            for idx in sorted_indices:
                # TEMP: Dictionary created by merging old and missing ops
                # hence contains duplications. Remove once new dictionary
                # available.

                if ctxs[idx].name in inserted_names:
                    continue

                inserted_names.append(ctxs[idx].name)


                # Operations with score less than 2 are more likely to
                # add complexity to the synthesis without really
                # improving the types of expressions which can be
                # synthesized
                if not FLEXIBLE_CASTING and self.score_context(ops[idx], ctxs[idx]) <= 2:
                    continue


                globally_sorted_operation_insts.append(ops[idx])
                globally_sorted_operation_contexts.append(ctxs[idx])


           # print("get top N:")
            for i, o in enumerate(globally_sorted_operation_contexts):
                #print(o.name, "score: ", self.score_context(globally_sorted_operation_insts[i], o))
                pass


            if N < len(ops):
                print(N , "<",  len(ops))
                return (globally_sorted_operation_insts[-N:], globally_sorted_operation_contexts[-N:])
            else:
                return (globally_sorted_operation_insts, globally_sorted_operation_contexts)



        computes = get_top_N_ops(compute_ops,compute_ctxs, num_computes)

        # Divide upcasts and downcasts evenly when both exceed 50% of
        # the allocated number of rules for broadcast instructions
        num_upcasts = min(len(upcast_ops), int(0.4 * num_broadcasts))
        num_downcasts = num_broadcasts - num_upcasts

        upcasts = get_top_N_ops(upcast_ops,upcast_ctxs, num_upcasts)
        downcasts = get_top_N_ops(downcast_ops,downcast_ctxs, num_downcasts)


        grammar_ops = computes[0] + upcasts[0] + downcasts[0]
        grammar_ctxs = computes[1] + upcasts[1] + downcasts[1]



        return (grammar_ops, grammar_ctxs)





    def get_supported_context_for_dsl(self, dsl_inst, limit = None):
        assert self.consider_dsl_inst(dsl_inst), "Can not get supported contexts for dsl inst"


        if dsl_inst.name in MUST_INCLUDE:
            return dsl_inst.contexts

        dsl_ops = dsl_inst.get_semantics_ops_list()

        spec_ops = self.spec.get_semantics_ops_list()

        def get_op_variant(op):
            for variant_list in BV_OP_VARIANTS:
                if op in variant_list:
                    return variant_list
            return []



        contexts = []

        check = dsl_inst.name in DEBUG_LIST and DEBUG

        is_broadcast_like = self.is_broadcast_like_operation(dsl_inst)

        is_logical_like = self.is_elementwise_logical_like_operation(dsl_inst)

        for ctx in dsl_inst.contexts:

            ctx_ops = self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned())

            skip = False

            for c_op in ctx_ops:
                variants = get_op_variant(c_op)

                # Check if the spec contains operations belonging to these class
                # of variants
                spec_variant_ops = [op for op in spec_ops if op in variants]

                if len(spec_variant_ops) == 0:
                    continue

                for v in variants:

                    # If ctx is using an operation of opposite signedness
                    # which is not being used in the spec, skip
                    if v in ctx_ops and v not in spec_ops:
                        print("Skipping ", ctx.name, "as it is using a variant op:", v, "of the original op", c_op)
                        skip = True




            if skip:
                continue

            # We only include those instructions in the grammar
            # that we know can be generated for a given
            # target
            if not self.is_instruction_legal(ctx.name):
                print(ctx.name, "is not supported on the current target", self.target)
                continue




            if not ctx.has_output_size():
                continue

            if not ctx.has_input_size():
                continue

            supports_inputs_prec = any([ctx.supports_input_precision(input_precision) for input_precision in self.spec.input_precision])
            lane_size_cond = False

            if BASE_VECT_SIZE != None:
                lane_size_cond = (ctx.lane_size == BASE_VECT_SIZE) or (ctx.lane_size == MAX_BW_SIZE) or any([ctx.lane_size == input_precision for input_precision in self.spec.input_precision])
                supports_inputs_prec = supports_inputs_prec and lane_size_cond



            supports_outputs_prec = ctx.supports_output_precision(self.spec.output_precision)
            supports_output_length = ctx.supports_output_size(self.output_slice_length)
            supports_input_length = any([ctx.supports_input_size(input_size) for input_size in self.input_sizes])

            if UPCAST_OPERATIONS:
                # One precision higher
                supports_inputs_prec = supports_inputs_prec or  any([ctx.supports_input_precision(2 * input_precision) for  input_precision in self.spec.input_precision])

                # Twice vector size
                supports_input_length = supports_input_length or any([ctx.supports_input_size(2 * input_size) for  input_size in self.input_sizes])


                supports_output_length = supports_output_length or ctx.supports_output_size(2 * self.output_slice_length)

                supports_outputs_prec = supports_outputs_prec or ctx.supports_output_precision(2 * self.spec.output_precision)

            if check:
                print("-"*50)
                print(ctx.name, "Supports Input Prec:", supports_inputs_prec)
                print(ctx.name, "Supports Input Length:",supports_input_length)
                print(ctx.name,"Supports Output prec", supports_outputs_prec)
                print(ctx.name, "Supports Output Length:", supports_output_length)
                print(ctx.name, "LaneSize Cond:", lane_size_cond)
                print("-"*50)


            old_condition =  (supports_inputs_prec and supports_input_length) and (supports_outputs_prec or supports_output_length)

            # If broadcast like, we also want to include operations where inputs of different sizes can be casted to each other
            unique_input_sizes = list(set(self.input_sizes))
            casts_inter_inputs = is_broadcast_like and supports_input_length and any([ctx.supports_output_size(isize) for isize in unique_input_sizes])

            # Either can process the input or can produce output shape
            new_condition =  (supports_inputs_prec and supports_input_length) or (supports_outputs_prec and supports_output_length) # and (not is_broadcast_like)


            # Hexagon condition for distribution:
            hexagon_cond = ((supports_inputs_prec and supports_outputs_prec) or (supports_input_length or supports_output_length) ) and lane_size_cond
            hexagon_cond = hexagon_cond and (self.target == "hvx")

            if dsl_inst.name in MUST_INCLUDE or  hexagon_cond or  new_condition  or (is_broadcast_like and supports_input_length and supports_output_length) or (is_logical_like and (supports_input_length or supports_output_length)) or casts_inter_inputs:
                if check:
                    ctx.print_context()
                contexts.append(ctx)



        contexts = sorted(contexts, key = lambda x : self.score_context(dsl_inst ,x))

        if check:
            print("Contexts in ascending order of score")
            for ctx in contexts:
                print(ctx.name)



        # Over riding limit to means including those contexts
        # which have the top 'limit' scores. In cases of ties
        # for a given score, we include both ties.

        if limit != None and len(contexts) > limit:

            limited_context = []

            remaining = limit
            previous_score = None
            for ctx in reversed(contexts):
                ctx_score = self.score_context(dsl_inst,  ctx)

                if remaining == 0 and previous_score != ctx_score:
                    break

                if previous_score != ctx_score:
                    previous_score = ctx_score
                    remaining -= 1

                # Highest scoring contexts would
                # be in the beginning
                limited_context.append(ctx)





            return limited_context
            #return contexts[-limit:]
            #return contexts[:limit]


        return contexts





    # When limiting contexts, we extract only the first :limit values
    # hence sorting accordingly to 'relavance' is important to keep
    # most useful contexts
    def score_context(self, dsl_inst ,  ctx):
        is_broadcast_like = self.is_broadcast_like_operation(dsl_inst)
        score = 0
        score +=  int(([ctx.supports_input_precision(input_precision) for input_precision in self.spec.input_precision]).count(True) != 0)
        score += int(ctx.supports_output_precision(self.spec.output_precision))
        score += int(ctx.supports_output_size(self.output_slice_length))
        score +=  max(int(([ctx.supports_input_size(input_size) for input_size in self.input_sizes]).count(True)), 2)



        spec_ops = self.spec.get_semantics_ops_list()
        dsl_ops = dsl_inst.get_semantics_ops_list()
        dsl_ops = self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned())

        score += min(len(list (set(spec_ops) & set(dsl_ops))), 2)





        if is_broadcast_like:
            score = 0
            score +=  int(([ctx.supports_input_size(input_size) for input_size in self.input_sizes].count(True)))
            score += int(ctx.supports_output_size(self.output_slice_length))
            score += int(ctx.supports_output_precision(self.spec.output_precision))
            score +=  int(([ctx.supports_input_precision(input_precision) for input_precision in self.spec.input_precision]).count(True) != 0)
            score += int(ctx.supports_output_size(self.output_slice_length))

            # For targets which prefer distributing computation
            # over a base vector size
            if BASE_VECT_SIZE != None :
                score += int(ctx.supports_output_size(BASE_VECT_SIZE)) * 3

                score +=  int(([ctx.supports_input_size(input_size) for input_size in [MAX_BW_SIZE]].count(True)))

                if ctx.name == "hexagon_V6_hi_128B":
                    print(ctx.name, "score" ,score)


            # In the case where we have inputs of varying sizes, we want also want
            #unique_input_sizes = self.input_sizes
            #score +=  int([ctx.supports_output_size(isize) for isize in unique_input_sizes].count(True)) * 2



        # Does specification contain conditional code:
        spec_ops = self.spec.get_semantics_ops_list()

        need_masked = ("if" in spec_ops) or ("cond" in spec_ops) or ("bveq" in spec_ops)

        if "mask" in ctx.name and not need_masked:
            score = int(0)





        return score

    def convert_ops_to_signedness(self, ops, get_signed = False, get_unsigned = False):
        ops_list = []

        for op in ops:
            if get_signed:
                ops_list.append(get_variant_by_sign(op, 1))

            if get_unsigned:
                ops_list.append(get_variant_by_sign(op, 0))


            ops_list.append(op)

        linear = list(set(ops_list))

        abstract_sign_ops = [op for op in SIGN_VARIANTS]


        return [op for op in linear if op not in abstract_sign_ops]



    # Checks whether the operations performed
    # by a DSL instruction form a contigous
    # slice of operations within the
    # specification
    def does_dsl_ops_overlap(self, dsl_inst, match_exact_order = False):
        spec_ops = self.spec.get_semantics_ops_list()
        dsl_ops = dsl_inst.get_semantics_ops_list()

        # When checking if ops overlap, check for both signedness
        # , when sorting based on score check for signedness explicitly
        dsl_ops = self.convert_ops_to_signedness(dsl_ops, get_signed = True, get_unsigned = True)


        if dsl_inst.name in DEBUG_LIST and DEBUG :
            print("Spec Ops", spec_ops)
            print("DSL Ops", dsl_ops)

        if match_exact_order:
            for idx in range(0, len(spec_ops) - len(dsl_ops) + 1):
                if spec_ops[idx:idx+len(dsl_ops)] == dsl_ops:
                    return True

            return False
        else:
            overlap = False

            def is_cast_expr(ops_list):
                in_cast_set = True
                for op in ops_list:
                    in_cast_set = in_cast_set and  op in ["sign-extend", "extract", "zero-extend"]
                return in_cast_set



            ## Multiplication and division operations can make the
            ## Synthesis more complex (non-Press burger arithmetic) and hence any dsl operations
            ## which contain them should only be included if necessary

            EXPENSIVE_OPS = [] #["bvmul", "bvsdiv", "bvudiv",  "sign-extend", "zero-extend", "abs", ]

            # Including dot-products type operations is only required
            # when there is some form of accumulation with multiplication
            # hence, we limit dot-product operations to be included
            # only in such cases
            # EXPENSIVE_OPS += ["bvadd"]

            for expensive_op in EXPENSIVE_OPS:
                if expensive_op in dsl_ops and expensive_op not in spec_ops:
                    return False




            # Match in any order
            for bv_op in dsl_ops:
                #if bv_op not in spec_ops and bv_op not in ["sign-extend", "extract", "zero-extend"]:
                #    return False


                cond = bv_op in spec_ops and bv_op not in ["sign-extend", "extract", "zero-extend"]

                overlap = overlap or cond
            #return True
            return overlap or (is_cast_expr(spec_ops) and is_cast_expr(dsl_ops))   or is_cast_expr(dsl_ops)




    # Check if the precisions of the specifications
    # and the DSL instruction overlap
    def does_dsl_configs_overlap(self, dsl_inst, match_all = False):


        if match_all:
            def supports_ip(ip):
                return dsl_inst.supports_config(input_precision = ip,
                                             output_precision = self.spec.output_precision,
                                             output_size = self.output_slice_length
                                             )

            return any([support_ip(ip) for ip in self.spec.input_precision])
        else:

            if not dsl_inst.has_output_sizes_defined():
                return False

            if not dsl_inst.has_input_sizes_defined():
                return False

            if dsl_inst.name in DEBUG_LIST and DEBUG:
                print("Has inputs and outputs defined")

            supports_inputs_prec = any([dsl_inst.supports_input_precision(input_precision) for input_precision in self.spec.input_precision])

            supports_outputs_prec = dsl_inst.supports_output_precision(self.spec.output_precision)

            supports_output_length = dsl_inst.supports_output_size(self.output_slice_length)

            supports_input_length = any([dsl_inst.supports_input_size(input_size) for input_size in self.input_sizes])



            old_condition = (supports_inputs_prec and supports_input_length) and (supports_outputs_prec or supports_output_length)
            new_condition = (supports_inputs_prec and supports_input_length) or (supports_outputs_prec and supports_output_length)


            # for element wise operations, we really only need the sizes of the vectors to overlap
            is_elem_logical = self.is_elementwise_logical_like_operation(dsl_inst) and (supports_input_length or supports_output_length)


            is_broadcast_like = self.is_broadcast_like_operation(dsl_inst) and supports_input_length and supports_output_length


            # Hexagon condition for distribution:
            hexagon_cond = (supports_inputs_prec and supports_outputs_prec) or (supports_input_length or supports_output_length)
            hexagon_cond = hexagon_cond and (self.target == "hvx")




            return hexagon_cond or new_condition or is_elem_logical or is_broadcast_like #new_condition


    def is_elementwise_logical_like_operation(self, dsl_inst):

        if self.is_broadcast_like_operation(dsl_inst):
            return False

        ops = dsl_inst.get_semantics_ops_list()

        bitwise_logical_ops = ["bvor", "bvxor", "bvand", "bvnot", "bvneg", "extract", "concat"]

        return all([ (op in bitwise_logical_ops) for op in ops ])


    def is_broadcast_like_operation(self, dsl_inst):
        ops = dsl_inst.get_semantics_ops_list()

        return all([op in ["sign-extend", "zero-extend", "extract", "concat", "bvssat", "bvusat", "bveq" ,"if" ,"cond", "bvsaturate", "bvsizeext"] for op in ops]) or ops == []


    # Is the operation either a broadcast operation or an
    # operation which sign/zero extends from a smallar
    # type to a larger type
    def is_upcast_like_operation(self, dsl_inst, ctx):
        if ctx.in_vectsize == None:
            return False
        return self.is_broadcast_like_operation(dsl_inst) and ((ctx.out_vectsize > ctx.in_vectsize) or (ctx.in_precision < ctx.out_precision))

    def is_downcast_like_operation(self, dsl_inst, ctx):
        return self.is_broadcast_like_operation(dsl_inst) and not (self.is_upcast_like_operation(dsl_inst, ctx))

    def consider_bitwise_heuristic(self, dsl_inst):

        dsl_ops = dsl_inst.get_semantics_ops_list()
        bitwise_logical_ops = ["bvor", "bvxor", "bvand", "bvnot", "bvneg"]

        # Ignore masked operations
        exclude_ops  = ["if"]

        for op in dsl_ops:
            if op in exclude_ops:
                return False

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

        for SKIP in SKIP_LIST:
            if SKIP in dsl_inst.name:
                #print("checking if ",SKIP," in ",dsl_inst.name)
                return False

        if dsl_inst.name in DEBUG_LIST and DEBUG:
            print("Going Over {}".format(dsl_inst.name))
            print("Config Overlaps?", self.does_dsl_configs_overlap(dsl_inst))
            print("Ops Overlaps?", self.does_dsl_ops_overlap(dsl_inst))

        return self.does_dsl_configs_overlap(dsl_inst) and self.does_dsl_ops_overlap(dsl_inst)




