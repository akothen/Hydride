#################################################################

# This file performs equivalence checking between target
# instructions based on synthesis and helps generate general
# semantics of the instructions.

################################################################


import os
from utility import ext_utility_funcs, find_between, strip_brackets
from legalizer_info import LegalizerInfo


# Class to track semantic info of a spec.
class SpecSemaInfo:
  def __init__(self):
    self.sema_lines = []
    self.reg_args = []
    self.induction_vars = []
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
    
    # Output precions must never be None
    if ((self.out_precision is None) or (self.out_precision_val is None)):
      return False
    return True
  
  def print(self):
    print("sema_lines:")
    print(self.sema_lines)
    print("reg_args:")
    print(self.reg_args)
    print("induction_vars:")
    print(self.induction_vars)
    print("loop_bounds:")
    print(self.loop_bounds)
    print("loop_bounds_vals:")
    print(self.loop_bounds_vals)
    print("in_precision:")
    print(self.in_precision)
    print("in_precision_val:")
    print(self.in_precision_val)
    print("out_precision:")
    print(self.out_precision)
    print("out_precision_val:")
    print(self.out_precision_val)
    print("sym_args:")
    print(self.sym_args)
    print("sym_args_vals:")
    print(self.sym_args_vals)
    print("other_args:")
    print(self.other_args)
    print("other_args_vals:")
    print(self.other_args_vals)


# Class to track semantic info of a sketch.
class SketchSemaInfo:
  def __init__(self):
    self.sema_lines = []
    self.reg_args = []
    self.induction_vars = []
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
  
  def print(self):
    print("sema_lines:")
    print(self.sema_lines)
    print("reg_args:")
    print(self.reg_args)
    print("induction_vars:")
    print(self.induction_vars)
    print("loop_bounds:")
    print(self.loop_bounds)
    print("in_precision:")
    print(self.in_precision)
    print("out_precision:")
    print(self.out_precision)
    print("sym_args:")
    print(self.sym_args)
    print("other_args:")
    print(self.other_args)


class SymIntGen:
  __suffix = 0
  
  @classmethod
  def gen_symbolic_integers(self, num_symbols):
    string = ""
    sym_int_list = []
    for i in range(num_symbols):
      print(type(i))
      sym_int_name = "symint" + str(SymIntGen.__suffix)
      string += "(define-symbolic " + sym_int_name + " integer?)\n"
      sym_int_list.append(sym_int_name)
      SymIntGen.__suffix += 1
    return string, sym_int_list


class SymBitVectorGen:
  __suffix = 0
  
  @classmethod
  def gen_symbolic_bitvectors(self, num_symbols, bitwidth):
    string = ""
    sym_bv_list = []
    for i in range(num_symbols):
      print(type(i))
      sym_bv_name = "symbv" + str(SymBitVectorGen.__suffix)
      string += "(define-symbolic " + sym_bv_name + " (bitvector " + str(bitwidth) + "))\n"
      sym_bv_list.append(sym_bv_name)
      SymBitVectorGen.__suffix += 1
    return string, sym_bv_list


class IntDefGen:
  __suffix = 0

  @classmethod
  def gen_integer_defs(self, int_vals):
    string = ""
    conc_int_list = []
    for i, val in enumerate(int_vals):
      if val == None:
        continue
      print(type(i))
      conc_int_name = "concint" + str(IntDefGen.__suffix)
      string += "(define " + conc_int_name + " " + str(val) + " )\n"
      conc_int_list.append(conc_int_name)
      IntDefGen.__suffix += 1
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
  def gen_racket_file(self, spec, sketch, num_vectors, vector_bitwidth, spec_sema_info, sketch_sema_info):
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
    if sketch_sema_info.out_precision is not None:
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
    sema_info.print()
    sig_array = sig.split(")")
    sig = sig_array[0]
    # Loop bounds come first
    for var in sema_info.loop_bounds:
      sig = sig + " " + var
    # Output precision next
    if sema_info.out_precision is not None:
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
        sema_info.sema_lines.append(line)
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
        sema_info.induction_vars.append(var)
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
        sema_info.sema_lines.append(line)
        continue

      # Replace some induction variables
      for var in sema_info.induction_vars:
        if var in line:
          print("line:")
          print(line)
          print("induction_var:")
          print(sema_info.induction_vars)
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
      sema_info.sema_lines.append(line)
    
    first_line = SketchGen.__modify_sketch_func_sig(first_line, sema_info)
    sema_info.sema_lines[0] = first_line

    # Add the symbolic variables' definitions
    new_sema_lines = list()
    for index, line in enumerate(sema_info.sema_lines):
      if index == 1:
        for sym in symbolic_var:
          new_sema_lines.append("(define-symbolic " + sym + " integer?) ")
      new_sema_lines.append(line)

    sema_info.sema_lines = new_sema_lines
    return sema_info


class SpecGen:
  @classmethod
  def __modify_spec_func_sig(self, sig, sema_info):
    sema_info.print()
    sig_array = sig.split(")")
    sig = sig_array[0]
    # Loop bounds come first
    for var in sema_info.loop_bounds:
      sig = sig + " " + var
    # Input precion next 
    if sema_info.in_precision is not None:
      sig = sig + " " + sema_info.in_precision
    # Output precision next
    sig = sig + " " + sema_info.out_precision
    # Other args next
    for var in sema_info.other_args:
      sig = sig + " " + var
    # Sym args next
    for var in sema_info.sym_args:
      if var == None:
        continue
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
        sema_info.sema_lines.append(line)
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
        sema_info.induction_vars.append(var)
        sema_info.sema_lines.append(line)
        continue

      # Handle the induction variables
      for var in sema_info.induction_vars:
        if var in line:
          print("induction_var:")
          print(sema_info.induction_vars)
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
              # Check if we are only extracting bits and not extending them
              if "(ext-bv" in line:
                string_array = line.strip().split(" ")
                out_precision = string_array[len(string_array) - 1].strip()
                out_precision = strip_brackets(out_precision)
                print("===out_precision:")
                print(out_precision)
                if out_precision in sema_info.sym_args:
                  # Remove it for the sym_args list
                  index = sema_info.sym_args.index(out_precision)
                  var_out_precision = "conc_precision"
                  sema_info.out_precision = var_out_precision
                  sema_info.out_precision_val = sema_info.sym_args_vals[index]
                  line = line.replace(out_precision, var_out_precision)
                  sema_info.sym_args[index] = None
                  sema_info.sym_args_vals[index] = None
                  #sema_info.sym_args.pop(index)
                  #sema_info.sym_args_vals.pop(index)
              else:
                continue
            else:
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
      sema_info.sema_lines.append(line)
    
    sema_info.print()
    assert(sema_info.spec_info_is_legal())
    first_line = SpecGen.__modify_spec_func_sig(first_line, sema_info)
    sema_info.sema_lines[0] = first_line
    return sema_info


class DSLSemaGen:
  @classmethod
  def __modify_sema_func_sig(self, sig, spec_sema_info):
    for sym in reversed(spec_sema_info.sym_args):
      if sym is None:
        continue
      sig = sig.replace(sym, "")
    sig_array = sig.split(")")
    sig = sig_array[0].strip() + ")"
    return sig
  
  @staticmethod
  def gen_dsl_sema(spec_sema_info, dsl_inst_name):
    first_line = ""
    dsl_sema_lines = list()
    reversed_loop_bounds = spec_sema_info.loop_bounds
    reversed_loop_bounds.reverse()
    print("reversed_loop_bounds:")
    print(reversed_loop_bounds)
    print("spec_sema_info.sym_args:")
    print(spec_sema_info.sym_args)
    for index, line in enumerate(spec_sema_info.sema_lines): 
      line = line.strip()
      if line == "{" or line == "}":
        continue
      print("line:")
      print(line)

      # Replace function name
      if index == 0 and "define" in line:
        array = find_between(line, "define (", " ")
        assert(len(array) == 1)
        line = line.replace(array[0].strip(), dsl_inst_name)
        first_line = line
        dsl_sema_lines.append(line)
        print("first_line:")
        print(first_line)
        continue
      
      for sym in reversed(spec_sema_info.sym_args):
        if sym is None:
          continue
        if sym in line:
          # Go from inner induction variables to outer
          # TODO: We need to make this more general
          for index, var in enumerate(reversed(spec_sema_info.induction_vars)):
            # Skip the inner most loop's induction variable
            if index == 0:
              continue
            if var not in line:
              continue
            print("=====line:")
            print(line)
            array = find_between(line, "(* " + var, ")")
            print("====array:")
            print(array)
            print("==sym:")
            print(sym)
            if len(array) == 0:
              line = line.replace(sym, spec_sema_info.out_precision)
            else:
              assert(len(array) == 1)
              assert(array[0].strip() == sym)
              line = line.replace(sym, reversed_loop_bounds[index - 1])
      dsl_sema_lines.append(line)
    
    first_line = DSLSemaGen.__modify_sema_func_sig(first_line, spec_sema_info)
    dsl_sema_lines[0] = first_line
    return dsl_sema_lines


class DSLNameGen:
  __suffix  = 0

  @classmethod
  def gen_new_inst_name(self):
    dsl_inst_name = "dsl_inst_" + str(DSLNameGen.__suffix)
    DSLNameGen.__suffix += 1
    return dsl_inst_name


class EquivalenceChecker:
  __target_inst_map_list = list()
  __legalizer_info = LegalizerInfo()

  def __init__(self, target_inst_map_list, legalizer_info):
    self.__target_inst_map_list = target_inst_map_list
    self.__legalizer_info = legalizer_info
  
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
  def __populate_dsl_sema_info(self, sketch_inst_name, spec_inst_name, spec_sema_info):
    # Replace the spec name with new dsl instruction's name
    new_sema = ""
    dsl_inst_name = DSLNameGen.gen_new_inst_name()
    sema_lines = DSLSemaGen.gen_dsl_sema(spec_sema_info, dsl_inst_name)
    for line in sema_lines:
      new_sema += ((line + " \\n \\\n"))
    
    # Map the target instructions to the new semantics
    self.__legalizer_info.inst_to_sema_map[spec_inst_name] = new_sema
    if self.__legalizer_info.inst_to_sema_map.get(sketch_inst_name) == None:
      self.__legalizer_info.inst_to_sema_map[sketch_inst_name] = new_sema
    
    # Map the new dsl instruction to the target instructions
    if self.__legalizer_info.dsl_to_insts_map.get(dsl_inst_name) == None:
      self.__legalizer_info.dsl_to_insts_map[dsl_inst_name] = [spec_inst_name, sketch_inst_name]
    else:
      if spec_inst_name not in self.__legalizer_info.dsl_to_insts_map[dsl_inst_name]:  
        self.__legalizer_info.dsl_to_insts_map[dsl_inst_name].append(spec_inst_name)
    
    # Record the generated semantics
    self.__legalizer_info.unique_sema_list.append(new_sema)

  @classmethod
  def __gen_equivalence_checker(self, target_inst_map):
    for inst, instinfo in target_inst_map.items():
      inst_num_args = self.__num_inst_args(instinfo['args'])
      num_reg_args = self.__get_num_reg_args(instinfo['args'])
      sema_info = SketchGen.gen_sketch(instinfo)
      print("sema_lines:")
      sketch = ""
      for line in sema_info.sema_lines:
        sketch += (line + "\n")
      print("=========================================")
      print(sketch)
      print("=========================================")
      for cmp_inst, cmp_instinfo in target_inst_map.items():
        if cmp_inst == inst:
          continue
        if inst_num_args != self.__num_inst_args(cmp_instinfo['args']):
          continue
        cmp_num_reg_args = self.__get_num_reg_args(cmp_instinfo['args'])
        if num_reg_args != cmp_num_reg_args:
          continue

        # Now we need to perform equivalence checking between
        # the two instructions.
        cmp_sema_info = SpecGen.gen_spec(cmp_instinfo)
        if sema_info.is_compatible_with_spec(cmp_sema_info) == False:
          continue
        print("cmp_sema_lines:")
        spec = ""
        for line in cmp_sema_info.sema_lines:
          spec += (line + "\n")
        print("=========================================")
        print(spec)
        print("=========================================")
        racket_file = RosetteCodeGen.gen_racket_file(spec, sketch, cmp_num_reg_args[1], \
                                    cmp_instinfo['bitwidth'], cmp_sema_info, sema_info)
        ret = self.__sema_are_equivalent(racket_file)
        print(ret)
        
        if ret == True:
          self.__populate_dsl_sema_info(instinfo['name'], cmp_instinfo['name'], cmp_sema_info)

        break
      break
    return

  def perform_equivalence_checking(self):
    '''
    perform intra-architecture equivalence checking
    '''
    for target_inst_map in self.__target_inst_map_list:
      EquivalenceChecker.__gen_equivalence_checker(target_inst_map)
    return 
  
  def get_updated_legalizer_info(self):
    '''
    return the legalize info that has been modified as a 
    result of equivalence checking.
    '''
    return self.__legalizer_info



# Just for testing
from x86_sema import x86_sema

if __name__ == '__main__':
  legalizer_info = LegalizerInfo()
  eq_checker = EquivalenceChecker([x86_sema], legalizer_info)
  eq_checker.perform_equivalence_checking()
  legalizer_info = eq_checker.get_updated_legalizer_info()
  #legalizer_info = eqchecker.gen_equivalence_checker()
  #EquivalenceChecker.gen_equivalence_checker(x86_sema)
