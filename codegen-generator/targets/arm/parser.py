import ply.lex as lex
import ply.yacc as yacc

from collections import namedtuple

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
}
binOps = {
    r'\+': 'PLUS',
    r'-': 'MINUS',
    r'\*': 'TIMES',
    r'/': 'DIVIDE',
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
}
punc = {
    r':': 'COLON',
    r'<': 'LANGLE',
    r'>': 'RANGLE',
    r'\(': "LPAREN",
    r'\)': "RPAREN",
    r'\[': "LBRACKET",
    r'\]': "RBRACKET",
    r'\{': "LBRACE",
    r'\}': "RBRACE",
    r';': "SEMICOLON",
    r'=': "ASSIGN",
    r',': "COMMA",
    r'\.': "DOT",
    r'\'': "QUOTE",
    r'!': "NEG",
}
tokens = [
    'INDENT',
    'NUMBER',
    'ID'
] + list(reserved) + list(binOps.values()) + list(punc.values())

for k, v in binOps.items():
    locals()['t_'+v] = k
for k, v in punc.items():
    locals()['t_'+v] = k


def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t


def t_ID(t):
    r'[a-zA-Z_#][a-zA-Z_0-9]*'
    lexed = t.value.upper()
    if lexed in reserved:
        t.type = lexed
        t.value = lexed
    return t


t_ignore = ' \t'


def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)


def t_COMMENT(t):
    r'//.*'
    pass


def preprocess(text):
    def count_spaces(s):
        count = 0
        for i in s:
            if i == ' ':
                count += 1
            else:
                break
        return count
    stack = [0]
    lines = text.split("\n")
    for i, s in enumerate(lines):
        sp = count_spaces(s)
        top = stack[-1]
        if sp > top:
            lines[i] = " "*top+"BEGIN\n"+s
            stack.append(sp)
        elif sp < top:
            lines[i] = " "*sp+"END\n"+s
            stack.pop()
    return "\n".join(lines)


if __name__ == "__main__":
    if False:
        data = """OperationCheckFPAdvSIMDEnabled64();
bits(datasize) operand  = V[n];
bits(datasize) operand2;
bits(datasize) result;
integer round_const = if round then (1 << (shift - 1)) else 0;
integer element;

operand2 = if accumulate then V[d] else Zeros();
for e = 0 to elements-1
    element = (Int(Elem[operand, e, esize], unsigned) + round_const) >> shift;
    Elem[result, e, esize] = Elem[operand2, e, esize] + element<esize-1:0>;

V[d] = result;"""
    else:
        with open('text') as f:
            data = f.read()
    lexer = lex.lex()
    data = preprocess(data)
    print(data)
    lexer.input(data)
    while True:
        tok = lexer.token()
        if not tok:
            break
        print(tok)
