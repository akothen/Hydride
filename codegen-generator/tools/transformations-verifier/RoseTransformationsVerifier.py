#############################################################
#
# This is the Rose IR Transformation tool.
#
#############################################################


from copy import deepcopy

from RoseAbstractions import *
from RoseContext import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *



class RoseTransformationVerifier():
  def __init__(self, ReferenceFunctionInfo : RoseFunctionInfo, CheckFunctionInfo : RoseFunctionInfo):
    self.CheckFunctionInfo = CheckFunctionInfo
    self.ReferenceFunctionInfo = ReferenceFunctionInfo

  def genSymbolicInput(self, Param, NameSuffix):
    Input = "(define-symbolic {} (bitvector {}))\n".format(Param.getName() + NameSuffix,\
                                         str(Param.getType().getBitwidth()))
    return Input

  def genConcreteInput(self, Param : RoseArgument, ConcreteArg : RoseConstant, NameSuffix : str):
    assert isinstance(ConcreteArg, RoseConstant)
    Input = "(define {} {})\n".format(Param.getName() + NameSuffix, GenConcreteValue(ConcreteArg))
    return Input


  def emitVerificationCodeForFunction(self, Function : RoseFunction, 
                                      FunctionInfo : RoseFunctionInfo, NameSuffix : str):
    Code = ""
    for Arg in  Function.getArgs():
      if FunctionInfo.argHasConcreteVal(Arg) == False:
        Code += self.genSymbolicInput(Arg, NameSuffix)
      else:
        ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
        Code += self.genConcreteInput(Arg, ConcreteVal, NameSuffix)
    return Code

  def emitVerificationCode(self):
    CheckFunction = self.CheckFunctionInfo.getLatestFunction()
    ReferenceFunction = self.ReferenceFunctionInfo.getLatestFunction()
    # Rosette code headers
    Content = [
      "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", "(require rosette/solver/smt/boolector)", 
      "(require \"RosetteOpsImpl.rkt\")\n"
    ]
    # If the function names are the same, first, change function names
    if CheckFunction.getName() == ReferenceFunction.getName():
      CheckFunction = deepcopy(CheckFunction)
      ReferenceFunction = deepcopy(ReferenceFunction)
      CheckFunction.setName(CheckFunction.getName() + ".check")
      ReferenceFunction.setName(ReferenceFunction.getName() + ".ref")
    # Generate rosette code. 
    Content.append(RosetteGen.CodeGen(CheckFunction))
    Content.append(RosetteGen.CodeGen(ReferenceFunction))
    # Generate verification code on first set of inputs
    NameSuffix = "_1"
    Content.append(self.emitVerificationCodeForFunction(CheckFunction, \
                                        self.CheckFunctionInfo, NameSuffix))
    ArgNamesList = [Arg.getName() for Arg in CheckFunction.getArgs()]
    CheckFuncArgNamesListString = ""
    ReferenceFunctionListString = ""
    for Idx, Name in enumerate(ArgNamesList):
      if self.CheckFunctionInfo.argHasConcreteVal(CheckFunction.getArg(Idx)) == False:
        ReferenceFunctionListString += Name + NameSuffix + " "
      CheckFuncArgNamesListString += Name + NameSuffix + " "
    Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(CheckFunction.getName(), \
                                CheckFuncArgNamesListString, ReferenceFunction.getName(), \
                                ReferenceFunctionListString, NameSuffix))
    return "\n".join(Content)
    
  def verifyEquivalence(self):
    # Generate verification code
    Code = self.emitVerificationCode()
    Function = self.ReferenceFunctionInfo.getLatestFunction()
    FileName = "verify_" + Function.getName() + ".rkt"
    try:
      File = open(FileName, "w+")
      File.write(Code)
      File.close()
      # Perform verification
      Output, Err = RunCommand("racket {}".format(FileName))
      RunCommand("killall z3")
      RunCommand("killall racket")
      #RunCommand("rm {}".format(FileName))
      print("Output:")
      print(Output)
      print("Err:")
      print(Err)
      if Err == "":
        Out = Output.split("\n")
        print("Out[0]:")
        print(Out[0])
        print("Out[1]:")
        print(Out[1])
        if "unsat" in Out[0] and "unsat" in Out[1]:
          return True
      return False
    except IOError:
      print("Error making: {}.rkt".format(FileName))
      return False
  


