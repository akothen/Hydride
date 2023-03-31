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
        self.constexpr = {}
        self.preparation = {}
        self.NumberType = RoseIntegerType.create(32)
        self.varwidth = {}
        super().__init__()

    def setConstexpr(self, constexpr):
        self.constexpr = constexpr

    def getConstexprFor(self, qid: str) -> (int):
        if qid in self.constexpr:
            return self.constexpr[qid]
        return None

    def setPreparation(self, preparation):
        self.preparation = preparation

    def getArgumentForRegister(self, reg: str):
        return self.preparation[reg]

    def setWidthForVar(self, qid: str, width: int):
        assert qid not in self.varwidth, "Giving width for a variable twice"
        self.varwidth[qid] = width

    def getWidthForVar(self, qid: str):
        if qid not in self.varwidth:
            return None
        return self.varwidth[qid]

    def createContext(self, ID: str, ChildContext):
        assert isinstance(ChildContext, ARMRoseContext)
        assert self.isCompiledAbstraction(ID)
        Abstraction = self.getCompiledAbstractionForID(ID)
        if isinstance(Abstraction, RoseForLoop) \
                or isinstance(Abstraction, RoseCond):
            # Copy all the compiled abstractions from this context to the child
            ChildContext.setParentContext(self)
            ChildContext.copyAbstractionsFromParent()
            ChildContext.setConstexpr(self.constexpr)
            ChildContext.setPreparation(self.preparation)
            super().createContext(ID, ChildContext)
        else:
            assert False

    def destroyContext(self, ContextName: str):
        ChildContext = self.getChildContext(ContextName)
        if isinstance(ChildContext.getRootAbstraction(), RoseForLoop) \
                or isinstance(ChildContext.getRootAbstraction(), RoseCond):
            ChildContext.replaceParentAbstractionsWithChild()
            # There are times when temporary variables are written to (using bvinsert)
            # so we will need to get those variables.
            BlockList = list()
            if ChildContext.getRootAbstraction().getKeys() == None:
                BlockList = ChildContext.getRootAbstraction().getRegionsOfType(RoseBlock)
            else:
                for Key in ChildContext.getRootAbstraction().getKeys():
                    BlockList.extend(ChildContext.getRootAbstraction(
                    ).getRegionsOfType(RoseBlock, Key=Key))
            _, ParentFunction = self.getFirsRootAbstractionsOfType(
                RoseFunction)
            for Block in BlockList:
                for Op in Block:
                    if isinstance(Op, RoseBVInsertSliceOp):
                        if Op.getInputBitVector() != ParentFunction.getReturnValue():
                            # Add the new variable
                            VariableName = Op.getInputBitVector().getName()
                            self.addVariable(
                                VariableName, ChildContext.getVariableID(VariableName))
                            # Add signedness information
                            # assert ChildContext.isValueSignKnown(
                            #     Op.getInputBitVector())
                            Signedness = ChildContext.isValueSigned(
                                Op.getInputBitVector())
                            self.addSignednessInfoForValue(
                                Op.getInputBitVector(), Signedness)
                            # Add this variable as an abstraction
                            self.addCompiledAbstraction(ChildContext.getVariableID(VariableName),
                                                        Op.getInputBitVector())
            super().destroyContext(ContextName)
        else:
            assert False


def CompileSemantics(Sema, RootContext: ARMRoseContext):
    RootContext.setConstexpr(Sema.resolving)
    RootContext.setPreparation(Sema.preparation)
    OutParams = []
    ParamValues = []
    ParamsIDs = []
    for Index, Param in enumerate(Sema.params):
        ParamType = ARMTypes[Param.type]
        # Create a new rosette value
        ParamVal = RoseArgument.create(Param.name, ParamType, RoseUndefValue())
        RootContext.addSignednessInfoForValue(ParamVal, Param.is_signed)
        ParamsIDs.append(f"arg{Index}")
        ParamValues.append(ParamVal)

    if Sema.rettype != 'void':
        RetType = ARMTypes[Sema.rettype]
        RetValue = RoseValue.create('result', RetType)
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
    print("===Compiling===")
    CompiledRetVal = RoseUndefValue()
    for Index, Stmt in enumerate(Sema.spec):
        CompileStatement(Stmt, RootContext)

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


def CompileRValueExpr(Stmt, Context: ARMRoseContext):
    StmtTy = type(Stmt)
    if Stmt == None:
        return None
    return CompileAbstractionsRV[StmtTy](Stmt, Context)


def CompileLValueExpr(Stmt, Context: ARMRoseContext):
    StmtTy = type(Stmt)
    if Stmt == None:
        return None
    return CompileAbstractionsLV[StmtTy](Stmt, Context)


def Useless(*args, **kwargs):
    pass


def CompileVarDeclInit(Stmt: VarDeclInit, Context: ARMRoseContext):
    '''
    bits(datasize) operand1 = V[n];
    -----------------------   ----
              decl            expr
    '''
    assert len(Stmt.decl.ids) == 1
    return CompileUpdate(Update(Stmt.decl.ids[0], Stmt.expr), Context)


def CompileVarsDecl(Stmt: VarsDecl, Context: ARMRoseContext):
    '''
    bits(datasize) operand1
         --------  ========
          width      ids
    '''
    # CompileStatement(Stmt.decl, Context)
    # CompileStatement(Stmt.width, Context)
    # return CompileVarsDecl(Stmt.decl, Context)
    # Context.
    datasizeVal = CompileRValueExpr(Stmt.width, Context)
    assert isinstance(datasizeVal, RoseConstant)
    datasize = datasizeVal.getValue()
    for ids in Stmt.ids:
        Context.setWidthForVar(ids.name, datasize)
        CompileVarRv(ids, Context)


def CompileVarRv(Variable: Var, Context: ARMRoseContext):
    if (constval := Context.getConstexprFor(Variable.name)) is not None:
        return RoseConstant(constval, Context.NumberType)
    # Check if the variable is already defined and cached. If yes, just return that.
    if Context.isVariableDefined(Variable.name):
        ID = Context.getVariableID(Variable.name)
        return Context.getCompiledAbstractionForID(ID)

    # Create a new rose value. We do not know the bitwidth, so use the maximum bitwidth
    if (width := Context.getWidthForVar(Variable.name)) is not None:
        Var = RoseValue.create(Variable.name,
                               RoseBitVectorType.create(width))
    else:
        Var = RoseValue.create(Variable.name,
                               Context.NumberType)

    # Add the variable info to the context
    Context.addVariable(Variable.name, Variable.id)
    Context.addCompiledAbstraction(Variable.id, Var)

    return Var


def ElemToArraySlice(Stmt: ArrayIndex):
    assert Stmt.obj.name == 'Elem'
    args = Stmt.idxs
    assert len(args) == 3
    # [e*esize,(e+1)*esize-1]
    lo = BinaryExpr('*', args[1], args[2], Stmt.id+f".1")
    hi = BinaryExpr('-', BinaryExpr(
        '*', BinaryExpr('+', args[1], Number(1), Stmt.id+f".1"), args[2], Stmt.id+f".1"), Number(1), Stmt.id+f".1")
    Node = ArraySlice(args[0], [lo, hi], Stmt.id)
    Node.wid = args[2]
    return Node


def VToVar(Stmt: ArrayIndex, Context: ARMRoseContext):
    assert Stmt.obj.name == 'V'
    args = Stmt.idxs
    assert len(args) == 1
    assert type(args[0]) == Var
    reg = args[0].name
    # print(reg, Context.preparation)
    assert reg in Context.preparation
    return Var(Context.getArgumentForRegister(reg), Stmt.id)


def CompileArrayIndexRv(Stmt: ArrayIndex, Context: ARMRoseContext):
    '''
    V    [         n        ]
    Elem [operand1, e, esize]
    ---- ====================
    obj          idxs
    '''
    if type(Stmt.obj) == Var:
        if Stmt.obj.name == 'V':
            return CompileVarRv(VToVar(Stmt, Context), Context)
        elif Stmt.obj.name == 'Elem':
            return CompileArraySliceRv(ElemToArraySlice(Stmt), Context)
        else:
            assert False
    else:
        assert False


def SimplifyArrayIndexLv(Stmt: ArrayIndex, Context: ARMRoseContext):
    '''
    V    [         n        ]
    Elem [operand1, e, esize]
    ---- ====================
    obj          idxs
    '''
    if type(Stmt.obj) == Var:
        if Stmt.obj.name == 'V':
            return VToVar(Stmt, Context)
        elif Stmt.obj.name == 'Elem':
            return ElemToArraySlice(Stmt)
        else:
            assert False
    else:
        assert False


def Slicing(Stmt: ArraySlice, Context: ARMRoseContext):
    assert len(Stmt.slices) == 2
    Low = CompileRValueExpr(Stmt.slices[0], Context)
    High = CompileRValueExpr(Stmt.slices[1], Context)
    # Context.setIndexNumberType(OriginalNumberTy)
    BitVector = CompileRValueExpr(Stmt.bv, Context)
    print(BitVector, BitVector.getType())
    assert isinstance(BitVector.getType(), RoseBitVectorType)

    # Do some sanity check if possible
    if isinstance(Low, RoseConstant):
        assert Low.getValue() >= 0 and Low.getValue() < BitVector.getType().getBitwidth()
    if isinstance(High, RoseConstant):
        assert High.getValue() >= 0 and High.getValue() < BitVector.getType().getBitwidth()
    if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
        assert High.getValue() >= Low.getValue()

    # Compute the bitwidth that is extracted in this slice
    BitwidthValue = CompileRValueExpr(Stmt.wid, Context)
    return BitVector, Low, High, BitwidthValue


def CompileArraySliceRv(Stmt: ArraySlice, Context: ARMRoseContext):
    (BitVector, Low, High, BitwidthValue) = Slicing(Stmt, Context)

    # Add an bitslice operation
    Operation = RoseBVExtractSliceOp.create(
        Context.genName(), BitVector, Low, High, BitwidthValue)

    # # Add signedness info on the op
    # if Context.isValueSignKnown(BitVector):
    #     Context.addSignednessInfoForValue(
    #         Operation, Context.isValueSigned(BitVector))

    # Add the op to the IR
    Context.addAbstractionToIR(Operation)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)

    return Operation


def CompileFor(Stmt: For, Context: ARMRoseContext):
    '''
    for     e    = 0  to elements-1
        -------- -----   ----------  =====
        iterator begin      end      stmts
    '''
    assert type(Stmt.iterator) == Var
    if Context.isCompiledAbstraction(Stmt.id):
        return

    # Compile the loop bounds and step
    Begin = CompileRValueExpr(Stmt.begin, Context)
    End = CompileRValueExpr(Stmt.end, Context)
    assert Begin.getType() == End.getType()
    One = RoseConstant.create(1, Begin.getType())
    MinusOne = RoseConstant.create(-1, Begin.getType())
    Step = One if Stmt.inc else MinusOne

    # Modify the end bound of the loop by adding 1 to it.
    # This is because of the way loop bounds are expressed in
    # in x86 pseudocode and rosette.
    assert isinstance(End, RoseConstant)
    End = RoseConstant.create(End.getValue() + 1, End.getType())

    # Generate the loop
    Loop = RoseForLoop.create(Context.genName(
        Stmt.iterator.name), Begin, End, Step)

    # Add loop as root abstraction
    ChildContext = ARMRoseContext()
    ChildContext.pushRootAbstraction(Loop)

    # Add the generated loop to the current context
    Context.addCompiledAbstraction(Stmt.id, Loop)

    # Add a new context for this loop
    Context.createContext(Stmt.id, ChildContext)

    # Add the iterator to the child context
    ChildContext.addVariable(Stmt.iterator.name, Stmt.iterator.id)
    ChildContext.addCompiledAbstraction(
        Stmt.iterator.id, Loop.getIterator())

    # Comoile all the statements in this loop
    for s in Stmt.stmts:
        CompileStatement(s, ChildContext)

    # Pop the root loop from the child context
    CompiledLoop = ChildContext.getRootAbstraction()

    # Add loop to the root abstraction
    Context.addAbstractionToIR(CompiledLoop)

    # Update the compiled loop to the current context
    Context.updateCompiledAbstraction(Stmt.id, CompiledLoop)

    # Remove the child context now
    Context.destroyContext(Stmt.id)


def CompileNumberRv(Stmt: Number, Context: ARMRoseContext):
    return RoseConstant(Stmt.val, Context.NumberType)


def CompileBinaryExprRv(Stmt: BinaryExpr, Context: ARMRoseContext):
    '''
    a  +  b
    - --- -
    a  op b
    '''
    Operand1 = CompileRValueExpr(Stmt.a, Context)
    Operand2 = CompileRValueExpr(Stmt.b, Context)
    Operation = BinaryOps[Stmt.op]()(
        Context.genName(),  Operand1, Operand2, Context)
    if type(Operation) == RoseConstant:
        return Operation
    Context.addAbstractionToIR(Operation)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)

    return Operation


def CompileUpdate(Stmt: Update, Context: ARMRoseContext):
    '''
    operand1 = a;
    element1 = Elem[operand1, e, esize];
    --------   ------------------------
       lhs               rhs
    '''
    # CompileStatement(Stmt.lhs, Context)
    # CompileStatement(Stmt.rhs, Context)
    RHSExprVal = CompileRValueExpr(Stmt.rhs, Context)
    if type(Stmt.lhs) == Var:
        print(Stmt.lhs, Stmt.rhs, RHSExprVal)
        Context.addVariable(Stmt.lhs.name, Stmt.rhs.id)
        Context.addCompiledAbstraction(Stmt.rhs.id, RHSExprVal)
    elif type(Stmt.lhs) == ArrayIndex:
        LVal = SimplifyArrayIndexLv(Stmt.lhs, Context)
        if type(LVal) == Var:  # V[d]
            # TODO merge with the above case
            Context.addVariable('return.Vd', Stmt.rhs.id)
            Context.addCompiledAbstraction(Stmt.rhs.id, RHSExprVal)

            return RHSExprVal
        elif type(LVal) == ArraySlice:  # Elem[a, e, esize]
            # Add an bitslice operation
            print(LVal)
            (BitVector, Low, High, BitwidthValue) = Slicing(LVal, Context)
            assert type(BitwidthValue) == RoseConstant
            Bitwidth = BitwidthValue.getValue()
            if RHSExprVal.getType().getBitwidth() < Bitwidth:
                assert False
                # # Let's size-extend
                # if Context.isValueSignKnown(RHSExprVal):
                #     if Context.isValueSigned(RHSExprVal) == True:
                #         RHSExprVal = RoseBVSignExtendOp.create(Context.genName(),
                #                                                RHSExprVal, Bitwidth)
                #     else:
                #         RHSExprVal = RoseBVZeroExtendOp.create(Context.genName(),
                #                                                RHSExprVal, Bitwidth)
                # else:
                #     RHSExprVal = RoseBVSignExtendOp.create(Context.genName(),
                #                                            RHSExprVal, Bitwidth)
                # # Add this add op to the IR and the context
                # Context.addAbstractionToIR(RHSExprVal)
                # Context.addCompiledAbstraction(
                #     RHSExprVal.getName(), RHSExprVal)
            elif RHSExprVal.getType().getBitwidth() > Bitwidth:
                assert False
                # # Truncate the undesirable high bits
                # RHSExprVal = RoseBVTruncateHighOp.create(Context.genName(),
                #                                          RHSExprVal, Bitwidth)
                # # Add this add op to the IR and the context
                # Context.addAbstractionToIR(RHSExprVal)
                # Context.addCompiledAbstraction(
                #     RHSExprVal.getName(), RHSExprVal)
            # # Add signedness info
            # if not Context.isValueSignKnown(BitVector):
            #     if Context.isValueSignKnown(RHSExprVal):
            #         Context.addSignednessInfoForValue(
            #             BitVector, Context.isValueSigned(RHSExprVal))
            LHSOp = RoseBVInsertSliceOp.create(
                RHSExprVal, BitVector, Low, High, BitwidthValue)
        else:
            assert False
        # Add signedness info
        # if Context.isValueSignKnown(BitVector) == False \
        #         and Context.isValueSignKnown(RHSExprVal) == True:
        #     Context.addSignednessInfoForValue(
        #         BitVector, Context.isValueSigned(RHSExprVal))

        # Add the op to the IR
        Context.addAbstractionToIR(LHSOp)

        # Add the operation to the context
        Context.addCompiledAbstraction(Stmt.lhs.id, LHSOp)

        return LHSOp
    else:
        print(Stmt)
        assert False
    return RHSExprVal


def CompileIfElse(Stmt: IfElse, Context: ARMRoseContext):
    '''
    if ({cond}) {then} else {otherwise}
    '''
    # CompileStatement(Stmt.lhs, Context)
    # CompileStatement(Stmt.rhs, Context)
    CondVal = CompileRValueExpr(Stmt.cond, Context)
    if type(CondVal) == RoseConstant:
        if CondVal.getValue():
            branch = Stmt.then
        else:
            branch = Stmt.otherwise
        for s in branch:
            CompileStatement(s, Context)
    else:
        assert False


def CompileBuiltIn(CallStmt, Context: ARMRoseContext):
    # If the call is compiled, no need to recompile
    if Context.isCompiledAbstraction(CallStmt.id):
        return Context.getCompiledAbstractionForID(CallStmt.id)

    # Function name has to be one of the bultins
    assert CallStmt.funcname in Builtins

    # # Sometimes the whole builtin has to be pre-compiled at once
    # PreCompiledOp = PreCompileBuiltin(CallStmt, Context)
    # if PreCompiledOp != RoseUndefValue():
    #     return PreCompiledOp

    # Compile function call arguments first
    ArgValuesList = list()
    for Arg in CallStmt.args:
        CompiledArg = CompileAbstractionsRV(Arg, Context)
        # Argument type cannot be undefined or void
        assert not isinstance(CompiledArg.getType(), RoseVoidType) \
            and not isinstance(CompiledArg.getType(), RoseUndefinedType)
        ArgValuesList.append(CompiledArg)

    # # Now we have to deal with one special case
    # # where we hvae already performed the buitin operation.
    # if BuiltinOpPerformed(CallStmt, ArgValuesList, Context) == True:
    #     # Nothing to do. Just map this operation id to its operand's operation.
    #     # There is nothing new to add to the IR.
    #     [Operation] = ArgValuesList
    #     Context.addCompiledAbstraction(CallStmt.id, Operation)
    #     return Operation

    # Int function does nothing. So just return the operand.
    if CallStmt.funcname == "Int":
        [Operation] = ArgValuesList
        return Operation

    # Check if this is a call to a builtin function
    Operation = Builtins[CallStmt.funcname](
        Context.genName(), ArgValuesList, Context)

    # Add the operation to the IR
    Context.addAbstractionToIR(Operation)
    # Add the operation to the context
    Context.addCompiledAbstraction(CallStmt.id, Operation)
    return Operation


def CompileCallRv(Stmt: Call, Context: ARMRoseContext):
    '''
      FPMul (element1, element2, FPCR[])
      -----  ==========================
    funcname           args
    '''
    # CompileStatement(Stmt.funcname, Context)
    # for s in Stmt.args:
    #     CompileStatement(s, Context)
    if Stmt.funcname in Builtins:
        return CompileBuiltIn(Stmt, Context)
    assert False


CompileAbstractions = {
    VarDeclInit: CompileVarDeclInit,
    VarsDecl: CompileVarsDecl,
    # ArrayIndex: CompileArrayIndex,
    # ArraySlice: CompileArraySlice,
    For: CompileFor,
    Update: CompileUpdate,
    IfElse: CompileIfElse,
}
CompileAbstractionsRV = {
    ArrayIndex: CompileArrayIndexRv,
    Var: CompileVarRv,
    Number: CompileNumberRv,
    BinaryExpr: CompileBinaryExprRv,
    Call: CompileCallRv,
}
CompileAbstractionsLV = {
}


def HandleToNot():
    def LamdaImplFunc(Name: str, Value: RoseValue, Context: ARMRoseContext):
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        Op = RoseBVNotOp.create(Name, Value)
        Context.addSignednessInfoForValue(
            Op, IsSigned=Context.isValueSigned(Value))
        return Op

    return LamdaImplFunc


def HandleToNeg():
    def LamdaImplFunc(Name: str, Value: RoseValue, Context: ARMRoseContext):
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        Op = RoseBVNegOp.create(Name, Value)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
}


def HandleToAdd():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        Operands = [Operand1, Operand2]
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVAddOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseAddOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToSub():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        Operands = [Operand1, Operand2]
        if isinstance(Operand1, RoseConstant) and isinstance(Operand2, RoseConstant):
            return RoseConstant(Operand1.getValue() - Operand2.getValue(), Context.NumberType)
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSubOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseSubOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToMul():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        Operands = [Operand1, Operand2]
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVMulOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseMulOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToDiv():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) == True \
                    or Context.isValueSigned(Operand2) == True:
                Op = RoseBVSdivOp.create(Name, Operand1, Operand2)
            else:
                Op = RoseBVUdivOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseDivOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToMod():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSmodOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=True)
            return Op
        return RoseModOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToOr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        Operands = [Operand1, Operand2]
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVOrOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseOrOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToXor():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Operands = [Operand1, Operand2]
            Op = RoseBVXorOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseXorOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToAnd():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        Operands = [Operand1, Operand2]
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVAndOp.create(Name, Operands)
            Context.addSignednessInfoForValue(Op,
                                              Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
            return Op
        return RoseAndOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVEQOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseEQOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToNotEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVNEQOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseNEQOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToLessThan():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) == True \
                    or Context.isValueSigned(Operand2) == True:
                Op = RoseBVSLTOp.create(Name, Operand1, Operand2)
            else:
                Op = RoseBVULTOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseLTOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToLessThanEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) == True \
                    or Context.isValueSigned(Operand2) == True:
                Op = RoseBVSLEOp.create(Name, Operand1, Operand2)
            else:
                Op = RoseBVULEOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseLEOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToGreaterThan():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) == True \
                    or Context.isValueSigned(Operand2) == True:
                Op = RoseBVSGTOp.create(Name, Operand1, Operand2)
            else:
                Op = RoseBVUGTOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseGTOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToGreaterThanEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) == True \
                    or Context.isValueSigned(Operand2) == True:
                Op = RoseBVSGEOp.create(Name, Operand1, Operand2)
            else:
                Op = RoseBVUGEOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseGEOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToAshr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        assert isinstance(Operand1.getType(), RoseBitVectorType) == True
        assert isinstance(Operand2.getType(), RoseBitVectorType) == True
        Op = RoseBVAshrOp.create(Name, Operand1, Operand2)
        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


def HandleToLshr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        assert isinstance(Operand1.getType(), RoseBitVectorType) == True
        assert isinstance(Operand2.getType(), RoseBitVectorType) == True
        Op = RoseBVLshrOp.create(Name, Operand1, Operand2)
        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


def HandleToShl():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: ARMRoseContext):
        assert isinstance(Operand1.getType(), RoseBitVectorType) == True
        assert isinstance(Operand2.getType(), RoseBitVectorType) == True
        Op = RoseBVShlOp.create(Name, Operand1, Operand2)
        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


BinaryOps = {
    '+': HandleToAdd,
    '-': HandleToSub,
    '*': HandleToMul,
    '/': HandleToDiv,
    '%': HandleToMod,
    '<': HandleToLessThan,
    '<=': HandleToLessThanEqual,
    '>': HandleToGreaterThan,
    '>=': HandleToGreaterThanEqual,
    '==': HandleToEqual,
    '!=': HandleToNotEqual,
    '>>': HandleToAshr,
    '<<': HandleToShl,
    '&': HandleToAnd,
    '|': HandleToOr,
    'AND': HandleToAnd,
    'OR': HandleToOr,
    'XOR': HandleToXor,
}


def HandleToSignExtend(Bitwidth: int):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        assert Value.getType().getBitwidth() < Bitwidth
        Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


def HandleToSpecialSignExtend(_):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        # Increase the bitwidth by 2x.
        Bitwidth = 2 * Value.getType().getBitwidth()
        Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


def HandleToZeroExtend(Bitwidth: int):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        assert Value.getType().getBitwidth() < Bitwidth
        Op = RoseBVZeroExtendOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=False)
        return Op

    return LamdaImplFunc


def HandleToMin(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            if Context.isValueSigned(Operands[0]) == True \
                    or Context.isValueSigned(Operands[1]) == True:
                Op = RoseBVSminOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=True)
            else:
                Op = RoseBVUminOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseMinOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToMax(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            if Context.isValueSigned(Operands[0]) == True \
                    or Context.isValueSigned(Operands[1]) == True:
                Op = RoseBVSmaxOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=True)
            else:
                Op = RoseBVUmaxOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseMaxOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToSSaturate(Bitwidth: int):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        assert Value.getType().getBitwidth() >= Bitwidth
        Op = RoseBVSSaturateOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


def HandleToUSaturate(Bitwidth: int):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        assert Value.getType().getBitwidth() >= Bitwidth
        Op = RoseBVUSaturateOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=False)
        return Op

    return LamdaImplFunc


def HandleToTruncate(Bitwidth: int):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        assert Value.getType().getBitwidth() > Bitwidth
        Op = RoseBVTruncateLowOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(
            Op, IsSigned=Context.isValueSigned(Value))
        return Op

    return LamdaImplFunc


def HandleToSpecialTruncate(_):
    def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
        [Value] = Args
        assert isinstance(Value.getType(), RoseBitVectorType) == True
        Bitwidth = int(Value.getType().getBitwidth() / 2)
        assert Value.getType().getBitwidth() > Bitwidth
        Op = RoseBVTruncateLowOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(
            Op, IsSigned=Context.isValueSigned(Value))
        return Op

    return LamdaImplFunc


def HandleToAbs(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
        assert len(Operands) == 1
        [Value] = Operands
        if isinstance(Value.getType(), RoseBitVectorType):
            Op = RoseBVAbsOp.create(Name, Value)
        else:
            Op = RoseAbsOp.create(Name, Value)
        Context.addSignednessInfoForValue(Op, IsSigned=False)
        return Op

    return LamdaImplFunc


def HandleToRemainder(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            Op = RoseBVSremOp.create(Name, Operands[0], Operands[1])
            Context.addSignednessInfoForValue(Op, IsSigned=True)
            return Op
        return RoseRemOp.create(Name, Operands)

    return LamdaImplFunc


# Builtin functions
Builtins = {
    'Saturate32': HandleToSSaturate(32),
    'Saturate16': HandleToSSaturate(16),
    'Saturate8': HandleToSSaturate(8),

    'SaturateU32': HandleToUSaturate(32),
    'SaturateU16': HandleToUSaturate(16),
    'SaturateU8': HandleToUSaturate(8),

    'ZeroExtend16': HandleToZeroExtend(16),
    'ZeroExtend32': HandleToZeroExtend(32),
    'ZeroExtend64': HandleToZeroExtend(64),

    'SignExtend16': HandleToSignExtend(16),
    'SignExtend32': HandleToSignExtend(32),
    'SignExtend64': HandleToSignExtend(64),
    'Signed': HandleToSpecialSignExtend(None),

    'Truncate8': HandleToTruncate(8),
    'Truncate16': HandleToTruncate(16),
    'Truncate32': HandleToTruncate(32),
    'Truncate64': HandleToTruncate(64),
    'TRUNCATE': HandleToSpecialTruncate(None),

    'MIN': HandleToMin(None),
    'MAX': HandleToMax(None),

    'ABS': HandleToAbs(None),

    'Int': None,

    'REMAINDER': None,
}


def HandleToFPMulX(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            Op = RoseBVSremOp.create(Name, Operands[0], Operands[1])
            Context.addSignednessInfoForValue(Op, IsSigned=True)
            return Op
        return RoseRemOp.create(Name, Operands)

    return LamdaImplFunc
