
from collections import namedtuple

BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'expr_id'])
Var = namedtuple('Var', ['name'])
Number = namedtuple('Number', ['val'])
Update = namedtuple('Update', ['lhs', 'rhs'])
# inc is a flag specifying whether we increment of decrement the induction variable
For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'inc', 'expr_id'])
While = namedtuple('While', ['cond', 'body', 'expr_id'])
If = namedtuple('If', ['cond', 'then', 'otherwise', 'expr_id'])
Call = namedtuple('Call', ['func', 'args', 'expr_id'])
BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'expr_id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'expr_id'])
Return = namedtuple('Return', ['val'])
Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'expr_id'])
Match = namedtuple('Match', ['val', 'cases', 'expr_id'])
Case = namedtuple('Case', ['val', 'stmts', 'expr_id'])
# property lookup
Lookup = namedtuple('Lookup', ['obj', 'key'])
Index = namedtuple('Index', ['obj', 'idx'])
FuncDef = namedtuple('FuncDef', ['name', 'params', 'body'])
Break = namedtuple('Break', [])

Parameter = namedtuple('Parameter', ['name', 'type', 'is_signed', 'is_imm'])
Spec = namedtuple('Spec', [
  'intrin', 'inst', 'params',
  'spec', 'rettype', 'binary_exprs',

  'inst_form',
  'cpuids',
  'imm_width', # None of this instruction doesn't have imm8
  'xed',
  'elem_type',

  # configuration of binary exprs
  'configs',
  ])
