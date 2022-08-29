#############################################################
#
# Rosette IR to LLVM IR generator.
#
#############################################################


from webbrowser import Opera
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseLLVMContext import *

from RoseToLLVMMap import *  # This is an auto-generated file.

from llvmlite.ir.values import Function as LLVMFunction
from llvmlite.ir.types import FunctionType as LLVMVFunctionType
from llvmlite.ir.builder import IRBuilder as LLVMIRBuilder



def CreateFunctionType(RoseIRFunction : RoseFunction, LLVMContext : RoseLLVMContext):
  RetVal = RoseIRFunction.getReturnValue()
  RetType = LLVMContext.getLLVMTypeFor(RetVal)
  InputArgTypes = list()
  for Arg in RoseIRFunction.getArgs():
    InputArgTypes.append(LLVMContext.getLLVMTypeFor(Arg))
  return LLVMVFunctionType(RetType, InputArgTypes)


def GenerateLLVMBlock(LLVMIRFunction : LLVMFunction, RoseIRBlock : RoseBlock, \
                      LLVMContext : RoseLLVMContext, RosetteContext : RoseContext):
  LLVMBlock = LLVMIRFunction.append_basic_block(name=RosetteContext.genName())
  Builder = LLVMIRBuilder(LLVMBlock)
  for Op in RoseIRBlock:
    # There should be no call operation except opaque calls
    assert not isinstance(Op, RoseCallOp)
    if isinstance(Op, RoseOpaqueCallOp):
      # Get the name of the LLVM intrinsic
      LLVMIntrinsicName = RoseToLLVMMap[Op.getCallee().getName()]
      Args = list()
      for Operand in Op.getCallOperands():
        if isinstance(Operand, RoseConstant):
          Args.append(Operand.to_llvm_ir())
        else:
          Args.append(LLVMContext.getLLVMValueFor(Operand))
      CallInst = Builder.call(LLVMIntrinsicName, Args)
      LLVMContext.mapRoseValToLLVMVal(Op, CallInst)
      continue
    Instruction = Op.to_llvm_ir(LLVMContext)
    LLVMContext.mapRoseValToLLVMVal(Op, Instruction)


def GenerateRegion(LLVMIRFunction : LLVMFunction, Region : RoseRegion,
                   LLVMContext : RoseLLVMContext, RosetteContext : RoseContext):
  # TODO: Support LLVM codegen for other types of regions
  for SubRegion in Region:
    # LLVM does not support nested functions
    assert not isinstance(SubRegion, RoseFunction)
    if isinstance(SubRegion, RoseBlock):
      GenerateLLVMBlock(LLVMIRFunction, SubRegion, LLVMContext, RosetteContext)
      continue
    assert(False and "Attempting to generate LLVM IR for unsupported Rose Region.")


def GenerateLLVMIR(RoseIRFunction : RoseFunction, RosetteContext : RoseContext):
  # Create an empty module and function.
  LLVMModule = LLVMFunction(name = RoseIRFunction.getName() + ".module")
  LLVMContext = RoseLLVMContext()
  LLVMFunctionType = CreateFunctionType(RoseIRFunction, LLVMContext)
  LLVMIRFunction = LLVMFunction(LLVMModule, LLVMFunctionType, name=RoseIRFunction.getName())
  # Map LLVM function arguments to the Rose function arguments
  for Idx, Arg in enumerate(LLVMIRFunction.args):
    LLVMContext.mapRoseValToLLVMVal(RoseIRFunction.getArg(Idx), Arg)
  GenerateRegion(LLVMIRFunction, RoseIRFunction, LLVMContext, RosetteContext)
  return LLVMModule


# Converts the given Rose IR function into Rosette
def CodeGen(Function : RoseFunction, RosetteContext : RoseContext):
  LLVMModule = GenerateLLVMIR(Function, RosetteContext)
  print("---\n\n\n\n\n")
  Function.print()
  print("LLVM Module")
  print(LLVMModule)
  print("---\n\n\n\n\n")


