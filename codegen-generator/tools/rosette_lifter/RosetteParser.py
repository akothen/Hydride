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
      self.Line = ""
      self.Index = 0
      print("self.RosetteCode")
      print( self.RosetteCode)

    def nextToken(self):
      while True:
        if self.Line == "":
          if self.Index != len(self.RosetteCode) - 1:
            self.Line = self.RosetteCode[self.Index]
            self.Index += 1
          else:
            break
        print("PARSED LINE:")
        print(self.Line)
        Token, self.Line = re.match(RosetteParser.RosetteTokenizer.Tokenizer, \
                                    self.Line.strip()).groups()
        print("TOKEN:")
        print(Token)
        print("Line:")
        print(self.Line)
        if Token != '':
          print("--")
          return Token
      return None
  
  def tokenize(self, Code):
    Lexer = self.RosetteTokenizer(Code)
    Token = Lexer.nextToken()
    Tokens = list()
    while Token != None:
        Tokens.append(Token)
        Token = Lexer.nextToken()
    print("LIST OF TOKENS:")
    print(Tokens)
    return Tokens

  def transformType(self, Token: str):
    # Numbers become numbers; every other token is a symbol.
    try: 
      return int(Token)
    except ValueError:
        try: 
          return float(Token)
        except ValueError:
          return str(Token)

  def readExpression(self, Tokens : list):
    # Read an expression from a sequence of tokens.
    if len(Tokens) == 0:
      raise SyntaxError('NO TOKENS IN ROSETTE CODE')
    Token = Tokens.pop(0)
    if Token == '(':
      ExprLst = list()
      while Tokens[0] != ')':
        ExprLst.append(self.readExpression(Tokens))
      Tokens.pop(0)
      return ExprLst
    elif Token == ')':
        raise SyntaxError('unexpected )')
    else:
        return self.transformType(Token)

  @staticmethod
  def parse(Code):
    Parser = RosetteParser()
    ParsedExpr = Parser.readExpression(Parser.tokenize(Code))
    print("ParsedExpr:")
    print(ParsedExpr)
    return ParsedExpr

