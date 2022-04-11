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
  def __init__(self, FunctionInfoList : list):
    # Sanity check
    for FunctionInfo in FunctionInfoList:
      assert isinstance(FunctionInfo, RoseFunctionInfo)
    self.FunctionInfoList = FunctionInfoList
  
  def generateLLVMIntrinsic(self, EquivalenceClass : RoseEquivalenceClass):
    print("GENERATING INTRINSIC")
    Function = EquivalenceClass.getAFunction()
    FunctionName = Function.getName()
    VectorType = "llvm_anyVectorType"
    IntType = "llvm_anyIntType"
    Output = "[" + VectorType + "]"
    InputList = ""
    for Index, Arg in enumerate(Function.getArgs()):
      if isinstance(Arg.getType(), RoseBitVectorType):
        InputList += VectorType
      elif isinstance(Arg.getType(), RoseIntegerType):
        InputList += IntType
      if Index != Function.getNumArgs() - 1:
        InputList += ","
    input = "[" + InputList + "]"
    Attr = "[IntrNoMem, IntrSpeculatable]"
    IntrinsicName = "tensor_" + FunctionName
    IntrinsicDef = "def int_" + IntrinsicName + " : Intrinsic<" \
                      + Output + "," + input + "," + Attr + ">;"
    print(IntrinsicDef)
    return IntrinsicName

  def generateLLVMIntrinsics(self, FileName : str):
    String = ""
    for EquivalenceClass in self.EquivalenceClasses:
      String += self.generateLLVMIntrinsic(EquivalenceClass)
    try:
      File = open(FileName, "w")
      File.write(String)
      File.close()
    except IOError:
      print("Error making: {}".format(FileName))


