from RoseTypes import *
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *

from ARMAST import *
from ARMRoseTypes import *
from ARMTypes import *
IntSimWidth = 192
IntegerWidth = 32


def UnchangedException(Exception):
  pass


class ARMRoseContext(RoseContext):
  def __init__(self):
    self.constexpr = {}
    self.preparation = {}
    self.NumberType = RoseIntegerType.create(IntegerWidth)
    self.Number64Type = RoseIntegerType.create(64)
    self.varType = {}
    self.returnOperand = None
    super().__init__()

  def setReturned(self, returnOperand):
    assert not self.returnOperand, "Returning twice"
    self.returnOperand = returnOperand

  def setConstexpr(self, constexpr):
    print("Setting constexpr", constexpr)
    self.constexpr = constexpr

  def getConstexprFor(self, qid: str) -> (int):
    if qid in self.constexpr:
      return self.constexpr[qid]
    if qid in ARMGlobalConst:
      return ARMGlobalConst[qid]
    return None

  def setPreparation(self, preparation):
    self.preparation = preparation

  def getArgumentForRegister(self, reg: str):
    return self.preparation[reg]

  def setLHSType(self, Type: Tuple[str, int]):
    assert not hasattr(self, "LHSType")
    if Type is None:
      return
    self.LHSType = Type

  def getLHSType(self):
    assert hasattr(self, "LHSType")
    return self.LHSType

  def removeLHSType(self):
    if not hasattr(self, "LHSType"):
      return
    del self.LHSType

  def setTypeForVar(self, qid: str, Type: Tuple[str, int]):
    assert qid not in self.varType, "Giving width for a variable twice"
    self.varType[qid] = Type

  def getTypeForVar(self, qid: str):
    if qid not in self.varType:
      return None
    return self.varType[qid]

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
              assert ChildContext.isValueSignKnown(
                  Op.getInputBitVector())
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
    if Param.type in PointerType:
      raise NotImplementedError(
          f"Parameter type {Param.type} not supported yet")
    if Param.type in ReservedImmTypes:
      ParamType = RoseBitVectorType(192)
    else:
      ParamType = ARMTypes[Param.type]
    # Create a new rosette value
    ParamVal = RoseArgument.create(Param.name, ParamType, RoseUndefValue())
    RootContext.addSignednessInfoForValue(ParamVal, Param.is_signed)
    ParamsIDs.append(f"arg{Index}")
    ParamValues.append(ParamVal)

  if Sema.rettype != 'void':
    RetType = ARMTypes[Sema.rettype]
    # RetValue = RoseValue.create('returnVal', RetType)
  else:
    assert False
    # TODO
    # RetType = RoseVoidType.create()
    # RetValue = RoseValue.create("", RetType)

  # Define a Rose function
  RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetType)
  # RootFunction.setRetValName(RetValue.getName())

  # Add return value to the root context
  # ReturnID = "return." + RootFunction.getReturnValue().getName()
  # RootContext.addVariable(RootFunction.getReturnValue().getName(), ReturnID)
  # RootContext.addCompiledAbstraction(ReturnID, RootFunction.getReturnValue())
  # RootContext.addSignednessInfoForValue(RetValue, Sema.ret_is_signed)

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
  # CompiledRetVal = RoseUndefValue()
  for Index, Stmt in enumerate(Sema.spec):
    CompileStatement(Stmt, RootContext)
  RootFunction.setRetVal(RootContext.returnOperand)
  RootContext.addSignednessInfoForValue(
      RootContext.returnOperand, Sema.ret_is_signed)
  # RootFunction.setRetValName(RootContext.returnOperand)
  # Get the compiled function
  CompiledFunction = RootContext.getRootAbstraction()

  # See if the function returns anything, if not add a return op
  # if CompiledRetVal == RoseUndefValue():
  #     Op = RoseReturnOp.create(CompiledFunction.getReturnValue())
  #     # NO meed to add this operation to the context but add it to the function
  #     CompiledFunction.addAbstraction(Op)
  # yeah?

  print("\n\n\n\n\nFunction:")
  CompiledFunction.print()

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
  assert len(
      Stmt.decl.ids) == 1, f"Only one variable can be declared, but got {Stmt.decl.ids}"
  CompileVarsDecl(Stmt.decl, Context)
  return CompileUpdate(Update(Stmt.decl.ids[0], Stmt.expr), Context)


def CompileVarsDecl(Stmt: VarsDecl, Context: ARMRoseContext):
  '''
  bits(datasize) operand1
       --------  ========
        width      ids
  integer op1;
  '''
  # CompileStatement(Stmt.decl, Context)
  # CompileStatement(Stmt.width, Context)
  # return CompileVarsDecl(Stmt.decl, Context)
  # Context.
  if Stmt.basetype[0] == 'bits':
    datasizeVal = CompileRValueExpr(Stmt.basetype[1], Context)
    assert isinstance(
        datasizeVal, RoseConstant), f"Width of variable must be a constant but got {datasizeVal}"
    datasize = datasizeVal.getValue()
    for ids in Stmt.ids:
      Context.setTypeForVar(ids.name, ('bits', datasize))
      CompileVarRv(ids, Context)
  if Stmt.basetype[0] == 'boolean':
    for ids in Stmt.ids:
      Context.setTypeForVar(ids.name, ('boolean', 1))
      CompileVarRv(ids, Context)


def CompileVarRv(Variable: Var, Context: ARMRoseContext):
  if (constval := Context.getConstexprFor(Variable.name)) is not None:
    if type(constval) == int:
      return RoseConstant(constval, Context.NumberType)
    if type(constval) == bool:
      return RoseConstant(constval, RoseBooleanType.create())
    if type(constval) == str:
      return RoseConstant(int(constval, 2), RoseBitVectorType.create(len(constval)))
    raise NotImplementedError(
        f"Unsupported type of constant: {type(constval)}")
  # Check if the variable is already defined and cached. If yes, just return that.
  print("Looking for variable: ", Variable.name)
  if Context.isVariableDefined(Variable.name):
    ID = Context.getVariableID(Variable.name)
    print("Found variable: ", Variable.name,
          ID, Context.getCompiledAbstractionForID(ID))
    return Context.getCompiledAbstractionForID(ID)
  if Variable.name in Context.preparation:
    return CompileVarRv(Var(Context.preparation[Variable.name], Variable.id), Context)

  if (Type := Context.getTypeForVar(Variable.name)) is not None:
    if Type[0] == 'bits':
      assert type(
          Type[1]) == int, f"Width of variable must be a constant but got {Type[1]}, {type(Type[1])}"
      var = RoseValue.create(Variable.name,
                             RoseBitVectorType.create(Type[1]))
    elif Type[0] == 'boolean':
      var = RoseValue.create(Variable.name,
                             RoseBooleanType.create())
  else:
    var = RoseValue.create(Variable.name,
                           Context.NumberType)

  # Add the variable info to the context
  Context.addVariable(Variable.name, Variable.id)
  Context.addCompiledAbstraction(Variable.id, var)

  return var


def ElemToSlicedArray(Stmt: ArrayIndex):
  assert Stmt.obj.name == 'Elem', f"Elem can only be indexed by a variable, but got {Stmt.obj.name}"
  args = Stmt.slices
  assert len(
      args) == 3, f"Elem can only be indexed by three arguments, but got {args}"
  # [e*esize,e*esize+esize-1]
  lo = BinaryExpr('*', args[1], args[2], Stmt.id+f".1")
  hi = BinaryExpr('+', BinaryExpr('*', args[1], args[2], Stmt.id+f".2"), BinaryExpr(
      '-', args[2], Number(1), Stmt.id+f".32"), Stmt.id+f".4")
  # hi = BinaryExpr('-', BinaryExpr(
  #     '*', BinaryExpr('+', args[1], Number(1), Stmt.id+f".2"), args[2], Stmt.id+f".3"), Number(1), Stmt.id+f".4")
  # Node = SliceRange(args[0], [lo, hi], Stmt.id)
  SL = SliceRange(
      hi, lo, Stmt.id+f".5")
  SL.wid = args[2]
  Node = ArrayIndex(args[0], [SL], Stmt.id+f".6")
  return Node


def VorVpartToLv(Stmt: ArrayIndex, Context: ARMRoseContext):
  args = Stmt.slices
  ID = Stmt.id
  if Stmt.obj.name in ['V', 'X']:
    assert len(args) == 1, f"Got {Stmt}"
    assert type(args[0]) == Var, f"Got {Stmt}"

    reg = args[0].name
    assert reg in Context.preparation, f"Register {reg} is not defined"

    return Var(Context.getArgumentForRegister(reg), ID)
  elif Stmt.obj.name == 'Vpart':
    assert len(args) == 2, f"Got {Stmt}"
    assert type(args[0]) == Var, f"Got {Stmt}"
    Part = CompileRValueExpr(args[1], Context)
    assert isinstance(Part, RoseConstant)

    reg = args[0].name
    assert reg in Context.preparation, f"Register {reg} is not defined"
    if Part.getValue():
      ID = "part." + ID

    return Var(Context.getArgumentForRegister(reg), ID)
  else:
    assert False, f"Got {Stmt}"


def CompileVorVpartToRv(Stmt: ArrayIndex, Context: ARMRoseContext):

  tmp = VorVpartToLv(Stmt, Context)
  if tmp.id.startswith("part."):
    lhs = Context.getLHSType()
    width = lhs[1]
    assert lhs[0] == 'bits', f"Got {lhs}"
    assert width in [32, 64]

    return CompileRValueExpr(ArrayIndex(tmp, [SliceRange(Number(2*width-1), Number(width), Context.genName())], Context.genName()), Context)
  return CompileRValueExpr(tmp, Context)
  # assert lhs[0] == 'bits', f"Got {lhs}"
  # assert width in [8, 16, 32, 64, 128], f"Got {width}"
  if Context.isVariableDefined(tmp.name):
    ID = Context.getVariableID(tmp.name)
    Vec = Context.getCompiledAbstractionForID(ID)
    return CompileRValueExpr(ArrayIndex(tmp, [SliceRange(Number(Vec.getType().getBitwidth()-1), Number(0), Context.genName())], Context.genName()), Context)
  raise NotImplementedError(f"Got {tmp}")


def CompileArrayIndexRv(Stmt: ArrayIndex, Context: ARMRoseContext):
  '''
  V    [         n        ]
  Elem [operand1, e, esize]
  ---- ====================
  obj          idxs
  '''
  if type(Stmt.obj) == Var:
    if Stmt.obj.name in ['V', 'Vpart', 'X']:
      return CompileVorVpartToRv(Stmt, Context)
    elif Stmt.obj.name == 'Elem':
      return CompileArrayIndexRv(ElemToSlicedArray(Stmt), Context)
    else:
      return ComputeArrayIndexOrSliceRv(Stmt, Context)
  else:
    return ComputeArrayIndexOrSliceRv(Stmt, Context)


def SimplifyArrayIndexLv(Stmt: ArrayIndex, Context: ARMRoseContext):
  '''
  V    [         n        ]
  Elem [operand1, e, esize]
  ---- ====================
  obj          idxs
  '''
  if type(Stmt.obj) == Var:
    if Stmt.obj.name in ['V', 'Vpart', 'X']:
      return VorVpartToLv(Stmt, Context)
    elif Stmt.obj.name == 'Elem':
      return ElemToSlicedArray(Stmt)
    else:
      return Stmt
  else:
    assert False, f"Unknown variable {Stmt.obj}"


# Always assume that the bitwidth returned by this function is a constant
def ComputeBitSliceWidth(Low: RoseValue, High: RoseValue, TotalBitwidth: int = None):
  # Strip any casts and size extensions away
  if isinstance(Low, RoseCastOp) \
          or isinstance(Low, RoseBVSignExtendOp) \
          or isinstance(Low, RoseBVZeroExtendOp):
    Low = Low.getOperand(0)
  if isinstance(High, RoseCastOp) \
          or isinstance(High, RoseBVSignExtendOp) \
          or isinstance(High, RoseBVZeroExtendOp):
    High = High.getOperand(0)

  # Handle easiest case first
  if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
    if TotalBitwidth != None:
      assert Low.getValue() >= 0 and Low.getValue() < TotalBitwidth
      assert High.getValue() >= 0 and High.getValue() < TotalBitwidth
    assert High.getValue() >= Low.getValue()
    return (High.getValue() - Low.getValue() + 1)

  # Either both high and low are constants or both are variables/operations.
  # Other cases are not taken into account.
  assert not isinstance(Low, RoseConstant)
  assert not isinstance(High, RoseConstant)

  # Just handle one _very_ common case where high = i + some_constant
  # Strip away any cast first
  assert isinstance(High, RoseAddOp)
  if isinstance(High.getOperand(0), RoseConstant):
    HighIndexValue = High.getOperand(1)
    ConstantHighIndex = High.getOperand(0)
  else:
    assert isinstance(High.getOperand(1), RoseConstant)
    HighIndexValue = High.getOperand(0)
    ConstantHighIndex = High.getOperand(1)
  # Strip any casts away
  if isinstance(HighIndexValue, RoseCastOp) \
          or isinstance(HighIndexValue, RoseBVSignExtendOp) \
          or isinstance(HighIndexValue, RoseBVZeroExtendOp):
    HighIndexValue = HighIndexValue.getOperand(0)
  # High index is expressed in terms of low index
  # TODO: Make this more general.

  # Just handle one _very_ common case where low = i
  assert isinstance(HighIndexValue, RoseOperation)
  assert isinstance(Low, RoseOperation)
  if Low.isSameAs(HighIndexValue):
    return (ConstantHighIndex.getValue() + 1)

  # Now handle a rare case where low = i + some_constant
  assert isinstance(Low, RoseAddOp)
  if isinstance(Low.getOperand(0), RoseConstant):
    LowIndexValue = Low.getOperand(1)
    ConstantLowIndex = Low.getOperand(0)
  else:
    assert isinstance(Low.getOperand(1), RoseConstant)
    LowIndexValue = Low.getOperand(0)
    ConstantLowIndex = Low.getOperand(1)
  # Strip any casts away
  if isinstance(LowIndexValue, RoseCastOp) \
          or isinstance(LowIndexValue, RoseBVSignExtendOp) \
          or isinstance(LowIndexValue, RoseBVZeroExtendOp):
    LowIndexValue = LowIndexValue.getOperand(0)
  assert LowIndexValue.isSameAs(HighIndexValue)
  assert ConstantHighIndex.getValue() >= ConstantLowIndex.getValue()
  return (ConstantHighIndex.getValue() - ConstantLowIndex.getValue() + 1)


def Slicing(Stmt: ArrayIndex, Context: ARMRoseContext):
  assert len(
      Stmt.slices) == 1, f"Only one dim slicing is supported, but got {Stmt.slices}"
  SR = Stmt.slices[0]
  if isinstance(SR, SliceRange):
    Low = CompileRValueExpr(SR.lo, Context)
    High = CompileRValueExpr(SR.hi, Context)
    # Context.setIndexNumberType(OriginalNumberTy)
    BitVector = CompileRValueExpr(Stmt.obj, Context)
    assert isinstance(BitVector.getType(
    ), RoseBitVectorType), f"Only bitvector type is supported, but got {Stmt}: {BitVector.getType()}"

    # Do some sanity check if possible
    if isinstance(Low, RoseConstant):
      assert Low.getValue() >= 0 and Low.getValue(
      ) < BitVector.getType().getBitwidth(), Stmt
    if isinstance(High, RoseConstant):
      assert High.getValue() >= 0 and High.getValue(
      ) < BitVector.getType().getBitwidth(), Stmt
    if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
      assert High.getValue() >= Low.getValue(), breakpoint()

    # Compute the bitwidth that is extracted in this slice
    if hasattr(SR, 'wid'):
      BitwidthValue = CompileRValueExpr(SR.wid, Context)
    else:
      Bitwidth = ComputeBitSliceWidth(
          Low, High, BitVector.getType().getBitwidth())
      BitwidthValue = RoseConstant.create(Bitwidth, Low.getType())
      Context.addSignednessInfoForValue(BitwidthValue, False)
    return BitVector, Low, High, BitwidthValue
  else:
    # assert isinstance(SR, ASTNode)
    idx = CompileRValueExpr(SR, Context)
    # Context.setIndexNumberType(OriginalNumberTy)
    BitVector = CompileRValueExpr(Stmt.obj, Context)
    # Need signedness for 1?
    return BitVector, idx, idx, RoseConstant.create(1, idx.getType())


def ComputeArrayIndexOrSliceRv(Stmt: ArrayIndex, Context: ARMRoseContext):
  (BitVector, Low, High, BitwidthValue) = Slicing(Stmt, Context)

  # Add an bitslice operation
  print(Low, High, BitwidthValue)
  # if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
  #   if Low.getValue() == 0 and High.getValue() == BitVector.getType().getBitwidth()-1:
  #     if isinstance(BitVector, RoseBVExtractSliceOp):
  #       return BitVector

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


def CompileFor(Stmt: For, Context: ARMRoseContext):
  '''
  for     e    = 0  to elements-1
      -------- -----   ----------  =====
      iterator begin      end      stmts
  '''
  assert type(
      Stmt.iterator) == Var, f"Only variable can be used as iterator, but got {Stmt.iterator}"
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
  # if Context.isCompileIndexFlagSet():
  #   ConstantVal = RoseConstant.create(Num.val, RoseIntegerType.create(32))
  #   #Context.getIndexNumberType())
  # else:
  ConstantVal = RoseConstant.create(Stmt.val, Context.NumberType)
  Context.addSignednessInfoForValue(
      ConstantVal, IsSigned=(Stmt.val < 0))
  return ConstantVal


def CompileUnaryExpr(UnaryExpr, Context: ARMRoseContext):
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
  print("Update --- ", Stmt.lhs, Stmt.rhs)
  if type(Stmt.lhs) == Var:
    # print(Stmt.lhs, Stmt.rhs, RHSExprVal)
    if hasattr(Stmt.rhs, "id"):
      ID = Stmt.rhs.id
    else:
      ID = Context.genName()
    # SET width
    Context.setLHSType(Context.getTypeForVar(Stmt.lhs.name))
    RHSExprVal = CompileRValueExpr(Stmt.rhs, Context)
    Context.removeLHSType()

    Context.addVariable(Stmt.lhs.name, ID)
    Context.addCompiledAbstraction(ID, RHSExprVal)
    print("Update ===", Stmt.lhs.name, ID, RHSExprVal, RHSExprVal.Type)
    return RHSExprVal
  elif type(Stmt.lhs) == ArrayIndex:
    LVal = SimplifyArrayIndexLv(Stmt.lhs, Context)
    if type(LVal) == Var:  # V[d] or Vpart[d]
      Context.setLHSType(Context.getTypeForVar(LVal.name))
      RHSExprVal = CompileRValueExpr(Stmt.rhs, Context)
      Context.removeLHSType()

      if LVal.id.startswith('part'):
        RHSExprVal = HandleToConcat()(
            Context.genName(), RHSExprVal, CompileRValueExpr(Var("r", Context.genName()), Context),   Context)
        Context.addAbstractionToIR(RHSExprVal)
      RetOp = RoseReturnOp.create(RHSExprVal)
      Context.addAbstractionToIR(RetOp)
      Context.setReturned(RHSExprVal)
      return RHSExprVal
    elif type(LVal) == ArrayIndex:
      # Elem[a, e, esize] -> a[esize*e:esize*e+esize-1]
      # a[1] -> a[1:1]
      # Add an bitslice operation
      (BitVector, Low, High, BitwidthValue) = Slicing(LVal, Context)
      assert type(
          BitwidthValue) == RoseConstant, f"Bitwidth must be constant, but got {type(BitwidthValue)}"
      Bitwidth = BitwidthValue.getValue()

      Context.setLHSType(('bits', Bitwidth))
      RHSExprVal = CompileRValueExpr(Stmt.rhs, Context)
      Context.removeLHSType()
      if RHSExprVal.getType().getBitwidth() < Bitwidth:
        assert False
      elif RHSExprVal.getType().getBitwidth() > Bitwidth:
        assert False
      if not Context.isValueSignKnown(BitVector):
        if Context.isValueSignKnown(RHSExprVal):
          Context.addSignednessInfoForValue(
              BitVector, Context.isValueSigned(RHSExprVal))
      LHSOp = RoseBVInsertSliceOp.create(
          RHSExprVal, BitVector, Low, High, BitwidthValue)
    else:
      raise NotImplementedError(
          f"Got Update for {type(LVal)}, LVal = {LVal}")

    if Context.isValueSignKnown(BitVector) == False \
            and Context.isValueSignKnown(RHSExprVal):
      Context.addSignednessInfoForValue(
          BitVector, Context.isValueSigned(RHSExprVal))

    # Add the op to the IR
    Context.addAbstractionToIR(LHSOp)

    # Add the operation to the context
    Context.addCompiledAbstraction(Stmt.lhs.id, LHSOp)

    return LHSOp
  else:
    print(Stmt)
    assert False


def CompileIf(IfStmt, Context: ARMRoseContext):
  # Generate a cond region
  Cond = CompileRValueExpr(IfStmt.cond, Context)
  if type(Cond) == RoseConstant:
    print("!!!!!!!!!!!!!!!!!!")
    if Cond.getValue():
      for Stmt in IfStmt.then:
        CompileStatement(Stmt, Context)
    return

  CondRegion = RoseCond.create([Cond], 1)

  # Add cond region as root abstraction
  ChildContext = ARMRoseContext()
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
    assert False, f"Got {type(CondVal)} for cond value"


def CompileMatch(MatchExpr: Match, Context: ARMRoseContext):
  # assert type(MatchExpr.val) == ArrayIndex
  # Compile the bit slice
  CompiledValue = CompileRValueExpr(MatchExpr.val, Context)
  if type(CompiledValue) == RoseConstant:
    for Case in MatchExpr.cases:
      if Case.val.val == CompiledValue.getValue():
        for Stmt in Case.body:
          CompileStatement(Stmt, Context)
        return
    assert False
  # Compile the cases
  Conditions = list()
  for Case in MatchExpr.cases:
    # Compile case value
    assert type(Case.val) == Number, f"Got {Case.val} for case value"
    # Generate a bitvector
    ConstantVal = RoseConstant.create(
        Case.val.val, CompiledValue.getType())
    Condition = RoseEQOp.create(Context.genName(
        "%cond"), CompiledValue, ConstantVal)
    # Condition is unsigned
    # Add the op to the IR
    Context.addAbstractionToIR(Condition)
    # Add the operation to the context
    Context.addCompiledAbstraction(Case.id, Condition)
    Conditions.append(Condition)

  # Generate a cond region
  CondRegion = RoseCond.create(Conditions, len(MatchExpr.cases))

  # Add cond region as root abstraction
  ChildContext = ARMRoseContext()
  ChildContext.pushRootAbstraction(CondRegion)

  # Add the generated cond region to the current context
  Context.addCompiledAbstraction(MatchExpr.id, CondRegion)

  # Add a new context for this cond region
  Context.createContext(MatchExpr.id, ChildContext)

  # Now compile all the case statements
  for Idx, Key in enumerate(CondRegion.getKeys()):
    # Add key to this cond region
    ChildContext.addKeyForCompiledAbstraction(Key, CondRegion)
    # Compile the case statements
    for Stmt in MatchExpr.cases[Idx].body:
      CompileStatement(Stmt, ChildContext)
    CondRegion = ChildContext.getRootAbstraction()

  # Pop the root cond region from the child context
  CompiledCondRegion = ChildContext.getRootAbstraction()

  # Add cond region to the root abstraction
  Context.addAbstractionToIR(CompiledCondRegion)

  # Update the compiled cond region to the current context
  Context.updateCompiledAbstraction(MatchExpr.id, CompiledCondRegion)

  # Remove the child context now
  Context.destroyContext(MatchExpr.id)


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
  assert False, f"Function {Stmt.funcname} not found"


def CompileIfElseRv(Stmt: IfElse, Context: ARMRoseContext):
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
  print(type(Cond), Cond, Cond.Type)
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
    VarDeclInit: CompileVarDeclInit,
    VarsDecl: CompileVarsDecl,
    For: CompileFor,
    Update: CompileUpdate,
    IfElse: CompileIfElse,
    If: CompileIf,
    Match: CompileMatch,
}
CompileAbstractionsRV = {
    ArrayIndex: CompileArrayIndexRv,
    Var: CompileVarRv,
    Number: CompileNumberRv,
    BinaryExpr: CompileBinaryExprRv,
    UnaryExpr: CompileUnaryExpr,
    Call: CompileCallRv,
    IfElse: CompileIfElseRv,
}
CompileAbstractionsLV = {
}


def QWQ(sss):
  def qwq(*args, **kwargs):
    raise NotImplementedError(sss)
  return qwq


def HandleToNot():
  def LamdaImplFunc(Name: str, Value: RoseValue, Context: ARMRoseContext):
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
  def LamdaImplFunc(Name: str, Value: RoseValue, Context: ARMRoseContext):
    if isinstance(Value, RoseConstant):
      Op = RoseConstant.create(-Value.getValue(), Value.getType())
      Context.addSignednessInfoForValue(Op, IsSigned=True)
    assert isinstance(Value.getType(), RoseBitVectorType)
    Op = RoseBVNegOp.create(Name, Value)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op

  return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    # 'NOT': HandleToNot,
    '-': HandleToNeg,
    '!': HandleToNot,
}


def TypePromotion(Operand1: RoseValue, Operand2: RoseValue, Context: ARMRoseContext):
  if isinstance(Operand1.getType(), RoseBitVectorType) \
          and isinstance(Operand2.getType(), RoseBitVectorType):
    return [Operand1, Operand2]  # Nothing to do
  if isinstance(Operand1.getType(), RoseBitVectorType) \
          and isinstance(Operand2.getType(), RoseIntegerType) and isinstance(Operand2, RoseConstant):
    bvliteral = RoseConstant.create(
        Operand2.getValue(), Operand1.getType())
    return [Operand1, bvliteral]
  if isinstance(Operand1.getType(), RoseIntegerType) and isinstance(Operand1, RoseConstant)\
          and isinstance(Operand2.getType(), RoseBitVectorType):
    bvliteral = RoseConstant.create(
        Operand1.getValue(), Operand2.getType())
    return [bvliteral, Operand2]
  return [Operand1, Operand2]


def ComputeConstant(op: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
  if isinstance(Operand1, RoseConstant) and isinstance(Operand2, RoseConstant):
    if op in ['+', '-', '*', '<<', '>>']:
      assert isinstance(Operand1.getType(), RoseIntegerType) and isinstance(
          Operand2.getType(), RoseIntegerType)
      val = eval(f"{Operand1.getValue()} {op} {Operand2.getValue()}")
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
  return None


def HandleToAdd():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    if (z := ComputeConstant('+', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('-', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('*', Operand1, Operand2, Context)) != None:
      return z
    Operands = TypePromotion(Operand1, Operand2, Context)
    [Operand1, Operand2] = Operands
    if isinstance(Operand1.getType(), RoseBitVectorType) \
            and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVMulOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op,
                                        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    print(Operand1, Operand2)
    print(Operand1.getType(), Operand2.getType())
    return RoseMulOp.create(Name, Operands)

  return LamdaImplFunc


def HandleToDiv():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    if (z := ComputeConstant('//', Operand1, Operand2, Context)) != None:
      return z
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
    if (z := ComputeConstant('==', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('!=', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('<', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('<=', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('>', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    if (z := ComputeConstant('>=', Operand1, Operand2, Context)) != None:
      return z
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
                    Context: ARMRoseContext):
    Operands = TypePromotion(Operand1, Operand2, Context)
    [Operand1, Operand2] = Operands
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType), breakpoint()
    Op = RoseBVAshrOp.create(Name, Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
    return Op

  return LamdaImplFunc


def HandleToLshr():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    # if (z := ComputeConstant('<<', Operand1, Operand2, Context)) != None:
    #     return z
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    Op = RoseBVLshrOp.create(Name, Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
    return Op

  return LamdaImplFunc


def HandleToShr():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    if Context.isValueSigned(Operand1):
      return HandleToAshr()(Name, Operand1, Operand2, Context)
    else:
      return HandleToLshr()(Name, Operand1, Operand2, Context)
    

  return LamdaImplFunc


def HandleToShl():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    if (z := ComputeConstant('<<', Operand1, Operand2, Context)) != None:
      return z
    Operands = TypePromotion(Operand1, Operand2, Context)
    [Operand1, Operand2] = Operands
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    Op = RoseARMShlOp.create(Name, Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
    return Op

  return LamdaImplFunc


def HandleToConcat():
  def LamdaImplFunc(Name: str, Operand1: RoseValue, Operand2: RoseValue,
                    Context: ARMRoseContext):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    Op = RoseBVConcatOp.create(Name, Operand1, Operand2)
    if isinstance(Operand1, RoseArgument) and isinstance(Operand2, RoseArgument):
      Op.isPureArgs = True  # Consider as arguments
    # assert Context.isValueSigned(
    #     Operand1) == Context.isValueSigned(Operand2), (Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(
        Operand1) or Context.isValueSigned(Operand2))
    return Op

  return LamdaImplFunc


BinaryOps = {
    '+': HandleToAdd,
    '-': HandleToSub,
    '*': HandleToMul,
    '/': HandleToDiv,
    'DIV': HandleToDiv,
    '%': HandleToMod,
    '<': HandleToLessThan,
    '<=': HandleToLessThanEqual,
    '>': HandleToGreaterThan,
    '>=': HandleToGreaterThanEqual,
    '==': HandleToEqual,
    '!=': HandleToNotEqual,
    '>>': HandleToShr,
    '<<': HandleToShl,
    '&': HandleToAnd,
    '|': HandleToOr,
    'AND': HandleToAnd,
    'OR': HandleToOr,
    'EOR': HandleToXor,
    ':': HandleToConcat,
}


def HandleToInt(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value, unsigned] = Args
    print("unsigned: ", unsigned)
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert type(unsigned) == RoseConstant, "Only constant is supported."
    # Consider using BVSizeExtension?
    if unsigned.getValue():
      Op = RoseBVZeroExtendOp.create(Name, Value, IntSimWidth)
      Context.addSignednessInfoForValue(Op, IsSigned=False)
    else:
      Op = RoseBVSignExtendOp.create(Name, Value, IntSimWidth)
      Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  return LamdaImplFunc


def HandleToSInt(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    Op = RoseBVSignExtendOp.create(Name, Value, IntSimWidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  return LamdaImplFunc


def HandleToUInt(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    Op = RoseBVZeroExtendOp.create(Name, Value, IntSimWidth)
    Context.addSignednessInfoForValue(Op, IsSigned=False)
    return Op
  return LamdaImplFunc


def HandleToZeroExtend(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
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


def HandleToSignExtend(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value, BitwidthValue] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert type(BitwidthValue) == RoseConstant
    Bitwidth = BitwidthValue.getValue()
    if Value.getType().getBitwidth() < Bitwidth:
      Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
      Context.addSignednessInfoForValue(Op, IsSigned=True)
      return Op
    else:
      assert Value.getType().getBitwidth() == Bitwidth
      return Value

  return LamdaImplFunc


def HandleToSpecialSignExtend(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    # Increase the bitwidth by 2x.
    Bitwidth = 2 * Value.getType().getBitwidth()
    Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op

  return LamdaImplFunc


def HandleToMin(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
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
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
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
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
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


def HandleToSignedSatQ(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value, satsize] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert isinstance(satsize, RoseConstant)
    assert Value.getType().getBitwidth() >= satsize.getValue()
    Op = RoseBVSSaturateOp.create(Name, Value, satsize.getValue())
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  return LamdaImplFunc


def HandleToUnsignedSatQ(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value, satsize] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert isinstance(satsize, RoseConstant)
    assert Value.getType().getBitwidth() >= satsize.getValue()
    Op = RoseBVUSaturateOp.create(Name, Value, satsize.getValue())
    Context.addSignednessInfoForValue(Op, IsSigned=False)
    return Op
  return LamdaImplFunc


def HandleToSSaturate(Bitwidth: int):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert Value.getType().getBitwidth() >= Bitwidth
    Op = RoseBVSSaturateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op

  return LamdaImplFunc


def HandleToUSaturate(Bitwidth: int):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert Value.getType().getBitwidth() >= Bitwidth
    Op = RoseBVUSaturateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=False)
    return Op

  return LamdaImplFunc


def HandleToTruncate(Bitwidth: int):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
    assert Value.getType().getBitwidth() > Bitwidth
    Op = RoseBVTruncateLowOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(
        Op, IsSigned=Context.isValueSigned(Value))
    return Op

  return LamdaImplFunc


def HandleToSpecialTruncate(_):
  def LamdaImplFunc(Name: str, Args: list, Context: ARMRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType)
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


def HandleToNotFunc(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) == 1
    [Value] = Operands
    assert isinstance(Value.getType(), RoseBitVectorType)
    Op = RoseBVNotOp.create(Name, Value)
    Context.addSignednessInfoForValue(
        Op, IsSigned=Context.isValueSigned(Value))
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


def HandleToIsZero(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) == 1
    if isinstance(Operands[0].getType(), RoseBitVectorType):
      Op = RoseBVZeroOp.create(Name, Operands[0])
      Context.addSignednessInfoForValue(Op, IsSigned=False)
      return Op
    assert False

  return LamdaImplFunc


def HandleToROL(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) == 2
    Operands = TypePromotion(Operands[0], Operands[1], Context)
    if isinstance(Operands[0].getType(), RoseBitVectorType) and \
            isinstance(Operands[1].getType(), RoseBitVectorType):
      Op = RoseBVRolOp.create(Name, Operands[0], Operands[1])
      Context.addSignednessInfoForValue(Op, Context.isValueSigned(
          Operands[0]) or Context.isValueSigned(Operands[1]))
      return Op
    assert False

  return LamdaImplFunc


def HandleToROR(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) == 2
    Operands = TypePromotion(Operands[0], Operands[1], Context)
    if isinstance(Operands[0].getType(), RoseBitVectorType) and \
            isinstance(Operands[1].getType(), RoseBitVectorType):
      Op = RoseBVRorOp.create(Name, Operands[0], Operands[1])
      Context.addSignednessInfoForValue(Op, Context.isValueSigned(
          Operands[0]) or Context.isValueSigned(Operands[1]))
      return Op
    assert False

  return LamdaImplFunc


def HandleToOnes(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) <= 1
    if len(Operands) == 0:
      wid = Context.getLHSType()[1]
      assert type(wid) == int
      Op = RoseConstant((1 << wid) - 1, RoseBitVectorType.create(wid))
      Context.addSignednessInfoForValue(Op, False)
      return Op
    if len(Operands) == 1:
      assert type(Operands[0]) == RoseConstant
      wid = Operands[0].getValue()
      assert type(wid) == int
      Op = RoseConstant((1 << wid) - 1, RoseBitVectorType.create(wid))
      Context.addSignednessInfoForValue(Op, False)
      return Op

  return LamdaImplFunc


def HandleToZeros(_):
  def LamdaImplFunc(Name: str, Operands: list, Context: ARMRoseContext):
    assert len(Operands) == 0
    wid = Context.getLHSType()[1]
    assert type(wid) == int
    Op = RoseConstant(0, RoseBitVectorType.create(wid))
    Context.addSignednessInfoForValue(Op, False)
    return Op

  return LamdaImplFunc


# Builtin functions
Builtins = {
    'Saturate32': HandleToSSaturate(32),
    'Saturate16': HandleToSSaturate(16),
    'Saturate8': HandleToSSaturate(8),

    'SaturateU32': HandleToUSaturate(32),
    'SaturateU16': HandleToUSaturate(16),
    'SaturateU8': HandleToUSaturate(8),

    # 'ZeroExtend16': HandleToZeroExtend(16),
    # 'ZeroExtend32': HandleToZeroExtend(32),
    # 'ZeroExtend64': HandleToZeroExtend(64),

    # 'SignExtend16': HandleToSignExtend(16),
    # 'SignExtend32': HandleToSignExtend(32),
    # 'SignExtend64': HandleToSignExtend(64),
    'Signed': HandleToSpecialSignExtend(None),

    'Truncate8': HandleToTruncate(8),
    'Truncate16': HandleToTruncate(16),
    'Truncate32': HandleToTruncate(32),
    'Truncate64': HandleToTruncate(64),
    'TRUNCATE': HandleToSpecialTruncate(None),

    'MIN': HandleToMin(None),
    'MAX': HandleToMax(None),

    'ABS': HandleToAbs(None),
    'REMAINDER': None,
    # above for x86
    'Int': HandleToInt(None),
    'UInt': HandleToUInt(None),
    'ZeroExtend': HandleToZeroExtend(None),
    'SignExtend': HandleToSignExtend(None),
    'SInt': HandleToSInt(None),
    'SatQ': HandleToSatQ(None),
    'SignedSatQ': HandleToSignedSatQ(None),
    'UnsignedSatQ': HandleToUnsignedSatQ(None),
    'Ones': HandleToOnes(None),
    'Zeros': HandleToZeros(None),
    'IsZero': HandleToIsZero(None),
    'Min': HandleToMin(None),
    'Max': HandleToMax(None),
    'Abs': HandleToAbs(None),
    'BitCount': QWQ('BitCount'),
    'CountLeadingSignBits': QWQ('CountLeadingSignBits'),
    'CountLeadingZeroBits': QWQ('CountLeadingZeroBits'),
    'UnsignedRecipEstimate': QWQ('UnsignedRecipEstimate'),
    'UnsignedRSqrtEstimate': QWQ('UnsignedRSqrtEstimate'),
    'NOT': HandleToNotFunc(None),
    'Reduce': QWQ('Reduce'),
    'ROL': HandleToROL(None),
    'ROR': HandleToROL(None),
    'LSL': QWQ('LSL'),
    'LSR': QWQ('LSR'),
}
