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
  def __init__(self):
    self.ID = -1
  
  def genUniqueID(self):
    self.ID += 1
    return self.ID

  @staticmethod  
  def lift(self, FuntionName, RosetteFunctionBody, ParamValues, RetType):
    # Parse the Roseete file to get an AST
    RosetteAST = RosetteParser.parse(RosetteFunctionBody)
    # Generate a Rosette function
    Function = RoseFunction.create(FuntionName, ParamValues, RetType)
    RetValue = self.liftRosetteAST(Function, RosetteAST)
    # Add a return op
    RetOp = RoseReturnOp.create(RetValue)
    Function.addAbstraction(RetOp)
    Function.setRetValName(RetValue.getName())
    return Function

  def liftRosetteAST(self, Function, RosetteAST):
    print("RosetteAST:")
    print(RosetteAST)
    InstMap = {
        '+': RoseAddOp,
        '-': RoseSubOp,
        '*': RoseMulOp,
        '/': RoseDivOp
    }
    if not isinstance(RosetteAST, list):
      if isinstance(RosetteAST, int):
          return RoseConstant.create(RosetteAST, RoseIntegerType.create(32))
      if isinstance(RosetteAST, str):
        if RosetteAST[0] != '#':
          # TODO: This is not correct, I suspect we need to add some code to 
          # handle variables or values with an unknown type
          return RoseValue.create(RosetteAST, RoseIntegerType.create(32))
        return RoseConstant.create(RosetteAST, RoseStringType.create(len(RosetteAST)))
    elif RosetteAST[0] == 'bv':
      return RoseConstant.create(self.liftRosetteAST(RosetteAST[1]), RoseBitVectorType.create(RosetteAST[2]))
    elif RosetteAST[0] in InstMap:
      Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
      Op = InstMap[RosetteAST[0]].create(f"RoseOp_{RosetteAST[0]}_{self.genUniqueID()}", Args)
      Function.addAbstraction(Op)
      return Op
    else:
      Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
      CallOp = RoseOpaqueCallOp.create(RosetteAST[0], RoseConstant("TODO", RoseStringType.create(4)), Args)
      Function.addAbstraction(CallOp)
      return CallOp
    

if __name__ == '__main__':
  RosetteFileeName = "test.rkt"
  RosetteFile = open(RosetteFileeName, "r")
  RosetteFunctionBody = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteFunctionBody.append(Line)
    Line = RosetteFile.readline()    
  RosetteLifter.lift(RosetteFunctionBody)
