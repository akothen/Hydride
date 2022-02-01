import ply.lex as lex
from HexAST import Number, Var


reserved = {
    'FOR',

    'IF',
    'ELSE',

    'WHILE',

    'BREAK',
    'NOP', 'OP',

    # 'AND', 'OR', 'XOR', 'NOT',
    }

binary_ops = {
    r'<<': 'LSHIFT',
    r'>>' : 'RSHIFT',
    r'<<=': 'LSHIFT_EQUAL',
    r'>>=': 'RSHIFT_EQUAL',
    r'<<<': 'LSHIFT_LOGICAL',
    r'>>>' : 'RSHIFT_LOGICAL',
    r'&&' : 'AND',
    r'||' : 'OR',
    r'\^' : 'XOR',


    r'+':  'PLUS',
    r'-':  'MINUS',

    r'+=': 'PLUS_EQUAL',
    r'-=': 'MINUS_EQUAL',
    r'|=': 'OR_EQUAL',
    r'&=': 'AND_EQUAL',
    r'^=': 'XOR_EQUAL',

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
    r'^': 'BITWISE_XOR'
    }

tokens = [
    'ID', 'TYPE', 'COMMENT', 'NUMBER',
    'LBRACE', 'RBRACE', 'COLON',
    'UPDATE', 'SEMICOLON',
    'LPAREN', 'RPAREN', 'COMMA',
    'DOT',
    'LBRACKET', 'RBRACKET',
    'QUEST',
    'MODULE',

    # unary ops
    'INC', 'DEC', 'NOT',

    # pseudo token
    'NEG'
    ] + list(binary_ops.values()) + list(reserved)

binary_regexp = r'|'.join(binary_ops)

def t_inc(t):
  r'\+\+'
  t.type = 'INC'
  return t
  
def t_dec(t):
  r'--'
  t.type = 'DEC'
  return t

def t_binary(t):
  r'&=|\^=|\|=|-=|\+=|>>=|<<=|<<<?|>>>?|\+|\-|\*|/(?!/)|<=|>=|<|>|==|!=|%|~|&(?!&)|\|(?!\|)|\^|&&|\|\||\^'
  t.type = binary_ops[t.value]
  return t

def t_not(t):
  r'!'
  t.type = 'NOT'
  return t

def t_and(t):
  r'&&'
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

def t_NOP(t):
  r'NOP'
  t.type = 'NOP'
  return t

def t_MODULE(t):
  r'vcmp'
  t.type = 'MODULE'
  return t

def t_TYPE(t):
  r'unsigned'
  t.type = 'TYPE'
  
  return t

def t_ID(t):
  r'[a-zA-Z_#][a-zA-Z_0-9]*'
  lexed = t.value.upper()
  if lexed in reserved:
    t.type = lexed
    t.value = lexed
  return t

def t_COMMENT(t):
  r'//.*'
  pass

# TODO: multiline comment?

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
t_SEMICOLON = r';'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_DOT = r'\.'
t_COMMA = r','
t_QUEST = r'\?'
t_ignore  = ' \t'

lexer = lex.lex()
if __name__ == '__main__':
  test_spec = '''
  Qx4&=vcmp.eq(Vu.b,Vv.b) ;
      '''
  lexer.input(test_spec)
  for token in iter(lexer.token, None):
    print(token.type, token.value)
