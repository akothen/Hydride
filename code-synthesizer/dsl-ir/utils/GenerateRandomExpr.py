from common.Instructions import DSLInstruction
from common.Types import *
from common.PredefinedDSL import *
import copy

import random

from datetime import datetime



def get_supported_insts_supports_config(intrinsic, required_output_precision = None, required_output_size = None):


    supported_ctx_idxs = []

    if required_output_precision == None and required_output_size == None:
        return [i for i in range(0, len(intrinsic.contexts)) if intrinsic.contexts[i].in_precision != None]


    for i in range(len(intrinsic.contexts)):

        ctx = intrinsic.contexts[i]


        if (ctx.supports_output_precision(required_output_precision) or all([op in ["extract", "concat"] for op in ctx.get_bv_ops()])) and ctx.supports_output_size(required_output_size):
            supported_ctx_idxs.append(i)


    return supported_ctx_idxs




def supports_config(intrinsic, required_output_precision = None, required_output_size = None):

    if required_output_precision == None and required_output_size == None:
        return True

    return intrinsic.supports_config(output_precision = required_output_precision, output_size = required_output_size)



def create_random_expression(intrinsics, required_output_precision = None,
                             required_output_size = None, depth = 1,
                             arg_start_idx = 0):
    #print("create_random_expression", required_output_precision, required_output_size, "depth", depth)


    if depth == 0 :
        assert required_output_precision != None, "0 depth case requires precision information"
        assert required_output_size != None, "0 depth case requires size information"
        reg_ = Reg(arg_start_idx, required_output_precision, required_output_size)
        arg_start_idx += 1
        return (reg_, arg_start_idx)


    equivalence_class_idx = -1


    random.seed(datetime.now().timestamp())

    # First sample the equivalence class which satisfies
    # required output properties
    for i in range(100):
        if equivalence_class_idx != -1:
            break

        sample_index = random.randint(0, len(intrinsics)-1)
        intrinsic = intrinsics[sample_index]
        if supports_config(intrinsic, required_output_precision = required_output_precision, required_output_size = required_output_size):
            equivalence_class_idx = sample_index

        if required_output_size != None and all([op in ["extract", "concat"] for op in intrinsic.get_semantics_ops_list()]) and intrinsic.supports_output_size(required_output_size):
            equivalence_class_idx = sample_index




    # If there isn't any operation which
    # produces the required type
    # we return a register
    if equivalence_class_idx == -1:
        return create_random_expression(intrinsics, required_output_precision = required_output_precision,
                                        required_output_size = required_output_size, depth = 0,
                                        arg_start_idx = arg_start_idx)


    intrinsic = intrinsics[equivalence_class_idx]

    supported_ctxs_idxs = get_supported_insts_supports_config(intrinsic, required_output_precision= required_output_precision, required_output_size = required_output_size)

    if supported_ctxs_idxs == []:
        # Reinvoke with other random choice
        return create_random_expression(intrinsics, required_output_precision = required_output_precision,
                                        required_output_size = required_output_size, depth = 0,
                                        arg_start_idx = arg_start_idx)


    sample_ctx_idx = random.sample(supported_ctxs_idxs, 1)[0]

    sample_ctx = copy.deepcopy(intrinsic.contexts[sample_ctx_idx])

    if sample_ctx.is_bounded:

        if required_output_precision == None:
            output_precs = [int(prec) for prec in sample_ctx.out_bound_map.keys()]
            sample_ctx.specialize_context_bounded(random.sample(output_precs,1)[0])
        else:
            sample_ctx.specialize_context_bounded(required_output_precision)



    if depth == 1:
        # Current operation forms a leaf, so we bind the operands to Reg type

        for idx, arg in enumerate(sample_ctx.context_args):
            if isinstance(arg, BitVector):
                # Replace with register

                input_prec = sample_ctx.in_precision
                if arg.size in [8,16,32,64]: # Scalar values
                    input_prec = arg.size


                reg_ = Reg(arg_start_idx, input_prec, arg.size, signed = sample_ctx.signedness)
                arg_start_idx += 1
                sample_ctx.context_args[idx] = reg_



        return (sample_ctx, arg_start_idx)


    else:

        for idx, arg in enumerate(sample_ctx.context_args):
            if isinstance(arg, BitVector):

                # replace with another operatin with the required precision
                # and size properties

                input_prec = sample_ctx.in_precision
                if arg.size in [8,16,32,64]: # Scalar values
                    input_prec = arg.size
                (leaf_expr , arg_start_idx) = create_random_expression(intrinsics, required_output_size = arg.size, required_output_precision = input_prec , depth = depth - 1, arg_start_idx = arg_start_idx)

                sample_ctx.context_args[idx] = leaf_expr




        return (sample_ctx, arg_start_idx)









