
from collections import namedtuple

Number = namedtuple('Number', ['val'])
BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
BitIndex = namedtuple('BitIndex', ['obj', 'idx', 'id'])
Var = namedtuple('Var', ['name', 'id'])

Update = namedtuple('Update', ['lhs', 'rhs'])

For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'inc', 'id'])

If = namedtuple('If', ['cond', 'then', 'otherwise', 'id'])

Call = namedtuple('Call', ['func', 'args', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])

Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])

Lookup = namedtuple('Lookup', ['obj', 'key'])
TypeLookup = namedtuple('TypeLookup', ['obj', 'type'])

Parameter = namedtuple('Parameter', ['name', 'type', 'is_signed', 'is_imm', 'id'])

Sema = namedtuple('Sema', [
  'intrin', 'inst', 'params',
  'spec', 'rettype',
  ])
