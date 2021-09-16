from equivalence_checker import gen_equivalence_checker 

spec_file = "spec.rkt" 
sketch_file = "sketch.rkt"
utility_file = "utility.rkt"
racket_file = "eq_check.rkt"

num_vectors = 3
vector_bitwidth = 128
num_sym_ints = 0
concrete_vals = [4, 2, 32]

def gen_intrinsic(id, num_vectors, num_sym_ints, num_concrete_vals):
  print("GENERATING INTRINSIC")
  intrinsic = "llvm.tensor.intrinsic"
  vector_ty = "llvm_anyvector_ty"
  int_ty = "llvm_anyint_ty"
  output = "[" + vector_ty + "]"
  input_list = ""
  for i in range(num_vectors):
    input_list += vector_ty
    if i != num_vectors - 1:
      input_list += ","
  for i in range(num_sym_ints):
    input_list += int_ty
    if i != num_vectors - 1:
      input_list += ","
  for i in range(num_concrete_vals):
    input_list += int_ty
    if i != num_vectors - 1:
      input_list += "],"
  input = "[" + input_list + "]"
  attr = "[IntrNoMem, IntrSpeculatable]"
  name = "intrinsic" + str(id)
  intrinsic_def = "def int_" + name + " : Intrinsic<" \
                    + output + "," + input + "," + attr + ">;"
  print(intrinsic_def)
  

def gen_legalizer():
  ret = gen_equivalence_checker(racket_file, utility_file, spec_file, sketch_file, num_vectors, \
                                vector_bitwidth, num_sym_ints, concrete_vals)
  if ret == True:
    num_concrete_vals = len(concrete_vals)
    gen_intrinsic(1, num_vectors, num_sym_ints, num_concrete_vals)



if __name__ == '__main__':
  gen_legalizer()
