from dslinfo import DSLInstInfo
from test_tensor_dsl import dsl
from legalizer_map import intrinsics



def gen_pattern_matching_checks(intrinsic_name, intrinsic_sema):
  dsl_info = DSLInstInfo(intrinsic_sema)
  args = dsl_info.get_args()
  value_ops = ""
  value_decs = "\tValue "
  for i in range(len(args)):
    value_decs += "*V_" + str(i)
    value_ops += "m_Value(V_" + str(i) + ")"
    if i != len(args) - 1:
      value_ops += ","
      value_decs += ","
  pattern = "match (I, m_Intrinsic<Intrinsic::" + intrinsic_name + ">(" + value_ops + "))"
  string = value_decs + ";\n"
  string += "\tif (" + pattern + ") {\n"
  string += "\t\tIRBuilder<> Builder(I);\n"
  string += "\t\tauto &Ctx = I->getParent()->getContext();\n"
  return string


def gen_legalizer_func():
  return f'''
void Legalize(Instruction *I)
  '''

def gen_checks_and_lowering(target_inst_name, target_inst_map, intrinsic_sema):
  dsl_info = DSLInstInfo(intrinsic_sema)
  string = ""
  conditions = list()
  print("target_inst_map[\"bitwidth\"]:")
  print(target_inst_map["bitwidth"])
  num_elems = str(int(target_inst_map["bitwidth"]) / (int(target_inst_map["in_precision"])))
  conditions.append("dyn_cast<FixedVectorType>(I->getOperand(0)->getType())->getNumElements() == " + num_elems)
  num_elems = str(int(target_inst_map["bitwidth"]) / (int(target_inst_map["out_precision"])))
  conditions.append("dyn_cast<FixedVectorType>(I->getType())->getNumElements() == " + num_elems)
  conditions.append("dyn_cast<FixedVectorType>(I->getType())->getElementType()->getIntegerBitWidth() == " + target_inst_map["out_precision"])
  conditions.append("dyn_cast<FixedVectorType>(I->getOperand(0)->getType())->getElementType()->getIntegerBitWidth() == " + target_inst_map["in_precision"])
  string += "\t\tif ("
  for index, cond in enumerate(conditions):
    string += cond
    if index != len(conditions) - 1:
      string += "\n\t\t&& "
  string += ") { \n\n"
  get_target_intrinsic_id = "GetIntrinsicID(\"" + target_inst_name + "\")"
  lowering = ""
  lowering += "\t\t\tstd::vector<Value *> Args = {"
  regs_indices = dsl_info.get_indices_of_regs()
  for index in regs_indices:
    lowering += "I->getOperand(" + str(index) + ")"
    if index != len(regs_indices) - 1:
      lowering += ", "
  lowering += "};\n"
  lowering += "\t\t\tauto *II = Builder.CreateIntrinsic(" + get_target_intrinsic_id + ", None, ArrayRef<Value *>(Args));\n"
  lowering += "\t\t\tI->replaceAllUsesWith(II);\n"
  lowering += "\t\t\tI->eraseFromParent();\n"
  lowering += "\t\t}\n"
  string += lowering
  return string



def gen_headers():
  return f'''
#include "llvm/IR/PatternMatch.h"
#include "llvm/IR/IntrinsicsX86.h"

using namespace llvm;
using namespace PatternMatch; 
  '''

def gen_inst_legalization(cpp_file):
  intrinsic_to_inst_map = intrinsics
  print(type(intrinsics))
  tensor_dsl_map =  dsl
  print("intrinsic_to_inst_map:")
  print(intrinsic_to_inst_map)
  for instrinsic_dict in intrinsic_to_inst_map:
    for intrinsic_name, instrinsic_info in instrinsic_dict.items():
      print(type(instrinsic_info))
      print("intrisnic name:")
      print(intrinsic_name)
      print("instrinsic_info:")
      print(instrinsic_info)
      print("------")
      name = intrinsic_name[7:]
      intrinsic_sema = tensor_dsl_map[name]["semantics"]
      string = gen_headers()
      string += gen_legalizer_func()
      string += "{\n"
      string += gen_pattern_matching_checks(intrinsic_name, intrinsic_sema)
      print(string)
      for target_inst_name, target_inst_info in instrinsic_info.items():
        print("target_inst_name:")
        print(target_inst_name)
        print("target_inst_info:")
        print(target_inst_info)
        string += gen_checks_and_lowering(target_inst_name, target_inst_info, intrinsic_sema)
      string += "\t}\n"
      string += "}\n"
      print(string)
      f = open(cpp_file, "w")
      f.write(string)


cpp_file = "Patterns.cpp"

if __name__ == '__main__':
  gen_inst_legalization(cpp_file)
