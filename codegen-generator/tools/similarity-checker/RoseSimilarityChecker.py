#############################################################
#
# This is the similarity checking tool
#
#############################################################


from RoseAbstractions import *
from RoseContext import *
# from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseCodeGenerator import *
from RoseToolsUtils import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *
from RoseSimilarityCheckerSummaryGen import *
from RoseValidityChecker import *
# from RoseLLVMIntrinsicsGen import *
# from RoseIRToLLVMMappingGen import *
from RoseTargetInfo import *
from RoseTransformationsVerifier import *
from RoseSimilarityCheckerParallel import RoseSimilarityCheckerParallel

from copy import deepcopy


NumThreads = 96
ParallelChecker = 1 # Enable by default

EliminateUnnecessaryArgs = False


class RoseSimilarityChecker():
    def __init__(self, TargetList: list):
        self.TargetList = TargetList
        self.FunctionInfoList = list()
        self.FunctionInfoListToTarget = dict()
        self.FunctionToFunctionInfo = dict()
        self.FunctionToRosetteCodeMap = dict()
        self.EquivalenceClasses = set()
        self.FunctionToEquivalenceClassMap = dict()
        self.CopyFunctionToOriginalFunction = dict()
        self.FunctionToArgPermutationMap = dict()
        self.FunctionToCopies = dict()
        self.EQToEQMap = dict()
        self.initializeSimilarityChecker()

    def initializeSimilarityChecker(self):
        for TargetName in self.TargetList:
            # Generate code for all semantics first
            CodeGenerator = RoseCodeGenerator(TargetName)
            FunctionInfoList = CodeGenerator.codeGen(ExtractConstants=False,
                                                     JustGenRosette=False, NumThreads=NumThreads)
            # Compute some semantics info for the functions
            for FunctionInfo in FunctionInfoList:
                FunctionInfo.computeSemanticsInfoFromTargetSpecficFunction()
                FunctionInfo.print()
            # Check the validity of a functioninfo
            # Checker = RoseValidityChecker(TargetName)
            # ValidFunctionInfoList = list()
            # for FunctionInfo in FunctionInfoList:
            #  if Checker.isValid(FunctionInfo):
            #    ValidFunctionInfoList.append(FunctionInfo)
            # Create target info
            TargetInfo = RoseTargetInfo(TargetName)
            # Generate code for all semantics first
            CodeGenerator = RoseCodeGenerator(TargetName)
            FunctionInfoList = list()
            # for FunctionInfo in ValidFunctionInfoList:
            #  # Undo the transformations performed on the original function
            #  FunctionInfo.destroyAllRecentFunctionVersions()
            #  print("LATEST FUNCTION:")
            #  FunctionInfo.getLatestFunction().print()
            #  FunctionInfoList.append(CodeGenerator.codeGen(FunctionInfo=FunctionInfo, \
            #                                                ExtractConstants=True))
            FunctionInfoList = CodeGenerator.codeGen(
                ExtractConstants=True, NumThreads=NumThreads)
            self.FunctionInfoList.extend(FunctionInfoList)
            # Generate rosette code
            for FunctionInfo in FunctionInfoList:
                Function = FunctionInfo.getLatestFunction()
                FunctionInfo.computeSemanticsInfo()
                FunctionInfo.print()
                self.FunctionInfoListToTarget[FunctionInfo] = TargetInfo
                self.FunctionToFunctionInfo[Function] = FunctionInfo
                assert not isinstance(Function, RoseUndefRegion)
                self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(
                    Function)
                print("FunctionInfo.ArgsToConcreteValMap:")
                for Arg, Val in FunctionInfo.ArgsToConcreteValMap.items():
                    print("ARG:")
                    Arg.print()
                    print("VAL:")
                    Val.print()
                print("________________________________________")
                print("self.FunctionToRosetteCodeMap[Function]:")
                print(self.FunctionToRosetteCodeMap[Function])
                # Let's verify if our transformations are corect
                TargetSpecificFunction = FunctionInfo.getTargetSpecificFunction()
                print("TARGET SPECIFIC FUNCTION:")
                TargetSpecificInfo = RoseFunctionInfo()
                TargetSpecificInfo.addFunctionAtNewStage(
                    TargetSpecificFunction)
                TargetSpecificFunction.print()
                print("COPY TARGET AGNOSTIC FUNCTION:")
                FunctionInfo.getLatestFunction().print()
                # Replace uses of concrete arguments and try verifying again
                CopyFunctionInfo = self.replaceUsesofConcreteArgsAndGetFunction(
                    FunctionInfo)
                CopyFunctionInfo.getLatestFunction().print()
                Verifier = RoseTransformationVerifier(
                    TargetSpecificInfo, CopyFunctionInfo)
                assert Verifier.verifyEquivalence() == True
                print("TARGET SPECIFIC FUNCTION:")
                TargetSpecificFunction.print()
                print("TARGET AGNOSTIC FUNCTION:")
                FunctionInfo.getLatestFunction().print()
                Verifier = RoseTransformationVerifier(
                    TargetSpecificInfo, FunctionInfo)
                assert Verifier.verifyEquivalence() == True
                # Map the target agnostic funtion to target specific
                ArgPermutation = self.getArgPermutation(FunctionInfo)
                self.FunctionToArgPermutationMap[FunctionInfo.getLatestFunction(
                )] = ArgPermutation
                print("!!!!!!!!!!!!!!!!!ORIGINAL FUNCTION:")
                FunctionInfo.getTargetSpecificFunction().print()
            print("ALL VERIFICATION DONE")

    def getArgPermutation(self, FunctionInfo: RoseFunctionInfo):
        ArgPermutation = list()
        for Arg in FunctionInfo.getLatestFunction().getArgs():
            if not isinstance(Arg.getType(), RoseBitVectorType):
                ArgPermutation.append(-1)
                continue
            if not isinstance(Arg.getType().getBitwidth(), RoseArgument):
                if Arg in FunctionInfo.getTargetSpecificFunction().getArgs():
                    ArgPermutation.append(
                        FunctionInfo.getTargetSpecificFunction().getIndexOfArg(Arg))
                else:
                    ArgPermutation.append(-1)
                continue
            assert FunctionInfo.argHasConcreteVal(
                Arg.getType().getBitwidth()) == True
            print("\n\n______________________________________________")
            ClonedArg = Arg.clone()
            print("Arg.getType().getBitwidth():")
            print(Arg.getType().getBitwidth())
            print("ClonedArg.getType().getBitwidth():")
            print(ClonedArg.getType().getBitwidth())
            print(
                "FunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth():")
            print(FunctionInfo.getConcreteValFor(Arg.getType().getBitwidth()))
            if isinstance(Arg.getType(), RoseBitVectorType):
                ClonedArg.setType(RoseBitVectorType.create(
                    FunctionInfo.getConcreteValFor(Arg.getType().getBitwidth()).getValue()))
            else:
                assert isinstance(Arg.getType(), RoseIntegerType)
                ClonedArg.setType(RoseIntegerType.create(
                    FunctionInfo.getConcreteValFor(Arg.getType().getBitwidth()).getValue()))
            print("Arg:")
            Arg.print()
            Arg.getType().print()
            print(Arg.getType())
            print(Arg.getType().getBitwidth())
            print("ARG ID:")
            print(Arg.ID)
            print("ClonedArg:")
            ClonedArg.print()
            ClonedArg.getType().print()
            print(ClonedArg.getType())
            print(ClonedArg.getType().getBitwidth())
            print("CLONED ARG ID:")
            print(ClonedArg.ID)
            if ClonedArg in FunctionInfo.getTargetSpecificFunction().getArgs():
                ArgPermutation.append(
                    FunctionInfo.getTargetSpecificFunction().getIndexOfArg(ClonedArg))
            else:
                ArgPermutation.append(-1)
        return ArgPermutation

    def replaceUsesofConcreteArgsAndGetFunction(self, FunctionInfo: RoseFunctionInfo, DoNotCopy: bool = False):
        print("*****FunctionInfo.ArgsToConcreteValMap:")
        for Arg, Val in FunctionInfo.ArgsToConcreteValMap.items():
            print("ARG:")
            Arg.print()
            print(Arg.ID)
            print("VAL:")
            Val.print()
            Arg.getType().print()
        print("________________________________________")
        Function = FunctionInfo.getLatestFunction()
        if DoNotCopy == True:
            CopyFunctionInfo = FunctionInfo
            CopyFunction = Function
        else:
            CopyFunctionInfo = RoseFunctionInfo()
            CopyFunction = Function.clone()
            print("CopyFunction:")
            CopyFunction.print()
            CopyFunctionInfo.addFunctionAtNewStage(CopyFunction)
        NumArgs = Function.getNumArgs()
        for Idx in range(NumArgs - 1, -1, -1):
            CopyArg = CopyFunction.getArg(Idx)
            OriginalArg = Function.getArg(Idx)
            print("REMVING ARG:")
            CopyArg.print()
            if FunctionInfo.argHasConcreteVal(OriginalArg) == True:
                self.replaceUsesInRegion(
                    CopyFunction, CopyArg, FunctionInfo.getConcreteValFor(OriginalArg))
                CopyFunction.eraseArg(Idx)
                print("------CopyFunction:")
                CopyFunction.print()
        CopyFunctionInfo.addFunctionAtNewStage(CopyFunction)
        RoseOpSimplify.Run(CopyFunction, FunctionInfo.getContext())
        CopyFunctionInfo.addFunctionAtNewStage(CopyFunction)
        print("--FINAL CopyFunction:")
        CopyFunction.print()
        return CopyFunctionInfo

    def genSymbolicInput(self, FunctionInfo, Param, NameSuffix):
        print("GENERATE SYMBOLIC INPUT")
        Bitwidth = Param.getType().getBitwidth()
        print("Bitwidth:")
        print(Bitwidth)
        if isinstance(Bitwidth, RoseValue):
            if isinstance(Bitwidth, RoseConstant):
                Bitwidth = Bitwidth.getValue()
            else:
                # There better be a concrete value
                Bitwidth = FunctionInfo.getConcreteValFor(Bitwidth).getValue()
        Input = "(define-symbolic {} (bitvector {}))\n".format(Param.getName() + NameSuffix,
                                                               str(Bitwidth))
        return Input

    def genConcreteInput(self, Param: RoseArgument, ConcreteArg: RoseConstant, NameSuffix: str):
        assert isinstance(ConcreteArg, RoseConstant)
        Input = "(define {} {})\n".format(Param.getName() +
                                          NameSuffix, GenConcreteValue(ConcreteArg))
        return Input

    def qualifiesForSimilarityChecking(self, FunctionInfo1: RoseFunctionInfo,
                                       FunctionInfo2: RoseFunctionInfo):
        Function1 = FunctionInfo1.getLatestFunction()
        Function2 = FunctionInfo2.getLatestFunction()
        if Function1.getNumArgs() != Function2.getNumArgs():
            return False

        def GetSymbolicAndConcreteArgs(FunctionInfo: RoseFunctionInfo):
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
        SymbolicArgs1, ConcreteArgs1 = GetSymbolicAndConcreteArgs(
            FunctionInfo1)
        SymbolicArgs2, ConcreteArgs2 = GetSymbolicAndConcreteArgs(
            FunctionInfo2)
        # if len(ConcreteArgs1) != len(ConcreteArgs2):
        #  return False
        # if len(SymbolicArgs1) != len(SymbolicArgs2):
        #  return False
        for Arg1, Arg2 in zip(Function1.getArgs(), Function2.getArgs()):
            if type(Arg1.getType()) != type(Arg2.getType()):
                return False
        # The types of the concrete values must be the same.
        # for ConcreteVal1, ConcreteVal2 in zip(ConcreteArgs1, ConcreteArgs2):
        #  if ConcreteVal1.getType() != ConcreteVal2.getType():
        #    return False
        # TODO: Are there other weed out criteria?
        return True

    def emitVerificationCodeForFunction(self, FunctionInfo: RoseFunctionInfo, NameSuffix: str):
        Function = FunctionInfo.getLatestFunction()
        Code = ""
        for Arg in Function.getArgs():
            if FunctionInfo.argHasConcreteVal(Arg) == False:
                Code += self.genSymbolicInput(FunctionInfo, Arg, NameSuffix)
            else:
                ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
                Code += self.genConcreteInput(Arg, ConcreteVal, NameSuffix)
        return Code

    def emitVerificationCodeFor(self, FunctionInfo1: RoseFunctionInfo,
                                FunctionInfo2: RoseFunctionInfo):
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
        print("PERFORMING VERIFICATION")
        Function1 = FunctionInfo1.getLatestFunction()
        Function2 = FunctionInfo2.getLatestFunction()
        print("FUNCTION1:")
        Function1.print()
        print("FUNCTION2:")
        Function2.print()
        # Rosette code headers
        Content = [
            "#lang rosette",
            "(require rosette/lib/synthax)",
            "(require rosette/lib/angelic)",
            "(require racket/pretty)",
            "(require \"RosetteOpsImpl.rkt\")\n"
        ]
        # Content.append("(custodian-limit-memory (current-custodian) (* 1024 1024))")
        # Generate rosette code
        Content.append(self.FunctionToRosetteCodeMap[Function1])
        Content.append(self.FunctionToRosetteCodeMap[Function2])
        # Generate verification code on first set of inputs
        NameSuffix = "_1"
        Content.append(self.emitVerificationCodeForFunction(
            FunctionInfo1, NameSuffix))
        ArgNamesList1 = [Arg.getName() for Arg in Function1.getArgs()]
        ArgNamesList1String = ""
        for Name in ArgNamesList1:
            ArgNamesList1String += Name + NameSuffix + " "
        Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(Function1.getName(),
                                                                             ArgNamesList1String, Function2.getName(), ArgNamesList1String, NameSuffix))
        # Generate verification code on second set of inputs
        NameSuffix = "_2"
        Content.append(self.emitVerificationCodeForFunction(
            FunctionInfo2, NameSuffix))
        ArgNamesList2 = [Arg.getName() for Arg in Function2.getArgs()]
        ArgNamesList2String = ""
        for Name in ArgNamesList2:
            ArgNamesList2String += Name + NameSuffix + " "
        Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(Function1.getName(),
                                                                             ArgNamesList2String, Function2.getName(), ArgNamesList2String))
        return "\n".join(Content)

    def verify(self, FunctionInfo1: RoseFunctionInfo,
               FunctionInfo2: RoseFunctionInfo, Suffix: str = None):
        if self.qualifiesForSimilarityChecking(FunctionInfo1, FunctionInfo2) == False:
            return False
        # Generate verification code
        Code = self.emitVerificationCodeFor(FunctionInfo1, FunctionInfo2)
        Function1 = FunctionInfo1.getLatestFunction()
        Function2 = FunctionInfo2.getLatestFunction()
        if Suffix == None:
            FileName = "test_" + Function1.getName() + "_" + Function2.getName() + ".rkt"
        else:
            assert isinstance(Suffix, str)
            FileName = "test_" + Function1.getName() + "_" + Function2.getName() + \
                "." + Suffix + ".rkt"
        try:
            File = open(FileName, "w+")
            File.write(Code)
            File.close()
            # Perform verification
            Output, Err = RunCommand("racket {}".format(FileName), Timeout=10)
            RunCommand("killall z3")
            RunCommand("killall racket")
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
        SummaryGen = RoseSimilarityCheckerSummaryGen(self.FunctionToFunctionInfo,
                                                     self.FunctionToRosetteCodeMap, self.FunctionToArgPermutationMap,
                                                     self.EquivalenceClasses)
        SummaryGen.summarize(SummaryFileName)
        return True

    # def genLLVMIntrinsics(self):
    #  IntrinsicsFileName = "hydride_llvm_intrinsics.td"
    #  LLVMIntrinsicsGen = RoseLLVMIntrinsicsGen(self.EquivalenceClasses)
    #  LLVMIntrinsicsGen.generateLLVMIntrinsics(IntrinsicsFileName)

    # def genRoseIRToLLVMIRMappings(self):
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
                        assert (CheckedEquivalentClass,
                                EquivalentClass) in EQToEQMap
                        VerifyResult = EQToEQMap[(
                            EquivalentClass, CheckedEquivalentClass)]
                    else:
                        VerifyResult = self.verify(
                            FunctionInfo, CheckFunctionInfo)
                        if VerifyResult == True:
                            print("Merged {} and {} eq class".format(
                                Function.getName(), CheckFunction.getName()))
                            # Merge the two equivalent classes
                            EqFunctions = CheckedEquivalentClass.getEquivalentFunctions()
                            EquivalentClass.extend(
                                EqFunctions, CheckedEquivalentClass.getFunctionToArgsMapping())
                            for EqFunction in EqFunctions:
                                self.FunctionToEquivalenceClassMap[EqFunction] = EquivalentClass
                            self.EquivalenceClasses.remove(
                                CheckedEquivalentClass)
                        EQToEQMap[(EquivalentClass,
                                   CheckedEquivalentClass)] = VerifyResult
                        EQToEQMap[(CheckedEquivalentClass,
                                   EquivalentClass)] = VerifyResult
                    continue
                # Case 2:
                if EquivalentClass == None and CheckedEquivalentClass != None:
                    assert CheckedEquivalentClass in self.EquivalenceClasses
                    VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
                    if VerifyResult == True:
                        self.EquivalenceClasses.remove(CheckedEquivalentClass)
                        print("--Added {} and {} to existing eq class".format(
                            CheckFunction.getName(), Function.getName()))
                        CheckedEquivalentClass.addFunction(Function)
                        CheckedEquivalentClass.addFunctionToArgsMapping(Function,
                                                                        FunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[Function] = CheckedEquivalentClass
                        self.EquivalenceClasses.add(CheckedEquivalentClass)
                    else:
                        EquivalentClass = RoseEquivalenceClass()
                        print("--Added {} to new eq class".format(Function.getName()))
                        EquivalentClass.addFunction(Function)
                        EquivalentClass.addFunctionToArgsMapping(Function,
                                                                 FunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
                        self.EquivalenceClasses.add(EquivalentClass)
                        EQToEQMap[(EquivalentClass,
                                   CheckedEquivalentClass)] = VerifyResult
                        EQToEQMap[(CheckedEquivalentClass,
                                   EquivalentClass)] = VerifyResult
                    continue
                # Case 3:
                if EquivalentClass != None and CheckedEquivalentClass == None:
                    assert EquivalentClass in self.EquivalenceClasses
                    VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
                    if VerifyResult == True:
                        self.EquivalenceClasses.remove(EquivalentClass)
                        print("--Added {} and {} to existing eq class".format(
                            CheckFunction.getName(), Function.getName()))
                        EquivalentClass.addFunction(CheckFunction)
                        EquivalentClass.addFunctionToArgsMapping(CheckFunction,
                                                                 CheckFunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
                        self.EquivalenceClasses.add(EquivalentClass)
                    else:
                        CheckedEquivalentClass = RoseEquivalenceClass()
                        print(
                            "--Added {} to new eq class".format(CheckFunction.getName()))
                        CheckedEquivalentClass.addFunction(CheckFunction)
                        CheckedEquivalentClass.addFunctionToArgsMapping(CheckFunction,
                                                                        CheckFunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
                        self.EquivalenceClasses.add(CheckedEquivalentClass)
                        EQToEQMap[(EquivalentClass,
                                   CheckedEquivalentClass)] = VerifyResult
                        EQToEQMap[(CheckedEquivalentClass,
                                   EquivalentClass)] = VerifyResult
                    continue
                # Case 4:
                if EquivalentClass == None and CheckedEquivalentClass == None:
                    VerifyResult = self.verify(FunctionInfo, CheckFunctionInfo)
                    if VerifyResult == True:
                        EquivalentClass = RoseEquivalenceClass()
                        EquivalentClass.addFunction(Function)
                        EquivalentClass.addFunction(CheckFunction)
                        EquivalentClass.addFunctionToArgsMapping(Function,
                                                                 FunctionInfo.getArgsToConcreteValMap())
                        EquivalentClass.addFunctionToArgsMapping(CheckFunction,
                                                                 CheckFunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
                        self.FunctionToEquivalenceClassMap[CheckFunction] = EquivalentClass
                        self.EquivalenceClasses.add(EquivalentClass)
                    else:
                        EquivalentClass = RoseEquivalenceClass()
                        CheckedEquivalentClass = RoseEquivalenceClass()
                        print("--Added {} and {} to new eq classes".format(
                            CheckFunction.getName(), Function.getName()))
                        EquivalentClass.addFunction(Function)
                        CheckedEquivalentClass.addFunction(CheckFunction)
                        EquivalentClass.addFunctionToArgsMapping(Function,
                                                                 FunctionInfo.getArgsToConcreteValMap())
                        CheckedEquivalentClass.addFunctionToArgsMapping(CheckFunction,
                                                                        CheckFunctionInfo.getArgsToConcreteValMap())
                        self.FunctionToEquivalenceClassMap[Function] = EquivalentClass
                        self.FunctionToEquivalenceClassMap[CheckFunction] = CheckedEquivalentClass
                        self.EquivalenceClasses.add(EquivalentClass)
                        self.EquivalenceClasses.add(CheckedEquivalentClass)
                        EQToEQMap[(EquivalentClass,
                                   CheckedEquivalentClass)] = VerifyResult
                        EQToEQMap[(CheckedEquivalentClass,
                                   EquivalentClass)] = VerifyResult
                    continue
        # Try another heuristic
        for EquivalentClass in self.EquivalenceClasses:
            print("Immediate summary:")
            for Function in EquivalentClass.getEquivalentFunctions():
                print(Function.getName())
            print("******************************")
        # breakpoint()
        print("****TRY NEW HEURISTIC****")
        self.reorderArgsAndPerformSimilarityChecking()
        # print("****TRY ANOTHER HEURISTIC****")
        # self.refineSimilarityChecking()
        if EliminateUnnecessaryArgs == True:
            print("****ELIMINATE ARGUMENTS****")
            self.eliminateUnecessaryArgs()
        else:
            self.genArgPermuatationsForEquivalenceClasses()
        # Summmarize
        self.summarize()
        # Generate LLVM intrinsics
        # self.genLLVMIntrinsics()
        # Generate Rose IR to LLVM IR mappings
        # self.genRoseIRToLLVMIRMappings()

    def doFunctionsQualifyForSimilarityChecking(self, Function1: RoseFunction, Function2: RoseFunction):
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
        # Number of mask and selet operations must be the same as well.
        # TODO: Are there other weed out criteria?
        return True

    def createNewFunctionCopy(self, OriginalFunction: RoseFunction, NewArgList: list, Suffix: str = None):
        print("CREATING FUNCTION COPY")
        ClonedArgsList = list()
        ValueToValueMap = dict()
        for Arg in NewArgList:
            if Suffix != None:
                ClonedArg = Arg.clone(
                    Arg.getName() + "." + Suffix, ChangeID=True)
            else:
                ClonedArg = Arg.clone(ChangeID=True)
            ClonedArgsList.append(ClonedArg)
        ClonedFunction = RoseFunction.create(OriginalFunction.getName(), ClonedArgsList,
                                             OriginalFunction.getType().getReturnType())
        for Idx in range(ClonedFunction.getNumArgs()):
            ClonedFunction.getArg(Idx).setFunction(ClonedFunction)
            ValueToValueMap[NewArgList[Idx]] = ClonedFunction.getArg(Idx)
        ReturnValue = OriginalFunction.getReturnValue()
        if not isinstance(ReturnValue, RoseOperation) \
                and not isinstance(ReturnValue, RoseArgument):
            if Suffix != None:
                ClonedReturnVal = ReturnValue.clone(
                    ReturnValue.getName() + "." + Suffix, ChangeID=True)
            else:
                ClonedReturnVal = ReturnValue.clone(ChangeID=True)
            ClonedFunction.setRetVal(ClonedReturnVal)
            ValueToValueMap[ReturnValue] = ClonedReturnVal
            # print("RETURN VALUE MAPPED")
        for Abstraction in OriginalFunction:
            if Suffix != None:
                ClonedAbstraction = Abstraction.clone(
                    Suffix, ValueToValueMap, ChangeID=True)
            else:
                ClonedAbstraction = Abstraction.clone(
                    ValueToValueMap=ValueToValueMap, ChangeID=True)
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
        ValueToValueMap[ReturnValue] = ClonedFunction.getReturnValue()
        # Propagate type information
        print("PROPAGATING TYPE INFO")
        # Propagate types in all arguments
        BlockList = ClonedFunction.getRegionsOfType(RoseBlock)
        for Block in BlockList:
            for Op in Block:
                print("Op:")
                Op.print()
                if isinstance(Op, RoseBVInsertSliceOp):
                    continue
                if isinstance(Op.getType(), RoseBitVectorType) \
                        and not isinstance(Op.getType().getBitwidth(), int):
                    print("OLD TYPE:")
                    Op.getType().print()
                    if Op.getType().getBitwidth() in ValueToValueMap:
                        Op.setType(RoseBitVectorType.create(
                            ValueToValueMap[Op.getType().getBitwidth()]))
                        print("NEW TYPE:")
                        Op.getType().print()
                    continue
                if isinstance(Op.getType(), RoseIntegerType) \
                        and not isinstance(Op.getType().getBitwidth(), int):
                    print("OLD TYPE:")
                    Op.getType().print()
                    if Op.getType().getBitwidth() in ValueToValueMap:
                        Op.setType(RoseIntegerType.create(
                            ValueToValueMap[Op.getType().getBitwidth()]))
                        print("NEW TYPE:")
                        Op.getType().print()
                    continue
        # Propagate types in all arguments
        for Arg in ClonedFunction.getArgs():
            if isinstance(Arg.getType(), RoseBitVectorType) \
                    and not isinstance(Arg.getType().getBitwidth(), int):
                print("OLD TYPE:")
                Arg.getType().print()
                if Arg.getType().getBitwidth() in ValueToValueMap:
                    Arg.setType(RoseBitVectorType.create(
                        ValueToValueMap[Arg.getType().getBitwidth()]))
                    print("NEW TYPE:")
                    Arg.getType().print()
                continue
            if isinstance(Arg.getType(), RoseIntegerType) \
                    and not isinstance(Arg.getType().getBitwidth(), int):
                print("OLD TYPE:")
                Arg.getType().print()
                if Arg.getType().getBitwidth() in ValueToValueMap:
                    Arg.setType(RoseIntegerType.create(
                        ValueToValueMap[Arg.getType().getBitwidth()]))
                    print("NEW TYPE:")
                    Arg.getType().print()
                continue
        return ClonedFunction

    def getMaskArgsInFunction(self, Function: RoseFunction):
        # print("getMaskArgsInFunction")
        CondList = Function.getRegionsOfType(RoseCond)
        MaskList = set()
        for CondRegion in CondList:
            for Condition in CondRegion.getConditions():
                if isinstance(Condition, RoseOperation):
                    Worklist = list()
                    Worklist.append(Condition)
                    while len(Worklist) != 0:
                        Operation = Worklist.pop()
                        if not isinstance(Operation, RoseOperation):
                            continue
                        if isinstance(Operation, RoseBVExtractSliceOp):
                            if isinstance(Operation.getInputBitVector(), RoseArgument):
                                MaskList.add(Operation.getInputBitVector())
                                break
                            Worklist.append(Operation.getInputBitVector())
                            continue
                        if isinstance(Operation, RoseComparisonBitVectorOp):
                            for Operand in Operation.getOperands():
                                if isinstance(Operand, RoseArgument):
                                    MaskList.add(Operand)
                                    continue
                                Worklist.append(Operand)
                            continue
                        Worklist.extend(Operation.getOperands())
        return list(MaskList)

    def getConditionOpsArgsInFunction(self, Function: RoseFunction):
        BlockList = Function.getRegionsOfType(RoseBlock)
        ArgsInConditionOps = set()
        for Block in BlockList:
            for Op in Block:
                if isinstance(Op, RoseSelectOp):
                    if isinstance(Op.getThenValue(), RoseArgument):
                        ArgsInConditionOps.add(Op.getThenValue())
                    elif isinstance(Op.getThenValue(), RoseBVExtractSliceOp):
                        ArgsInConditionOps.add(
                            Op.getThenValue().getInputBitVector())
                    elif isinstance(Op.getThenValue(), RoseOperation):
                        Worklist = list()
                        Worklist.extend(Op.getThenValue().getOperands())
                        while len(Worklist) != 0:
                            Operation = Worklist.pop()
                            if not isinstance(Operation, RoseOperation):
                                continue
                            if isinstance(Operation, RoseBVExtractSliceOp):
                                if isinstance(Operation.getInputBitVector(), RoseArgument):
                                    ArgsInConditionOps.add(
                                        Operation.getInputBitVector())
                                    break
                                Worklist.append(Operation.getInputBitVector())
                                continue
                            Worklist.extend(Operation.getOperands())
                    if isinstance(Op.getElseValue(), RoseArgument):
                        ArgsInConditionOps.add(Op.getElseValue())
                    elif isinstance(Op.getElseValue(), RoseBVExtractSliceOp):
                        ArgsInConditionOps.add(
                            Op.getElseValue().getInputBitVector())
                    elif isinstance(Op.getElseValue(), RoseOperation):
                        Worklist = list()
                        Worklist.extend(Op.getElseValue().getOperands())
                        while len(Worklist) != 0:
                            Operation = Worklist.pop()
                            if not isinstance(Operation, RoseOperation):
                                continue
                            if isinstance(Operation, RoseBVExtractSliceOp):
                                if isinstance(Operation.getInputBitVector(), RoseArgument):
                                    ArgsInConditionOps.add(
                                        Operation.getInputBitVector())
                                    break
                                Worklist.append(Operation.getInputBitVector())
                                continue
                            Worklist.extend(Operation.getOperands())
                    continue
                if isinstance(Op, RoseComparisonBitVectorOp):
                    for Operand in Op.getOperands():
                        if isinstance(Operand, RoseArgument):
                            ArgsInConditionOps.add(Operand)
                        elif isinstance(Operand, RoseBVExtractSliceOp):
                            ArgsInConditionOps.add(Operand.getInputBitVector())
                        elif isinstance(Operand, RoseOperation):
                            Worklist = list()
                            Worklist.extend(Operand.getOperands())
                            while len(Worklist) != 0:
                                Operation = Worklist.pop()
                                if not isinstance(Operation, RoseOperation):
                                    continue
                                if isinstance(Operation, RoseBVExtractSliceOp):
                                    if isinstance(Operation.getInputBitVector(), RoseArgument):
                                        ArgsInConditionOps.add(
                                            Operation.getInputBitVector())
                                        break
                                    Worklist.append(
                                        Operation.getInputBitVector())
                                    continue
                                Worklist.extend(Operation.getOperands())
        return list(ArgsInConditionOps)

    def generateFunctionPermutations(self, Function: RoseFunction):
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
        print("len(MaskArgs):")
        print(len(MaskArgs))
        ConditionalOpsArgs = self.getConditionOpsArgsInFunction(Function)
        # Remove any common arguments between maskargs and ConditionalOpsArgs from
        # ConditionalOpsArgs.
        TempList = list()
        TempList.extend(ConditionalOpsArgs)
        for Arg in TempList:
            if Arg in MaskArgs:
                print("COMMON ARG:")
                Arg.print()
                ConditionalOpsArgs.remove(Arg)
        print("len(ConditionalOpsArgs):")
        print(len(ConditionalOpsArgs))
        RemainingBVArgs = list()
        print("CREATING PERMUTATIONS OF:")
        Function.print()
        for Arg in BVArgs:
            if Arg in MaskArgs:
                print("ARG IN MASKARGS")
                Arg.print()
                continue
            if Arg in ConditionalOpsArgs:
                print("ARG IN ConditionalOpsArgs")
                Arg.print()
                continue
            RemainingBVArgs.append(Arg)
        ArgsPermuations = list()
        # Get permutations of arguments
        if len(MaskArgs) == 0 and len(ConditionalOpsArgs) == 0:
            ArgsPermuations = Permutations(BVArgs)
        elif len(MaskArgs) != 0 and len(ConditionalOpsArgs) == 0:
            MaskArgsPermuations = Permutations(MaskArgs)
            RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
            for MaskArgsPerm in MaskArgsPermuations:
                for RemainingBVArgPerm in RemainingBVArgsPermutations:
                    ArgsPermuations.append(MaskArgsPerm + RemainingBVArgPerm)
        elif len(MaskArgs) == 0 and len(ConditionalOpsArgs) != 0:
            ConditionalOpsArgsPermuations = Permutations(ConditionalOpsArgs)
            RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
            for ConditionalOpsArgsPerm in ConditionalOpsArgsPermuations:
                for RemainingBVArgPerm in RemainingBVArgsPermutations:
                    ArgsPermuations.append(
                        ConditionalOpsArgsPerm + RemainingBVArgPerm)
        else:
            MaskArgsPermuations = Permutations(MaskArgs)
            ConditionalOpsArgsPermuations = Permutations(ConditionalOpsArgs)
            RemainingBVArgsPermutations = Permutations(RemainingBVArgs)
            for MaskArgsPerm in MaskArgsPermuations:
                for ConditionalOpsArgsPerm in ConditionalOpsArgsPermuations:
                    for RemainingBVArgPerm in RemainingBVArgsPermutations:
                        ArgsPermuations.append(
                            MaskArgsPerm + ConditionalOpsArgsPerm + RemainingBVArgPerm)

        print("len(ArgsPermuations):")
        print(len(ArgsPermuations))
        FunctionList = list()
        for Idx, ArgPerm in enumerate(ArgsPermuations):
            NewArgsList = ArgPerm + RemainingArgs
            print("len(NewArgsList):")
            print(len(NewArgsList))
            print("Function.getNumArgs():")
            print(Function.getNumArgs())
            assert len(NewArgsList) == Function.getNumArgs()
            if Function.getArgs() != NewArgsList:
                FunctionCopy = self.createNewFunctionCopy(
                    Function, NewArgsList, str(Idx))
                self.CopyFunctionToOriginalFunction[FunctionCopy] = Function
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

    def generateAFunctionPermutation(self, FunctionTuple: tuple):
        Function = FunctionTuple[0]
        NewArgsList = FunctionTuple[1]
        Suffix = FunctionTuple[2]
        FunctionCopy = self.createNewFunctionCopy(
            Function, NewArgsList, Suffix)
        print("PERMUTATION FUNCTION:")
        FunctionCopy.print()
        ArgPermutation = list()
        for Arg in NewArgsList:
            ArgPermutation.append(Function.getIndexOfArg(Arg))
        # self.CopyFunctionToOriginalFunction[FunctionCopy] = Function
        self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
        return FunctionCopy

    def canonicalizeFunctionArgs(self, Function: RoseFunction):
        print("canonicalizeFunctionArgs:")
        print("FUNCTION:")
        Function.print()
        MaskArgs = self.getMaskArgsInFunction(Function)
        ConditionalOpsArgs = self.getConditionOpsArgsInFunction(Function)
        # Remove any common arguments between maskargs and ConditionalOpsArgs from
        # ConditionalOpsArgs.
        TempList = list()
        TempList.extend(ConditionalOpsArgs)
        for Arg in TempList:
            if Arg in MaskArgs:
                ConditionalOpsArgs.remove(Arg)
        RemainingBVArgs = list()
        RemainingArgs = list()
        for Arg in Function.getArgs():
            if Arg in MaskArgs:
                continue
            if Arg in ConditionalOpsArgs:
                continue
            if isinstance(Arg.getType(), RoseBitVectorType):
                RemainingBVArgs.append(Arg)
                continue
            RemainingArgs.append(Arg)
        if len(MaskArgs) != 0 or len(ConditionalOpsArgs) != 0:
            NewArgsList = MaskArgs + ConditionalOpsArgs + RemainingBVArgs + RemainingArgs
            FunctionCopy = self.createNewFunctionCopy(
                Function, NewArgsList, "norm")
            self.CopyFunctionToOriginalFunction[FunctionCopy] = Function
            ArgPermutation = list()
            for Arg in NewArgsList:
                ArgPermutation.append(Function.getIndexOfArg(Arg))
            self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
            return FunctionCopy
        return Function

    def canonicalizeEquivalenceClasses(self):
        for EquivalenceClass in self.EquivalenceClasses:
            Function = EquivalenceClass.getAFunction()
            CanonicalizedFunction = self.canonicalizeFunctionArgs(Function)
            if Function != CanonicalizedFunction:
                ArgPermutation = self.FunctionToArgPermutationMap[CanonicalizedFunction]
                print("ONE FUNCTION:")
                Function.print()
                EqFunctions = set()
                EqFunctions.update(EquivalenceClass.getEquivalentFunctions())
                for EqFunction in EqFunctions:
                    print("EqFunction:")
                    EqFunction.print()
                    print("ArgPermutation:")
                    print(ArgPermutation)
                    if Function == EqFunction:
                        FunctionCopy = CanonicalizedFunction
                    else:
                        FunctionCopy = self.createPermutatedFunction(
                            EqFunction, ArgPermutation, "norm")
                    OrgFunctionInfo = self.FunctionToFunctionInfo[EqFunction]
                    OrgFuncArgsToConcreteValMap = OrgFunctionInfo.getArgsToConcreteValMap()
                    CopyFuncArgsToConcreteValMap = self.getFunctionToArgMapping(EqFunction,
                                                                                OrgFuncArgsToConcreteValMap, FunctionCopy, ArgPermutation)
                    EquivalenceClass.replaceFunction(
                        EqFunction, FunctionCopy, CopyFuncArgsToConcreteValMap)
                    FunctionCopyInfo = RoseFunctionInfo()
                    FunctionCopyInfo.addFunctionAtNewStage(FunctionCopy)
                    FunctionCopyInfo.addArgsToConcreteMap(
                        CopyFuncArgsToConcreteValMap)
                    FunctionCopyInfo.addRawSemantics(
                        OrgFunctionInfo.getRawSemantics())
                    FunctionCopyInfo.addTargetSpecificFunction(
                        OrgFunctionInfo.getTargetSpecificFunction())
                    self.FunctionToFunctionInfo[FunctionCopy] = FunctionCopyInfo
                    self.FunctionToRosetteCodeMap[FunctionCopy] = RosetteGen.CodeGen(
                        FunctionCopy)
                    FunctionCopyInfo.addTargetAgnosticFunction(FunctionCopy)
                    FunctionCopyInfo.addTargetSpecificFunction(
                        OrgFunctionInfo.getTargetSpecificFunction())
                    FunctionCopyInfo.computeSemanticsInfo()
                    # self.FunctionToCopies[Function] = [FunctionCopy]

    def createPermutatedFunction(self, OriginalFunction: RoseFunction, ArgPermutation: list,
                                 Suffix: str = None):
        assert OriginalFunction.getNumArgs() == len(ArgPermutation)
        NewArgsList = list()
        for PermIdx in ArgPermutation:
            NewArgsList.append(OriginalFunction.getArg(PermIdx))
        FunctionCopy = self.createNewFunctionCopy(
            OriginalFunction, NewArgsList, Suffix)
        self.CopyFunctionToOriginalFunction[FunctionCopy] = OriginalFunction
        self.FunctionToArgPermutationMap[FunctionCopy] = ArgPermutation
        print("FUNCTION:")
        OriginalFunction.print()
        # for Index in range(len(OriginalFunction.getArgs())):
        #  print("Function ARG:")
        #  OriginalFunction.getArg(Index).print()
        #  print(OriginalFunction.getArg(Index).ID)
        # print("________________________")
        print("FunctionCopy:")
        FunctionCopy.print()
        # for Index in range(len(FunctionCopy.getArgs())):
        #  print("Function COPY ARG:")
        #  FunctionCopy.getArg(Index).print()
        #  print(FunctionCopy.getArg(Index).ID)
        # print("________________________")
        return FunctionCopy

    def getFunctionToArgMapping(self, OriginalFunction: RoseFunction, OriginalFuncArgsToConcreteMap: dict,
                                PermutedFunction: RoseFunction, ArgPermutation: list):
        PermArgsToConcreteValMap = dict()
        for PermArgIdx, PermArg in enumerate(PermutedFunction.getArgs()):
            OrgArgIndex = ArgPermutation[PermArgIdx]
            if OriginalFunction.getArg(OrgArgIndex) in OriginalFuncArgsToConcreteMap:
                PermArgsToConcreteValMap[PermArg] = \
                    OriginalFuncArgsToConcreteMap[OriginalFunction.getArg(
                        OrgArgIndex)]
        return PermArgsToConcreteValMap

    def completeFunctionInfo(self, CopyFunctionInfo: RoseFunctionInfo,
                             OriginalFunctionInfo: RoseFunctionInfo, ArgPermutation: list):
        CopyFunctionInfo.addRawSemantics(
            OriginalFunctionInfo.getRawSemantics())
        CopyFunctionInfo.setInElemType(OriginalFunctionInfo.getInElemType())
        CopyFunctionInfo.setOutElemType(OriginalFunctionInfo.getOutElemType())
        CopyFunctionInfo.setInVectorLength(
            OriginalFunctionInfo.getInVectorLength())
        CopyFunctionInfo.setOutVectorLength(
            OriginalFunctionInfo.getOutVectorLength())
        CopyFunctionInfo.setLaneSize(OriginalFunctionInfo.getLaneSize())
        CopyFunctionInfo.setSignedness(OriginalFunctionInfo.getSignedness())
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
        # RemovedEquivalenceClasses = set()
        EquivalenceClasses = set()
        EquivalenceClasses.update(self.EquivalenceClasses)
        Suffix = -1
        for EquivalenceClass in EquivalenceClasses:
            # if EquivalenceClass in RemovedEquivalenceClasses:
            #  continue
            for CheckEquivalenceClass in EquivalenceClasses:
                # if CheckEquivalenceClass in RemovedEquivalenceClasses:
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
                print("CHECKING AGAINST EQUIVALENCE CLASS \n{} AND \n{}".format(
                    str(Function), str(CheckFunction)))
                if self.doFunctionsQualifyForSimilarityChecking(Function, CheckFunction) == False:
                    continue
                # Generate different permutations of CheckFunction
                if CheckFunction in self.CopyFunctionToOriginalFunction:
                    OriginalCheckFunction = self.CopyFunctionToOriginalFunction[CheckFunction]
                else:
                    OriginalCheckFunction = CheckFunction
                if OriginalCheckFunction in self.FunctionToCopies:
                    CheckFunctionList = self.FunctionToCopies[OriginalCheckFunction]
                    print("OBTAINED FROM CACHE")
                else:
                    CheckFunctionList = self.generateFunctionPermutations(
                        OriginalCheckFunction)
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
                    PermCheckFunctionInfo.addFunctionAtNewStage(
                        PermCheckFunction)
                    # Generate rosette code
                    self.FunctionToRosetteCodeMap[PermCheckFunction] = \
                        RosetteGen.CodeGen(PermCheckFunction)
                    # Map args to concrete values
                    ArgPermutation = self.FunctionToArgPermutationMap[PermCheckFunction]
                    CheckFunctionInfo = self.FunctionToFunctionInfo[OriginalCheckFunction]
                    CheckArgsToConcreteValMap = CheckFunctionInfo.getArgsToConcreteValMap()
                    PermArgsToConcreteValMap = self.getFunctionToArgMapping(OriginalCheckFunction,
                                                                            CheckArgsToConcreteValMap, PermCheckFunction, ArgPermutation)
                    PermCheckFunctionInfo.addArgsToConcreteMap(
                        PermArgsToConcreteValMap)
                    PermCheckFunctionInfo.addTargetAgnosticFunction(
                        PermCheckFunction)
                    PermCheckFunctionInfo.addTargetSpecificFunction(
                        CheckFunctionInfo.getTargetSpecificFunction())
                    PermCheckFunctionInfo.computeSemanticsInfo()
                    # Perform verification
                    Suffix += 1
                    VerifyResult = self.verify(self.FunctionToFunctionInfo[Function],
                                               PermCheckFunctionInfo, str(Suffix))
                    if VerifyResult == True:
                        print("Merged {} and {} eq class".format(
                            Function.getName(), OriginalCheckFunction.getName()))
                        # Merge the two equivalent classes
                        CheckedEqFunctions = CheckEquivalenceClass.getEquivalentFunctions()
                        print("CheckedEqFunctions:")
                        print(CheckedEqFunctions)
                        PermutedCheckFunctions = list()
                        FunctionToArgsMapping = dict()
                        for EqFunction in CheckedEqFunctions:
                            print("EqFunction:")
                            EqFunction.print()
                            if EqFunction in self.CopyFunctionToOriginalFunction:
                                OrgFunction = self.CopyFunctionToOriginalFunction[EqFunction]
                            else:
                                OrgFunction = EqFunction
                            print("OriginalCheckFunction:")
                            OriginalCheckFunction.print()
                            if OrgFunction == OriginalCheckFunction:
                                PermutedCheckFunctions.append(
                                    PermCheckFunction)
                                FunctionToArgsMapping[PermCheckFunction] = PermArgsToConcreteValMap
                                self.completeFunctionInfo(
                                    PermCheckFunctionInfo, CheckFunctionInfo, ArgPermutation)
                                self.FunctionToFunctionInfo[PermCheckFunction] = PermCheckFunctionInfo
                                continue
                            CopyFunction = self.createPermutatedFunction(
                                OrgFunction, ArgPermutation, "perm")
                            PermutedCheckFunctions.append(CopyFunction)
                            OrgFunctionInfo = self.FunctionToFunctionInfo[OrgFunction]
                            OrgFuncArgsToConcreteValMap = OrgFunctionInfo.getArgsToConcreteValMap()
                            CopyFuncArgsToConcreteValMap = self.getFunctionToArgMapping(OrgFunction,
                                                                                        OrgFuncArgsToConcreteValMap, CopyFunction, ArgPermutation)
                            FunctionToArgsMapping[CopyFunction] = CopyFuncArgsToConcreteValMap
                            CopyFunctionInfo = RoseFunctionInfo()
                            CopyFunctionInfo.addFunctionAtNewStage(
                                CopyFunction)
                            CopyFunctionInfo.addArgsToConcreteMap(
                                CopyFuncArgsToConcreteValMap)
                            self.completeFunctionInfo(
                                CopyFunctionInfo, OrgFunctionInfo, ArgPermutation)
                            self.FunctionToFunctionInfo[CopyFunction] = CopyFunctionInfo
                            self.FunctionToRosetteCodeMap[CopyFunction] = \
                                RosetteGen.CodeGen(CopyFunction)
                            CopyFunctionInfo.addTargetAgnosticFunction(
                                CopyFunction)
                            CopyFunctionInfo.addTargetSpecificFunction(
                                OrgFunctionInfo.getTargetSpecificFunction())
                            CopyFunctionInfo.computeSemanticsInfo()
                        EquivalenceClass.extend(
                            PermutedCheckFunctions, FunctionToArgsMapping)
                        for EqFunction in PermutedCheckFunctions:
                            self.FunctionToEquivalenceClassMap[EqFunction] = EquivalenceClass
                        if CheckEquivalenceClass in self.EquivalenceClasses:
                            self.EquivalenceClasses.remove(
                                CheckEquivalenceClass)
                        # RemovedEquivalenceClasses.add(CheckEquivalenceClass)
                        EQToEQMap[CheckEquivalenceClass] = EquivalenceClass
                        EQToResultMap[(EquivalenceClass,
                                       CheckEquivalenceClass)] = VerifyResult
                        EQToResultMap[(CheckEquivalenceClass,
                                       EquivalenceClass)] = VerifyResult
                        print("DONE MERGING")
                        break
                    else:
                        EQToResultMap[(EquivalenceClass,
                                       CheckEquivalenceClass)] = VerifyResult
                        EQToResultMap[(CheckEquivalenceClass,
                                       EquivalenceClass)] = VerifyResult

    def removeDeadLoop(self, FunctionInfo: RoseFunctionInfo, Function: RoseFunction,
                       Loop: RoseForLoop):
        print("REMOVING DEAD LOOP FROM:")
        Function.print()
        print("LOOP:")
        Loop.print()
        # assert Loop.getParent() == Function
        if not isinstance(Loop.getEndIndex(), RoseConstant) \
                and not isinstance(Loop.getStep(), RoseConstant):
            assert FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
                == FunctionInfo.getConcreteValFor(Loop.getStep())
            # Ensure that the iterator of the outer loop has no uses.
            # If it does, we do not remove this loop.
            assert Function.getNumUsersOf(Loop.getIterator()) == 0
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
            # Replace the loop bounds
            Loop.setEndIndex(1)
            Loop.setStep(1)

    def removeDeadLoop2(self, FunctionInfo: RoseFunctionInfo, Function: RoseFunction,
                        Loop: RoseForLoop):
        # assert Loop.getParent() == Function
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
                # print("REGION IN DEAD LOOP:")
                Region.print()
                Loop.eraseChild(Region)
                ReligionList.append(Region)
            ParentRegion = Loop.getParent()
            print("++++++ParentRegion:")
            ParentRegion.print()
            Key = ParentRegion.getKeyForChild(Loop)
            for Region in ReligionList:
                print("ParentRegion.getPosOfChild(Loop, Key):")
                print(ParentRegion.getPosOfChild(Loop, Key))
                ParentRegion.addRegionBefore(
                    ParentRegion.getPosOfChild(Loop, Key), Region, Key)
                print("-------ParentRegion:")
                ParentRegion.print()
            print("ParentRegion:")
            ParentRegion.print()
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
                print("LOOP TO BE REMOVED:")
                Loop.print()
                print("len(Loop.getChildren()):")
                print(len(Loop.getChildren()))
                LoopChildren = list()
                LoopChildren.extend(Loop.getChildren())
                for Region in LoopChildren:
                    print("Region:")
                    Region.print()
                    Loop.eraseChild(Region)
                    ReligionList.append(Region)
                ParentRegion = Loop.getParent()
                Key = ParentRegion.getKeyForChild(Loop)
                for Region in ReligionList:
                    ParentRegion.addRegionBefore(
                        ParentRegion.getPosOfChild(Loop, Key), Region, Key)
                print("--ParentRegion:")
                ParentRegion.print()
                ParentRegion.eraseChild(Loop, Key)
        print("FRESH FUNCTION:")
        Function.print()
        return Function

    def removeDeadArguments(self, FunctionInfo: RoseFunctionInfo, Function: RoseFunction):
        # print("REMOVE DEAD ARGUMENTS")
        print("FUNCTION:")
        Function.print()
        ErasedArgs = False
        NumArgs = len(Function.getArgs())
        for Idx in range(NumArgs - 1, -1, -1):
            Arg = Function.getArg(Idx)
            print("ARG:")
            Arg.print()
            print('FUNCTION AFTER')
            Function.print()
            if Function.getNumUsersOf(Arg) == 0:
                FunctionInfo.eraseConcreteValForArg(Arg)
                Function.eraseArg(Idx)
                ErasedArgs = True
        return ErasedArgs

    def replaceUsesAndPropagateTypes(self, Region: RoseRegion,
                                     Arg: RoseArgument, NewVal: RoseConstant):
        assert isinstance(NewVal, RoseConstant)
        BitvectorToBitwidth = dict()
        print("ARG:")
        Arg.print()
        print("NEW VAL:")
        NewVal.print()
        print("++++=Region FUNCTION:")
        Region.getFunction().print()
        print("Region:")
        Region.print()
        # Iterate over all blocks and all operations to propagate type information
        if not isinstance(Region, RoseBlock):
            BlockList = Region.getRegionsOfType(RoseBlock)
        else:
            BlockList = [Region]
        for Block in BlockList:
            for Op in reversed(Block.getOperations()):
                print("LOOKINNG AT OP:")
                Op.print()
                if isinstance(Op, RoseBVExtractSliceOp):
                    # if isinstance(Op.getType().getBitwidth(), RoseArgument):
                    if Op.getOperand(Op.getBitwidthPos()) == Arg:
                        Op.setOperand(Op.getBitwidthPos(), NewVal)
                        Op.setType(RoseBitVectorType.create(NewVal.getValue()))
                        BitvectorToBitwidth[Op] = NewVal.getValue()
                    if Op.getType().getBitwidth() == Arg:
                        Op.setType(RoseBitVectorType.create(NewVal.getValue()))
                        BitvectorToBitwidth[Op] = NewVal.getValue()
                    Op.replaceUsesWith(Arg, NewVal)
                    continue
                if isinstance(Op, RoseBVInsertSliceOp):
                    # if isinstance(Op.getOutputBitwidth(), RoseArgument):
                    if Op.getOperand(Op.getBitwidthPos()) == Arg:
                        Op.setOperand(Op.getBitwidthPos(), NewVal)
                        Op.getInsertValue().setType(RoseBitVectorType.create(NewVal.getValue()))
                        BitvectorToBitwidth[Op.getInsertValue(
                        )] = NewVal.getValue()
                        BitvectorToBitwidth[Op] = NewVal.getValue()
                    if Op.getInputBitVector() == Arg:
                        assert isinstance(NewVal.getType().getBitwidth(), int)
                        Op.setOperand(Op.getBitwidthPos(), RoseConstant(NewVal.getType().getBitwidth(),
                                                                        Op.getOperand(Op.getBitwidthPos()).getType()))
                        BitvectorToBitwidth[Op] = NewVal.getType(
                        ).getBitwidth()
                        BitvectorToBitwidth[Op.getInsertValue(
                        )] = NewVal.getType().getBitwidth()
                        Op.setOperand(0, NewVal)
                        continue
                    Op.replaceUsesWith(Arg, NewVal)
                    continue
                if Op.isSizeChangingOp():
                    print("OP TYPE:")
                    Op.getType().print()
                    print("SIZE EXTENSION OP")
                    assert isinstance(Op.getType(), RoseBitVectorType)
                    if isinstance(Op.getType().getBitwidth(), RoseArgument) \
                            and Op.getType().getBitwidth() == Arg:
                        Op.setType(RoseBitVectorType.create(NewVal.getValue()))
                        BitvectorToBitwidth[Op] = NewVal.getValue()
                    if Op.getOperand(1) == Arg:
                        Op.setOperand(1, NewVal)
                        Op.setType(RoseBitVectorType.create(NewVal.getValue()))
                        BitvectorToBitwidth[Op] = NewVal.getValue()
                    elif Op.getInputBitVector() == Arg:
                        Op.setOperand(0, NewVal)
                        BitvectorToBitwidth[Op.getInputBitVector(
                        )] = NewVal.getType().getBitwidth()
                    if isinstance(Op, RoseBVSizeExensionOp):
                        if Op.getExtensionKind() == Arg:
                            Op.setOperand(Op.getExtensionKindPos(), NewVal)
                    elif isinstance(Op, RoseBVGeneralSaturationOp):
                        if Op.getSaturationKind() == Arg:
                            Op.setOperand(Op.getSaturationKindPos(), NewVal)
                    continue
                if isinstance(Op, RoseGeneralSaturableBitVectorOp):
                    for Idx, Operand in enumerate(Op.getOperands()[:-1]):
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Op.getType(), RoseBitVectorType):
                                Op.setType(RoseBitVectorType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Op.getType(), RoseIntegerType)
                                Op.setType(RoseIntegerType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = Op.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(Idx, NewVal)
                            Op.setType(Op.getOperand(Idx).getType())
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = NewVal.getType(
                            ).getBitwidth()
                            continue
                    print("PROPAGATE TYPE INFO HORIZONTALLY")
                    Op.print()
                    if Op in BitvectorToBitwidth:
                        for Operand in Op.getOperands()[:-1]:
                            if Operand not in BitvectorToBitwidth:
                                Operand.setType(Op.getType())
                                BitvectorToBitwidth[Operand] = Operand.getType(
                                ).getBitwidth()
                    else:
                        Type = RoseUndefinedType()
                        for Operand in Op.getOperands()[:-1]:
                            if Operand in BitvectorToBitwidth:
                                Type = Operand.getType()
                                break
                        if not isinstance(Type, RoseUndefinedType):
                            Op.setType(Type)
                            BitvectorToBitwidth[Op] = Type.getBitwidth()
                            for Operand in Op.getOperands()[:-1]:
                                Operand.setType(Type)
                                BitvectorToBitwidth[Operand] = Type.getBitwidth(
                                )
                    if Op.getSaturationQualifierID() == Arg:
                        Op.setOperand(Op.getSaturationQualifierIDPos(), NewVal)
                    continue
                if isinstance(Op, RoseSignAgnosticBitVectorOp):
                    for Idx, Operand in enumerate(Op.getOperands()[:-1]):
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Op.getType(), RoseBitVectorType):
                                Op.setType(RoseBitVectorType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Op.getType(), RoseIntegerType)
                                Op.setType(RoseIntegerType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = Op.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(Idx, NewVal)
                            Op.setType(Op.getOperand(Idx).getType())
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = NewVal.getType(
                            ).getBitwidth()
                            continue
                    print("PROPAGATE TYPE INFO HORIZONTALLY")
                    Op.print()
                    if Op in BitvectorToBitwidth:
                        for Operand in Op.getOperands()[:-1]:
                            if Operand not in BitvectorToBitwidth:
                                Operand.setType(Op.getType())
                                BitvectorToBitwidth[Operand] = Operand.getType(
                                ).getBitwidth()
                    else:
                        Type = RoseUndefinedType()
                        for Operand in Op.getOperands()[:-1]:
                            if Operand in BitvectorToBitwidth:
                                Type = Operand.getType()
                                break
                        if not isinstance(Type, RoseUndefinedType):
                            Op.setType(Type)
                            BitvectorToBitwidth[Op] = Type.getBitwidth()
                            for Operand in Op.getOperands()[:-1]:
                                Operand.setType(Type)
                                BitvectorToBitwidth[Operand] = Type.getBitwidth(
                                )
                    if Op.getSignID() == Arg:
                        Op.setOperand(Op.getSignIDPos(), NewVal)
                    continue
                if isinstance(Op, RoseGeneralComparisonBitVectorOp):
                    for Idx, Operand in enumerate(Op.getOperands()[:-1]):
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Operand.getType(), RoseBitVectorType):
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Operand.getType(), RoseIntegerType)
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(Idx, NewVal)
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            continue
                    print("PROPAGATE TYPE INFO HORIZONTALLY")
                    Type = RoseUndefinedType()
                    for Operand in Op.getOperands()[:-1]:
                        if Operand in BitvectorToBitwidth:
                            Type = Operand.getType()
                            break
                    if not isinstance(Type, RoseUndefinedType):
                        for Operand in Op.getOperands()[:-1]:
                            Operand.setType(Type)
                            BitvectorToBitwidth[Operand] = Type.getBitwidth()
                    if Op.getSignID() == Arg:
                        Op.setOperand(Op.getSignIDPos(), NewVal)
                    continue
                if Op.getOpcode().typesOfInputsAndOutputEqual():
                    for Idx, Operand in enumerate(Op.getOperands()):
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Op.getType(), RoseBitVectorType):
                                Op.setType(RoseBitVectorType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Op.getType(), RoseIntegerType)
                                Op.setType(RoseIntegerType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = Op.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(Idx, NewVal)
                            Op.setType(Op.getOperand(Idx).getType())
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = NewVal.getType(
                            ).getBitwidth()
                            continue
                    print("PROPAGATE TYPE INFO HORIZONTALLY")
                    Op.print()
                    if Op in BitvectorToBitwidth:
                        for Operand in Op.getOperands():
                            if Operand not in BitvectorToBitwidth:
                                Operand.setType(Op.getType())
                                BitvectorToBitwidth[Operand] = Operand.getType(
                                ).getBitwidth()
                    else:
                        Type = RoseUndefinedType()
                        for Operand in Op.getOperands():
                            if Operand in BitvectorToBitwidth:
                                Type = Operand.getType()
                                break
                        if not isinstance(Type, RoseUndefinedType):
                            Op.setType(Type)
                            BitvectorToBitwidth[Op] = Type.getBitwidth()
                            for Operand in Op.getOperands():
                                Operand.setType(Type)
                                BitvectorToBitwidth[Operand] = Type.getBitwidth(
                                )
                    continue
                if Op.getOpcode().typesOfOperandsAreEqual():
                    for Idx, Operand in enumerate(Op.getOperands()):
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Operand.getType(), RoseBitVectorType):
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Operand.getType(), RoseIntegerType)
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(Idx, NewVal)
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            continue
                    print("PROPAGATE TYPE INFO HORIZONTALLY")
                    Type = RoseUndefinedType()
                    for Operand in Op.getOperands():
                        if Operand in BitvectorToBitwidth:
                            Type = Operand.getType()
                            break
                    if not isinstance(Type, RoseUndefinedType):
                        for Operand in Op.getOperands():
                            Operand.setType(Type)
                            BitvectorToBitwidth[Operand] = Type.getBitwidth()
                    continue
                if isinstance(Op, RoseSelectOp):
                    print("BitvectorToBitwidth:")
                    print(len(BitvectorToBitwidth))
                    # if Op in BitvectorToBitwidth:
                    #  continue
                    for OperandIndex, Operand in enumerate(Op.getOperands()):
                        print("OPERAND:")
                        Operand.print()
                        Operand.getType().print()
                        print("ARG:")
                        Arg.print()
                        Arg.getType().print()
                        if OperandIndex == 0:
                            continue
                        if isinstance(Operand.getType().getBitwidth(), RoseArgument) \
                                and Operand.getType().getBitwidth() == Arg:
                            if isinstance(Op.getType(), RoseBitVectorType):
                                Op.setType(RoseBitVectorType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseBitVectorType.create(NewVal.getValue()))
                            else:
                                assert isinstance(
                                    Op.getType(), RoseIntegerType)
                                Op.setType(RoseIntegerType.create(
                                    NewVal.getValue()))
                                Operand.setType(
                                    RoseIntegerType.create(NewVal.getValue()))
                            BitvectorToBitwidth[Operand] = Operand.getType(
                            ).getBitwidth()
                            BitvectorToBitwidth[Op] = Op.getType(
                            ).getBitwidth()
                            continue
                        if Operand == Arg:
                            Op.setOperand(OperandIndex, NewVal)
                            BitvectorToBitwidth[Operand] = NewVal.getType(
                            ).getBitwidth()
                            Op.setType(Operand.getType())
                            BitvectorToBitwidth[Op] = NewVal.getType(
                            ).getBitwidth()
                    print("---PROPAGATE TYPE INFORMATION HORIZONTALLY")
                    Op.print()
                    if Op in BitvectorToBitwidth:
                        Op.getThenValue().setType(Op.getType())
                        Op.getElseValue().setType(Op.getType())
                    elif Op.getThenValue() in BitvectorToBitwidth:
                        if Op.getElseValue() not in BitvectorToBitwidth:
                            Op.getElseValue().setType(Op.getThenValue().getType())
                            BitvectorToBitwidth[Op.getElseValue(
                            )] = Op.getThenValue().getType().getBitwidth()
                        Op.setType(Op.getThenValue().getType())
                        BitvectorToBitwidth[Op] = Op.getThenValue(
                        ).getType().getBitwidth()
                    elif Op.getElseValue() in BitvectorToBitwidth:
                        if Op.getThenValue() not in BitvectorToBitwidth:
                            Op.getThenValue().setType(Op.getElseValue().getType())
                            BitvectorToBitwidth[Op.getThenValue(
                            )] = Op.getElseValue().getType().getBitwidth()
                        Op.setType(Op.getThenValue().getType())
                        BitvectorToBitwidth[Op] = Op.getThenValue(
                        ).getType().getBitwidth()
                    continue
                if isinstance(Op, RoseBVPadHighBitsOp):
                    Op.replaceUsesWith(Arg, NewVal)
                    BitvectorToBitwidth[Op] = Op.getOperand(
                        0).getType().getBitwidth()
                    continue

        # Perform some forward dataflow analysis to propagate types where the types
        # can be determined.
        print("Region FUNCTION:")
        Region.getFunction().print()
        for Block in BlockList:
            for Op in Block.getOperations():
                if isinstance(Op.getType(), RoseBitVectorType) \
                        or isinstance(Op.getType(), RoseIntegerType):
                    if not isinstance(Op.getType().getBitwidth(), int):
                        if Op.isSizeChangingOp():
                            if isinstance(Op.getOperand(1), RoseConstant):
                                Op.setType(Op.setType(RoseBitVectorType.create(
                                    Op.getOperand(1).getValue())))
                            continue
                        if isinstance(Op, RoseGeneralSaturableBitVectorOp) \
                                or isinstance(Op, RoseSignAgnosticBitVectorOp):
                            Type = RoseUndefinedType()
                            for Operand in Op.getOperands()[:-1]:
                                if isinstance(Operand.getType().getBitwidth(), int):
                                    Type = Operand.getType()
                                    break
                            if not isinstance(Type, RoseUndefinedType):
                                # Propagate type info to other operands if necessary
                                for Operand in Op.getOperands()[:-1]:
                                    if not isinstance(Operand.getType().getBitwidth(), int):
                                        Operand.setType(Type)
                                Op.setType(Type)
                            continue
                        if Op.getOpcode().typesOfInputsAndOutputEqual():
                            Type = RoseUndefinedType()
                            for Operand in Op.getOperands():
                                if isinstance(Operand.getType().getBitwidth(), int):
                                    Type = Operand.getType()
                                    break
                            if not isinstance(Type, RoseUndefinedType):
                                # Propagate type info to other operands if necessary
                                for Operand in Op.getOperands():
                                    if not isinstance(Operand.getType().getBitwidth(), int):
                                        Operand.setType(Type)
                                Op.setType(Type)
                            continue
                        if isinstance(Op, RoseSelectOp):
                            if isinstance(Op.getThenValue().getType().getBitwidth(), int):
                                if not isinstance(Op.getElseValue().getType().getBitwidth(), int):
                                    Op.getElseValue().setType(Op.getThenValue().getType())
                                    Op.setType(Op.getThenValue().getType())
                            elif isinstance(Op.getElseValue().getType().getBitwidth(), int):
                                if not isinstance(Op.getThenValue().getType().getBitwidth(), int):
                                    Op.getThenValue().setType(Op.getElseValue().getType())
                                    Op.setType(Op.getElseValue().getType())
                            continue
                if isinstance(Op, RoseGeneralComparisonBitVectorOp):
                    Type = RoseUndefinedType()
                    for Operand in Op.getOperands()[:-1]:
                        if isinstance(Operand.getType().getBitwidth(), int):
                            Type = Operand.getType()
                            break
                    if not isinstance(Type, RoseUndefinedType):
                        # Propagate type info to other operands if necessary
                        for Operand in Op.getOperands()[:-1]:
                            if not isinstance(Operand.getType().getBitwidth(), int):
                                Operand.setType(Type)
                    continue
                if Op.getOpcode().typesOfOperandsAreEqual():
                    Type = RoseUndefinedType()
                    for Operand in Op.getOperands():
                        if isinstance(Operand.getType().getBitwidth(), int):
                            Type = Operand.getType()
                            break
                    if not isinstance(Type, RoseUndefinedType):
                        # Propagate type info to other operands if necessary
                        for Operand in Op.getOperands():
                            if not isinstance(Operand.getType().getBitwidth(), int):
                                Operand.setType(Type)
                    continue
        print("----Region FUNCTION:")
        Region.getFunction().print()
        return

    # This function is needed to avoid triggering some asserts in the API
    # that has similar functionality.

    def replaceUsesInRegion(self, Region, Abstraction, NewAbstraction):
        assert not isinstance(Abstraction, RoseAbstractions.RoseUndefValue) \
            and not isinstance(Abstraction, RoseAbstractions.RoseConstant) \
            and not isinstance(Abstraction, RoseAbstractions.RoseFunction)
        assert not isinstance(NewAbstraction, RoseAbstractions.RoseUndefValue) \
            and not isinstance(NewAbstraction, RoseAbstractions.RoseFunction)
        assert isinstance(Abstraction, RoseAbstractions.RoseValue)
        assert isinstance(NewAbstraction, RoseAbstractions.RoseValue)
        # assert Abstraction.getType() == NewAbstraction.getType()
        if isinstance(Region, RoseForLoop):
            if Region.getIterator() == Abstraction:
                Region.setIterator(NewAbstraction)
            elif Region.getStartIndex() == Abstraction:
                Region.setStartIndexVal(NewAbstraction)
            elif Region.getStep() == Abstraction:
                Region.setStepVal(NewAbstraction)
            elif Region.getEndIndex() == Abstraction:
                Region.setEndIndexVal(NewAbstraction)
        if Region.getKeys() != None:
            for Key in Region.getKeys():
                for Child in Region.getChildren(Key):
                    assert Region.isChildValid(Child)
                    self.replaceUsesInRegion(
                        Child, Abstraction, NewAbstraction)
        else:
            if not isinstance(Region, RoseBlock):
                for Child in Region.getChildren():
                    assert Region.isChildValid(Child)
                    # if isinstance(Child, RoseOperation):
                    #  Child.replaceUsesWith(Abstraction, NewAbstraction)
                    # else:
                    self.replaceUsesInRegion(
                        Child, Abstraction, NewAbstraction)
            else:
                self.replaceUsesAndPropagateTypes(
                    Region, Abstraction, NewAbstraction)

    def getArgPermutationMapRecursively(self, OlderFunction: RoseFunction, RecoveredArgMap: list):
        print("getArgPermutationMapRecursively")
        NewRecoveredMap = list()
        print("OlderFunction:")
        OlderFunction.print()
        if OlderFunction in self.CopyFunctionToOriginalFunction:
            OrgFunction = self.CopyFunctionToOriginalFunction[OlderFunction]
            print("OrgFunction:")
            OrgFunction.print()
            for Idx in RecoveredArgMap:
                NewRecoveredMap.append(
                    self.FunctionToArgPermutationMap[OrgFunction][Idx])
            print("OrgFunction:")
            OrgFunction.print()
            print("NewRecoveredMap:")
            print(NewRecoveredMap)
            return self.getArgPermutationMapRecursively(OrgFunction, NewRecoveredMap)
        return RecoveredArgMap

    def genArgPermuatationsForEquivalenceClasses(self):
        for EquivalenceClass in self.EquivalenceClasses:
            # Go through all the functions and loop for arguments to eliminate
            Functions = set()
            Functions.update(EquivalenceClass.getEquivalentFunctions())
            FunctionToClonedFunctionInfo = dict()
            for Function in Functions:
                assert isinstance(Function, RoseFunction)
                assert Function in self.FunctionToArgPermutationMap
                print("+++++++FUNCTION:")
                Function.print()
                FunctionInfo = self.FunctionToFunctionInfo[Function]
                FunctionToClonedFunctionInfo[Function] = RoseFunctionInfo()
                FunctionToClonedFunctionInfo[Function].addFunctionAtNewStage(
                    Function.clone())
                ArgsToConcreteValMap = deepcopy(
                    FunctionInfo.getArgsToConcreteValMap())
                FunctionToClonedFunctionInfo[Function].addArgsToConcreteMap(
                    ArgsToConcreteValMap)
                ArgPermutation = self.FunctionToArgPermutationMap[Function]
                OriginalFunction = RoseUndefRegion()
                if Function in self.CopyFunctionToOriginalFunction:
                    OriginalFunction = self.CopyFunctionToOriginalFunction[Function]
                ClonedOriginalFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                )
                self.FunctionToFunctionInfo[ClonedOriginalFunction] = FunctionInfo
                self.FunctionToArgPermutationMap[ClonedOriginalFunction] = ArgPermutation
                self.FunctionToEquivalenceClassMap[ClonedOriginalFunction] = EquivalenceClass
                if not isinstance(OriginalFunction, RoseUndefRegion):
                    self.CopyFunctionToOriginalFunction[ClonedOriginalFunction] = OriginalFunction
                assert Function in self.FunctionToArgPermutationMap
                # Let's simplify the function first
                RoseOpSimplify.Run(Function, FunctionInfo.getContext())
                print("FINAL FUNCTION:")
                Function.print()
                self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(
                    Function)
                FunctionInfo.addFunctionAtNewStage(Function)
                FunctionInfo.addTargetAgnosticFunction(Function)
                FunctionInfo.computeSemanticsInfo()
                self.FunctionToFunctionInfo[Function] = FunctionInfo
                print("ROSETTE CODE:")
                print(self.FunctionToRosetteCodeMap[Function])
                print("++++REFERENCE FUNCTION:")
                FunctionToClonedFunctionInfo[Function].getLatestFunction(
                ).print()
                print("++++CHECK FUNCTION:")
                FunctionInfo.getLatestFunction().print()
                Verifier = RoseTransformationVerifier(FunctionToClonedFunctionInfo[Function],
                                                      FunctionInfo)
                assert Verifier.verifyEquivalence() == True
                # Replace uses of concrete arguments and try verifying again
                CopyFunctionInfo = self.replaceUsesofConcreteArgsAndGetFunction(
                    FunctionInfo)
                print("TARGET AGNOSTIC FUNCTION:")
                FunctionInfo.getLatestFunction().print()
                print("COPY TARGET AGNOSTIC FUNCTION:")
                CopyFunctionInfo.getLatestFunction().print()
                Verifier = RoseTransformationVerifier(
                    CopyFunctionInfo, FunctionInfo)
                assert Verifier.verifyEquivalence() == True
                # Now map this new function to the new argument permutation map
                OlderFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                )
                assert OlderFunction in self.FunctionToArgPermutationMap
                # if OlderFunction in self.CopyFunctionToOriginalFunction
                OldArgPermutation = self.FunctionToArgPermutationMap[OlderFunction]
                print("OlderFunction:")
                OlderFunction.print()
                print("FUNCTION:")
                Function.print()
                print("OldArgPermutation:")
                print(OldArgPermutation)
                RecoveredArgMap = list()
                for Arg in Function.getArgs():
                    print("Arg:")
                    Arg.print()
                    Arg.getType().print()
                    if isinstance(Arg.getType(), RoseBitVectorType) \
                            or isinstance(Arg.getType(), RoseIntegerType) \
                            or isinstance(Arg.getType(), RoseBooleanType):
                        if isinstance(Arg.getType().getBitwidth(), RoseArgument):
                            OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                            RecoveredArgMap.append(
                                OldArgPermutation[OldArgIndex])
                            continue
                    # Now we have to be more careful with checking equivalence
                    OldArgIndex = None
                    OlderFunctionInfo = FunctionToClonedFunctionInfo[Function]
                    for Idx, OlderArg in enumerate(OlderFunction.getArgs()):
                        if isinstance(OlderArg.getType(), RoseBitVectorType) \
                                or isinstance(OlderArg.getType(), RoseIntegerType) \
                                or isinstance(OlderArg.getType(), RoseBooleanType):
                            BW = OlderArg.getType().getBitwidth()
                            if type(BW) == RoseConstant:  # Hotfix for ARM,
                                BW = BW.getValue()  # FIXME: Find the root cause

                            if isinstance(BW, int):
                                print("OLD ARG:")
                                OlderArg.print()
                                print("ARG:")
                                Arg.print()
                                if OlderArg == Arg:
                                    print("OlderArg.getType():")
                                    OlderArg.getType().print()
                                    OldArgIndex = Idx
                                    break
                            else:
                                assert isinstance(
                                    OlderArg.getType().getBitwidth(), RoseArgument)
                                # DOUBLE CHECK
                                # assert OlderFunctionInfo.argHasConcreteVal(OlderArg) == True
                                assert OlderFunctionInfo.argHasConcreteVal(
                                    OlderArg.getType().getBitwidth()) == True
                                print(
                                    "\n\n______________________________________________")
                                ClonedOlderArg = OlderArg.clone()
                                print("OlderArg.getType().getBitwidth():")
                                print(OlderArg.getType().getBitwidth())
                                print("ClonedOlderArg.getType().getBitwidth():")
                                print(ClonedOlderArg.getType().getBitwidth())
                                print(
                                    "OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth():")
                                print(OlderFunctionInfo.getConcreteValFor(
                                    OlderArg.getType().getBitwidth()))
                                if isinstance(OlderArg.getType(), RoseBitVectorType):
                                    ClonedOlderArg.setType(RoseBitVectorType.create(
                                        OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                else:
                                    assert isinstance(
                                        OlderArg.getType(), RoseIntegerType)
                                    ClonedOlderArg.setType(RoseIntegerType.create(
                                        OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                print("Arg:")
                                Arg.print()
                                Arg.getType().print()
                                print(Arg.getType())
                                print(Arg.getType().getBitwidth())
                                print("ARG ID:")
                                print(Arg.ID)
                                print("ClonedOlderArg:")
                                ClonedOlderArg.print()
                                ClonedOlderArg.getType().print()
                                print(ClonedOlderArg.getType())
                                print(ClonedOlderArg.getType().getBitwidth())
                                print("CLONED ARG ID:")
                                print(ClonedOlderArg.ID)
                                if Arg == ClonedOlderArg:
                                    print("CLONED ARG == ARG")
                                    OldArgIndex = Idx
                                    break
                    assert OldArgIndex != None
                    # OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                    print("OldArgIndex:")
                    print(OldArgIndex)
                    RecoveredArgMap.append(OldArgPermutation[OldArgIndex])
                print("RecoveredArgMap:")
                print(RecoveredArgMap)
                NewRecoveredMap = self.getArgPermutationMapRecursively(
                    OlderFunction, RecoveredArgMap)
                self.FunctionToArgPermutationMap[Function] = NewRecoveredMap
                print("!!!!!!!!!!!!!!!FINAL FUNCTION:")
                Function.print()
                print("!!!!!!!!!!!!!FINAL ARG PERMUTATIONN MAP:")
                print(self.FunctionToArgPermutationMap[Function])

    def eliminateUnecessaryArgs(self):
        for EquivalenceClass in self.EquivalenceClasses:
            if len(EquivalenceClass.getEquivalentFunctions()) > 1:
                # Go through all the functions and loop for arguments to eliminate
                ArgIdxToConcreteValMap = dict()
                FunctionToDeadLoops = dict()
                Functions = set()
                Functions.update(EquivalenceClass.getEquivalentFunctions())
                DeadLoopsFound = None
                FunctionToClonedFunctionInfo = dict()
                for Function in Functions:
                    assert isinstance(Function, RoseFunction)
                    assert Function in self.FunctionToArgPermutationMap
                    print("+++++++FUNCTION:")
                    Function.print()
                    FunctionInfo = self.FunctionToFunctionInfo[Function]
                    FunctionToClonedFunctionInfo[Function] = RoseFunctionInfo()
                    FunctionToClonedFunctionInfo[Function].addFunctionAtNewStage(
                        Function.clone())
                    ArgsToConcreteValMap = deepcopy(
                        FunctionInfo.getArgsToConcreteValMap())
                    FunctionToClonedFunctionInfo[Function].addArgsToConcreteMap(
                        ArgsToConcreteValMap)
                    if len(ArgIdxToConcreteValMap) == 0:
                        for Idx, Arg in enumerate(Function.getArgs()):
                            if FunctionInfo.argHasConcreteVal(Arg) == True:
                                print("CONCRETE INDEX:")
                                print(Idx)
                                ArgIdxToConcreteValMap[Idx] = FunctionInfo.getConcreteValFor(
                                    Arg)
                    else:
                        # Compare concrete values
                        for Idx, Arg in enumerate(Function.getArgs()):
                            if FunctionInfo.argHasConcreteVal(Arg) == True:
                                if Idx not in ArgIdxToConcreteValMap:
                                    continue
                                #  ArgIdxToConcreteValMap[Idx] = FunctionInfo.getConcreteValFor(Arg)
                                print("FunctionInfo.getConcreteValFor(Arg):")
                                print(FunctionInfo.getConcreteValFor(Arg))
                                print("Idx:")
                                print(Idx)
                                print("ArgIdxToConcreteValMap[Idx]:")
                                print(ArgIdxToConcreteValMap[Idx])
                                if FunctionInfo.getConcreteValFor(Arg) != ArgIdxToConcreteValMap[Idx]:
                                    print("NONE")
                                    ArgIdxToConcreteValMap[Idx] = None
                                elif isinstance(FunctionInfo.getConcreteValFor(Arg).getType(), RoseBitVectorType):
                                    if FunctionInfo.getConcreteValFor(Arg).getValue() != ArgIdxToConcreteValMap[Idx].getValue():
                                        ArgIdxToConcreteValMap[Idx] = None
                            else:
                                if Idx in ArgIdxToConcreteValMap:
                                    ArgIdxToConcreteValMap[Idx] = None
                    # Check if the outer loop in the function has the same end index and
                    # loop step for all functions in this equivalence class.
                    if DeadLoopsFound == None or DeadLoopsFound == True:
                        LoopList = Function.getRegionsOfType(RoseForLoop)
                        DeadLoopsFoundInLoopList = False
                        for Loop in LoopList:
                            print("LOOP IN LOOP LIST:")
                            Loop.print()
                            assert not isinstance(Loop, RoseUndefRegion)
                            print(
                                "FunctionInfo.getConcreteValFor(Loop.getEndIndex()):")
                            FunctionInfo.getConcreteValFor(
                                Loop.getEndIndex()).print()
                            print("FunctionInfo.getConcreteValFor(Loop.getStep()):")
                            FunctionInfo.getConcreteValFor(
                                Loop.getStep()).print()
                            if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
                                    == FunctionInfo.getConcreteValFor(Loop.getStep()):
                                if Loop.getNumUsersOf(Loop.getIterator()) == 0:
                                    DeadLoopsFoundInLoopList = True
                                    print("DEAD LOOP FOUND")
                                    if Function not in FunctionToDeadLoops:
                                        FunctionToDeadLoops[Function] = [Loop]
                                    else:
                                        FunctionToDeadLoops[Function].append(
                                            Loop)
                        DeadLoopsFound = DeadLoopsFoundInLoopList
                        print("DeadLoopsFound:")
                        print(DeadLoopsFound)
                # Remove some unecessary Arguments
                for Function in Functions:
                    print("OLD FUNCTION:")
                    Function.print()
                    NumArgs = len(Function.getArgs())
                    ModificationMade = False
                    FunctionInfo = self.FunctionToFunctionInfo[Function]
                    ArgPermutation = self.FunctionToArgPermutationMap[Function]
                    OriginalFunction = RoseUndefRegion()
                    if Function in self.CopyFunctionToOriginalFunction:
                        OriginalFunction = self.CopyFunctionToOriginalFunction[Function]
                    ClonedFunctionInfo = FunctionToClonedFunctionInfo[Function]
                    for Idx in range(NumArgs - 1, -1, -1):
                        Arg = Function.getArg(Idx)
                        if Idx in ArgIdxToConcreteValMap and FunctionInfo.argHasConcreteVal(Arg) == True:
                            if ArgIdxToConcreteValMap[Idx] != None:
                                print("INDEX DOES NOT MAP TO NONE")
                                print("Arg:")
                                Arg.print()
                                Arg.getType().print()
                                print("FunctionInfo.getConcreteValFor(Arg):")
                                FunctionInfo.getConcreteValFor(Arg).print()
                                FunctionInfo.getConcreteValFor(
                                    Arg).getType().print()
                                print("FUNCTION BEFORE REPLACING:")
                                Function.print()
                                self.replaceUsesInRegion(
                                    Function, Arg, FunctionInfo.getConcreteValFor(Arg))
                                print("--Function:")
                                Function.print()
                                FunctionInfo.eraseConcreteValForArg(Arg)
                                Function.eraseArg(Idx)
                                ModificationMade = True
                    if DeadLoopsFound == True and Function in FunctionToDeadLoops:
                        for Loop in FunctionToDeadLoops[Function]:
                            print("DEAD LOOP:")
                            Loop.print()
                            print("FUNCTION:")
                            Function.print()
                            self.removeDeadLoop(FunctionInfo, Function, Loop)
                    print("NEW FUNCTION:")
                    Function.print()
                    ErasedArgs = self.removeDeadArguments(
                        FunctionInfo, Function)
                    FunctionToClonedFunctionInfo[Function] = ClonedFunctionInfo
                    ClonedOriginalFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                    )
                    self.FunctionToFunctionInfo[ClonedOriginalFunction] = FunctionInfo
                    self.FunctionToArgPermutationMap[ClonedOriginalFunction] = ArgPermutation
                    self.FunctionToEquivalenceClassMap[ClonedOriginalFunction] = EquivalenceClass
                    if not isinstance(OriginalFunction, RoseUndefRegion):
                        self.CopyFunctionToOriginalFunction[ClonedOriginalFunction] = OriginalFunction
                    assert Function in self.FunctionToArgPermutationMap
                    if ModificationMade == True or DeadLoopsFound == True or ErasedArgs == True:
                        # Let's simplify the function first
                        RoseOpSimplify.Run(Function, FunctionInfo.getContext())
                        print("FINAL FUNCTION:")
                        Function.print()
                        self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(
                            Function)
                        FunctionInfo.addFunctionAtNewStage(Function)
                        FunctionInfo.addTargetAgnosticFunction(Function)
                        FunctionInfo.computeSemanticsInfo()
                        self.FunctionToFunctionInfo[Function] = FunctionInfo
                        print("ROSETTE CODE:")
                        print(self.FunctionToRosetteCodeMap[Function])
                        print("++++REFERENCE FUNCTION:")
                        FunctionToClonedFunctionInfo[Function].getLatestFunction(
                        ).print()
                        print("++++CHECK FUNCTION:")
                        FunctionInfo.getLatestFunction().print()
                        Verifier = RoseTransformationVerifier(FunctionToClonedFunctionInfo[Function],
                                                              FunctionInfo)
                        assert Verifier.verifyEquivalence() == True
                        # Replace uses of concrete arguments and try verifying again
                        CopyFunctionInfo = self.replaceUsesofConcreteArgsAndGetFunction(
                            FunctionInfo)
                        print("TARGET AGNOSTIC FUNCTION:")
                        FunctionInfo.getLatestFunction().print()
                        print("COPY TARGET AGNOSTIC FUNCTION:")
                        CopyFunctionInfo.getLatestFunction().print()
                        Verifier = RoseTransformationVerifier(
                            CopyFunctionInfo, FunctionInfo)
                        assert Verifier.verifyEquivalence() == True
                        # Now map this new function to the new argument permutation map
                        OlderFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                        )
                        assert OlderFunction in self.FunctionToArgPermutationMap
                        # if OlderFunction in self.CopyFunctionToOriginalFunction
                        OldArgPermutation = self.FunctionToArgPermutationMap[OlderFunction]
                        print("OlderFunction:")
                        OlderFunction.print()
                        print("FUNCTION:")
                        Function.print()
                        print("OldArgPermutation:")
                        print(OldArgPermutation)
                        RecoveredArgMap = list()
                        for Arg in Function.getArgs():
                            print("Arg:")
                            Arg.print()
                            Arg.getType().print()
                            if isinstance(Arg.getType(), RoseBitVectorType) \
                                    or isinstance(Arg.getType(), RoseIntegerType) \
                                    or isinstance(Arg.getType(), RoseBooleanType):
                                if isinstance(Arg.getType().getBitwidth(), RoseArgument):
                                    OldArgIndex = OlderFunction.getIndexOfArg(
                                        Arg)
                                    RecoveredArgMap.append(
                                        OldArgPermutation[OldArgIndex])
                                    continue
                            # Now we have to be more careful with checking equivalence
                            OldArgIndex = None
                            OlderFunctionInfo = FunctionToClonedFunctionInfo[Function]
                            for Idx, OlderArg in enumerate(OlderFunction.getArgs()):
                                if isinstance(OlderArg.getType(), RoseBitVectorType) \
                                        or isinstance(OlderArg.getType(), RoseIntegerType) \
                                        or isinstance(OlderArg.getType(), RoseBooleanType):
                                    if isinstance(OlderArg.getType().getBitwidth(), int):
                                        print("OLD ARG:")
                                        OlderArg.print()
                                        print("ARG:")
                                        Arg.print()
                                        if OlderArg == Arg:
                                            print("OlderArg.getType():")
                                            OlderArg.getType().print()
                                            OldArgIndex = Idx
                                            break
                                    else:
                                        assert isinstance(
                                            OlderArg.getType().getBitwidth(), RoseArgument)
                                        # DOUBLE CHECK
                                        # assert OlderFunctionInfo.argHasConcreteVal(OlderArg) == True
                                        assert OlderFunctionInfo.argHasConcreteVal(
                                            OlderArg.getType().getBitwidth()) == True
                                        print(
                                            "\n\n______________________________________________")
                                        ClonedOlderArg = OlderArg.clone()
                                        print(
                                            "OlderArg.getType().getBitwidth():")
                                        print(OlderArg.getType().getBitwidth())
                                        print(
                                            "ClonedOlderArg.getType().getBitwidth():")
                                        print(
                                            ClonedOlderArg.getType().getBitwidth())
                                        print(
                                            "OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth():")
                                        print(OlderFunctionInfo.getConcreteValFor(
                                            OlderArg.getType().getBitwidth()))
                                        if isinstance(OlderArg.getType(), RoseBitVectorType):
                                            ClonedOlderArg.setType(RoseBitVectorType.create(
                                                OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                        else:
                                            assert isinstance(
                                                OlderArg.getType(), RoseIntegerType)
                                            ClonedOlderArg.setType(RoseIntegerType.create(
                                                OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                        print("Arg:")
                                        Arg.print()
                                        Arg.getType().print()
                                        print(Arg.getType())
                                        print(Arg.getType().getBitwidth())
                                        print("ARG ID:")
                                        print(Arg.ID)
                                        print("ClonedOlderArg:")
                                        ClonedOlderArg.print()
                                        ClonedOlderArg.getType().print()
                                        print(ClonedOlderArg.getType())
                                        print(
                                            ClonedOlderArg.getType().getBitwidth())
                                        print("CLONED ARG ID:")
                                        print(ClonedOlderArg.ID)
                                        if Arg == ClonedOlderArg:
                                            print("CLONED ARG == ARG")
                                            OldArgIndex = Idx
                                            break
                            assert OldArgIndex != None
                            # OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                            print("OldArgIndex:")
                            print(OldArgIndex)
                            RecoveredArgMap.append(
                                OldArgPermutation[OldArgIndex])
                        print("RecoveredArgMap:")
                        print(RecoveredArgMap)
                        NewRecoveredMap = self.getArgPermutationMapRecursively(
                            OlderFunction, RecoveredArgMap)
                        self.FunctionToArgPermutationMap[Function] = NewRecoveredMap
                        print("!!!!!!!!!!!!!!!FINAL FUNCTION:")
                        Function.print()
                        print("!!!!!!!!!!!!!FINAL ARG PERMUTATIONN MAP:")
                        print(self.FunctionToArgPermutationMap[Function])
            else:
                # Remove dead outer loops
                Function = EquivalenceClass.getAFunction()
                print("Function TO ELIMINATE ARGS FROM:")
                Function.print()
                FunctionInfo = self.FunctionToFunctionInfo[Function]
                FunctionToClonedFunctionInfo = dict()
                FunctionToClonedFunctionInfo[Function] = RoseFunctionInfo()
                FunctionToClonedFunctionInfo[Function].addFunctionAtNewStage(
                    Function.clone())
                ArgsToConcreteValMap = deepcopy(
                    FunctionInfo.getArgsToConcreteValMap())
                FunctionToClonedFunctionInfo[Function].addArgsToConcreteMap(
                    ArgsToConcreteValMap)
                LoopList = Function.getRegionsOfType(RoseForLoop)
                FunctionInfo = self.FunctionToFunctionInfo[Function]
                ArgPermutation = self.FunctionToArgPermutationMap[Function]
                OriginalFunction = RoseUndefRegion()
                if Function in self.CopyFunctionToOriginalFunction:
                    OriginalFunction = self.CopyFunctionToOriginalFunction[Function]
                ClonedFunctionInfo = FunctionToClonedFunctionInfo[Function]
                DeadLoops = list()
                for Loop in LoopList:
                    assert not isinstance(Loop, RoseUndefRegion)
                    if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
                            == FunctionInfo.getConcreteValFor(Loop.getStep()):
                        DeadLoops.append(Loop)
                for Loop in DeadLoops:
                    if FunctionInfo.getConcreteValFor(Loop.getEndIndex()) \
                            == FunctionInfo.getConcreteValFor(Loop.getStep()):
                        if Loop.getNumUsersOf(Loop.getIterator()) == 0:
                            self.removeDeadLoop(FunctionInfo, Function, Loop)
                ErasedArgs = self.removeDeadArguments(FunctionInfo, Function)
                CopyFunctionInfo = self.replaceUsesofConcreteArgsAndGetFunction(
                    FunctionInfo, True)
                Function = CopyFunctionInfo.getLatestFunction()
                print("&&&&&Function:")
                Function.print()
                FunctionToClonedFunctionInfo[Function] = ClonedFunctionInfo
                ClonedOriginalFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                )
                self.FunctionToFunctionInfo[ClonedOriginalFunction] = FunctionInfo
                self.FunctionToArgPermutationMap[ClonedOriginalFunction] = ArgPermutation
                self.FunctionToEquivalenceClassMap[ClonedOriginalFunction] = EquivalenceClass
                if not isinstance(OriginalFunction, RoseUndefRegion):
                    self.CopyFunctionToOriginalFunction[ClonedOriginalFunction] = OriginalFunction
                # if len(DeadLoops) != 0 or ErasedArgs == True:
                self.FunctionToRosetteCodeMap[Function] = RosetteGen.CodeGen(
                    Function)
                FunctionInfo.addFunctionAtNewStage(Function)
                FunctionInfo.addTargetAgnosticFunction(Function)
                FunctionInfo.computeSemanticsInfo()
                self.FunctionToFunctionInfo[Function] = FunctionInfo
                Verifier = RoseTransformationVerifier(
                    FunctionToClonedFunctionInfo[Function], FunctionInfo)
                assert Verifier.verifyEquivalence() == True
                # Replace uses of concrete arguments and try verifying again
                CopyFunctionInfo = self.replaceUsesofConcreteArgsAndGetFunction(
                    FunctionInfo)
                Verifier = RoseTransformationVerifier(
                    CopyFunctionInfo, FunctionInfo)
                assert Verifier.verifyEquivalence() == True
                # Now map this new function to the new argument permutation map
                OlderFunction = FunctionToClonedFunctionInfo[Function].getLatestFunction(
                )
                assert OlderFunction in self.FunctionToArgPermutationMap
                # if OlderFunction in self.CopyFunctionToOriginalFunction:
                OldArgPermutation = self.FunctionToArgPermutationMap[OlderFunction]
                # else:
                #  OldArgPermutation = [X for X in range(OlderFunction.getNumArgs())]
                print("OlderFunction:")
                OlderFunction.print()
                print("NEW Function:")
                Function.print()
                # RecoveredArgMap = list()
                # for Idx, Arg in enumerate(Function.getArgs()):
                #  print("Arg:")
                #  Arg.print()
                #  OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                #  RecoveredArgMap.append(OldArgPermutation[OldArgIndex])
                RecoveredArgMap = list()
                for Arg in Function.getArgs():
                    print("Arg:")
                    Arg.print()
                    Arg.getType().print()
                    if isinstance(Arg.getType(), RoseBitVectorType) \
                            or isinstance(Arg.getType(), RoseIntegerType) \
                            or isinstance(Arg.getType(), RoseBooleanType):
                        if isinstance(Arg.getType().getBitwidth(), RoseArgument):
                            OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                            RecoveredArgMap.append(
                                OldArgPermutation[OldArgIndex])
                            continue
                    # Now we have to be more careful with checking equivalence
                    OldArgIndex = None
                    OlderFunctionInfo = FunctionToClonedFunctionInfo[Function]
                    for Idx, OlderArg in enumerate(OlderFunction.getArgs()):
                        if isinstance(OlderArg.getType(), RoseBitVectorType) \
                                or isinstance(OlderArg.getType(), RoseIntegerType) \
                                or isinstance(OlderArg.getType(), RoseBooleanType):
                            if isinstance(OlderArg.getType().getBitwidth(), int):
                                if OlderArg == Arg:
                                    print("OlderArg.getType():")
                                    OlderArg.getType().print()
                                    OldArgIndex = Idx
                                    break
                            else:
                                assert isinstance(
                                    OlderArg.getType().getBitwidth(), RoseArgument)
                                print("OlderArg:")
                                OlderArg.print()
                                assert OlderFunctionInfo.argHasConcreteVal(
                                    OlderArg.getType().getBitwidth()) == True
                                print(
                                    "\n\n______________________________________________")
                                ClonedOlderArg = OlderArg.clone()
                                print("OlderArg.getType().getBitwidth():")
                                print(OlderArg.getType().getBitwidth())
                                print("ClonedOlderArg.getType().getBitwidth():")
                                print(ClonedOlderArg.getType().getBitwidth())
                                print(
                                    "OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth():")
                                print(OlderFunctionInfo.getConcreteValFor(
                                    OlderArg.getType().getBitwidth()))
                                if isinstance(OlderArg.getType(), RoseBitVectorType):
                                    ClonedOlderArg.setType(RoseBitVectorType.create(
                                        OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                else:
                                    assert isinstance(
                                        OlderArg.getType(), RoseIntegerType)
                                    ClonedOlderArg.setType(RoseIntegerType.create(
                                        OlderFunctionInfo.getConcreteValFor(OlderArg.getType().getBitwidth()).getValue()))
                                print("Arg:")
                                Arg.print()
                                Arg.getType().print()
                                print(Arg.getType())
                                print(Arg.getType().getBitwidth())
                                print("ARG ID:")
                                print(Arg.ID)
                                print("ClonedOlderArg:")
                                ClonedOlderArg.print()
                                ClonedOlderArg.getType().print()
                                print(ClonedOlderArg.getType())
                                print(ClonedOlderArg.getType().getBitwidth())
                                print("CLONED ARG ID:")
                                print(ClonedOlderArg.ID)
                                if Arg == ClonedOlderArg:
                                    print("CLONED ARG == ARG")
                                    OldArgIndex = Idx
                                    break
                    assert OldArgIndex != None
                    # OldArgIndex = OlderFunction.getIndexOfArg(Arg)
                    print("OldArgIndex:")
                    print(OldArgIndex)
                    RecoveredArgMap.append(OldArgPermutation[OldArgIndex])
                print("RecoveredArgMap:")
                print(RecoveredArgMap)
                NewRecoveredMap = self.getArgPermutationMapRecursively(
                    OlderFunction, RecoveredArgMap)
                self.FunctionToArgPermutationMap[Function] = NewRecoveredMap
                print("!!!!!!!!!!!!!!FINAL FUNCTION:")
                CopyFunctionInfo.getLatestFunction().print()
                print("!!!!!!!!!!!!FINAL ARG PERMUTATIONN MAP:")
                print(self.FunctionToArgPermutationMap[Function])

    def punchHolesInFunction(self, Function: RoseFunction, Context: RoseContext):
        print("RUN ON OP SIMPLIFY FUNCTION")
        print("FUNCTION:")
        Function.print()
        # Define a macro
        Macro = self.create(
            "depth", RoseConstant.create("K", RoseStringType(1)))
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
                    Hole = RoseOpaqueCallOp.create(Context.genName(),
                                                   RoseConstant(HoleFunction, RoseStringType.create(
                                                       len(HoleFunction))),
                                                   HoleArgsList, Op.getLowIndex().getType())
                    # Replace all uses of low index with this hole
                    HoleMap[Op.getLowIndex()] = Hole
                    Users = Function.getUsersOf(Op.getLowIndex())
                    Users[0].getParent().addOperationBefore(Hole, Users[0])
                    Function.replaceUsesWith(Op.getLowIndex(), Hole)
                    HoleList.append(Hole)
        return HoleList

    def getRosetteCodeForHole(self, Hole: RoseOpaqueCallOp):
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

    def generateCodeForParams(self, Function: RoseFunction, ParamListName: str):
        # Generate variables definitions for concrete inputs to the given functions
        Code = ""
        FunctionInfo = self.FunctionToFunctionInfo[Function]
        for Arg in Function.getArgs():
            if FunctionInfo.argHasConcreteVal(Arg) == True:
                ConcreteVal = FunctionInfo.getConcreteValFor(Arg)
                Code += self.genConcreteInput(Arg, ConcreteVal, ".arg")
        Code += "(define (" + ParamListName + " env)\n"
        Code += "(vector "
        for Idx, Arg in enumerate(Function.getArgs()):
            if isinstance(Arg.getType(), RoseBitVectorType):
                Code += "(vector-ref env" + str(Idx) + ") "
            else:
                Code += Arg.getName() + ".arg "
        Code += ")\n"
        Code += ")\n\n"
        return Code

    def generateCodeForSynthesis(self, Function: RoseFunction, RosetteImplCode: str, DepthVarName: str = None):
        # Generate code for function in Rosette
        RosetteFuncName = "invoke_ " + Function.getName()
        OuterFuncName = RosetteFuncName
        RosetteCode = ""
        if DepthVarName != None:
            assert isinstance(DepthVarName, str)
            OuterFuncName = RosetteFuncName + "_sketch"
            RosetteCode.append(
                "(define (" + OuterFuncName + "_sketch" + DepthVarName + ")")
        RosetteCode.append("(define (" + RosetteFuncName + " params)")
        RosetteCode.append(RosetteImplCode)
        RosetteCode.append("(" + Function.getName())
        for Idx in range(Function.getNumArgs()):
            RosetteCode.append("(vector-ref params " + str(Idx) + ")")
        RosetteCode.append(")")
        RosetteCode.append(")")
        if DepthVarName != None:
            RosetteCode.append(RosetteFuncName)
            RosetteCode.append(")")
        RosetteCode.append("\n")
        RosetteCode = "\n".join(RosetteCode)
        # Generate code for parameters of this function
        ParamListName = "generate_param_" + Function.getName()
        RosetteCode += self.generateCodeForParams(Function, ParamListName)
        RosetteCode += "\n"
        return RosetteCode, OuterFuncName, ParamListName

    def emitSynthesisCodeForSimilarityChecking(self, Sketch: RoseFunction, RefImpl: RoseFunction,
                                               HolesList: list):
        # Sanity check
        assert len(HolesList) > 0
        # Generate a file for performing synthesis first
        RosetteSketch = RosetteGen.CodeGen(Sketch)
        RosetteRefImpl = RosetteGen.CodeGen(RefImpl)
        # Rosette code headers
        Content = [
            "#lang rosette",
            "(require rosette/lib/synthax)",
            "(require rosette/lib/angelic)",
            "(require racket/pretty)",
            "(require racket/serialize)",
            "(require hydride)",
            "(require \"RosetteOpsImpl.rkt\")\n"
        ]
        Content.extend(["enable-debug",
                        "(current-bitwidth 16)",
                        "(custodian-limit-memory (current-custodian) (* 20000 1024 1024))",
                        "(define solver 'z3)\n"])
        # Generate rosette code for all holes
        DepthVarName = None
        for Hole in HolesList:
            assert isinstance(Hole, RoseOpaqueCallOp)
            if DepthVarName == None:
                if Hole.getMacro() != None:
                    DepthVarName = Hole.getMacro().getName()
            Content.append(self.getRosetteCodeForHole(Hole))
        # Generate rosette code for the reference implementation
        RefRosette, RefFunctionName, RefParamList = \
            self.generateCodeForSynthesis(RefImpl, RosetteRefImpl)
        Content.append(RefRosette)
        # Generate rosette code for the sketch implementation.
        # For now we use the depth of 2.
        Depth = 2
        SketchRosette, SketchFunctionName, SketchParamList = \
            self.generateCodeForSynthesis(Sketch, RosetteSketch, DepthVarName)
        Content.append(SketchRosette)
        # Generate a list of bitwidths
        Code = "(define bitwidth-list (list "
        for Arg in RefImpl.getArgs():
            if isinstance(Arg.getType(), RoseBitVectorType):
                Code += str(Arg.getType().getBitwidth()) + " "
        Code += "))\n"
        Content.append(Code)
        # Generate code for performing synthesis
        Content.append("(define test-depth " + Depth + ")")
        Content.append("(define-values (satisfiable? sol? _) (general-synthesize-sol-iterative \
                    ({} {}) {} bitwidth-list {} {} '() solver)") \
            .format(SketchFunctionName, str(Depth), RefFunctionName,
                    SketchParamList, RefParamList)
        Content.append("(displayln \"is Satisfiable?\")")
        Content.append("(println satisfiable?)")
        return "\n".join(Content)

    def verifyUsingSynthesis(self, Sketch: RoseFunction, RefImpl: RoseFunction,
                             HolesList: list, Suffix: str = None):
        RosetteCode = self.emitSynthesisCodeForSimilarityChecking(
            Sketch, RefImpl, HolesList)
        FileName = "test_synthesis_" + Sketch.getName() + "_" + RefImpl.getName() + ".rkt"
        try:
            File = open(FileName, "w+")
            File.write(RosetteCode)
            File.close()
            # Perform verification
            Output, Err = RunCommand("racket {}".format(FileName))
            RunCommand("killall z3")
            RunCommand("killall racket")
            # RunCommand("rm {}".format(FileName))
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

    def refineSimilarityChecking(self):
        # Track verification results
        EQToEQMap = dict()
        EQToResultMap = dict()
        # RemovedEquivalenceClasses = set()
        EquivalenceClasses = set()
        EquivalenceClasses.update(self.EquivalenceClasses)
        Suffix = -1
        for EquivalenceClass in EquivalenceClasses:
            # if EquivalenceClass in RemovedEquivalenceClasses:
            #  continue
            for CheckEquivalenceClass in EquivalenceClasses:
                # if CheckEquivalenceClass in RemovedEquivalenceClasses:
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
                print("CHECKING AGAINST EQUIVALENCE CLASS \n{} AND \n{}".format(
                    str(Function), str(CheckFunction)))
                if self.doFunctionsQualifyForSimilarityChecking(Function, CheckFunction) == False:
                    continue
                # Punches holes in one function
                ClonedCheckFunction = CheckFunction.clone()
                CheckFunctionInfo = self.FunctionToFunctionInfo[CheckFunction]
                HolesList = self.punchHolesInFunction(
                    ClonedCheckFunction, CheckFunctionInfo.getContext())
                Suffix += 1
                VerifyResult = self.verifyUsingSynthesis(
                    ClonedCheckFunction, Function, HolesList, Suffix)
                if VerifyResult == True:
                    # Now that synthesis has worked, we will now perform verification again to verify that
                    # the new sketch and the old sketch are equivalent on the old sketch's inputs.
                    # First the new sketch
                    print("Merged {} and {} eq class".format(
                        Function.getName(), ClonedCheckFunction.getName()))
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
                            self.completeFunctionInfo(
                                PermCheckFunctionInfo, CheckFunctionInfo, ArgPermutation)
                            self.FunctionToFunctionInfo[PermCheckFunction] = PermCheckFunctionInfo
                            continue
                        CopyFunction = self.createPermutatedFunction(
                            OrgFunction, ArgPermutation)
                        PermutedCheckFunctions.append(CopyFunction)
                        OrgFunctionInfo = self.FunctionToFunctionInfo[OrgFunction]
                        OrgFuncArgsToConcreteValMap = OrgFunctionInfo.getArgsToConcreteValMap()
                        CopyFuncArgsToConcreteValMap = self.getFunctionToArgMapping(OrgFunction,
                                                                                    OrgFuncArgsToConcreteValMap, CopyFunction, ArgPermutation)
                        FunctionToArgsMapping[CopyFunction] = CopyFuncArgsToConcreteValMap
                        OrgFunctionInfo = self.FunctionToFunctionInfo[OrgFunction]
                        CopyFunctionInfo = RoseFunctionInfo()
                        CopyFunctionInfo.addFunctionAtNewStage(CopyFunction)
                        CopyFunctionInfo.addArgsToConcreteMap(
                            CopyFuncArgsToConcreteValMap)
                        self.completeFunctionInfo(
                            CopyFunctionInfo, OrgFunctionInfo, ArgPermutation)
                        self.FunctionToFunctionInfo[CopyFunction] = CopyFunctionInfo
                    EquivalenceClass.extend(
                        PermutedCheckFunctions, FunctionToArgsMapping)
                    for EqFunction in PermutedCheckFunctions:
                        self.FunctionToEquivalenceClassMap[EqFunction] = EquivalenceClass
                    self.EquivalenceClasses.remove(CheckEquivalenceClass)
                    # RemovedEquivalenceClasses.add(CheckEquivalenceClass)
                    EQToEQMap[CheckEquivalenceClass] = EquivalenceClass
                    print("DONE MERGING")
                    break


if __name__ == '__main__':
    if ParallelChecker:
        SimilarityChecker = RoseSimilarityCheckerParallel(["VISA"])
    else:
        SimilarityChecker = RoseSimilarityChecker(["VISA"])
    # SimilarityChecker = RoseSimilarityChecker(["x86"])
    import sys
    sys.stdout = sys.__stderr__
    SimilarityChecker.performSimilarityChecking()
    # SimilarityChecker.parallelizeSimilarityChecking()
