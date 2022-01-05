
from collections import namedtuple

BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
Var = namedtuple('Var', ['name', 'id'])
Number = namedtuple('Number', ['val'])
Update = namedtuple('Update', ['lhs', 'rhs'])
# inc is a flag specifying whether we increment of decrement the induction variable
For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'inc', 'id'])
While = namedtuple('While', ['cond', 'body', 'id'])
If = namedtuple('If', ['cond', 'then', 'otherwise', 'id'])
Call = namedtuple('Call', ['func', 'args', 'id'])
BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])
Return = namedtuple('Return', ['val'])
Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])
Match = namedtuple('Match', ['val', 'cases', 'id'])
Case = namedtuple('Case', ['val', 'stmts', 'id'])
# property lookup
Lookup = namedtuple('Lookup', ['obj', 'key'])
Index = namedtuple('Index', ['obj', 'idx'])
FuncDef = namedtuple('FuncDef', ['name', 'params', 'body', 'id'])
#Arg = namedtuple('Arg', ['arg', 'id'])
Break = namedtuple('Break', [])

Parameter = namedtuple('Parameter', ['name', 'type', 'is_signed', 'is_imm', 'id'])
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
