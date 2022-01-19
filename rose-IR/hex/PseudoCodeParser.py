
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

def p_stmt_semi(p):
  '''
  stmt : stmt SEMICOLON
  '''
  p[0] = p[1]

def p_stmts(p):
  '''stmts : stmt
           | stmts stmt
  '''
  if len(p) == 2:
    p[0] = [p[1]]
  else:
    p[0] = p[1] + [p[2]]

def p_stmt_break(p):
  'stmt : BREAK'
  p[0] = Break()

def p_stmt_expr(p):
  'stmt : expr'
  p[0] = p[1]

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


def p_stmt_for(p):
  'stmt : FOR LPAREN ID UPDATE expr SEMICOLON expr SEMICOLON expr RPAREN LBRACKET stmts RBRACKET'
  it_id = "iterator." + GenUniqueID(parser)
  expr_id = "for." + GenUniqueID(parser)
  p[0] = For(Var(p[3], it_id), p[5], p[7], p[12], True, expr_id)



def p_expr_call(p):
  'expr : ID LPAREN args RPAREN'
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1], p[3], expr_id)

def p_expr_call_no_args(p):
  'expr : ID LPAREN RPAREN'
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1], [], expr_id)

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
  parse_unary('INC', p)

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
  elif p[1] in ['Vx', 'Vxx']:
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
    ('left', 'OR'),
    ('left', 'AND'),
    ('left', 'XOR'),
    ('left', 'EQUAL', 'NOT_EQUAL'),
    ('left', 'GREATER', 'LESS', 'GREATER_EQUAL', 'LESS_EQUAL'),
    ('left', 'LSHIFT', 'RSHIFT', 'LSHIFT_LOGICAL', 'RSHIFT_LOGICAL'),
    ('left', 'PLUS', 'MINUS'),
    ('left', 'TIMES', 'DIV', 'MOD'),
    ('right', 'NOT', 'NEG', 'BITWISE_NOT'),
    ('left', 'DOT', 'LPAREN', 'RPAREN', 'LBRACE', 'RBRACE'),
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
  NumSkipped = 0
  SkippedInsts = set()
  Skipped = False
  #SkipTo = '_mm512_popcnt_epi16'
  SkipTo = None
  #debug = '_mm_sad_epu8'
  debug = None
  Categories = defaultdict(int)

  InstructionList = []
  for inst, psuedocode in list(semantics.items()):

    # Still need to handle predicate functions/vectors
    if "vand" in inst:
      continue
    
    assign = Parse(inst)
    # SIMD instruction
    if isinstance(assign.lhs, TypeLookup):
      var = assign.lhs.obj
    elif isinstance(assign.lhs, Var):
      var = assign.lhs
    else:
      print("Unknown lhs:", assign.lhs)
    
    if var.name in ['Vx', 'Vd']:
      lanes = 1
    elif var.name in ['Vxx', 'Vdd']:
      lanes = 2
    else:
      print("Unknown variable type:", var)

    # += or *=
    if isinstance(assign.rhs, BinaryExpr):
      rhs = assign.rhs.b
    elif isinstance(assign.rhs, Call):
      rhs = assign.rhs
    
    name = rhs.func
    sema = Sema(intrin=name, inst="TODO", params=rhs.args, spec=Parse(psuedocode), rettype=var.id.split(".")[1])
    print(sema)
  return None

  for intrin in DataRoot.iter('intrinsic'):
    cpuid = intrin.find('CPUID')
    operation = intrin.find('operation') 
    inst = intrin.find('instruction')
    inst_form = None
    if inst is None:
      Categories['NO-INST'] += 1
      NumSkipped += 1
      continue

    if debug and intrin.attrib['name'] != debug:
      NumSkipped += 1
      continue

    inst_form = inst.attrib['name'], inst.attrib.get('form')
    cpuid_text = 'Unknown'
    if cpuid is not None:
      if cpuid.text in ('MMX', 'AES', 'SHA', 'MPX', 'KNCNI', 
          'AVX512_4FMAPS', 'AVX512_BF16',
          'INVPCID', 'RTM', 'XSAVE', 
          'FSGSBASE', 'RDRAND', 'RDSEED'):
        Categories[cpuid.text] += 1
        NumSkipped += 1
        continue
      cpuid_text = cpuid.text

    if (intrin.attrib['name'].endswith('getcsr') or
        intrin.attrib['name'].endswith('setcsr') or
        '_cmp_' in intrin.attrib['name'] or
        'zeroall' in intrin.attrib['name'] or
        'zeroupper' in intrin.attrib['name'] or
        intrin.attrib['name'] == '_mm_sha1rnds4_epu32' or
        'mant' in intrin.attrib['name'] or
        'ord' in intrin.attrib['name'] or
        '4dpwss' in intrin.attrib['name'] or
        'ternarylogic' in intrin.attrib['name'] or
        #'cvt' in intrin.attrib['name'] or
        intrin.attrib['name'].startswith('_bit') or
        intrin.attrib['name'] in ('_rdpmc', '_rdtsc') or
        'lzcnt' in intrin.attrib['name'] or
        'popcnt' in intrin.attrib['name']
        ):
      if 'mask' in intrin.attrib['name']:
        Categories['mask'] += 1
      else:
        Categories['zero/fp-manip'] += 1
      NumSkipped += 1
      continue
    cat = intrin.find('category')
    if cat is not None and cat.text in (
        'Elementary Math Functions', 
        'General Support', 
        'Load', 'Store'):
      NumSkipped += 1
      Categories[cat.text] += 1
      continue
    if SkipTo is not None and not Skipped:
      if intrin.attrib['name'] != SkipTo:
        NumSkipped += 1
        continue
      else:
        Skipped = True
    if operation is not None and (
        'MEM' in operation.text or
        'FP16' in operation.text or
        'Float16' in operation.text or
        'MOD2' in operation.text or
        'affine_inverse_byte' in operation.text or
        'ShiftRows' in operation.text or
        'MANTISSA' in operation.text or
        'ConvertExpFP' in operation.text or
        '<<<' in operation.text or
        ' MXCSR ' in operation.text or
        'ZF' in operation.text or
        'CF' in operation.text or
        'NaN' in operation.text or 
        'CheckFPClass' in operation.text or
        'ROUND' in operation.text or
        'carry_out' in operation.text or
        'SignBit' in operation.text or
        'SSP' in operation.text):
      Categories['MISC'] += 1
      NumSkipped += 1
      continue
    if 'str' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      NumSkipped += 1
      Categories['STR'] += 1
      continue

    if 'fixup' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      Categories['fp-manip'] += 1
      NumSkipped += 1
      continue
    if 'round' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      Categories['fp-manip'] += 1
      NumSkipped += 1
      continue
    if 'prefetch' in intrin.attrib['name']:
      if inst is not None:
        SkippedInsts.add(inst_form)
      NumSkipped += 1
      Categories['PREFETCH'] += 1
      continue

    if inst is not None and operation is not None:
      InstructionList.append(intrin)

  
  print("NUM SKIPPED INSTRUCTIONS:")
  print(NumSkipped)


if __name__ == '__main__':
  ParseHVXSemantics("hexagon_sema.json")


