from hashlib import md5
from common.Types import *
from common.Instructions import *
from common.PredefinedDSL import *
import random
from ShuffleList import ShuffleList

from synthesizer.SynthesizerBase import SynthesizerBase

import json

import itertools
import sys

import ast
import time


def debug(*args):
    PRINT_DEBUG = True
    if PRINT_DEBUG:
        print("\t".join([str(arg) for arg in args]))


def string_hash(string):
    return md5(string.encode()).hexdigest()


"""
Given a specification, the possible set of relavent instructions
may be too large, preventing synthesis from scaling. Instead of using
a single grammar expression, we can perform multiple quick short
synthesis queries. The StepWiseSynthesizer enables creation of these
multiple grammars in a deterministic way such that clients can step
through the grammar.

"""


DEBUG = True
DEBUG_LIST = ["hexagon_V6_vcombine_128B"]
SKIP_LIST = []

MUST_INCLUDE = []
USE_BW_ALGO = False
ENABLE_SHUFFLE = True
UPCAST_OPERATIONS = False
USE_LIT_HOLES = True
PRUNE_BVOP_VARIANTS = True


# Bound the number of swizzle operations in the
# grammar

class StepWiseSynthesizer(SynthesizerBase):

    def __init__(self, spec=None, dsl_operators=[],
                 struct_definer=None, grammar_generator=None,
                 vectorization_factor=8,
                 depth=6,
                 contexts_per_dsl_inst=None,
                 is_shuffle=False,
                 target="x86",
                 legal_map={},
                 step=1,
                 scale_factor=1
                 ):

        self.scale_factor = scale_factor

        super().__init__(spec=spec, dsl_operators=dsl_operators,
                         struct_definer=struct_definer, grammar_generator=grammar_generator, vectorization_factor=vectorization_factor, depth=depth,
                         contexts_per_dsl_inst=contexts_per_dsl_inst,
                         is_shuffle=is_shuffle, target=target,
                         legal_map=legal_map)
        self.step = step
        debug("Using Stepwise Synthesizer!")

        self.set_target_settings()
        self.partition_flexibility = 4

        self.is_shuffle = is_shuffle

        # if self.is_shuffle:
        #    self.contexts_per_dsl_inst = None

        # Lowering of swizzles stages happens at ful bitwidth
        if is_shuffle:
            self.scale_factor = 1

        print("Scale factor used in synthesizer: ", self.scale_factor)

        debug("Pre Scaling")
        self.print_dsl_stats()
        self.dsl_operators = self.scale_down_dsl(self.dsl_operators)
        debug("Post Scaling")
        self.print_dsl_stats()

        with open("tmp.txt", "w+") as Temp:
            Temp.write("ctxs\n")
            for d in self.dsl_operators:
                for c in d.contexts:
                    Temp.write(c.name+"\n")

    def get_dsl_summary(self, dsl_list):

        summary_obj = {
            "max_input_prec": 0,
            "max_output_prec": 0,
            "min_input_prec": 0,
            "min_output_prec": 0,
            "max_input_lanesize": 0,
            "max_output_lanesize": 0,
            "min_input_lanesize": 0,
            "min_output_lanesize": 0,
        }

        for dsl_inst in dsl_list:

            for ctx in dsl_inst.contexts:

                summary_obj['max_input_prec'] = max(
                    summary_obj['max_input_prec'], ctx.in_precision)
                summary_obj['max_output_prec'] = max(
                    summary_obj['max_output_prec'], ctx.out_precision)

                summary_obj['min_input_prec'] = min(
                    summary_obj['min_input_prec'], ctx.in_precision)
                summary_obj['min_output_prec'] = min(
                    summary_obj['min_output_prec'], ctx.out_precision)

                summary_obj['max_input_lanesize'] = max(
                    summary_obj['max_input_lanesize'], ctx.in_precision)
                summary_obj['max_output_lanesize'] = max(
                    summary_obj['max_output_lanesize'], ctx.out_precision)

                summary_obj['min_input_lanesize'] = min(
                    summary_obj['min_input_lanesize'], ctx.in_precision)
                summary_obj['min_output_lanesize'] = min(
                    summary_obj['min_output_lanesize'], ctx.out_precision)

        return summary_obj

    def set_target_settings(self):
        super().set_target_settings()

        if self.target == "x86":
            self.MAX_BW_SIZE = self.MAX_BW_SIZE // self.scale_factor
            self.SWIZZLE_BOUND = 10
        elif self.target == "hvx":
            self.MAX_BW_SIZE = self.MAX_BW_SIZE // self.scale_factor
            self.BASE_VECT_SIZE = self.BASE_VECT_SIZE // self.scale_factor
            self.SWIZZLE_BOUND = 15
        elif self.target == "arm":
            self.MAX_BW_SIZE = self.MAX_BW_SIZE // self.scale_factor
            self.SWIZZLE_BOUND = 10

    def scale_down_dsl(self, dsl_operators):
        if self.scale_factor == 1:
            return dsl_operators

        scaled_down_dsl = []
        for dsl_inst in dsl_operators:

            BASE_SIZE = None
            if self.BASE_VECT_SIZE != None:
                BASE_SIZE = self.BASE_VECT_SIZE * self.scale_factor

            if dsl_inst.supports_scaling():
                dsl_inst.scale_contexts(
                    self.scale_factor, base_vector_size=BASE_SIZE)
                scaled_down_dsl.append(dsl_inst)

        return scaled_down_dsl

    def partition_ops_into_buckets(self, ops, ctxs, partition_by_ops=True, partition_by_size=True, partition_by_prec=True):

        lengths_bucket = {}
        precs_bucket = {}
        ops_bucket = {}

        if partition_by_ops:
            for idx in range(len(ctxs)):
                dsl_inst = ops[idx]
                ctx = ctxs[idx]
                dsl_ops = dsl_inst.get_semantics_ops_list()
                ctx_ops = ctx.get_bv_ops()  # self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned(), non_signed = ctx.is_nonsigned())

                key = str(sorted(ctx_ops, key=lambda x: BV_OPS.index(x)))

                ctx_ops = sorted(ctx_ops, key=lambda x: BV_OPS.index(x))

                if key not in ops_bucket:
                    ops_bucket[key] = {"count": 0, "ops": ctx_ops}
                ops_bucket[key]['count'] += 1
                # print("Adding ", ctx.name, "to op bucket with key", key)

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

        debug("="*50)

        def print_total_count(bucket):
            count = 0
            for key in bucket:
                count += bucket[key]['count']

            debug("Count: ", count)
            debug("Num Buckets: ", len(bucket.keys()))

        # Using ops wise bucket to partition operations
        buckets = {}

        for idx in range(0, len(ctxs)):
            dsl_inst = ops[idx]
            ctx = ctxs[idx]
            dsl_ops = dsl_inst.get_semantics_ops_list()
            ctx_ops = ctx.get_bv_ops()  # self.convert_ops_to_signedness( dsl_ops, get_signed = ctx.is_signed(), get_unsigned = ctx.is_unsigned(), non_signed = ctx.is_nonsigned())

            ctx_ops = sorted(ctx_ops, key=lambda x: BV_OPS.index(x))

            key = str(ctx_ops)

            if key not in buckets:
                buckets[key] = {"ops": [], "ctxs": []}

            buckets[key]['ops'].append(dsl_inst)
            buckets[key]['ctxs'].append(ctx)

            print("Adding ", ctx.name, "to op bucket with key", key)

        # Sort the contexts in the buckets in decending order of score

        for key in buckets:
            key_ops = buckets[key]['ops']
            key_ctxs = buckets[key]['ctxs']

            sorted_ops, sorted_ctxs = self.sort_operations(key_ops, key_ctxs)

            buckets[key]['ops'] = sorted_ops
            buckets[key]['ctxs'] = sorted_ctxs

        return buckets








    # Identify set of key combinations which span (with flexibility) the spec
    # For each key combination identify the set of concrete contexts (take 100 first combinations for bound)
    #       - Each key combination get's at most k iterations
    # Fold all ctx names combinations into the list and de-duplicate:
    # Step simply indexes into this list instead: avoid multiple same combinations issues

    def get_ops_from_bucket_at_step_alt(self, bucket, step=1, items_per_bucket=1, max_num_clauses=10):
        indices_set_per_key = []
        shuffle_width = 3

        actual_max_width = 0

        for key in bucket:
            if key != '[]':
                actual_max_width += items_per_bucket
            else:
                actual_max_width += min(len(bucket[key]['ops']), shuffle_width)

        max_num_clauses = min(actual_max_width, max_num_clauses)

        def findsubsets(s, n):
            combinations = list(itertools.combinations(s, n))

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

        shuffle_key = []
        if '[]' in bucket:
            shuffle_key = ['[]']

        sorted_keys_lexo = sorted(
            [key for key in bucket if key != '[]'], key=lambda x: string_hash(x))
        sorted_keys = sorted_keys_lexo + shuffle_key

        sample_key_sizes = max(
            min(len(sorted_keys) - 1, int(max_num_clauses / 2)), 0)



        spec_ops = self.spec.get_semantics_ops_list()
        if sample_key_sizes <= 3 and "bvmul" not in spec_ops:
            sample_key_sizes =  max(min(len(sorted_keys) -1,4 ), 0)


        print("Sample key sizes:", sample_key_sizes)

        if sample_key_sizes == 0:

            ops = []
            ctxs = []

            for key in bucket:
                ops += bucket[key]['ops']
                ctxs += bucket[key]['ctxs']

            return ops, ctxs

        # print("Sample key sizes:", sample_key_sizes)

        # For higher depths, to maintain tractability during synthesis, we only include
        # a sample of the buckets at each step. Note that the '[]' bucket (i.e. shuffles)
        # is sampled at every interval
        sample_keys = list(itertools.combinations(
            sorted_keys_lexo, sample_key_sizes))

        sample_keys = [list(ele) for ele in sample_keys]

        previous_keys = sample_keys
        assert previous_keys != [], "Combination should be non-empty"
        #print("previous keys",previous_keys)
        if self.depth >= 2:
            sample_keys = [sample for sample in sample_keys if sum(
                [1 for ele in sample if "bvmul" in ele]) <= 3]

        if sample_keys == []:
            sample_keys = previous_keys

        for sample in sample_keys:
            break
            print("====BREAK=====")
            print(sample)
            print(sum([1 for ele in sample if "bvmul" in ele]))

        print("spec_ops:", spec_ops)

        def spans_spec(comb, non_matching_lim=1):
            eval_str = [ast.literal_eval(ele) for ele in comb]
            fold_ops = []
            for ops in eval_str:
                fold_ops += ops

            non_matching_count = 0

            for op in spec_ops:
                if op not in fold_ops:
                    non_matching_count += 1

            # print("Checking in span:", eval_str, (non_matching_count < non_matching_lim) )
            return (non_matching_count < non_matching_lim)

        flexibility_start = 0
        if "bvmul" in spec_ops and self.target == 'hvx':
            flexibility_start = 0

        print("flexibility_start:", flexibility_start)
        for flexibility in range(flexibility_start, self.partition_flexibility):
            def helper_fn(x): return spans_spec(
                x, non_matching_lim=flexibility + 1)
            test_flex = list(filter(helper_fn, sample_keys))

            if test_flex != []:
                sample_keys = test_flex
                print("Flexibility: ", flexibility)
                break
            elif flexibility == self.partition_flexibility - 1:
                debug("Spec:", spec_ops)
                print("effective step:", step)
                # print(sample_keys)
                assert False, "Current set of operations not sufficient to support partitioning grammar"

        # sample_keys contains those key combinations which span the spec with flexibility

        assert sample_keys != [], "Key's after filtering are empty"

        # key_switch_sample: Number of steps after which sampling should switch keys
        key_switch_sample = 4

        filtered_sample_keys = sample_keys[: min(len(sample_keys), 100)]

        # print("filtered_sample_keys:")
        # for sample_key in filtered_sample_keys:
        #    print(sample_key)

        # Preserve ordering efficient deduplicator

        def f7(seq):
            seen = set()
            seen_add = seen.add
            return [x for x in seq if not (str(x) in seen or seen_add(str(x)))]

        context_combinations = []
        for sample_key in filtered_sample_keys:

            key_grammar_combs = [[]]

            sorted_keys = []

            if self.target == 'hvx':
                # traverse shuffle keys first as more important in hvx
                sorted_keys = list(sample_key) + shuffle_key
            else:
                # Traverse variations in multiplications first

                def count_muls(key):
                    # print("count muls key:", key)
                    return sum([1 for ele in key if "bvmul" in ele]) + len(bucket[key]['ops'])

                sorted_keys = shuffle_key + \
                    sorted(list(sample_key), key=lambda e: count_muls(e))

                # print(sorted_keys)

            sorted_keys = list(sample_key) + shuffle_key

            for key in sorted_keys:
                idx_range = range(0, len(bucket[key]['ops']))
                limit = items_per_bucket
                if key == '[]':
                    limit = 4 # Set to 4 for hvx_matmul and depthwise_conv, normally 3

                idx_subsets = findsubsets(
                    idx_range, min(limit, len(idx_range)))

                key_grammar_combs = cross_product(
                    key_grammar_combs, idx_subsets)

            # print("Testing sample key:", sample_key)
            # print(key_grammar_combs)
            # sys.exit(1)

            # At most 'key_switch_sample' combinations belong to given key combination
            key_grammar_combs = key_grammar_combs[: min(
                len(key_grammar_combs), key_switch_sample)]
            key_grammar_combs = f7(key_grammar_combs)

            # print("Adding {} combinations for key sample {}".format(len(key_grammar_combs), sorted_keys))

            for comb in (key_grammar_combs):
                context_combinations.append((sorted_keys, comb))

        # Context_Combinations contains the list of combinations with possible duplications

        context_combinations = f7(context_combinations)

        print("Number of context combinations at depth {} is {}".format(
            self.depth, len(context_combinations)))

        # print("Context combinations")
        # for cx in context_combinations[:10]:
        #    print(cx[0])
        #    print(cx[1])

        # FIXME: Currently relying on this assertion failing when visiting the same
        # grammar combination, which in turn fails to generate assertion, which causes
        # traversals from this point onwards to not be visited, saving time from repeating
        # visits. Better approach would be to first query the number of possible combinations
        # and then limit the steps to be within those (if combinations is less than budget steps)
        assert (step < len(context_combinations)
                ), "Repeating previously visited step"

        step_combination = context_combinations[step % len(
            context_combinations)]

        (step_keys, step_indices) = step_combination

        comb_ops = []
        comb_ctxs = []
        for idx, key in enumerate(step_keys):
            key_subset = step_indices[idx]

            print(bucket[key])
            for key_idx in key_subset:
                comb_ops.append(bucket[key]['ops'][key_idx])
                comb_ctxs.append(bucket[key]['ctxs'][key_idx])

        return (comb_ops, comb_ctxs)

    def prune_masked_operations(self, ops, ctxs):
        pruned_ops = []
        pruned_ctxs = []

        for i in range(len(ops)):
            if "mask" in ops[i].name or "mask" in ctxs[i].name:
                continue
            pruned_ops.append(ops[i])
            pruned_ctxs.append(ctxs[i])

        return (pruned_ops, pruned_ctxs)


    def does_need_scalar_casts(self):

        if self.target not in ["hvx"]:
            return False


        for inp in self.input_sizes:
            if inp <= 16:
                return True

        return False


    def get_scalar_casts(self):

        if not self.does_need_scalar_casts():
            return ([], [])

        # ZEXT
        zext_inst = self.get_scalar_zexts()

        insts = [zext_inst] * len(zext_inst.contexts)
        ctxs = zext_inst.contexts

        return (insts, ctxs)




    def emit_synthesis_grammar(self, main_grammar_name = "synth_grammar", use_lit_holes = USE_LIT_HOLES):

        ## Memory loading layer
        spec_memory_loads = self.get_memory_loads()
        memory_dsl_insts = [spec_memory_loads] * \
            len(spec_memory_loads.contexts)
        memory_dsl_args_list = [
            ctx.context_args for ctx in spec_memory_loads.contexts]

        # List of sizes of the bitvectors which may be produced
        # or consumed by either layers.
        bitvector_sizes = []

        # Memory Shuffle layer
        # spec_memory_shuffles = self.get_memory_two_input_shuffles()
        # memory_shuffle_insts = [spec_memory_shuffles] * len(spec_memory_shuffles.contexts)
        # memory_shuffle_args_list = spec_memory_shuffles.contexts #[ctx.context_args for ctx in spec_memory_shuffles.contexts]

        memory_shuffle_insts = []
        memory_shuffle_args_list = []

        spec_memory_shuffles = self.get_single_interleave_shuffles()
        memory_shuffle_insts = [spec_memory_shuffles] * \
            len(spec_memory_shuffles.contexts)
        # [ctx.context_args for ctx in spec_memory_shuffles.contexts]
        memory_shuffle_args_list = spec_memory_shuffles.contexts

        spec_memory_shuffles = self.get_single_deinterleave_shuffles()
        memory_shuffle_insts += [spec_memory_shuffles] * \
            len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list += [
            ctx for ctx in spec_memory_shuffles.contexts]

        spec_memory_shuffles = self.get_two_interleave_shuffles()
        memory_shuffle_insts += [spec_memory_shuffles] * \
            len(spec_memory_shuffles.contexts)
        memory_shuffle_args_list += [
            ctx for ctx in spec_memory_shuffles.contexts]

        # When legalizing target agnostic shuffle operations
        # into target specific shuffles, we don't want to include
        # target agnostic shuffles in the grammar
        if self.is_shuffle or self.spec.contains_conditional():
            memory_shuffle_insts = []
            memory_shuffle_args_list = []

        else:

            debug("total number of shuffles:", len(memory_shuffle_insts))
            if len(memory_shuffle_insts) > self.SWIZZLE_BOUND:
                # self.reduce_operations(memory_shuffle_insts, memory_shuffle_args_list, bound = self.SWIZZLE_BOUND)
                (msi, msa) = ([], [])

                if len(msi) == 0:
                    memory_shuffle_insts = memory_shuffle_insts[:self.SWIZZLE_BOUND]
                    memory_shuffle_args_list = memory_shuffle_args_list[:self.SWIZZLE_BOUND]
                else:
                    (memory_shuffle_insts, memory_shuffle_args_list) = (msi, msa)

        # Operation Layers

        operation_dsl_insts = []
        operation_dsl_args_list = []

        for dsl_inst in self.dsl_operators:

            if self.consider_dsl_inst(dsl_inst):

                if (not self.is_shuffle) and dsl_inst.name in ShuffleList:
                    continue

                operator_contexts = self.get_supported_context_for_dsl(
                    dsl_inst, limit=self.contexts_per_dsl_inst)

                operation_dsl_insts += ([dsl_inst] * len(operator_contexts))
                operation_dsl_args_list += [ctx for ctx in operator_contexts]

                continue
            else:
                print(f"Skipping  {dsl_inst.name} as it is not considered")

        # Due to the volume of instructions available, selecting contexts
        # Based of operations and input/output configurations may still result
        # in too many instructions which would explode synthesis times.

        debug("Number of possible instructions in Grammar before pruning:",
              len(operation_dsl_insts))

        if self.ENABLE_PRUNING and not self.is_shuffle:
            # First we filter off operations whose score is <= 2 as they are not likely to be used in the synthesis.
            if self.target not in ["hvx"]:
                (operation_dsl_insts, operation_dsl_args_list) = self.prune_low_score_ops(
                    operation_dsl_insts, operation_dsl_args_list,  score=2)

            # When immediates are present in the specification, they are likely to be used in either broadcast operations or compute operations
            # hence including operations relying on casting these constants to larger bitwidth is necessary. However, when there are no immediates
            # it is unlikely that operations casting a bitvector smaller than the smallest input (or output if output is smallest) would be used.
            (operation_dsl_insts, operation_dsl_args_list) = self.prune_ops_relying_on_imm(
                operation_dsl_insts, operation_dsl_args_list)

            # Temporarily disabling
            (operation_dsl_insts, operation_dsl_args_list) = self.prune_ops_relying_on_precision(
                operation_dsl_insts, operation_dsl_args_list)

            (operation_dsl_insts, operation_dsl_args_list) = self.prune_variant_bvops(
                operation_dsl_insts, operation_dsl_args_list)

        BOUND = 16
        if self.target == 'hvx':
            delta = [0, 0, 0, 0, 1, 3, 4, 4]
            if self.depth <= 2:
                BOUND = 25
            elif self.depth == 3:
                BOUND = 20 - delta[len(self.spec.input_precision)]
            elif self.depth >= 4:
                BOUND = 16
        if self.target == "x86":
            BOUND = 25
        if self.target == "arm":
            BOUND = 25

        if self.spec.contains_conditional():
            BOUND = 25

        if self.depth >= 4:
            BOUND = 25  # 16 for regular benchmarks, 20 needed for matmul

        (operation_dsl_insts, operation_dsl_args_list) = self.prune_using_hvx_acc_ops(
            operation_dsl_insts, operation_dsl_args_list)

        if not self.is_shuffle:
            (operation_dsl_insts, operation_dsl_args_list) = self.reduce_operations(
                operation_dsl_insts, operation_dsl_args_list, bound=BOUND)
        else:
            (operation_dsl_insts, operation_dsl_args_list) = self.prune_masked_operations(
                operation_dsl_insts, operation_dsl_args_list)

        if self.target != "arm":  # HOTFIX: interleave-vectors takes vmovl's place
            operation_dsl_insts += memory_shuffle_insts
            operation_dsl_args_list += memory_shuffle_args_list
            memory_shuffle_insts = []
            memory_shuffle_args_list = []

        for idx, dsl_inst in enumerate(operation_dsl_insts):
            print("Pool Of operations: ", operation_dsl_args_list[idx].name, "with score:", self.score_context(
                operation_dsl_insts[idx], operation_dsl_args_list[idx]), "belonging to target agnostic class", dsl_inst.name)

        if not self.is_shuffle:
            MAX_NUM_CLAUSES = 16

            if self.target == 'x86':
                MAX_NUM_CLAUSES = 18
            if self.depth >= 4:
                MAX_NUM_CLAUSES = 7  # 7 7 by default changing to 8 for matmul


            bucket = self.partition_ops_into_buckets(operation_dsl_insts, operation_dsl_args_list)

            if len(operation_dsl_insts) > 5 :
                (operation_dsl_insts, operation_dsl_args_list) = self.get_ops_from_bucket_at_step_alt(bucket, step = self.step, items_per_bucket = 3, max_num_clauses = MAX_NUM_CLAUSES)


        (scalar_zext_ops, scalar_zext_contexts) = self.get_scalar_casts()

        operation_dsl_insts += scalar_zext_ops
        operation_dsl_args_list += scalar_zext_contexts


        grammar_ops_str = []
        for idx, dsl_inst in enumerate(operation_dsl_insts):
            grammar_ops_str.append(
                " ".join(["[s{}_d{}]".format(self.step, self.depth), "Adding: ", operation_dsl_args_list[idx].name, "with score:", str(
                    self.score_context(operation_dsl_insts[idx], operation_dsl_args_list[idx])), "belonging to target agnostic class", dsl_inst.name])
            )

            # print("[s{}_d{}]".format(self.step, self.depth), "Adding: ",operation_dsl_args_list[idx].name, "with score:", self.score_context(operation_dsl_insts[idx], operation_dsl_args_list[idx]), "belonging to target agnostic class", dsl_inst.name )
        print("\n".join(["="*50] + grammar_ops_str))

        # Sort the operations such that the higher scoring operations are
        # visited first in the grammar
        (operation_dsl_insts, operation_dsl_args_list) = self.sort_operations(
            operation_dsl_insts, operation_dsl_args_list)

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
        print("Grammar Number of Load DSL Clauses:\t", len(
            memory_dsl_args_list)+len(lit_holes)*3 + len(top_level_grammar_args))
        print("Grammar Number of Shuffle DSL Clauses:\t",
              len(memory_shuffle_args_list))
        print("Grammar Number of DSL Compute Clauses:\t",
              len(operation_dsl_args_list))

        op_names = []
        unique_target_agnostic_ops = []

        for op in operation_dsl_insts:
            if op.name in op_names:
                continue
            unique_target_agnostic_ops.append(op)
            op_names.append(op.name)

        self.dsl_subset = unique_target_agnostic_ops

        spec_ops = self.spec.get_semantics_ops_list()
        include_ramp_lit = "ramp" in spec_ops

        imms = self.spec.imms

        if self.is_shuffle:
            imms.append((0, self.spec.output_precision))

        assert len(operation_dsl_insts) != 0 or imms != [
        ], "Must have non-empty grammar"

        return self.grammar_generator.emit_grammar(
            operation_layer_name = main_grammar_name,
            operation_dsl_insts = operation_dsl_insts,
            operation_dsl_args_list = operation_dsl_args_list,
            top_level_grammar_name = main_grammar_name,
            top_level_grammar_args = top_level_grammar_args,
            lit_holes = lit_holes,
            return_type = self.output_slice_length,
            input_sizes = self.input_sizes,
            # input_precs = self.spec.input_precision,
            imms = imms,
            include_ramp_lit = include_ramp_lit,
            # input_signedness =self.spec.input_signedness,
            # use_buffer_id = self.spec.use_buffer_id()
        )

    def score_context(self, dsl_inst,  ctx):

        if self.target == 'hvx' and (any([input_size == self.MAX_BW_SIZE for input_size in self.input_sizes]) or (self.spec.get_output_size() == self.MAX_BW_SIZE)) and ctx.name == "hexagon_V6_vcombine_128B":
            return 15
        if self.target == 'hvx' and ctx.name == "hexagon_V6_hi_128B":
            return 15
        if self.target == 'hvx' and ctx.name == "hexagon_V6_lo_128B":
            return 15
        if self.target == 'arm' and ctx.name == "vget_high_u16":
            return 15
        if self.target == 'arm' and ctx.name == "vget_low_u32":
            return 15
        else:
            return super().score_context(dsl_inst, ctx)
