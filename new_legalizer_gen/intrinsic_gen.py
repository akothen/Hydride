

from dslinfo import DSLInstInfo

def gen_intrinsic(name, num_vectors, num_other_args):
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
  if len(input_list) != 0 and num_other_args != 0:
    input_list += ","
  for i in range(num_other_args):
    input_list += int_ty
    if i != num_other_args - 1:
      input_list += ","
  input = "[" + input_list + "]"
  attr = "[IntrNoMem, IntrSpeculatable]"
  #name = "intrinsic" + str(id)
  intrinsic_def = "def int_tensor_" + name + " : Intrinsic<" \
                    + output + "," + input + "," + attr + ">;"
  print(intrinsic_def)
  return ("tensor_" + name)


def gen_intrinsics(spec_list, dsl_to_inst_map):
  dsl_to_intrinsic_map = dict()
  intrinsic_to_inst_map = dict()
  for index, spec in enumerate(spec_list):
    dsl_info = DSLInstInfo(spec)
    num_args = len(dsl_info.get_args())
    num_regs = len(dsl_info.get_regs())
    name = gen_intrinsic(dsl_info.get_name(), num_regs, num_args - num_regs)
    dsl_to_intrinsic_map[dsl_info.get_name()] = name
    print(dsl_to_inst_map[dsl_info.get_name()])
    intrinsic_to_inst_map[name] = dsl_to_inst_map[dsl_info.get_name()]
    return dsl_to_intrinsic_map, intrinsic_to_inst_map
