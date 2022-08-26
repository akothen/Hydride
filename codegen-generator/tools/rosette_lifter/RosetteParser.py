#############################################################
#
# This is a rudimentary Rosette parser.
#
#############################################################


import re


class RosetteParser:
  # Tokenizer for Rosette
  class RosetteTokenizer:
    Tokenizer = r'''\s*(,@|[('`,)]|"(?:[\\].|[^\\"])*"|;.*|[^\s('"`,;)]*)(.*)'''
    
    def __init__(self, RosetteCode):
      self.RosetteCode = RosetteCode

    def nextToken(self):
      for Line in self.RosetteCode:
        Token, Line = re.match(RosetteParser.RosetteTokenizer.Tokenizer, Line).groups()
        if Token != '' and not Token.startswith('; '):
            return Token
      return None
  
  def tokenize(self, File):
    Lexer = self.RosetteTokenizer(File)
    Token = Lexer.nextToken()
    Tokens = list()
    while Token != None:
        Tokens.append(Token)
        Token = Lexer.nextToken()
    return Tokens

  def atom(self, Token: str):
    # Numbers become numbers; every other token is a symbol.
    try: return int(Token)
    except ValueError:
        try: return float(Token)
        except ValueError:
            return str(Token)

  def readExpression(self, Tokens : list):
    "Read an expression from a sequence of tokens."
    if len(Tokens) == 0:
      raise SyntaxError('NO TOKENS IN ROSETTE CODE')
    Token = Tokens.pop(0)
    if Token == '(':
      L = []
      while Tokens[0] != ')':
          L.append(self.readExpression(Tokens))
      Tokens.pop(0) # pop off ')'
      return L
    elif Token == ')':
        raise SyntaxError('unexpected )')
    else:
        return self.atom(Token)

  @staticmethod
  def parse(self, File):
    return self.readExpression(self.tokenize(File))
