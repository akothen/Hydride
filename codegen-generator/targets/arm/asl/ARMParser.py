

import ply.lex as lex
import ply.yacc as yacc
import re


from ARMAST import *


reserved = {
    'INSTRUCTIONS',
    'INSTRUCTION',
    'INSTRUCTIONENCODING',

}
unOps = {
    r'NOT': 'UnOpNot',
    r'!': 'UnOpNot',
    r'-': 'UnOpNeg',
}
binOps = {
    r'==': 'BinOpEQ',
    r'!=': 'BinOpNEQ',
    r'>':  'BinOpGT',
    r'>=': 'BinOpGTEQ',
    r'>>': 'BinOpShiftRight',
    r'<':  'BinOpLT',
    r'<=': 'BinOpLTEQ',
    r'<<': 'BinOpShiftLeft',
    r'\+':  'BinOpAdd',
    r'-':  'BinOpSub',
    r'\*':  'BinOpMul',
    r'/':  'BinOpDivide',
    r'\^':  'BinOpPow',
    r'&&': 'BinOpLogicalAnd',
    r'\|\|': 'BinOpLogicalOr',
    r'OR': 'BinOpBitwiseOr',
    r'AND': 'BinOpBitwiseAnd',
    r'EOR': 'BinOpBitwiseXor',
    r'\+\+': 'BinOpPlusPlus',
    r'QUOT': 'BinOpQuot',
    r'REM': 'BinOpRem',
    r'DIV': 'BinOpDiv',
    r'MOD': 'BinOpMod',
    r':': 'BinOpConcat',
}
punc = {
    r'\(': "LPAREN",
    r'\)': "RPAREN",
}
tokens = [
    'NUMBER',
    'BITSTRING',
    'ID'
] + list(reserved) + list(binOps.values()) + list(punc.values())

# precedence = (
#     ('left', 'COMMA', 'ELSE'),
#     ('left', 'BITWISE_OR'),
#     ('left', 'BITWISE_AND'),
#     ('left', 'BITWISE_XOR'),
#     ('left', 'LOGIC_OR'),
#     ('left', 'LOGIC_AND'),
#     ('left', 'EQUAL', 'NOT_EQUAL'),
#     ('left', 'LESS_EQUAL', 'GREATER_EQUAL', 'LANGLE', 'RANGLE'),
#     ('left', 'COLON'),
#     ('left', 'LSHIFT', 'RSHIFT'),
#     ('left', 'PLUS', 'MINUS'),
#     ('left', 'TIMES', 'DIVIDE', 'MOD'),
#     ('right', 'NOT', 'UMINUS'),
#     ('left', 'DOT', 'LPAREN', 'RPAREN', 'LBRACE', 'RBRACE'),
# )

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
    r'\'[01x ]+\''
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
    if lexed in unOps:
        t.type = unOps[lexed]
        t.value = unOps[lexed]
    return t


t_ignore = ' \t'


def t_newline(t):
    r'\n'
    t.lexer.lineno += 1


# def t_COMMENT(t):
#     r'//.*'


def t_error(t):
    assert False

PARSER_ID_COUNTER = 0
def GenUniqueID():
    global PARSER_ID_COUNTER
    ID = PARSER_ID_COUNTER
    PARSER_ID_COUNTER += 1
    return str(ID)

# data Instruction =
#   Instruction { instName        :: Text
#               , instEncodings   :: [InstructionEncoding]
#               , instPostDecode  :: [Stmt]
#               , instExecute     :: [Stmt]
#               , instConditional :: Bool
#               }
#   deriving(Show, Eq)

def p_instencodings(p):
    '''instencodings : LPAREN INSTRUCTIONENCODING RPAREN'''
    p[0] = InstructionEncoding("", "", "", "", "", "", "")

def p_instencodings(p):
    '''instencodings : instencoding
                     | instencodings instencoding'''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]

def p_inst(p):
    '''inst : LPAREN INSTRUCTION ID LPAREN LIST instencodings RPAREN RPAREN'''
    p[0] = Instruction(p[3], p[4], "", "", "")

def p_insts(p):
    '''insts : inst
             | insts inst
             '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]+[p[2]]

def p_program(p):
    '''program : LPAREN INSTRUCTIONS insts RPAREN
               '''
    p[0] = p[3]


def preprocess_data():
    with open('text.original') as f:
        data = f.read()
    with open('text', 'w') as f:
        f.write(data)


def get_parser():
    lexer = lex.lex()
    Parser = yacc.yacc(start='program')
    return Parser


if __name__ == "__main__":
    if False:
        data = "if HaveMTE2Ext() then\n    SetTagCheckedInstruction(tag_checked);\n\nCheckFPAdvSIMDEnabled64();\n\nbits(64) address;\nbits(64) offs;\nbits(128) rval;\nbits(esize) element;\nconstant integer ebytes = esize DIV 8;\n\nif n == 31 then\n    CheckSPAlignment();\n    address = SP[];\nelse\n    address = X[n];\n\noffs = Zeros();\nif replicate then\n    // load and replicate to all elements\n    for s = 0 to selem-1\n        element = Mem[address + offs, ebytes, AccType_VEC];\n        // replicate to fill 128- or 64-bit register\n        V[t] = Replicate(element, datasize DIV esize);\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\nelse\n    // load/store one element per register\n    for s = 0 to selem-1\n        rval = V[t];\n        if memop == MemOp_LOAD then\n            // insert into one lane of 128-bit register\n            Elem[rval, index, esize] = Mem[address + offs, ebytes, AccType_VEC];\n            V[t] = rval;\n        else // memop == MemOp_STORE\n            // extract from one lane of 128-bit register\n            Mem[address + offs, ebytes, AccType_VEC] = Elem[rval, index, esize];\n        offs = offs + ebytes;\n        t = (t + 1) MOD 32;\n\nif wback then\n    if m != 31 then\n        offs = X[m];\n    if n == 31 then\n        SP[] = address + offs;\n    else\n        X[n] = address + offs;"
        lexer = lex.lex()
        lexer.input(data)
        while True:
            tok = lexer.token()
            if not tok:
                break
            print(tok)
    else:
        with open('test.sexpr') as f:
            data = f.read()

    lexer = lex.lex()
    Parser = yacc.yacc(start='program')
    # Parser.parse(data)
    print(Parser.parse(data))
