#############################################################
#
# Rosette IR to LLVM IR generator.
#
#############################################################


from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseUtilities import *
from RoseLLVMContext import *

from llvmlite.ir.module import Module as LLVMModule
from llvmlite.ir.values import Function as LLVMFunction
from llvmlite.ir.types import FunctionType as LLVMFunctionType
from llvmlite.ir.builder import IRBuilder as LLVMIRBuilder



def CreateFunctionTypeForFunction(RoseIRFunction : RoseFunction, LLVMContext : RoseLLVMContext):
  RetVal = RoseIRFunction.getReturnValue()
  RetType = LLVMContext.getLLVMTypeFor(RetVal)
  print("RetType:")
  print(RetType)
  InputArgTypes = list()
  for Arg in RoseIRFunction.getArgs():
    print("Arg:")
    Arg.print()
    print("LLVMContext.getLLVMTypeFor(Arg):")
    print(LLVMContext.getLLVMTypeFor(Arg))
    InputArgTypes.append(LLVMContext.getLLVMTypeFor(Arg))
  return LLVMFunctionType(RetType, InputArgTypes)


def CreateFunctionTypeForOp(RoseOp : RoseOpaqueCallOp, LLVMContext : RoseLLVMContext):
  OutType = LLVMContext.getLLVMTypeFor(RoseOp)
  print("OutType:")
  print(OutType)
  OperandTypes = list()
  for Operand in RoseOp.getCallOperands():
    print("Operand:")
    Operand.print()
    if isinstance(Operand, RoseConstant):
      if isinstance(Operand.getType(), RoseIntegerType):
        OperandTypes.append(LLVMIntType(Operand.getType().getBitwidth()))
      else:
        assert isinstance(Operand.getType(), RoseBitVectorType)

    else:
      OperandTypes.append(LLVMContext.getLLVMTypeFor(Operand))
  return LLVMFunctionType(OutType, OperandTypes)


def GetFunction(Builder, FunctionName, RetType, ArgTys):
    fnty = LLVMFunctionType(RetType, ArgTys)
    FunctionName = '.'.join([FunctionName])
    if FunctionName in Builder.module.globals:
      return Builder.module.globals[FunctionName]
    return LLVMFunction(Builder.module, fnty, name=FunctionName)


def GenerateLLVMBlock(LLVMIRFunction : LLVMFunction, RoseIRBlock : RoseBlock, \
                      LLVMContext : RoseLLVMContext):
  LLVMBlock = LLVMIRFunction.append_basic_block(name="entry")
  LLVMContext.setLLVMBuilder(LLVMIRBuilder(LLVMBlock))
  for Op in RoseIRBlock:
    # There should be no call operation except opaque calls
    assert not isinstance(Op, RoseCallOp)
    if isinstance(Op, RoseOpaqueCallOp):
      # Get the name of the LLVM intrinsic
      LLVMIntrinsicName = "llvm.hydride." + Op.getCallee().getName()
      RetType = LLVMContext.getLLVMTypeFor(Op)
      OperandTypes = list()
      Args = list()
      for Operand in Op.getCallOperands():
        print("Operand:")
        Operand.print()
        if isinstance(Operand, RoseConstant):
          if isinstance(Operand.getType(), RoseIntegerType):
            OperandTypes.append(LLVMIntType(Operand.getType().getBitwidth()))
          else:
            assert isinstance(Operand.getType(), RoseBitVectorType)
            print("CONSTANT BITVECTOR")
            print("LLVMContext.getLLVMTypeFor(Operand):")
            print(LLVMContext.getLLVMTypeFor(Operand))
            OperandTypes.append(LLVMContext.getLLVMTypeFor(Operand))
          print("Operand.to_llvm_ir(LLVMContext):")
          print(Operand.to_llvm_ir(LLVMContext))
          Args.append(Operand.to_llvm_ir(LLVMContext))
        else:
          OperandTypes.append(LLVMContext.getLLVMTypeFor(Operand))
          Args.append(LLVMContext.getLLVMValueFor(Operand))
      print("OperandTypes:")
      print(OperandTypes)
      Intrinsic = GetFunction(LLVMContext.getLLVMBuilder(), LLVMIntrinsicName, RetType, OperandTypes)
      InstName = Op.getName()
      if InstName[0] == "%":
        InstName = InstName[1:]
      CallInst = LLVMContext.getLLVMBuilder().call(Intrinsic, Args, InstName)
      print("CallInst:")
      print(CallInst)
      LLVMContext.mapRoseValToLLVMVal(Op, CallInst)
      continue
    print("OP:")
    Op.print()
    Instruction = Op.to_llvm_ir(LLVMContext)
    LLVMContext.mapRoseValToLLVMVal(Op, Instruction)


def GenerateRegion(LLVMIRFunction : LLVMFunction, Region : RoseRegion,
                   LLVMContext : RoseLLVMContext):
  # TODO: Support LLVM codegen for other types of regions
  for SubRegion in Region:
    # LLVM does not support nested functions
    assert not isinstance(SubRegion, RoseFunction)
    if isinstance(SubRegion, RoseBlock):
      GenerateLLVMBlock(LLVMIRFunction, SubRegion, LLVMContext)
      continue
    assert(False and "Attempting to generate LLVM IR for unsupported Rose Region.")


def GenerateLLVMIR(RoseIRFunctionToRoseLLVMCtx : dict):
  # Create an empty module and function.
  LLVMIRModule = LLVMModule(name = RoseIRFunction.getName() + ".module")
  for RoseIRFunction, RoseLLVMCxt in RoseIRFunctionToRoseLLVMCtx.items():
    assert isinstance(RoseIRFunction, RoseFunction)
    assert isinstance(RoseLLVMCxt, RoseLLVMContext)
    print("RoseIRFunction:")
    RoseIRFunction.print()
    LLVMFunctionType = CreateFunctionTypeForFunction(RoseIRFunction, RoseLLVMCxt)
    print("LLVMFunctionType:")
    print(LLVMFunctionType)
    LLVMIRFunction = LLVMFunction(LLVMIRModule, LLVMFunctionType, name=RoseIRFunction.getName())
    # Map LLVM function arguments to the Rose function arguments
    for Idx, Arg in enumerate(LLVMIRFunction.args):
      RoseLLVMCxt.mapRoseValToLLVMVal(RoseIRFunction.getArg(Idx), Arg)
      print(RoseLLVMCxt.getLLVMValueFor(RoseIRFunction.getArg(Idx)))
      print("RoseIRFunction.getArg(Idx)")
      print(id(RoseIRFunction.getArg(Idx)))
    GenerateRegion(LLVMIRFunction, RoseIRFunction, RoseLLVMCxt)
  return LLVMIRModule


# Converts the given Rose IR function into Rosette
def LLVMCodeGen(RoseIRFunctionToRoseLLVMCtx : dict):
  LLVMIRModule = GenerateLLVMIR(RoseIRFunctionToRoseLLVMCtx)
  print("---\n\n\n\n\n")
  print("ROSE IR FUNCTIONS")
  for RoseIRFunction, _ in RoseIRFunctionToRoseLLVMCtx.items():
    print("ROSE FUNCTION:")
    RoseIRFunction.print()
  print("LLVM Module")
  print(LLVMIRModule)
  print("---\n\n\n\n\n")
  return LLVMIRModule


