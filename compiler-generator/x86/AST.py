
from collections import namedtuple

Number = namedtuple('Number', ['val'])
BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
BitIndex = namedtuple('BitIndex', ['obj', 'idx', 'id'])
Var = namedtuple('Var', ['name', 'id'])

Update = namedtuple('Update', ['lhs', 'rhs'])

For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'inc', 'id'])
While = namedtuple('While', ['cond', 'body', 'id'])

If = namedtuple('If', ['cond', 'then', 'otherwise', 'id'])

Call = namedtuple('Call', ['funcname', 'args', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])

FuncDef = namedtuple('FuncDef', ['name', 'params', 'body', 'id'])
Return = namedtuple('Return', ['val', 'id'])

Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])

Match = namedtuple('Match', ['val', 'cases', 'id'])
Case = namedtuple('Case', ['val', 'stmts', 'id'])

Lookup = namedtuple('Lookup', ['obj', 'key'])

Break = namedtuple('Break', [])

Parameter = namedtuple('Parameter', ['name', 'type', 'is_signed', 'is_imm', 'is_mask', 'id'])

Sema = namedtuple('Sema', [
  'intrin', 'inst', 'params',
  'spec', 'rettype', 'ret_is_signed',
  'inst_form',
  'cpuids',
  'imm_width',
  'xed',
  'elem_type',
  ])

