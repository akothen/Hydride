import ply.lex as lex
import ply.yacc as yacc

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

AslReserved = {
    'FOR', 'TO',
    'IF',
    'THEN',
    'ELSE',
    'ELSIF',
    'WHILE',
    'BREAK',
    'CASE', 'OF', 'WHEN',
    'NOP', 'OP',
    'TRUE', 'FALSE',
    # 'AND', 'OR', 'NOT', 'EOR',
    '__INSTRUCTION',
    '__ENCODING',
    '__INSTRUCTION_SET',
    '__FIELD',
    '__OPCODE',
    '__GUARD',
    '__DECODE',
    '__EXECUTE',
    '__CONDITIONAL',
    '__UNPREDICTABLE_UNLESS', 'UNPREDICTABLE'
    }

AslBinaryOps = {
    r'<<': 'LSHIFT',
    r'>>' : 'RSHIFT',
    r'<<=': 'LSHIFT_EQUAL',
    r'>>=': 'RSHIFT_EQUAL',
    r'<<<': 'LSHIFT_LOGICAL',
    r'>>>' : 'RSHIFT_LOGICAL',
    r'&&' : 'AND',
    r'||' : 'OR',
    r'EOR' : 'XOR',


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
    'ID', 'STRING', 'TYPE', 'COMMENT', 'NUMBER',
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
    ] + list(AslBinaryOps.values()) + list(AslReserved)
binary_regexp = r'|'.join(AslBinaryOps)

  # in increasing order
precedence = (
    ('right', 'UPDATE'),
    ('right', 'QUEST'),
    ('left', 'COLON'),
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
    ('left', 'DOT', 'LPAREN', 'RPAREN'),
    ('left', 'LBRACE', 'RBRACE',),   
)

def t_string(t):
    r"'([^'])*'"
    t.type = 'STRING'
    return t

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
  t.type = AslBinaryOps[t.value]
  return t

def t_not(t):
  r'!|NOT'
  t.type = 'NOT'
  return t

def t_and(t):
  r'&&|AND'
  t.type = 'AND'
  return t

def t_or(t):
  r'\|\||OR'
  t.type = 'OR'
  return t


# # pseudo code
# def t_PSEUDO(t):
#   r'\*.*\*'
#   t.value = t.value[1:-1]
#   return t

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
  if lexed in AslReserved:
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
    print("Bad character '%s'" % t.value[0])
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
t_ignore  = ' '

def p_list(p):
    '''declerations : declerations decleration
        | decleration

       encodings : encodings encoding
        | encoding
       
       fields : fields field
        | field
        
       unpredictables : unpredictables unpredictable
        | unpredictable
        | expr_empty'''
    if len(p) < 3:
        p[0] = [p[1]]
    else:
        p[0] = p[1] + [p[2]]

def p_decleration(p):
    '''decleration : instruction_defn'''
    p[0] = p[1]

def p_instruction_defn(p):
    '''instruction_defn : __INSTRUCTION ID encodings __EXECUTE __CONDITIONAL stmts'''
    p[0] = [p[2], p[3], p[6]]

def p_encoding(p):
    '''encoding : __ENCODING ID __INSTRUCTION_SET ID fields __OPCODE STRING __GUARD expr unpredictables __DECODE stmts'''
    p[0] = [p[1], p[5]]

def p_unpredictable(p):
    '''unpredictable : __UNPREDICTABLE_UNLESS expr'''

def p_field(p):
    '''field : __FIELD ID NUMBER PLUS COLON NUMBER'''
    p[0] = [p[2], p[3], p[6]]

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

def p_tuple_assign(p):
  'stmt : expr COMMA expr UPDATE expr'
  p[0] = Update([p[1], p[3]], p[5])

def p_expr_plus_equal(p):
  'expr : expr PLUS_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='+', a=p[1], b=p[3]))

def p_expr_minus_equal(p):
  'expr : expr MINUS_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='-', a=p[1], b=p[3]))

def p_expr_or_equal(p):
  'expr : expr OR_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='|', a=p[1], b=p[3]))

def p_expr_xor_equal(p):
  'expr : expr XOR_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  print("here--")
  p[0] = Update(p[1], new_binary_expr(p.parser, op='^', a=p[1], b=p[3]))

def p_expr_and_equal(p):
  'expr : expr AND_EQUAL expr'
  #expr_id = GenUniqueID(parser)
  p[0] = Update(p[1], new_binary_expr(p.parser, op='&', a=p[1], b=p[3]))

def p_expr_empty(p):
  '''expr_empty : expr 
              | '''
  if len(p) == 2:
    p[0] = p[1]
  else:
    p[0] = None

def p_stmt_if(p):
  '''stmt : IF expr THEN stmts
     expr : IF expr THEN stmts'''
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[4], None, expr_id)

def p_stmt_if_else(p):
  '''stmt : IF expr THEN stmts ELSE stmts
     expr : IF expr THEN stmts ELSE stmts'''
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[2], p[4], p[6], expr_id)

# Try to detect the common case
def HandleLoopHeader(Init, Condition, ItUpdate):
  print("Init:")
  print(Init)
  print("Condition:")
  print(Condition)
  print("ItUpdate:")
  print(ItUpdate)
  # Check if Init is just an update.
  Iterator = None
  Begin = None
  End = None
  Step = None
  if type(Init) == Update:
    assert type(Init.lhs) == Var
    expr_id = "iterator." + GenUniqueID(parser)
    Iterator = Var(Init.lhs.name, expr_id)
    assert type(Init.rhs) == Number or type(Init.rhs) == BinaryExpr
    if type(Init.rhs) == BinaryExpr:
      # The only time this happens is VWIDTH >> 1
      assert(Init.rhs.a == Number(128) and Init.rhs.b == Number(1) and Init.rhs.op == '>>')
      Begin = 64 # 128 >> 1
    else:
      Begin = Init.rhs
  if type(Condition) == BinaryExpr:
    if Condition.op == "<":
      assert type(Condition.a) == Var
      assert Iterator.name == Condition.a.name
      assert type(Condition.b) == Number \
          or type(Condition.b) == Var
      End = Condition.b
  if type(ItUpdate) ==  UnaryExpr:
    assert ItUpdate.op == "INC" or ItUpdate.op == "DEC"
    assert type(ItUpdate.a) == Var
    assert Iterator.name == ItUpdate.a.name
    if ItUpdate.op == "INC":
      Step = Number(1)
    else:
      Step = Number(-1)
  elif type(ItUpdate) == Update:
    if Iterator != None:
      assert type(ItUpdate.lhs) == Var
      assert Iterator.name == ItUpdate.lhs.name
      assert type(ItUpdate.rhs) == BinaryExpr
      assert type(ItUpdate.rhs.a) == Var
      assert Iterator.name == ItUpdate.rhs.a.name
      assert type(ItUpdate.rhs.b) == Number
      Step = ItUpdate.rhs.b
  return Iterator, Begin, End, Step


def p_stmt_for(p):
  'stmt : FOR LPAREN expr_empty SEMICOLON expr_empty SEMICOLON expr_empty RPAREN LBRACKET stmts RBRACKET'
  expr_id = "for." + GenUniqueID(parser)
  Iterator, Begin, End, Step = HandleLoopHeader(p[3], p[5], p[7])
  if Iterator == None or Begin == None or End == None or Step == None:
    p[0] = ComplexFor(p[3], p[5], p[7], p[10], expr_id)
  else:
    p[0] = For(Iterator, Begin, End, Step, p[10], expr_id)


def p_stmt_for_single(p):
  'stmt : FOR LPAREN expr_empty SEMICOLON expr_empty SEMICOLON expr_empty RPAREN stmt'
  expr_id = "for." + GenUniqueID(parser)
  Iterator, Begin, End, Step = HandleLoopHeader(p[3], p[5], p[7])
  if Iterator == None or Begin == None or End == None or Step == None:
    p[0] = ComplexFor(p[3], p[5], p[7], [p[9]], expr_id)
  else:
    p[0] = For(Iterator, Begin, End, Step, [p[9]], expr_id)


def p_expr_call(p):
  '''expr : ID LPAREN args RPAREN'''
  if p[1] == "VELEM":
    p[0] = Number(VELEM(p[3][0].val))
    return
  if p[1] == "select_bytes":
    bitslice_id = "bitslice." + GenUniqueID(parser)
    Condition = BitSlice(p[3][0], p[3][1], p[3][1], bitslice_id)
    expr_id = "select." + GenUniqueID(parser)
    p[0] = Select(Condition, p[3][2], p[3][3], expr_id)
    return
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1], p[3], None, expr_id)
 

def p_expr_call_module(p):
  'expr : MODULE DOT ID LPAREN args RPAREN'
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1] + "." + p[3], p[5], None, expr_id)

def p_expr_call_no_args(p):
  'expr : ID LPAREN RPAREN'
  expr_id = "call." + GenUniqueID(parser)
  p[0] = Call(p[1], [], None, expr_id)

def p_expr_lookup(p):
  'expr : expr DOT ID'
  p[0] = ElemTypeInfo(p[1], p[3])

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
  print("HERE+++++")
  expr_id = "index." + GenUniqueID(parser)
  if type(p[1]) == Var:
    if "Q" in p[1].name:
      p[0] = BitSlice(p[1], p[3], p[3], expr_id)
      return
  p[0] = BitIndex(p[1], p[3], expr_id)

def p_expr_bit_extension(p):
  'expr : expr COLON expr'
  p[0] = BitExtend(p[1], p[3])

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

def p_expr_decrement(p):
  'expr : expr DEC'
  expr_id = "unaryexpr." + GenUniqueID(parser)
  p[0] = UnaryExpr('DEC', p[1], expr_id)

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

def p_expr_nop(p):
  'expr : NOP'
  p[0] = None

def p_expr_var(p):
    'expr : ID'
    expr_id = "var." + GenUniqueID(parser)
    p[0] = Var(p[1], expr_id)

def p_expr_num(p):
  'expr : NUMBER'
  p[0] = Number(p[1])

def p_expr_literal(p):
    '''expr : STRING
        | TRUE
        | FALSE
        | UNPREDICTABLE'''
    p[0] = p[1]

lexer = lex.lex()
parser = yacc.yacc()
parser.id_counter = 0
parser.binary_exprs = []

print(parser.parse("""
__instruction aarch32_USUB8_A
    __encoding aarch32_USUB8_A1_A
        __instruction_set A32
        __field cond 28 +: 4
        __field Rn 16 +: 4
        __field Rd 12 +: 4
        __field Rm 0 +: 4
        __opcode 'xxxx0110 0101xxxx xxxxxxxx 1111xxxx'
        __guard cond != '1111'
        __unpredictable_unless 11 == '1'
        __unpredictable_unless 10 == '1'
        __unpredictable_unless 9 == '1'
        __unpredictable_unless 8 == '1'
        __decode
            d = UInt(Rd);  n = UInt(Rn);  m = UInt(Rm);
            if d == 15 || n == 15 || m == 15 then UNPREDICTABLE;

    __encoding aarch32_USUB8_T1_A
        __instruction_set T32
        __field Rn 16 +: 4
        __field Rd 8 +: 4
        __field Rm 0 +: 4
        __opcode '11111010 1100xxxx 1111xxxx 0100xxxx'
        __guard TRUE
        __decode
            d = UInt(Rd);  n = UInt(Rn);  m = UInt(Rm);
            if d == 15 || n == 15 || m == 15 then UNPREDICTABLE; // Armv8-A removes UNPREDICTABLE for R13
        
    __execute __conditional
        diff1 = UInt(R[n][7:0]) - UInt(R[m][7:0]);
        diff2 = UInt(R[n][15:8]) - UInt(R[m][15:8]);
        diff3 = UInt(R[n][23:16]) - UInt(R[m][23:16]);
        diff4 = UInt(R[n][31:24]) - UInt(R[m][31:24]);
        R[d][7:0]   = diff1[7:0];
        R[d][15:8]  = diff2[7:0];
        R[d][23:16] = diff3[7:0];
        R[d][31:24] = diff4[7:0];
        PSTATE.GE[0]  = if diff1 >= 0 then '1' else '0';
        PSTATE.GE[1]  = if diff2 >= 0 then '1' else '0';
        PSTATE.GE[2]  = if diff3 >= 0 then '1' else '0';
        PSTATE.GE[3]  = if diff4 >= 0 then '1' else '0';
"""))

