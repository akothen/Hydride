
ext_utility_funcs = [
  "ext-bv", "sign-ext-bv", "zero-ext-bv", 
  "low-ext-bv", "sign-low-ext-bv", "zero-low-ext-bv"
]


# This class helps extract information about a given instruction
# based on the given semantics.
class DSLInstInfo:
  def __init__(self, semantics):
    self.semantics = semantics
    print(semantics)
  
  def get_name(self):
    inst_sema_lines = self.semantics.split("\n")
    name = None
    for line in inst_sema_lines:
      line = line.strip()
      if "define" in line:
        name = find_between(line, "define (", " ")
        print("name")
        print(name)
        break
    return name[0].strip()
  
  def get_args(self):
    name = self.get_name()
    inst_sema_lines = self.semantics.split("\n")
    args_array = list()
    for line in inst_sema_lines:
      if name in line:
        args_array = find_between(line, name, ")")
        break
    print("args_array:")
    print(args_array)
    args = args_array[0].strip()
    args = args[1:]
    args_list = args.split(" ")
    print("args_list:")
    print(args_list)
    return args_list
  
  def get_regs(self):
    args_array = self.get_args()
    regs = list()
    for arg in args_array:
      if "vreg" in arg or "sreg" in arg or "treg" in arg:
        regs.append(arg)
    print("regs:")
    print(regs)
    return regs

  def get_loop_bounds(self):
    inst_sema_lines = self.semantics.split("\n")
    loop_bounds = list()
    for line in inst_sema_lines:
      line = line.strip()
      if "for/list" in line:
        bound_array = find_between(line, "range", ")")
        print("bound_array:")
        print(bound_array)
        assert(len(bound_array) == 1)
        bound = bound_array[0].strip()
        loop_bounds.append(bound)
    print("loop bound:")
    print(loop_bounds)
    return loop_bounds
  
  def get_reg_size(self):
    loop_bounds = self.get_loop_bounds()
    in_precision = self.get_in_precision()
    size = int(in_precision)
    for bound in loop_bounds:
      size *= int(bound)
    return str(size)

  def get_in_precision(self):
    inst_sema_lines = self.semantics.split("\n")
    precision = None
    for line in inst_sema_lines:
      line = line.strip()
      for op in ext_utility_funcs:
        if op in line:
          string = find_between(line, op, ") (")
          print("string:")
          print(string)
          assert(len(string) == 1)
          string_array = string[0].strip().split(" ")
          precision = string_array[len(string_array) - 2]
          return precision.strip()
    return precision

  def get_out_precision(self):
    inst_sema_lines = self.semantics.split("\n")
    precision = None
    for line in inst_sema_lines:
      line = line.strip()
      for op in ext_utility_funcs:
        if op in line:
          if precision == None:
            string = find_between(line, op, ") (")
            print("string:")
            print(string)
            assert(len(string) == 1)
            string_array = string[0].strip().split(" ")
            precision = string_array[len(string_array) - 1].strip()
            print("out_precision:")
            print(precision)
          else:
            # This means we need to change the precision
            string = find_between(line, op, ")")
            print("semantics")
            print(self.semantics)
            print("string:")
            print(string)
            assert(len(string) == 1)
            string_array = string[0].strip().split(" ")
            precision = string_array[len(string_array) - 1].strip()
            print("--out_precision:")
            print(precision)
          break
    return precision

  def get_semantics(self):
    inst_sema_lines = self.semantics.split("\n")
    new_form = ""
    for line in inst_sema_lines:
      new_form += ((line + "\\n \\\n"))
    return new_form
  


def find_between(s, first, last):
  find_bw_array = list()
  # Split the string 
  s_array = s.split(first)
  print("s_array:")
  print(s_array)
  print(len(s_array))
  for string in s_array:
    string = first + string
    print("string:")
    print(string)
    if string not in s:
      continue
    start = string.index(first) + len(first)
    print("start:")
    print(start)
    try:
      end = string.index(last, start)
    except ValueError:
      continue
    print("end:")
    print(end)
    ret = string[start:end]
    print("ret:")
    print(ret)
    if ret == '':
      continue
    if ret not in find_bw_array:
      find_bw_array.append(ret)
  return find_bw_array


def list_to_string(lst):
  string = "\""
  for index, item in enumerate(lst):
    string += item
    if index != len(lst) - 1:
      string += ","
  string += "\""
  return string


def gen_dict_entry(dsl_info):
  inst_name = dsl_info.get_name()
  name = "\"" + inst_name + "\""
  args = dsl_info.get_args()
  args_string = list_to_string(args)
  regs = dsl_info.get_regs()
  regs_string = list_to_string(regs)
  size = dsl_info.get_reg_size()
  size_string = "\"" + size + "\""
  in_precision = dsl_info.get_in_precision()
  in_precision_string = "\"" + in_precision + "\""
  out_precision = dsl_info.get_out_precision()
  out_precision_string = "\"" + out_precision + "\""
  semantics = dsl_info.get_semantics()
  return f'''
    "name" : {name},
    "args" : {args_string},
    "reg"  : {regs_string},
    "size" : {size_string},
    "in_precision" : {in_precision_string},
    "out_precision" : {out_precision_string},
    "semantics" : {semantics}, 
 '''

def gen_tensor_dsl_dict(spec_list, dsl_file):
  string = "\n\ndsl = {\n"
  for spec in spec_list:
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
    spec_list.append(instinfo['semantics'])
  gen_tensor_dsl_dict(spec_list, "test_tensor_dsl.py")
