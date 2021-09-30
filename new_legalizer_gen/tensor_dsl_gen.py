
from dslinfo import DSLInstInfo
from utility import list_to_string

def gen_dict_entry(dsl_info):
  inst_name = dsl_info.get_name()
  name = "\"" + inst_name + "\""
  args = dsl_info.get_args()
  args_string = list_to_string(args)
  regs = dsl_info.get_regs()
  regs_string = list_to_string(regs)
  size = dsl_info.get_reg_size()
  size_string = list_to_string(size) #"\"" + size + "\""
  in_precision = dsl_info.get_in_precision()
  in_precision_string = "\"" + in_precision + "\""
  out_precision = dsl_info.get_out_precision()
  out_precision_string = "\"" + out_precision + "\""
  semantics = dsl_info.get_semantics()
  semantics_string = "\"" + semantics + "\""
  return f'''
    "name" : {name},
    "args" : {args_string},
    "reg"  : {regs_string},
    "size" : {size_string},
    "in_precision" : {in_precision_string},
    "out_precision" : {out_precision_string},
    "semantics" : {semantics_string}, 
 '''

def gen_tensor_dsl_dict(spec_list, dsl_file):
  string = "\n\ndsl = {\n"
  for spec in spec_list:
    print("+++++++++++++++++++++++++++++++")
    print(spec)
    dsl_info = DSLInstInfo(spec)
    inst_name = dsl_info.get_name()
    name = "\"" + inst_name + "\""
    key = name + " : {\n"
    entry = gen_dict_entry(dsl_info)
    full_entry = key + entry + "},\n\n"
    string += full_entry
  string += "}"
  f = open(dsl_file, "w")
  f.write(string)



# Just for testing
from x86_sema import x86_sema

if __name__ == '__main__':
  spec_list = list()
  for inst, instinfo in x86_sema.items():
    print("+++++++++++++++++++++++++++++++")
    print(instinfo['semantics'])
    spec_list.append(instinfo['semantics'])
  gen_tensor_dsl_dict(spec_list, "test_tensor_dsl.py")


