import sys
sys.path.insert(0, '../../rosette_ir/') # temporary hack for file organization

import re
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *

program = open("test_case.rkt", "r")

eof_object = "EOF"

class Tokenizer:
    tokenizer = r'''\s*(,@|[('`,)]|"(?:[\\].|[^\\"])*"|;.*|[^\s('"`,;)]*)(.*)'''
    
    def __init__(self, program_file):
        self.file = program_file
        self.line = ''

    def next_token(self):
        while True:
            if self.line == '': self.line = self.file.readline()
            if self.line == '': return eof_object
            token, self.line = re.match(Tokenizer.tokenizer, self.line).groups()
            if token != '' and not token.startswith('; '):
                return token

def lex(f):
    lexer = Tokenizer(f)
    token = lexer.next_token()
    tokens = []
    while token != "EOF":
        tokens.append(token)
        token = lexer.next_token()
    return tokens

def atom(token: str):
    "Numbers become numbers; every other token is a symbol."
    try: return int(token)
    except ValueError:
        try: return float(token)
        except ValueError:
            return str(token)

def read_from_tokens(tokens):
    "Read an expression from a sequence of tokens."
    if len(tokens) == 0:
        raise SyntaxError('unexpected EOF')
    token = tokens.pop(0)
    if token == '(':
        L = []
        while tokens[0] != ')':
            L.append(read_from_tokens(tokens))
        tokens.pop(0) # pop off ')'
        return L
    elif token == ')':
        raise SyntaxError('unexpected )')
    else:
        return atom(token)

def parse(f):
    return read_from_tokens(lex(f))

UNIQUE_ID = 0
def gen_unique_id():
    global UNIQUE_ID 
    UNIQUE_ID += 1
    return UNIQUE_ID

def convert(ast):
    # print(ast)
    inst_map = {
        '+': RoseAddOp,
        '-': RoseSubOp,
        '*': RoseMulOp,
        '/': RoseDivOp
    }
    print(ast)
    if not isinstance(ast, list):
        if isinstance(ast, int):
            return RoseConstant.create(ast, RoseIntegerType.create(32))
        if isinstance(ast, str):
            if ast[0] != '#':
                # TODO: This is not correct, I suspect we need to add some code to handle variables or values with an unknown type
                return RoseValue.create(ast, RoseIntegerType.create(32))
            return RoseConstant.create(ast, RoseStringType.create(len(ast)))
    elif ast[0] == 'bv':
        return RoseConstant.create(convert(ast[1]), RoseBitVectorType.create(ast[2]))
    elif ast[0] in inst_map:
        args = list(map(convert, ast[1:]))
        return inst_map[ast[0]].create(f"RoseOp_{ast[0]}_{gen_unique_id()}", args)
    else:
        args = list(map(convert, ast[1:]))
        return RoseOpaqueCallOp.create(ast[0], RoseConstant("TODO", RoseStringType.create(4)), args)
    


def convert_file(f):
    ast = parse(program)
    return convert(ast)

print(convert_file(program).to_rosette())
