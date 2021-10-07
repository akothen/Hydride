#################################################################

# This file performs equivalence checking between target
# instructions based on synthesis and helps generate general
# semantics of the instructions.

################################################################


import os
from utility import ext_utility_funcs, find_between


# Class to track semantic info of a spec.
class SpecSemaInfo:
  def __init__(self):
    self.sketch_lines = []
    self.reg_args = []
    self.loop_bounds = []
    self.loop_bounds_vals = []
    self.in_precision = None
    self.in_precision_val = None
    self.out_precision = None
    self.out_precision_val = None
    self.sym_args = []
    self.sym_args_vals = []
    self.other_args = []
    self.other_args_vals = []
  
  def spec_info_is_legal(self):
    if len(self.loop_bounds) != len(self.loop_bounds_vals):
      return False
    if len(self.sym_args) != len(self.sym_args_vals):
      return False
    if len(self.other_args) != len(self.other_args_vals):
      return False
    return True


# Class to track semantic info of a sketch.
class SketchSemaInfo:
  def __init__(self):
    self.sketch_lines = []
    self.reg_args = []
    self.loop_bounds = []
    self.in_precision = None
    self.out_precision = None
    self.sym_args = []
    self.other_args = []
  
  def is_compatible_with_spec(self, spec):
    if len(self.loop_bounds) != len(spec.loop_bounds):
      return False
    if len(self.sym_args) != len(spec.sym_args):
      return False
    if len(self.other_args) != len(spec.other_args):
      return False
    return True


class SymIntGen:
  prefix = 0
  
  @staticmethod
  def gen_symbolic_integers(num_symbols):
    string = ""
    sym_int_list = []
    for i in range(num_symbols):
      print(type(i))
      sym_int_name = "symint" + str(SymIntGen.prefix)
      string += "(define-symbolic " + sym_int_name + " integer?)\n"
      sym_int_list.append(sym_int_name)
      SymIntGen.prefix += 1
    return string, sym_int_list


class SymBitVectorGen:
  prefix = 0
  
  @staticmethod
  def gen_symbolic_bitvectors(num_symbols, bitwidth):
    string = ""
    sym_bv_list = []
    for i in range(num_symbols):
      print(type(i))
      sym_bv_name = "symbv" + str(SymBitVectorGen.prefix)
      string += "(define-symbolic " + sym_bv_name + " (bitvector " + str(bitwidth) + "))\n"
      sym_bv_list.append(sym_bv_name)
      SymBitVectorGen.prefix += 1
    return string, sym_bv_list


class IntDefGen:
  prefix = 0

  @staticmethod
  def gen_integer_defs(int_vals):
    string = ""
    conc_int_list = []
    for i, val in enumerate(int_vals):
      print(type(i))
      conc_int_name = "concint" + str(IntDefGen.prefix)
      string += "(define " + conc_int_name + " " + str(val) + " )\n"
      conc_int_list.append(conc_int_name)
      IntDefGen.prefix += 1
    return string, conc_int_list



class RosetteCodeGen:
  utility_file = "utility.rkt"

  @classmethod
  def __print_to_file(self, text, filename):
    f = open(filename, "w")
    f.write(text)
    f.close()

  @classmethod
  def __gen_headers(self):
    string = '''
    #lang rosette
    (require rosette/lib/synthax)
    (require rosette/lib/angelic)
    (require racket/pretty)
    
    '''
    return string

  @classmethod
  def __gen_synthesis_code(self, symbolic_inputs, spec_name, spec_args, sketch_name, sketch_args):
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

  @classmethod
  def gen_racket_file(self, spec, sketch, num_vectors, vector_bitwidth, spec_sema_info):
    text = self.__gen_headers()
    f = open(RosetteCodeGen.utility_file, "r")
    for x in f:
      text += x
    text += ("\n\n" + spec + "\n\n")
    text += ("\n\n" + sketch + "\n\n")
    symbv_defs, symbvs = SymBitVectorGen.gen_symbolic_bitvectors(num_vectors, vector_bitwidth)
    text += symbv_defs
    loop_bounds_defs, loop_bounds_vars = IntDefGen.gen_integer_defs(spec_sema_info.loop_bounds_vals)
    text += loop_bounds_defs
    in_precision_defs, in_precision_vars = IntDefGen.gen_integer_defs([spec_sema_info.in_precision_val])
    text += in_precision_defs
    out_precision_defs, out_precision_vars = IntDefGen.gen_integer_defs([spec_sema_info.out_precision_val])
    text += out_precision_defs
    other_args_defs, other_args_vars = IntDefGen.gen_integer_defs(spec_sema_info.other_args_vals)
    text += other_args_defs
    sym_args_defs, sym_args_vars = IntDefGen.gen_integer_defs(spec_sema_info.sym_args_vals)
    text += sym_args_defs

    spec_args = []
    spec_args.extend(symbvs)
    spec_args.extend(loop_bounds_vars)
    spec_args.extend(in_precision_vars)
    spec_args.extend(out_precision_vars)
    spec_args.extend(other_args_vars)
    spec_args.extend(sym_args_vars)
    print("spec_args:")
    print(spec_args)

    sketch_args = []
    sketch_args.extend(symbvs)
    sketch_args.extend(loop_bounds_vars)
    sketch_args.extend(out_precision_vars)
    sketch_args.extend(other_args_vars)
    text += self.__gen_synthesis_code(symbvs, "spec", spec_args, "sketch", sketch_args)

    # Print the text into a file
    racket_file = "eq_checker.rkt"
    self.__print_to_file(text, racket_file)

    return racket_file


class SketchGen:
  @classmethod
  def __modify_sketch_func_sig(self, sig, sema_info):
    sig_array = sig.split(")")
    sig = sig_array[0]

    # Loop bounds come first
    for var in sema_info.loop_bounds:
      sig = sig + " " + var
    # Output precision next
    sig = sig + " " + sema_info.out_precision
    # Other args next
    for var in sema_info.other_args:
      sig = sig + " " + var
    sig = sig + ")"
    return sig

  @staticmethod
  def gen_sketch(instinfo):
    name = instinfo['name']
    inst_sema = instinfo['semantics']
    in_precision = instinfo['input_precision']
    out_precision = instinfo['output_precision']
    inst_sema_lines = inst_sema.split("\n")
    induction_var = list()
    symbolic_var = list()
    var_to_val_map = dict()
    first_line = ""
    sema_info = SketchSemaInfo()
    for index, line in enumerate(inst_sema_lines):
      line = line.strip()
      if line == "{" or line == "}":
        continue
      print("line:")
      print(line)
      # Look at the function name
      if index == 1 and "define" in line:
        assert(name in line)
        line = line.replace(name, "sketch")
        first_line = line
        sema_info.sketch_lines.append(line)
        print("first line:")
        print(first_line)
        continue

      # Look at the loops in the function
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
        if bound_arg not in sema_info.loop_bounds:
          sema_info.loop_bounds.append(bound_arg)
        sema_info.sketch_lines.append(line)
        continue

      # Replace some induction variables
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
              _ = int(constant)
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
              sema_info.sym_args.append(sym_var)

      # Replace the input and output precision
      for op in ext_utility_funcs:
        if op in line:
          # Handle input precision
          if in_precision in line:
            var_in_precision = "??in_precision"
            line = line.replace(in_precision, var_in_precision)
            if var_in_precision not in symbolic_var:
              symbolic_var.append(var_in_precision)
              sema_info.in_precision = var_in_precision
          
          # Handle output precision
          if out_precision in line:
            var_out_precision = "conc_out_precision"
            line = line.replace(out_precision, var_out_precision)
            if sema_info.out_precision == None:
              sema_info.out_precision = var_out_precision
          else:
            string = find_between(line, op, ") (")
            if len(string) == 0:
              continue
            print("line:")
            print(line)
            print("string:")
            print(string)
            assert(len(string) == 1)
            string_array = string[0].strip().split(" ")
            new_out_precision = string_array[len(string_array) - 1].strip()
            try:
              _ = int(new_out_precision)
              if out_precision != new_out_precision:
                var_out_precision = "conc_int_out_precision"
                line = line.replace(new_out_precision, var_out_precision)
                if var_out_precision not in sema_info.other_args:
                  sema_info.other_args.append(var_out_precision)
              print("--out_precision:")
              print(out_precision)
            except:
              pass
          break
      sema_info.sketch_lines.append(line)
    
    first_line = SketchGen.__modify_sketch_func_sig(first_line, sema_info)
    sema_info.sketch_lines[0] = first_line

    # Add the symbolic variables' definitions
    new_sketch_lines = list()
    for index, line in enumerate(sema_info.sketch_lines):
      if index == 1:
        for sym in symbolic_var:
          new_sketch_lines.append("(define-symbolic " + sym + " integer?) ")
      new_sketch_lines.append(line)

    sema_info.sketch_lines = new_sketch_lines
    return sema_info


class SpecGen:
  @classmethod
  def __modify_spec_func_sig(self, sig, sema_info):
    sig_array = sig.split(")")
    sig = sig_array[0]

    # Loop bounds come first
    for var in sema_info.loop_bounds:
      sig = sig + " " + var
    # Input precion next 
    sig = sig + " " + sema_info.in_precision
    # Output precision next
    sig = sig + " " + sema_info.out_precision
    # Other args next
    for var in sema_info.other_args:
      sig = sig + " " + var
    # Sym args next
    for var in sema_info.sym_args:
      sig = sig + " " + var
    sig = sig + ")"
    return sig

  @staticmethod
  def gen_spec(instinfo):
    name = instinfo['name']
    inst_sema = instinfo['semantics']
    in_precision = instinfo['input_precision']
    out_precision = instinfo['output_precision']
    inst_sema_lines = inst_sema.split("\n")
    induction_var = list()
    var_to_val_map = dict()
    first_line = ""
    sema_info = SpecSemaInfo()
    for index, line in enumerate(inst_sema_lines): 
      line = line.strip()
      if line == "{" or line == "}":
        continue
      print("line:")
      print(line)

      # Replace function name
      if index == 1 and "define" in line:
        assert(name in line)
        line = line.replace(name, "spec")
        first_line = line
        sema_info.sketch_lines.append(line)
        print("first_line:")
        print(first_line)
        continue

      # Hanle loop bounds
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
        if bound_arg not in sema_info.loop_bounds:
          sema_info.loop_bounds.append(bound_arg)
          sema_info.loop_bounds_vals.append(bound)
        induction_var.append(var)
        sema_info.sketch_lines.append(line)
        continue

      # Handle the induction variables
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
              _ = int(constant)
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
            if conc_var not in sema_info.sym_args:
              sema_info.sym_args.append(conc_var)
              sema_info.sym_args_vals.append(constant)
            print("new line:")
            print(line)
      
      # Replace the input and output precision
      for op in ext_utility_funcs:
        if op in line:
          # Handle input precision
          if in_precision in line:
            var_in_precision = "conc_in_precision"
            line = line.replace(in_precision, var_in_precision)
            if sema_info.in_precision == None:
              sema_info.in_precision = var_in_precision
              sema_info.in_precision_val = in_precision
          
          # Handle output precision
          if out_precision in line:
            var_out_precision = "conc_out_precision"
            line = line.replace(out_precision, var_out_precision)
            if sema_info.out_precision == None:
              sema_info.out_precision_val = out_precision
              sema_info.out_precision = var_out_precision
          else:
            string = find_between(line, op, ") (")
            if len(string) == 0:
              continue
            print("line:")
            print(line)
            print("string:")
            print(string)
            assert(len(string) == 1)
            string_array = string[0].strip().split(" ")
            new_out_precision = string_array[len(string_array) - 1].strip()
            try:
              _ = int(new_out_precision)
              if out_precision != new_out_precision:
                var_out_precision = "conc_int_out_precision"
                line = line.replace(new_out_precision, var_out_precision)
                if var_out_precision not in sema_info.other_args:
                  sema_info.other_args.append(var_out_precision)
                  sema_info.other_args_vals.append(new_out_precision)
              print("--out_precision:")
              print(out_precision)
            except:
              pass
          break
      sema_info.sketch_lines.append(line)

    assert(sema_info.spec_info_is_legal())
    first_line = SpecGen.__modify_spec_func_sig(first_line, sema_info)
    sema_info.sketch_lines[0] = first_line
    return sema_info


class EquivalenceChecker:
  @classmethod
  def __sema_are_equivalent(self, racket_file):
    output_file = "output.txt"
    os.system("racket " + racket_file + " >> " + output_file)
    f = open(output_file, "r")
    ret_sat = False
    for x in f:
      if "model" in x:
        ret_sat = True
        continue
      if "unsat" in x:
        os.system("rm " + output_file)
        return False
    os.system("rm " + output_file)
    return ret_sat

  @classmethod
  def __num_inst_args(self, args):
    args_list = args.split(",")
    return len(args_list)

  @classmethod
  def __get_num_reg_args(self, args):
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

  @classmethod
  def gen_equivalence_checker(self, target_inst_map):
    inst_spec_map = dict()
    eq_inst_list = list()
    dsl_to_inst_map = dict()
    index = 0
    for inst, instinfo in target_inst_map.items():
      inst_num_args = EquivalenceChecker.__num_inst_args(instinfo['args'])
      num_reg_args = EquivalenceChecker.__get_num_reg_args(instinfo['args'])
      sema_info = SketchGen.gen_sketch(instinfo)
      sketch_lines = sema_info.sketch_lines
      print("sketch_lines:")
      for line in sketch_lines:
        print(line)
      sketch = ""
      for line in sketch_lines:
        sketch += (line + "\n")
      print("=========================================")
      print(sketch)
      print("=========================================")
      for cmp_inst, cmp_instinfo in target_inst_map.items():
        if cmp_inst == inst:
          continue
        if inst_num_args != EquivalenceChecker.__num_inst_args(cmp_instinfo['args']):
          continue
        cmp_num_reg_args = EquivalenceChecker.__get_num_reg_args(cmp_instinfo['args'])
        if num_reg_args != cmp_num_reg_args:
          continue

        # Now we need to perform equivalence checking between
        # the two instructions.
        cmp_sema_info = SpecGen.gen_spec(cmp_instinfo)
        cmp_sketch_lines = cmp_sema_info.sketch_lines
        if sema_info.is_compatible_with_spec(cmp_sema_info) == False:
          continue
        print("cmp_sketch_lines:")
        for line in cmp_sketch_lines:
          print(line)
        spec = ""
        save_spec = ""
        for line in cmp_sketch_lines:
          spec += (line + "\n")
          save_spec += ((line + "\\n \\"))
        inst_spec_map[cmp_instinfo['name']] = save_spec
        print("=========================================")
        print(spec)
        print("=========================================")
        racket_file = RosetteCodeGen.gen_racket_file(spec, sketch, cmp_num_reg_args[1], cmp_instinfo['bitwidth'], cmp_sema_info)
        ret = EquivalenceChecker.__sema_are_equivalent(racket_file)
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

        
# Just for testing
from x86_sema import x86_sema

if __name__ == '__main__':
  EquivalenceChecker.gen_equivalence_checker(x86_sema)
