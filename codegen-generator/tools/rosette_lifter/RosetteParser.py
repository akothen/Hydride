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
    EOF = "EOF"
    
    def __init__(self, File):
      self.File = File
      self.Line = ''

    def nextToken(self):
      while True:
        if self.Line == '': 
          self.Line = self.File.readline()
        if self.Line == '': 
          return RosetteParser.RosetteTokenizer.EOF
        Token, self.Line = re.match(RosetteParser.RosetteTokenizer.Tokenizer, \
                                    self.Line).groups()
        if Token != '' and not Token.startswith('; '):
            return Token
  
  def tokenize(self, File):
      Lexer = self.RosetteTokenizer(File)
      Token = Lexer.nextToken()
      Tokens = []
      while Token != "EOF":
          Tokens.append(Token)
          Token = Lexer.nextToken()
      return Tokens

  def atom(self, Token: str):
      "Numbers become numbers; every other token is a symbol."
      try: return int(Token)
      except ValueError:
          try: return float(Token)
          except ValueError:
              return str(Token)

  def readExpression(self, Tokens : list):
      "Read an expression from a sequence of tokens."
      if len(Tokens) == 0:
          raise SyntaxError('unexpected EOF')
      token = Tokens.pop(0)
      if token == '(':
          L = []
          while Tokens[0] != ')':
              L.append(self.read_from_tokens(Tokens))
          Tokens.pop(0) # pop off ')'
          return L
      elif token == ')':
          raise SyntaxError('unexpected )')
      else:
          return self.atom(token)

  @staticmethod
  def parse(self, File):
      return self.readExpression(self.tokenize(File))
