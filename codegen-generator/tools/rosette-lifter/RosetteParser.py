#############################################################
#
# This is a rudimentary Rosette parser.
#
#############################################################


import re

TokenDenotingFunctionStart = "hydride.node"


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
        if Token != '': #and not Token.startswith(";"):
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

  def readExpressions(self, Tokens : list):
    print("readExpressions")
    # Read an expression from a sequence of tokens.
    if len(Tokens) == 0:
      raise SyntaxError('NO TOKENS IN ROSETTE CODE')
    Token = Tokens.pop(0)
    print("POPPED TOKEN:")
    print(Token)
    if Token == '(':
      ExprLst = list()
      while Tokens[0] != ')':
        ExprLst.append(self.readExpressions(Tokens))
      Tokens.pop(0)
      if len(Tokens) != 0:
        if ";" in Tokens[0]:
          Token = Tokens.pop(0)
          ExprLst.append([Token])
      return ExprLst
    elif Token == ')':
      raise SyntaxError('unexpected )')
    elif ';' in Token:
      print("COMMENT")
      CommentList = [Token]
      if len(Tokens) == 0:
        return CommentList
      ExprLst = list()
      ExprLst.append(CommentList)
      while ";" in Tokens[0]:
        Token = Tokens.pop(0)
        ExprLst.append([Token])
      if len(Tokens) == 0:
        return ExprLst
      else:
        ExprLst.append(self.readExpressions(Tokens))
        return ExprLst
    else:
      return self.transformType(Token)

  # Get Rosette code for each function
  def getRosetteCodeForEachFunction(self, CodeLines):
    FunctionToRosetteCode = dict()
    FunctionCode = []
    FunctionName = ""
    for CodeLine in CodeLines:
      if TokenDenotingFunctionStart in CodeLine:
        if len(FunctionCode) != 0:
          print("\n\n\nFUNCTION:")
          print(FunctionName)
          print(FunctionCode)
          FunctionToRosetteCode[FunctionName] = FunctionCode
        FunctionName = CodeLine.strip().replace(";", "").strip()
        FunctionCode = []
        continue
      FunctionCode.append(CodeLine)
    assert len(FunctionCode) != 0 and FunctionName != ""
    FunctionToRosetteCode[FunctionName] = FunctionCode
    print("\n\n\nFUNCTION:")
    print(FunctionName)
    print(FunctionCode)
    return FunctionToRosetteCode
  
  @staticmethod
  def parse(Code):
    Parser = RosetteParser()
    print("PARSING CODE:")
    print(Code)
    print("\n\n\n\n\n\n")
    FunctionToRosetteCode = Parser.getRosetteCodeForEachFunction(Code)
    FunctionToAST = dict()
    for FunctionName, FunctionCodeLines in FunctionToRosetteCode.items():
      TokenLists = Parser.tokenize(FunctionCodeLines)
      ParsedExpr = Parser.readExpressions(TokenLists)
      print("ParsedExpr:")
      print(ParsedExpr)
      FunctionToAST[FunctionName] = ParsedExpr
    return FunctionToAST

