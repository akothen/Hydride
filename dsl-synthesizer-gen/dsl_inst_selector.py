

from tensor_dsl import dsl
from tensor_spec import spec


bv_ops = [
  'bvnot', 'bvand', 'bvor', 'bvxor', 'bvshl', 'bvlshr', 'bvashr', 
  'bvneg', 'bvadd', 'bvsub', 'bvmul', 'bvsdiv', 'bvudiv', 
  'bvsrem', 'bvurem', 'bvsmod', 
  'bvsmin', 'bvumin', 'bvsmax', 'bvumax', 
  'bveq', 'bvslt', 'bvult', 'bvsle', 'bvule', 'bvsgt', 'bvugt', 'bvsge', 'bvuge'
]


def dsl_inst_rel_spec(spec_name, dsl_name):
  dsl_sema = dsl[dsl_name]['semantics']
  print(dsl_sema)
  bvops_list = list()
  for op in bv_ops:
    if op in dsl_sema:
      bvops_list.append(op)
  spec_sema = spec[spec_name]['semantics']
  for op in bvops_list:
    if op not in spec_sema:
      return False
    print(spec_sema)
  return True

# Returns a list of dsl instructions that
# must be in the sketch of the given spec.
def get_dsl_insts_for(spec_name):
  dsl_inst_list = list()
  for inst in dsl:
    rel = dsl_inst_rel_spec(spec_name, inst)
    if rel == True:
      dsl_inst_list.append(inst)
  print(dsl_inst_list)
  return dsl_inst_list

#get_dsl_insts_for("tensor-matmul")
