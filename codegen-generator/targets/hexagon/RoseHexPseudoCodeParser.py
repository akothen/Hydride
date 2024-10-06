###################################################################
#
# Pseudocode Parser for Hexagon ISA semantics.
#
###################################################################


from HexAST import *
from RoseHexCommon import *


def ParseHexagonSemantics(Semantics : dict):
  # Intializing x86 parser
  InitHexagonParser()
  SemaList = list()
  for Name, Dictionary in Semantics.items():
    Pseudocode = Dictionary['spec']
    Inst = Dictionary['hvx_intrinsic']
    Sema = GetSemanticsFor(Name, Inst, Pseudocode)
    SemaList.append(Sema)
  return SemaList


def GetSemanticsFor(Name : str, Inst : str, Pseudocode : str):
  # Lambda functions
  def GetVariableSize(Variable, Pseudocode):
    if (Variable + ".v[") in Pseudocode:
        return 2048
    if "Vxx" in Variable:
      return 2048
    if "Q" in Variable:
      return 128
    elif "R" in Variable:
      return 32
    elif "V" in Variable:
      return 1024

  def IsVariableScalar(Variable):
    if "Q" in Variable:
      return True
    return False

  Inst_specs = Inst.split(':')
  reg_Inst = Inst_specs[0]
  ParsedInst = Parse(reg_Inst)
  print("ParsedInst:")
  print(ParsedInst)
  if isinstance(ParsedInst, list):
    assign = ParsedInst[0]
    FirstStmt = ParsedInst[0]
  if isinstance(assign, If):
    assign = assign.then[0]

  # This is either an if statement or standard function call then
  print("assign:")
  print(assign)
  print("FirstStmt:")
  print(FirstStmt)
  if not isinstance(assign, Update):
    if isinstance(assign, Call):
      lhs = assign.args[0]
      rhs = assign
  else: 
    lhs = assign.lhs
    if isinstance(lhs, list): # some annoying Instructions return 2 things, TODO: ask Akash about this
      lhs = lhs[0]
    # += or *=
    if isinstance(assign.rhs, BinaryExpr):
      rhs = assign.rhs.b
      # Extend args
      tmp = [assign.rhs.a]
      print(type(rhs))
      if isinstance(rhs, Call):
        tmp.extend(rhs.args)
        if isinstance(FirstStmt, If):
          tmp.append(FirstStmt.cond)
        rhs = Call(rhs.funcname, tmp, rhs.special, rhs.id)
      else:
        tmp.append(assign.rhs.b)
        if isinstance(FirstStmt, If):
          tmp.append(FirstStmt.cond)
        rhs = tmp
    elif isinstance(assign.rhs, Call):
      rhs = assign.rhs
    elif isinstance(assign.rhs, BitExtend):
      rhs = assign.rhs.hi
      # Theere may be another level of bit indexing.
      if isinstance(rhs, BitExtend):
        rhs = rhs.hi
      print("-rhs:")
      print(rhs)
    else:
      rhs =  [assign.rhs]
    
  # SIMD Instruction
  if isinstance(lhs, ElemTypeInfo):
    var = lhs.obj
    rettype = lhs.elemtype 
    retname = var.name
  elif isinstance(lhs, Var):
    var = lhs
    rettype = var.id.split(".")[1]
    retname = var.name
  else:
    print("Unknown lhs:", lhs)
    rettype = None
    retname = None
  
  if isinstance(rhs, Call):
    name = rhs.funcname
    params = rhs.args
  elif isinstance(rhs, list):
    name = Name
    params = rhs
    print("params:")
    print(params)
  else:
    name = Name
    params = []
  
  param_sizes = []
  param_args = []
  scalarregs = []
  for param in params:
    print("param:")
    print(param)
    if isinstance(param, UnaryExpr):
      param = param.a
    if type(param) == Var:
      # Ignore parameters that contain "#"
      if "#" in param.name:
        continue
      param_sizes.append(GetVariableSize(param.name, Pseudocode))
      if IsVariableScalar(param.name):
        scalarregs.append(param.name)
    elif type(param) == ElemTypeInfo:
      assert type(param.obj) == Var
      # Ignore parameters that contain "#"
      if "#" in param.obj.name:
        continue
      param_sizes.append(GetVariableSize(param.obj.name, Pseudocode))
      if IsVariableScalar(param.obj.name):
        scalarregs.append(param.obj.name)
    param_args.append(param)

  print("param_sizes:")
  print(param_sizes)
  retsize = GetVariableSize(retname, Pseudocode)
  sema = Sema(intrin=Name, inst=name, params=param_args, spec=Parse(Pseudocode), \
              retname =retname, retsize=retsize, paramsizes=param_sizes, \
              extensions=None, scalarregs=scalarregs)
  return sema



#################### PSEUDOCODE PARSER


import ply.lex as lex
import ply.yacc as yacc


lexer = None
parser = None
precedence = None
binary_regexp = None
tokens = None


def InitHexagonParser():
  global parser
  global lexer
  global precedence
  global binary_regexp
  global tokens
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
      ] + list(HexBinaryOps.values()) + list(HexReserved)
  binary_regexp = r'|'.join(HexBinaryOps)
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
  lexer = lex.lex()
  parser = yacc.yacc()


def ResetParser(parser):
  parser.id_counter = 0
  parser.binary_exprs = []

def Parse(src):
  ResetParser(parser)
  AST = parser.parse(src, debug=True, tracking=True)
  return AST



########### LEXER


HexReserved = {
    'FOR',
    'IF',
    'ELSE',
    'WHILE',
    'BREAK',
    'NOP', 'OP',
    # 'AND', 'OR', 'XOR', 'NOT',
    }

HexBinaryOps = {
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
  t.type = HexBinaryOps[t.value]
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
  if lexed in HexReserved:
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



########## PARSING RULES

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
  print("p:")
  print(p)
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
  'stmt : IF LPAREN expr RPAREN LBRACKET stmts RBRACKET'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[3], p[6], None, expr_id)

def p_stmt_if_else(p):
  'stmt : IF LPAREN expr RPAREN LBRACKET stmts RBRACKET ELSE LBRACKET stmts RBRACKET'
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[3], p[6], p[10], expr_id)

def p_stmt_if_single(p):
  'stmt : IF LPAREN expr RPAREN stmt '
  expr_id = "if." + GenUniqueID(parser)
  p[0] = If(p[3], [p[5]], None, expr_id)


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
  print("p[3]:")
  print(p[3])
  if p[3] == "i":
    # this is a bitslice
    index_id = "index." + GenUniqueID(parser)
    Index = Var(p[3], index_id)
    expr_id = "index." + GenUniqueID(parser)
    p[0] = BitSlice(p[1], Index, Index, expr_id)
    return
  assert p[3] in ['b', 'ub', 'h', 'uh', 'w', 'uw', 'v', 's64']
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
  if p[1] == "VBITS":
    p[0] = Number(VBITS())
    return
  if p[1] == "VWIDTH":
    p[0] = Number(VWIDTH())
    return
  if p[1] in ['Vs', 'Vu', 'Vv', 'Vss', 'Vuu', 'Vvv']:
    expr_id = 'var.vec_src.' + GenUniqueID(parser)
  elif p[1] in ['Vd', 'Vdd']:
    expr_id = 'var.vec_dst.' + GenUniqueID(parser)
  elif p[1] in ['Vx', 'Vxx', 'Vy', 'Vyy']:
    expr_id = 'var.vec.' + GenUniqueID(parser)
  elif p[1].startswith("Qd"):
    expr_id = 'var.pred_dst.' + GenUniqueID(parser)
  elif p[1].startswith("Qs"):
    expr_id = 'var.pred_src.' + GenUniqueID(parser)
  elif p[1].startswith("Qt"):
    expr_id = 'var.pred.' + GenUniqueID(parser)
  elif p[1] in ['Rs', 'Rt', 'Ru']:
    expr_id = 'var.reg_src.' + GenUniqueID(parser)
  elif p[1] == 'Rd':
    expr_id = 'var.reg_dst.' + GenUniqueID(parser)
  else:
    expr_id = "var." + GenUniqueID(parser)
  NewName = ''.join(i for i in p[1] if not i.isdigit())
  if NewName != p[1]:
    NewName += "V"
  print("NewName:")
  print(NewName)
  p[0] = Var(NewName, expr_id)

def p_expr_num(p):
  'expr : NUMBER'
  p[0] = Number(p[1])
