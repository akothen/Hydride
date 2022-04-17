from Types import *
from Instructions import *


vector_load_sem =  [
    "(define (vector-load mem mem_size start num_elems type_size)",
    "(define result",
    "(apply",
    "  concat",
    "(for/list ([i (range num_elems)])",
    "(scalar-load mem mem_size (+ i start) type_size))",
    "))",
    "result",
    ")",
]

two_input_swizzle_sem = [
    "(define (swizzle idx group_size dis_size rot_factor)",
    "  (define (rotate rot_fact n i)",
    "      ;; Note that Rosette's notation of indexing bitvectors is from right to left",
    "     (modulo (- i rot_fact) n)",
    "  )",
    "  (define (displace dis_factor n i)",
    "       (modulo (+ (* i dis_factor) (floor (/ i (/ n (gcd dis_factor n))))) n)",
    "  )",
    "  (define (group gs group_idx i)",
    "      (+ (* (floor (/ i gs)) gs) group_idx)",
    "  )",
    "  (define result (group group_size (rotate rot_factor group_size (displace dis_size group_size (modulo idx group_size))) idx))",
    "",
    "  result",
    " )",
    "(define (vector-two-input-swizzle v1 v2 num_elems type_size lane_offset lane_size group_size dis_size rot_factor)",
    "  (define high_lane_offset (+ group_size lane_offset))",
    "  (define result",
    "    (apply",
    "     concat",
    "     (for/list ([i (range 0 num_elems lane_size)])",
    "        (apply",
    "          concat",
    "          (for/list ([j (range lane_offset (+ (* 2 group_size)  lane_offset)  )]); (* 2 high_lane_offset))])",
    "            (define raw-index (- j lane_offset))",
    "            (define swizzled-index (swizzle raw-index (* 2 group_size) dis_size rot_factor))",
    "            (if (< swizzled-index group_size)",
    "             (begin",
    "              (define adjusted-swizzled-index (- (- num_elems  1) (+ i lane_offset swizzled-index)))",
    "              (ext-bv v1 adjusted-swizzled-index type_size)",
    "             )",
    "             (begin",
    "              (define adjusted-swizzled-index (- (- num_elems  1) (- (+ i lane_offset swizzled-index) group_size)))",
    "              (ext-bv v2 adjusted-swizzled-index type_size)",
    "             )",
    "            )",
    "          )",
    "        )",
    "      )",
    "     )",
    "    )",
    "  result",
    ")",
]

def create_vector_load_dsl(input_vector_sizes = [],
                           offsets = [],
                           num_elem_sizes = [],
                           precisions = []):
    vec_load_dsl = DSLInstruction(name = "vector-load", simd = False,
                                  operation = False, semantics = vector_load_sem)


    assert len(input_vector_sizes) == len(offsets), "Invalid vector load creation"
    assert len(num_elem_sizes) == len(offsets), "Invalid vector load creation"
    assert len(num_elem_sizes) == len(precisions), "Invalid vector load creation"

    for i in range(0, len(input_vector_sizes)):
        vec_load_dsl.add_context(
            name = "vector_load_S{}_N{}_T{}".format(input_vector_sizes[i], num_elem_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = num_elem_sizes[i] * precisions[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]), str(input_vector_sizes[i]),
                    str(offsets[i]), str(num_elem_sizes[i]), str(precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            lanesize_index = 1,
            in_precision_index = 4,
            out_precision_index = 4,
            cost = "",
        )

    return vec_load_dsl


def create_two_input_swizzle(input_vector_sizes = [],
                             num_elem_sizes = [],
                             group_sizes = [],
                             lane_offsets = [],
                             lane_sizes = [],
                             dis_sizes = [],
                             rotate_sizes = [],
                             precisions = []):
    swizzle_dsl = DSLInstruction(name = "vector-two-input-swizzle", simd = False,
                                 operation = False, shuffle = True ,  semantics = two_input_swizzle_sem)



    for i in range(0, len(input_vector_sizes)):
        swizzle_dsl.add_context(
            name = "two_input_swizzle_N{}_T{}_LO{}_L{}_G{}_D{}_R{}".format(
                num_elem_sizes[i],
                precisions[i],
                lane_offsets[i],
                lane_sizes[i],
                group_sizes[i],
                dis_sizes[i],
                rotate_sizes[i]
            ),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = (num_elem_sizes[i] / lane_sizes[i])  * (2 * group_sizes[i]) * precisions[i],
            lane_size = lane_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , "SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(num_elem_sizes[i]), str(precisions[i]), str(lane_offsets[i]), str(lane_sizes[i]), str(group_sizes[i]), str(dis_sizes[i]), str(rotate_sizes[i]) ],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            lanesize_index = 5,
            in_precision_index = 3,
            out_precision_index = 3,
            cost = "",
        )

    return swizzle_dsl

