#############################################################
#
# This is a rudimentary Rosette parser.
#
#############################################################


import re


EOF = "EOF"

class Tokenizer:
    tokenizer = r'''\s*(,@|[('`,)]|"(?:[\\].|[^\\"])*"|;.*|[^\s('"`,;)]*)(.*)'''
    
    def __init__(self, program_file):
        self.file = program_file
        self.line = ''

    def next_token(self):
        while True:
            if self.line == '': self.line = self.file.readline()
            if self.line == '': return EOF
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

