
from RoseValue import RoseValue
from RoseType import RoseType
from RoseAbstractions import RoseFunction, RoseForLoop
from RoseConstants import RoseConstant, RoseUndefValue, RoseUndefRegion
from RoseArgument import RoseArgument
from RoseOperation import RoseOperation
from RoseOperations import *

from AST import *
from x86Types import x86Types

import math
from copy import deepcopy


MaxVectorLength = 512

# This is a generic context that could be used across
# different architectures.
class RoseContext:
  def __init__(self):
    self.CompiledAbstractions = dict()   # ID --> Some Rose abstraction
    # Track the contexts we encounter
    self.ParentContext = None
    self.Contexts = {}   # ID --> child context
    # Heirarchical abstractions such as functions, loops and cond regions.
    # Blocks are not dealt with by this compiler.
    self.RootAbstractions = list()
    # Variable names are associated with their IDs
    self.Variables = {}    # Name --> ID
  
  def isCompiledAbstraction(self, ID : str):
    if ID in self.CompiledAbstractions:
      return True
    return False
  
  def addCompiledAbstraction(self, ID : str, Abstraction):
    self.CompiledAbstractions[ID] = Abstraction
  
  def updateCompiledAbstraction(self, ID : str, NewAbstraction):
    assert ID in self.CompiledAbstractions
    self.CompiledAbstractions[ID] = NewAbstraction

  def getCompiledAbstractionForID(self, ID : str):
    assert ID in self.CompiledAbstractions
    return self.CompiledAbstractions[ID]
  
  def getIDForCompiledAbstraction(self, Abstaction):
    for ID, Value in self.CompiledAbstractions.items():
      if Value == Abstaction:
        return ID
    assert False
  
  def addVariable(self, Name : str, ID : str):
    self.Variables[Name] = ID
  
  def getVariableID(self, Name : str):
    assert Name in self.Variables
    return self.Variables[Name]
  
  def isVariableDefined(self, Name : str):
    if Name in self.Variables:
      return True
    return False
  
  def createContext(self, ID : str, ChildContext):
    assert isinstance(ChildContext, RoseContext)
    ChildContext.setParentContext(self)
    self.Contexts[ID] = ChildContext
  
  def destroyContext(self, ID : str):
    self.Contexts[ID] = None

  def getContext(self, ID : str):
    return self.Contexts.get(ID, None)
  
  def pushRootAbstraction(self, Abstraction):
    self.RootAbstractions.append(Abstraction)
    
  def popRootAbstraction(self):
    return self.RootAbstractions.pop()
  
  def getRootAbstraction(self):
    return self.RootAbstractions[len(self.RootAbstractions) - 1]
  
  def setParentContext(self, Context):
    assert isinstance(Context, RoseContext)
    self.ParentContext = Context

  def getParentContext(self):
    return self.ParentContext
  
  def isRootContext(self):
    return self.ParentContext == None
  
  def getCompiledAbstractions(self):
    return self.CompiledAbstractions

  def copyAbstractionsFromParent(self):
    assert not self.isRootContext()
    assert isinstance(self.ParentContext, RoseContext)
    self.CompiledAbstractions = deepcopy(self.Parent.getCompiledAbstractions())


# This defines rules specifically for x86 to RoseIR convertion
class x86RoseContext(RoseContext):
  def __init__(self):
    # Cache function definitions. This is needed because functions are
    # compiled when a call is compiled.
    self.FunctionDefs = dict()  # Function name --> FuncDef
    super().__init__()
  
  def addFunctionDef(self, FunctionDef):
    assert(type(FunctionDef) == FuncDef)
    self.FunctionDefs[FunctionDef.name] = FunctionDef
  
  def getFunctionDef(self, Name : str):
    return self.FunctionDefs[Name]

  def createContext(self, ID : str, ChildContext):
    assert isinstance(ChildContext, x86RoseContext)
    assert self.isCompiledAbstraction(ID)
    Abstraction = self.getCompiledAbstractionForID(ID)
    if isinstance(Abstraction, RoseFunction):
      # A function accepts no external variables besides arguments
      super().createContext(ID, ChildContext)
    elif isinstance(Abstraction, RoseForLoop):
      # Copy all the compiled abstractions from this context to the child
      ChildContext.copyAbstractionsFromParent()
      super().createContext(ID, ChildContext)
  
  def destroyContext(self, ContextName : str):
    if isinstance(self.getRootAbstraction(), RoseFunction):
      super().destroyContext(ContextName)
    elif isinstance(self.getRootAbstraction(), RoseForLoop):
      super().destroyContext(ContextName)


def CompileNumber(Num, Context : x86RoseContext):
  print("COMPILE NUMBER")
  print("NUM:")
  print(Num)
  if isinstance(Num.val, int):
    ConstantVal = RoseConstant.create(Num.val, RoseType.getIntegerTy(32))
    return ConstantVal
  else:
    # TODO: These needs fixing
    NonConstantVal = Num.val
    return NonConstantVal


def CompileVar(Variable, Context):
  print("COMPILE VARIABLE")
  print("VARIABLE:")
  print(Variable)
  # Check if the variable is already defined and cached. If yes, just return that.
  if Context.isVariableDefined(Variable.name):
    ID = Context.getVariableID(Variable.name)
    return Context.getCompiledAbstractionForID(ID)

  # Create a new rose value. We do not know the bitwidth, so use the maximum bitwidth
  Var = RoseValue.create(Variable.name, RoseType.getBitVectorTy(MaxVectorLength))

  # Add the variable info to the context
  Context.addVariable(Variable.name, Variable.id)
  Context.addCompiledAbstraction(Variable.id, Var)
  
  return Var


def CompileBitSlice(BitSliceExpr, Context : RoseContext):
  print("COMPILE BITSLICE")
  print("BITSLICE:")
  print(BitSliceExpr)
  # First compile low and high expressions
  print("COMPILING LOW")
  Low = CompileExpression(BitSliceExpr.lo, Context)
  print("COMPILED LOW")
  Low.print()

  # Special case for the magic variable 'MAX' 
  print("COMPILING HIGH")
  if (type(BitSliceExpr.hi) == Var and BitSliceExpr.hi.name == 'MAX'):
    High = RoseConstant.create(MaxVectorLength - 1, RoseType.getIntegerTy(32))
  else:
    High = CompileExpression(BitSliceExpr.hi, Context)
  print("COMPILED HIGH")
  High.print()
  
  print("COMPILING BITVECTOR")
  BitVector = CompileExpression(BitSliceExpr.bv, Context)
  print("COMPILED BITVECTOR")
  BitVector.print()
  assert BitVector.getType().isBitVectorTy()
  print("BITVEVTOR BITWODTH:")
  print(BitVector.getType().getBitwidth())

  # Do some sanity check if possible
  if isinstance(Low, RoseConstant):
    assert Low.getValue() >= 0 and Low.getValue() < BitVector.getType().getBitwidth()
  if isinstance(High, RoseConstant):
    assert High.getValue() >= 0 and High.getValue() < BitVector.getType().getBitwidth()
  if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
    assert High.getValue() >= Low.getValue()

  # Add an bitslice operation
  Operation = RoseExtractSliceOp.create(BitSliceExpr.id, BitVector, Low, High)
  print("BIT SLICE EXTRACT OP:")
  Operation.print()

  # Add the op to the IR
  RootAbstraction = Context.popRootAbstraction()
  print("ROOT ABSTRACTION BEFORE")
  print(RootAbstraction)
  RootAbstraction.print()
  RootAbstraction.addAbstraction(Operation)
  print("ROOT ABSTRACTION AFTER:")
  print(RootAbstraction)
  RootAbstraction.print()
  Context.pushRootAbstraction(RootAbstraction)

  # Add the operation to the context
  Context.addCompiledAbstraction(BitSliceExpr.id, Operation)

  return Operation


def CompileUpdate(Update, Context : x86RoseContext):
  print("COMPILE UPDATE")
  print("UPDATE:")
  print(Update)
  print("COMPILING RHS")
  RHSExprVal = CompileExpression(Update.rhs, Context)
  print(type(RHSExprVal))
  print("COMPILED RHS")
  RHSExprVal.print()

  if type(Update.lhs) == Var:
    # Get the ID associated with the RHS value
    ID = Context.getIDForCompiledAbstraction(RHSExprVal)
    # Update the ID associated with this variable name
    Context.addVariable(Update.lhs.name, ID)
    return RHSExprVal

  # We should be compiling the bitslice as LHS now
  assert type(Update.lhs) == BitSlice
  # Compile the LHS Bitslice
  Low = CompileExpression(Update.lhs.lo, Context)
  if (type(Update.lhs.hi) == Var and Update.lhs.hi.name == 'MAX'):
    High = RoseConstant.create(MaxVectorLength - 1, RoseType.getIntegerTy(32))
  else:
    High = CompileExpression(Update.lhs.hi, Context)
  BitVector = CompileExpression(Update.lhs.bv, Context)
  # Do some sanity check if possible
  if isinstance(Low, RoseConstant):
    assert Low.getValue() >= 0 and Low.getValue() < BitVector.getType().getBitwidth()
  if isinstance(High, RoseConstant):
    assert High.getValue() >= 0 and High.getValue() < BitVector.getType().getBitwidth()
  if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
    assert High.getValue() >= Low.getValue()
  # Add an bitslice operation
  LHSOp = RoseInsertSliceOp.create(RHSExprVal, BitVector, Low, High)
  print("BIT SLICE INSERT OP:")
  LHSOp.print()

  # Add the op to the IR
  RootAbstraction = Context.popRootAbstraction()
  print("----ROOT ABSTRACTION BEFORE")
  print(RootAbstraction)
  RootAbstraction.print()
  RootAbstraction.addAbstraction(LHSOp)
  print("------ROOT ABSTRACTION AFTER:")
  print(RootAbstraction)
  RootAbstraction.print()
  Context.pushRootAbstraction(RootAbstraction)

  # Add the operation to the context
  Context.addCompiledAbstraction(Update.lhs.id, LHSOp)

  return LHSOp
  

def CompileSelect(Select, Context : x86RoseContext):
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(Select.id):
    return Context.getCompiledAbstractionForID(Select.id)
  
  print("COMPILE Select EXPRESSION")
  print("SELECT EXPR:")
  print(Select)
  # Compile the operation
  Cond = CompileExpression(Select.cond, Context)
  Then = CompileExpression(Select.then, Context)
  Otherwise = CompileExpression(Select.otherwise, Context)
  Operation = RoseSelectOp.create(Select.id, Cond, Then, Otherwise)
  # Add the operation to the IR
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)
  # Add the operation to the context
  Context.addCompiledAbstraction(Select.id, Operation)
  return Operation


def CompileUnaryExpr(UnaryExpr, Context : x86RoseContext):
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(UnaryExpr.id):
    return Context.getCompiledAbstractionForID(UnaryExpr.id)
  
  print("COMPILE UNARY EXPRESSION")
  print("UNARY EXPR:")
  print(UnaryExpr)
  # Compile the operation
  Value = CompileExpression(UnaryExpr.a, Context)
  Operation = UnaryOps[UnaryExpr.op](UnaryExpr.id, Value)
  # Add the operation to the IR
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)
  # Add the operation to the context
  Context.addCompiledAbstraction(UnaryExpr.id, Operation)
  return Operation


def CompileBinaryExpr(BinaryExpr, Context : x86RoseContext):
  # Compile the operands
  Operand1 = CompileExpression(BinaryExpr.a, Context)
  Operand2 = CompileExpression(BinaryExpr.b, Context)

  # Compile the binary operation
  Operation = BinaryOps[BinaryExpr.op](BinaryExpr.id, Operand1, Operand2)

  # Add the operation to the IR
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)

  # Add the operation to the context
  Context.addCompiledAbstraction(UnaryExpr.id, Operation)
  return Operation


def CompileReturn(ReturnStmt, Context : x86RoseContext):
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(ReturnStmt.id):
    return Context.getCompiledAbstractionForID(ReturnStmt.id)  
  
  print("COMPILE RETURN EXPRESSION")
  print("RETURN EXPR:")
  print(ReturnStmt)
  # Compile the return op
  Operand = CompileExpression(ReturnStmt.val, Context)
  Operation = RoseReturnOp.create(Operand)
  # Add the operation to the IR
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)
  # Add the operation to the context (although this is unnecessary)
  Context.addCompiledAbstraction(ReturnStmt.id, Operation)
  return Operation


def CompileCall(CallStmt, Context : x86RoseContext):
  # If the call is compiled, no need to recompile
  if Context.isCompiledAbstraction(CallStmt.id):
    Call = Context.getCompiledAbstractionForID(CallStmt.id)
    if Call.getType() == RoseType.isVoidTy():
      return 
    else:
      return Call

  print("COMPILE CALL")
  assert type(CallStmt.func) == str
  FunctionName = CallStmt.func

  # Compile arguments first
  print("COMPILE ARGUMENTS")
  ArgValuesList = list()
  for Arg in CallStmt.args:
    CompiledArg = CompileExpression(Arg, Context)
    # Argument type cannot be undefined or void
    assert not CompiledArg.getType().isVoidTy() and not CompiledArg.getType().isUndefTy()
    ArgValuesList.append(CompiledArg)
  print("ARGUMENTS COMPILED")

  # Check if this is a call to a builtin function
  if FunctionName in Builtins:
    Operation = Builtins[FunctionName](CallStmt.id, ArgValuesList)
    # Add the operation to the IR
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.addAbstraction(Operation)
    Context.pushRootAbstraction(RootAbstraction)
    # Add the operation to the context
    Context.addCompiledAbstraction(CallStmt.id, Operation)
    return Operation

  # This is a function call
  FunctionDef = Context.getFunctionDef(FunctionName)
  assert len(FunctionDef.params) == len(CallStmt.args)

  # Check if we are compiling this function for the first time
  if Context.isCompiledAbstraction(FunctionDef.id) == False:
    print("COMPILING FUNCTION")
    ChildContext = x86RoseContext()
    FuncArgList = []
    for Index  in range(len(FunctionDef.params)):
      Param = FunctionDef.params[Index]
      Arg = ArgValuesList[Index]
      if type(Param) == BitSlice:
        # Some sanity checks
        assert type(Param.bv) == Var
        assert type(Param.lo) == Number
        assert type(Param.hi) == Number
        assert Param.lo.val == 0
        ParamName = Param.bv.name
        ParamWidth = Param.hi.val + 1
      else:
        assert type(Param) == Var
        ParamName = Param.name
        ParamWidth = Arg.getType().getBitwidth()
      assert Arg.getType().getBitwidth() == ParamWidth
      ArgVal = RoseArgument.create(ParamName, Arg.getType(), RoseUndefValue(), Index)
      ChildContext.addVariable(ParamName, Param.id)
      FuncArgList.append(ArgVal)
      print("PARAM NAME:")
      print(ParamName)
    
    # Compile the function and its arguments
    print("GENERATE FUNCTION")
    Function = RoseFunction.create(FunctionName, FuncArgList, RoseType.getUndefTy())
    print("FUNCTION:")
    print(Function)
    print(FunctionDef.params)
    print(type(FunctionDef.params))

    # Add arguments to the child context
    for Index  in range(len(FunctionDef.params)):
      Param = FunctionDef.params[Index]
      Arg = Function.getArg(Index)
      ChildContext.addCompiledAbstraction(Param.id, Arg)
    print("ADDED ARGUMENTS TO THE CHILD CONTEXT")
    
    # Add the generated function to the current context
    Context.addCompiledAbstraction(FunctionDef.id, Function)
    
    # Add this function as the root abstraction for this this child context
    ChildContext.pushRootAbstraction(Function)

    # Create a new context for this funtcion
    Context.createContext(FunctionDef.id, ChildContext)
    print("FUNCTION ADDED TO CONTEXT")
    
    # Compile the function body
    ReturnValue = RoseUndefValue()
    for Stmt in FunctionDef.body:
      if type(Stmt) == Return:
        ReturnValue = CompileExpression(Stmt, ChildContext)
        break
      CompileStatement(Stmt, ChildContext)
    assert ReturnValue != RoseUndefValue()
    print("FUNCTION GENERATED")

    # Pop the root function from the child context 
    CompiledFunction = ChildContext.popRootAbstraction()

    # Set the return value for this function
    CompiledFunction.setRetVal(ReturnValue)

    # Add this function to the root abstraction and update context
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.addAbstraction(CompiledFunction)
    Context.pushRootAbstraction(RootAbstraction)

    # Update the compiled function in this context now
    Context.updateCompiledAbstraction(FunctionDef.id, CompiledFunction)

    # Destroy the child context now
    Context.destroyContext(FunctionDef.id)
    print("COMPILED FUNCITON:")
    CompiledFunction.print()

  # Compile call statement now.
  FunctionCall = RoseCallOp.create(CallStmt.id, Function, ArgValuesList)
  print(FunctionCall)
  # Add the op to the IR
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(FunctionCall)
  Context.pushRootAbstraction(RootAbstraction)
  print("====ROOT ABSTRACTION")
  print(RootAbstraction)
  RootAbstraction.print()
  # Add the operation to the context
  Context.addCompiledAbstraction(CallStmt.id, FunctionCall)
  print("COMPILED CALL OPERATION:")
  FunctionCall.print()

  return FunctionCall


# Function will be compiled later
def CompileFunction(FunctionDef, Context : x86RoseContext):
  assert(type(FunctionDef) == FuncDef)
  print("COMPILE FUNCTION")
  print("FUNCDEF:")
  print(FunctionDef)
  # Add the function definiton to the current context
  # This function will be compiled later.
  Context.addFunctionDef(FunctionDef)


def CompileForLoop(ForStmt, Context : x86RoseContext):
  # If the loop has been compiled already, no need to recomplie
  if Context.isCompiledAbstraction(ForStmt.id):
    return

  # Generate an empty for loop
  One = RoseConstant.create(1, RoseType.getIntegerTy(32))
  MinusOne = RoseConstant.create(-1, RoseType.getIntegerTy(32))
  Step = One if ForStmt.inc else MinusOne
  Begin = CompileExpression(ForStmt.begin, Context)
  End = CompileExpression(ForStmt.end, Context)
  Loop = RoseForLoop.create(ForStmt.iterator.name, Begin, End, Step)

  # Add loop as root abstraction 
  ChildContext = x86RoseContext()
  ChildContext.pushRootAbstraction(Loop)

  # Add the generated loop to the current context
  Context.addCompiledAbstraction(ForStmt.id, Loop)

  # Add a new context for this loop
  Context.createContext(ForStmt.id, ChildContext)

  # Add the iterator to the child context
  ChildContext.addCompiledAbstraction(ForStmt.iterator.id, Loop.getIterator())

  # Comoile all the statements in this loop
  for Stmt in ForStmt.body:
    CompileStatement(Stmt, ChildContext)
  
  # Pop the root loop from the child context 
  CompiledLoop = ChildContext.popRootAbstraction()

  # Add loop to the root abstraction
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(CompiledLoop)
  Context.pushRootAbstraction(RootAbstraction)

  # Update the compiled loop to the current context
  Context.updateCompiledAbstraction(ForStmt.id, CompiledLoop)

  # Remove the child context now
  Context.destroyContext(ForStmt.id)


def CompileIf(IfStmt, Context : x86RoseContext):
  Cond = CompileExpression(IfStmt.cond, Context)
  for Stmt in IfStmt.then:
    CompileStatement(Stmt, Context)
  for Stmt in IfStmt.otherwise:
    CompileStatement(Stmt, Context)


def CompileExpression(Expr, Context : x86RoseContext):
  print("COMPILE EXPRESSION")
  print("EXPR:")
  print(Expr)
  ExprTy = type(Expr)
  CompiledExpr = CompileAbstractions[ExprTy](Expr, Context)
  return CompiledExpr


def CompileStatement(Stmt, Context : x86RoseContext):
  StmtTy = type(Stmt)
  print("STATEMENT:")
  print(Stmt)
  print("STATEMENT TYPE:")
  print(StmtTy)
  return CompileAbstractions[StmtTy](Stmt, Context)


def CompileSemantics(Sema):
  # Create the root context
  RootContext = x86RoseContext()
  OutParams = []
  ReturnsVoid = False
  ParamValues = []
  ParamsIDs = []
  for Index, Param in enumerate(Sema.params):
    IsOutParam = False
    if Param.type.endswith('*'):
        ParamType = x86Types[Param.type[:-1].strip()]
        OutParams.append(Param.name)
        IsOutParam = True
    else:
        ParamType = x86Types[Param.type]
    # Create a new rosette value
    ParamVal = RoseArgument.create(Param.name, ParamType, RoseUndefValue(), Index)
    ParamVal.print()
    if not IsOutParam:
      ParamsIDs.append(Param.id)
      ParamValues.append(ParamVal)

  ReturnsMask = Sema.rettype.startswith('__mmask')
  if Sema.rettype != 'void':
    RetType = x86Types[Sema.rettype]
    if not ReturnsMask:
      print("adding dst to context")
      RetValue = RoseValue.create('dst', RetType)
    else:
      print("adding k to context")
      RetValue = RoseValue.create('k', RetType)
  else:
    ReturnsVoid = True
    RetType = RoseType.getVoidTy()
    RetValue = RoseValue.create("", RetType)
    
  # Define a Rose function
  print("ParamValues:")
  print(ParamValues)
  RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetType)
  RootFunction.setRetValName(RetValue.getName())

  # Add return value to the root context
  ReturnID = "return." + RootFunction.getReturnValue().getName()
  RootContext.addVariable(RootFunction.getReturnValue().getName(), ReturnID)
  RootContext.addCompiledAbstraction(ReturnID, RootFunction.getReturnValue())

  # Add the parameter values to the root context
  assert len(ParamsIDs) == RootFunction.getNumArgs()
  for Index in range(RootFunction.getNumArgs()):
    RootContext.addVariable(RootFunction.getArg(Index).getName(), ParamsIDs[Index])
    RootContext.addCompiledAbstraction(ParamsIDs[Index], RootFunction.getArg(Index))
  
  # Add the function to the context
  RootContext.addCompiledAbstraction(Sema.intrin, RootFunction)
  
  # Add the root function now
  RootContext.pushRootAbstraction(RootFunction)

  # Compile all the statements
  CompiledRetVal = RoseUndefValue()
  for Stmt in Sema.spec:
    if type(Stmt) == Return:
      #Dst = Update(lhs=Var('dst'), rhs=Stmt.val)
      #CompileStatement(Dst, RootContext)
      CompiledRetVal = CompileStatement(Stmt, RootContext)
      break
    CompileStatement(Stmt, RootContext)
  
  # Get the compiled function
  CompiledFunction = RootContext.popRootAbstraction()

  # See if the function returns anything, if not add a return op
  if CompiledRetVal == RoseUndefValue():
      Op = RoseReturnOp.create(RetValue)
      # NO meed to add this operation to the context but add it to the function
      CompiledFunction.addAbstraction(Op)

  print("\n\n\n\n\n")
  CompiledFunction.print()

  return CompiledFunction


CompileAbstractions = {
  For: CompileForLoop,
  Number: CompileNumber,
  Var: CompileVar,
  Return : CompileReturn,
  FuncDef: CompileFunction,
  Call: CompileCall,
  BitSlice: CompileBitSlice,
  Update: CompileUpdate,
  UnaryExpr: CompileUnaryExpr,
  Select: CompileSelect,
  If: CompileIf,
  BinaryExpr: CompileBinaryExpr,
  #While: compile_while,
  #Match: CompileMatch,
  #Lookup: compile_lookup,
}


def HandleToSignExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseSignExtendOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToZeroExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseZeroExtendOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


# Builtin functions
Builtins = {
  #'Saturate32': gen_saturation_func(32, True),
  #'Saturate16': gen_saturation_func(16, True),
  #'Saturate8': gen_saturation_func(8, True),

  #'SaturateU32': gen_saturation_func(32, False),
  #'SaturateU16': gen_saturation_func(16, False),
  #'SaturateU8': gen_saturation_func(8, False),

  'ZeroExtend16': HandleToZeroExtend(16),
  'ZeroExtend32': HandleToZeroExtend(32),
  'ZeroExtend64': HandleToZeroExtend(64),

  'SignExtend16': HandleToSignExtend(16),
  'SignExtend32': HandleToSignExtend(32),
  'SignExtend64': HandleToSignExtend(64),

  #'APPROXIMATE': lambda args, _: args[0], # noop

  #'ABS': builtin_abs,

  #'concat': builtin_concat,
  #'PopCount': builtin_popcount,
  #'POPCNT': builtin_popcount,
  #'select': builtin_select,
}


def HandleToNot():
  def LamdaImplFunc(Name : str, Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseNotOp.create(Name, Value)
  
  return LamdaImplFunc


def HandleToNeg():
  def LamdaImplFunc(Name : str, Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseNegOp.create(Name, Value)
  
  return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
}


def HandleToAdd():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseAddOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToSub():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseSubOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToMul():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseMulOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToDiv():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseSdivOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToOr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return HandleToOr.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToXor():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseXorOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToAnd():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    Operands = [Operand1, Operand2]
    return RoseAndOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToLessThan():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseSltOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLessThanEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseSleOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToGreaterThan():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseSgtOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToGreaterThanEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseSgeOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToAshr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseAshrOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLshr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseLshrOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


BinaryOps = {
    '+': HandleToAdd,
    '-' : HandleToSub,
    '*' : HandleToMul,
    '/' : HandleToDiv,
    '<' : HandleToLessThan,
    '<=' : HandleToLessThanEqual,
    '>' : HandleToGreaterThan,
    '>=' : HandleToGreaterThanEqual,
    #'!=' : binary_float_cmp('ne'),
    '>>' : HandleToAshr,
    '<<' : HandleToLshr,
    '&' : HandleToAnd,
    '|' : HandleToOr,
    'AND' : HandleToAnd,
    'OR' : HandleToOr,
    'XOR' : HandleToXor,
}


# Strides definitions
Strides = {
  'bit': 1,
  'byte': 8,
  'word': 16,
  'dword': 32,
  'qword': 64,
  'm128': 128,
}



if __name__ == '__main__':
  from PseudoCodeParser import get_spec_from_xml
  import xml.etree.ElementTree as ET

  sema = '''
<intrinsic tech="SSE2" vexEq="TRUE" name="_mm_unpacklo_epi8">
	<type>Integer</type>
	<CPUID>SSE2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<parameter type="__m128i" varname="b" etype="UI8"/>
	<description>Unpack and interleave 8-bit integers from the low half of "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_BYTES(src1[127:0], src2[127:0]) {
	dst[7:0] := src1[7:0] 
	dst[15:8] := src2[7:0] 
	dst[23:16] := src1[15:8] 
	dst[31:24] := src2[15:8] 
	dst[39:32] := src1[23:16] 
	dst[47:40] := src2[23:16] 
	dst[55:48] := src1[31:24] 
	dst[63:56] := src2[31:24] 
	dst[71:64] := src1[39:32]
	dst[79:72] := src2[39:32] 
	dst[87:80] := src1[47:40] 
	dst[95:88] := src2[47:40] 
	dst[103:96] := src1[55:48] 
	dst[111:104] := src2[55:48] 
	dst[119:112] := src1[63:56] 
	dst[127:120] := src2[63:56] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_BYTES(a[127:0], b[127:0])
	</operation>
	<instruction name="PUNPCKLBW" form="xmm, xmm" xed="PUNPCKLBW_XMMdq_XMMq"/>
	<header>emmintrin.h</header>
</intrinsic>
  '''
  print(sema)
  intrin_node = ET.fromstring(sema)
  spec = get_spec_from_xml(intrin_node)
  print(spec)
  CompiledFunction = CompileSemantics(spec)
