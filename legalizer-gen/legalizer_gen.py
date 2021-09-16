

from equivalence_checker import gen_equivalence_checker 
from gen_intrinsic import gen_intrinsic
from tensor_dsl_gen import gen_rosette_func


spec_file = "spec.rkt" 
sketch_file = "sketch.rkt"
utility_file = "utility.rkt"
racket_file = "eq_check.rkt"

sketch_func_name = "sketch"
dsl_file = "dsl.rkt"

num_vectors = 3
vector_bitwidth = 128
num_sym_ints = 0
concrete_vals = [4, 2, 32]


def gen_legalizer():
  # Perform equivalence checking
  ret = gen_equivalence_checker(racket_file, utility_file, spec_file, sketch_file, num_vectors, \
                                vector_bitwidth, num_sym_ints, concrete_vals)
  if ret == True:
    # Generate the intrinsic
    num_concrete_vals = len(concrete_vals)
    gen_intrinsic(1, num_vectors, num_sym_ints, num_concrete_vals)
    dsl_func_name = "intrinsic" + str(1)
    gen_rosette_func(dsl_file, sketch_file, sketch_func_name, dsl_func_name)



if __name__ == '__main__':
  gen_legalizer()
