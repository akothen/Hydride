

from equivalence_checker import gen_equivalence_checker 
from intrinsic_gen import gen_intrinsics
from tensor_dsl_gen import gen_tensor_dsl_dict
from pattern_gen import gen_intrinsic_target_inst_map

from x86_sema import x86_sema

utility_file = "utility.rkt"
tensor_dsl_file = "test_tensor_dsl.py"
legalizer_file = "legalizer_map.py"


def gen_legalizer():
  # Perform equivalence checking
  eq_inst_list, inst_spec_map, dsl_to_inst_map = gen_equivalence_checker(x86_sema, utility_file)

  # Generate the tensor DSL
  gen_tensor_dsl_dict(eq_inst_list, tensor_dsl_file)

  # Generate the tensor intrinsic for LLVM
  dsl_to_intrinsic_map, intrinsic_to_inst_map = gen_intrinsics(eq_inst_list, dsl_to_inst_map)

  # Generate a visual map of target-agnostic inst --> target-specific inst
  gen_intrinsic_target_inst_map(intrinsic_to_inst_map, inst_spec_map, x86_sema, legalizer_file)



if __name__ == '__main__':
  gen_legalizer()
