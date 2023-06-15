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


def CreateFunctionTypeForFunction(RoseIRFunction: RoseFunction, LLVMContext: RoseLLVMContext):
    print("CreateFunctionTypeForFunction")
    RetVal = RoseIRFunction.getReturnValue()
    RetType = LLVMContext.getLLVMTypeFor(RetVal)
    print("RetType:")
    print(RetType)
    InputArgTypes = list()
    for Arg in RoseIRFunction.getArgs():
        print("Arg:")
        Arg.print()
        Arg.getType().print()
        print("LLVMContext.getLLVMTypeFor(Arg):")
        print(LLVMContext.getLLVMTypeFor(Arg))
        InputArgTypes.append(LLVMContext.getLLVMTypeFor(Arg))
    return LLVMFunctionType(RetType, InputArgTypes)


def CreateFunctionTypeForOp(RoseOp: RoseOpaqueCallOp, LLVMContext: RoseLLVMContext):
    OutType = LLVMContext.getLLVMTypeFor(RoseOp)
    print("OutType:")
    print(OutType)
    OperandTypes = list()
    for Operand in RoseOp.getCallOperands():
        print("Operand:")
        Operand.print()
        if isinstance(Operand, RoseConstant):
            if isinstance(Operand.getType(), RoseIntegerType):
                OperandTypes.append(LLVMIntType(
                    Operand.getType().getBitwidth()))
            else:
                assert isinstance(Operand.getType(), RoseBitVectorType)

        else:
            OperandTypes.append(LLVMContext.getLLVMTypeFor(Operand))
    return LLVMFunctionType(OutType, OperandTypes)


# Function = Builder.module.globals[FunctionName]
def GetFunction(Builder, FunctionName, RetType, ArgTys):
    FunctionName = '.'.join([FunctionName])
    FunctionList = list()
    for Function in Builder.module.functions:
        print("FUNCTION ALREDY IN MODULE GLOBALS")
        if FunctionName in Function.name:
            FunctionList.append(Function)
    for Function in FunctionList:
        assert len(ArgTys) == len(Function.args)
        FunctionNotFound = True
        for Idx, ArgTy in enumerate(ArgTys):
            if Function.args[Idx].type != ArgTy:
                FunctionNotFound = False
                break
        if FunctionNotFound == True and Function.return_value.type == RetType:
            return Function
    FunctionTy = LLVMFunctionType(RetType, ArgTys)
    return LLVMFunction(Builder.module, FunctionTy, name=Builder.module.get_unique_name(FunctionName))


def GenerateLLVMBlock(LLVMIRFunction: LLVMFunction, RoseIRBlock: RoseBlock,
                      LLVMContext: RoseLLVMContext):
    LLVMBlock = LLVMIRFunction.append_basic_block(name="entry")
    LLVMContext.setLLVMBuilder(LLVMIRBuilder(LLVMBlock))
    for Op in RoseIRBlock:
        # There should be no call operation except opaque calls
        assert not isinstance(Op, RoseCallOp)
        if isinstance(Op, RoseOpaqueCallOp):
            print("Op.getCallee().getName():")
            print(Op.getCallee().getName())
            Op.print()
            # Get the name of the LLVM intrinsic
            LLVMIntrinsicName = "llvm.hydride." + Op.getCallee().getName()
            RetType = LLVMContext.getLLVMTypeFor(Op)
            Builder = LLVMContext.getLLVMBuilder()
            OperandTypes = list()
            Args = list()
            for OperandIndex, Operand in enumerate(Op.getCallOperands()):
                print("Operand:")
                Operand.print()
                Operand.getType().print()
                print("OperandIndex:")
                print(OperandIndex)
                if isinstance(Operand, RoseConstant):
                    if isinstance(Operand.getType(), RoseIntegerType):
                        OperandTypes.append(LLVMIntType(
                            Operand.getType().getBitwidth()))
                    else:
                        assert isinstance(Operand.getType(), RoseBitVectorType)
                        print("CONSTANT BITVECTOR")
                        print("LLVMContext.getLLVMTypeFor(Operand):")
                        print(LLVMContext.getLLVMTypeFor(Operand))
                        OperandTypes.append(
                            LLVMContext.getLLVMTypeFor(Operand))
                    print("Operand.to_llvm_ir(LLVMContext):")
                    print(Operand.to_llvm_ir(LLVMContext))
                    Args.append(Operand.to_llvm_ir(LLVMContext))
                    print("---OperandType[-1]:")
                    print(OperandTypes[-1])
                else:
                    OperandTypes.append(LLVMContext.getLLVMTypeFor(Operand))
                    Args.append(LLVMContext.getLLVMValueFor(Operand))
                    print("---OperandType[-1]:")
                    print(OperandTypes[-1])
            print("---OperandTypes:")
            print(OperandTypes)
            print("len(OperandTypes):")
            print(len(OperandTypes))
            Intrinsic = GetFunction(
                Builder, LLVMIntrinsicName, RetType, OperandTypes)
            for Arg in Intrinsic.args:
                print("CHECKING ARG:")
                print(Arg)
            InstName = Op.getName()
            if InstName[0] == "%":
                InstName = InstName[1:]
            print("OP:")
            Op.print()
            print("InstName:")
            print(InstName)
            print("Args:")
            print(Args)
            print("len(Args):")
            print(len(Args))
            print("Intrinsic:")
            print(Intrinsic)
            CallInst = Builder.call(Intrinsic, Args, InstName)
            print("CallInst:")
            print(CallInst)
            for Arg in CallInst.args:
                print("--CHECKING ARG:")
                print(Arg)
            LLVMContext.mapRoseValToLLVMVal(Op, CallInst)
            continue
        print("OP:")
        Op.print()
        Instruction = Op.to_llvm_ir(LLVMContext)
        LLVMContext.mapRoseValToLLVMVal(Op, Instruction)


def GenerateRegion(LLVMIRFunction: LLVMFunction, Region: RoseRegion,
                   LLVMContext: RoseLLVMContext):
    # TODO: Support LLVM codegen for other types of regions
    for SubRegion in Region:
        # LLVM does not support nested functions
        assert not isinstance(SubRegion, RoseFunction)
        if isinstance(SubRegion, RoseBlock):
            GenerateLLVMBlock(LLVMIRFunction, SubRegion, LLVMContext)
            continue
        assert (False and "Attempting to generate LLVM IR for unsupported Rose Region.")


def GenerateLLVMIR(RoseIRFunctionToRoseLLVMCtx: dict, ModuleName: str):
    # Create an empty module and function.
    LLVMIRModule = None
    for RoseIRFunction, RoseLLVMCxt in RoseIRFunctionToRoseLLVMCtx.items():
        if LLVMIRModule == None:
            if ModuleName == None:
                LLVMIRModule = LLVMModule(
                    name=RoseIRFunction.getName() + ".module")
            else:
                LLVMIRModule = LLVMModule(name=ModuleName)
        assert isinstance(RoseIRFunction, RoseFunction)
        assert isinstance(RoseLLVMCxt, RoseLLVMContext)
        print("RoseIRFunction:")
        RoseIRFunction.print()
        LLVMFunctionType = CreateFunctionTypeForFunction(
            RoseIRFunction, RoseLLVMCxt)
        print("LLVMFunctionType:")
        print(LLVMFunctionType)
        LLVMIRFunction = LLVMFunction(
            LLVMIRModule, LLVMFunctionType, name=RoseIRFunction.getName())
        # Map LLVM function arguments to the Rose function arguments
        for Idx, Arg in enumerate(LLVMIRFunction.args):
            RoseLLVMCxt.mapRoseValToLLVMVal(RoseIRFunction.getArg(Idx), Arg)
            print(RoseLLVMCxt.getLLVMValueFor(RoseIRFunction.getArg(Idx)))
            print("RoseIRFunction.getArg(Idx)")
            print(id(RoseIRFunction.getArg(Idx)))
        GenerateRegion(LLVMIRFunction, RoseIRFunction, RoseLLVMCxt)
    return LLVMIRModule


# Converts the given Rose IR function into Rosette
def LLVMCodeGen(RoseIRFunctionToRoseLLVMCtx: dict, ModuleName: str = None):
    LLVMIRModule = GenerateLLVMIR(RoseIRFunctionToRoseLLVMCtx, ModuleName)
    print("---\n\n\n\n\n")
    print("ROSE IR FUNCTIONS")
    for RoseIRFunction, _ in RoseIRFunctionToRoseLLVMCtx.items():
        print("ROSE FUNCTION:")
        RoseIRFunction.print()
    print("LLVM Module")
    print(LLVMIRModule)
    print("---\n\n\n\n\n")
    return LLVMIRModule
