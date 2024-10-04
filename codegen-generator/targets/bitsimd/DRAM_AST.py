###################################################################
#
# Abstractions reprsented by the nodes of the AST generated from
# x86 ISA pseudocode.
#
###################################################################


from collections import namedtuple

Number = namedtuple('Number', ['val'])
BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
BitIndex = namedtuple('BitIndex', ['obj', 'idx', 'id'])
Var = namedtuple('Var', ['name', 'id'])

For = namedtuple('For', ['iterator', 'begin', 'end', 'step', 'body', 'inc', 'id'])

IfElseIfElse = namedtuple('IfElseIfElse', ['cond1', 'then', 'cond2', 'elseif',  'otherwise', 'id'])
IfElse = namedtuple('IfElse', ['cond', 'then',  'otherwise', 'id'])
If = namedtuple('If', ['cond', 'then', 'id'])

Call = namedtuple('Call', ['funcname', 'args', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])

TypeLookup = namedtuple('TypeLookup', ['obj', 'key'])
FuncDef = namedtuple('FuncDef', ['name', 'params', 'body', 'id'])
Update = namedtuple('Update', ['lhs', 'rhs'])
Return = namedtuple('Return', ['val', 'id'])

Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])

Break = namedtuple('Break', [])

Parameter = namedtuple('Parameter', ['name', 'type', 'layout', 'is_signed', 'is_imm',  'id'])

Sema = namedtuple('Sema', [
  'intrin', 'inst', 'params',
  'spec', 'rettype', 'ret_is_signed',
  'ret_layout',
  'inst_form',
  'extensions',
  'elem_type',
  ])


