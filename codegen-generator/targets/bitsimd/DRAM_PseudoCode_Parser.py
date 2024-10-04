
from ply.lex import lex
from ply.yacc import yacc

from DRAM_AST import *


Parser = None
lexer = None
binary_regexp = None
tokens = None
precedence = None



def InitDRAMParser():
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
           ] + list(DRAMBinaryOps.values()) + list(DRAMReserved)
  binary_regexp = r'|'.join(DRAMBinaryOps)
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
  print("Initialize DRAM AP Parser")
  lexer = lex()
  Parser = yacc()




DRAMBinaryOps = {
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



def ResetParser(Parser):
  Parser.id_counter = 0
  Parser.binary_exprs = []

DRAMReserved = {
    'FOR',
    'ENDFOR',
    'RANGE',
    'IN',

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




def t_binary(t):
  r'\|=|\+=|<<<?|>>>?|\+|\-|\*|/(?!/)|<=|>=|<|>|==|!=|%|~|&(?!&)|\|(?!\|)'
  t.type = DRAMBinaryOps[t.value]
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


def t_ID(t):
  r'[a-zA-Z_][a-zA-Z_0-9]*'
  lexed = t.value.upper()
  if lexed in DRAMReserved:
    t.type = lexed
    t.value = lexed
  return t


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
  '''stmt : DEFINE ID LPAREN args RPAREN COLON stmts
  '''
  expr_id = "funcdef." + GenUniqueID(Parser)
  p[0] = FuncDef(p[2], p[4], p[7], expr_id)



def p_stmt_break(p):
  'stmt : BREAK'
  p[0] = Break()

def p_stmt_expr(p):
  'stmt : expr'
  p[0] = p[1]


def p_expr_assign(p):
  'expr : expr UPDATE expr'
  #expr_id = GenUniqueID(Parser)
  p[0] = Update(p[1], p[3])
  # print(p[0])



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

def p_expr_plus_equal(p):
  'expr : expr PLUS_EQUAL expr'
  p[0] = Update(p[1], new_binary_expr(p.Parser, op='+', a=p[1], b=p[3]))



def p_stmt_for(p):
  'stmt : FOR ID IN RANGE LPAREN NUMBER COMMA NUMBER COMMA NUMBER RPAREN COLON stmts ENDFOR'
  it_id = "iterator." + GenUniqueID(Parser)
  expr_id = "for." + GenUniqueID(Parser)
  lb_start = p[6]
  lb_end = p[8]
  lb_step = p[10]
  p[0] = For(Var(p[2], it_id), Number(lb_start) , Number(lb_end), Number(lb_step), p[13], True, expr_id)


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


InitDRAMParser()


def Parse(src):
  ResetParser(Parser)
  AST = Parser.parse(src)
  return AST

