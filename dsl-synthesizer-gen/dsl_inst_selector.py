

bv_ops = [
  'bvnot', 'bvand', 'bvor', 'bvxor', 'bvshl', 'bvlshr', 'bvashr', 
  'bvneg', 'bvadd', 'bvsub', 'bvmul', 'bvsdiv', 'bvudiv', 
  'bvsrem', 'bvurem', 'bvsmod', 
  'bvsmin', 'bvumin', 'bvsmax', 'bvumax', 
  'bveq', 'bvslt', 'bvult', 'bvsle', 'bvule', 'bvsgt', 'bvugt', 'bvsge', 'bvuge'
]


#spec_file = "spec.rkt"
#dsl_inst_file = "dsl.rkt"

def dsl_inst_rel_spec(spec_file, dsl_inst_file):
  # Get all the bitvector ops in the dsl instruction
  # implementation.
  f = open(dsl_inst_file, "r")
  bvop_list = list()
  for line in f:
    for op in bv_ops:
      if op in line:
        bvop_list.append(op)
  assert(len(bvop_list) != 0)
  
  # Check if the bitvector ops in the dsl instruction
  # implementation are present in the given spec.
  f = open(spec_file, "r")
  for line in f:
    for op in bvop_list:
      if op in line:
        bvop_list.remove(op)
  if len(bvop_list) == 0:
    print("TRUE")
    return True
  return False


#dsl_inst_rel_spec(spec_file, dsl_inst_file)
