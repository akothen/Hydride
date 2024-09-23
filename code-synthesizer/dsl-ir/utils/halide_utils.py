import pprint
import copy
import json
import sys

pp = pprint.PrettyPrinter(indent=1)

simd_sizes = [8, 16, 32, 64, 128, 256, 512, 1024, 2048, 2048*2]
simd_precs = [8, 16, 32, 64]

cast_from_sizes = [2048, 1024, 512, 256, 128, 64, 32, 16]
cast_to_sizes = [1024, 512, 256, 128, 64, 32, 16, 8]
cast_from_precs = [64, 32, 16]
cast_to_precs = [32,16, 8]


slice_from_sizes = [2048]
slice_to_sizes = [1024]
slice_from_precs = [32, 16, 8]


concat_from_sizes = [1024]
concat_to_sizes = [2048]
concat_from_precs = [32, 16, 8]


widening_input_sizes = [8, 16, 32, 64, 128, 256, 512,1024, 2048]
widening_input_precs = [8, 16, 32]

input_broadcast_sizes = [8,16,32]
output_broadcast_sizes = [16,32,64,128, 256, 512,1024, 2048]


# Signedness one applies to both
halide_binary_simd_ops_contexts = [
    {"name": "vec-add", "bvops": ["bvadd", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": None},
    {"name": "vec-sub", "bvops": ["bvsub", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": None},
    {"name": "vec-bwand", "bvops": ["bvand", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": None},

    # Signed Operations
    {"name": "vec-mul", "bvops": ["bvmul", "extract", "sign-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-div", "bvops": ["bvsdiv", "extract", "sign-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-sat-add", "bvops": ["bvaddnsw", "extract", "sign-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-sat-sub", "bvops": ["bvsubnsw", "extract", "sign-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-mod", "bvops": ["bvsrem", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-max", "bvops": ["bvsmax", "bvsgt", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-min", "bvops": ["bvsmin", "bvslt", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-rounding_shift_right", "bvops": ["bvshl", "bvashr", "bvssat", "bvsdiv",
                                                   "sign-extend"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-rounding_halving_add", "bvops": ["extract", "bvadd", "sign-extend",
                                                   "bvsdiv"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-halving_add", "bvops": ["extract", "bvadd", "sign-extend",
                                          "bvsdiv"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-absd", "bvops": ["extract", "bvsub", "bvsmax", "bvsmin"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-shr", "bvops": ["extract", "bvashr"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    # Left shift is sign-agnostic
    {"name": "vec-shl", "bvops": ["extract", "bvshl"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": None},


    # UnSigned Operations
    {"name": "vec-mul", "bvops": ["bvmul", "extract", "zero-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-div", "bvops": ["bvudiv", "extract", "zero-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-sat-add", "bvops": ["bvaddnuw", "extract", "zero-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-sat-sub", "bvops": ["bvsubnuw", "extract", "zero-extend"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-mod", "bvops": ["bvurem", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-max", "bvops": ["bvumax", "bvugt", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-min", "bvops": ["bvumin", "bvult", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-rounding_shift_right", "bvops": ["bvshl", "bvlshr", "bvusat", "bvudiv",
                                                   "zero-extend"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-rounding_halving_add", "bvops": ["extract", "bvadd", "zero-extend",
                                                   "bvudiv"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-halving_add", "bvops": ["extract", "bvadd", "zero-extend",
                                          "bvudiv"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-shr", "bvops": ["extract", "bvlshr"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    {"name": "vec-absd", "bvops": ["extract", "bvsub", "bvumax", "bvumin"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},


]


halide_cast_ops_contexts = [

    # Down-casting ops
    {"name": "cast-int", "bvops": ["extract", "sign-extend", "concat"], "from_sizes": cast_from_sizes,
        "from_precs": cast_from_precs,  "to_sizes": cast_to_sizes, "to_precs": cast_to_precs, "signedness": 1},
    {"name": "cast-uint", "bvops": ["extract", "zero-extend", "concat"], "from_sizes": cast_from_sizes,
        "from_precs": cast_from_precs,  "to_sizes": cast_to_sizes, "to_precs": cast_to_precs, "signedness": 0},
    {"name": "vec-saturate", "bvops": ["extract", "bvssat", "concat"], "from_sizes": cast_from_sizes,
        "from_precs": cast_from_precs,  "to_sizes": cast_to_sizes, "to_precs": cast_to_precs, "signedness": 1},
    {"name": "vec-saturate", "bvops": ["extract", "bvusat", "concat"], "from_sizes": cast_from_sizes,
        "from_precs": cast_from_precs,  "to_sizes": cast_to_sizes, "to_precs": cast_to_precs, "signedness": 0},


    # up-casting ops
    {"name": "cast-int", "bvops": ["extract", "sign-extend", "concat"], "from_sizes": cast_to_sizes,
        "from_precs": cast_to_precs,  "to_sizes": cast_from_sizes, "to_precs": cast_from_precs, "signedness": 1},
    {"name": "cast-uint", "bvops": ["extract", "zero-extend", "concat"], "from_sizes": cast_to_sizes,
        "from_precs": cast_to_precs,  "to_sizes": cast_from_sizes, "to_precs": cast_from_precs, "signedness": 0},

]


halide_slice_vector_contexts = [
    {"name": "slice_vectors", "bvops": ["extract",  "concat"], "from_sizes": slice_from_sizes,
        "from_precs": slice_from_precs,  "to_sizes": slice_to_sizes, "signedness": 1},

]


halide_concat_vector_contexts = [
    {"name": "concat_vectors", "bvops": ["extract",  "concat"], "from_sizes": concat_from_sizes,
        "from_precs": concat_from_precs,  "to_sizes": concat_to_sizes, "signedness": 1},

]


halide_unary_ops_contexts = [

    # Signed only
    {"name": "vec-abs", "bvops": ["abs", "extract", "sign-extend", "bitvector->integer"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    {"name": "vec-bwnot", "bvops": ["bvnot", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},
    # {"name": "vec-bwor", "bvops": ["bvor", "extract"] , "sizes": simd_sizes, "precs": simd_precs  , "signedness": 1},


    # Unsigned
    {"name": "vec-bwnot", "bvops": ["bvnot", "extract"],
        "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},
    # {"name": "vec-bwor", "bvops": ["bvor", "extract"] , "sizes": simd_sizes, "precs": simd_precs  , "signedness": 0},

]


halide_ternary_ops_contexts = [

    # Signed

    {"name": "vec-rounding_mul_shift_right", "bvops": ["bvshl", "bvashr", "bvssat",
                                                       "bvsdiv", "sign-extend"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 1},


    # Unsigned
    {"name": "vec-rounding_mul_shift_right", "bvops": ["bvmul", "bvshl", "bvlshr", "bvusat",
                                                       "bvudiv", "zero-extend"], "sizes": simd_sizes, "precs": simd_precs, "signedness": 0},

]


halide_widening_ops_contexts = [

    # Signed

    {"name": "vec-widen-mul", "bvops": ["bvmul", "extract", "sign-extend"],
        "sizes": widening_input_sizes, "precs": widening_input_precs, "signedness": 1},


    # Unsigned

    {"name": "vec-widen-mul", "bvops": ["bvmul", "extract", "zero-extend"],
        "sizes": widening_input_sizes, "precs": widening_input_precs, "signedness": 0},


]


halide_broadcast_contexts = [
    {"name": "xBroadcast", "bvops": ["extract", "concat"], "input_sizes": input_broadcast_sizes,
        "output_sizes": output_broadcast_sizes, "signedness": None},
]


def create_broadcast_halide_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:

        target_desc = {"target_instructions": {}, "semantics": desc["bvops"]}
        for is_idx in range(len(desc['input_sizes'])):
            for os_idx in range(len(desc['output_sizes'])):
                input_size = desc['input_sizes'][is_idx]
                output_size = desc['output_sizes'][os_idx]

                args = ["SYMBOLIC_BV_{}".format(
                    input_size), str(output_size // input_size)]

                entry = copy.deepcopy({
                    "args": args,
                    "in_vectsize": input_size,
                    "out_vectsize": output_size,
                    "lanesize": input_size,
                    "in_precision": input_size,
                    "out_precision": input_size,
                    "in_vectsize_index": None,
                    "out_vectsize_index": None,
                    "in_lanesize_index": None,
                    "out_lanesize_index": None,
                    "in_precision_index": None,
                    "out_precision_index": None,
                    "arg_permute_map": [],
                    "Signedness": desc['signedness'],
                    "Cost": "None",
                    "SIMD": "False",
                    "Extensions": ['halide'],
                    "ctx_sema": desc["bvops"],
                })
                target_desc['target_instructions'][desc['name']+"_is"+str(
                    input_size)+"_os"+str(output_size)+"_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            for key in target_desc['target_instructions']:
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc

    return semantics_dict


def create_cast_halide_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:

        target_desc = {"target_instructions": {}, "semantics": desc["bvops"]}
        for is_idx in range(len(desc['from_sizes'])):
            for ip_idx in range(len(desc['from_precs'])):
                input_size = desc['from_sizes'][is_idx]
                output_size = desc['to_sizes'][is_idx]
                input_prec = desc['from_precs'][ip_idx]
                output_prec = desc['to_precs'][ip_idx]

                args = []

                if desc['name'] == "vec-saturate":
                    signed_arg = ["#f", "#t"][int(desc['signedness'] == 1)]
                    args = ["SYMBOLIC_BV_{}".format(input_size), str(
                        output_size // output_prec), str(output_prec), signed_arg]
                else:
                    args = ["SYMBOLIC_BV_{}".format(input_size), str(
                        output_size // output_prec), str(output_prec)]

                entry = copy.deepcopy({
                    "args": args,
                    "in_vectsize": input_size,
                    "out_vectsize": output_size,
                    "lanesize": input_prec,
                    "in_precision": input_prec,
                    "out_precision": output_prec,
                    "in_vectsize_index": None,
                    "out_vectsize_index": None,
                    "in_lanesize_index": None,
                    "out_lanesize_index": 2,
                    "in_precision_index": None,
                    "out_precision_index": 2,
                    "arg_permute_map": [],
                    "Signedness": desc['signedness'],
                    "Cost": "None",
                    "SIMD": "False",
                    "Extensions": ['halide'],
                    "ctx_sema": desc["bvops"],
                })
                target_desc['target_instructions'][desc['name']+"_ip"+str(input_prec)+"_is"+str(input_size) + "_op"+str(
                    output_prec)+"_os"+str(output_size) + "_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            for key in target_desc['target_instructions']:
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc

    return semantics_dict


def create_concat_halide_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:

        target_desc = {"target_instructions": {}, "semantics": desc["bvops"]}
        for is_idx in range(len(desc['from_sizes'])):
            for ip_idx in range(len(desc['from_precs'])):
                input_size = desc['from_sizes'][is_idx]
                output_size = desc['to_sizes'][is_idx]
                input_prec = desc['from_precs'][ip_idx]
                output_prec = desc['from_precs'][ip_idx]

                args = ["SYMBOLIC_BV_{}".format(
                    input_size)] * (output_size // input_size)
                entry = copy.deepcopy({
                    "args": args,
                    "in_vectsize": input_size,
                    "out_vectsize": output_size,
                    "lanesize": input_prec,
                    "in_precision": input_prec,
                    "out_precision": output_prec,
                    "in_vectsize_index": None,
                    "out_vectsize_index": None,
                    "in_lanesize_index": None,
                    "out_lanesize_index": None,
                    "in_precision_index": None,
                    "out_precision_index": None,
                    "arg_permute_map": [],
                    "Signedness": desc['signedness'],
                    "Cost": "None",
                    "SIMD": "False",
                    "Extensions": ['halide'],
                    "ctx_sema": desc["bvops"],
                })
                target_desc['target_instructions'][desc['name']+"_ip"+str(input_prec)+"_is"+str(input_size) + "_op"+str(
                    output_prec)+"_os"+str(output_size) + "_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            for key in target_desc['target_instructions']:
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc

    return semantics_dict


def create_slice_halide_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:

        target_desc = {"target_instructions": {}, "semantics": desc["bvops"]}
        for is_idx in range(len(desc['from_sizes'])):
            for ip_idx in range(len(desc['from_precs'])):
                input_size = desc['from_sizes'][is_idx]
                output_size = desc['to_sizes'][is_idx]
                input_prec = desc['from_precs'][ip_idx]
                output_prec = desc['from_precs'][ip_idx]

                # slice vector base stride num elements

                # Assuming stride of one for slicing
                # Choosing different offsets

                for offset in range(0, input_size // output_size):

                    slice_offset = str((offset * output_size) // input_prec)
                    slice_stride = str(1)
                    slice_elems = str(output_size // input_prec)
                    args = ["SYMBOLIC_BV_{}".format(
                        input_size), slice_offset, slice_stride, slice_elems]
                    entry = copy.deepcopy({
                        "args": args,
                        "in_vectsize": input_size,
                        "out_vectsize": output_size,
                        "lanesize": input_prec,
                        "in_precision": input_prec,
                        "out_precision": output_prec,
                        "in_vectsize_index": None,
                        "out_vectsize_index": None,
                        "in_lanesize_index": None,
                        "out_lanesize_index": None,
                        "in_precision_index": None,
                        "out_precision_index": None,
                        "arg_permute_map": [],
                        "Signedness": desc['signedness'],
                        "Cost": "None",
                        "SIMD": "False",
                        "Extensions": ['halide'],
                        "ctx_sema": desc["bvops"],
                    })
                    target_desc['target_instructions'][desc['name']+"_ip"+str(input_prec)+"_is"+str(input_size) + "_op"+str(output_prec)+"_os"+str(
                        output_size) + "_signed_"+str(desc['signedness']) + "_{}_{}_{}".format(slice_offset, slice_stride, slice_elems)] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            for key in target_desc['target_instructions']:
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc

    return semantics_dict


def create_nary_halide_dict_entry(classes, n=1):

    semantics_dict = {}

    for desc in classes:
        target_desc = {"target_instructions": {},
                       "semantics": desc["bvops"]}.copy()
        for size in desc['sizes']:
            for prec in desc['precs']:
                entry = copy.deepcopy({
                    "args": ["SYMBOLIC_BV_{}".format(size)] * n,
                    "in_vectsize": size,
                    "out_vectsize": size,
                    "lanesize": prec,
                    "in_precision": prec,
                    "out_precision": prec,
                    "in_vectsize_index": None,
                    "out_vectsize_index": None,
                    "in_lanesize_index": None,
                    "out_lanesize_index": None,
                    "in_precision_index": None,
                    "out_precision_index": None,
                    "arg_permute_map": [],
                    "Signedness": desc['signedness'],
                    "Cost": "None",
                    "SIMD": "True",
                    "Extensions": ['halide'],
                    "ctx_sema": desc["bvops"],
                })

                target_desc['target_instructions'][desc['name']+"_p" +
                                                   str(prec)+"_s"+str(size)+"_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            semantics_dict[desc['name']]['semantics'] = list(
                set(semantics_dict[desc['name']]['semantics']))

            for key in target_desc['target_instructions']:
                assert key not in semantics_dict[desc['name']
                                                 ]['target_instructions'], "Key should not be present in dict"
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc.copy()

    return semantics_dict


def create_widening_halide_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:

        target_desc = {"target_instructions": {}, "semantics": desc["bvops"]}
        for size in desc['sizes']:
            for prec in desc['precs']:
                entry = copy.deepcopy({
                    "args": ["SYMBOLIC_BV_{}".format(size)] * 2,
                    "in_vectsize": size,
                    "out_vectsize": size * 2,
                    "lanesize": prec,
                    "in_precision": prec,
                    "out_precision": prec * 2,
                    "in_vectsize_index": None,
                    "out_vectsize_index": None,
                    "in_lanesize_index": None,
                    "out_lanesize_index": None,
                    "in_precision_index": None,
                    "out_precision_index": None,
                    "arg_permute_map": [],
                    "Signedness": desc['signedness'],
                    "Cost": "None",
                    "SIMD": "True",
                    "Extensions": ['halide'],
                    "ctx_sema": desc["bvops"],
                })
                target_desc['target_instructions'][desc['name']+"_p" +
                                                   str(prec)+"_s"+str(size)+"_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            for key in target_desc['target_instructions']:
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc

    return semantics_dict


repair_reduce_contexts = [

    {"name": "typed:signed-vector_reduce_add", "bvops": ["bvadd", "extract"],
     "sizes": simd_sizes, "precs": simd_precs, "signedness": None, "reduce_factors": reduce_factors},

]



def create_reduce_repair_dict_entry(classes):

    semantics_dict = {}

    for desc in classes:
        target_desc = {"target_instructions": {},
                       "semantics": desc["bvops"]}.copy()
        for size in desc['sizes']:
            for prec in desc['precs']:
                for reduce_factor in desc['reduce_factors']:

                    if prec > size:
                        continue

                    if size // reduce_factor != prec:
                        continue

                    entry = copy.deepcopy({
                        "args": [str(reduce_factor), "SYMBOLIC_BV_{}".format(size), str(prec), str(size)] ,
                        "in_vectsize": size,
                        "out_vectsize": prec,
                        "lanesize": prec,
                        "in_precision": prec,
                        "out_precision": prec,
                        "in_vectsize_index": 3,
                        "out_vectsize_index": 2,
                        "in_lanesize_index": 2,
                        "out_lanesize_index": 2,
                        "in_precision_index": 2,
                        "out_precision_index": 2,
                        "arg_permute_map": [],
                        "Signedness": desc['signedness'],
                        "Cost": "None",
                        "SIMD": "True",
                        "Extensions": ['repair'],
                        "ctx_sema": desc["bvops"],
                    })

                    target_desc['target_instructions'][desc['name']+"_p" +
                                                       str(prec)+"_s"+str(size)+"_signed_"+str(desc['signedness'])] = entry

        if desc['name'] in semantics_dict:
            semantics_dict[desc['name']]['semantics'] += desc['bvops']
            semantics_dict[desc['name']]['semantics'] = list(
                set(semantics_dict[desc['name']]['semantics']))

            for key in target_desc['target_instructions']:
                assert key not in semantics_dict[desc['name']
                                                 ]['target_instructions'], "Key should not be present in dict"
                semantics_dict[desc['name']
                               ]['target_instructions'][key] = target_desc['target_instructions'][key]
        else:
            semantics_dict[desc['name']] = target_desc.copy()

    return semantics_dict

reduce_dicts = create_reduce_repair_dict_entry(repair_reduce_contexts)

ternary_dict = create_nary_halide_dict_entry(halide_ternary_ops_contexts, n=3)
simd_dict = create_nary_halide_dict_entry(halide_binary_simd_ops_contexts, n=2)
unary_dict = create_nary_halide_dict_entry(halide_unary_ops_contexts, n=1)
cast_dict = create_cast_halide_dict_entry(halide_cast_ops_contexts)
widen_dict = create_widening_halide_dict_entry(halide_widening_ops_contexts)
broadcast_dict = create_broadcast_halide_dict_entry(halide_broadcast_contexts)
slice_dict = create_slice_halide_dict_entry(halide_slice_vector_contexts)
concat_dict = create_concat_halide_dict_entry(halide_concat_vector_contexts)

halide_dicts = [concat_dict, slice_dict, broadcast_dict,
                unary_dict, simd_dict, cast_dict, ternary_dict, widen_dict, reduce_dicts]


combined_dict = {}


for dict in halide_dicts:
    for key in dict:
        combined_dict[key] = dict[key]


print("halide_semantics = ", end=" ")
pp.pprint(combined_dict)
