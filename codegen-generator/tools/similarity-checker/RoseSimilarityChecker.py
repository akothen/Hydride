#############################################################
#
# This is the similarity checking tool
#
#############################################################


from RoseAbstractions import *
from RoseContext import *
#from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *
from RoseSimilarityCheckerSummaryGen import *
from RoseValidityChecker import *
#from RoseLLVMIntrinsicsGen import *
#from RoseIRToLLVMMappingGen import *
from RoseTargetInfo import *



class RoseSimilarityChecker():
  def __init__(self, TargetList : list):
    self.TargetList = TargetList
    self.FunctionInfoList = list()
    self.FunctionInfoListToTarget = dict()
    self.FunctionToFunctionInfo = dict()
    self.FunctionToRosetteCodeMap = dict()
    self.EquivalenceClasses = set()
    self.FunctionToEquivalenceClassMap = dict()
    self.CopyFunctionToOriginalMap = dict()
    self.FunctionToArgPermutationMap = dict()
    self.FunctionToCopies = dict()
    for TargetName in self.TargetList:
      # Generate code for all semantics first
      CodeGenerator = RoseCodeGenerator(TargetName)
      FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False, JustGenRosette=False)
      # Compute some semantics info for the functions
      for FunctionInfo in FunctionInfoList:
        FunctionInfo.computeSemanticsInfoFromTargetSpecficFunction()
        FunctionInfo.print()
      # Check the validity of a functioninfo
      #Checker = RoseValidityChecker(TargetName)
      #ValidFunctionInfoList = list()
      #for FunctionInfo in FunctionInfoList:
      #  if Checker.isValid(FunctionInfo):
      #    ValidFunctionInfoList.append(FunctionInfo)
      # Create target info
      TargetInfo = RoseTargetInfo(TargetName)
      # Generate code for all semantics first
      CodeGenerator = RoseCodeGenerator(TargetName)
      FunctionInfoList = list()
      #for FunctionInfo in ValidFunctionInfoList:
      #  # Undo the transformations performed on the original function
      #  FunctionInfo.destroyAllRecentFunctionVersions()
      #  print("LATEST FUNCTION:")
      #  FunctionInfo.getLatestFunction().print()
      #  FunctionInfoList.append(CodeGenerator.codeGen(FunctionInfo=FunctionInfo, \
      #                                                ExtractConstants=True))
      FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=True)
      self.FunctionInfoList.extend(FunctionInfoList)
      # Generate rosette code
      for FunctionInfo in FunctionInfoList:
        Function = FunctionInfo.getLatestFunction()
        FunctionInfo.computeSemanticsInfo()
        FunctionInfo.print()
        self.FunctionInfoListToTarget[FunctionInfo] = TargetInfo
        self.FunctionToFunctionInfo[Function] = FunctionInfo
        assert not isinstance(Function, RoseUndefRegion)
        self.FunctionToRosetteCodeMap[Function] = \
                    CodeGenerator.codeGen(FunctionInfo, JustGenRosette=True)
        print("self.FunctionToRosetteCodeMap[Function]:")
        print(self.FunctionToRosetteCodeMap[Function])

  def genSymbolicInput(self, Param, NameSuffix):
    Input = "(define-symbolic {} (bitvector {}))\n".format(Param.getName() + NameSuffix,\
                                         str(Param.getType().getBitwidth()))
    return Input

  def genConcreteInput(self, Param : RoseArgument, ConcreteArg : RoseConstant, NameSuffix : str):
    assert isinstance(ConcreteArg, RoseConstant)
    Input = "(define {} {})\n".format(Param.getName() + NameSuffix, GenConcreteValue(ConcreteArg))
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
      "(require racket/pretty)", "(require rosette/solver/smt/boolector)", 
      "(require \"RosetteOpsImpl.rkt\")\n"
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
    except IOError:
      print("Error making: {}.rkt".format(FileName))
      return False  
    # Generate an elaborate summary
    SummaryFileName = "semantics.py"
    SummaryGen = RoseSimilarityCheckerSummaryGen(self.FunctionToFunctionInfo, \
                self.FunctionToRosetteCodeMap, self.EquivalenceClasses,
                self.FunctionInfoListToTarget)
    SummaryGen.summarize(SummaryFileName)
    return True

  #def genLLVMIntrinsics(self):
  #  IntrinsicsFileName = "hydride_llvm_intrinsics.td"
  #  LLVMIntrinsicsGen = RoseLLVMIntrinsicsGen(self.EquivalenceClasses)
  #  LLVMIntrinsicsGen.generateLLVMIntrinsics(IntrinsicsFileName)

  #def genRoseIRToLLVMIRMappings(self):
  #  FileName = "RoseToLLVMMap.py"
  #  RoseIRToLLVMMappingGenerator = RoseIRToLLVMMappingGen(self.EquivalenceClasses)
  #  RoseIRToLLVMMappingGenerator.generateRoseIRToLLVMMappings(FileName)

  def performSimilarityChecking(self):
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
    # Try another heuristic
    print("****TRY NEW HEURISTIC****")
    self.reorderArgsAndPerformSimilarityChecking()
    # Summmarize
    self.summarize()
    # Generate LLVM intrinsics
    #self.genLLVMIntrinsics()
    # Generate Rose IR to LLVM IR mappings
    #self.genRoseIRToLLVMIRMappings()


  def doFunctionsQualifyForSimilarityChecking(self, Function1 : RoseFunction, Function2 : RoseFunction):
    # Number of arguments must be equal
    if Function1.getNumArgs() != Function2.getNumArgs():
      return False
    # Number of bitvector operations must be equal
    NumBVArgs1 = 0
    NumBVArgs2 = 0
    for Arg1, Arg2 in zip(Function1.getArgs(), Function2.getArgs()):
      if isinstance(Arg1.getType(), RoseBitVectorType):
        NumBVArgs1 += 1
      if isinstance(Arg2.getType(), RoseBitVectorType):
        NumBVArgs2 += 1
    if NumBVArgs1 != NumBVArgs2:
      return False
    # TODO: Are there other weed out criteria?
    return True


  def createNewFunctionCopy(self, OriginalFunction : RoseFunction, NewArgList : list, Suffix : str):
    ClonedArgsList = list()
    ValueToValueMap = dict()
    for Arg in NewArgList:
      ClonedArg = Arg.clone(Arg.getName() + "." + Suffix)
      ClonedArgsList.append(ClonedArg)
    ClonedFunction = RoseFunction.create(OriginalFunction.getName(), ClonedArgsList, \
                                  OriginalFunction.getType().getReturnType())
    for Idx in range(ClonedFunction.getNumArgs()):
      ClonedFunction.getArg(Idx).setFunction(ClonedFunction)
      ValueToValueMap[NewArgList[Idx]] = ClonedFunction.getArg(Idx)
    ReturnValue = OriginalFunction.getReturnValue()
    print("ReturnValue:")
    ReturnValue.print()
    print("type(ReturnValue):")
    print(type(ReturnValue))
    if not isinstance(ReturnValue, RoseOperation) \
      and not isinstance(ReturnValue, RoseArgument):
      ClonedReturnVal = ReturnValue.clone(ReturnValue.getName() + "." + Suffix)
      ClonedFunction.setRetVal(ClonedReturnVal)
      ValueToValueMap[ReturnValue] = ClonedReturnVal
      print("RETURN VALUE MAPPED")
    for Abstraction in OriginalFunction:
      ClonedAbstraction = Abstraction.clone(Suffix, ValueToValueMap)
      ClonedFunction.addRegion(ClonedAbstraction)
    if ClonedFunction.getReturnValue().getType() == RoseUndefinedType() \
      and ClonedFunction.getReturnValue() == RoseUndefValue():
      BlockList = ClonedFunction.getRegionsOfType(RoseBlock)
      for Block in BlockList:
        for Op in Block:
          if isinstance(Op, RoseReturnOp):
            ClonedFunction.setRetVal(Op.getReturnedValue())
            break
        if ClonedFunction.getReturnValue() != RoseUndefValue():
          break
    return ClonedFunction


  def generateFunctionPermutations(self, Function : RoseFunction):
    # Get all the bitvector function arguments
    BVArgsMap = dict()
    BVArgs = list()
    RemainingArgs = list()
    for Idx, Arg in enumerate(Function.getArgs()):
      if isinstance(Arg.getType(), RoseBitVectorType):
        BVArgsMap[Arg] = Idx
        BVArgs.append(Arg)
        continue
      RemainingArgs.append(Arg)
    if len(BVArgs) <= 1:
      return [Function]

    # Lamda function for getting permulations of a list
    def Permutations(Elements):
      if len(Elements) == 0:
          return []
      if len(Elements) == 1:
          return [Elements]  
      PermResult = list()
      for Idx in range(len(Elements)):
        Elem = Elements[Idx]
        PermList = Elements[:Idx] + Elements[Idx+1:]
        for Perm in Permutations(PermList):
          PermResult.append([Elem] + Perm)
      return PermResult

    # Get permutations of arguments
    print("CREATING PERMUTATIONS OF:")
    Function.print()
    ArgsPermuations = Permutations(BVArgs)
    FunctionList = list()
    for Idx, ArgPerm in enumerate(ArgsPermuations):
      NewArgsList = ArgPerm + RemainingArgs
      if Function.getArgs() != NewArgsList:
        FunctionCopy = self.createNewFunctionCopy(Function, NewArgsList, str(Idx))
        self.CopyFunctionToOriginalMap[FunctionCopy] = Function
        FunctionList.append(FunctionCopy)
        print("PERMUTATION FUNCTION:")
        FunctionCopy.print()
        ArgPermutation = list()
        for Arg in NewArgsList:
          ArgPermutation.append(Function.getIndexOfArg(Arg))
        self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
    self.FunctionToCopies[Function] = FunctionList
    print("___________________________________________________________________")
    return FunctionList

  
  def createPermutatedFunction(self, OriginalFunction : RoseFunction, ArgPermutation : list):
    assert OriginalFunction.getNumArgs() == len(ArgPermutation)
    NewArgsList = list()
    for PermIdx in ArgPermutation:
      NewArgsList.append(OriginalFunction.getArg(PermIdx))
    FunctionCopy = self.createNewFunctionCopy(OriginalFunction, NewArgsList, Suffix="copy")
    self.CopyFunctionToOriginalMap[FunctionCopy] = OriginalFunction
    self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
    return FunctionCopy
  

  def getFunctionToArgMapping(self, OriginalFunction : RoseFunction, OriginalFuncArgsToConcreteMap : dict, \
                              PermutedFunction : RoseFunction, ArgPermutation : list):
    PermArgsToConcreteValMap = dict()
    for PermArgIdx, PermArg in enumerate(PermutedFunction.getArgs()):
      OrgArgIndex = ArgPermutation[PermArgIdx]
      if OriginalFunction.getArg(OrgArgIndex) in OriginalFuncArgsToConcreteMap:
        PermArgsToConcreteValMap[PermArg] = \
                OriginalFuncArgsToConcreteMap[OriginalFunction.getArg(OrgArgIndex)]
    return PermArgsToConcreteValMap


  def completeFunctionInfo(self, CopyFunctionInfo : RoseFunctionInfo, \
                        OriginalFunctionInfo : RoseFunctionInfo, ArgPermutation : list):
    CopyFunctionInfo.addRawSemantics(OriginalFunctionInfo.getRawSemantics())
    CopyFunctionInfo.setInElemType(OriginalFunctionInfo.getInElemType())
    CopyFunctionInfo.setOutElemType(OriginalFunctionInfo.getOutElemType())
    CopyFunctionInfo.setInVectorLength(OriginalFunctionInfo.getInVectorLength())
    CopyFunctionInfo.setOutVectorLength(OriginalFunctionInfo.getOutVectorLength())
    CopyFunctionInfo.setLaneSize(OriginalFunctionInfo.getLaneSize())
    CopyFunctionInfo.setIsSIMD(OriginalFunctionInfo.isSIMD())
    for PermArgIdx, OrgArgIndex in enumerate(ArgPermutation):
      if OrgArgIndex == OriginalFunctionInfo.getInElemTypeIndex():
        CopyFunctionInfo.setInElemTypeIndex(PermArgIdx)
      if OrgArgIndex == OriginalFunctionInfo.getOutElemTypeIndex():
        CopyFunctionInfo.setOutElemTypeIndex(PermArgIdx)
      if OrgArgIndex == OriginalFunctionInfo.getInVectorLengthIndex():
        CopyFunctionInfo.setInVectorLengthIndex(PermArgIdx)
      if OrgArgIndex == OriginalFunctionInfo.getOutVectorLengthIndex():
        CopyFunctionInfo.setOutVectorLengthIndex(PermArgIdx)
      if OrgArgIndex == OriginalFunctionInfo.getLaneSizeIndex():
        CopyFunctionInfo.setLaneSizeIndex(PermArgIdx)


  def reorderArgsAndPerformSimilarityChecking(self):
    # Track verification results
    EQToEQMap = dict()
    EQToResultMap = dict()
    #RemovedEquivalenceClasses = set()
    EquivalenceClasses = set()
    EquivalenceClasses.update(self.EquivalenceClasses)
    for EquivalenceClass in EquivalenceClasses:
      #if EquivalenceClass in RemovedEquivalenceClasses:
      #  continue
      for CheckEquivalenceClass in EquivalenceClasses:
        #if CheckEquivalenceClass in RemovedEquivalenceClasses:
        #  continue
        if (CheckEquivalenceClass, EquivalenceClass) in EQToResultMap:
          assert EQToResultMap[(CheckEquivalenceClass, EquivalenceClass)] == False
          continue
        if EquivalenceClass in EQToEQMap:
          EquivalenceClass = EQToEQMap[EquivalenceClass]
        if CheckEquivalenceClass in EQToEQMap:
          CheckEquivalenceClass = EQToEQMap[CheckEquivalenceClass]
        if EquivalenceClass == CheckEquivalenceClass:
          continue
        Function = EquivalenceClass.getAFunction()
        CheckFunction = CheckEquivalenceClass.getAFunction()
        print("CHECKING AGAINST EQUIVALENCE CLASS {} and {}".format(str(Function), str(CheckFunction)))
        if self.doFunctionsQualifyForSimilarityChecking(Function, CheckFunction)  == False:
          continue
        # Generate different permutations of CheckFunction
        if CheckFunction in self.FunctionToCopies:
          CheckFunctionList = self.FunctionToCopies[CheckFunction]
        else:
          CheckFunctionList = self.generateFunctionPermutations(CheckFunction)
        if len(CheckFunctionList) == 0:
          continue
        # Go over the list of permutations of the given function
        for PermCheckFunction in CheckFunctionList:
          print("PERM ARG MAP:")
          print(self.FunctionToArgPermutationMap[PermCheckFunction])
          print("CHECKING PERM FUNCTION:")
          PermCheckFunction.print()
          assert PermCheckFunction.getNumArgs() == Function.getNumArgs()
          # Check if there is any worth in performing similarity checking
          PerformChecking = True
          for Arg1, Arg2 in zip(Function.getArgs(), PermCheckFunction.getArgs()):
            if type(Arg1.getType()) != type(Arg2.getType()):
              PerformChecking = False
              break
          if PerformChecking == False:
            continue
          # Prepare to perform the full equivalence checking:
          # Form functioninfo and add function to it
          PermCheckFunctionInfo = RoseFunctionInfo()
          PermCheckFunctionInfo.addFunctionAtNewStage(PermCheckFunction)
          # Generate rosette code
          self.FunctionToRosetteCodeMap[PermCheckFunction] = \
                                    RosetteGen.CodeGen(PermCheckFunction)
          # Map args to concrete values
          ArgPermutation = self.FunctionToArgPermutationMap[PermCheckFunction]
          CheckFunctionInfo = self.FunctionToFunctionInfo[CheckFunction]
          CheckArgsToConcreteValMap = CheckFunctionInfo.getArgsToConcreteValMap()
          PermArgsToConcreteValMap = self.getFunctionToArgMapping(CheckFunction, \
                            CheckArgsToConcreteValMap, PermCheckFunction, ArgPermutation)
          PermCheckFunctionInfo.addArgsToConcreteMap(PermArgsToConcreteValMap)
          # Perform verification
          VerifyResult = self.verify(self.FunctionToFunctionInfo[Function], PermCheckFunctionInfo)
          if VerifyResult == True:
            print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
            # Merge the two equivalent classes
            CheckedEqFunctions = CheckEquivalenceClass.getEquivalentFunctions()
            print("CheckedEqFunctions:")
            print(CheckedEqFunctions)
            PermutedCheckFunctions = list()
            FunctionToArgsMapping = dict()
            for OrgFunction in CheckedEqFunctions:
              print("OrgFunction:")
              OrgFunction.print()
              print("CheckFunction:")
              CheckFunction.print()
              if OrgFunction == CheckFunction:
                PermutedCheckFunctions.append(PermCheckFunction)
                FunctionToArgsMapping[PermCheckFunction] = PermArgsToConcreteValMap
                self.completeFunctionInfo(PermCheckFunctionInfo, CheckFunctionInfo, ArgPermutation)
                self.FunctionToFunctionInfo[PermCheckFunction] = PermCheckFunctionInfo
                continue
              CopyFunction = self.createPermutatedFunction(OrgFunction, ArgPermutation)
              PermutedCheckFunctions.append(CopyFunction)
              OrgFunctionInfo = self.FunctionToFunctionInfo[OrgFunction]
              OrgFuncArgsToConcreteValMap = OrgFunctionInfo.getArgsToConcreteValMap()
              CopyFuncArgsToConcreteValMap = self.getFunctionToArgMapping(OrgFunction, \
                                    OrgFuncArgsToConcreteValMap, CopyFunction, ArgPermutation)
              FunctionToArgsMapping[CopyFunction] = CopyFuncArgsToConcreteValMap
              CopyFunctionInfo = RoseFunctionInfo()
              CopyFunctionInfo.addFunctionAtNewStage(CopyFunction)
              CopyFunctionInfo.addArgsToConcreteMap(CopyFuncArgsToConcreteValMap)
              self.completeFunctionInfo(CopyFunctionInfo, OrgFunctionInfo, ArgPermutation)
              self.FunctionToFunctionInfo[CopyFunction] = CopyFunctionInfo
              self.FunctionToRosetteCodeMap[CopyFunction] = \
                                        RosetteGen.CodeGen(CopyFunction)
            EquivalenceClass.extend(PermutedCheckFunctions, FunctionToArgsMapping)
            for EqFunction in PermutedCheckFunctions:
              self.FunctionToEquivalenceClassMap[EqFunction] = EquivalenceClass
            self.EquivalenceClasses.remove(CheckEquivalenceClass)
            #RemovedEquivalenceClasses.add(CheckEquivalenceClass)
            EQToEQMap[CheckEquivalenceClass] = EquivalenceClass
            print("DONE MERGING")
            break
          else:
            EQToResultMap[(EquivalenceClass, CheckEquivalenceClass)] = VerifyResult
            EQToResultMap[(CheckEquivalenceClass, EquivalenceClass)] = VerifyResult


  def punchHolesInFunction(self, Function : RoseFunction, Context : RoseContext):
    print("RUN ON OP SIMPLIFY FUNCTION")
    print("FUNCTION:")
    Function.print()
    # Look for extracts
    BlockList = Function.getRegionsOfType(RoseBlock)
    HoleList = list()
    HoleMap = dict()
    for Block in BlockList:
      OpList = list()
      OpList.extend(Block.getOperations())
      for Op in OpList:
        if isinstance(Op, RoseBVExtractSliceOp):
          if Op.getLowIndex() in HoleMap:
            continue
          HoleArgsList = [Op.getLowIndex()]
          # Add all the iterators of parent loops to the hole arg list
          Parent = Block.getParentOfType(RoseForLoop)
          while Parent != RoseUndefRegion():
            HoleArgsList.append(Parent.getIterator())
            Parent = Parent.getParentOfType(RoseForLoop)
          HoleFunction = Context.genName(".hole")
          Hole = RoseOpaqueCallOp.create(Context.genName(),\
                  RoseConstant(HoleFunction, RoseStringType.create(len(HoleFunction))), \
                  HoleArgsList, Op.getLowIndex().getType())
          # Replace all uses of low index with this hole
          HoleMap[Op.getLowIndex()] = Hole
          Users = Function.getUsersOf(Op.getLowIndex())
          Users[0].getParent().addOperationBefore(Hole, Users[0])
          Function.replaceUsesWith(Op.getLowIndex(), Hole)
          HoleList.append(Hole)
    return HoleList


  def getRosetteCodeForHole(self, Hole : RoseOpaqueCallOp):
    RosetteCode = "(define-grammar " + Hole.getCallee().getName()
    for Operand in Hole.getCallOperands():
      RosetteCode += Operand.getName() + " "
    RosetteCode += ")\n"
    RosetteCode += "[expr \n"
    RosetteCode += "(choose\n"
    for Operand in Hole.getCallOperands():
      RosetteCode += Operand.getName() + "\n"
    RosetteCode += "(+ (expr) (expr))\n"
    RosetteCode += "(- (expr) (expr))\n"
    RosetteCode += "(* (expr) (expr))\n"
    RosetteCode += "(\ (expr) (expr))\n"
    RosetteCode += ")]\n"
    RosetteCode += ")\n"
    return RosetteCode


  def generateCodeForReferenceToSketch(self, Sketch : RoseFunction, RosetteSketch : str):
    RosetteCode = ["(define (invoke_sketch k)"]
    RosetteCode.append(RosetteSketch)
    RosetteCode.append("(define (invoke_synth params)")
    RosetteCode.append("(" + Sketch.getName())
    for Idx in range(Sketch.getNumArgs()):
      RosetteCode.append("(vector-ref params " + str(Idx) + ")")
    RosetteCode.append(")")
    RosetteCode.append(")")
    RosetteCode.append("invoke_synth")
    RosetteCode.append(")")
    return "\n".join(RosetteCode)


  def generateCodeForReferenceForRefImpl(self, RefImpl : RoseFunction):
    RosetteCode = ["(define (invoke_ref params)"]
    RosetteCode.append("(" + RefImpl.getName())
    for Idx in range(RefImpl.getNumArgs()):
      RosetteCode.append("(vector-ref params " + str(Idx) + ")")
    RosetteCode.append(")")
    RosetteCode.append(")")
    return "\n".join(RosetteCode)


  def generateCodeForParams(self, RefImpl : RoseFunction):
    # Generate variables definitions for concrete inputs to the given functions
    Code = ""
    RefImplInfo = self.FunctionToFunctionInfo[RefImpl]
    for Arg in  RefImpl.getArgs():
      if RefImplInfo.argHasConcreteVal(Arg) == True:
        ConcreteVal = RefImplInfo.getConcreteValFor(Arg)
        Code += self.genConcreteInput(Arg, ConcreteVal, ".arg")
    Code += "(define (generate-params env)\n"
    Code += "(vector "
    for Idx, Arg in  enumerate(RefImpl.getArgs()):
      if isinstance(Arg.getType(), RoseBitVectorType):
        Code += "(vector-ref env" + str(Idx) + ") "
      else:
        Code += Arg.getName() + ".arg "
    Code += ")\n"
    Code += ")\n\n"
    Code += "(define bitwidth-list (list "
    for Arg in RefImpl.getArgs():
      if isinstance(Arg.getType(), RoseBitVectorType):
        Code += str(Arg.getType().getBitwidth())  + " "
    Code += "))\n"
    return Code


  def emitSynthesisCodeForSimilarityChecking(self, Sketch : RoseFunction, RefImpl : RoseFunction, \
                                            HolesList : list):
    # Generate a file for performing synthesis first
    RosetteSketch = RosetteGen.CodeGen(Sketch)
    RosetteRefImpl = RosetteGen.CodeGen(RefImpl)
    # Rosette code headers
    Content = [
      "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
      "(require racket/pretty)", "(require racket/serialize)", "(require hydride)",
      "(require \"RosetteOpsImpl.rkt\")\n"
    ]
    Content.extend(["enable-debug", "(current-bitwidth 16)", \
       "(custodian-limit-memory (current-custodian) (* 20000 1024 1024))",
       "(define solver 'z3)"])
    Content.append(self.generateCodeForParams(RefImpl))
    Content.append(RosetteRefImpl)
    Content.append(self.generateCodeForReferenceToSketch(Sketch, RosetteSketch))
    for Hole in HolesList:
      assert isinstance(Hole, RoseOpaqueCallOp)
      Content.append(self.getRosetteCodeForHole(Hole))
    Content.append(self.generateCodeForReferenceForRefImpl(RefImpl))
    Content.append("(define test-depth 2)")
    Content.append("(define-values (satisfiable? sol? _) (general-synthesize-sol-iterative \
                    (invoke_f1 2) invoke_f2 bitwidth-list generate-params '() solver)")
    Content.append("(displayln \"is Satisfiable?\")")
    Content.append("(println satisfiable?)")
    return "\n".join(Content)


  def verifyUsingSynthesis(self, Sketch : RoseFunction, RefImpl : RoseFunction, \
                            HolesList : list):
    RosetteCode = self.emitSynthesisCodeForSimilarityChecking(Sketch, RefImpl, HolesList)
    FileName = "test_synthesis_" + Sketch.getName() + "_" + RefImpl.getName() + ".rkt"
    try:
      File = open(FileName, "w+")
      File.write(RosetteCode)
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


if __name__ == '__main__':
  #SimilarityChecker = RoseSimilarityChecker(["Hexagon"])
  SimilarityChecker = RoseSimilarityChecker(["x86"])
  SimilarityChecker.performSimilarityChecking()

