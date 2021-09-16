
def gen_intrinsic(id, num_vectors, num_sym_ints, num_concrete_vals):
  print("GENERATING INTRINSIC")
  intrinsic = "llvm.tensor.intrinsic"
  vector_ty = "llvm_anyvector_ty"
  int_ty = "llvm_anyint_ty"
  output = "[" + vector_ty + "]"
  input_list = ""
  num_ints = num_sym_ints + num_concrete_vals
  for i in range(num_vectors):
    input_list += vector_ty
    if i != num_vectors - 1:
      input_list += ","
  if len(input_list) != 0 and num_ints != 0:
    input_list += ","
  for i in range(num_ints):
    input_list += int_ty
    if i != num_ints - 1:
      input_list += ","
  input = "[" + input_list + "]"
  attr = "[IntrNoMem, IntrSpeculatable]"
  name = "intrinsic" + str(id)
  intrinsic_def = "def int_tensor_" + name + " : Intrinsic<" \
                    + output + "," + input + "," + attr + ">;"
  print(intrinsic_def)
  
