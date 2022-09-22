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

import threading

FunctionToEquivalenceClassMapLock = threading.Lock()
EquivalenceClassesLock = threading.Lock()
EQToEQMapLock = threading.Lock()
RegionLock = threading.Lock()

NumThreads = 20


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
    self.EQToEQMap = dict()
    #self.Pool = multiprocessing.Pool(NumThreads)
    self.initializeSimilarityChecker()

  def initializeSimilarityChecker(self):
    for TargetName in self.TargetList:
      # Generate code for all semantics first
      CodeGenerator = RoseCodeGenerator(TargetName)
      FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False, \
                                JustGenRosette=False, NumThreads=NumThreads)
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
      FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=True, NumThreads=NumThreads)
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
                    RosetteGen.CodeGen(Function) #FunctionInfo, JustGenRosette=True)
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
      "(require racket/pretty)", "(require \"RosetteOpsImpl.rkt\")\n"
    ]
    #Content.append("(custodian-limit-memory (current-custodian) (* 1024 1024))")
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
      #Output, Err = RunCommand("racket {} && pkill z3".format(FileName))
      Output, Err = RunCommand("racket {}".format(FileName))
      #multiprocessing.Barrier(4, timeout=1)
      #RunCommand("killall z3")
      #RunCommand("killall racket")
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
    #self.reorderArgsAndPerformSimilarityChecking()
    self.eliminateUnecessaryArgs()
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
      #print("RETURN VALUE MAPPED")
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


  def getMaskArgsInFunction(self, Function : RoseFunction):
    CondList = Function.getRegionsOfType(RoseCond)
    MaskList = list()
    for CondRegion in CondList:
      Condition = CondRegion.getCondition()
      if isinstance(Condition, RoseOperation):
        if isinstance(Condition, RoseBVExtractSliceOp):
          if isinstance(Condition.getInputBitVector(), RoseArgument):
            MaskList.append(Condition.getInputBitVector())
          continue
        else:
          Worklist = list()
          Worklist.extend(Condition.getOperands())
          while len(Worklist) != 0:
            Operation = Worklist.pop()
            if not isinstance(Operation, RoseOperation):
              continue
            if isinstance(Operation, RoseBVExtractSliceOp):
              if isinstance(Operation.getInputBitVector(), RoseArgument):
                MaskList.append(Operation.getInputBitVector())
                break
              Worklist.append(Operation.getInputBitVector())
            Worklist.extend(Operation.getOperands())
    return MaskList
            

  def getSelectArgsInFunction(self, Function : RoseFunction):
    BlockList = Function.getRegionsOfType(RoseBlock)
    SelectArgs = list()
    for Block in BlockList:
      for Op in Block:
        if isinstance(Op, RoseSelectOp):
          if isinstance(Op.getThenValue(), RoseArgument):
            SelectArgs.append(Op.getThenValue())
          elif isinstance(Op.getThenValue(), RoseBVExtractSliceOp):
            SelectArgs.append(Op.getThenValue().getInputBitVector())
          else:
            Worklist = list()
            Worklist.extend(Op.getThenValue().getOperands())
            while len(Worklist) != 0:
              Operation = Worklist.pop()
              if not isinstance(Operation, RoseOperation):
                continue
              if isinstance(Operation, RoseBVExtractSliceOp):
                if isinstance(Operation.getInputBitVector(), RoseArgument):
                  SelectArgs.append(Operation.getInputBitVector())
                  break
                Worklist.append(Operation.getInputBitVector())
              Worklist.extend(Operation.getOperands())
          if isinstance(Op.getElseValue(), RoseArgument):
            SelectArgs.append(Op.getElseValue())
          elif isinstance(Op.getElseValue(), RoseBVExtractSliceOp):
            SelectArgs.append(Op.getElseValue().getInputBitVector())
          else:
            Worklist = list()
            Worklist.extend(Op.getElseValue().getOperands())
            while len(Worklist) != 0:
              Operation = Worklist.pop()
              if not isinstance(Operation, RoseOperation):
                continue
              if isinstance(Operation, RoseBVExtractSliceOp):
                if isinstance(Operation.getInputBitVector(), RoseArgument):
                  SelectArgs.append(Operation.getInputBitVector())
                  break
                Worklist.append(Operation.getInputBitVector())
              Worklist.extend(Operation.getOperands())
    return SelectArgs


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
      return list()

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

    MaskArgs = self.getMaskArgsInFunction(Function)
    SelectArgs = self.getSelectArgsInFunction(Function)
    RemainingBVArgs = list()
    for Arg in BVArgs:
      if Arg in MaskArgs:
        continue
      if Arg in SelectArgs:
        continue
      RemainingBVArgs.append(Arg)
    FunctionList = list()
    ArgsPermuations = list()
    print("CREATING PERMUTATIONS OF:")
    Function.print()
     # Get permutations of arguments
    if len(MaskArgs) == 0 and len(SelectArgs) == 0:
      ArgsPermuations = Permutations(BVArgs)
    elif len(MaskArgs) != 0 and len(SelectArgs) == 0:
      MaskArgsPermuations = Permutations(MaskArgs)
      RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
      for MaskArgsPerm in MaskArgsPermuations:
        for RemainingBVArgPerm in RemainingBVArgsPermutations:
          ArgsPermuations.append(MaskArgsPerm + RemainingBVArgPerm)
    elif len(MaskArgs) == 0 and len(SelectArgs) != 0:
      SelectArgsPermuations = Permutations(SelectArgs)
      RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
      for SelectArgsPerm in SelectArgsPermuations:
        for RemainingBVArgPerm in RemainingBVArgsPermutations:
          ArgsPermuations.append(SelectArgsPerm + RemainingBVArgPerm)
    else:
      MaskArgsPermuations = Permutations(MaskArgs)
      SelectArgsPermuations = Permutations(SelectArgs)
      RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
      for MaskArgsPerm in MaskArgsPermuations:
        for SelectArgsPerm in SelectArgsPermuations:
          for RemainingBVArgPerm in RemainingBVArgsPermutations:
            ArgsPermuations.append(MaskArgsPerm + SelectArgsPerm + RemainingBVArgPerm)
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

  
  def canonicalizeFunctionArgs(self, Function : RoseFunction):
    MaskArgs = self.getMaskArgsInFunction(Function)
    SelectArgs = self.getSelectArgsInFunction(Function)
    RemainingBVArgs = list()
    RemainingArgs = list()
    for Arg in Function.getArgs():
      if Arg in MaskArgs:
        continue
      if Arg in SelectArgs:
        continue
      if isinstance(Arg.getType(), RoseBitVectorType):
        RemainingBVArgs.append(Arg)
        continue
      RemainingArgs.append(Arg)
    if len(MaskArgs) != 0 or len(SelectArgs) != 0:
      NewArgsList = MaskArgs + SelectArgs + RemainingBVArgs + RemainingArgs
      FunctionCopy = self.createNewFunctionCopy(Function, NewArgsList, "copy")
      self.CopyFunctionToOriginalMap[FunctionCopy] = Function
      ArgPermutation = list()
      for Arg in NewArgsList:
        ArgPermutation.append(Function.getIndexOfArg(Arg))
      self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
      return FunctionCopy
    return Function


  def canonicalizeEquivalenceClasses(self):
    for EquivalenceClass in self.EquivalenceClasses:
      Function = EquivalenceClass.getAFunction()
      CanonicalizedFunction = self.canonicalizeEquivalenceClasses(Function)
      if Function != CanonicalizedFunction:
        ArgPermutation = self.FunctionToArgPermutationMap[CanonicalizedFunction]
        for EqFunction in EquivalenceClass.getEquivalentFunctions():
          if Function == EqFunction:
            FunctionCopy = CanonicalizedFunction
          else:
            FunctionCopy = self.createPermutatedFunction(EqFunction, ArgPermutation)
          OrgFunctionInfo = self.FunctionToFunctionInfo[EqFunction]
          OrgFuncArgsToConcreteValMap = OrgFunctionInfo.getArgsToConcreteValMap()
          CopyFuncArgsToConcreteValMap = self.getFunctionToArgMapping(EqFunction, \
                                OrgFuncArgsToConcreteValMap, FunctionCopy, ArgPermutation)
          EquivalenceClass.replaceFunction(EqFunction, FunctionCopy, CopyFuncArgsToConcreteValMap)
          self.FunctionToCopies[Function] = [FunctionCopy]


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
    # Canonicalize all equivalence classses
    self.canonicalizeEquivalenceClasses()
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
        if EquivalenceClass == CheckEquivalenceClass:
          continue
        if (CheckEquivalenceClass, EquivalenceClass) in EQToResultMap:
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
          print("OBTAINED FROM CACHE")
        else:
          CheckFunctionList = self.generateFunctionPermutations(CheckFunction)
          print("FRESHLY COMPUTED PERMUTATIONS")
        if len(CheckFunctionList) == 0:
          continue
        # Go over the list of permutations of the given function
        for PermCheckFunction in CheckFunctionList:
          print("CHECKING PERM FUNCTION:")
          PermCheckFunction.print()
          print("PERM ARG MAP:")
          print(self.FunctionToArgPermutationMap[PermCheckFunction])
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
            EQToResultMap[(EquivalenceClass, CheckEquivalenceClass)] = VerifyResult
            EQToResultMap[(CheckEquivalenceClass, EquivalenceClass)] = VerifyResult
            print("DONE MERGING")
            break
          else:
            EQToResultMap[(EquivalenceClass, CheckEquivalenceClass)] = VerifyResult
            EQToResultMap[(CheckEquivalenceClass, EquivalenceClass)] = VerifyResult


  def removeDeadLoop(self, FunctionInfo : RoseFunctionInfo, Function : RoseFunction, \
                            Loop : RoseForLoop):
    #assert Loop.getParent() == Function
    if not isinstance(Loop.getEndIndex(), RoseConstant) \
      and not isinstance(Loop.getStep(), RoseConstant):
      assert FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
              == FunctionInfo.getConcreteValFor(Loop.getStep())
      # Ensure that the iterator of the outer loop has no uses
      assert Function.getNumUsersOf(Loop.getIterator()) == 0
      ReligionList = list()
      print("len(Loop.getChildren()):")
      print(len(Loop.getChildren()))
      LoopChildren = list()
      LoopChildren.extend(Loop.getChildren())
      for Region in LoopChildren:
        #print("REGION IN DEAD LOOP:")
        Region.print()
        Loop.eraseChild(Region)
        ReligionList.append(Region)
      ParentRegion = Loop.getParent()
      Key = ParentRegion.getKeyForChild(Loop)
      for Region in reversed(ReligionList):
        ParentRegion.addRegionBefore(ParentRegion.getPosOfChild(Loop, Key), Region, Key)
      ParentRegion.eraseChild(Loop, Key)
      # If the outer loop end index and step are function arguments and have no uses,
      # remove can remove them.
      if Function.getNumUsersOf(Loop.getEndIndex()) == 0 \
        and Function.getNumUsersOf(Loop.getStep()) == 0:
        EndIndexArgIndex = Function.getIndexOfArg(Loop.getEndIndex())
        StepArgIndex = Function.getIndexOfArg(Loop.getStep())
        # Remove arg with higher index first
        if EndIndexArgIndex > StepArgIndex:
          FunctionInfo.eraseConcreteValForArg(Loop.getEndIndex())
          FunctionInfo.eraseConcreteValForArg(Loop.getStep())
          Function.eraseArg(EndIndexArgIndex)
          Function.eraseArg(StepArgIndex)
        else:
          FunctionInfo.eraseConcreteValForArg(Loop.getEndIndex())
          FunctionInfo.eraseConcreteValForArg(Loop.getStep())
          Function.eraseArg(StepArgIndex)
          Function.eraseArg(EndIndexArgIndex)
    elif isinstance(Loop.getEndIndex(), RoseConstant) \
      and isinstance(Loop.getStep(), RoseConstant):
      if Loop.getEndIndex().getValue() == Loop.getStep().getValue():
        ReligionList = list()
        for Region in Loop.getChildren():
          Loop.eraseChild(Region)
          ReligionList.append(Region)
        ParentRegion = Loop.getParent()
        Key = ParentRegion.getKeyForChild(Loop)
        for Region in reversed(ReligionList):
          ParentRegion.addRegionBefore(ParentRegion.getPosOfChild(Loop, Key), Region, Key)
        ParentRegion.eraseChild(Loop, Key)
    print("FRESH FUNCTION:")
    Function.print()
    return Function


  def removeDeadArguments(self, FunctionInfo : RoseFunctionInfo, Function : RoseFunction):
    #print("REMOVE DEAD ARGUMENTS")
    print("FUNCTION:")
    Function.print()
    ErasedArgs = False
    NumArgs = len(Function.getArgs())
    for Idx in range(NumArgs - 1, -1, -1):
      Arg = Function.getArg(Idx)
      print("ARG:")
      Arg.print()
      if Function.getNumUsersOf(Arg) == 0:
        FunctionInfo.eraseConcreteValForArg(Arg)
        Function.eraseArg(Idx)
        ErasedArgs = True
    return ErasedArgs


  def eliminateUnecessaryArgs(self):
    for EquivalenceClass in self.EquivalenceClasses:
      if len(EquivalenceClass.getEquivalentFunctions()) > 1:
        # Go through all the functions and loop for arguments to eliminate
        ArgIdxToConcreteValMap = dict()
        FunctionToDeadLoops = dict()
        Functions = set()
        Functions.update(EquivalenceClass.getEquivalentFunctions())
        for Function in Functions:
          assert isinstance(Function, RoseFunction)
          print("+++++++FUNCTION:")
          Function.print()
          FunctionInfo = self.FunctionToFunctionInfo[Function]
          if len(ArgIdxToConcreteValMap) == 0:
            for Idx, Arg in enumerate(Function.getArgs()):
              if FunctionInfo.argHasConcreteVal(Arg) == True:
                print("CONCRETE INDEX:")
                print(Idx)
                ArgIdxToConcreteValMap[Idx] = FunctionInfo.getConcreteValFor(Arg)
          else:
            # Compare concrete values
            for Idx, Arg in enumerate(Function.getArgs()):
              if FunctionInfo.argHasConcreteVal(Arg) == True:
                print("FunctionInfo.getConcreteValFor(Arg):")
                print(FunctionInfo.getConcreteValFor(Arg))
                print("Idx:")
                print(Idx)
                print("ArgIdxToConcreteValMap[Idx]:")
                print(ArgIdxToConcreteValMap[Idx])
                if FunctionInfo.getConcreteValFor(Arg) != ArgIdxToConcreteValMap[Idx]:
                  print("NONE")
                  ArgIdxToConcreteValMap[Idx] = None
          # Check if the outer loop in the function has the same end index and 
          # loop step.
          LoopList = Function.getRegionsOfType(RoseForLoop)
          for Loop in LoopList:
            print("LOOP IN LOOP LIST:")
            Loop.print()
            assert not isinstance(Loop, RoseUndefRegion)
            if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
                == FunctionInfo.getConcreteValFor(Loop.getStep()):
              if Function not in FunctionToDeadLoops:
                FunctionToDeadLoops[Function] = [Loop]
              else:
                FunctionToDeadLoops[Function].append(Loop)
        # Remove some unecessary Arguments
        for Function in Functions:
          print("OLD FUNCTION:")
          Function.print()
          NumArgs = len(Function.getArgs())
          ModificationMade = False
          FunctionInfo = self.FunctionToFunctionInfo[Function]
          for Idx in range(NumArgs - 1, -1, -1):
            if Idx in ArgIdxToConcreteValMap:
              if ArgIdxToConcreteValMap[Idx] != None:
                print("INDEX DOES NOT MAP TO NONE")
                Arg = Function.getArg(Idx)
                print("Arg:")
                Arg.print()
                Arg.getType().print()
                print("FunctionInfo.getConcreteValFor(Arg):")
                FunctionInfo.getConcreteValFor(Arg).print()
                FunctionInfo.getConcreteValFor(Arg).getType().print()
                Function.replaceUsesWith(Arg, FunctionInfo.getConcreteValFor(Arg))
                FunctionInfo.eraseConcreteValForArg(Arg)
                Function.eraseArg(Idx)
                ModificationMade = True
          if Function in FunctionToDeadLoops:
            for Loop in FunctionToDeadLoops[Function]:
              print("DEAD LOOP:")
              Loop.print()
              print("FUNCTION:")
              Function.print()
              self.removeDeadLoop(FunctionInfo, Function, Loop)
          print("NEW FUNCTION:")
          Function.print()
          ErasedArgs = self.removeDeadArguments(FunctionInfo, Function)
          if ModificationMade == True or len(FunctionToDeadLoops[Function]) != 0\
               or ErasedArgs == True:
            self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(Function)
      else:
        # Remove dead outer loops
        Function = EquivalenceClass.getAFunction()
        FunctionInfo = self.FunctionToFunctionInfo[Function]
        LoopList = Function.getRegionsOfType(RoseForLoop)
        DeadLoops = list()
        for Loop in LoopList:
          assert not isinstance(Loop, RoseUndefRegion)
          if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
              == FunctionInfo.getConcreteValFor(Loop.getStep()):
            DeadLoops.append(Loop)
        for Loop in DeadLoops:
          if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
              == FunctionInfo.getConcreteValFor(Loop.getStep()):
            self.removeDeadLoop(FunctionInfo, Function, Loop)
        ErasedArgs = self.removeDeadArguments(FunctionInfo, Function)
        if len(DeadLoops) != 0 or ErasedArgs == True:
          self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(Function)
        print("--NEW FUNCTION:")
        Function.print()


  def verifyParallel(self, FunctionInfo1 : RoseFunctionInfo, \
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


  def HandleEqToEq(self, FunctionInfo, CheckFunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    CheckFunction = CheckFunctionInfo.getLatestFunction()
    #assert EquivalentClass in self.EquivalenceClasses
    #assert CheckedEquivalentClass in self.EquivalenceClasses
    FunctionToEquivalenceClassMapLock.acquire()
    EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
    CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
    FunctionToEquivalenceClassMapLock.release()
    if EquivalentClass == CheckedEquivalentClass:
      return
    # Do we know what the equivalence relation between the two classes?
    EQToEQMapLock.acquire()
    Condition = (EquivalentClass, CheckedEquivalentClass) not in self.EQToEQMap
    EQToEQMapLock.release()
    if Condition == True:
      #assert (CheckedEquivalentClass, EquivalentClass) not in self.EQToEQMap
      VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo) 
      EQToEQMapLock.acquire()
      self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
      self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
      EQToEQMapLock.release()
    
  
  def HandleEqToNone(self, FunctionInfo, CheckFunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    CheckFunction = CheckFunctionInfo.getLatestFunction()
    #assert EquivalentClass in self.EquivalenceClasses
    VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
    if VerifyResult == True:
      print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
      FunctionToEquivalenceClassMapLock.acquire()
      EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
      EquivalentClass.addFunction(CheckFunction)
      EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                    CheckFunctionInfo.getArgsToConcreteValMap())
      self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
      FunctionToEquivalenceClassMapLock.release()
    else:
      CheckedEquivalentClass = RoseEquivalenceClass()
      print("--Added {} to new eq class".format(CheckFunction.getName()))
      CheckedEquivalentClass.addFunction(CheckFunction)
      CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                    CheckFunctionInfo.getArgsToConcreteValMap())
      FunctionToEquivalenceClassMapLock.acquire()
      self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
      FunctionToEquivalenceClassMapLock.release()
      EQToEQMapLock.acquire()
      self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
      self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
      EQToEQMapLock.release()


  def HandleNoneToEq(self, FunctionInfo, CheckFunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    CheckFunction = CheckFunctionInfo.getLatestFunction()
    #assert CheckedEquivalentClass in self.EquivalenceClasses
    VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
    if VerifyResult == True:
      print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
      FunctionToEquivalenceClassMapLock.acquire()
      CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
      CheckedEquivalentClass.addFunction(Function)
      CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                    FunctionInfo.getArgsToConcreteValMap())
      self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
      FunctionToEquivalenceClassMapLock.release()
    else:
      EquivalentClass = RoseEquivalenceClass()
      print("--Added {} to new eq class".format(Function.getName()))
      EquivalentClass.addFunction(Function)
      EquivalentClass.addFunctToArgsMapping(Function, \
                                    FunctionInfo.getArgsToConcreteValMap()) 
      FunctionToEquivalenceClassMapLock.acquire()
      self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
      FunctionToEquivalenceClassMapLock.release()
      EQToEQMapLock.acquire()
      self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
      self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
      EQToEQMapLock.release()
        

  def HandleNoneToNone(self, FunctionInfo, CheckFunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    CheckFunction = CheckFunctionInfo.getLatestFunction()
    VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
    if VerifyResult == True:
      EquivalentClass = RoseEquivalenceClass()
      EquivalentClass.addFunction(Function)
      EquivalentClass.addFunction(CheckFunction)
      EquivalentClass.addFunctToArgsMapping(Function, \
                                    FunctionInfo.getArgsToConcreteValMap())
      EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                    CheckFunctionInfo.getArgsToConcreteValMap()) 
      FunctionToEquivalenceClassMapLock.acquire()
      self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
      self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
      FunctionToEquivalenceClassMapLock.release()
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
      FunctionToEquivalenceClassMapLock.acquire()
      self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
      self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
      FunctionToEquivalenceClassMapLock.release()
      EQToEQMapLock.acquire()
      self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
      self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
      EQToEQMapLock.release()


  def lambdaFunctionForParallelSimilarityChecking(self, FunctionInfo):
    FunctionMap = {
      (True, True) : self.HandleEqToEq,
      (True, False) : self.HandleEqToNone,
      (False, True) : self.HandleNoneToEq,
      (False, False) : self.HandleNoneToNone,
    }
    Function = FunctionInfo.getLatestFunction()
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
      EquivalentClass = None
      CheckedEquivalentClass = None
      FunctionToEquivalenceClassMapLock.acquire()
      if Function in self.FunctionToEquivalenceClassMap:
        EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
      if CheckFunction in self.FunctionToEquivalenceClassMap:
        CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
      FunctionToEquivalenceClassMapLock.release()
      FunctionMap[(EquivalentClass != None, CheckedEquivalentClass != None)](FunctionInfo, CheckFunctionInfo)


  def lambdaFunctionForSimilarityChecking(self, FunctionInfo):
    Function = FunctionInfo.getLatestFunction()
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
      EquivalentClass = None
      CheckedEquivalentClass = None
      FunctionToEquivalenceClassMapLock.acquire()
      if Function in self.FunctionToEquivalenceClassMap:
        EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
      if CheckFunction in self.FunctionToEquivalenceClassMap:
        CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
      FunctionToEquivalenceClassMapLock.release()
      # Perform similarity checking
      # Case 1:
      if EquivalentClass != None and CheckedEquivalentClass != None:
        #assert EquivalentClass in self.EquivalenceClasses
        #assert CheckedEquivalentClass in self.EquivalenceClasses
        if EquivalentClass == CheckedEquivalentClass:
          continue
        # Do we know what the equivalence relation between the two classes?
        EQToEQMapLock.acquire()
        if (EquivalentClass, CheckedEquivalentClass) in self.EQToEQMap:
          assert (CheckedEquivalentClass, EquivalentClass) in self.EQToEQMap
          VerifyResult = self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)]
          EQToEQMapLock.release()
        else:
          EQToEQMapLock.release()
          VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo) 
          if VerifyResult == True:
            print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
            # Merge the two equivalent classes
            EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
            EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
            FunctionToEquivalenceClassMapLock.acquire()
            for EqFunction in EqFunctions:
              self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
            FunctionToEquivalenceClassMapLock.release()
            EquivalenceClassesLock.acquire()
            if CheckedEquivalentClass in self.EquivalenceClasses:
              self.EquivalenceClasses.remove(CheckedEquivalentClass)
            EquivalenceClassesLock.release()
          EQToEQMapLock.acquire()
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          EQToEQMapLock.release()
        continue
      # Case 2:
      if EquivalentClass == None and CheckedEquivalentClass != None:
        #assert CheckedEquivalentClass in self.EquivalenceClasses
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          EquivalenceClassesLock.acquire()
          if CheckedEquivalentClass in self.EquivalenceClasses:
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
          EquivalenceClassesLock.release()
          print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
          CheckedEquivalentClass.addFunction(Function)
          CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap())
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          EquivalenceClassesLock.release()
        else:
          EquivalentClass = RoseEquivalenceClass()
          print("--Added {} to new eq class".format(Function.getName()))
          EquivalentClass.addFunction(Function)
          EquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap()) 
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(EquivalentClass)
          EquivalenceClassesLock.release()
          EQToEQMapLock.acquire()
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          EQToEQMapLock.release()
        continue
      # Case 3:
      if EquivalentClass != None and CheckedEquivalentClass == None:
        #assert EquivalentClass in self.EquivalenceClasses
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          EquivalenceClassesLock.acquire()
          if EquivalentClass in self.EquivalenceClasses:
            self.EquivalenceClasses.remove(EquivalentClass)
          EquivalenceClassesLock.release()
          print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
          EquivalentClass.addFunction(CheckFunction)
          EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap())   
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(EquivalentClass)
          EquivalenceClassesLock.release()
        else:
          CheckedEquivalentClass = RoseEquivalenceClass()
          print("--Added {} to new eq class".format(CheckFunction.getName()))
          CheckedEquivalentClass.addFunction(CheckFunction)
          CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap())
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          EquivalenceClassesLock.release()
          EQToEQMapLock.acquire()
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          EQToEQMapLock.release()
        continue
      # Case 4:
      if EquivalentClass == None and CheckedEquivalentClass == None:
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          EquivalentClass = RoseEquivalenceClass()
          EquivalentClass.addFunction(Function)
          EquivalentClass.addFunction(CheckFunction)
          EquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap())
          EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap()) 
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(EquivalentClass)
          EquivalenceClassesLock.release()
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
          FunctionToEquivalenceClassMapLock.acquire()
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
          FunctionToEquivalenceClassMapLock.release()
          EquivalenceClassesLock.acquire()
          self.EquivalenceClasses.add(EquivalentClass)
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          EquivalenceClassesLock.release()
          EQToEQMapLock.acquire()
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          EQToEQMapLock.release()
        continue


  def lambdaFunctionForSimilarityChecking2(self, FunctionInfo):
    Function = FunctionInfo.getLatestFunction()
    EquivalentClass = None
    #print("ACQUIRE1 {}".format(threading.current_thread().ident))
    RegionLock.acquire()
    #print("ACQUIRED1 {}".format(threading.current_thread().ident))
    if Function in self.FunctionToEquivalenceClassMap:
      EquivalentClass = self.FunctionToEquivalenceClassMap[Function]
    #print("RELEASE1 {}".format(threading.current_thread().ident))
    RegionLock.release()
    #print("RELEASED1 {}".format(threading.current_thread().ident))
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
      #print("ACQUIRE2 {}".format(threading.current_thread().ident))
      RegionLock.acquire()
      #print("ACQUIRED2 {}".format(threading.current_thread().ident))
      if CheckFunction in self.FunctionToEquivalenceClassMap:
        CheckedEquivalentClass = self.FunctionToEquivalenceClassMap[CheckFunction]
      #print("RELEASE2 {}".format(threading.current_thread().ident))
      RegionLock.release()
      #print("RELEASED2 {}".format(threading.current_thread().ident))
      # Perform similarity checking
      # Case 1:
      if EquivalentClass != None and CheckedEquivalentClass != None:
        #assert EquivalentClass in self.EquivalenceClasses
        #assert CheckedEquivalentClass in self.EquivalenceClasses
        if EquivalentClass == CheckedEquivalentClass:
          continue
        # Do we know what the equivalence relation between the two classes?
        #print("ACQUIRE3 {}".format(threading.current_thread().ident))
        RegionLock.acquire()
        #print("ACQUIRED3 {}".format(threading.current_thread().ident))
        if (EquivalentClass, CheckedEquivalentClass) in self.EQToEQMap:
          assert (CheckedEquivalentClass, EquivalentClass) in self.EQToEQMap
          VerifyResult = self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)]
          #print("RELEASE3 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED3 {}".format(threading.current_thread().ident))
        else:
          #print("--RELEASE3 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("--RELEASED3 {}".format(threading.current_thread().ident))
          VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo) 
          if VerifyResult == True:
            print("Merged {} and {} eq class".format(Function.getName(), CheckFunction.getName()))
            # Merge the two equivalent classes
            EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
            EquivalentClass.extend(EqFunctions, CheckedEquivalentClass.getFunctToArgsMapping())
            #print("ACQUIRE4 {}".format(threading.current_thread().ident))
            RegionLock.acquire()
            #print("ACQUIRED4 {}".format(threading.current_thread().ident))
            for EqFunction in EqFunctions:
              self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
            if CheckedEquivalentClass in self.EquivalenceClasses:
              self.EquivalenceClasses.remove(CheckedEquivalentClass)
            #print("RELEASE4 {}".format(threading.current_thread().ident))
            RegionLock.release()
            #print("RELEASED4 {}".format(threading.current_thread().ident))
          #print("ACQUIRE5 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED5 {}".format(threading.current_thread().ident))
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          #print("RELEASE5 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED5 {}".format(threading.current_thread().ident))
        continue
      # Case 2:
      if EquivalentClass == None and CheckedEquivalentClass != None:
        #assert CheckedEquivalentClass in self.EquivalenceClasses
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          #print("ACQUIRE6 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED6 {}".format(threading.current_thread().ident))
          if CheckedEquivalentClass in self.EquivalenceClasses:
            self.EquivalenceClasses.remove(CheckedEquivalentClass)
          #print("RELEASE6 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED6 {}".format(threading.current_thread().ident))
          print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
          CheckedEquivalentClass.addFunction(Function)
          CheckedEquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap())
          #print("ACQUIRE7 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED7 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          #print("RELEASE7 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED7 {}".format(threading.current_thread().ident))
        else:
          EquivalentClass = RoseEquivalenceClass()
          print("--Added {} to new eq class".format(Function.getName()))
          EquivalentClass.addFunction(Function)
          EquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap()) 
          #print("ACQUIRE8 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED8 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.EquivalenceClasses.add(EquivalentClass)
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          #print("RELEASE8 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED8 {}".format(threading.current_thread().ident))
        continue
      # Case 3:
      if EquivalentClass != None and CheckedEquivalentClass == None:
        #assert EquivalentClass in self.EquivalenceClasses
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          #print("ACQUIRE9 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED9 {}".format(threading.current_thread().ident))
          if EquivalentClass in self.EquivalenceClasses:
            self.EquivalenceClasses.remove(EquivalentClass)
          #print("RELEASE9 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED9 {}".format(threading.current_thread().ident))
          print("--Added {} and {} to existing eq class".format(CheckFunction.getName(), Function.getName()))
          EquivalentClass.addFunction(CheckFunction)
          EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap())   
          #print("ACQUIRE10 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED10 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
          self.EquivalenceClasses.add(EquivalentClass)
          #print("RELEASE10 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED10 {}".format(threading.current_thread().ident))
        else:
          CheckedEquivalentClass = RoseEquivalenceClass()
          print("--Added {} to new eq class".format(CheckFunction.getName()))
          CheckedEquivalentClass.addFunction(CheckFunction)
          CheckedEquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap())
          #print("ACQUIRE11 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED11 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          #print("RELEASE11 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED11 {}".format(threading.current_thread().ident))
        continue
      # Case 4:
      if EquivalentClass == None and CheckedEquivalentClass == None:
        VerifyResult = self.verifyParallel(FunctionInfo, CheckFunctionInfo)
        if VerifyResult == True:
          EquivalentClass = RoseEquivalenceClass()
          EquivalentClass.addFunction(Function)
          EquivalentClass.addFunction(CheckFunction)
          EquivalentClass.addFunctToArgsMapping(Function, \
                                        FunctionInfo.getArgsToConcreteValMap())
          EquivalentClass.addFunctToArgsMapping(CheckFunction, \
                                        CheckFunctionInfo.getArgsToConcreteValMap()) 
          #print("ACQUIRE12 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED12 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
          self.EquivalenceClasses.add(EquivalentClass)
          #print("RELEASE12 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED12 {}".format(threading.current_thread().ident))
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
          #print("ACQUIRE13 {}".format(threading.current_thread().ident))
          RegionLock.acquire()
          #print("ACQUIRED13 {}".format(threading.current_thread().ident))
          self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
          self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
          self.EquivalenceClasses.add(EquivalentClass)
          self.EquivalenceClasses.add(CheckedEquivalentClass)
          self.EQToEQMap[(EquivalentClass, CheckedEquivalentClass)] = VerifyResult
          self.EQToEQMap[(CheckedEquivalentClass, EquivalentClass)] = VerifyResult
          #print("RELEASE13 {}".format(threading.current_thread().ident))
          RegionLock.release()
          #print("RELEASED13 {}".format(threading.current_thread().ident))
        continue


  #def populateEquivalenceClasses(self):

  def parallelizeSimilarityChecking(self):
    # Track verification results
    print("len(FunctionInfoList):")
    print(len(self.FunctionInfoList))
    Threads = list()
    for FunctionInfo in self.FunctionInfoList:
      Thread = threading.Thread(target=self.lambdaFunctionForParallelSimilarityChecking, args=(FunctionInfo,))
      Threads.append(Thread)
    for Thread in Threads:
      Thread.start()
    for Thread in Threads:
      Thread.join()
    # Try another heuristic
    print("****TRY NEW HEURISTIC****")
    #self.reorderArgsAndPerformSimilarityChecking()
    #self.eliminateUnecessaryArgs()
    # Summmarize
    self.summarize()
    # Generate LLVM intrinsics
    #self.genLLVMIntrinsics()
    # Generate Rose IR to LLVM IR mappings
    #self.genRoseIRToLLVMIRMappings()



if __name__ == '__main__':
  #SimilarityChecker = RoseSimilarityChecker(["Hexagon"])
  SimilarityChecker = RoseSimilarityChecker(["x86"])
  SimilarityChecker.performSimilarityChecking()
  #SimilarityChecker.parallelizeSimilarityChecking()


