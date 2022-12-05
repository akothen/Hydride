from common.Types import *
from common.Instructions import *
from common.PredefinedDSL import *
import random
from ShuffleList import ShuffleList

from synthesizer.SynthesizerBase import SynthesizerBase

import json

import itertools



"""
Given a specification, the possible set of relavent instructions
may be too large, preventing synthesis from scaling. Instead of using
a single grammar expression, we can perform multiple quick short
synthesis queries. The StepWiseSynthesizer enables creation of these
multiple grammars in a deterministic way such that clients can step
through the grammar.

"""


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

class StepWiseSynthesizer(SynthesizerBase):

    def __init__(self, spec = None, dsl_operators = [],
                 struct_definer = None, grammar_generator = None,
                 vectorization_factor = 8,
                 depth = 6,
                 contexts_per_dsl_inst = None,
                 is_shuffle = False,
                 target = "x86",
                 legal_map = {},
                 step = 1
                 ):

        super().__init__(spec = spec, dsl_operators = dsl_operators,
                         struct_definer = struct_definer, grammar_generator = grammar_generator
                         , vectorization_factor = vectorization_factor, depth = depth,
                         contexts_per_dsl_inst = contexts_per_dsl_inst,
                         is_shuffle = is_shuffle, target = target,
                         legal_map = legal_map)
        self.step = step
        print("Using Stepwise Synthesizer!")

        self.set_target_settings()

        print("Pre Scaling")
        self.print_dsl_stats()
        self.dsl_operators = self.scale_down_dsl(self.dsl_operators)
        print("Post Scaling")
        self.print_dsl_stats()




    def set_target_settings(self):
        super().set_target_settings()

        if self.target == "x86":
            self.scale_factor = 4
        elif self.target == "hvx":
            self.scale_factor = 16



    def scale_down_dsl(self, dsl_operators):
        scaled_down_dsl = []
        for dsl_inst in dsl_operators:

            if dsl_inst.supports_scaling():
                dsl_inst.scale_down(self.scale_factor)
                scaled_down_dsl.append(dsl_inst)

        return scaled_down_dsl






    def partition_ops_into_buckets(self, ops, ctxs , partition_by_ops = True, partition_by_size = True, partition_by_prec = True):

        lengths_bucket = {}
        precs_bucket = {}
        ops_bucket = {}

        if partition_by_ops:
            for idx in range(len(ctxs)):
                dsl_inst = ops[idx]
                ctx = ctxs[idx]
                dsl_ops = dsl_inst.get_semantics_ops_list()
                ctx_ops = self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned())

                key = str(ctx_ops)

                if key not in ops_bucket:
                    ops_bucket[key] = {"count": 0, "ops": ctx_ops}
                ops_bucket[key]['count'] += 1


        if partition_by_size:
            for idx in range(len(ctxs)):
                dsl_inst = ops[idx]
                ctx = ctxs[idx]

                out_size = ctx.out_vectsize
                key = str(out_size)

                if key not in lengths_bucket:
                    lengths_bucket[key] = {"count": 0, "output_size": out_size}
                lengths_bucket[key]['count'] += 1


        if partition_by_prec:
            for idx in range(len(ctxs)):
                dsl_inst = ops[idx]
                ctx = ctxs[idx]

                out_prec = ctx.out_precision
                key = str(out_prec)

                if key not in precs_bucket:
                    precs_bucket[key] = {"count": 0, "output_prec": out_prec}
                precs_bucket[key]['count'] += 1

        print("="*50)

        def print_total_count(bucket):
            count = 0
            for key in bucket:
                count += bucket[key]['count']

            print("Count: ",count)
            print("Num Buckets: ", len(bucket.keys()))

        print("OPs buckets:")
        print(json.dumps(ops_bucket, indent = 2))
        print_total_count(ops_bucket)

        print("Lengths buckets:")
        print(json.dumps(lengths_bucket, indent = 2))
        print_total_count(lengths_bucket)


        print("Precs buckets:")
        print(json.dumps(precs_bucket, indent = 2))
        print_total_count(precs_bucket)

        print("="*50)


        # Using ops wise bucket to partition operations
        buckets = {}

        for idx in range(0, len(ctxs)):
            dsl_inst = ops[idx]
            ctx = ctxs[idx]
            dsl_ops = dsl_inst.get_semantics_ops_list()
            ctx_ops = self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned())

            key = str(ctx_ops)

            if key not in buckets:
                buckets[key] = {"ops": [], "ctxs": []}

            buckets[key]['ops'].append(dsl_inst)
            buckets[key]['ctxs'].append(ctx)


        # Sort the contexts in the buckets in decending order of score

        for key in buckets:
            key_ops = buckets[key]['ops']
            key_ctxs = buckets[key]['ctxs']

            sorted_ops, sorted_ctxs = self.sort_operations(key_ops, key_ctxs)

            buckets[key]['ops'] = sorted_ops
            buckets[key]['ctxs'] = sorted_ctxs




        return buckets


    def get_ops_from_bucket_at_step(self, bucket, step = 1, items_per_bucket = 1):

        indices_set_per_key = []

        def findsubsets(s, n):
            combinations =  list(itertools.combinations(set(s), n))


            # Wrap combination in another list so that
            # we can do a cross product of indices by
            # simply concatinating lists
            return [[list(comb)] for comb in combinations]

        def cross_product(l1, l2):
            prod = []
            for i1 in l1:
                for i2 in l2:
                    prod.append(i1 + i2)

            return prod

        # List of tuples of indices into buckets
        grammar_combs = [[]]
        for key in bucket:
            idx_range = range(0,len(bucket[key]['ops']))
            idx_subsets = findsubsets(idx_range, min(items_per_bucket, len(idx_range)))

            grammar_combs = cross_product(grammar_combs, idx_subsets)


        print("Number of grammar combinations:", len(grammar_combs))
        for i in range(min(5, len(grammar_combs))):
            print(grammar_combs[i])



        step_combination = grammar_combs[step]

        keys = [key for key in bucket]

        comb_ops = []
        comb_ctxs = []
        for idx, key in enumerate(keys):
            key_subset = step_combination[idx]

            for key_idx in key_subset:
                comb_ops.append(bucket[key]['ops'][key_idx])
                comb_ctxs.append(bucket[key]['ctxs'][key_idx])

        return (comb_ops, comb_ctxs)















    def emit_synthesis_grammar(self, main_grammar_name = "synth_grammar", use_lit_holes = USE_LIT_HOLES):

        ## Memory loading layer
        spec_memory_loads = self.get_memory_loads()
        memory_dsl_insts = [spec_memory_loads] * len(spec_memory_loads.contexts)
        memory_dsl_args_list = [ctx.context_args for ctx in spec_memory_loads.contexts]

        # List of sizes of the bitvectors which may be produced
        # or consumed by either layers.
        bitvector_sizes = []


        ## Memory Shuffle layer
        spec_memory_shuffles = self.get_memory_two_input_shuffles()
        memory_shuffle_insts = [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list = spec_memory_shuffles.contexts #[ctx.context_args for ctx in spec_memory_shuffles.contexts]


        spec_memory_shuffles = self.get_single_interleave_shuffles()
        memory_shuffle_insts += [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list += spec_memory_shuffles.contexts #[ctx.context_args for ctx in spec_memory_shuffles.contexts]


        spec_memory_shuffles = self.get_single_deinterleave_shuffles()
        memory_shuffle_insts += [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list += [ctx for ctx in spec_memory_shuffles.contexts]


        spec_memory_shuffles = self.get_two_interleave_shuffles()
        memory_shuffle_insts += [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list += [ctx for ctx in spec_memory_shuffles.contexts]

        # When legalizing target agnostic shuffle operations
        # into target specific shuffles, we don't want to include
        # target agnostic shuffles in the grammar
        if self.is_shuffle or self.spec.contains_conditional():
            memory_shuffle_insts = []
            memory_shuffle_args_list = []

        else:
            if len(memory_shuffle_insts) > SWIZZLE_BOUND:
                (msi, msa) = ([],[])#self.reduce_operations(memory_shuffle_insts, memory_shuffle_args_list, bound = SWIZZLE_BOUND)

                if len(msi) == 0:
                    memory_shuffle_insts = memory_shuffle_insts[:SWIZZLE_BOUND]
                    memory_shuffle_args_list = memory_shuffle_args_list[:SWIZZLE_BOUND]
                else:
                    (memory_shuffle_insts, memory_shuffle_args_list) = (msi,msa)







        ## Operation Layers

        operation_dsl_insts = []
        operation_dsl_args_list = []



        for dsl_inst in self.dsl_operators:


            if self.consider_dsl_inst(dsl_inst):

                if (not self.is_shuffle) and dsl_inst.name in ShuffleList:
                    continue

                operator_contexts = self.get_supported_context_for_dsl(dsl_inst, limit = self.contexts_per_dsl_inst)

                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx for ctx in operator_contexts]


                continue

            ## Including bitwise operations such as bitwise 'or',  'not', 'neg' & 'and'
            ## may enable more novel arithemetic results
            if  USE_BW_ALGO and  self.consider_bitwise_heuristic(dsl_inst):
                operator_contexts = self.get_supported_bitwise_context_for_dsl(dsl_inst, limit = 1) # All elementwise operations of same total length are equivlanet
                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx for ctx in operator_contexts]


        ## Due to the volume of instructions available, selecting contexts
        ## Based of operations and input/output configurations may still result
        ## in too many instructions which would explode synthesis times.

        print("Number of possible instructions in Grammar before pruning:",len(operation_dsl_insts))

        if False and ENABLE_PRUNING:
            # First we filter off operations whose score is <= 2 as they are not likely to be used in the synthesis.
            (operation_dsl_insts, operation_dsl_args_list) = self.prune_low_score_ops(operation_dsl_insts, operation_dsl_args_list,  score = 2)


            # When immediates are present in the specification, they are likely to be used in either broadcast operations or compute operations
            # hence including operations relying on casting these constants to larger bitwidth is necessary. However, when there are no immediates
            # it is unlikely that operations casting a bitvector smaller than the smallest input (or output if output is smallest) would be used.
            (operation_dsl_insts, operation_dsl_args_list) = self.prune_ops_relying_on_imm(operation_dsl_insts, operation_dsl_args_list)


            (operation_dsl_insts, operation_dsl_args_list) = self.prune_ops_relying_on_precision(operation_dsl_insts, operation_dsl_args_list)



            (operation_dsl_insts, operation_dsl_args_list) = self.prune_variant_bvops(operation_dsl_insts, operation_dsl_args_list)




        BOUND = 15
        if self.target == 'hvx':
            BOUND = 20
        if self.spec.contains_conditional():
            BOUND = 25

        (operation_dsl_insts, operation_dsl_args_list) = self.reduce_operations(operation_dsl_insts, operation_dsl_args_list, bound = BOUND)

        bucket = self.partition_ops_into_buckets(operation_dsl_insts, operation_dsl_args_list)
        self.get_ops_from_bucket_at_step(bucket, step = self.step, items_per_bucket = 2)


        for idx, dsl_inst in enumerate(operation_dsl_insts):
            print("Adding: ",operation_dsl_args_list[idx].name, "with score:", self.score_context(operation_dsl_insts[idx], operation_dsl_args_list[idx]), "belonging to target agnostic class", dsl_inst.name )



        # Sort the operations such that the higher scoring operations are
        # visited first in the grammar
        (operation_dsl_insts, operation_dsl_args_list) = self.sort_operations(operation_dsl_insts, operation_dsl_args_list)



        top_level_grammar_args = self.get_top_level_grammar_args()

        for ctx in operation_dsl_args_list:

            context_args = ctx.context_args
            for ctx_arg in context_args:
                if isinstance(ctx_arg, BitVector):
                    bitvector_sizes.append(ctx_arg.size)


        for ctx in memory_shuffle_args_list:

            context_args = ctx.context_args
            for ctx_arg in context_args:
                if isinstance(ctx_arg, BitVector):
                    bitvector_sizes.append(ctx_arg.size)


        bitvector_sizes.append(self.spec.get_output_size())

        bitvector_sizes = list(set(bitvector_sizes))


        lit_holes = self.get_lit_holes(use_lit_holes, bitvector_sizes)

        print("="*50)
        print("Grammar Number of Load DSL Clauses:\t",len(memory_dsl_args_list)+len(lit_holes)*3 + len(top_level_grammar_args))
        print("Grammar Number of Shuffle DSL Clauses:\t",len(memory_shuffle_args_list))
        print("Grammar Number of DSL Compute Clauses:\t",len(operation_dsl_args_list))




        op_names = []
        unique_target_agnostic_ops = []

        for op in operation_dsl_insts:
            if op.name in op_names:
                continue
            unique_target_agnostic_ops.append(op)
            op_names.append(op.name)

        self.dsl_subset = unique_target_agnostic_ops

        operation_dsl_insts += memory_shuffle_insts
        operation_dsl_args_list += memory_shuffle_args_list
        memory_shuffle_insts = []
        memory_shuffle_args_list = []



        spec_ops = self.spec.get_semantics_ops_list()
        include_ramp_lit = "ramp" in spec_ops


        return self.grammar_generator.emit_grammar(
            operation_layer_name = main_grammar_name,
            operation_dsl_insts = operation_dsl_insts,
            operation_dsl_args_list = operation_dsl_args_list,
            top_level_grammar_name = main_grammar_name,
            top_level_grammar_args = top_level_grammar_args,
            lit_holes = lit_holes,
            return_type = self.output_slice_length,
            input_sizes = self.input_sizes,
            imms = self.spec.imms,
            include_ramp_lit = include_ramp_lit
        )





