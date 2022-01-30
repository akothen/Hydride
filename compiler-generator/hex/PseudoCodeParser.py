
import ply.yacc as yacc
from lex import tokens
import json
from AST import *
from collections import defaultdict

# Expressions have unique IDs
def GenUniqueID(parser):
  ID = parser.id_counter
  parser.id_counter += 1
  return str(ID)

def new_binary_expr(parser, op, a, b):
  expr_id = "binexpr." + GenUniqueID(parser)
  expr = BinaryExpr(op, a, b, expr_id)
  parser.binary_exprs.append(expr)
  return expr

def parse_binary(op, p):
  p[0] = new_binary_expr(p.parser, op, p[1], p[3])

def parse_unary(op, p):
  expr_id = "unaryexpr." + GenUniqueID(parser)
  p[0] = UnaryExpr(op, p[2], expr_id)

if __name__ != '__main__':
  def p_error(p):
    raise SyntaxError('Parser error: {}'.format(p))

# TODO: There is probably a better way to handle this? 
def p_stmts(p):
  '''stmts : stmt
           | stmt SEMICOLON
           | stmts stmt
           | stmts stmt SEMICOLON
  '''
  if not isinstance(p[1], list):
    p[0] = [p[1]]
  else:
    p[0] = p[1] + [p[2]]

def p_stmt_break(p):
  'stmt : BREAK'
  p[0] = Break()

def p_stmt_expr(p):
  'stmt : expr'
  p[0] = p[1]

# TODO: Store type information? 
def p_stmt_decl(p):
  '''stmt : TYPE ID UPDATE expr'''
  p[0] = Update(p[2], p[4])

def p_expr_assign(p):
  'expr : expr UPDATE expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], p[3])

def p_expr_plus_equal(p):
  'expr : expr PLUS_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='+', a=p[1], b=p[3]))

def p_expr_or_equal(p):
  'expr : expr OR_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='|', a=p[1], b=p[3]))

def p_expr_empty(p):
  '''expr_empty : expr 
              | '''
  if len(p) == 2:
    p[0] = p[1]
  else:
    p[0] = None

def p_stmt_if(p):
  'stmt : IF LPAREN expr RPAREN LBRACKET stmts RBRACKET'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[3], p[6], None, expr_id)

def p_stmt_if_single(p):
  'stmt : IF LPAREN expr RPAREN stmt '
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[3], [p[5]], None, expr_id)

def p_stmt_for(p):
  'stmt : FOR LPAREN expr_empty SEMICOLON expr_empty SEMICOLON expr_empty RPAREN LBRACKET stmts RBRACKET'
  expr_id = "for." + GenUniqueID(parser)
  p[0] = For(p[3], p[5], p[7], p[10], expr_id)

def p_stmt_for_single(p):
  'stmt : FOR LPAREN expr_empty SEMICOLON expr_empty SEMICOLON expr_empty RPAREN stmt'
  expr_id = "for." + GenUniqueID(parser)
  p[0] = For(p[3], p[5], p[7], [p[9]], expr_id)

def p_expr_call(p):
  '''expr : ID LPAREN args RPAREN
          | ID LPAREN args RPAREN COLON ID'''
  expr_id = "call." + GenUniqueID(parser)
  if len(p) == 5:
    p[0] = Call(p[1], p[3], None, expr_id)
  else:
    p[0] = Call(p[1], p[3], p[6], expr_id)
  

def p_expr_call_no_args(p):
  'expr : ID LPAREN RPAREN'
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1], [], None, expr_id)

def p_expr_lookup(p):
  'expr : expr DOT ID'
  if p[3] in ['b', 'ub', 'h', 'uh', 'w', 'uw']:
    p[0] = TypeLookup(p[1], p[3])
  else:
    p[0] = Lookup(p[1], p[3])

def p_args(p):
  '''args : expr
        | args COMMA expr
  '''
  #expr_id = GenUniqueID(parser)
  if len(p) == 2:
    p[0] = [p[1]] #[Arg(p[1], expr_id)]
  else:
    p[0] = p[1] + [p[3]] #[Arg(p[3], expr_id)]

def p_expr_bit_index(p):
  'expr : expr LBRACE expr RBRACE'
  expr_id = "index." + GenUniqueID(parser)
  p[0] = BitIndex(p[1], p[3], expr_id)

def p_expr_bit_slice(p):
  'expr : expr LBRACE expr COLON expr RBRACE'
  expr_id = "bitslice." + GenUniqueID(parser)
  p[0] = BitSlice(p[1], p[3], p[5], expr_id)

def p_expr_select(p):
  'expr : expr QUEST expr COLON expr'
  expr_id = "select." + GenUniqueID(parser)
  p[0] = Select(p[1], p[3], p[5], expr_id)

def p_expr_increment(p):
  'expr : expr INC'
  expr_id = "unaryexpr." + GenUniqueID(parser)
  p[0] = UnaryExpr('INC', p[1], expr_id)

def p_expr_not(p):
  'expr : NOT expr'
  parse_unary('NOT', p)

def p_expr_neg(p):
  'expr : MINUS expr %prec NEG'
  parse_unary('-', p)

def p_expr_bitwise_not(p):
  'expr : BITWISE_NOT expr'
  parse_unary('~', p)

def p_expr_bitwise_and(p):
  'expr : expr BITWISE_AND expr'
  parse_binary('&', p)

def p_expr_bitwise_or(p):
  'expr : expr BITWISE_OR expr'
  parse_binary('|', p)

def p_expr_bitwise_xor(p):
  'expr : expr BITWISE_XOR expr'
  parse_binary('^', p)

def p_indirect_binary_op(p):
  'expr : expr OP expr'
  parse_binary(p[2], p)

def p_expr_plus(p):
  'expr : expr PLUS expr'
  parse_binary('+', p)

def p_expr_minus(p):
  'expr : expr MINUS expr'
  parse_binary('-', p)

def p_expr_times(p):
  'expr : expr TIMES expr'
  parse_binary('*', p)

def p_expr_div(p):
  'expr : expr DIV expr'
  parse_binary('/', p)

def p_expr_mod(p):
  'expr : expr MOD expr'
  parse_binary('%', p)

def p_expr_and(p):
  'expr : expr AND expr'
  parse_binary('AND', p)

def p_expr_or(p):
  'expr : expr OR expr'
  parse_binary('OR', p)

def p_expr_lshift(p):
  'expr : expr LSHIFT expr'
  parse_binary('<<', p)

def p_expr_rshift(p):
  'expr : expr RSHIFT expr'
  parse_binary('>>', p)

def p_expr_rshift_equal(p):
  'expr : expr RSHIFT_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='>>', a=p[1], b=p[3]))

def p_expr_lshift_equal(p):
  'expr : expr LSHIFT_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='<<', a=p[1], b=p[3]))

def p_expr_lshift_logical(p):
  'expr : expr LSHIFT_LOGICAL expr'
  parse_binary('<<<', p)

def p_expr_rshift_logical(p):
  'expr : expr RSHIFT_LOGICAL expr'
  parse_binary('>>>', p)

def p_expr_greater(p):
  'expr : expr GREATER expr'
  parse_binary('>', p)

def p_expr_less(p):
  'expr : expr LESS expr'
  parse_binary('<', p)

def p_expr_less_equal(p):
  'expr : expr LESS_EQUAL expr'
  parse_binary('<=', p)

def p_expr_greater_equal(p):
  'expr : expr GREATER_EQUAL expr'
  parse_binary('>=', p)

def p_expr_equal(p):
  'expr : expr EQUAL expr'
  parse_binary('==', p)

def p_expr_not_equal(p):
  'expr : expr NOT_EQUAL expr'
  parse_binary('!=', p)

def p_expr_wrapped(p):
  '''expr : LPAREN expr RPAREN
  '''
  p[0] = p[2]

def p_expr_var(p):
  'expr : ID'
  if p[1] in ['Vs', 'Vu', 'Vv', 'Vss', 'Vuu', 'Vvv']:
    expr_id = 'var.vec_src.' + GenUniqueID(parser)
  elif p[1] in ['Vd', 'Vdd']:
    expr_id = 'var.vec_dst.' + GenUniqueID(parser)
  elif p[1] in ['Vx', 'Vxx', 'Vy', 'Vyy']:
    expr_id = 'var.vec.' + GenUniqueID(parser)
  elif p[1] in ['Rs', 'Rt', 'Ru']:
    expr_id = 'var.reg_src.' + GenUniqueID(parser)
  elif p[1] == 'Rd':
    expr_id = 'var.reg_dst.' + GenUniqueID(parser)
  
  else:
    expr_id = "var." + GenUniqueID(parser)
  p[0] = Var(p[1], expr_id)

def p_expr_num(p):
  'expr : NUMBER'
  p[0] = Number(p[1])


# in increasing order
precedence = (
    ('left', 'BITWISE_OR'),
    ('left', 'BITWISE_AND'),
    ('left', 'BITWISE_XOR'),
    ('left', 'OR'),
    ('left', 'AND'),
    ('left', 'XOR'),
    ('left', 'EQUAL', 'NOT_EQUAL'),
    ('left', 'GREATER', 'LESS', 'GREATER_EQUAL', 'LESS_EQUAL'),
    ('left', 'LSHIFT', 'RSHIFT', 'LSHIFT_LOGICAL', 'RSHIFT_LOGICAL'),
    ('left', 'PLUS', 'MINUS'),
    ('left', 'TIMES', 'DIV', 'MOD'),
    ('right', 'NOT', 'NEG', 'BITWISE_NOT'),
    ('left', 'DOT', 'LPAREN', 'RPAREN', 'LBRACE', 'RBRACE',),
    ('nonassoc', 'COLON')
)

parser = yacc.yacc()

def ResetParser(parser):
  parser.id_counter = 0
  parser.binary_exprs = []

def Parse(src):
  ResetParser(parser)
  AST = parser.parse(src)
  return AST

from pprint import pformat

def pretty_print(root):
  def to_dict(root):
    if isinstance(root, tuple):
      out = dict(root._asdict())
      for elem, val in out.items():
        out[elem] = to_dict(val)
      return {type(root).__name__ : out}
    elif isinstance(root, list):
      out = list(map(to_dict, root))
      return out
    else:
      return root
  return pformat(to_dict(root), indent=1)

def ParseHVXSemantics(FileName):
  semantics = json.load(open(FileName, "r"))

  for inst, psuedocode in list(semantics.items()):

    # We currently ignore any instructions that are just assembler syntactic sugar
    if psuedocode.startswith("Assembler mapped to"):
      continue 
    # Still need to handle predicate functions/vectors
    if "vand" in inst:
      continue
    
    assign = Parse(inst)
    # print(assign)
    if isinstance(assign, list):
      assign = assign[0]
    

    # This is either an if statement or standard function call then
    if not isinstance(assign, Update):
      if isinstance(assign, Call):
        lhs = assign.args[0]
        rhs = assign
    else: 
      lhs = assign.lhs
      # += or *=
      if isinstance(assign.rhs, BinaryExpr):
        rhs = assign.rhs.b
      elif isinstance(assign.rhs, Call):
        rhs = assign.rhs

    # SIMD instruction
    if isinstance(lhs, TypeLookup):
      var = lhs.obj
    elif isinstance(lhs, Var):
      var = lhs
    else:
      print("Unknown lhs:", lhs)
    
    if var.name in ['Vx', 'Vy', 'Vd']:
      lanes = 1
    elif var.name in ['Vxx', 'Vyy', 'Vdd']:
      lanes = 2
    else:
      lanes = 0
      print("Unknown variable type:", var)
    
    name = rhs.func
    sema = Sema(intrin=name, inst="TODO", params=rhs.args, spec=Parse(psuedocode), rettype=var.id.split(".")[1], lanes=lanes)
    print(sema)
  return None


if __name__ == '__main__':
  ParseHVXSemantics("hexagon_sema.json")


