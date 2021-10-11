
from utility import ext_utility_funcs, find_between


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
    size = list()#int(in_precision)
    for bound in loop_bounds:
      size.append(bound)
    return size

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
    for index, line in enumerate(inst_sema_lines):
      new_form += (line)
      if index != len(inst_sema_lines) - 1:
        new_form += "\n"
    new_form = "{ \\\n" + new_form + "}"
    return new_form

  def get_indices_of_regs(self):
    args_array = self.get_args()
    regs_indices = list()
    for index, arg in enumerate(args_array):
      if "vreg" in arg or "sreg" in arg or "treg" in arg:
        regs_indices.append(index)
    print("regs indices:")
    print(regs_indices)
    return regs_indices
