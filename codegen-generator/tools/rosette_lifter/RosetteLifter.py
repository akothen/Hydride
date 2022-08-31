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
from RoseLLVMContext import *

from llvmlite.ir.types import VectorType as LLVMVectorType
from llvmlite.ir.types import IntType as LLVMIntType


class RosetteLifter:
  def __init__(self, FunctionName : str, FunctionBody : str):
    self.ID = -1
    self.FunctionName = FunctionName
    self.FunctionBody = FunctionBody
    self.RoseValToLLVMType = dict()
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
    print("self.RoseValToLLVMType of Retun value:")
    print(self.RoseValToLLVMType[RetValue])
    LLVMRetType = self.RoseValToLLVMType[RetValue]
    # Generate a Rosette function
    Function = RoseFunction.create(self.FunctionName, self.Params, RetValue.getType())
    # Add the lifted ops to the function
    for Op in self.OpList:
      Function.addAbstraction(Op)
    # Add a return op
    RetOp = RoseReturnOp.create(RetValue)
    Function.addAbstraction(RetOp)
    Function.setRetValName(RetValue.getName())
    self.RoseValToLLVMType[Function.getReturnValue()] = LLVMRetType
    Function.print()
    # Build the Rose LLVM context
    RoseLLVMCtx = RoseLLVMContext.create()
    for OpTypeInfo in self.RoseValToLLVMType.items():
      RoseLLVMCtx.setLLVMTypeFor(OpTypeInfo[0], OpTypeInfo[1])
    return Function, RoseLLVMCtx

  def getRoseType(self, Type : str):
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

  def getLLVMType(self, Type : str):
    Type = Type.strip()
    Type = Type.replace(" ", "")
    assert "<" in Type and ">" in Type and "x" in Type
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
    return LLVMVectorType(LLVMIntType(int(Precision)), int(NumElems))

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
          self.ParamToType[RegInfo] = Type
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
        return RoseConstant.create(BitvectorVal, RoseBitVectorType.create(RosetteAST[2]))
      elif RosetteAST[0] == 'lit':
        return self.liftRosetteAST(RosetteAST[1])
      elif RosetteAST[0] == 'reg':
        print("REG")
        # This register is a binding
        if RosetteAST[1] in self.Params: 
          return self.Params[RosetteAST[1]]
        ParamName = "%" + RosetteAST[0] + str(RosetteAST[1])
        ParamType = self.getRoseType(self.ParamToType[RosetteAST[0] + str(RosetteAST[1])])
        print("type(RosetteAST[1]):")
        print(type(RosetteAST[1]))
        print("RosetteAST[1]:")
        print(RosetteAST[1])
        NewArg = RoseArgument.create(ParamName, ParamType, RoseUndefValue())
        self.Params[RosetteAST[1]] = NewArg
        self.RoseValToLLVMType[NewArg] = self.getLLVMType(self.ParamToType[RosetteAST[0] + str(RosetteAST[1])])
        return NewArg
      elif RosetteAST[0] in InstMap:
        Args = list(map(self.liftRosetteAST, RosetteAST[1:]))
        Op = InstMap[RosetteAST[0]].create("%" + str(self.genUniqueID()), Args)
        self.OpList.append(Op)
        return Op
      else:
        print("--ELSE")
        [OutputType] = RosetteAST[-1]
        OutputRoseType = self.getRoseType(OutputType[1:])
        Args = list(map(self.liftRosetteAST, RosetteAST[1:-1]))
        print("RosetteAST[0]:")
        print(RosetteAST[0])
        CallOp = RoseOpaqueCallOp.create("%" + str(self.genUniqueID()),\
                  RoseConstant(RosetteAST[0], RoseStringType.create(len(RosetteAST[0]))), \
                  Args, OutputRoseType)
        print("CallOp:")
        CallOp.print()
        self.OpList.append(CallOp)
        self.RoseValToLLVMType[CallOp] = self.getLLVMType(OutputType[1:])
        return CallOp
  


def LiftRosetteCodeFrom(RosetteFileName : str, FunctionName : str):
  RosetteFile = open(RosetteFileName, "r")
  RosetteFunctionBody = list()
  Line = RosetteFile.readline()
  while Line != "":
    RosetteFunctionBody.append(Line)
    Line = RosetteFile.readline()
  Lifter = RosetteLifter(FunctionName, RosetteFunctionBody)
  return Lifter.lift()



if __name__ == '__main__':
  RosetteFileName = "test.rkt"
  FunctionName = "kernel"
  LiftRosetteCodeFrom(RosetteFileName, FunctionName)

