import ply.lex as lex
import ply.yacc as yacc

from collections import namedtuple

Number = namedtuple('Number', ['val'])
BitString = namedtuple('BitString', ['val'])
BitSlice = namedtuple('BitSlice', ['bv', 'hi', 'lo', 'id'])
BitIndex = namedtuple('BitIndex', ['obj', 'idxs', 'id'])
BitConcat = namedtuple('BitConcat', ['hi', 'lo'])
Var = namedtuple('Var', ['name', 'id'])
BitType = namedtuple('BitType', ['size', 'id'])
Assign = namedtuple('Assign', ['lhs', 'rhs', 'id'])
VarDecl = namedtuple('VarDecl', ['type', 'name', 'id'])
VarDeclDef = namedtuple('VarDecl', ['type', 'name', 'defi', 'id'])

For = namedtuple('For', ['iterator', 'begin', 'end', 'body', 'id'])

IfElse = namedtuple('IfElse', ['cond', 'then',  'otherwise', 'id'])
IfElseExpr = namedtuple('IfElseExpr', ['cond', 'then',  'otherwise', 'id'])
If = namedtuple('If', ['cond', 'then', 'id'])

Call = namedtuple('Call', ['funcname', 'args', 'id'])

BinaryExpr = namedtuple('BinaryExpr', ['op', 'a', 'b', 'id'])
UnaryExpr = namedtuple('UnaryExpr', ['op', 'a', 'id'])
AssignExpr = namedtuple('AssignExpr', ['lhs', 'rhs', 'id'])
PairAssignExpr = namedtuple('PairAssignExpr', ['lhs', 'rhs', 'id'])
FieldExpr = namedtuple('FieldExpr', ['obj', 'field', 'id'])
CompoundStmt = namedtuple('CompoundStmt', ['stmts', 'id'])

# FuncDef = namedtuple('FuncDef', ['name', 'params', 'body', 'id'])
# Return = namedtuple('Return', ['val', 'id'])
WhenStmt = namedtuple("WhenStmt", ['cond', 'stmt', 'id'])
Case = namedtuple('Case', ['val', 'stmts', 'id'])

reserved = {
    'IF',
    'THEN',
    'ELSE',
    'FOR',
    'TO',
    'BEGIN',
    'END',
    'CASE',
    'OF',
    'WHEN',
    'BITS',
    'INTEGER',
    'CONSTANT',
    'FPCRTYPE',
    'BOOLEAN',
}
binOps = {
    r'\+': 'PLUS',
    r'-': 'MINUS',
    r'\*': 'TIMES',
    r'/': 'DIVIDE',
    r'MOD': 'MOD',
    r'<<': 'LSHIFT',
    r'>>': 'RSHIFT',
    r'&&': 'LOGIC_AND',
    r'\|\|': 'LOGIC_OR',
    r'<=': 'LESS_EQUAL',
    r'>=': 'GREATER_EQUAL',
    r'!=': 'NOT_EQUAL',
    r'==': 'EQUAL',
    r'EOR': 'BITWISE_XOR',
    r'OR': 'BITWISE_OR',
    r'AND': 'BITWISE_AND',
    r':': 'COLON',
}
punc = {
    r'<': 'LANGLE',
    r'>': 'RANGLE',
    r'=': "ASSIGN",
    r'\(': "LPAREN",
    r'\)': "RPAREN",
    r'\[': "LBRACKET",
    r'\]': "RBRACKET",
    r'\{': "LBRACE",  # only found in full arch
    r'\}': "RBRACE",
    r';': "SEMICOLON",
    r',': "COMMA",
    r'\.': "DOT",
    r'!': "NOT",
}
tokens = [
    'NUMBER',
    'BITSTRING',
    'ID'
] + list(reserved) + list(binOps.values()) + list(punc.values())

precedence = (
    ('left', 'ELSE'),
    ('left', 'BITWISE_OR'),
    ('left', 'BITWISE_AND'),
    ('left', 'BITWISE_XOR'),
    ('left', 'LOGIC_OR'),
    ('left', 'LOGIC_AND'),
    ('left', 'EQUAL', 'NOT_EQUAL'),
    ('left', 'LESS_EQUAL', 'GREATER_EQUAL', 'LANGLE', 'RANGLE'),
    ('left', 'COLON'),
    ('left', 'LSHIFT', 'RSHIFT'),
    ('left', 'PLUS', 'MINUS'),
    ('left', 'TIMES', 'DIVIDE', 'MOD'),
    ('right', 'NOT'),
    ('left', 'DOT', 'LPAREN', 'RPAREN', 'LBRACE', 'RBRACE', 'BITSLICE'),
)

for k, v in binOps.items():
    locals()['t_'+v] = k
for k, v in punc.items():
    locals()['t_'+v] = k

Parser = None


def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


def t_BITSTRING(t):
    r'\'[01]+\''
    t.value = t.value[1:-1]
    return t


def t_ID(t):
    r'[a-zA-Z_#][a-zA-Z_0-9]*'
    lexed = t.value.upper()
    if lexed in reserved:
        t.type = lexed
        t.value = lexed
    if lexed in binOps:
        t.type = binOps[lexed]
        t.value = binOps[lexed]
    return t


t_ignore = ' \t'


def t_newline(t):
    r'\n'
    t.lexer.lineno += 1


def t_COMMENT(t):
    r'//.*'
    pass


def preprocess(text):
    def count_spaces_bracket_dep(s):
        count = 0
        dep = 0
        for i in s:
            if i in "([{":
                dep += 1
            elif i in ")]}":
                dep -= 1
        for i in s:
            if i == ' ':
                count += 1
            else:
                break
        return count, dep
    stack = [0]
    cdep = 0
    lines = text.split("\n")
    for i, s in enumerate(lines):
        if s.strip() == "":
            continue
        sp, dep = count_spaces_bracket_dep(s)
        top = stack[-1]
        tmp = ""
        if cdep == 0:
            if sp > top:
                tmp = tmp+" "*top+"BEGIN\n"
                stack.append(sp)
            elif sp < top:
                while stack[-1] != sp:
                    stack.pop()
                    tmp = tmp+" "*stack[-1]+"END\n"
            lines[i] = tmp + s
        cdep += dep
    return "\n".join(lines)


def GenUniqueID():
    ID = Parser.id_counter
    Parser.id_counter += 1
    return str(ID)


def p_stmt_assign(p):
    '''stmt : expr ASSIGN expr SEMICOLON
            | LPAREN expr COMMA MINUS RPAREN ASSIGN expr SEMICOLON
            | LPAREN expr COMMA ID RPAREN ASSIGN expr SEMICOLON'''
    if len(p) == 5:
        p[0] = AssignExpr(p[1], p[3], GenUniqueID())
    elif p[4] == 'MINUS':
        p[0] = PairAssignExpr((p[2], None), p[7], GenUniqueID())
    else:
        p[0] = PairAssignExpr((p[2], p[4]), p[7], GenUniqueID())


def p_stmt_check(p):
    '''stmt : expr SEMICOLON '''
    p[0] = p[1]


def p_type_bits(p):
    '''type : BITS LPAREN expr RPAREN'''
    p[0] = BitType(p[3], GenUniqueID())


def p_type_simple(p):
    '''type : INTEGER
            | CONSTANT INTEGER
            | BOOLEAN
            | FPCRTYPE'''
    p[0] = p[1]


def p_stmt_vardecl(p):
    '''stmt : type ID SEMICOLON
            | type ID ASSIGN expr SEMICOLON'''
    if len(p) == 4:
        p[0] = VarDecl(p[1], p[2], GenUniqueID())
    else:
        p[0] = VarDeclDef(p[1], p[2], p[4], GenUniqueID())


def p_stmt_if(p):
    '''stmt : IF expr THEN stmt
            | IF expr THEN stmt ELSE stmt'''
    if len(p) == 5:
        p[0] = If(p[2], p[4], GenUniqueID())
    else:
        p[0] = IfElse(p[2], p[4], p[6], GenUniqueID())


def p_stmt_for(p):
    '''stmt : FOR ID ASSIGN expr TO expr stmt'''
    p[0] = For(Var(p[2], GenUniqueID()), p[4], p[6], p[7], GenUniqueID())


def p_stmts(p):
    '''stmts : stmt
             | stmts stmt'''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]


def p_stmt_compound(p):
    '''stmt : BEGIN stmts END'''
    p[0] = CompoundStmt(p[2], GenUniqueID())


def p_stmt_when(p):
    '''stmt : WHEN expr stmt'''
    p[0] = WhenStmt(p[2], p[3], GenUniqueID())


def p_stmt_case(p):
    '''stmt : CASE expr OF stmt'''
    p[0] = Case(p[2], p[4], GenUniqueID())


def p_expr_binOps(p):
    '''expr : expr PLUS expr
            | expr MINUS expr
            | expr TIMES expr
            | expr DIVIDE expr
            | expr MOD expr
            | expr LSHIFT expr
            | expr RSHIFT expr
            | expr LOGIC_AND expr
            | expr LOGIC_OR expr
            | expr LESS_EQUAL expr
            | expr GREATER_EQUAL expr
            | expr LANGLE expr
            | expr RANGLE expr
            | expr NOT_EQUAL expr
            | expr EQUAL expr
            | expr COLON expr
            | expr BITWISE_XOR expr
            | expr BITWISE_OR expr
            | expr BITWISE_AND expr'''
    print("?", *p)
    p[0] = BinaryExpr(p[2], p[1], p[3], GenUniqueID())


def p_expr_unaryOps(p):
    '''expr : NOT expr'''
    p[0] = UnaryExpr(p[1], p[2], GenUniqueID())


def p_args(p):
    '''args : expr
            | args COMMA expr'''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[3]]


def p_expr_paren(p):
    '''expr : LPAREN expr RPAREN'''
    p[0] = p[2]


def p_expr_if_then_else(p):
    '''expr : IF expr THEN expr ELSE expr'''
    p[0] = IfElseExpr(p[2], p[4], p[6], GenUniqueID())


def p_expr_number(p):
    '''expr : NUMBER'''
    p[0] = Number(p[1])


def p_expr_bitstring(p):
    '''expr : BITSTRING'''
    p[0] = BitString(p[1])


def p_expr_var(p):
    '''expr : ID'''
    p[0] = Var(p[1], GenUniqueID())


def p_expr_field(p):
    '''expr : expr DOT ID'''
    p[0] = FieldExpr(p[1], p[3], GenUniqueID())


def p_expr_index(p):
    '''expr : expr LBRACKET args RBRACKET
            | expr LBRACKET RBRACKET'''
    if len(p) == 5:
        p[0] = BitIndex(p[1], p[3], GenUniqueID())
    else:
        p[0] = BitIndex(p[1], [], GenUniqueID())


def p_expr_slice(p):
    'expr : expr LANGLE expr COLON expr RANGLE %prec BITSLICE'
    p[0] = BitSlice(p[1], p[3], p[5], GenUniqueID())


def p_expr_call(p):
    '''expr : expr LPAREN args RPAREN
            | expr LPAREN RPAREN'''
    if len(p) == 5:
        p[0] = Call(p[1], p[3], GenUniqueID())
    else:
        p[0] = Call(p[1], [], GenUniqueID())


def preprocess_data():
    with open('text.original') as f:
        data = f.read()
    data = preprocess(data)
    with open('text', 'w') as f:
        f.write(data)


if __name__ == "__main__":
    # preprocess_data()
    if True:
        data = """sum<2:0>"""
        # for i, s in enumerate(data.split('\n')):
        #     print(f"{i+1:>4d}: {s}")
        lexer = lex.lex()
        lexer.input(data)
        while True:
            tok = lexer.token()
            if not tok:
                break
            print(tok)

    else:
        with open('text') as f:
            data = f.read()

    lexer = lex.lex()
    Parser = yacc.yacc(start='expr')
    Parser.id_counter = 0
    print(Parser.parse(data))
