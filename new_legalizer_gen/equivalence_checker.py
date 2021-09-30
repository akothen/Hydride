

import os


# This file assumes that there is a spec file and there is a sketch file.
# This file will generate a synthesis file automatically.
racket_file = "eq_checker.rkt"
utility_file = "utility.rkt"


def print_to_file(text, filename):
  f = open(filename, "w")
  f.write(text)
  f.close()


def gen_headers():
  string = '''
  #lang rosette
 (require rosette/lib/synthax)
 (require rosette/lib/angelic)
 (require racket/pretty)
 
 '''
  return string


def gen_symbolic_bitvectors(num_symbols, bitwidth):
  string = ""
  sym_bv_list = []
  for i in range(num_symbols):
    print(type(i))
    sym_bv_name = "symbv" + str(i)
    string += "(define-symbolic " + sym_bv_name + " (bitvector " + str(bitwidth) + "))\n"
    sym_bv_list.append(sym_bv_name)
  return string, sym_bv_list


def gen_symbolic_integers(num_symbols):
  string = ""
  sym_int_list = []
  for i in range(num_symbols):
    print(type(i))
    sym_int_name = "symint" + str(i)
    string += "(define-symbolic " + sym_int_name + " integer?)\n"
    sym_int_list.append(sym_int_name)
  return string, sym_int_list


def gen_integer_definitions(int_vals):
  string = ""
  conc_int_list = []
  for i, val in enumerate(int_vals):
    print(type(i))
    conc_int_name = "concint" + str(i)
    string += "(define " + conc_int_name + " " + str(val) + " )\n"
    conc_int_list.append(conc_int_name)
  return string, conc_int_list


def gen_synthesis_code(symbolic_inputs, spec_name, spec_args, sketch_name, sketch_args):
  print("symbolic_inputs:")
  print(symbolic_inputs)
  forall_list = " ".join(symbol for symbol in symbolic_inputs)
  spec_args_list = " ".join(arg for arg in spec_args)
  sketch_args_list = " ".join(arg for arg in sketch_args)
  return f'''
  (time (synthesize
  #:forall (list {forall_list})
  #:guarantee (assert (equal? ({spec_name} {spec_args_list}) ({sketch_name} {sketch_args_list})))))
  '''


def sema_are_equivalent(racket_file):
  output_file = "output.txt"
  os.system("racket " + racket_file + " >> " + output_file)
  f = open(output_file, "r")
  for x in f:
    if "model" in x:
      #os.system("rm " + output_file)
      return True
    if "unsat" in x:
      #os.system("rm " + output_file)
      return False
  #os.system("rm " + output_file)
  return False



def gen_racket_file(utility_file, spec, sketch, num_vectors, vector_bitwidth, num_ints, sketch_concrete_vals, concrete_vals):
  print("utility_file:")
  print(utility_file)
  print("spec:")
  print(spec)
  print("sketch:")
  print(sketch)
  print("num_vectors:")
  print(num_vectors)
  print("vector_bitwidth:")
  print(vector_bitwidth)
  print("num_ints:")
  print(num_ints)
  print("concrete_vals:")
  print(concrete_vals)
  text = gen_headers()
  f = open(utility_file, "r")
  for x in f:
    text += x
  text += ("\n\n" + spec + "\n\n")
  text += ("\n\n" + sketch + "\n\n")
  symbv_defs, symbvs = gen_symbolic_bitvectors(num_vectors, vector_bitwidth)
  print("symbvs:")
  print(symbvs)
  text += symbv_defs
  concint_defs, concints = gen_integer_definitions(concrete_vals)
  text += concint_defs
  print("symbvs:")
  print(symbvs)
  symint_defs, symints = gen_symbolic_integers(num_ints)
  print(symint_defs)
  text += symint_defs
  print("symbvs:")
  print(symbvs)
  symbolic_inputs = symbvs
  spec_args = []
  for symbol in symbvs:
    spec_args.append(symbol)
  for integer in concints:
    spec_args.append(integer)
  print("spec_args:")
  print(spec_args)
  print("--symbolic_inputs:")
  print(symbolic_inputs)
  concint_defs, concints = gen_integer_definitions(sketch_concrete_vals)
  sketch_args = []
  for symbol in symbvs:
    sketch_args.append(symbol)
  for integer in concints:
    sketch_args.append(integer)
  for symbol in symints:
    sketch_args.append(symbol)
  text += gen_synthesis_code(symbolic_inputs, "spec", spec_args, "sketch", sketch_args)
  print_to_file(text, racket_file)


def num_inst_args(args):
  args_list = args.split(",")
  return len(args_list)


def get_num_reg_args(args):
  args_list = args.split(",")
  num_vectors = 0
  num_scalars = 0
  num_tiles = 0
  for arg in args_list:
    if "vreg" in arg:
      num_vectors += 1
    if "sreg" in arg:
      num_scalars += 1
    if "treg" in arg:
      num_tiles += 1
  return [num_scalars, num_vectors, num_tiles]


ext_utility_funcs = [
  "ext-bv", "sign-ext-bv", "zero-ext-bv", 
  "low-ext-bv", "sign-low-ext-bv", "zero-low-ext-bv"
]


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


def gen_sketch(name, inst_sema):
  inst_sema_lines = inst_sema.split("\n")
  induction_var = list()
  symbolic_var = list()
  concrete_val = list()
  sketch_lines = list()
  var_to_val_map = dict()
  first_line = ""
  for index, line in enumerate(inst_sema_lines):
    line = line.strip()
    if line == "{" or line == "}":
      continue
    print("line:")
    print(line)
    if index == 1 and "define" in line:
      assert(name in line)
      line = line.replace(name, "sketch")
      first_line = line
      sketch_lines.append(line)
      print("first line:")
      print(first_line)
      continue
    if "for/list" in line:
      var_array = find_between(line, "[", " ")
      print("var_array:")
      print(var_array)
      assert(len(var_array) == 1)
      var = var_array[0].strip()
      induction_var.append(var)
      bound_array = find_between(line, "range", ")")
      print("bound_array:")
      print(bound_array)
      assert(len(bound_array) == 1)
      bound = bound_array[0].strip()
      bound_arg =  "conc_" + var + "_bound"
      print("old line:")
      print(line)
      assert(bound in line)
      line = line.replace(bound, bound_arg)
      assert(bound_arg in line)
      print("new line:")
      print(line)
      print("bound:")
      print(bound)
      print(type(bound))
      print("bound_arg:")
      print(bound_arg)
      print(type(bound_arg))
      if bound_arg not in concrete_val:
        concrete_val.append(bound_arg)
      sketch_lines.append(line)
      continue
    for var in induction_var:
      if var in line:
        print("line:")
        print(line)
        print("induction_var:")
        print(induction_var)
        constant_array = find_between(line, var, ")")
        print("--constant array:")
        print(constant_array)
        for constant in constant_array:
          constant = constant.strip()
          try:
            int_constant = int(constant)
          except:
            continue
          sym_var = ("?" + var)
          if var_to_val_map.get(sym_var) == None:
             var_to_val_map[sym_var] = constant
          else:
            old_constant = var_to_val_map.get(sym_var)
            if old_constant != constant:
              sym_var = ("?" + sym_var)
              var_to_val_map[sym_var] = constant
          line = line.replace(var + " " + constant + ")", var + " " + sym_var + ")")
          if sym_var not in symbolic_var:
            symbolic_var.append(sym_var)
    sketch_lines.append(line)
  first_line = modify_func_sig(first_line, concrete_val, [])
  sketch_lines[0] = first_line

  # Add the symbolic variables' definitions
  new_sketch_lines = []
  for index, line in enumerate(sketch_lines):
    if index == 1:
      for sym in symbolic_var:
        new_sketch_lines.append("(define-symbolic " + sym + " integer?) ")
    new_sketch_lines.append(line)

  return new_sketch_lines, symbolic_var, concrete_val


def get_spec_features(name, inst_sema):
  inst_sema_lines = inst_sema.split("\n")
  induction_var = list()
  concrete_val = list()
  concrete_var = list()
  sketch_lines = list()
  var_to_val_map = dict()
  first_line = ""
  for index, line in enumerate(inst_sema_lines): 
    line = line.strip()
    if line == "{" or line == "}":
      continue
    print("line:")
    print(line)
    if index == 1 and "define" in line:
      assert(name in line)
      line = line.replace(name, "spec")
      first_line = line
      sketch_lines.append(line)
      print("first_line:")
      print(first_line)
      continue
    if "for/list" in line:
      var_array = find_between(line, "[", " ")
      print("var_array:")
      print(var_array)
      assert(len(var_array) == 1)
      var = var_array[0]
      bound_array = find_between(line, "range", ")")
      assert(len(bound_array) == 1)
      bound = bound_array[0].strip()
      bound_arg =  "conc_" + var + "_bound"
      line = line.replace(bound, bound_arg)
      if bound not in concrete_val:
        concrete_val.append(bound)
      if bound_arg not in concrete_var:
        concrete_var.append(bound_arg)
      induction_var.append(var)
      sketch_lines.append(line)
      continue
    for var in induction_var:
      if var in line:
        print("induction_var:")
        print(induction_var)
        constant_array = find_between(line, var, ")")
        print("--constant array:")
        print(constant_array)
        for constant in constant_array:
          constant = constant.strip()
          try:
            int_constant = int(constant)
          except:
            continue
          conc_var = "conc_" + var + "_index"
          if var_to_val_map.get(conc_var) == None:
            var_to_val_map[conc_var] = constant
          else:
            old_constant = var_to_val_map.get(conc_var)
            if old_constant != constant:
              conc_var = (conc_var + "_var")
              var_to_val_map[conc_var] = constant
          print("old line:")
          print(line)
          line = line.replace(var + " " + constant + ")", var + " " + conc_var + ")")
          if conc_var not in concrete_var:
            concrete_var.append(conc_var)
            concrete_val.append(constant)
          print("new line:")
          print(line)
    sketch_lines.append(line)
  first_line = modify_func_sig(first_line, concrete_var, [])
  sketch_lines[0] = first_line
  return sketch_lines, concrete_var, concrete_val


def modify_func_sig(sig, sym_vars, concrete_vars):
  sig_array = sig.split(")")
  sig = sig_array[0]
  for var in sym_vars:
    sig = sig + " " + var
  for var in concrete_vars:
    sig = sig + " " + var
  sig = sig + ")"
  return sig

def gen_equivalence_checker(target_inst_map, utility_file):
  inst_spec_map = dict()
  eq_inst_list = list()
  dsl_to_inst_map = dict()
  index = 0
  for inst, instinfo in target_inst_map.items():
    inst_num_args = num_inst_args(instinfo['args'])
    num_reg_args = get_num_reg_args(instinfo['args'])
    sketch_lines, symbolic_var, concrete_val = gen_sketch(instinfo['name'], instinfo['semantics'])
    print("sketch_lines:")
    for line in sketch_lines:
      print(line)
    print("symbolic_var:")
    print(symbolic_var)
    print("concrete_val:")
    print(concrete_val)
    sketch = ""
    for line in sketch_lines:
      sketch += (line + "\n")
    print("=========================================")
    print(sketch)
    print("=========================================")
    for cmp_inst, cmp_instinfo in target_inst_map.items():
      if cmp_inst == inst:
        continue
      if inst_num_args != num_inst_args(cmp_instinfo['args']):
        continue
      cmp_num_reg_args = get_num_reg_args(cmp_instinfo['args'])
      if num_reg_args != cmp_num_reg_args:
        continue

      # Now we need to perform equivalence checking between
      # the two instructions.
      cmp_sketch_lines, cmp_concrete_var, cmp_concrete_val = get_spec_features(cmp_instinfo['name'], cmp_instinfo['semantics'])
      if (len(cmp_concrete_var)) != (len(symbolic_var) + len(concrete_val)):
        continue
      print("cmp_sketch_lines:")
      for line in cmp_sketch_lines:
        print(line)
      print("cmp_concrete_var:")
      print(cmp_concrete_var)
      print("cmp_concrete_val:")
      print(cmp_concrete_val)
      vector_bitwidth = cmp_instinfo['bitwidth']
      spec = ""
      save_spec = ""
      for line in cmp_sketch_lines:
        spec += (line + "\n")
        save_spec += ((line + "\\n \\\n"))
      inst_spec_map[cmp_instinfo['name']] = save_spec
      print("=========================================")
      print(spec)
      print("=========================================")
      gen_racket_file(utility_file, spec, sketch, cmp_num_reg_args[1], vector_bitwidth, 0, concrete_val, cmp_concrete_val)
      ret = sema_are_equivalent(racket_file)
      print(ret)
      if ret == True:
        save_spec = ""
        dsl_inst_name = "dsl_inst_" + str(index)
        for line in cmp_sketch_lines:
          print("dsl_inst_name:")
          print(dsl_inst_name)
          if "define" in line and "spec" in line:
            line = line.replace("spec", dsl_inst_name)
            index += 1
          save_spec += ((line + " \\n \\\n"))
        if inst_spec_map.get(cmp_instinfo['name']) == None:
          inst_spec_map[cmp_instinfo['name']] = save_spec
        if inst_spec_map.get(instinfo['name']) == None:
          inst_spec_map[instinfo['name']] = save_spec
        eq_inst_list.append(save_spec)
        if dsl_to_inst_map.get(dsl_inst_name) == None:
          dsl_to_inst_map[dsl_inst_name] = [cmp_instinfo['name'], instinfo['name']]
        else:
          if cmp_instinfo['name'] not in dsl_to_inst_map[dsl_inst_name]:  
            dsl_to_inst_map[dsl_inst_name].append(cmp_instinfo['name'])

      break
    break
  print("+=====================")
  print(dsl_to_inst_map["dsl_inst_0"])
  return eq_inst_list, inst_spec_map, dsl_to_inst_map

      

from x86_sema import x86_sema

if __name__ == '__main__':
  gen_equivalence_checker(x86_sema, utility_file)
