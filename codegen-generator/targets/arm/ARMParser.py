

import ply.lex as lex
import ply.yacc as yacc
import re


from ARMAST import *


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
    'V',
    'VPART',
    'ELEM',
}
binOps = {
    r'\+': 'PLUS',
    r'-': 'MINUS',
    r'\*': 'TIMES',
    r'DIV': 'DIVIDE',
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
    'HEXNUMBER',
    'NUMBER',
    'BITSTRING',
    'ID'
] + list(reserved) + list(binOps.values()) + list(punc.values())

precedence = (
    ('left', 'COMMA', 'ELSE'),
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
    ('right', 'NOT', 'UMINUS'),
    ('left', 'DOT', 'LPAREN', 'RPAREN', 'LBRACE', 'RBRACE'),
)

for k, v in binOps.items():
    locals()['t_'+v] = k
for k, v in punc.items():
    locals()['t_'+v] = k

Parser = None


def t_HEXNUMBER(t):
    r'0x[0-9A-F]+'
    return t


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


def t_error(t):
    assert False


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
    lines = text.split("\n")
    # pass1: <s> -> [s]
    p = re.compile("<([^<>]*)>")

    def qwq(m):
        # print(m.group(0))
        return "["+m.group(1)+"]"

    for i, s in enumerate(lines):
        lines[i] = p.sub(qwq, s)
    # pass2: add BEGIN END by indent
    stack = [0]
    cdep = 0
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
    while len(stack) > 1:
        stack.pop()
        lines.append(" "*stack[-1]+"END")
    return "\n".join(lines)


def GenUniqueID():
    ID = Parser.id_counter
    Parser.id_counter += 1
    return str(ID)


def p_stmt_assign(p):
    '''stmt : expr ASSIGN expr SEMICOLON
            | LBRACKET expr COMMA expr RBRACKET ASSIGN expr SEMICOLON
            | LPAREN expr COMMA MINUS RPAREN ASSIGN expr SEMICOLON
            | LPAREN expr COMMA expr RPAREN ASSIGN expr SEMICOLON'''
    if len(p) == 5:
        p[0] = AssignExpr(p[1], p[3], GenUniqueID())
    elif p[4] == 'MINUS':
        p[0] = PairAssignExpr((p[2], None), p[7], GenUniqueID())
    elif p[1] == 'LPAREN':
        p[0] = PairAssignExpr((p[2], p[4]), p[7], GenUniqueID())
    else:
        p[0] = ConcatAssignExpr((p[2], p[4]), p[7], GenUniqueID())


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
    p[0] = SimpleType(p[1])


def p_stmt_vardecl(p):
    '''stmt : type ID SEMICOLON
            | type ID COMMA ID SEMICOLON
            | type ID ASSIGN expr SEMICOLON'''
    if len(p) == 4:
        p[0] = VarDecl(p[1], [Var(p[2], GenUniqueID())], GenUniqueID())
    elif p[3] == "COMMA":
        p[0] = VarDecl(p[1], [Var(p[2], GenUniqueID()),
                       Var(p[4], GenUniqueID())], GenUniqueID())
    else:
        p[0] = VarDeclDef(p[1], Var(p[2], GenUniqueID()), p[4], GenUniqueID())


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
    p[0] = BinaryExpr(p[2], p[1], p[3], GenUniqueID())


def p_expr_unaryOps(p):
    '''expr : NOT expr
            | MINUS expr %prec UMINUS'''
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


def p_expr_hexnumber(p):
    '''expr : HEXNUMBER'''
    p[0] = HexNumber(p[1])


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
            | expr LBRACKET RBRACKET
            | V LBRACKET args RBRACKET
            | VPART LBRACKET args RBRACKET
            | ELEM LBRACKET args RBRACKET
            '''
    if len(p) == 5:
        if p[1] == "V":
            assert len(p[3]) == 1
            p[0] = RegV(p[3][0], GenUniqueID())
        elif p[1] == "VPART":
            assert len(p[3]) == 2
            p[0] = RegVpart(p[3][0], p[3][1], GenUniqueID())
        elif p[1] == "ELEM":
            assert len(p[3]) == 3
            p[0] = Elem(p[3][0], p[3][1], p[3][2], GenUniqueID())
        else:
            p[0] = BitIndex(p[1], p[3], GenUniqueID())

    else:
        p[0] = BitIndex(p[1], [], GenUniqueID())


# def p_expr_slice(p):
#     'expr : expr LBRACKET expr COLON expr RBRACKET %prec BITSLICE'

#     p[0] = BitSlice(p[1], p[3], p[5], GenUniqueID())


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


def get_parser():
    lexer = lex.lex()
    Parser = yacc.yacc(start='stmts')
    Parser.id_counter = 0
    return Parser


Parser = get_parser()

if __name__ == "__main__":
    # preprocess_data()
    if True:
        data = preprocess("if HaveMTE2Ext() then\n    SetTagCheckedInstruction(tag_checked);\n\nCheckFPAdvSIMDEnabled64();\n\nbits(64) address;\nbits(64) offs;\nbits(128) rval;\nbits(esize) element;\nconstant integer ebytes = esize DIV 8;\n\nif n == 31 then\n    CheckSPAlignment();\n    address = SP[];\nelse\n    address = X[n];\n\noffs = Zeros();\nif replicate then\n    // load and replicate to all elements\n    for s = 0 to selem-1\n        element = Mem[address + offs, ebytes, AccType_VEC];\n        // replicate to fill 128- or 64-bit register\n        V[t] = Replicate(element, datasize DIV esize);\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\nelse\n    // load/store one element per register\n    for s = 0 to selem-1\n        rval = V[t];\n        if memop == MemOp_LOAD then\n            // insert into one lane of 128-bit register\n            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];\n            V[t] = rval;\n        else // memop == MemOp_STORE\n            // extract from one lane of 128-bit register\n            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\n\nif wback then\n    if m != 31 then\n        offs = X[m];\n    if n == 31 then\n        SP[] = address + offs;\n    else\n        X[n] = address + offs;")
        # for i, s in enumerate(data.split('\n')):
        #     print(f"{i+1:>4d}: {s}")
        print(data)
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
    Parser = yacc.yacc(start='stmts')
    Parser.id_counter = 0
    Parser.parse(data)
    # print(Parser.parse(data))
