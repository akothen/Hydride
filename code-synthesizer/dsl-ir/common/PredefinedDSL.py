from common.Types import *
from common.Instructions import *


vector_load_sem =  [

    "(define (scalar-load mem mem_size index type_size)",
    "(define total_num_elems (/ mem_size type_size))",
    "(define result",
    "(ext-bv mem (- (- total_num_elems  1) index) type_size))",
    "result",
    ")",
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
                    offsets[i], str(num_elem_sizes[i]), str(precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 1,
            out_lanesize_index = 1,
            in_precision_index = 4,
            out_precision_index = 4,
            cost = "2",
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
            out_vectsize = precisions[i] * max(1, num_elem_sizes[i] // lane_sizes[i]) * ((2 * group_sizes[i]) + lane_offsets[i]),
            lane_size = lane_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , "SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(num_elem_sizes[i]), str(precisions[i]), str(lane_offsets[i]), str(lane_sizes[i]), str(group_sizes[i]), str(dis_sizes[i]), str(rotate_sizes[i]) ],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 5,
            out_lanesize_index = 5,
            in_precision_index = 3,
            out_precision_index = 3,
            cost = "4",
        )

    return swizzle_dsl



interleave_two_vectors_sema = [
    "(define (interleave-vectors v1 v2 size prec)",
    "(define num-elems (/ size prec))",
    "(apply concat",
    "(for/list ([i (reverse (range num-elems))])",
    "(define low (* prec i))",
    "(define high (+ low (- prec 1)))",
    "(define v1-extract (extract high low v1))",
    "(define v2-extract (extract high low v2))",
    "(concat v1-extract v2-extract)",
    ")",
    ")",
    ")"
]


def create_interleave_two_dsl(input_vector_sizes = [],
                              precisions = []):
    vec_interleave_two_dsl = DSLInstruction(name = "interleave-vectors", simd = False,
                                            operation = False, semantics = interleave_two_vectors_sema)


    for i in range(0, len(input_vector_sizes)):
        vec_interleave_two_dsl.add_context(
            name = "interleave-vectors-{}-{}".format(input_vector_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = input_vector_sizes[i] * 2,
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]),"SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(input_vector_sizes[i]),
                    str(precisions[i])],
            in_vectsize_index = 2,
            out_vectsize_index = 2,
            in_lanesize_index = 2,
            out_lanesize_index = 2,
            in_precision_index = 3,
            out_precision_index = 3,
            cost = "4", # switching with one from 4
        )

    return vec_interleave_two_dsl


interleave_vector_sema = [
    " (define (interleave-vector v1 size prec) ",
    "   (define num-elems (/ size prec)) ",
    "   (define base (/ num-elems 2)) ",
    "   (apply concat ",
    "          (for/list ([i (range num-elems)]) ",
    "                    (define offset-index ",
    "                      (cond  ",
    "                        [(eq? (modulo i 2) 0) (/ i 2)] ",
    "                        [else (+ base (- (/ (+ i 1) 2) 1))] ",
    "                        ) ",
    "                      ) ",
    "                    (define random-index (- num-elems 1 offset-index)) ",
    "                    (define low-index (* random-index prec)) ",
    "                    (define high-index (+ low-index (- prec 1))) ",
    "                    (extract high-index low-index v1) ",
    "                    ) ",
    "          ) ",
    "   ) "
]


def create_interleave_dsl(input_vector_sizes = [],
                          precisions = []):
    vec_interleave_dsl = DSLInstruction(name = "interleave-vector", simd = False,
                                        operation = False, semantics = interleave_vector_sema)


    for i in range(0, len(input_vector_sizes)):
        vec_interleave_dsl.add_context(
            name = "interleave-vector-{}-{}".format(input_vector_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = input_vector_sizes[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(input_vector_sizes[i]),
                    str(precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 1,
            out_lanesize_index = 1,
            in_precision_index = 2,
            out_precision_index = 2,
            cost = "3",
        )

    return vec_interleave_dsl


deinterleave_vector_sema = [
    " (define (deinterleave-vector v1 size prec) ",
    "   (define num-elems (/ size prec)) ",
    "   (define base (/ num-elems 2)) ",
    "   (apply concat ",
    "          (for/list ([i (range num-elems)]) ",
    "                    (define offset-index ",
    "                      (cond  ",
    "                        [(< i base) (* i 2)] ",
    "                        [else (- (* (+ (- i base) 1) 2) 1)] ",
    "                        ) ",
    "                      ) ",
    "                    (define random-index (- num-elems 1 offset-index)) ",
    "                    (define low-index (* random-index prec)) ",
    "                    (define high-index (+ low-index (- prec 1))) ",
    "                    (extract high-index low-index v1) ",
    "                    ) ",
    "          ) ",
    "  ",
    "   ) "
]



def create_deinterleave_dsl(input_vector_sizes = [],
                            precisions = []):
    vec_deinterleave_dsl = DSLInstruction(name = "deinterleave-vector", simd = False,
                                          operation = False, semantics = deinterleave_vector_sema)


    for i in range(0, len(input_vector_sizes)):
        vec_deinterleave_dsl.add_context(
            name = "deinterleave-vector-{}-{}".format(input_vector_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = input_vector_sizes[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(input_vector_sizes[i]),
                    str(precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 1,
            out_lanesize_index = 1,
            in_precision_index = 2,
            out_precision_index = 2,
            cost = "3",
        )

    return vec_deinterleave_dsl

llvm_shufflevector_sema = [
    " (define (llvm:shuffle-vectors  v1 v2 len prec  permute-mask mask-len) ",
    "   (define result ",
    "     (apply  ",
    "       concat  ",
    "       (for/list ([i  (range mask-len)]) ",
    "                 ;; Get mask index at index i ",
    "                 (define index-from-right (- mask-len 1 i)) ",
    "                 (define mask-low (* index-from-right 32)) ",
    "                 (define mask-high (+ mask-low 31)) ",
    "                 (define mask-idx-bv (extract mask-high mask-low permute-mask)) ",
    "  ",
    "                 (define mask-idx-val (bitvector->integer mask-idx-bv)) ",
    "  ",
    "                 ;; Identify whether to index into v1 or v2 ",
    "                 (define-values (vec adjusted-idx) ",
    "                                (if (>= mask-idx-val  len) ",
    "  ",
    "                                  ;; Index into v2 ",
    "                                  (values v2 (- mask-idx-val len)) ",
    "  ",
    "  ",
    "                                  ;; Index into v1 ",
    "                                  (values v1 mask-idx-val) ",
    "                                  ) ",
    "                                ) ",
    "  ",
    "  ",
    "                 (define vec-index-from-right (- len 1 adjusted-idx)) ",
    "                 (define vec-low (* vec-index-from-right prec)) ",
    "                 (define vec-high (+ vec-low (- prec 1))) ",
    "                 (extract vec-high vec-low vec) ",
    "                 ) ",
    "       ) ",
    "     ) ",
    "   result ",
    "   ) "
]


def create_llvm_shufflevector_dsl(input_vector_sizes = [],
                                  precisions = [],
                                  mask_sizes = []
                                  ):
    vec_llvm_shuffle_dsl = DSLInstruction(name = "llvm_shuffle_vectors", simd = False,
                                          operation = False, semantics = llvm_shufflevector_sema)


    for i in range(0, len(input_vector_sizes)):
        vec_llvm_shuffle_dsl.add_context(
            name = "shuffle-vector-{}-{}-{}".format(input_vector_sizes[i], precisions[i], mask_sizes[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = (mask_sizes[i]/32) * precisions[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]),  "SYMBOLIC_BV_{}".format(input_vector_sizes[i]), str(input_vector_sizes[i]// precisions[i]),
                    str(precisions[i]), "SYMBOLIC_BV_{}".format(mask_sizes[i]), str(mask_sizes[i] // 32 )],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 1,
            out_lanesize_index = 1,
            in_precision_index = 3,
            out_precision_index = 3,
            cost = "5",
        )

    return vec_llvm_shuffle_dsl

# Placeholder instruction definition to faciliate other classes
# emitting racket code for interpreter
dummy_vector_load_dsl = create_vector_load_dsl(
    input_vector_sizes = [64],
    offsets = [0],
    num_elem_sizes = [4],
    precisions = [8]
)

rotate_vector_sema = [

"(define (rotate-vector v1 num-rotate size prec)",
  "(define rotate-bits (* num-rotate prec))",
  "(bvrol v1 (integer->bitvector rotate-bits (bitvector (* size prec))))",
  ")",
]


def create_rotate_dsl(input_vector_sizes = [],
                            precisions = [],
                            rotate_num = []
                      ):
    rotate_dsl = DSLInstruction(name = "rotate-vector", simd = False,
                                          operation = False, semantics = rotate_vector_sema)


    for i in range(0, len(input_vector_sizes)):
        rotate_dsl.add_context(
            name = "rotate-vector-{}-{}-{}".format(rotate_num[i],input_vector_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize = input_vector_sizes[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "False",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]) , str(roate_num[i]) , str(input_vector_sizes[i]),
                    str(precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 1,
            in_lanesize_index = 1,
            out_lanesize_index = 1,
            in_precision_index = 2,
            out_precision_index = 2,
            cost = "2",
        )

    return vec_deinterleave_dsl


llvm_vect_simd_template_sema = [
"(define (llvm-vect-{} a b num_elems precision)",
"  (define dst ",
"    (apply",
"      concat",
"      (for/list ([%it (reverse (range 0 num_elems 1))])",
"        (define %low (* precision %it))",
"        (define %high (%low (- precision 1)))",
"        (define %exta (extract  %high %low a))",
"        (define %extb (extract  %high %low b))",
"        ({} %exta %extb)",
"      )",
"    )",
"  )",
"  dst",
")"
]

def bind_llvm_simd_template(op_name, bv_op):
    template = llvm_vect_simd_template_sema.copy()
    template[0] = template[0].format(op_name)
    template[9] = template[9].format(bv_op)

    return template




def create_llvm_vect_simd_dsl(op_name , bv_op , input_vector_sizes = [],
                                  precisions = []
                                  ):

    vec_llvm_simd_dsl = DSLInstruction(name = "llvm-vect-{}".format(op_name), simd = True,
                                          operation = True, semantics = bind_llvm_simd_template(op_name, bv_op))


    for i in range(0, len(input_vector_sizes)):
        vec_llvm_simd_dsl.add_context(
            name = "llvm-vect-{}-{}-{}".format(op_name,input_vector_sizes[i], precisions[i]),
            in_vectsize = input_vector_sizes[i],
            out_vectsize =  input_vector_sizes[i],
            lane_size = input_vector_sizes[i],
            in_precision = precisions[i],
            out_precision = precisions[i],
            SIMD = "True",
            args = ["SYMBOLIC_BV_{}".format(input_vector_sizes[i]),  "SYMBOLIC_BV_{}".format(input_vector_sizes[i]), str(input_vector_sizes[i] // precisions[i]), str(precisions[i]) ],
            in_vectsize_index = None,
            out_vectsize_index = None,
            in_lanesize_index = None,
            out_lanesize_index = None,
            in_precision_index = 3,
            out_precision_index = 3,
            cost = "2",
        )

    return vec_llvm_simd_dsl




zext_scalar_sema = [
    "(define (scalar-zext a input-size output-size)",
    "(zero-extend a (bitvector output-size))",
    ")"
]


def create_llvm_scalar_zext_dsl(
                                  input_precisions = [],
                                  output_precisions = []
                                  ):

    scalar_llvm_zext_dsl = DSLInstruction(name = "llvm-zext", simd = True,
                                          operation = True, semantics = zext_scalar_sema)


    for i in range(0, len(input_precisions)):
        scalar_llvm_zext_dsl.add_context(
            name = "llvm-zext-{}-{}".format(input_precisions[i], output_precisions[i]),
            in_vectsize = input_precisions[i],
            out_vectsize =  output_precisions[i],
            lane_size = input_precisions[i],
            in_precision = input_precisions[i],
            out_precision = output_precisions[i],
            SIMD = "True",
            args = ["SYMBOLIC_BV_{}".format(input_precisions[i]), str(input_precisions[i]), str(output_precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 2,
            in_lanesize_index = 1,
            out_lanesize_index = 2,
            in_precision_index = 1,
            out_precision_index = 2,
            cost = "1",
        )

    return  scalar_llvm_zext_dsl


dummy_scalar_zext = create_llvm_scalar_zext_dsl(input_precisions = [8, 16] , output_precisions = [32, 32])



splat_scalar_to_word_sema = [
    "(define (scalar_splat a input-size output-size)",
    "(apply concat (for/list ([i (range (/ output-size input-size))])   a))"
    ")"
]


def create_llvm_scalar_splat_dsl(
                                  input_precisions = [],
                                  output_precisions = []
                                  ):

    scalar_llvm_splat_dsl = DSLInstruction(name = "scalar_splat", simd = True,
                                          operation = True, semantics = zext_scalar_sema)


    for i in range(0, len(input_precisions)):
        scalar_llvm_splat_dsl.add_context(
            name = "llvm-splat-{}-{}".format(input_precisions[i], output_precisions[i]),
            in_vectsize = input_precisions[i],
            out_vectsize =  output_precisions[i],
            lane_size = input_precisions[i],
            in_precision = input_precisions[i],
            out_precision = output_precisions[i],
            SIMD = "True",
            args = ["SYMBOLIC_BV_{}".format(input_precisions[i]), str(input_precisions[i]), str(output_precisions[i])],
            in_vectsize_index = 1,
            out_vectsize_index = 2,
            in_lanesize_index = 1,
            out_lanesize_index = 2,
            in_precision_index = 1,
            out_precision_index = 2,
            cost = "1",
        )

    return  scalar_llvm_splat_dsl


dummy_scalar_splat= create_llvm_scalar_splat_dsl(input_precisions = [8, 16] , output_precisions = [32, 32])

# Place holder DSL object definitions to enable generating
# the Hydride symbolic interpreter
dummy_vector_swizzle_dsl = create_two_input_swizzle(
    input_vector_sizes = [64],
    num_elem_sizes = [6],
    group_sizes = [3],
    lane_offsets = [0],
    lane_sizes = [3],
    dis_sizes = [1],
    rotate_sizes = [0],
    precisions = [8]
)


dummy_vector_two_interleave_dsl = create_interleave_two_dsl(
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_interleave_dsl = create_interleave_dsl(
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_deinterleave_dsl = create_deinterleave_dsl(
    input_vector_sizes = [128],
    precisions = [16]
)

dummy_llvm_shuffle_dsl = create_llvm_shufflevector_dsl(
    input_vector_sizes = [128],
    precisions = [16],
    mask_sizes = [32*4]
)


dummy_vector_add_dsl = create_llvm_vect_simd_dsl(
    "add",
    "bvadd",
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_sub_dsl = create_llvm_vect_simd_dsl(
    "sub",
    "bvsub",
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_mul_dsl = create_llvm_vect_simd_dsl(
    "mul",
    "bvmul",
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_sdiv_dsl = create_llvm_vect_simd_dsl(
    "sdiv",
    "bvsdiv",
    input_vector_sizes = [128],
    precisions = [16]
)


dummy_vector_udiv_dsl = create_llvm_vect_simd_dsl(
    "udiv",
    "bvudiv",
    input_vector_sizes = [128],
    precisions = [16]
)

default_structs = [
    #dummy_vector_load_dsl,
    dummy_vector_swizzle_dsl,
    dummy_vector_two_interleave_dsl,
    dummy_vector_interleave_dsl,
    dummy_vector_deinterleave_dsl,
    dummy_llvm_shuffle_dsl,
    dummy_vector_add_dsl,
    dummy_vector_sub_dsl,
    dummy_vector_mul_dsl,
    dummy_vector_sdiv_dsl,
    dummy_vector_udiv_dsl,
    dummy_scalar_zext,
    dummy_scalar_splat,
]

llvm_simd_structs =[
    dummy_vector_add_dsl,
    dummy_vector_sub_dsl,
    dummy_vector_mul_dsl,
    dummy_vector_sdiv_dsl,
    dummy_vector_udiv_dsl
]
