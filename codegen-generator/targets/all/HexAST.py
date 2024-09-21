
from collections import namedtuple

Number = namedtuple('Number', ['val'])
BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
BitExtend = namedtuple('BitExtend', ['hi', 'lo'])
BitIndex = namedtuple('BitIndex', ['obj', 'idx', 'id'])
Var = namedtuple('Var', ['name', 'id'])

Update = namedtuple('Update', ['lhs', 'rhs'])

# This takes care of simple loops
For = namedtuple('For', ['iterator', 'begin', 'end', 'step', 'body', 'id'])
# This takes care of complex loops
ComplexFor = namedtuple('ComplexFor', ['init', 'condition', 'update', 'body', 'id'])


If = namedtuple('If', ['cond', 'then', 'otherwise', 'id'])

Call = namedtuple('Call', ['funcname', 'args', 'special', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])

Select = namedtuple('Select', ['cond', 'then', 'otherwise', 'id'])

ElemTypeInfo = namedtuple('ElemTypeInfo', ['obj', 'elemtype'])

Sema = namedtuple('Sema', [
  'intrin', 'inst', 'params', 'spec', 
  'retname', 'retsize',
  'paramsizes', "scalarregs"
  ])


