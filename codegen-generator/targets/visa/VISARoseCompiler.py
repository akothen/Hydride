from RoseTypes import *
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseMatrixOperations import *
from RoseContext import *

from VISAAST import *
from VISAMeta import *


class VISARoseContext(RoseContext):
    def __init__(self):
        self.constexpr = {}
        self.compileFlag = {}
        self.NumberType = RoseIntegerType.create(32)
        self.Number64Type = RoseIntegerType.create(64)
        self.varType = {}
        super().__init__()

    def addSignednessInfoForValue(self, Value: RoseValue, IsSigned: bool):
        # override the output
        assert not isinstance(Value, RoseUndefValue)
        self.CompiledValToSignedness[Value] = IsSigned

    def setConstexpr(self, constexpr):
        Hlog.debug("Setting constexpr", constexpr)
        self.constexpr = constexpr

    def getConstexprFor(self, qid: str) -> (int):
        if qid in self.constexpr:
            return self.constexpr[qid]
        assert False, qid

    def hasConstexprFor(self, qid: str) -> (bool):
        return qid in self.constexpr

    def setCompileFlag(self, compileFlag):
        self.compileFlag = compileFlag

    def setTypeForVar(self, qid: str, Type: int):
        assert qid not in self.varType, "Giving width for a variable twice"
        Hlog.debug("Setting varType", qid, Type)
        self.varType[qid] = Type

    def getTypeForVar(self, qid: str):
        if qid not in self.varType:
            assert False, (qid, self.varType[qid])
        return self.varType[qid]

    def createContext(self, ID: str, ChildContext):
        assert isinstance(ChildContext, VISARoseContext)
        assert self.isCompiledAbstraction(ID)
        Abstraction = self.getCompiledAbstractionForID(ID)
        if isinstance(Abstraction, RoseForLoop) \
                or isinstance(Abstraction, RoseCond):
            # Copy all the compiled abstractions from this context to the child
            ChildContext.setParentContext(self)
            ChildContext.copyAbstractionsFromParent()
            ChildContext.setConstexpr(self.constexpr)
            ChildContext.setCompileFlag(self.compileFlag)
            ChildContext.varType = self.varType
            super().createContext(ID, ChildContext)
        else:
            assert False

    def replaceParentAbstractionsWithChild(self):
        for Value, IsSigned in self.getCompiledValToSignednessMap().items():
            self.ParentContext.CompiledValToSignedness[Value] = IsSigned
        return super().replaceParentAbstractionsWithChild()

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
                            # FIXME: Are these even needed?
                            pass
                            # Add the new variable
                            # VariableName = Op.getInputBitVector().getName()
                            # self.addVariable(
                            #     VariableName, ChildContext.getVariableID(VariableName))
                            # # Add signedness information
                            # assert ChildContext.isValueSignKnown(
                            #     Op.getInputBitVector())
                            # Signedness = ChildContext.isValueSigned(
                            #     Op.getInputBitVector())
                            # self.addSignednessInfoForValue(
                            #     Op.getInputBitVector(), Signedness)
                            # # Add this variable as an abstraction
                            # self.addCompiledAbstraction(ChildContext.getVariableID(VariableName),
                            # Op.getInputBitVector())

            super().destroyContext(ContextName)
        else:
            assert False

    def registerVISAVecType(self, Name: str, Type: str):
        assert Type in SupportedTypes, f"Unsupported type: {Type}"
        if Type != "M":
            bits = DataTypeBits[Type]
            self.setTypeForVar(Name, bits*self.getConstexprFor('exec_size'))
            # We use a[0] to denote the element width of vector inside a
            self.setTypeForVar(Name+"[0]", bits)
            return RoseBitVectorType(bits*self.getConstexprFor('exec_size'))
        else:
            # FIXME: decide args here
            return RoseMatrixType.create(16, 64, 8)


def makeVISAType(Type: str):
    assert Type in SupportedTypes, f"Unsupported type: {Type}"
    return RoseBitVectorType(DataTypeBits[Type])


def CompileSemantics(Sema: VISASema, RootContext: VISARoseContext):
    Annotator().AddID(Sema.spec)
    RootContext.setConstexpr(Sema.resolving)
    RootContext.setCompileFlag(Sema.flags)
    OutParams = []
    ParamValues = []
    ParamsIDs = []
    for Index, Param in enumerate(Sema.params):
        ParamType = RootContext.registerVISAVecType(Param.name, Param.type)
        # Create a new rosette value
        ParamVal = RoseArgument.create(Param.name, ParamType, RoseUndefValue())
        RootContext.addSignednessInfoForValue(ParamVal, Param.is_signed)
        ParamsIDs.append(f"arg_{Index}")
        ParamValues.append(ParamVal)

    RetType = RootContext.registerVISAVecType('dst', Sema.rettype)

    # Define a Rose function
    RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetType)
    RetValue = RoseValue.create('dst', RetType)
    RootFunction.setRetValName(RetValue.getName())

    # Add return value to the root context
    ReturnID = "return." + RootFunction.getReturnValue().getName()
    RootContext.addVariable(RootFunction.getReturnValue().getName(), ReturnID)
    RootContext.addCompiledAbstraction(ReturnID, RootFunction.getReturnValue())
    RootContext.addSignednessInfoForValue(RetValue, "U" not in Sema.rettype)

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
    Hlog.debug("===Compiling===")
    # CompiledRetVal = RoseUndefValue()
    for Index, Stmt in enumerate(Sema.spec):
        CompileStatement(Stmt, RootContext)
    # Get the compiled function
    CompiledFunction = RootContext.getRootAbstraction()

    # See if the function returns anything, if not add a return op
    # if CompiledRetVal == RoseUndefValue():
    #     Op = RoseReturnOp.create(CompiledFunction.getReturnValue())
    #     # NO meed to add this operation to the context but add it to the function
    #     CompiledFunction.addAbstraction(Op)
    # yeah?

    Hlog.debug("\n\n\n\n\nFunction:")
    CompiledFunction.print()

    return CompiledFunction


def CompileStatement(Stmt, Context: VISARoseContext):
    StmtTy = type(Stmt)
    if Stmt == None:
        return None
    if StmtTy in CompileAbstractions:
        CompileAbstractions[StmtTy](Stmt, Context)
    elif StmtTy in CompileAbstractionsRV:
        CompileAbstractionsRV[StmtTy](Stmt, Context)
    else:
        assert False, StmtTy


def CompileRValueExpr(Stmt, Context: VISARoseContext):
    StmtTy = type(Stmt)
    if Stmt == None:
        return None
    return CompileAbstractionsRV[StmtTy](Stmt, Context)


# def CompileLValueExpr(Stmt, Context: VISARoseContext):
#     StmtTy = type(Stmt)
#     if Stmt == None:
#         return None
#     return CompileAbstractionsLV[StmtTy](Stmt, Context)


# def CompileVarDeclInit(Stmt: VarDeclInit, Context: VISARoseContext):
#     '''
#     bits(datasize) operand1 = V[n];
#     -------------- --------   ----
#        base_type     lhs      expr
#     '''

#     return CompileUpdateRv(Update(Stmt.lhs, Stmt.rhs), Context)


def CompileVarDeclare(Stmt: Var, Context: VISARoseContext, base_type: str):
    datasize = DataTypeBits[base_type]
    Context.setTypeForVar(Stmt.name, datasize)
    CompileVarRv(Stmt, Context)


def CompileVarsDecl(Stmt: VarsDecl, Context: VISARoseContext):
    '''
    D         operand1
    --------  =========
    width     init_list
    '''
    # CompileStatement(Stmt.decl, Context)
    # CompileStatement(Stmt.width, Context)
    # return CompileVarsDecl(Stmt.decl, Context)
    # Context.
    for decls in Stmt.init_list:
        if isinstance(decls, VarDeclInit):
            CompileVarDeclare(decls.lhs, Context, Stmt.basetype)
            tempAST = Update("=", decls.lhs, decls.rhs)
            tempAST.id = Stmt.id+".decl"
            CompileUpdateRv(tempAST, Context)
        elif isinstance(decls, VarDeclUndef):
            CompileVarDeclare(decls.lhs, Context, Stmt.basetype)
        else:
            assert False, f"Unknown type of declaration: {decls}"


def CompileVarRv(Variable: Var, Context: VISARoseContext):
    if Context.hasConstexprFor(Variable.name):
        constval = Context.getConstexprFor(Variable.name)
        if type(constval) == int:
            return RoseConstant(constval, Context.NumberType)

        raise NotImplementedError(
            f"Unsupported type of constant: {type(constval)}")
    # Check if the variable is already defined and cached. If yes, just return that.
    if Context.isVariableDefined(Variable.name):
        ID = Context.getVariableID(Variable.name)
        res = Context.getCompiledAbstractionForID(ID)
        return res

    if (Type := Context.getTypeForVar(Variable.name)) is not None:
        var = RoseValue.create(Variable.name,
                               RoseBitVectorType.create(Type))
    else:
        var = RoseValue.create(Variable.name,
                               Context.NumberType)

    # Add the variable info to the context
    Context.addVariable(Variable.name, Variable.id)
    Context.addCompiledAbstraction(Variable.id, var)

    return var


def CompileMemberRv(Stmt: Member, Context: VISARoseContext):
    '''
    a   .  b
    -----------
    obj    field
    '''
    # Compile the object
    Obj = CompileRValueExpr(Stmt.obj, Context)
    if Stmt.field == "DW":
        # Extract
        Context.setTypeForVar(Stmt.id+"[0]", 32)
        return Obj
    elif Stmt.field == "R":
        return Obj


def CompileMtxExtractCommon(Stmt, MI, Context: VISARoseContext):
    (Matrix, Index) = MI
    Operation = RoseMatrixExtractRowOp.create(
        Context.genName(), Matrix, Index)

    # # Add signedness info on the op
    Context.addElemTypeOfVariable(
        Operation.getName(), RoseBitVectorType.create(Operation.getOutputBitwidth()))
    Context.addSignednessInfoForValue(Operation, False)

    # Add the op to the IR
    Context.addAbstractionToIR(Operation)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)

    return Operation


def CompileExtractCommon(Stmt, BLHB, Context: VISARoseContext):
    (BitVector, Low, High, BitwidthValue) = BLHB

    Operation = RoseBVExtractSliceOp.create(
        Context.genName(), BitVector, Low, High, BitwidthValue)

    # # Add signedness info on the op
    if Context.isValueSignKnown(BitVector):
        Context.addSignednessInfoForValue(
            Operation, Context.isValueSigned(BitVector))

    # Add the op to the IR
    Context.addAbstractionToIR(Operation)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)

    return Operation


def CompileArraySlice(Stmt: ArraySlice, Context: VISARoseContext):
    '''
    ChEn  [i:j]
    ---- =====
    obj  lo  hi
    '''
    if type(Stmt.obj) == Var and Stmt.obj.name == 'ChEn':
        return RoseConstant(1, RoseBooleanType.create())

    BitVector = CompileRValueExpr(Stmt.obj, Context)
    Low = CompileRValueExpr(Stmt.lo, Context)
    High = CompileRValueExpr(Stmt.hi, Context)
    assert type(Stmt.lo) == Number and type(Stmt.hi) == Number
    BitwidthValue = RoseConstant.create(
        Stmt.hi.val-Stmt.lo.val + 1, Low.getType())

    return CompileExtractCommon(Stmt, (BitVector, Low, High, BitwidthValue), Context)


def CompileArrayIndexRv(Stmt: ArrayIndex, Context: VISARoseContext):
    # Case 1: a[i] where a is a vector like object
    #            treat as a[i*sizeof(a[0]):i*sizeof(a[0])+sizeof(a[0])-1]
    #         This case also work for a.DW[i], where sizeof a[0] is fixed to be 32 (DW)
    # Case 2: a.R[i] where a is a matrix like object
    #         This is going to be mtxextractrow a, int32 i
    # Currently we don't support nested member access like a.R[i].DW[j] for LValue
    '''
    ChEn  [i]
    ---- =====
    obj  index
    '''
    if type(Stmt.obj) == Var and Stmt.obj.name == 'ChEn':
        return RoseConstant(1, RoseBooleanType.create())
    if type(Stmt.obj) == Member and Stmt.obj.field == "R":
        return CompileMtxExtractCommon(Stmt,
                                       (CompileRValueExpr(Stmt.obj.obj, Context),
                                        CompileRValueExpr(Stmt.index, Context)), Context)
    # (BitVector, Low, High, BitwidthValue) = MakeSlice(Stmt, Context)

    return CompileExtractCommon(Stmt, MakeSlice(Stmt, Context), Context)


# def SimplifyArrayIndexLv(Stmt: ArrayIndex, Context: VISARoseContext):
#     '''
#     V    [         n        ]
#     Elem [operand1, e, esize]
#     ---- ====================
#     obj          idxs
#     '''
#     if type(Stmt.obj) == Var:
#         if Stmt.obj.name in ['V', 'Vpart', 'X']:
#             return VorVpartToLv(Stmt, Context)
#         elif Stmt.obj.name == 'Elem':
#             return ElemToSlicedArray(Stmt)
#         else:
#             return Stmt
#     else:
#         assert False, f"Unknown variable {Stmt.obj}"


# # Always assume that the bitwidth returned by this function is a constant
# def ComputeBitSliceWidth(Low: RoseValue, High: RoseValue, TotalBitwidth: int = None):
#     # Strip any casts and size extensions away
#     if isinstance(Low, RoseCastOp) \
#             or isinstance(Low, RoseBVSignExtendOp) \
#             or isinstance(Low, RoseBVZeroExtendOp):
#         Low = Low.getOperand(0)
#     if isinstance(High, RoseCastOp) \
#             or isinstance(High, RoseBVSignExtendOp) \
#             or isinstance(High, RoseBVZeroExtendOp):
#         High = High.getOperand(0)

#     # Handle easiest case first
#     if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
#         if TotalBitwidth != None:
#             assert Low.getValue() >= 0 and Low.getValue() < TotalBitwidth
#             assert High.getValue() >= 0 and High.getValue() < TotalBitwidth
#         assert High.getValue() >= Low.getValue()
#         return (High.getValue() - Low.getValue() + 1)

#     # Either both high and low are constants or both are variables/operations.
#     # Other cases are not taken into account.
#     assert not isinstance(Low, RoseConstant)
#     assert not isinstance(High, RoseConstant)

#     # Just handle one _very_ common case where high = i + some_constant
#     # Strip away any cast first
#     assert isinstance(High, RoseAddOp)
#     if isinstance(High.getOperand(0), RoseConstant):
#         HighIndexValue = High.getOperand(1)
#         ConstantHighIndex = High.getOperand(0)
#     else:
#         assert isinstance(High.getOperand(1), RoseConstant)
#         HighIndexValue = High.getOperand(0)
#         ConstantHighIndex = High.getOperand(1)
#     # Strip any casts away
#     if isinstance(HighIndexValue, RoseCastOp) \
#             or isinstance(HighIndexValue, RoseBVSignExtendOp) \
#             or isinstance(HighIndexValue, RoseBVZeroExtendOp):
#         HighIndexValue = HighIndexValue.getOperand(0)
#     # High index is expressed in terms of low index
#     # TODO: Make this more general.

#     # Just handle one _very_ common case where low = i
#     assert isinstance(HighIndexValue, RoseOperation)
#     assert isinstance(Low, RoseOperation)
#     if Low.isSameAs(HighIndexValue):
#         return (ConstantHighIndex.getValue() + 1)

#     # Now handle a rare case where low = i + some_constant
#     assert isinstance(Low, RoseAddOp)
#     if isinstance(Low.getOperand(0), RoseConstant):
#         LowIndexValue = Low.getOperand(1)
#         ConstantLowIndex = Low.getOperand(0)
#     else:
#         assert isinstance(Low.getOperand(1), RoseConstant)
#         LowIndexValue = Low.getOperand(0)
#         ConstantLowIndex = Low.getOperand(1)
#     # Strip any casts away
#     if isinstance(LowIndexValue, RoseCastOp) \
#             or isinstance(LowIndexValue, RoseBVSignExtendOp) \
#             or isinstance(LowIndexValue, RoseBVZeroExtendOp):
#         LowIndexValue = LowIndexValue.getOperand(0)
#     assert LowIndexValue.isSameAs(HighIndexValue)
#     assert ConstantHighIndex.getValue() >= ConstantLowIndex.getValue()
#     return (ConstantHighIndex.getValue() - ConstantLowIndex.getValue() + 1)

def MakeSliceAST(Stmt: ArrayIndex, Context: VISARoseContext):
    # a[1]->a[1*sizeof(a[0]):1*sizeof(a[0])+sizeof(a[0])-1]
    v = Stmt.obj
    idx = Stmt.index
    Hlog.debug(v)
    if isinstance(v, Var):
        wid = Context.getTypeForVar(v+"[0]".name)
    else:
        pass
    # else:
    #     wid =
    Nwid = Number(wid)
    lo = BinaryExpr('*', idx, Nwid)
    hi = BinaryExpr('+', BinaryExpr('*', idx, Nwid), BinaryExpr(
        '-', Nwid, Number(1)))
    Annotator(Stmt.id+".lo").AddID(lo)
    Annotator(Stmt.id+".hi").AddID(hi)
    return v, lo, hi, wid


def MakeSlice_old(Stmt: ArrayIndex, Context: VISARoseContext):
    v, lo, hi, wid = MakeSliceAST(Stmt, Context)
    BitVector = CompileRValueExpr(v, Context)
    Low = CompileRValueExpr(lo, Context)
    High = CompileRValueExpr(hi, Context)
    BitwidthValue = RoseConstant.create(wid, Low.getType())

    return BitVector, Low, High, BitwidthValue


def MakeSlice(Stmt: ArrayIndex, Context: VISARoseContext):

    v = Stmt.obj
    if isinstance(v, Var):
        BitVector = CompileRValueExpr(v, Context)
        wid = Context.getTypeForVar(v+"[0]".name)
    elif isinstance(v, Member):
        BitVector = CompileRValueExpr(v.obj, Context)
        if v.field == "DW":
            wid = 32
        else:
            assert False,  breakpoint()
    idx = Stmt.index
    Hlog.debug(v)
    Hlog.debug(BitVector)

    Nwid = Number(wid)
    lo = BinaryExpr('*', idx, Nwid)
    hi = BinaryExpr('+', BinaryExpr('*', idx, Nwid), BinaryExpr(
        '-', Nwid, Number(1)))
    Annotator(Stmt.id+".lo").AddID(lo)
    Annotator(Stmt.id+".hi").AddID(hi)
    Low = CompileRValueExpr(lo, Context)
    High = CompileRValueExpr(hi, Context)
    BitwidthValue = RoseConstant.create(wid, Low.getType())

    return BitVector, Low, High, BitwidthValue


# def ComputeArrayIndexOrSliceRv(Stmt: ArrayIndex, Context: VISARoseContext):
#     (BitVector, Low, High, BitwidthValue) = Slicing(Stmt, Context)

#     # Add an bitslice operation
#     Hlog.debug(Low, High, BitwidthValue)
#     # if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
#     #   if Low.getValue() == 0 and High.getValue() == BitVector.getType().getBitwidth()-1:
#     #     if isinstance(BitVector, RoseBVExtractSliceOp):
#     #       return BitVector

#     Operation = RoseBVExtractSliceOp.create(
#         Context.genName(), BitVector, Low, High, BitwidthValue)

#     # # Add signedness info on the op
#     if Context.isValueSignKnown(BitVector):
#         Context.addSignednessInfoForValue(
#             Operation, Context.isValueSigned(BitVector))

#     # Add the op to the IR
#     Context.addAbstractionToIR(Operation)

#     # Add the operation to the context
#     Context.addCompiledAbstraction(Stmt.id, Operation)

#     return Operation


# def CompileWhile(Stmt: While, Context: VISARoseContext):
#     raise NotImplementedError("While loop is not supported yet")


def CompileFor(Stmt: For, Context: VISARoseContext):
    '''
   for (i = 0; i < exec_size; ++i)
        -----  -------------  ---  ----
        init     cond         step  body
    '''
    Hlog.debug(Stmt)
    assert type(Stmt.init) == Update, Stmt.init
    assert type(Stmt.init.a) == Var, Stmt.init
    assert type(Stmt.init.b) == Number, Stmt.init
    assert Stmt.init.op == "=", Stmt.init
    ForIter = Stmt.init.a
    ForBegin = Stmt.init.b
    assert type(Stmt.cond) == BinaryExpr, Stmt.cond
    assert Stmt.cond.op == "<", Stmt.cond
    assert type(Stmt.cond.a) == Var, Stmt.cond
    assert Stmt.cond.a.name == Stmt.init.a.name, Stmt.cond
    assert type(Stmt.cond.b) in [Var, Number], Stmt.cond
    ForEnd = Stmt.cond.b
    assert type(Stmt.step) == UnaryExpr, Stmt.step
    assert Stmt.step.op == "++", Stmt.step
    assert type(Stmt.step.a) == Var, Stmt.step
    assert Stmt.step.a.name == Stmt.init.a.name, Stmt.step
    if Context.isCompiledAbstraction(Stmt.id):
        return

    # Compile the loop bounds and step
    Begin = CompileRValueExpr(ForBegin, Context)
    End = CompileRValueExpr(ForEnd, Context)
    assert Begin.getType() == End.getType()
    Step = RoseConstant.create(1, Begin.getType())
    # One = RoseConstant.create(1, Begin.getType())
    # MinusOne = RoseConstant.create(-1, Begin.getType())
    # Step = One if Stmt.inc else MinusOne

    # Modify the end bound of the loop by adding 1 to it.
    # This is because of the way loop bounds are expressed in
    # in x86 pseudocode and rosette.
    assert isinstance(End, RoseConstant)
    End = RoseConstant.create(End.getValue(), End.getType())

    # Generate the loop
    Loop = RoseForLoop.create(Context.genName(
        ForIter.name), Begin, End, Step)

    # Add loop as root abstraction
    ChildContext = VISARoseContext()
    ChildContext.pushRootAbstraction(Loop)

    # Add the generated loop to the current context
    Context.addCompiledAbstraction(Stmt.id, Loop)

    # Add a new context for this loop
    Context.createContext(Stmt.id, ChildContext)

    # Add the iterator to the child context
    ChildContext.addVariable(ForIter.name, ForIter.id)
    ChildContext.addCompiledAbstraction(
        ForIter.id, Loop.getIterator())

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


def CompileNumberRv(Stmt: Number, Context: VISARoseContext):
    # if Context.isCompileIndexFlagSet():
    #   ConstantVal = RoseConstant.create(Num.val, RoseIntegerType.create(32))
    #   #Context.getIndexNumberType())
    # else:
    ConstantVal = RoseConstant.create(Stmt.val, Context.NumberType)
    Context.addSignednessInfoForValue(
        ConstantVal, IsSigned=(Stmt.val < 0))
    return ConstantVal


def CompileUnaryExpr(UnaryExpr, Context: VISARoseContext):
    # If this expression is compiled, no need to recompile
    if Context.isCompiledAbstraction(UnaryExpr.id):
        return Context.getCompiledAbstractionForID(UnaryExpr.id)

    # Compile the operation
    Value = CompileRValueExpr(UnaryExpr.a, Context)
    Operation = UnaryOps[UnaryExpr.op]()(Context.genName(), Value, Context)
    if type(Operation) == RoseConstant:
        return Operation
    # Add the operation to the IR
    Context.addAbstractionToIR(Operation)
    # Add the operation to the context
    Context.addCompiledAbstraction(UnaryExpr.id, Operation)
    return Operation


def CompileBinaryExprRv(Stmt: BinaryExpr, Context: VISARoseContext):
    '''
    a  +  b
    - --- -
    a  op b
    '''
    op = Stmt.op
    Hlog.debug(Stmt)
    if op == "is":
        if type(Stmt.b) == Var and Stmt.b.name == 'predicate':
            return RoseConstant.create(0, RoseBooleanType.create())
        assert False, f"Unknown predicate {Stmt.b}"
    Operand1 = CompileRValueExpr(Stmt.a, Context)
    Operand2 = CompileRValueExpr(Stmt.b, Context)
    # if isinstance(Stmt, SatBinaryExpr):
    #     op += "Q"
    Operation = None
    if Stmt.op in BinOpsTryFolding:
        Operation = ComputeConstant(Stmt.op, Operand1, Operand2, Context)
    if not Operation:
        Operation = BinaryOps[Stmt.op]()(
            Context.genName(),  Operand1, Operand2, Context)
    if type(Operation) == RoseConstant or Operation == Operand1 or Operation == Operand2:
        return Operation
    Context.addAbstractionToIR(Operation)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)
    if Context.compileFlag.get('sat', False) and isinstance(Operation, RoseSaturableBitVectorOp):

        Operation = HandleToSatQ(None)(Context.genName(), [
            Operation, RoseConstant.create(Operation.getOutputBitwidth(), Context.NumberType), RoseConstant.create(False, RoseBooleanType.create())], Context)
        Context.addAbstractionToIR(Operation)
        Context.addCompiledAbstraction(Stmt.id+".sat", Operation)

    return Operation


def CompileList(Stmts: List, Context: VISARoseContext):
    for i in Stmts:
        CompileStatement(i, Context)


def CompileUpdateRv(Stmt: Update, Context: VISARoseContext):
    '''
    operand1 = a;
    element1 = Elem[operand1, e, esize];
    --------   ------------------------
       lhs               rhs
    '''
    # CompileStatement(Stmt.lhs, Context)
    # CompileStatement(Stmt.rhs, Context)
    Hlog.debug("Update --- %s %s", Stmt.a, Stmt.b)
    assert Stmt.op == "=", Stmt
    if type(Stmt.a) == Var:
        # Hlog.debug(Stmt.lhs, Stmt.rhs, RHSExprVal)
        if hasattr(Stmt.b, "id"):
            ID = Stmt.b.id
        else:
            ID = Context.genName()
        # SET width
        # Context.setLHSType(Context.getTypeForVar(Stmt.lhs.name))
        RHSExprVal = CompileRValueExpr(Stmt.b, Context)
        # Context.removeLHSType()

        Context.addVariable(Stmt.a.name, ID)
        Context.addCompiledAbstraction(ID, RHSExprVal)
        return RHSExprVal
    elif type(Stmt.a) == ArrayIndex:
        LVal = Stmt.a
        if type(LVal.obj) == Var or (type(LVal.obj) == Member and LVal.obj.field == "DW"):
            # dst[1] -> dst[1*sizeof(dst[0]):2*sizeof(dst[0])-1]
            # Add an bitslice operation
            (BitVector, Low, High, BitwidthValue) = MakeSlice(LVal, Context)
            assert type(
                BitwidthValue) == RoseConstant, f"Bitwidth must be constant, but got {type(BitwidthValue)}"
            assert Stmt.op == '='
            Bitwidth = BitwidthValue.getValue()

            # Context.setLHSType(('bits', Bitwidth))
            RHSExprVal = CompileRValueExpr(Stmt.b, Context)
            # Context.removeLHSType()
            # assert RHSExprVal.getType().getBitwidth(
            # ) == Bitwidth, f"Bitwidth must be {Bitwidth}, but got {RHSExprVal.getType().getBitwidth()}"
            if Bitwidth != RHSExprVal.getType().getBitwidth():
                Hlog.warning("Implicit cast %s -> %s", RHSExprVal, Bitwidth)
                if isinstance(RHSExprVal, (RoseBVSSaturateOp, RoseBVUSaturateOp)):
                    # Ignore the saturate op, create new one.
                    # Original one will be removed in DCE
                    RHSExprVal = type(RHSExprVal).create(Context.genName(), RHSExprVal.getOperand(
                        0), Bitwidth)
                    Context.addAbstractionToIR(RHSExprVal)
                    Context.addCompiledAbstraction(
                        Stmt.b.id+".narrow", RHSExprVal)
                else:
                    RHSExprVal = RoseBVExtractSliceOp.create(
                        Context.genName(), RHSExprVal, RoseConstant.create(0, Context.NumberType), RoseConstant.create(Bitwidth-1, Context.NumberType), RoseConstant.create(Bitwidth, Context.NumberType))
                    Context.addAbstractionToIR(RHSExprVal)
                    Context.addCompiledAbstraction(
                        Stmt.b.id+".cast", RHSExprVal)

            if not Context.isValueSignKnown(BitVector):
                if Context.isValueSignKnown(RHSExprVal):
                    Context.addSignednessInfoForValue(
                        BitVector, Context.isValueSigned(RHSExprVal))
            LHSOp = RoseBVInsertSliceOp.create(
                RHSExprVal, BitVector, Low, High, BitwidthValue)
        elif type(LVal.obj) == Member:
            assert LVal.obj.field == "R"
            # dst.R[1] -> mtxinsertrow dst, 1, rhs
            # Compile the object
            BitVector = CompileRValueExpr(LVal.obj.obj, Context)
            Index = CompileRValueExpr(LVal.index, Context)
            RHSExprVal = CompileRValueExpr(Stmt.b, Context)
            # Add an mtxinsertrow operation
            LHSOp = RoseMatrixInsertRowOp.create(
                RHSExprVal, BitVector, Index)
        else:
            breakpoint()
            raise NotImplementedError(
                f"Got Update for {type(LVal)}, LVal = {LVal}")

        if Context.isValueSignKnown(BitVector) == False \
                and Context.isValueSignKnown(RHSExprVal):
            Context.addSignednessInfoForValue(
                BitVector, Context.isValueSigned(RHSExprVal))

        # Add the op to the IR
        Context.addAbstractionToIR(LHSOp)

        # Add the operation to the context
        Context.addCompiledAbstraction(Stmt.b.id, LHSOp)

        return LHSOp
    else:
        Hlog.debug(Stmt)
        assert False


def CompileIf(IfStmt, Context: VISARoseContext):
    # Generate a cond region
    Cond = CompileRValueExpr(IfStmt.cond, Context)
    if type(Cond) == RoseConstant:
        Hlog.debug("Known condition")
        if Cond.getValue():
            for Stmt in IfStmt.then:
                CompileStatement(Stmt, Context)
        return

    CondRegion = RoseCond.create([Cond], 1)

    # Add cond region as root abstraction
    ChildContext = VISARoseContext()
    ChildContext.pushRootAbstraction(CondRegion)

    # Add the then key for this cond region
    ThenRegionKey = CondRegion.getKeyForThenRegion()
    ChildContext.addKeyForCompiledAbstraction(ThenRegionKey, CondRegion)

    # Add the generated cond region to the current context
    Context.addCompiledAbstraction(IfStmt.id, CondRegion)

    # Add a new context for this cond region
    Context.createContext(IfStmt.id, ChildContext)

    # Compile all the statements in then cond region
    for Stmt in IfStmt.then:
        CompileStatement(Stmt, ChildContext)

    # Pop the root cond region from the child context
    CompiledCondRegion = ChildContext.getRootAbstraction()

    # Add cond region to the root abstraction
    Context.addAbstractionToIR(CompiledCondRegion)

    # Update the compiled cond region to the current context
    Context.updateCompiledAbstraction(IfStmt.id, CompiledCondRegion)

    # Remove the child context now
    Context.destroyContext(IfStmt.id)


def CompileIfElseStmt(Stmt: IfElseStmt, Context: VISARoseContext):
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
        assert False, f"Got {CondVal} for cond value"


# def CompileMatch(MatchExpr: Match, Context: VISARoseContext):
#     # assert type(MatchExpr.val) == ArrayIndex
#     # Compile the bit slice
#     CompiledValue = CompileRValueExpr(MatchExpr.val, Context)
#     if type(CompiledValue) == RoseConstant:
#         for Case in MatchExpr.cases:
#             if Case.val.val == CompiledValue.getValue():
#                 for Stmt in Case.body:
#                     CompileStatement(Stmt, Context)
#                 return
#         assert False
#     # Compile the cases
#     Conditions = list()
#     for Case in MatchExpr.cases:
#         # Compile case value
#         assert type(Case.val) == Number, f"Got {Case.val} for case value"
#         # Generate a bitvector
#         ConstantVal = RoseConstant.create(
#             Case.val.val, CompiledValue.getType())
#         Condition = RoseEQOp.create(Context.genName(
#             "%cond"), CompiledValue, ConstantVal)
#         # Condition is unsigned
#         # Add the op to the IR
#         Context.addAbstractionToIR(Condition)
#         # Add the operation to the context
#         Context.addCompiledAbstraction(Case.id, Condition)
#         Conditions.append(Condition)

#     # Generate a cond region
#     CondRegion = RoseCond.create(Conditions, len(MatchExpr.cases))

#     # Add cond region as root abstraction
#     ChildContext = VISARoseContext()
#     ChildContext.pushRootAbstraction(CondRegion)

#     # Add the generated cond region to the current context
#     Context.addCompiledAbstraction(MatchExpr.id, CondRegion)

#     # Add a new context for this cond region
#     Context.createContext(MatchExpr.id, ChildContext)

#     # Now compile all the case statements
#     for Idx, Key in enumerate(CondRegion.getKeys()):
#         # Add key to this cond region
#         ChildContext.addKeyForCompiledAbstraction(Key, CondRegion)
#         # Compile the case statements
#         for Stmt in MatchExpr.cases[Idx].body:
#             CompileStatement(Stmt, ChildContext)
#         CondRegion = ChildContext.getRootAbstraction()

#     # Pop the root cond region from the child context
#     CompiledCondRegion = ChildContext.getRootAbstraction()

#     # Add cond region to the root abstraction
#     Context.addAbstractionToIR(CompiledCondRegion)

#     # Update the compiled cond region to the current context
#     Context.updateCompiledAbstraction(MatchExpr.id, CompiledCondRegion)

#     # Remove the child context now
#     Context.destroyContext(MatchExpr.id)


def CompileBuiltIn(CallStmt, Context: VISARoseContext):
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
        CompiledArg = CompileRValueExpr(Arg, Context)
        # Argument type cannot be undefined or void
        assert not isinstance(CompiledArg.getType(), RoseVoidType) \
            and not isinstance(CompiledArg.getType(), RoseUndefinedType), f"Argument type cannot be undefined or void. Got {CompiledArg.getType()}"
        ArgValuesList.append(CompiledArg)

    # # Now we have to deal with one special case
    # # where we hvae already performed the buitin operation.
    # if BuiltinOpPerformed(CallStmt, ArgValuesList, Context):
    #     # Nothing to do. Just map this operation id to its operand's operation.
    #     # There is nothing new to add to the IR.
    #     [Operation] = ArgValuesList
    #     Context.addCompiledAbstraction(CallStmt.id, Operation)
    #     return Operation

    # Int function does nothing. So just return the operand.
    # if CallStmt.funcname == "Int":
    #     [Operation] = ArgValuesList
    #     return Operation

    # Check if this is a call to a builtin function
    Operation = Builtins[CallStmt.funcname](
        Context.genName(), ArgValuesList, Context)
    # Check if this function call does nothing (extract the same bit slice)
    for Arg in ArgValuesList:
        if Operation == Arg:
            return Arg
    # Add the operation to the IR
    if isinstance(Operation, RoseOperation):
        Context.addAbstractionToIR(Operation)
    # Add the operation to the context
    Context.addCompiledAbstraction(CallStmt.id, Operation)
    return Operation


def CompileCallRv(Stmt: Call, Context: VISARoseContext):
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
    # if Stmt.funcname in InlineBuiltinsd:
    #     return InlinedBuiltins[Stmt.funcname](Stmt, Context)
    assert False, f"Function {Stmt.funcname} not found"


def CompileIfElseRv(Stmt: IfElseExpr, Context: VISARoseContext):
    # If this expression is compiled, no need to recompile
    if Context.isCompiledAbstraction(Stmt.id):
        return Context.getCompiledAbstractionForID(Stmt.id)

    # Compile the operation
    Cond = CompileRValueExpr(Stmt.cond, Context)
    if isinstance(Cond, RoseConstant):
        if Cond.getValue():
            Then = CompileRValueExpr(Stmt.then, Context)
            return Then
        else:
            Otherwise = CompileRValueExpr(Stmt.otherwise, Context)
            return Otherwise
    Then = CompileRValueExpr(Stmt.then, Context)
    Otherwise = CompileRValueExpr(Stmt.otherwise, Context)
    Hlog.debug(type(Cond), Cond, Cond.Type)
    Operation = RoseSelectOp.create(Context.genName(), Cond, Then, Otherwise)

    # If the operation is of bitvector type, add signedness info
    if isinstance(Operation.getType(), RoseBitVectorType):
        Context.addSignednessInfoForValue(
            Operation, Context.isValueSigned(Then))

    # Add the operation to the IR
    Context.addAbstractionToIR(Operation)
    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.id, Operation)
    return Operation


CompileAbstractions = {
    # VarDeclInit: CompileVarDeclInit,
    VarsDecl: CompileVarsDecl,
    For: CompileFor,
    # While: CompileWhile,
    IfElseStmt: CompileIfElseStmt,
    IfStmt: CompileIf,
    list: CompileList,
}
CompileAbstractionsRV = {
    ArrayIndex: CompileArrayIndexRv,
    ArraySlice: CompileArraySlice,
    Update: CompileUpdateRv,
    Var: CompileVarRv,
    Member: CompileMemberRv,
    Number: CompileNumberRv,
    BinaryExpr: CompileBinaryExprRv,
    UnaryExpr: CompileUnaryExpr,
    Call: CompileCallRv,
    IfElseExpr: CompileIfElseRv,
}
CompileAbstractionsLV = {
}


# def NotImplemented(sss):
#     def ni(*args, **kwargs):
#         raise NotImplementedError(sss)
#     return ni


def HandleToNot():
    def LamdaImplFunc(Name: str, Value: RoseValue, Context: VISARoseContext):
        if isinstance(Value, RoseConstant):
            return RoseConstant.create(not Value.getValue(), Value.getType())
        if isinstance(Value.getType(), RoseBitVectorType):
            Op = RoseBVNotOp.create(Name, Value)
            Context.addSignednessInfoForValue(
                Op, IsSigned=Context.isValueSigned(Value))
            return Op
        elif isinstance(Value.getType(), RoseBooleanType):
            Op = RoseNotOp.create(Name, Value)
            return Op

    return LamdaImplFunc


def HandleToNeg():
    def LamdaImplFunc(Name: str, Value: RoseValue, Context: VISARoseContext):
        if isinstance(Value, RoseConstant):
            Op = RoseConstant.create(-Value.getValue(), Value.getType())
            Context.addSignednessInfoForValue(Op, IsSigned=True)
            return Op
        assert isinstance(Value.getType(), RoseBitVectorType)
        Op = RoseBVNegOp.create(Name, Value)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


# # Some unary oprations
UnaryOps = {
    # 'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
}


def TypePromotion(Operand1: RoseValue, Operand2: RoseValue, Context: VISARoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
            and isinstance(Operand2.getType(), RoseBitVectorType):
        if Operand1.getType().getBitwidth() > Operand2.getType().getBitwidth():
            # Only extends Operand2
            # assert not Context.isValueSigned(Operand2)  # unsigned
            # SizeExt=

            Bitwidth = RoseConstant.create(
                Operand1.getType().getBitwidth(), Context.NumberType)
            ID = Context.genName()
            NewOp = HandleToSizeExt(None)(
                ID, [Operand2, Bitwidth], Context)
            Context.addAbstractionToIR(NewOp)
            Context.addCompiledAbstraction(ID, NewOp)
            return [Operand1, NewOp]
        return [Operand1, Operand2]  # Nothing to do
    if isinstance(Operand1.getType(), RoseBitVectorType) and isinstance(Operand2.getType(), RoseIntegerType) and isinstance(Operand2, RoseConstant):
        bvliteral = RoseConstant.create(
            Operand2.getValue(), Operand1.getType())
        return [Operand1, bvliteral]
    if isinstance(Operand1.getType(), RoseIntegerType) and isinstance(Operand1, RoseConstant) and isinstance(Operand2.getType(), RoseBitVectorType):
        bvliteral = RoseConstant.create(
            Operand1.getValue(), Operand2.getType())
        return [bvliteral, Operand2]
    return [Operand1, Operand2]


# def TypeAlign(Operand1: RoseValue, Operand2: RoseValue, Context: VISARoseContext):
#     if isinstance(Operand1.getType(), RoseBitVectorType) \
#             and isinstance(Operand2.getType(), RoseBitVectorType):
#         if Operand1.getType().getBitwidth() > Operand2.getType().getBitwidth():
#             assert not Context.isValueSigned(Operand2)  # unsigned
#             Bitwidth = RoseConstant.create(
#                 Operand1.getType().getBitwidth(), Context.NumberType)
#             NewOp = HandleToSignExtend(None)(
#                 Context.genName(), [Operand2, Bitwidth], Context)
#             if isinstance(NewOp, RoseOperation):
#                 Context.addAbstractionToIR(NewOp)
#             # Add the operation to the context
#             Context.addCompiledAbstraction(Context.genName(), NewOp)
#             return [Operand1, NewOp]

#     return [Operand1, Operand2]


def ComputeConstant(op: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: VISARoseContext):
    if isinstance(Operand1, RoseConstant) and isinstance(Operand2, RoseConstant):
        if op in ['+', '-', '*', '<<', '>>']:
            assert isinstance(Operand1.getType(), RoseIntegerType) and isinstance(
                Operand2.getType(), RoseIntegerType)
            val = eval(f"{Operand1.getValue()} {op} {Operand2.getValue()}")
            if val.bit_length() > 32:
                return RoseConstant.create(val, Context.Number64Type)
            return RoseConstant.create(val, Context.NumberType)
        if op == "<<<":  # VISAShl, intentionally contrary to keys of BinaryOps
            val = Operand1.getValue() << Operand2.getValue() if Operand2.getValue(
            ) >= 0 else Operand1.getValue() >> -Operand2.getValue()
            if val.bit_length() > 32:
                return RoseConstant.create(val, Context.Number64Type)
            return RoseConstant.create(val, Context.NumberType)
        if op == "//":
            assert isinstance(Operand1.getType(), RoseIntegerType) and isinstance(
                Operand2.getType(), RoseIntegerType)
            assert Operand2.getValue() != 0
            assert Operand1.getValue() % Operand2.getValue() == 0
            val = eval(f"{Operand1.getValue()} {op} {Operand2.getValue()}")
            return RoseConstant.create(val, Context.NumberType)
        if op in ['>=', '>', '<', '<=', '==', '!=']:
            assert isinstance(Operand1.getType(), RoseIntegerType) and isinstance(
                Operand2.getType(), RoseIntegerType)
            val = eval(f"{Operand1.getValue()} {op} {Operand2.getValue()}")
            return RoseConstant.create(val, RoseBooleanType.create())
        if op in ['||', '&&']:
            assert isinstance(Operand1.getType(), RoseBooleanType) and isinstance(
                Operand2.getType(), RoseBooleanType)
            op = {'||': 'or', '&&': 'and'}[op]
            val = eval(f"{Operand1.getValue()} {op} {Operand2.getValue()}")
            return RoseConstant.create(val, RoseBooleanType.create())
    elif isinstance(Operand2, RoseConstant):
        if (op in ["<<<", "+", '-', ">>", "<<"]) and Operand2.getValue() == 0:
            return Operand1
    return None


def HandleToAdd():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('+', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
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
                      Context: VISARoseContext):
        # if (z := ComputeConstant('-', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
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
                      Context: VISARoseContext):
        # if (z := ComputeConstant('*', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
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
                      Context: VISARoseContext):
        # if (z := ComputeConstant('//', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            if Context.isValueSigned(Operand1) \
                    or Context.isValueSigned(Operand2):
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
                      Context: VISARoseContext):
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSmodOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=True)
            return Op
        return RoseModOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToOr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        if (z := ComputeConstant('||', Operand1, Operand2, Context)) != None:
            return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
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
                      Context: VISARoseContext):
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
                      Context: VISARoseContext):
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
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
                      Context: VISARoseContext):
        # if (z := ComputeConstant('==', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVEQOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseEQOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToNotEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('!=', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVNEQOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseNEQOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToLessThan():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('<', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSLTOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseLTOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToLessThanEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('<=', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSLEOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseLEOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToGreaterThan():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('>', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSGTOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseGTOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToGreaterThanEqual():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # if (z := ComputeConstant('>=', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        if isinstance(Operand1.getType(), RoseBitVectorType) \
                and isinstance(Operand2.getType(), RoseBitVectorType):
            Op = RoseBVSGEOp.create(Name, Operand1, Operand2)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseGEOp.create(Name, Operand1, Operand2)

    return LamdaImplFunc


def HandleToAshr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        [Operand1, Operand2] = TypePromotion(Operand1, Operand2, Context)
        # [Operand1, Operand2] = TypeAlign(Operand1, Operand2, Context)
        assert isinstance(Operand1.getType(), RoseBitVectorType)
        assert isinstance(Operand2.getType(), RoseBitVectorType), breakpoint()
        Op = RoseBVAshrOp.create(Name, Operand1, Operand2)
        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


def HandleToLshr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        [Operand1, Operand2] = TypePromotion(Operand1, Operand2, Context)
        # [Operand1, Operand2] = TypeAlign(Operand1, Operand2, Context)
        assert isinstance(Operand1.getType(), RoseBitVectorType)
        assert isinstance(Operand2.getType(), RoseBitVectorType)
        Op = RoseBVLshrOp.create(Name, Operand1, Operand2)
        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


def ShiftTruncate(Operand1: RoseValue, Operand2: RoseValue,
                  Context: VISARoseContext):
    if isinstance(Operand2, RoseConstant):
        return Operand2
    bw = 6 if Operand1.getType().getBitwidth() == 64 else 5
    RealShift = RoseBVExtractSliceOp.create(
        Context.genName(), Operand2, RoseConstant.create(0, Context.NumberType), RoseConstant.create(bw-1, Context.NumberType), RoseConstant.create(bw, Context.NumberType))
    Context.addSignednessInfoForValue(RealShift, IsSigned=False)
    Context.addAbstractionToIR(RealShift)
    Context.addCompiledAbstraction(Context.genName(), RealShift)
    return RealShift


def HandleToShr():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # Operand2 = ShiftTruncate(Operand1, Operand2, Context)
        # Disable above once passed test
        # if Context.compileFlag.get("asr", False):
        return HandleToAshr()(Name, Operand1, Operand2, Context)
        # else:
        #     return HandleToLshr()(Name, Operand1, Operand2, Context)

    return LamdaImplFunc


def HandleToShl():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        # Operand2 = ShiftTruncate(Operand1, Operand2, Context)
        # Disable above once passed test
        # if (z := ComputeConstant('<<', Operand1, Operand2, Context)) != None:
        #     return z
        Operands = TypePromotion(Operand1, Operand2, Context)
        [Operand1, Operand2] = Operands
        assert isinstance(Operand1.getType(), RoseBitVectorType)
        assert isinstance(Operand2.getType(), RoseBitVectorType)
        Op = RoseBVShlOp.create(Name, Operand1, Operand2)

        Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
        return Op

    return LamdaImplFunc


# def HandleToVISAShl():
#     def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
#                       Context: VISARoseContext):
#         if (z := ComputeConstant('<<<', Operand1, Operand2, Context)) != None:
#             return z
#         Operands = TypePromotion(Operand1, Operand2, Context)
#         [Operand1, Operand2] = Operands
#         assert isinstance(Operand1.getType(), RoseBitVectorType)
#         assert isinstance(Operand2.getType(), RoseBitVectorType), breakpoint()
#         # Op = RoseVISAShlOp.create(Name, Operand1, Operand2)
#         # assert Context.isValueSigned(Operand2)
#         '''
#             a << b ->
#             a<<b if b>=0 else a>>-b
#         '''
#         inline_list = [

#         ]

#         Cond = RoseBVSGTOp.create(
#             Context.genName(), Operand2, RoseConstant(0, Operand2.getType()))
#         Context.addSignednessInfoForValue(Cond, IsSigned=False)
#         Then = RoseBVShlOp.create(Context.genName(), Operand1, Operand2)
#         Context.addSignednessInfoForValue(
#             Then, IsSigned=Context.isValueSigned(Operand1))
#         NegOp2 = RoseBVSubOp.create(
#             Context.genName(), [RoseConstant(0, Operand2.getType()), Operand2])
#         Context.addSignednessInfoForValue(NegOp2, IsSigned=True)
#         if Context.isValueSigned(Operand1):
#             Otherwise = RoseBVAshrOp.create(
#                 Context.genName(), Operand1, NegOp2)
#             Context.addSignednessInfoForValue(Otherwise, IsSigned=True)
#         else:
#             Otherwise = RoseBVLshrOp.create(
#                 Context.genName(), Operand1, NegOp2)
#             Context.addSignednessInfoForValue(Otherwise, IsSigned=False)
#         Op = RoseSelectOp.create(Context.genName(), Cond, Then, Otherwise)
#         Context.addSignednessInfoForValue(Op, Context.isValueSigned(Then))

#         Context.addAbstractionToIR(Cond)
#         Context.addAbstractionToIR(Then)
#         Context.addAbstractionToIR(NegOp2)
#         Context.addAbstractionToIR(Otherwise)
#         return Op

#     return LamdaImplFunc


# def HandleToConcat():
#     def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
#                       Context: VISARoseContext):
#         assert isinstance(Operand1.getType(), RoseBitVectorType)
#         assert isinstance(Operand2.getType(), RoseBitVectorType)
#         Op = RoseBVConcatOp.create(Name, Operand1, Operand2)
#         if isinstance(Operand1, RoseArgument) and isinstance(Operand2, RoseArgument):
#             Op.isPureArgs = True  # Consider as arguments
#         # assert Context.isValueSigned(
#         #     Operand1) == Context.isValueSigned(Operand2), (Operand1, Operand2)
#         Context.addSignednessInfoForValue(Op, Context.isValueSigned(
#             Operand1) or Context.isValueSigned(Operand2))
#         return Op

#     return LamdaImplFunc

def HandleToIs():
    def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                      Context: VISARoseContext):
        breakpoint()
        assert isinstance(Operand1.getType(), RoseBitVectorType)
        assert isinstance(Operand2.getType(), RoseBitVectorType)
        return Op

    return LamdaImplFunc


BinOpsTryFolding = {
    '==', '+', '||'
}
BinaryOps = {
    '+': HandleToAdd,
    '-': HandleToSub,
    '*': HandleToMul,
    '/': HandleToDiv,
    # 'DIV': HandleToDiv,
    '%': HandleToMod,
    '<': HandleToLessThan,
    '<=': HandleToLessThanEqual,
    '>': HandleToGreaterThan,
    '>=': HandleToGreaterThanEqual,
    '==': HandleToEqual,
    '!=': HandleToNotEqual,
    '>>': HandleToShr,
    '<<': HandleToShl,
    # # '<<<': HandleToShl,  # real shift left
    '&': HandleToAnd,
    '|': HandleToOr,
    '&&': HandleToAnd,
    '||': HandleToOr,
    '^': HandleToXor,
    # ':': HandleToConcat,
    'is': HandleToIs,
}


# def HandleToInt(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         if len(Args) == 2:
#             [Value, unsigned] = Args
#             toPass = [Value]
#         else:
#             [Value, unsigned, BW] = Args
#             toPass = [Value, BW]
#         Hlog.debug("unsigned: ", unsigned)
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert type(unsigned) == RoseConstant, "Only constant is supported."
#         # Consider using BVSizeExtension?
#         if unsigned.getValue():
#             return HandleToUInt(None)(Name, toPass, Context)
#         else:
#             return HandleToSInt(None)(Name, toPass, Context)
#     return LamdaImplFunc


# def HandleToSInt(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         if len(Args) == 1:
#             [Value] = Args
#             assert isinstance(Value.getType(), RoseBitVectorType)
#             if Value.getType().getBitwidth() == Context.IntSimWidth:
#                 return Value
#             Op = RoseBVSignExtendOp.create(Name, Value, Context.IntSimWidth)
#             Context.addSignednessInfoForValue(Op, IsSigned=True)
#             return Op
#         else:
#             [Value, BW] = Args
#             assert isinstance(Value.getType(), RoseBitVectorType)
#             assert isinstance(BW, RoseConstant)
#             Op = RoseBVSignExtendOp.create(Name, Value, BW.getValue())
#             Context.addSignednessInfoForValue(Op, IsSigned=True)
#             return Op
#     return LamdaImplFunc


# def HandleToUInt(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         if len(Args) == 1:
#             [Value] = Args
#             assert isinstance(Value.getType(), RoseBitVectorType)
#             if Value.getType().getBitwidth() == Context.IntSimWidth:
#                 return Value
#             Op = RoseBVZeroExtendOp.create(Name, Value, Context.IntSimWidth)
#             Context.addSignednessInfoForValue(Op, IsSigned=False)
#             return Op
#         else:
#             [Value, BW] = Args
#             assert isinstance(Value.getType(), RoseBitVectorType)
#             assert isinstance(BW, RoseConstant)
#             Op = RoseBVZeroExtendOp.create(Name, Value, BW.getValue())
#             Context.addSignednessInfoForValue(Op, IsSigned=False)
#             return Op
#     return LamdaImplFunc


def HandleToZeroExtend(_):
    def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
        [Value, BitwidthValue] = Args
        assert isinstance(Value.getType(), RoseBitVectorType)
        assert type(BitwidthValue) == RoseConstant
        Bitwidth = BitwidthValue.getValue()
        if Value.getType().getBitwidth() < Bitwidth:
            Op = RoseBVZeroExtendOp.create(Name, Value, Bitwidth)
            Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        else:
            assert Value.getType().getBitwidth() == Bitwidth
            return Value

    return LamdaImplFunc


# def HandleToSignExtend(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value, BitwidthValue] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert type(BitwidthValue) == RoseConstant
#         Bitwidth = BitwidthValue.getValue()
#         if Value.getType().getBitwidth() < Bitwidth:
#             Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
#             Context.addSignednessInfoForValue(Op, IsSigned=True)
#             return Op
#         else:
#             assert Value.getType().getBitwidth() == Bitwidth
#             return Value

#     return LamdaImplFunc


def HandleToSizeExt(_):
    def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
        [Value, Bitwidth] = Args
        assert isinstance(Value.getType(), RoseBitVectorType)
        # Increase the bitwidth by 2x.
        Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
        Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op

    return LamdaImplFunc


def HandleToMin(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            if Context.isValueSigned(Operands[0]) \
                    or Context.isValueSigned(Operands[1]):
                Op = RoseBVSminOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=True)
            else:
                Op = RoseBVUminOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseMinOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToMax(_):
    def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
        assert len(Operands) == 2
        if isinstance(Operands[0].getType(), RoseBitVectorType) \
                and isinstance(Operands[1].getType(), RoseBitVectorType):
            if Context.isValueSigned(Operands[0]) \
                    or Context.isValueSigned(Operands[1]):
                Op = RoseBVSmaxOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=True)
            else:
                Op = RoseBVUmaxOp.create(Name, Operands)
                Context.addSignednessInfoForValue(Op, IsSigned=False)
            return Op
        return RoseMaxOp.create(Name, Operands)

    return LamdaImplFunc


def HandleToSatQ(_):
    def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
        [Value, satsize, unsigned] = Args
        assert isinstance(Value.getType(), RoseBitVectorType)
        assert isinstance(unsigned, RoseConstant)
        assert isinstance(satsize, RoseConstant)
        assert Value.getType().getBitwidth() >= satsize.getValue()
        if unsigned.getValue():
            Op = RoseBVUSaturateOp.create(Name, Value, satsize.getValue())
            Context.addSignednessInfoForValue(Op, IsSigned=False)
        else:
            Op = RoseBVSSaturateOp.create(Name, Value, satsize.getValue())
            Context.addSignednessInfoForValue(Op, IsSigned=True)
        return Op
    return LamdaImplFunc


# def HandleToSignedSatQ(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value, satsize] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert isinstance(satsize, RoseConstant)
#         assert Value.getType().getBitwidth() >= satsize.getValue()
#         Op = RoseBVSSaturateOp.create(Name, Value, satsize.getValue())
#         Context.addSignednessInfoForValue(Op, IsSigned=True)
#         return Op
#     return LamdaImplFunc


# def HandleToUnsignedSatQ(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value, satsize] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert isinstance(satsize, RoseConstant)
#         assert Value.getType().getBitwidth() >= satsize.getValue()
#         Op = RoseBVUSaturateOp.create(Name, Value, satsize.getValue())
#         Context.addSignednessInfoForValue(Op, IsSigned=False)
#         return Op
#     return LamdaImplFunc


# def HandleToSSaturate(Bitwidth: int):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert Value.getType().getBitwidth() >= Bitwidth
#         Op = RoseBVSSaturateOp.create(Name, Value, Bitwidth)
#         Context.addSignednessInfoForValue(Op, IsSigned=True)
#         return Op

#     return LamdaImplFunc


# def HandleToUSaturate(Bitwidth: int):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert Value.getType().getBitwidth() >= Bitwidth
#         Op = RoseBVUSaturateOp.create(Name, Value, Bitwidth)
#         Context.addSignednessInfoForValue(Op, IsSigned=False)
#         return Op

#     return LamdaImplFunc


# def HandleToTruncate(Bitwidth: int):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         assert Value.getType().getBitwidth() > Bitwidth
#         Op = RoseBVTruncateLowOp.create(Name, Value, Bitwidth)
#         Context.addSignednessInfoForValue(
#             Op, IsSigned=Context.isValueSigned(Value))
#         return Op

#     return LamdaImplFunc


# def HandleToSpecialTruncate(_):
#     def LamdaImplFunc(Name: str, Args: list, Context: VISARoseContext):
#         [Value] = Args
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         Bitwidth = int(Value.getType().getBitwidth() / 2)
#         assert Value.getType().getBitwidth() > Bitwidth
#         Op = RoseBVTruncateLowOp.create(Name, Value, Bitwidth)
#         Context.addSignednessInfoForValue(
#             Op, IsSigned=Context.isValueSigned(Value))
#         return Op

#     return LamdaImplFunc


# def HandleToAbs(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 1
#         [Value] = Operands
#         if isinstance(Value.getType(), RoseBitVectorType):
#             Op = RoseBVAbsOp.create(Name, Value)
#         else:
#             Op = RoseAbsOp.create(Name, Value)
#         Context.addSignednessInfoForValue(Op, IsSigned=False)
#         return Op

#     return LamdaImplFunc


# def HandleToNotFunc(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 1
#         [Value] = Operands
#         assert isinstance(Value.getType(), RoseBitVectorType)
#         Op = RoseBVNotOp.create(Name, Value)
#         Context.addSignednessInfoForValue(
#             Op, IsSigned=Context.isValueSigned(Value))
#         return Op

#     return LamdaImplFunc


# def HandleToRemainder(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 2
#         if isinstance(Operands[0].getType(), RoseBitVectorType) \
#                 and isinstance(Operands[1].getType(), RoseBitVectorType):
#             Op = RoseBVSremOp.create(Name, Operands[0], Operands[1])
#             Context.addSignednessInfoForValue(Op, IsSigned=True)
#             return Op
#         return RoseRemOp.create(Name, Operands)

#     return LamdaImplFunc


# def HandleToIsZero(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 1
#         if isinstance(Operands[0].getType(), RoseBitVectorType):
#             Op = RoseBVZeroOp.create(Name, Operands[0])
#             Context.addSignednessInfoForValue(Op, IsSigned=False)
#             return Op
#         assert False

#     return LamdaImplFunc


# def HandleToROL(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 2
#         Operands = TypePromotion(Operands[0], Operands[1], Context)
#         if isinstance(Operands[0].getType(), RoseBitVectorType) and \
#                 isinstance(Operands[1].getType(), RoseBitVectorType):
#             Op = RoseBVRolOp.create(Name, Operands[0], Operands[1])
#             Context.addSignednessInfoForValue(Op, Context.isValueSigned(
#                 Operands[0]) or Context.isValueSigned(Operands[1]))
#             return Op
#         assert False

#     return LamdaImplFunc


# def HandleToROR(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 2
#         Operands = TypePromotion(Operands[0], Operands[1], Context)
#         if isinstance(Operands[0].getType(), RoseBitVectorType) and \
#                 isinstance(Operands[1].getType(), RoseBitVectorType):
#             Op = RoseBVRorOp.create(Name, Operands[0], Operands[1])
#             Context.addSignednessInfoForValue(Op, Context.isValueSigned(
#                 Operands[0]) or Context.isValueSigned(Operands[1]))
#             return Op
#         assert False

#     return LamdaImplFunc


# def HandleToOnes(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) <= 1
#         if len(Operands) == 0:
#             wid = Context.getLHSType()[1]
#             assert type(wid) == int
#             Op = RoseConstant((1 << wid) - 1, RoseBitVectorType.create(wid))
#             Context.addSignednessInfoForValue(Op, False)
#             return Op
#         if len(Operands) == 1:
#             assert type(Operands[0]) == RoseConstant
#             wid = Operands[0].getValue()
#             assert type(wid) == int
#             Op = RoseConstant((1 << wid) - 1, RoseBitVectorType.create(wid))
#             Context.addSignednessInfoForValue(Op, False)
#             return Op

#     return LamdaImplFunc


# def HandleToZeros(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 0
#         wid = Context.getLHSType()[1]
#         assert type(wid) == int
#         Op = RoseConstant(0, RoseBitVectorType.create(wid))
#         Context.addSignednessInfoForValue(Op, False)
#         return Op

#     return LamdaImplFunc


# def HandleToZeros(_):
#     def LamdaImplFunc(Name: str, Operands: list, Context: VISARoseContext):
#         assert len(Operands) == 0
#         wid = Context.getLHSType()[1]
#         assert type(wid) == int
#         Op = RoseConstant(0, RoseBitVectorType.create(wid))
#         Context.addSignednessInfoForValue(Op, False)
#         return Op

#     return LamdaImplFunc


# # Builtin functions
Builtins = {
    # 'Saturate32': HandleToSSaturate(32),
    # 'Saturate16': HandleToSSaturate(16),
    # 'Saturate8': HandleToSSaturate(8),

    # 'SaturateU32': HandleToUSaturate(32),
    # 'SaturateU16': HandleToUSaturate(16),
    # 'SaturateU8': HandleToUSaturate(8),

    # 'ZeroExtend16': HandleToZeroExtend(16),
    # 'ZeroExtend32': HandleToZeroExtend(32),
    # 'ZeroExtend64': HandleToZeroExtend(64),

    # 'SignExtend16': HandleToSignExtend(16),
    # 'SignExtend32': HandleToSignExtend(32),
    # 'SignExtend64': HandleToSignExtend(64),
    # 'Signed': HandleToSpecialSignExtend(None),

    # 'Truncate8': HandleToTruncate(8),
    # 'Truncate16': HandleToTruncate(16),
    # 'Truncate32': HandleToTruncate(32),
    # 'Truncate64': HandleToTruncate(64),
    # 'TRUNCATE': HandleToSpecialTruncate(None),

    'min': HandleToMin(None),
    'max': HandleToMax(None),

    # 'ABS': HandleToAbs(None),
    # 'REMAINDER': None,
    # # above for x86
    # 'Int': HandleToInt(None),
    # 'UInt': HandleToUInt(None),
    'SizeExt': HandleToSizeExt(None),
    # 'SignExtend': HandleToSignExtend(None),
    # 'SInt': HandleToSInt(None),
    # 'SatQ': HandleToSatQ(None),
    # 'SignedSatQ': HandleToSignedSatQ(None),
    # 'UnsignedSatQ': HandleToUnsignedSatQ(None),
    # 'Ones': HandleToOnes(None),
    # 'Zeros': HandleToZeros(None),
    # 'IsZero': HandleToIsZero(None),
    # 'Min': HandleToMin(None),
    # 'Max': HandleToMax(None),
    # 'Abs': HandleToAbs(None),
    # 'BitCount': NotImplemented('BitCount'),
    # 'CountLeadingSignBits': NotImplemented('CountLeadingSignBits'),
    # 'CountLeadingZeroBits': NotImplemented('CountLeadingZeroBits'),
    # 'UnsignedRecipEstimate': NotImplemented('UnsignedRecipEstimate'),
    # 'UnsignedRSqrtEstimate': NotImplemented('UnsignedRSqrtEstimate'),
    # 'NOT': HandleToNotFunc(None),

    # 'ROL': HandleToROL(None),
    # 'ROR': HandleToROL(None),
    # 'LSL': NotImplemented('LSL'),
    # 'LSR': NotImplemented('LSR'),
}
# InlinedBuiltins = {
#     'Reduce': InlineReduce
# }
