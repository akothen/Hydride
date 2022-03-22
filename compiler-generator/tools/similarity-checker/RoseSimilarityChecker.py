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
    # Generate code for all semantics first
    CodeGenerator = RoseCodeGenerator(TargetList[0])
    FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False, JustGenRosette=False)
    #assert False
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
    if isinstance(ConcreteArg.getType(), RoseBitVectorType):
      if ConcreteArg.getType().getBitwidth() >= 4:
        Input = "(define {} (bv #x".format(Param.getName() + NameSuffix)
        HexVal = hex(ConcreteArg.getValue())
        HexValString = str(HexVal[2:])
        LeftOver = ConcreteArg.getType().getBitwidth() - len(HexValString)
        for _ in range(LeftOver):
          HexValString = "0" + HexValString
        Input += HexValString
        Input += " " + str(ConcreteArg.getType().getBitwidth()) + "))\n"
      else:
        Input = "(define {} (bv #b".format(Param.getName() + NameSuffix)
        HexVal = hex(ConcreteArg.getValue())
        HexValString = str(HexVal[2:])
        LeftOver = ConcreteArg.getType().getBitwidth() - len(HexValString)
        for _ in range(LeftOver):
          HexValString = "0" + HexValString
        Input += HexValString
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
    #print("Function1.getNumArgs():")
    #print(Function1.getNumArgs())
    #print("Function2.getNumArgs():")
    #print(Function2.getNumArgs())
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
    #if len(ConcreteArgs1) != len(ConcreteArgs2):
    #  return False
    #if len(SymbolicArgs1) != len(SymbolicArgs2):
    #  return False
    for Arg1, Arg2 in zip(Function1.getArgs(), Function2.getArgs()):
      if type(Arg1.getType()) != type(Arg2.getType()):
        return False
    # The types of the concrete values must be the same.
    #for ConcreteVal1, ConcreteVal2 in zip(ConcreteArgs1, ConcreteArgs2):
    #  if ConcreteVal1.getType() != ConcreteVal2.getType():
    #    return False
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
    return "\n".join(Content)
    
  def verify(self, FunctionInfo1 : RoseFunctionInfo, \
                   FunctionInfo2 : RoseFunctionInfo):
    if self.qualifiesForSimilarityChecking(FunctionInfo1, FunctionInfo2) == False:
      return False
    # Generate verification code
    Code = self.emitVerificationCodeFor(FunctionInfo1, FunctionInfo2)
    Function1 = FunctionInfo1.getLatestFunction()
    Function2 = FunctionInfo2.getLatestFunction()
    FileName = "test_" + Function1.getName() + "_" + Function2.getName() + ".rkt"
    try:
      File = open(FileName, "w+")
      File.write(Code)
      File.close()
      # Perform verification
      Output, Err = RunCommand("racket {}".format(FileName))
      RunCommand("killall z3")
      RunCommand("killall racket")
      RunCommand("rm {}".format(FileName))
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
  
  def summarize(self):
    print(len(self.EquivalenceClasses))
    for EquivalentClass in self.EquivalenceClasses:
      print("*********EQUIVALENT FUNCTIONS:")
      for Function in EquivalentClass.getEquivalentFunctions():
        print(Function.getName())
      print("******************************")
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

  def slower_run(self, IndexList = list()):
    if IndexList == []:
      List = self.FunctionInfoList
    else:
      assert len(IndexList) == 2
      List = self.FunctionInfoList[IndexList[0] : IndexList[1]]
    # Track verification results
    VerificationResults = dict()
    for FunctionInfo in List:
      VisitedEquivalenceClasses = set()
      for CheckFunctionInfo in List:
        Function = FunctionInfo.getLatestFunction()
        CheckFunction = CheckFunctionInfo.getLatestFunction()
        print("---------------------------------------------------")
        print("Function:")
        print(Function.getName())
        print("CheckFunction:")
        print(CheckFunction.getName())
        if Function == CheckFunction:
          print("FUNCTIONS ARE EQUAL")
          continue
        if CheckFunction in self.FunctionToEquivalenceClassMap:
          CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
          # This equivalent class has already been visited, so skip it.
          if CheckedEquivalentClass in VisitedEquivalenceClasses:
            print("EQIVALENCE CLASS ALREADY VISITED")
            continue
          # Check if we have already found these functions to be equivalent
          if Function in self.FunctionToEquivalenceClassMap:
            EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
            if EquivalentClass == CheckedEquivalentClass:
              # Two equivalent classes are the same
              print("TWO EQUIVALENT CLASSES ARE THE SAME")
              VisitedEquivalenceClasses.add(CheckedEquivalentClass)
              continue
            # Perform verification
            if (FunctionInfo, CheckFunctionInfo) in VerificationResults:
              VerifyResult = VerificationResults[(FunctionInfo, CheckFunctionInfo)]
            else:
              VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
              VerificationResults[(FunctionInfo, CheckFunctionInfo)] = VerifyResult
              VerificationResults[(CheckFunctionInfo, FunctionInfo)] = VerifyResult
            if VerifyResult == True:
              print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
              # Merge the two equivalent classes
              EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
              EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
              for EqFunction in EqFunctions:
                self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
              if CheckedEquivalentClass in VisitedEquivalenceClasses:
                VisitedEquivalenceClasses.remove(CheckedEquivalentClass)
                self.EquivalenceClasses.remove(CheckedEquivalentClass)
              VisitedEquivalenceClasses.add(EquivalentClass)
            continue
          # Perform verification
          if (FunctionInfo, CheckFunctionInfo) in VerificationResults:
            VerifyResult = VerificationResults[(FunctionInfo, CheckFunctionInfo)]
          else:
            VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
            VerificationResults[(FunctionInfo, CheckFunctionInfo)] = VerifyResult
            VerificationResults[(CheckFunctionInfo, FunctionInfo)] = VerifyResult
          if VerifyResult == True:
            assert CheckedEquivalentClass in self.EquivalenceClasses
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
            print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
            CheckedEquivalentClass.addFunction(Function)
            CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())      
            self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
            self.EquivalenceClasses.add(CheckedEquivalentClass)
            VisitedEquivalenceClasses.add(CheckedEquivalentClass)
          continue
        if Function in self.FunctionToEquivalenceClassMap:
          # Perform verification
          if (FunctionInfo, CheckFunctionInfo) in VerificationResults:
            VerifyResult = VerificationResults[(FunctionInfo, CheckFunctionInfo)]
          else:
            VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
            VerificationResults[(FunctionInfo, CheckFunctionInfo)] = VerifyResult
            VerificationResults[(CheckFunctionInfo, FunctionInfo)] = VerifyResult
          if VerifyResult == True:
            print("Added {} and {} to existing eq class".format(Function.getName(), CheckFunction.getName()))
            # Add check function into the equivalent class
            EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
            assert EquivalentClass in self.EquivalenceClasses
            self.EquivalenceClasses.remove(EquivalentClass)
            EquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap())      
            self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
            VisitedEquivalenceClasses.add(EquivalentClass)
          continue
        # Perform verification
        if (FunctionInfo, CheckFunctionInfo) in VerificationResults:
          VerifyResult = VerificationResults[(FunctionInfo, CheckFunctionInfo)]
        else:
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
          VerificationResults[(FunctionInfo, CheckFunctionInfo)] = VerifyResult
          VerificationResults[(CheckFunctionInfo, FunctionInfo)] = VerifyResult
        if VerifyResult == True:
          print("Added {} and {} to new eq class".format(Function.getName(), CheckFunction.getName()))
          EquivalentClass = RoseEquivalenceClass()
          EquivalentClass.addFunction(Function)
          EquivalentClass.addFunction(CheckFunction)
          EquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap())
          EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap())
          self.EquivalenceClasses.add(EquivalentClass)
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
          VisitedEquivalenceClasses.add(EquivalentClass)
          continue
      if Function not in self.FunctionToEquivalenceClassMap:
        # Create an equivalence for this function
        print('BUGGER')
        print(Function.getName())
        EQClass = RoseEquivalenceClass()
        EQClass.addFunction(Function)
        EQClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())
        self.EquivalenceClasses.add(EQClass)
        self.FunctionToEquivalenceClassMap[Function] = EQClass
        VisitedEquivalenceClasses.add(EQClass)
      continue
    # Summmarize
    self.summarize()

  def fastest_run(self):
    # Track verification results
    EQToEQMap = dict()
    for FunctionInfo in self.FunctionInfoList:
      Function = FunctionInfo.getLatestFunction()
      EquivalentClass = None
      if Function in self.FunctionToEquivalenceClassMap:
        EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
      for CheckFunctionInfo in self.FunctionInfoList:
        CheckFunction = CheckFunctionInfo.getLatestFunction()
        print("---------------------------------------------------")
        print("Function:")
        print(Function.getName())
        print("CheckFunction:")
        print(CheckFunction.getName())
        if Function == CheckFunction:
          print("FUNCTIONS ARE EQUAL")
          continue
        CheckedEquivalentClass = None
        if CheckFunction in self.FunctionToEquivalenceClassMap:
          CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
        # Perform similarity checking
        # Case 1:
        if EquivalentClass != None and CheckedEquivalentClass != None:
          assert EquivalentClass in self.EquivalenceClasses
          assert CheckedEquivalentClass in self.EquivalenceClasses
          if EquivalentClass == CheckedEquivalentClass:
            continue
          # Do we know what the equivalence relation between the two classes?
          if (EquivalentClass, CheckedEquivalentClass) in EQToEQMap:
            assert (CheckedEquivalentClass, EquivalentClass) in EQToEQMap
            VerifyResult = EQToEQMap[(EquivalentClass, CheckedEquivalentClass)]
          else:
            VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
            if VerifyResult == True:
              print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
              # Merge the two equivalent classes
              EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
              EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
              for EqFunction in EqFunctions:
                self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
              self.EquivalenceClasses.remove(CheckedEquivalentClass)
            EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
            EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          continue
        # Case 2:
        if EquivalentClass == None and CheckedEquivalentClass != None:
          assert CheckedEquivalentClass in self.EquivalenceClasses
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
            print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
            CheckedEquivalentClass.addFunction(Function)
            CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())   
            self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
            self.EquivalenceClasses.add(CheckedEquivalentClass)
          else:
            EquivalentClass = RoseEquivalenceClass()
            print("--Added {} to new eq class".format(Function.getName()))
            EquivalentClass.addFunction(Function)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
            EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
            EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          continue
        # Case 3:
        if EquivalentClass != None and CheckedEquivalentClass == None:
          assert EquivalentClass in self.EquivalenceClasses
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            self.EquivalenceClasses.remove(EquivalentClass)
            print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
            EquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap())   
            self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
          else:
            CheckedEquivalentClass = RoseEquivalenceClass()
            print("--Added {} to new eq class".format(CheckFunction.getName()))
            CheckedEquivalentClass.addFunction(CheckFunction)
            CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap())
            self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
            self.EquivalenceClasses.add(CheckedEquivalentClass)
            EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
            EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          continue
        # Case 4:
        if EquivalentClass == None and CheckedEquivalentClass == None:
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            EquivalentClass = RoseEquivalenceClass()
            EquivalentClass.addFunction(Function)
            EquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())
            EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
          else:
            EquivalentClass = RoseEquivalenceClass()
            CheckedEquivalentClass = RoseEquivalenceClass()
            print("--Added {} and {} to new eq classes".format(CheckFunction.getName(), Function.getName()))
            EquivalentClass.addFunction(Function)
            CheckedEquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap()) 
            CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
            self.EquivalenceClasses.add(CheckedEquivalentClass)
            EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
            EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          continue
    # Summmarize
    self.summarize()

  def slow_run(self):
    for FunctionInfo in self.FunctionInfoList:
      Function = FunctionInfo.getLatestFunction()
      EquivalentClass = None
      if Function in self.FunctionToEquivalenceClassMap:
        EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
      for CheckFunctionInfo in self.FunctionInfoList:
        CheckFunction = CheckFunctionInfo.getLatestFunction()
        print("---------------------------------------------------")
        print("Function:")
        print(Function.getName())
        print("CheckFunction:")
        print(CheckFunction.getName())
        if Function == CheckFunction:
          print("FUNCTIONS ARE EQUAL")
          continue
        CheckedEquivalentClass = None
        if CheckFunction in self.FunctionToEquivalenceClassMap:
          CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
        # Perform similarity checking
        # Case 1:
        if EquivalentClass != None and CheckedEquivalentClass != None:
          assert EquivalentClass in self.EquivalenceClasses
          assert CheckedEquivalentClass in self.EquivalenceClasses
          if EquivalentClass == CheckedEquivalentClass:
            continue
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo) 
          if VerifyResult == True:
            print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
            # Merge the two equivalent classes
            self.EquivalenceClasses.remove(EquivalentClass)
            EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
            EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
            for EqFunction in EqFunctions:
              self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
            self.EquivalenceClasses.add(EquivalentClass)
          continue
        # Case 2:
        if EquivalentClass == None and CheckedEquivalentClass != None:
          assert CheckedEquivalentClass in self.EquivalenceClasses
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
            print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
            CheckedEquivalentClass.addFunction(Function)
            CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())   
            self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
            self.EquivalenceClasses.add(CheckedEquivalentClass)
          else:
            EquivalentClass = RoseEquivalenceClass()
            print("--Added {} to new eq class".format(Function.getName()))
            EquivalentClass.addFunction(Function)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
          continue
        # Case 3:
        if EquivalentClass != None and CheckedEquivalentClass == None:
          assert EquivalentClass in self.EquivalenceClasses
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            self.EquivalenceClasses.remove(EquivalentClass)
            print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
            EquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap())   
            self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
          else:
            CheckedEquivalentClass = RoseEquivalenceClass()
            print("--Added {} to new eq class".format(CheckFunction.getName()))
            CheckedEquivalentClass.addFunction(CheckFunction)
            CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap())
            self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
            self.EquivalenceClasses.add(CheckedEquivalentClass)
          continue
        # Case 4:
        if EquivalentClass == None and CheckedEquivalentClass == None:
          VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
          if VerifyResult == True:
            EquivalentClass = RoseEquivalenceClass()
            EquivalentClass.addFunction(Function)
            EquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap())
            EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
          else:
            EquivalentClass = RoseEquivalenceClass()
            CheckedEquivalentClass = RoseEquivalenceClass()
            print("--Added {} and {} to new eq classes".format(CheckFunction.getName(), Function.getName()))
            EquivalentClass.addFunction(Function)
            CheckedEquivalentClass.addFunction(CheckFunction)
            EquivalentClass.addFunctToArgsMapping(Function, \
                                          FunctionInfo.getArgsToConcreteValMap()) 
            CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                          CheckFunctionInfo.getArgsToConcreteValMap()) 
            self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
            self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
            self.EquivalenceClasses.add(EquivalentClass)
            self.EquivalenceClasses.add(CheckedEquivalentClass)
          continue
    # Summmarize
    self.summarize()

  def parallel_run(self):
    from multiprocessing import Pool
    with Pool(6) as p:
      p.map(self.run, [[0, 5], [6, 11], [12, 17], [18, 23], [24, 29], [30, 25]])


if __name__ == '__main__':
  SimilarityChecker = RoseSimilarityChecker(["x86"])
  SimilarityChecker.fastest_run() #parallel_run()

