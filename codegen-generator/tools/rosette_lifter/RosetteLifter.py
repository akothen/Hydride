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
  def __init__(self, FunctionName : str, ParamTypeList : list, FunctionBody : str):
    self.ID = -1
    self.ParamTypeList = ParamTypeList
    self.FunctionName = FunctionName
    self.FunctionBody = FunctionBody
    self.Params = [None] * len(ParamTypeList)
    self.OpList = list()
  
  def genUniqueID(self):
    self.ID += 1
    return self.ID

  def lift(self):
    # Parse the Roseete file to get an AST
    RosetteAST = RosetteParser.parse(self.FunctionBody)
    RetValue = self.liftRosetteAST(RosetteAST)
    # Generate a Rosette function
    Function = RoseFunction.create(self.FunctionName, self.Params, RetValue.getType())
    # Add a return op
    RetOp = RoseReturnOp.create(RetValue)
    Function.addAbstraction(RetOp)
    Function.setRetValName(RetValue.getName())
    return Function

  def liftRosetteAST(self, RosetteAST):
    print("RosetteAST:")
    print(RosetteAST)
    InstMap = {
        '+': RoseAddOp,
        '-': RoseSubOp,
        '*': RoseMulOp,
        '/': RoseDivOp
    }
    if isinstance(RosetteAST, int):
          return RoseConstant.create(RosetteAST, RoseIntegerType.create(32))
    if isinstance(RosetteAST, list):
      if RosetteAST[0] == 'bv':
        return RoseConstant.create(self.liftRosetteAST(RosetteAST[1]), \
                                        RoseBitVectorType.create(RosetteAST[2]))
      elif RosetteAST[0] == 'reg':
        # This register is a binding
        if RosetteAST[1] in self.Params: 
          return self.Params[RosetteAST[1]]
        ParamName = "%" + RosetteAST[0] + str(RosetteAST[1])
        ParamType = self.ParamTypeList[RosetteAST[1]]
        print("type(RosetteAST[1]):")
        print(type(RosetteAST[1]))
        print("RosetteAST[1]:")
        print(RosetteAST[1])
        print("len(ParamTypeList):")
        print(len(ParamTypeList))
        self.Params[RosetteAST[1]] = RoseArgument.create(ParamName, ParamType, RoseUndefValue())
        return self.Params[RosetteAST[1]]
      elif RosetteAST[0] in InstMap:
        Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
        Op = InstMap[RosetteAST[0]].create("%" + str(self.genUniqueID()), Args)
        self.OpList.append(Op)
        return Op
      else:
        print("--ELSE")
        Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
        print("RosetteAST[0]:")
        print(RosetteAST[0])
        CallOp = RoseOpaqueCallOp.create("%" + str(self.genUniqueID()),\
                  RoseConstant(RosetteAST[0], RoseStringType.create(len(RosetteAST[0]))), Args)
        print("CallOp:")
        CallOp.print()
        self.OpList.append(CallOp)
        return CallOp
    

def GetTypeSize(Type : str):
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


def GetFuncDefinition(FileName : str):
  File = open(FileName, "r")
  Line = None
  while Line != "":
    Line = File.readline()
    if "declare" in Line and "@hydride." in Line:
      break
  assert Line != None
  OpenParanIdx = Line.find("(")
  CloseParanIdx = Line.find(")")
  ParamsStr = Line[OpenParanIdx + 1 : CloseParanIdx]
  ParamStrList = ParamsStr.split(",")
  # Get all the parameters
  ParamTypeList =  list()
  for ParamStr in ParamStrList:
    ParamTypeList.append(GetTypeSize(ParamStr))
  print("ParamList:")
  print(ParamTypeList)
  return ParamTypeList


if __name__ == '__main__':
  RosetteFileName = "test.rkt"
  FuncDefFileName = "test.ll"
  ParamTypeList = GetFuncDefinition(FuncDefFileName)
  RosetteFile = open(RosetteFileName, "r")
  RosetteFunctionBody = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteFunctionBody.append(Line)
    Line = RosetteFile.readline()    
  FunctionName = "kernel"
  Lifter = RosetteLifter(FunctionName, ParamTypeList, RosetteFunctionBody)
  Lifter.lift()

