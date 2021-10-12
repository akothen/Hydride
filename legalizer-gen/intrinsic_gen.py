
#################################################################

# This generates LLVM intrinsics defintiions for Tensor DSL
# instructions.

################################################################

from dslinfo import DSLInstInfo
from legalizer_info import LegalizerInfo


class LLVMIntrinsicGenerator:
  __legalizer_info = LegalizerInfo()

  def __init__(self, legalizer_info):
    self.__legalizer_info = legalizer_info

  @classmethod
  def __gen_llvm_intrinsic(self, name, num_vectors, num_other_args):
    print("GENERATING INTRINSIC")
    #intrinsic = "llvm.tensor.intrinsic"
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
    intrinsic_name = "tensor_" + name
    intrinsic_def = "def int_" + intrinsic_name + " : Intrinsic<" \
                      + output + "," + input + "," + attr + ">;"
    print(intrinsic_def)
    return intrinsic_name


  def generate_intrinsics(self):
    '''
    generate LLVM intrinsic definitions for Intrinsics.td
    '''
    for sema in self.__legalizer_info.unique_sema_list:
      dsl_info = DSLInstInfo(sema)
      num_args = len(dsl_info.get_args())
      num_regs = len(dsl_info.get_regs())
      name = LLVMIntrinsicGenerator.__gen_llvm_intrinsic(dsl_info.get_name(), num_regs, num_args - num_regs)
      self.__legalizer_info.dsl_to_intrinsic_map[dsl_info.get_name()] = name
      print(self.__legalizer_info.dsl_to_insts_map[dsl_info.get_name()])
      self.__legalizer_info.intrinsic_to_inst_map[name] = self.__legalizer_info.dsl_to_insts_map[dsl_info.get_name()]
      return

  def get_updated_legalizer_info(self):
    '''
    return the legalize info that has been modified as a 
    result of generating intrinsics.
    '''
    return self.__legalizer_info
