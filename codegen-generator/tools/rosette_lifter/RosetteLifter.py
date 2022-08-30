#############################################################
#
# This tool helps lift a small subset of Rosette language
# to Rosette IR.
#
#############################################################


from RosetteParser import *
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *



class RosetteLifter:
  #def __init__(self, FunctionName : str, ParamTypeList : list, FunctionBody : str):
  def __init__(self, FunctionName : str, FunctionBody : str):
    self.ID = -1
    #self.ParamTypeList = ParamTypeList
    self.FunctionName = FunctionName
    self.FunctionBody = FunctionBody
    #self.Params = [None] * len(ParamTypeList)
    self.OpList = list()
    self.ParamToType = dict()
    self.Params = list()
  
  def genUniqueID(self):
    self.ID += 1
    return self.ID

  def lift(self):
    # Parse the Roseete file to get an AST
    RosetteAST = RosetteParser.parse(self.FunctionBody)
    RetValue = self.liftRosetteAST(RosetteAST)
    # Generate a Rosette function
    Function = RoseFunction.create(self.FunctionName, self.Params, RetValue.getType())
    # Add the lifted ops to the function
    for Op in self.OpList:
      Function.addAbstraction(Op)
    # Add a return op
    RetOp = RoseReturnOp.create(RetValue)
    Function.addAbstraction(RetOp)
    Function.setRetValName(RetValue.getName())
    Function.print()
    return Function

  def getTypeSize(self, Type : str):
    Type = Type.strip()
    Type = Type.replace(" ", "")
    if "<" in Type and ">" in Type and "x" in Type:
      NumElems, Precision = Type.split("x")
      print("NumElems:")
      print(NumElems)
      NumElems = NumElems[1:]
      print("NumElems:")
      print(NumElems)
      assert "i" in Precision
      Precision = Precision[1:-1]
      print("Precision:")
      print(Precision)
      return RoseBitVectorType.create(int(NumElems) * int(Precision))
    # Type must be some integer type
    assert "i" in Type
    Precision = Precision[1:]
    return RoseIntegerType.create(int(Precision))

  def liftRosetteAST(self, RosetteAST):
    print("RosetteAST:")
    print(RosetteAST)
    print("type(RosetteAST):")
    print(type(RosetteAST))
    InstMap = {
        '+': RoseAddOp,
        '-': RoseSubOp,
        '*': RoseMulOp,
        '/': RoseDivOp
    }
    if isinstance(RosetteAST, int):
      return RoseConstant.create(RosetteAST, RoseIntegerType.create(32))
    if isinstance(RosetteAST, list):
      print("RosetteAST[0]:")
      print(RosetteAST[0])
      if isinstance(RosetteAST[0], list):
        if ";" in RosetteAST[0][0] and "reg" in  RosetteAST[0][0]:
          # Get the reg info
          Comment = RosetteAST[0][0]
          Comment = Comment.strip()
          Comment = Comment.replace(" ", "")
          OpenParanIdx = Comment.find("(")
          CloseParanIdx = Comment.find(")")
          RegInfo = Comment[OpenParanIdx + 1 : CloseParanIdx]
          print("RegInfo:")
          print(RegInfo)
          OpenParanIdx = Comment.find("<")
          Type = Comment[OpenParanIdx :]
          print("Type:")
          print(Type)
          self.ParamToType[RegInfo] = self.getTypeSize(Type)
          # len(reg) = 3. Skip "reg"
          RegNo = int(RegInfo[3:])
          print("RegNo:")
          print(RegNo)
          if RegNo + 1 > len(self.Params):
            self.Params = [None] * (RegNo + 1)
          return self.liftRosetteAST(RosetteAST[1:])
        # Strip the list off
        RosetteAST = RosetteAST[0]
      if RosetteAST[0] == 'bv':
        print("BV")
        BitvectorVal = int("0" + RosetteAST[1][1:], 16)
        return RoseConstant.create(BitvectorVal, \
                                        RoseBitVectorType.create(RosetteAST[2]))
      elif RosetteAST[0] == 'lit':
        return self.liftRosetteAST(RosetteAST[1])
      elif RosetteAST[0] == 'reg':
        print("REG")
        # This register is a binding
        if RosetteAST[1] in self.Params: 
          return self.Params[RosetteAST[1]]
        ParamName = "%" + RosetteAST[0] + str(RosetteAST[1])
        ParamType = self.ParamToType[RosetteAST[0] + str(RosetteAST[1])]#self.ParamTypeList[RosetteAST[1]]
        print("type(RosetteAST[1]):")
        print(type(RosetteAST[1]))
        print("RosetteAST[1]:")
        print(RosetteAST[1])
        self.Params[RosetteAST[1]] = RoseArgument.create(ParamName, ParamType, RoseUndefValue())
        return self.Params[RosetteAST[1]]
      elif RosetteAST[0] in InstMap:
        Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
        Op = InstMap[RosetteAST[0]].create("%" + str(self.genUniqueID()), Args)
        self.OpList.append(Op)
        return Op
      else:
        print("--ELSE")
        [OutputType] = RosetteAST[-1]
        OutputType = self.getTypeSize(OutputType[1:])
        Args = list(map(self.liftRosetteAST, RosetteAST[1:-1]))
        print("RosetteAST[0]:")
        print(RosetteAST[0])
        CallOp = RoseOpaqueCallOp.create("%" + str(self.genUniqueID()),\
                  RoseConstant(RosetteAST[0], RoseStringType.create(len(RosetteAST[0]))), \
                  Args, OutputType)
        print("CallOp:")
        CallOp.print()
        self.OpList.append(CallOp)
        return CallOp
  


#def GetFuncDefinition(FileName : str):
#  File = open(FileName, "r")
#  Line = None
#  while Line != "":
#    Line = File.readline()
#    if "declare" in Line and "@hydride." in Line:
#      break
#  assert Line != None
#  OpenParanIdx = Line.find("(")
#  CloseParanIdx = Line.find(")")
#  ParamsStr = Line[OpenParanIdx + 1 : CloseParanIdx]
#  ParamStrList = ParamsStr.split(",")
#  # Get all the parameters
#  ParamTypeList =  list()
#  for ParamStr in ParamStrList:
#    ParamTypeList.append(GetTypeSize(ParamStr))
#  print("ParamList:")
#  print(ParamTypeList)
#  return ParamTypeList


if __name__ == '__main__':
  RosetteFileName = "test.rkt"
  #FuncDefFileName = "test.ll"
  #ParamTypeList = GetFuncDefinition(FuncDefFileName)
  RosetteFile = open(RosetteFileName, "r")
  RosetteFunctionBody = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteFunctionBody.append(Line)
    Line = RosetteFile.readline()    
  FunctionName = "kernel"
  #Lifter = RosetteLifter(FunctionName, ParamTypeList, RosetteFunctionBody)
  Lifter = RosetteLifter(FunctionName, RosetteFunctionBody)
  Lifter.lift()

