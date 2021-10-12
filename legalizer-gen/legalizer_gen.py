
#################################################################

# This file helps generate Tensor DSL, LLVM tensor intrinsics,
# and legalization code.

################################################################


from legalizer_info import LegalizerInfo
from equivalence_checker import EquivalenceChecker
from intrinsic_gen import LLVMIntrinsicGenerator
from tensor_dsl_gen import TensorDSLGen
from pattern_gen import PatternGen

from x86_sema import x86_sema

#utility_file = "utility.rkt"
tensor_dsl_file = "test_tensor_dsl.py"
legalizer_file = "legalizer_map.py"

# List of targets for which we want to generate
# legalization info
target_sema_list = [x86_sema]


def gen_legalizer():
  # Instantiate the legalizer info
  legalizer_info = LegalizerInfo()

  # Perform equivalence checking
  eq_checker = EquivalenceChecker(target_sema_list, legalizer_info)
  eq_checker.perform_equivalence_checking()
  legalizer_info = eq_checker.get_updated_legalizer_info()

  # Generate the tensor intrinsic for LLVM
  intrinsic_generator = LLVMIntrinsicGenerator(legalizer_info)
  intrinsic_generator.generate_intrinsics()
  legalizer_info = intrinsic_generator.get_updated_legalizer_info()

  # Generate the tensor DSL
  TensorDSLGen.gen_tensor_dsl_dict(legalizer_info, tensor_dsl_file)

  # Merge the semantics dictionaries for different targets into one
  target_sema_map = {}
  for dict in target_sema_list:
    target_sema_map = target_sema_map | dict

  # Generate a visual map of target-agnostic inst --> target-specific inst
  PatternGen.gen_intrinsic_target_inst_map(legalizer_info, target_sema_map, legalizer_file)




if __name__ == '__main__':
  gen_legalizer()

