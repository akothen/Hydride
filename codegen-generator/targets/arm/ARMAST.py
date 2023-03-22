from collections import namedtuple
Number = namedtuple('Number', ['val'])
HexNumber = namedtuple('HexNumber', ['val'])
BitString = namedtuple('BitString', ['val'])
BitIndex = namedtuple('BitIndex', ['obj', 'idxs', 'id'])
RegV = namedtuple('RegV', ['idx', 'id'])
RegVpart = namedtuple('RegVpart', ['idx', 'part', 'id'])
Elem = namedtuple('Elem', ['op', 'cnt', 'esize', 'id'])
Var = namedtuple('Var', ['name', 'id'])
TypedVar = namedtuple('TypedVar', ['type', 'name', 'id'])
BitType = namedtuple('BitType', ['size', 'id'])
SimpleType = namedtuple('SimpleType', ['type'])
VarDecl = namedtuple('VarDecl', ['type', 'obj', 'id'])
VarDeclDef = namedtuple('VarDeclDef', ['type', 'obj', 'defi', 'id'])
For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'id'])
IfElse = namedtuple('IfElse', ['cond', 'then',  'otherwise', 'id'])
IfElseExpr = namedtuple(
    'IfElseExpr', ['cond', 'then',  'otherwise', 'id'])
If = namedtuple('If', ['cond', 'then', 'id'])
Call = namedtuple('Call', ['funcname', 'args', 'id'])
BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])
AssignExpr = namedtuple('AssignExpr', ['lhs', 'rhs', 'id'])
PairAssignExpr = namedtuple('PairAssignExpr', ['lhs', 'rhs', 'id'])
ConcatAssignExpr = namedtuple('ConcatAssignExpr', ['lhs', 'rhs', 'id'])
FieldExpr = namedtuple('FieldExpr', ['obj', 'field', 'id'])
ReturnStmt = namedtuple('ReturnStmt', ['ret', 'id'])
CompoundStmt = namedtuple('CompoundStmt', ['stmts', 'id'])
WhenStmt = namedtuple("WhenStmt", ['cond', 'stmt', 'id'])
Case = namedtuple('Case', ['val', 'stmts', 'id'])

ARMSema = namedtuple(
    "ARMSema", ["name", "return_type", "args", "operation", "parameter"])
InstrDesc = namedtuple(
    "InstrDesc", ["name", "return_type", "arguments", "results",
                  "Arguments_Preparation", "Operation", "base_instruction", "operands"]
)

VectorReg = namedtuple("VecReg", ["idx", "elements", "bitspec"])
VectorRegLane = namedtuple("VecRegLane", ["idx", "lane", "bitspec"])
CType = namedtuple("CType", ["basetype", "bits", "num"])
InstrFlag = namedtuple(
    "InstrFlag", "datatype saturate pairwise reduction part",)