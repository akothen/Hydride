from RoseTypes import *
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *

from ARMAST import *
from ARMTypes import ARMTypes


class ARMRoseContext(RoseContext):
    def __init__(self):
        self.FunctionDefs = dict()
        super().__init__()


def CompileSemantics(Sema, RootContext: ARMRoseContext):
    OutParams = []
    ParamValues = []
    ParamsIDs = []
    for Index, Param in enumerate(Sema.params):
        ParamType = ARMTypes[Param.type]
        # Create a new rosette value
        ParamVal = RoseArgument.create(Param.name, ParamType, RoseUndefValue())
        RootContext.addSignednessInfoForValue(ParamVal, Param.is_signed)

    if Sema.rettype != 'void':
        RetType = ARMTypes[Sema.rettype]
        RetValue = RoseValue.create('Vd', RetType)
    else:
        assert False
        # TODO
        # RetType = RoseVoidType.create()
        # RetValue = RoseValue.create("", RetType)

    # Define a Rose function
    RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetType)
    RootFunction.setRetValName(RetValue.getName())

    # Add return value to the root context
    ReturnID = "return." + RootFunction.getReturnValue().getName()
    RootContext.addVariable(RootFunction.getReturnValue().getName(), ReturnID)
    RootContext.addCompiledAbstraction(ReturnID, RootFunction.getReturnValue())
    RootContext.addSignednessInfoForValue(RetValue, Sema.ret_is_signed)

    # Add the parameter values to the root context
    assert len(ParamsIDs) == RootFunction.getNumArgs()
    for Index in range(RootFunction.getNumArgs()):
        RootContext.addVariable(RootFunction.getArg(
            Index).getName(), ParamsIDs[Index])
        RootContext.addCompiledAbstraction(
            ParamsIDs[Index], RootFunction.getArg(Index))

    # Add the function to the context
    RootContext.addCompiledAbstraction(Sema.intrin, RootFunction)

    # Add the root function now
    RootContext.pushRootAbstraction(RootFunction)

    # Compile all the statements
    CompiledRetVal = RoseUndefValue()
    for Index, Stmt in enumerate(Sema.spec):
        if type(Stmt) == StmtAssign:
            if Index == len(Sema.spec)-1:
                # TODO: check V[d] or VPart[d,part]
                CompiledRetVal = CompileStatement(Stmt.expr, RootContext)
        CompileStatement(Stmt: Statement, RootContext)

    # Get the compiled function
    CompiledFunction = RootContext.getRootAbstraction()

    # See if the function returns anything, if not add a return op
    if CompiledRetVal == RoseUndefValue():
        Op = RoseReturnOp.create(CompiledFunction.getReturnValue())
        # NO meed to add this operation to the context but add it to the function
        CompiledFunction.addAbstraction(Op)

    print("\n\n\n\n\nFunction:")
    CompiledFunction.print()

    # Replace the uses of arguments
    # TODO: What does it do?
    # BlockList = CompiledFunction.getRegionsOfType(RoseBlock)
    # for Block in BlockList:
    #     for Op in Block:
    #         for OperandIndex, Operand in enumerate(Op.getOperands()):
    #             if isinstance(Operand, RoseArgument):
    #                 for Arg in CompiledFunction.getArgs():
    #                     if Arg == Operand:
    #                         Op.setOperand(OperandIndex, Arg)
    #                         break

    return CompiledFunction


def CompileStatement(Stmt, Context: ARMRoseContext):
    StmtTy = type(Stmt)
    if Stmt == None:
        return None
    return CompileAbstractions[StmtTy](Stmt, Context)


def Useless(*args, **kwargs):
    pass


def CompileVarDeclInit(Stmt: VarDeclInit, Context: ARMRoseContext):
    assert len(Stmt.vars) == 1
    return CompileVarsDecl(Stmt.vars[0], Context)


def CompileVarsDecl(Stmt: VarsDecl, Context: ARMRoseContext):
    assert False


def CompileVar(Stmt: Var, Context: ARMRoseContext):
    assert False


def CompileArrayIndex(Stmt: ArrayIndex, Context: ARMRoseContext):
    assert False


def CompileArraySlice(Stmt: ArraySlice, Context: ARMRoseContext):
    assert False


def CompileFor(Stmt: For, Context: ARMRoseContext):
    assert False


def CompileNumber(Stmt: Number, Context: ARMRoseContext):
    assert False


def CompileBinaryExpr(Stmt: BinaryExpr, Context: ARMRoseContext):
    assert False


def CompileUpdate(Stmt: Update, Context: ARMRoseContext):
    assert False


def CompileCall(Stmt: Call, Context: ARMRoseContext):
    assert False


CompileAbstractions = {
    VarDeclInit: CompileVarDeclInit,
    VarsDecl: CompileVarsDecl,
    Var: CompileVar,
    ArrayIndex: CompileArrayIndex,
    ArraySlice: CompileArraySlice,
    For: CompileFor,
    Number: CompileNumber,
    BinaryExpr: CompileBinaryExpr,
    Update: CompileUpdate,
    Call: CompileCall,
}
