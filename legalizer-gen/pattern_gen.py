

from dslinfo import DSLInstInfo
from utility import list_to_string


class PatternGen:
  @classmethod
  def __gen_inst_map_entry(self, inst_spec_map, target_inst_map, inst_name):
    dsl_info = DSLInstInfo(inst_spec_map[inst_name])
    name = "\"" + inst_name + "\""
    args = dsl_info.get_args()
    args_string = list_to_string(args)
    regs_string = "\"" + target_inst_map[inst_name]["args"] + "\""
    size_string = "\"" + target_inst_map[inst_name]["bitwidth"] + "\""
    in_precision_string = "\"" + target_inst_map[inst_name]["input_precision"] + "\""
    out_precision_string = "\"" + target_inst_map[inst_name]["output_precision"] + "\""
    semantics = dsl_info.get_semantics()
    semantics_string = "\"" + semantics + "\""
    return f'''
        "name" : {name},
        "args" : {args_string},
        "reg"  : {regs_string},
        "bitwidth" : {size_string},
        "in_precision" : {in_precision_string},
        "out_precision" : {out_precision_string},
        "semantics" : {semantics_string}, 
    '''

  @classmethod
  def __gen_intrinsic_target_inst_map_entry(self, inst_spec_map, target_inst_map, inst_list):
    string = ""
    for inst_name in inst_list:
      entry = self.__gen_inst_map_entry(inst_spec_map, target_inst_map, inst_name)
      name = "\"" + inst_name + "\""
      key = name + " : {\n"
      full_entry = key + entry + "},\n\n"
      string += full_entry
    string += "},"
    return string


  def gen_intrinsic_target_inst_map(legalizer_info, target_inst_map, legalizer_file):
    string = "\n\nintrinsics = {\n"
    for intrisic_name, inst_list in legalizer_info.intrinsic_to_inst_map.items():
      name = "\n\"" + intrisic_name +  "\""
      key = name + " : {\n"
      entry = PatternGen.__gen_intrinsic_target_inst_map_entry(legalizer_info.inst_to_sema_map, target_inst_map, inst_list)
      full_entry = key + entry + "\n},\n\n"
      string += full_entry
    f = open(legalizer_file, "w")
    f.write(string)

