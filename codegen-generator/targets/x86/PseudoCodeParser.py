###################################################################
#
# Pseudocode Parser for x86 ISA semantics.
#
###################################################################


import xml.etree.ElementTree as ET
from x86AST import *
from x86Types import *


def ParseX86Intructions(XMLFileName : str):
  # Intializing x86 parser
  InitX86Parser()
  # Collect all x86 instuctions semantics
  SemaList = list()
  DataRoot = ET.parse(XMLFileName)
  for Node in DataRoot.iter('intrinsic'):
    SemaList.append(GetSemaFromXML(Node))
  print("SemaList lngth:")
  print(len(SemaList))
  return SemaList


def ParseX86Instruction(InstName : str, XMLFileName : str):
  # Intializing x86 parser
  InitX86Parser()
  # Collect all x86 instuctions semantics
  SemaList = list()
  DataRoot = ET.parse(XMLFileName)
  for Node in DataRoot.iter('intrinsic'):
    Sema = GetSemaFromXML(Node, InstName)
    if Sema == None:
      continue
    SemaList.append(Sema)
    break
  print("InstName:")
  print(InstName)
  print("SemaList lngth:")
  print(len(SemaList))
  if len(SemaList) == 1:
    return SemaList
  assert len(SemaList) == 0
  return None


def GetSemaFromXML(node, InstName : str = None):
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
    if "__mmask" in type:
      is_mask = True
    else:
      is_mask = False
    id = "param" + "." + name + "." + str(ID)
    Params.append(Parameter(name, type, is_signed, is_imm, is_mask, id))
    ID += 1

  def ParseCpuId(CPUID):
    CPUID = CPUID.text.lower().replace('_', '')
    if '/' in CPUID:
        return CPUID.split('/')[0]
    return CPUID
  
  CheckInstName = node.attrib['name']
  print(CheckInstName)
  if InstName != None:
    if CheckInstName == None:
      return None
    if InstName != CheckInstName:
      return None
  CPUIDs = [ParseCpuId(cpuid) for cpuid in node.findall('CPUID')]
  #assert (inst is not None)
  inst = node.find('instruction')
  operation = node.find('operation')
  assert (operation is not None)
  spec = Parse(operation.text)
  output = node.find('return')
  assert (output is not None)
  return Sema(
      intrin=node.attrib['name'],
      inst= None if inst is None else inst.attrib.get('name'),
      spec=spec,
      params=Params,
      rettype=output.attrib['type'],
      ret_is_signed=node.find('return').attrib.get('etype', '').startswith('SI'),
      extensions=CPUIDs,
      inst_form = None if inst is None else inst.attrib.get('form', ''),
      imm_width=imm_width,
      elem_type=output.find('etype'), #output.attrib['etype'],
      xed = None if inst is None else inst.attrib.get('xed')
    )



########## PSEUDOCODE PARSER

import ply.yacc as yacc
import ply.lex as lex

Parser = None
lexer = None
binary_regexp = None
tokens = None
precedence = None


def InitX86Parser():
  global Parser 
  global lexer
  global binary_regexp
  global tokens
  global precedence
  # Initialize the tokens
  tokens = [
             'PSEUDO', 'ID', 'COMMENT', 'DE', 'NUMBER',
             'LBRACE', 'RBRACE', 'COLON',
             'UPDATE', 'SEMICOLON',
             'LPAREN', 'RPAREN', 'COMMA',
             'DOT',
             'LBRACKET', 'RBRACKET',
             'MATRIX_ROW', 'MATRIX_DIM',
             'QUEST',
             'CASE_HEADER',
             'NEG'
           ] + list(x86BinaryOps.values()) + list(x86Reserved)
  binary_regexp = r'|'.join(x86BinaryOps)
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
      ('left', 'MATRIX_ROW', 'MATRIX_DIM'),
  )
  print("INTIALIZE PARSER")
  lexer = lex.lex()
  Parser = yacc.yacc()


def ResetParser(Parser):
  Parser.id_counter = 0
  Parser.binary_exprs = []

def Parse(src):
  ResetParser(Parser)
  AST = Parser.parse(src)
  return AST


############ LEXER

x86Reserved = {
    'FOR',
    'ENDFOR',

    'CASE',
    'OF',
    'ESAC',

    'IF',
    'THEN',
    'ELSE',
    'ELSEIF',
    'FI',

    'DO',
    'WHILE',
    'OD',

    'TO',
    'DOWNTO',

    'BREAK',

    'RETURN',
    'DEFINE',

    'OP',

    'AND', 'OR', 'XOR', 'NOT',
    }

x86BinaryOps = {
    r'<<': 'LSHIFT',
    r'>>' : 'RSHIFT',
    r'<<<': 'LSHIFT_LOGICAL',
    r'>>>' : 'RSHIFT_LOGICAL',

    r'+':  'PLUS',
    r'-':  'MINUS',

    r'+=': 'PLUS_EQUAL',
    r'|=': 'OR_EQUAL',

    r'*':  'TIMES',
    r'/':  'DIV',
    r'%':  'MOD',

    r'<': 'LESS',
    r'>': 'GREATER',
    r'<=': 'LESS_EQUAL',
    r'>=': 'GREATER_EQUAL',

    r'==': 'EQUAL',
    r'!=': 'NOT_EQUAL',

    r'~':  'BITWISE_NOT',

    r'&':  'BITWISE_AND',
    r'|':  'BITWISE_OR',
    }


def t_pseudo(t):
  r'\n\s*//.*'
  lexed = t.value 
  t.value = lexed[lexed.index('/') + 2:]
  t.type = 'PSEUDO'
  return t

def t_CASE_HEADER(t):
  r'\n\s*\d+:|\n\s*DEFAULT:|\n\s*[a-zA-Z_][a-zA-Z_0-9]*:'
  if t.value.strip().startswith('DEFAULT'):
    t.value = None
  else:
    try:
      value = int(t.value[:-1])
      t.value = Number(value)
    except:
      t.value = Var(t.value[:-1])
  return t

def t_binary(t):
  r'\|=|\+=|<<<?|>>>?|\+|\-|\*|/(?!/)|<=|>=|<|>|==|!=|%|~|&(?!&)|\|(?!\|)'
  t.type = x86BinaryOps[t.value]
  return t

def t_not(t):
  r'!'
  t.type = 'NOT'
  return t

def t_and(t):
  r'&&'
  # todo: KUNAL — the above line caused problems at some point and was fixed by the line below
  # r'&&|and|AND'
  t.type = 'AND'
  return t

def t_or(t):
  r'\|\|'
  t.type = 'OR'
  return t

# pseudo code
def t_PSEUDO(t):
  r'\*.*\*'
  t.value = t.value[1:-1]
  return t

def t_ID(t):
  r'[a-zA-Z_][a-zA-Z_0-9]*'
  lexed = t.value.upper()
  if lexed in x86Reserved:
    t.type = lexed
    t.value = lexed
  if lexed in {'ROWS', 'COLSB'}:
    t.type = 'MATRIX_DIM'
  if lexed in {'ROW'}:
    t.type = 'MATRIX_ROW'
  return t

def t_COMMENT(t):
  r'//.*|;'
  pass

# TODO: multiline comment?

def t_DE(t):
  r'\#DE'
  pass

def t_NUMBER(t):
  r'\d+\.\d*|0x[0-9a-fA-F]+|\d+'
  base = 16 if t.value.startswith('0x') else 10
  try:
    t.value = int(t.value, base)
  except:
    t.value = float(t.value)
  return t

def t_newline(t):
  r'\n|\\\n'
  t.lexer.lineno += 1

def t_error(t):
  raise SyntaxError('Lexer error')



t_LBRACE = r'\['
t_RBRACE = r'\]'
t_LBRACKET = r'{'
t_RBRACKET = r'}'
t_COLON = r':'
t_UPDATE = r'←|=|:='
t_SEMICOLON = ';'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_DOT = r'\.'
t_COMMA = r','
t_QUEST = r'\?'
t_ignore  = ' \t'



########### PARSING RULES


# Expressions have unique IDs
def GenUniqueID(Parser):
  ID = Parser.id_counter
  Parser.id_counter += 1
  return str(ID)


def new_binary_expr(Parser, op, a, b):
  expr_id = "binexpr." + GenUniqueID(Parser)
  expr = BinaryExpr(op, a, b, expr_id)
  Parser.binary_exprs.append(expr)
  return expr

def parse_binary(op, p):
  p[0] = new_binary_expr(Parser, op, p[1], p[3])

def parse_unary(op, p):
  expr_id = "unaryexpr." + GenUniqueID(Parser)
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
  expr_id = "funcdef." + GenUniqueID(Parser)
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
  expr_id = "match." + GenUniqueID(Parser)
  p[0] = Match(p[2], p[4], expr_id)

def p_single_case(p):
  '''cases : CASE_HEADER stmts
           | cases CASE_HEADER stmts
  '''
  expr_id = "case." + GenUniqueID(Parser)
  if len(p) == 3:
    p[0] = [Case(p[1], p[2], expr_id)]
  else:
    p[0] = p[1] + [Case(p[2], p[3], expr_id)]

def p_return(p):
  'stmt : RETURN expr'
  expr_id = GenUniqueID(Parser)
  p[0] = Return(p[2], expr_id)

def p_expr_assign(p):
  'expr : expr UPDATE expr'
  #expr_id = GenUniqueID(Parser)
  p[0] = Update(p[1], p[3])
  # print(p[0])

#def p_expr_assign_op(p):
#  'expr : OP UPDATE ID'
#  p[0] = OpUpdate(p[3])

def p_expr_plus_equal(p):
  'expr : expr PLUS_EQUAL expr'
  #expr_id = GenUniqueID(Parser)
  p[0] = Update(p[1], new_binary_expr(p.Parser, op='+', a=p[1], b=p[3]))

def p_expr_or_equal(p):
  'expr : expr OR_EQUAL expr'
  #expr_id = GenUniqueID(Parser)
  p[0] = Update(p[1], new_binary_expr(p.Parser, op='|', a=p[1], b=p[3]))

def p_stmt_while(p):
  'stmt : DO WHILE expr stmts OD'
  expr_id = "while." + GenUniqueID(Parser)
  p[0] = While(p[3], p[4], expr_id)

def p_stmt_for(p):
  'stmt : FOR ID UPDATE loopbound stmts ENDFOR'
  it_id = "iterator." + GenUniqueID(Parser)
  expr_id = "for." + GenUniqueID(Parser)
  lb_lhs, lb_rhs = p[4]
  p[0] = For(Var(p[2], it_id), lb_lhs, lb_rhs, p[5], True, expr_id)
  # print(p[0])

def p_stmt_for_dec(p):
  'stmt : FOR ID UPDATE expr DOWNTO expr stmts ENDFOR'
  it_id = "iterator." + GenUniqueID(Parser)
  expr_id = "for." + GenUniqueID(Parser)
  p[0] = For(Var(p[2], it_id), p[4], p[6], p[7], False, expr_id)

def p_expr_loop_bound0(p):
  'loopbound : expr TO NUMBER'
  p[0] = (p[1], Number(p[3]))

def p_expr_loop_bound1(p):  # AMX
  'loopbound : expr TO ID DOT MATRIX_DIM MINUS NUMBER'
  expr_id = "var." + GenUniqueID(Parser)
  tile = Var(p[3], expr_id)
  rhs = MatrixDimLookup(tile, p[5])
  rhs = new_binary_expr(Parser, '-',  rhs, Number(p[7]))
  lhs = p[1]
  p[0] = (lhs, rhs)

def p_expr_loop_bound2(p):  # AMX
  'loopbound : expr TO LPAREN ID DOT MATRIX_DIM DIV NUMBER RPAREN MINUS NUMBER'
  expr_id = "var." + GenUniqueID(Parser)
  tile = Var(p[4], expr_id)
  rhs = MatrixDimLookup(tile, p[6])
  rhs = new_binary_expr(Parser, '/', rhs, Number(p[8]))
  rhs = new_binary_expr(Parser, '-', rhs, Number(p[11]))
  lhs = p[1]
  p[0] = (lhs, rhs)

def p_expr_loop_bound3(p):
  'loopbound : expr TO ID MINUS NUMBER'
  expr_id = "var." + GenUniqueID(Parser)
  rhs = new_binary_expr(Parser, '-', Var(p[3], expr_id), Number(p[5]))
  lhs = p[1]
  p[0] = (lhs, rhs)

def p_expr_loop_bound4(p):
  'loopbound : expr TO LPAREN ID MINUS NUMBER RPAREN'
  expr_id = "var." + GenUniqueID(Parser)
  rhs = new_binary_expr(Parser, '-', Var(p[4], expr_id), Number(p[6]))
  lhs = p[1]
  p[0] = (lhs, rhs)

def p_expr_loop_bound5(p):
  'loopbound : expr TO ID'
  expr_id = "var." + GenUniqueID(Parser)
  rhs = Var(p[3], expr_id)
  lhs = p[1]
  p[0] = (lhs, rhs)

def p_stmt_if(p):
  'stmt : IF expr THEN stmts FI'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = If(p[2], p[4], expr_id)

def p_stmt_if2(p):
  'stmt : IF expr THEN stmts ELSE stmts FI'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = IfElse(p[2], p[4], p[6], expr_id)

def p_stmt_if3(p):
  'stmt : IF expr FI'
  p[0] = None

def p_stmt_if_elseif_else(p):
  'stmt : IF expr THEN stmts ELSEIF expr THEN stmts ELSE stmts FI'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = IfElseIfElse(p[2], p[4], p[6], p[8], p[10], expr_id)

def p_stmt_if_no_then(p):
  'stmt : IF expr stmts FI'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = If(p[2], p[3], expr_id)

def p_stmt_if2_no_then(p):
  'stmt : IF expr stmts ELSE stmts FI'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = IfElse(p[2], p[3], p[5], expr_id)

def p_stmt_if2_no_then_no_fi(p):
  'stmt : IF expr stmts ELSE stmts'
  expr_id = "if." + GenUniqueID(Parser)
  p[0] = IfElse(p[2], p[3], p[5], expr_id)

def p_expr_call(p):
  'expr : ID LPAREN args RPAREN'
  expr_id = "call." + GenUniqueID(Parser)
  p[0] = Call(p[1], p[3], expr_id)

def p_expr_call_no_args(p):
  'expr : ID LPAREN RPAREN'
  expr_id = "call." + GenUniqueID(Parser)
  p[0] = Call(p[1], [], expr_id)

def p_expr_type_lookup(p):
  'expr : expr DOT ID'
  assert p[3] in x86Types, f"Unrecognized TypeLookup to `{p[3]}`"
  p[0] = TypeLookup(p[1], p[3])


def p_expr_matrix_dim_lookup(p):
  'expr : expr DOT MATRIX_DIM'
  p[0] = MatrixDimLookup(p[1], p[3])


def p_expr_matrix_row_lookup(p):
  'expr : expr DOT MATRIX_ROW LBRACE expr RBRACE'
  expr_id = "row." + GenUniqueID(Parser)
  p[0] = MatrixRowLookup(p[1], p[5], expr_id)


def p_args(p):
  '''args : expr
        | args COMMA expr
  '''
  #expr_id = GenUniqueID(Parser)
  if len(p) == 2:
    p[0] = [p[1]] #[Arg(p[1], expr_id)]
  else:
    p[0] = p[1] + [p[3]] #[Arg(p[3], expr_id)]

def p_expr_bit_index(p):
  'expr : expr LBRACE expr RBRACE'
  expr_id = "index." + GenUniqueID(Parser)
  p[0] = BitIndex(p[1], p[3], expr_id)

def p_expr_bit_slice(p):
  'expr : expr LBRACE expr COLON expr RBRACE'
  expr_id = "bitslice." + GenUniqueID(Parser)
  p[0] = BitSlice(p[1], p[3], p[5], expr_id)

def p_expr_select(p):
  'expr : expr QUEST expr COLON expr'
  expr_id = "select." + GenUniqueID(Parser)
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
  expr_id = "var." + GenUniqueID(Parser)
  p[0] = Var(p[1], expr_id)

def p_expr_num(p):
  'expr : NUMBER'
  p[0] = Number(p[1])


