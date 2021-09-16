

import os


# This file assumes that there is a spec file and there is a sketch file.
# This file will generate a synthesis file automatically.
#racket_file = "eq_checker.rkt"
#spec_file = "spec.rkt" 
#sketch_file = "sketch.rkt"
#utility_file = "utility.rkt"


def print_to_file(text, filename):
  f = open(filename, "w")
  f.write(text)
  f.close()


def gen_headers(spec_file, sketch_file):
  string = '''
  #lang rosette
 (require rosette/lib/synthax)
 (require rosette/lib/angelic)
 (require racket/pretty)
 '''
  #string += "(require " + spec_file + ")\n"
  #string += "(require " + sketch_file + ")\n"
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
    conc_int_name = "symint" + str(i)
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
    if "unsat" in x:
      os.system("rm " + output_file)
      return False
  os.system("rm " + output_file)
  return True



def gen_racket_file(racket_file, utility_file, spec_file, sketch_file, \
                    num_vectors, vector_bitwidth, num_ints, concrete_vals):
  text = gen_headers(spec_file, sketch_file)
  f = open(utility_file, "r")
  for x in f:
    text += x
  f = open(spec_file, "r")
  for x in f:
    text += x
  f = open(sketch_file, "r")
  for x in f:
    text += x
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
  args = []
  for symbol in symbvs:
    args.append(symbol)
  for integer in concints:
    args.append(integer)
  print("args:")
  print(args)
  print("--symbolic_inputs:")
  print(symbolic_inputs)
  text += gen_synthesis_code(symbolic_inputs, "spec", args, "sketch", args)
  print_to_file(text, racket_file)


def gen_equivalence_checker(racket_file, utility_file, spec_file, sketch_file, \
                            num_vectors, vector_bitwidth, num_ints, concrete_vals):
  gen_racket_file(racket_file, utility_file, spec_file, sketch_file, \
                  num_vectors, vector_bitwidth, num_ints, concrete_vals)
  ret = sema_are_equivalent(racket_file)
  print(ret)
  return ret


