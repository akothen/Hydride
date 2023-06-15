#############################################################
#
# LLVM intrinsic generator
#
#############################################################


from RoseAbstractions import *
from RoseContext import *
from RosetteCodeEmitter import *
from RoseFunctionInfo import *
from RoseEquivalenceClass import *
from RoseSimilarityCheckerUtilities import *


class RoseLLVMIntrinsicsGen():
    def __init__(self, EquivalenceClasses: set):
        # Sanity check
        for EquivalenceClass in EquivalenceClasses:
            assert isinstance(EquivalenceClass, RoseEquivalenceClass)
        self.EquivalenceClasses = EquivalenceClasses

    def generateLLVMIntrinsic(self, EquivalenceClass: RoseEquivalenceClass):
        print("GENERATING INTRINSIC")
        Function = EquivalenceClass.getAFunction()
        FunctionName = Function.getName()
        VectorType = "llvm_anyvector_ty"
        IntType = "llvm_anyint_ty"
        Output = "[" + VectorType + "]"
        InputList = ""
        for Index, Arg in enumerate(Function.getArgs()):
            if isinstance(Arg.getType(), RoseBitVectorType):
                InputList += VectorType
            elif isinstance(Arg.getType(), RoseIntegerType):
                InputList += IntType
            if Index != Function.getNumArgs() - 1:
                InputList += ","
        Input = "[" + InputList + "]"
        Attr = "[IntrNoMem, IntrSpeculatable]"
        IntrinsicName = RoseIRToLLVM(FunctionName)
        IntrinsicDef = "def int_" + IntrinsicName + " : Intrinsic<" \
            + Output + "," + Input + "," + Attr + ">;\n\n"
        print(IntrinsicDef)
        return IntrinsicDef

    def generateLLVMIntrinsics(self, FileName: str):
        String = ""
        for EquivalenceClass in self.EquivalenceClasses:
            String += self.generateLLVMIntrinsic(EquivalenceClass)
        try:
            File = open(FileName, "w")
            File.write(String)
            File.close()
        except IOError:
            print("Error making: {}".format(FileName))
