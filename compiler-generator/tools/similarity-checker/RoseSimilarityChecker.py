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
from RoseToolsUtils import *
from RoseEquivalenceClass import *


class RoseSimilarityChecker():
  def __init__(self, TargetList : list):
    self.TargetList = TargetList
    self.FunctionInfoList = list()
    self.FunctionToRosetteCodeMap = dict()
    self.EquivalenceClasses = set()
    self.FunctionToEquivalenceClassMap = dict()
    for Target in self.TargetList:
      # Generate code for all semantics first
      CodeGenerator = RoseCodeGenerator(Target)
      FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=True)
      self.FunctionInfoList.extend(FunctionInfoList)
      # Generate rosette code
      for FunctionInfo in FunctionInfoList:
        Function = FunctionInfo.getLatestFunction()
        assert not isinstance(Function, RoseUndefRegion)
        self.FunctionToRosetteCodeMap[Function] = \
                    CodeGenerator.codeGen(FunctionInfo, JustGenRosette=True)
        print("self.FunctionToRosetteCodeMap[Function]:")
        print(self.FunctionToRosetteCodeMap[Function])

  def genSymbolicInput(self, Param, NameSuffix):
    Input = "(define-symbolic {} (bitvector {}))\n".format(Param.getName() + NameSuffix,\
                                         str(Param.getType().getBitwidth()))
    return Input

  def genConcreteInput(self, Param, ConcreteArg, NameSuffix):
    assert isinstance(ConcreteArg, RoseConstant)
    print("Param.getType().getBitwidth():")
    print(Param.getType().getBitwidth())
    if isinstance(ConcreteArg.getType(), RoseBitVectorType):
      Input = "(define {} (bv #x".format(Param.getName() + NameSuffix)
      HexVal = hex(ConcreteArg.getValue())
      print("HexVal:")
      print(HexVal)
      HexValString = str(HexVal[2:])
      print("HexValString:")
      print(HexValString)
      LeftOver = ConcreteArg.getType().getBitwidth() - len(HexValString)
      for _ in range(LeftOver):
        HexValString = "0" + HexValString
      print(HexValString)
      Input += HexValString
      print("Input:")
      print(Input)
      print("ConcreteArg.getType().getBitwidth():")
      print(ConcreteArg.getType().getBitwidth())
      Input += " " + str(ConcreteArg.getType().getBitwidth()) + "))\n"
    else:
      assert isinstance(ConcreteArg.getType(), RoseIntegerType)
      Input = "(define {} {})\n".format(Param.getName() + NameSuffix, str(ConcreteArg.getValue()))
    return Input

  def qualifiesForSimilarityChecking(self, FunctionInfo1 : RoseFunctionInfo, \
                                    FunctionInfo2 : RoseFunctionInfo):
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    # Number of arguments must be equal
    if Function1.getNumArgs() != Function2.getNumArgs():
      return False

    def GetSymbolicAndConcreteArgs(FunctionInfo : RoseFunctionInfo):
      Function = FunctionInfo.getLatestFunction()
      ConcreteArgs = list()
      SymbolicArgs = list()
      for Arg in Function.getArgs():
        if FunctionInfo.argHasConcreteVal(Arg) == True:
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

  def emitVerificationCodeForFunction(self, FunctionInfo : RoseFunctionInfo, NameSuffix : str):
    Function = FunctionInfo.getLatestFunction()
    Code = ""
    for Arg in  Function.getArgs():
      if FunctionInfo.argHasConcreteVal(Arg) == False:
        Code += self.genSymbolicInput(Arg, NameSuffix)
      else:
        ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
        Code += self.genConcreteInput(Arg, ConcreteVal, NameSuffix)
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
    NameSuffix = "_1"
    Content.append(self.emitVerificationCodeForFunction(FunctionInfo1, NameSuffix))
    ArgNamesList1 = [Arg.getName() for Arg in Function1.getArgs()]
    ArgNamesList1String = ""
    for Name in ArgNamesList1:
      ArgNamesList1String += Name + NameSuffix + " "
    Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(Function1.getName(), \
                ArgNamesList1String, Function2.getName(), ArgNamesList1String, NameSuffix))
     # Generate verification code on second set of inputs
    NameSuffix = "_2"
    Content.append(self.emitVerificationCodeForFunction(FunctionInfo2, NameSuffix))
    ArgNamesList2 = [Arg.getName() for Arg in Function2.getArgs()]
    ArgNamesList2String = ""
    for Name in ArgNamesList2:
      ArgNamesList2String += Name + NameSuffix + " "
    Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(Function1.getName(), \
                ArgNamesList2String, Function2.getName(), ArgNamesList2String))
    print(Content)
    return "\n".join(Content)
    
  def verify(self, FunctionInfo1 : RoseFunctionInfo, \
                   FunctionInfo2 : RoseFunctionInfo):
    if self.qualifiesForSimilarityChecking(FunctionInfo1, FunctionInfo2) == False:
      return
    # Generate verification code
    Code = self.emitVerificationCodeFor(FunctionInfo1, FunctionInfo2)
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    FileName = "test_" + Function1.getName() + "_" + Function2.getName() + ".rkt"
    try:
      File = open(FileName, "w+")
      File.write(Code)
      print("Code:")
      print(Code)
      File.close()
      # Perform verification
      Out, Err = RunCommand("racket {}".format(FileName))
      if Err == "":
        if "unsat" in Out:
          return True
      return False
    except IOError:
      print("Error making: {}.rkt".format(FileName))
      return False
  
  def summarize(self):
    print(len(self.EquivalenceClasses))
    for EquivalentClass in self.EquivalenceClasses:
      print("*********EQUIVALENT FUNCTIONS:")
      for Function in EquivalentClass.getEquivalentFunctions():
        print(Function.getName())
    FileName = "summary.rkt"
    try:
      File = open(FileName, "w+")
      for EquivalentClass in self.EquivalenceClasses:
        for Function in EquivalentClass.getEquivalentFunctions():
          print(Function.getName())
          File.write(self.FunctionToRosetteCodeMap[Function])
          File.write("\n")
          print("Code:")
          print(self.FunctionToRosetteCodeMap[Function])
          break
      File.close()
      return True
    except IOError:
      print("Error making: {}.rkt".format(FileName))
      return False  

  def run(self):
    for FunctionInfo in self.FunctionInfoList:
      EqClassFound = False
      VisitedEquivalenceClasses = set()
      for CheckFunctionInfo in self.FunctionInfoList:
        if FunctionInfo.getLatestFunction() == CheckFunctionInfo.getLatestFunction():
          continue
        if CheckFunctionInfo.getLatestFunction() in self.FunctionToEquivalenceClassMap:
          CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunctionInfo.getLatestFunction()]
          # This equivalent class has already been visited, so skip it.
          if CheckedEquivalentClass in VisitedEquivalenceClasses:
            continue
          # Check if we have already found these functions to be equivalent
          if FunctionInfo.getLatestFunction() in self.FunctionToEquivalenceClassMap:
            EquivalentClass = self.FunctionToEquivalenceClassMap[FunctionInfo.getLatestFunction()]
            if EquivalentClass == CheckedEquivalentClass:
              # Two equivalent classes are the same
              print("TWO EQUIVALENT CLASSES ARE THE SAME")
              EqClassFound = True
              VisitedEquivalenceClasses.add(CheckedEquivalentClass)
              continue
            # Perform verification
            if self.verify(FunctionInfo, CheckFunctionInfo) == True:
              # Merge the two equivalent classes
              EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
              EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
              for EqFunction in EqFunctions:
                self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
              # Set the flag
              EqClassFound = True
              if CheckedEquivalentClass in VisitedEquivalenceClasses:
                VisitedEquivalenceClasses.remove(CheckedEquivalentClass)
                self.EquivalenceClasses.remove(CheckedEquivalentClass)
              VisitedEquivalenceClasses.add(EquivalentClass)
            continue
          # Perform verification
          if self.verify(FunctionInfo, CheckFunctionInfo) == True:
            assert CheckedEquivalentClass in self.EquivalenceClasses
            CheckedEquivalentClass.addFunction(FunctionInfo.getLatestFunction())
            CheckedEquivalentClass.addFunctToArgsMapping(FunctionInfo.getLatestFunction(), \
                                          FunctionInfo.getArgsToConcreteValMap())      
            self.FunctionToEquivalenceClassMap[FunctionInfo.getLatestFunction()] = CheckedEquivalentClass
            VisitedEquivalenceClasses.add(CheckedEquivalentClass)
            EqClassFound = True
            continue
        if FunctionInfo.getLatestFunction() in self.FunctionToEquivalenceClassMap:
          # Perform verification
          if self.verify(FunctionInfo, CheckFunctionInfo) == True:
            # Add check function into the equivalent class
            EquivalentClass = self.FunctionToEquivalenceClassMap[FunctionInfo.getLatestFunction()]
            assert EquivalentClass in self.EquivalenceClasses
            EquivalentClass.addFunction(CheckFunctionInfo.getLatestFunction())
            EquivalentClass.addFunctToArgsMapping(CheckFunctionInfo.getLatestFunction(), \
                                          CheckFunctionInfo.getArgsToConcreteValMap())      
            self.FunctionToEquivalenceClassMap[CheckFunctionInfo.getLatestFunction()] = EquivalentClass
            VisitedEquivalenceClasses.add(EquivalentClass)
            EqClassFound = True
          continue
        # Perform verification
        if self.verify(FunctionInfo, CheckFunctionInfo) == True:
          if FunctionInfo.getLatestFunction() not in self.FunctionToEquivalenceClassMap \
          and CheckFunctionInfo.getLatestFunction() not in self.FunctionToEquivalenceClassMap:
            EquivalentClass = RoseEquivalenceClass()
            EquivalentClass.addFunction(FunctionInfo.getLatestFunction())
            EquivalentClass.addFunction(CheckFunctionInfo.getLatestFunction())
            EquivalentClass.addFunctToArgsMapping(FunctionInfo.getLatestFunction(), \
                                          FunctionInfo.getArgsToConcreteValMap())
            EquivalentClass.addFunctToArgsMapping(CheckFunctionInfo.getLatestFunction(), \
                                          CheckFunctionInfo.getArgsToConcreteValMap())
            self.EquivalenceClasses.add(EquivalentClass)
            self.FunctionToEquivalenceClassMap[FunctionInfo.getLatestFunction()] = EquivalentClass
            self.FunctionToEquivalenceClassMap[CheckFunctionInfo.getLatestFunction()] = EquivalentClass
            VisitedEquivalenceClasses.add(EquivalentClass)
            EqClassFound = True
            continue
      if EqClassFound == False:
        # Create an equivalence for this function
        EQClass = RoseEquivalenceClass()
        EQClass.addFunction(FunctionInfo.getLatestFunction())
        EQClass.addFunctToArgsMapping(FunctionInfo.getLatestFunction(), \
                                          FunctionInfo.getArgsToConcreteValMap())
        self.EquivalenceClasses.add(EQClass)
        self.FunctionToEquivalenceClassMap[FunctionInfo.getLatestFunction()] = EQClass
        VisitedEquivalenceClasses.add(EQClass)
        continue
    # Summmarize
    self.summarize()


if __name__ == '__main__':
  SimilarityChecker = RoseSimilarityChecker(["x86"])
  SimilarityChecker.run()

