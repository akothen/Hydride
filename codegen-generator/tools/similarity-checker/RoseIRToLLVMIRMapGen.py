#############################################################
#
# Maps the opaque calls in Rosette IR to intrinsics in LLVM
# IR.
#
#############################################################


from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *


class RoseIRToLLVMMappingGen():
    def __init__(self, EquivalenceClasses: set):
        # Sanity check
        for EquivalenceClass in EquivalenceClasses:
            assert isinstance(EquivalenceClass, RoseEquivalenceClass)
        self.EquivalenceClasses = EquivalenceClasses

    def generateRoseIRToLLVMMapping(self, EquivalenceClass: RoseEquivalenceClass):
        print("GENERATING INTRINSIC")
        Function = EquivalenceClass.getAFunction()
        FunctionName = Function.getName()
        LLVMIntrinsicName = RoseIRToLLVM(FunctionName)
        LLVMIntrinsicName = LLVMIntrinsicName.replace("_", ".")
        DictEntry = "\"" + FunctionName + "\" : \"" + LLVMIntrinsicName + "\",\n"
        return DictEntry

    def generateLLVMIntrinsics(self, FileName: str):
        String = "RoseToLLVMMap = {"
        for EquivalenceClass in self.EquivalenceClasses:
            String += self.generateRoseIRToLLVMMapping(EquivalenceClass)
        String += "}\n"
        try:
            File = open(FileName, "w")
            File.write(String)
            File.close()
        except IOError:
            print("Error making: {}".format(FileName))
