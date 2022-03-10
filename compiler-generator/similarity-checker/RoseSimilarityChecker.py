#############################################################
#
# This is the similarity checking tool
#
#############################################################


from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *

from RoseEquivalenceClass import *


class RoseSimilarityChecker():
  def __init__(self, TargetList : list):
    self.TargetList = TargetList
    self.FunctionInfoList = list()
    self.FunctionToRosetteCodeMap = dict()
    self.EquivalenceClasses = RoseEquivalenceClass()
    for Target in self.TargetList:
      # Generate code for all semantics first
      CodeGenerator = RoseCodeGenerator(Target)
      FunctionInfoList = CodeGenerator.codeGen()
      self.FunctionInfoList.extend(FunctionInfoList)
      # Generate rosette code
      for FunctionInfo in FunctionInfoList:
        Function = FunctionInfo.getLatestFunction()
        assert not isinstance(Function, RoseUndefRegion)
        self.FunctionToRosetteCodeMap[Function] = \
                    CodeGenerator.codeGen(FunctionInfo, JustGenRosette=True)

  def genSymbolicInput(self, Param):
    Input = "(define-symbolic {} (bitvector {}}))\n".format(Param.getName(),\
                                         str(Param.getType().getBitwidth()))
    return Input

  def genConcreteInput(self, Param, ConcreteArg):
    print("Param.getType().getBitwidth():")
    print(Param.getType().getBitwidth())
    Input = "(define {} (bv #x".format(Param.getName())
    if Param.getType().getBitwidth() < 8:
      print(ConcreteArg)
      [v] = ConcreteArg
      v = v & (2**(Param.getType().getBitwidth() - 1))
      HexVal = hex(v)
      HexValString = str(HexVal[2:])
      Input += HexValString
    else:
      ParamBytes = SizeInBytes(Param.getType().getBitwidth())
      for j in range(0, ParamBytes):
        print("ConcreteArg[j]:")
        print(ConcreteArg[j] )
        Temp = []
        print(ConcreteArg)
        Temp.extend(ConcreteArg)
        Temp.reverse()
        v = Temp[j] & 0xff
        HexVal = hex(v)
        print("HexVal:")
        print(HexVal)
        HexValString = str(HexVal[2:])
        print("HexValString:")
        print(HexValString)
        if len(HexValString) == 1:
          HexValString = "0" + HexValString
        print(HexValString)
        Input += HexValString
    print("Input:")
    print(Input)
    Input += " " + str(Param.getType().getBitwidth()) + "))\n"
    return 

  def qualifiesForSimilarityChecking(self, FunctionInfo1 : RoseFunctionInfo, \
                                    FunctionInfo2 : RoseFunctionInfo):
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    # Number of arguments must be equal
    if Function1.getNumArgs() != Function2.getNumArgs():
      return False

    def GetSymbolicAndConcreteArgs(self, FunctionInfo : RoseFunctionInfo):
      Function = FunctionInfo.getLatestFunction()
      ConcreteArgs = list()
      SymbolicArgs = list()
      for Arg in Function.getArgs():
        if Arg in FunctionInfo.argHasConcreteVal():
          ConcreteArgs.append(Arg)
        else:
          SymbolicArgs.append(Arg)
      return SymbolicArgs, ConcreteArgs

    # Number of symbolic and concrete must be the same
    SymbolicArgs1, ConcreteArgs1 = GetSymbolicAndConcreteArgs(FunctionInfo1)
    SymbolicArgs2, ConcreteArgs2 = GetSymbolicAndConcreteArgs(FunctionInfo2)
    if len(ConcreteArgs1) != len(ConcreteArgs2):
      return False
    if len(SymbolicArgs1) != len(SymbolicArgs2):
      return False
    # TODO: Are there other weed out criteria?
    return True

  def emitVerificationCodeForFunction(self, FunctionInfo : RoseFunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    Code = ""
    for Arg in  Function.getArgs():
      if Arg not in FunctionInfo.argHasConcreteVal():
        Code += self.genSymbolicInput(Arg)
      else:
        ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
        Code += self.genConcreteInput(Arg, ConcreteVal)
    return Code

  def emitVerificationCodeFor(self, FunctionInfo1 : RoseFunctionInfo, \
                             FunctionInfo2 : RoseFunctionInfo):
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    # Rosette code headers
    Content = [
      "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", "(require rosette/solver/smt/boolector)\n"
    ]
    # Generate rosette code
    Content.append(self.FunctionToRosetteCodeMap[Function1])
    Content.append(self.FunctionToRosetteCodeMap[Function2])
    # Generate verification code on first set of inputs
    Content.append(self.emitVerificationCodeForFunction(Function1))
    ArgNamesList1 = [Arg.getName() for Arg in Function1.getArgs()]
    Content.append("(verify (assert (equal? ({} {}) ({} {})\n".format(Function1.getName(), \
                " ".format(ArgNamesList1), Function2.getName(), " ".format(ArgNamesList1)))
     # Generate verification code on second set of inputs
    Content.append(self.emitVerificationCodeForFunction(Function2))
    ArgNamesList2 = [Arg.getName() for Arg in Function2.getArgs()]
    Content.append("(verify (assert (equal? ({} {}) ({} {})\n".format(Function1.getName(), \
                " ".format(ArgNamesList2), Function2.getName(), " ".format(ArgNamesList2)))
    return Content.join("\n")
    
  def verify(self, FunctionInfo1 : RoseFunctionInfo, \
                   FunctionInfo2 : RoseFunctionInfo):
    if self.qualifiesForSimilarityChecking(FunctionInfo1, FunctionInfo2):
      return
    # Generate verification code
    Code = self.emitVerificationCodeFor(FunctionInfo1, FunctionInfo2)
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    FileName = "test_" + Function1.getName() + "_" + Function2.getName()
    try:
      File = open(FileName, "w+")
      File.write(Code)
      print("Code:")
      print(Code)
      File.close()
      return True
    except IOError:
      print("Error making: {}".format(FileName))
      return False
    
  def run(self):
    for FunctionInfo in self.FunctionInfoList:
      for CheckFunctionInfo in self.FunctionInfoList:
        if FunctionInfo.getLatestFunction() == CheckFunctionInfo.getLatestFunction():
          continue
        self.verify(FunctionInfo, CheckFunctionInfo)


if __name__ == '__main__':
  SimilarityChecker = RoseSimilarityChecker(["x86"])
  SimilarityChecker.run()

