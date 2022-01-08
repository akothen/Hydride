
import ply.yacc as yacc
from lex import tokens
import xml.etree.ElementTree as ET
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

def p_stmts(p):
  '''stmts : stmt
           | stmts stmt
  '''
  if len(p) == 2:
    p[0] = [p[1]]
  else:
    p[0] = p[1] + [p[2]]

def p_func_decl(p):
  '''stmt : DEFINE ID LPAREN args RPAREN LBRACKET stmts RBRACKET
  '''
  expr_id = "funcdef." + GenUniqueID(parser)
  p[0] = FuncDef(p[2], p[4], p[7], expr_id)

def p_stmt_break(p):
  'stmt : BREAK'
  p[0] = Break()

def p_stmt_expr(p):
  'stmt : expr'
  p[0] = p[1]

def p_match(p):
  '''stmt : CASE expr OF cases ESAC
  '''
  expr_id = "match." + GenUniqueID(parser)
  p[0] = Match(p[2], p[4], expr_id)

def p_single_case(p):
  '''cases : CASE_HEADER stmts
           | cases CASE_HEADER stmts
  '''
  expr_id = "case." + GenUniqueID(parser)
  if len(p) == 3:
    p[0] = [Case(p[1], p[2], expr_id)]
  else:
    p[0] = p[1] + [Case(p[2], p[3], expr_id)]

def p_return(p):
  'stmt : RETURN expr'
  expr_id = GenUniqueID(parser)
  p[0] = Return(p[2], expr_id)

def p_expr_assign(p):
  'expr : expr UPDATE expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], p[3])

#def p_expr_assign_op(p):
#  'expr : OP UPDATE ID'
#  p[0] = OpUpdate(p[3])

def p_expr_plus_equal(p):
  'expr : expr PLUS_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='+', a=p[1], b=p[3]))

def p_expr_or_equal(p):
  'expr : expr OR_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='|', a=p[1], b=p[3]))

def p_stmt_while(p):
  'stmt : DO WHILE expr stmts OD'
  expr_id = "while." + GenUniqueID(parser)
  p[0] = While(p[3], p[4], expr_id)

def p_stmt_for(p):
  'stmt : FOR ID UPDATE expr TO expr stmts ENDFOR'
  it_id = "iterator." + GenUniqueID(parser)
  expr_id = "for." + GenUniqueID(parser)
  p[0] = For(Var(p[2], it_id), p[4], p[6], p[7], True, expr_id)

def p_stmt_for_dec(p):
  'stmt : FOR ID UPDATE expr DOWNTO expr stmts ENDFOR'
  it_id = "iterator." + GenUniqueID(parser)
  expr_id = "for." + GenUniqueID(parser)
  p[0] = For(Var(p[2], it_id), p[4], p[6], p[7], False, expr_id)

def p_stmt_if(p):
  'stmt : IF expr THEN stmts FI'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[4], [], expr_id)

def p_stmt_if2(p):
  'stmt : IF expr THEN stmts ELSE stmts FI'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[4], p[6], expr_id)

def p_stmt_if_no_then(p):
  'stmt : IF expr stmts FI'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[3], [], expr_id)

def p_stmt_if2_no_then(p):
  'stmt : IF expr stmts ELSE stmts FI'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[3], p[5], expr_id)

def p_stmt_if2_no_then_no_fi(p):
  'stmt : IF expr stmts ELSE stmts'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[3], p[5], expr_id)


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
  p[0] = Index(p[1], p[3], expr_id)

def p_expr_bit_slice(p):
  'expr : expr LBRACE expr COLON expr RBRACE'
  expr_id = "bitslice." + GenUniqueID(parser)
  p[0] = BitSlice(p[1], p[3], p[5], expr_id)

def p_expr_select(p):
  'expr : expr QUEST expr COLON expr'
  expr_id = "select." + GenUniqueID(parser)
  p[0] = Select(p[1], p[3], p[5], expr_id)

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

def p_expr_xor(p):
  'expr : expr XOR expr'
  parse_binary('XOR', p)

def p_expr_wrapped(p):
  '''expr : LPAREN expr RPAREN
  '''
  p[0] = p[2]

def p_expr_var(p):
  'expr : ID'
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


def ParseCpuId(CPUID):
    CPUID = CPUID.text.lower().replace('_', '')
    if '/' in CPUID:
        return CPUID.split('/')[0]
    return CPUID


def GetSemaFromXML(node):
    Params = []
    imm_width = None
    ID = 0
    for param_node in node.findall('parameter'):
      name = param_node.attrib.get('varname', '')
      type = param_node.attrib['type']
      if name == '':
          continue
      is_signed = param_node.attrib.get('etype', '').startswith('SI')
      is_imm = param_node.attrib.get('etype') == 'IMM'
      if is_imm:
          imm_width = int(param_node.attrib.get('immwidth', '8'))
      id = "param" + "." + name + "." + str(ID)
      Params.append(Parameter(name, type, is_signed, is_imm, id))
      ID += 1
    CPUIDs = [ParseCpuId(cpuid) for cpuid in node.findall('CPUID')]
    inst = node.find('instruction')
    assert (inst is not None)
    operation = node.find('operation')
    assert (operation is not None)
    spec = Parse(operation.text)
    output = node.find('return')
    assert (output is not None)
    return Sema(
        intrin=node.attrib['name'],
        inst=inst.attrib.get('name'),
        spec=spec,
        params=Params,
        rettype=output.attrib['type'],
        cpuids=CPUIDs,
        inst_form=inst.attrib.get('form', ''),
        imm_width=imm_width,
        elem_type=output.attrib['etype'],
        xed=inst.attrib.get('xed')
      )


def Parsex86Semantics(FileName):
  DataRoot = ET.parse(FileName)
  NumSkipped = 0
  SkippedInsts = set()
  Skipped = False
  #SkipTo = '_mm512_popcnt_epi16'
  SkipTo = None
  #debug = '_mm_sad_epu8'
  debug = None
  Categories = defaultdict(int)

  InstructionList = []
  for intrin in DataRoot.iter('intrinsic'):
    cpuid = intrin.find('CPUID')
    operation = intrin.find('operation') 
    inst = intrin.find('instruction')
    inst_form = None
    if inst is None:
      Categories['NO-INST'] += 1
      continue

    if debug and intrin.attrib['name'] != debug:
      continue

    inst_form = inst.attrib['name'], inst.attrib.get('form')
    cpuid_text = 'Unknown'
    if cpuid is not None:
      if cpuid.text in ('MMX', 'AES', 'SHA', 'MPX', 'KNCNI', 
          'AVX512_4FMAPS', 'AVX512_BF16',
          'INVPCID', 'RTM', 'XSAVE', 
          'FSGSBASE', 'RDRAND', 'RDSEED'):
        Categories[cpuid.text] += 1
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
      continue
    cat = intrin.find('category')
    if cat is not None and cat.text in (
        'Elementary Math Functions', 
        'General Support', 
        'Load', 'Store'):
      Categories[cat.text] += 1
      continue
    if SkipTo is not None and not Skipped:
      if intrin.attrib['name'] != SkipTo:
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

  # Parse every instruction
  for Instruction in InstructionList:
    Sema = GetSemaFromXML(Instruction)
    print(Sema)
    print(Sema.intrin, Sema.cpuids, flush=True)
  print("NUM SKIPPED INSTRUCTIONS:")
  print(NumSkipped)


if __name__ == '__main__':
  Parsex86Semantics("intel_sema.xml")


