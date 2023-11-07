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
    def __init__(self, ReferenceFunctionInfo: RoseFunctionInfo, CheckFunctionInfo: RoseFunctionInfo,
                 ArgsPermutation: list = None, ImmediateKill: bool = True, UID: str = ""):
        self.CheckFunctionInfo = CheckFunctionInfo
        self.ReferenceFunctionInfo = ReferenceFunctionInfo
        self.CheckArgToRefArg = dict()
        self.ImmediateKill = ImmediateKill
        self.UID = "_"+UID if UID else ""
        if ArgsPermutation != None:
            CheckFunction = self.CheckFunctionInfo.getLatestFunction()
            ReferenceFunction = self.ReferenceFunctionInfo.getLatestFunction()
            assert len(ArgsPermutation) == ReferenceFunction.getNumArgs()
            for CheckArgIndex, RefArgIndex in enumerate(ArgsPermutation):
                self.CheckArgToRefArg[CheckFunction.getArg(CheckArgIndex)] = \
                    ReferenceFunction.getArg(RefArgIndex)
        else:
            if self.CheckFunctionInfo.getLatestFunction().getNumArgs() \
                    < self.ReferenceFunctionInfo.getLatestFunction().getNumArgs():
                self.CheckFunctionInfo = ReferenceFunctionInfo
                self.ReferenceFunctionInfo = CheckFunctionInfo
            CheckFunction = self.CheckFunctionInfo.getLatestFunction()
            ReferenceFunction = self.ReferenceFunctionInfo.getLatestFunction()
            # The symbolic arguments in each of the functions must map to each other
            RefIndex = 0
            for CheckArg in CheckFunction.getArgs():
                if RefIndex < ReferenceFunction.getNumArgs():
                    RefArg = ReferenceFunction.getArg(RefIndex)
                if self.CheckFunctionInfo.argHasConcreteVal(CheckArg) == False:
                    print("RefArg:")
                    RefArg.print()
                    print("CheckArg:")
                    CheckArg.print()
                    if self.ReferenceFunctionInfo.argHasConcreteVal(RefArg) != False:
                        print("SKIP")
                        continue
                    print("---MAPPING")
                    print("RefArg:")
                    RefArg.print()
                    print("CheckArg:")
                    CheckArg.print()
                    self.CheckArgToRefArg[CheckArg] = RefArg
                    RefIndex += 1
                    continue
                if RefIndex < ReferenceFunction.getNumArgs() \
                        and self.ReferenceFunctionInfo.argHasConcreteVal(RefArg) == True:
                    RefIndex += 1
                    continue

    def genSymbolicInput(self, FunctionInfo: RoseFunctionInfo, Param: RoseArgument, NameSuffix: str, ArgToDefinitionMap: dict):
        Bitwidth = Param.getType().getBitwidth()
        if isinstance(Bitwidth, RoseValue):
            if isinstance(Bitwidth, RoseConstant):
                Bitwidth = Bitwidth.getValue()
            else:
                # There better be a concrete value
                Bitwidth = FunctionInfo.getConcreteValFor(Bitwidth).getValue()
        Input = "(define-symbolic {} (bitvector {}))\n".format(Param.getName() + NameSuffix,
                                                               str(Bitwidth))
        ArgToDefinitionMap[Param] = Param.getName() + NameSuffix
        return Input

    def genConcreteInput(self, Param: RoseArgument, ConcreteArg: RoseConstant, NameSuffix: str,
                         ArgToDefinitionMap: dict):
        assert isinstance(ConcreteArg, RoseConstant)
        Input = "(define {} {})\n".format(Param.getName() +
                                          NameSuffix, GenConcreteValue(ConcreteArg))
        ArgToDefinitionMap[Param] = Param.getName() + NameSuffix
        return Input

    def emitDefinitionOfRefFunctionArgs(self, ReferenceFunction: RoseFunction,
                                        ReferenceFunctionInfo: RoseFunctionInfo, NameSuffix: str):
        Code = ""
        ArgToDefinitionMap = dict()
        for Arg in ReferenceFunction.getArgs():
            if ReferenceFunctionInfo.argHasConcreteVal(Arg) == False:
                Code += self.genSymbolicInput(ReferenceFunctionInfo,
                                              Arg, NameSuffix, ArgToDefinitionMap)
            else:
                ConcreteVal = ReferenceFunctionInfo.getConcreteValFor(Arg)
                Code += self.genConcreteInput(Arg, ConcreteVal,
                                              NameSuffix, ArgToDefinitionMap)
        return Code, ArgToDefinitionMap

    def emitDefinitionOfCheckFunctionArgs(self, CheckFunction: RoseFunction, ReferenceFunction: RoseFunction,
                                          CheckFunctionInfo: RoseFunctionInfo, NameSuffix: str,
                                          RefArgToDefinitionMap: dict):
        Code = ""
        # assert CheckFunction.getNumArgs() >= ReferenceFunction.getNumArgs()
        CheckArgToDefinitionMap = dict()
        for Arg in CheckFunction.getArgs():
            if Arg in self.CheckArgToRefArg:
                CheckArgToDefinitionMap[Arg] = RefArgToDefinitionMap[self.CheckArgToRefArg[Arg]]
            if CheckFunctionInfo.argHasConcreteVal(Arg) == False:
                if Arg in self.CheckArgToRefArg:
                    CheckArgToDefinitionMap[Arg] = RefArgToDefinitionMap[self.CheckArgToRefArg[Arg]]
                else:
                    Code += self.genSymbolicInput(CheckFunctionInfo,
                                                  Arg, NameSuffix, CheckArgToDefinitionMap)
            else:
                ConcreteVal = CheckFunctionInfo.getConcreteValFor(Arg)
                Code += self.genConcreteInput(Arg, ConcreteVal,
                                              NameSuffix, CheckArgToDefinitionMap)
        return Code, CheckArgToDefinitionMap

    def emitVerificationCode(self):
        CheckFunction = self.CheckFunctionInfo.getLatestFunction()
        ReferenceFunction = self.ReferenceFunctionInfo.getLatestFunction()
        # assert CheckFunction.getNumArgs() >= ReferenceFunction.getNumArgs()
        # Rosette code headers
        Content = [
            "#lang rosette", "(require rosette/lib/synthax)", "(require rosette/lib/angelic)",
            "(require racket/pretty)", "(require \"RosetteOpsImpl.rkt\")\n"
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
        NameSuffix1 = "_1"
        Code, RefArgToDefinitionMap = self.emitDefinitionOfRefFunctionArgs(ReferenceFunction,
                                                                           self.ReferenceFunctionInfo, NameSuffix1)
        Content.append(Code)
        NameSuffix2 = "_2"
        Code, CheckArgToDefinitionMap = self.emitDefinitionOfCheckFunctionArgs(CheckFunction,
                                                                               ReferenceFunction, self.CheckFunctionInfo, NameSuffix2, RefArgToDefinitionMap)
        Content.append(Code)
        ReferenceFunctionListString = ""
        for Arg in ReferenceFunction.getArgs():
            ReferenceFunctionListString += RefArgToDefinitionMap[Arg] + " "
        CheckFuncArgNamesListString = ""
        for Arg in CheckFunction.getArgs():
            CheckFuncArgNamesListString += CheckArgToDefinitionMap[Arg] + " "
        Content.append("(verify (assert (equal? ({} {}) ({} {}))))\n".format(CheckFunction.getName(),
                                                                             CheckFuncArgNamesListString, ReferenceFunction.getName(),
                                                                             ReferenceFunctionListString))
        return "\n".join(Content)

    def verifyEquivalence(self, uid=""):
        # Generate verification code
        Code = self.emitVerificationCode()
        Function = self.ReferenceFunctionInfo.getLatestFunction()
        print("REFERENCE FUNCTION:")
        self.ReferenceFunctionInfo.getLatestFunction().print()
        print("CHECK FUNCTION:")
        self.CheckFunctionInfo.getLatestFunction().print()
        FileName = "verify_" + Function.getName() + self.UID + ".rkt"
        try:
            File = open(FileName, "w+")
            File.write(Code)
            File.close()
            # Perform verification
            # Sometimes racket execute the file before it saves completely, in this case Err is not empty.
            for _ in range(2):
                Output, Err = RunCommandUsingPipes(
                    "racket {}".format(FileName))
                if self.ImmediateKill:
                    RunCommandUsingPipes("killall z3")
                    RunCommandUsingPipes("killall racket")
                # RunCommand("rm {}".format(FileName))
                print("Output:")
                print(Output)
                print("Err:")
                print(Err)
                if Err == "":
                    Out = Output.split("\n")
                    print("Out[0]:")
                    print(Out[0])
                    if "unsat" in Out[0]:
                        return True
                    return False
            return False
        except IOError:
            print("Error making: {}.rkt".format(FileName))
            return False
