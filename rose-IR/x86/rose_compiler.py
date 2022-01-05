
from sema_ast import *
from RoseValue import RoseValue
from RoseType import RoseType
from RoseAbstractions import RoseFunction, RoseForLoop, RoseBlock
from RoseConstants import RoseConstant, RoseUndefValue, RoseUndefRegion
from RoseArgument import RoseArgument
from RoseOperation import RoseOperation
from RoseOperations import RoseExtractSliceOp, RoseSignExtendOp, RoseZeroExtendOp, \
                          RoseNegOp, RoseNotOp, RoseCallOp, RoseSelectOp, RoseInsertSliceOp
from x86Types import x86Types

import math
from copy import deepcopy


MaxVectorLength = 512


# This is a generic context that could be used across
# different architectures.
class RoseContext:
  # Keep this simple
  class RoseValueNameGenerator:
    def __init__(self):
      self.Num = 0
    
    def generateName(self):
      Name =  "%" + str(self.Num)
      str.Num += 1
      return Name
  
  def __init__(self):
    # Keep track of all variables (arguments, LHS)
    self.LhsVariables = {}
    self.RhsOperations = {}
    self.Variables = {}
    # Cache the functions we encounter
    self.FunctionDefs = {}
    self.Functions = {}
    # Track the contexts we encounter
    self.ParentContext = None
    self.Contexts = {}
    # Heirarchical abstractions such as functions, loops and cond regions.
    # Blocks are not dealt with by this compiler.
    self.RootAbstractions = []
    # Every context has its own name generator
    self.NameGenerator = self.RoseValueNameGenerator()
  
  def addCompiledStmt(self, Name : str, Stmt):
    assert isinstance(Stmt, RoseValue)
    self.CompiledStmts[Name] = Stmt
  
  def isCompiledStmt(self, Name : str):
    return self.CompiledStmts.get(Name, None)
  
  def getNewName(self):
    Name = self.NameGenerator.generateName()
    assert type(Name) == str
    return Name
  
  def createContext(self, ContextName : str, ChildContext):
    assert isinstance(ChildContext, RoseContext)
    ChildContext.setParentContext(self)
    self.Contexts[ContextName] = ChildContext
  
  def destroyContext(self, ContextName : str):
    self.Contexts[ContextName] = None

  def getContext(self, AbstractionName : str):
    return self.Contexts.get(AbstractionName, None)
  
  def pushRootAbstraction(self, Abstraction):
    self.RootAbstractions.append(Abstraction)
    
  def popRootAbstraction(self):
    return self.RootAbstractions.pop(len(self.RootAbstractions) - 1)
  
  def getRootAbstraction(self):
    return self.RootAbstractions[len(self.RootAbstractions) - 1]
  
  def addFunctionDef(self, FunctionDef):
    assert(type(FunctionDef) == FuncDef)
    self.FunctionDefs[FunctionDef.name] = FunctionDef
  
  def getFunctionDef(self, Name : str):
    return self.FunctionDefs[Name]

  def addFunction(self, Function : RoseFunction):
    Name = Function.getName()
    self.Functions[Name] = Function

  def getFunction(self, Name : str):
    return self.Functions.get(Name, RoseUndefRegion())
  
  def setParentContext(self, Context):
    assert isinstance(Context, RoseContext)
    self.ParentContext = Context

  def getParentContext(self):
    return self.ParentContext
  
  def isRootContext(self):
    return self.ParentContext == None
  
  def copyVariables(self, Parent):
    assert isinstance(Parent, RoseContext)
    self.Variables = deepcopy(Parent.getVariables())

  def getVariables(self):
    return self.Variables

  def addVariable(self, Value : RoseValue):
    Name = Value.getName()
    assert Name not in self.Variables
    self.Variables[Name] = Value
  
  def addLhsVariable(self, Value : RoseValue):
    Name = Value.getName()
    assert Name not in self.LhsVariables
    self.LhsVariables[Name] = Value

  def addRhsOperation(self, Operation : RoseOperation):
    Name = Operation.getName()
    assert Name not in self.RhsOperations
    self.RhsOperations[Name] = Operation
  
  def isLhsVariableDefined(self, Name : str):
    return Name in self.LhsVariables
  
  def isVariableDefined(self, Name : str):
    return Name in self.Variables

  def getVariableValue(self, Name : str):
    return self.Variables[Name]


# This defines rules specifically for x86 to RoseIR convertion
class x86RoseContext(RoseContext):
  def __init__(self):
    # track range of defined bits for implicitly defined variables
    # mapping <implicit var> -> <highest defined bit>
    self.DefinedRange = {}
    super().__init__()

  def createContextForFunction(self, ContextName : str, ChildContext):
    assert isinstance(ChildContext, x86RoseContext)
    # A function accepts no external variables besides arguments
    self.createContext(ContextName, ChildContext)
  
  def destroyContextForFunction(self, ContextName : str):
    # Nothing escapes a function. So nothing to copy over from child context.
    self.destroyContext(ContextName)

  def createContextForLoop(self, ContextName : str, Context):
    assert isinstance(Context, x86RoseContext)
    # Add the variables from parent function into this one
    Context.copyVariables(self)
    self.createContext(ContextName, Context)
  
  def destroyContextForLoop(self, ContextName : str):
    # Copy the LHS variables to variables in the parent context
    self.destroyContext(ContextName)
  
  # This is used to check if the variable 
  def isVariableDefined(self, Name : str):
    if isinstance(self.getRootAbstraction(), RoseFunction):
      return super().isVariableDefined(Name)
    if isinstance(self.getRootAbstraction(), RoseForLoop):
      return super().isVariableDefined(Name)
    
  def addVariable(self, Value : RoseValue, Implicit = False):
    if isinstance(self.getRootAbstraction(), RoseFunction):
      super().addVariable(Value)
    if isinstance(self.getRootAbstraction(), RoseForLoop):
      if super().isVariableDefined(Value.getName()):
        return
      # Add these to the LHS if it has not been already
      if super().isLhsVariableDefined(Value.getName()):
        return 
      super().addLhsVariable(Value)
    if Implicit:
      Name = Value.getName()
      self.DefinedRange[Name] = 0

  def isVariableImplicitlyDefined(self, Name : str):
    return Name in self.DefinedRange

  def updateDefinedRange(self, Name : str, High : int):
    if Name in self.DefinedRange:
        self.DefinedRange[Name] = max(self.DefinedRange[Name], High)

  def getHighestDefinedBit(self, Name : str):
    assert Name in self.DefinedRange
    return self.DefinedRange[Name]



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


#def CompileVar(Variable, Context):
#  print("COMPILE VARIABLE")
#  print("VARIABLE:")
#  print(Variable)
#  # Check if the variable is already defined and cached. If yes, just return that.
#  if Context.getVariableValue(Variable.name)

#  # Create a new rose value
#  Val = RoseValue.create(Variable.name, Context.getVariableValue(Variable.name).getType())
#  return Val


def CompileSelect(Select, Context : x86RoseContext):
  print("COMPILE Select EXPRESSION")
  print("SELECT EXPR:")
  print(Select)
  Cond = CompileExpression(Select.cond, Context)
  Then = CompileExpression(Select.then, Context)
  Otherwise = CompileExpression(Select.otherwise, Context)
  Operation = RoseSelectOp.create(Context.getNewName(), Cond, Then, Otherwise)
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)
  return Operation


def CompileUnaryExpr(UnaryExpr, Context : x86RoseContext):
  print("COMPILE UNARY EXPRESSION")
  print("UNARY EXPR:")
  print(UnaryExpr)
  Value = CompileExpression(UnaryExpr.a, Context)
  UnaryFuncHandle = UnaryOps[UnaryExpr.op]
  Operation = UnaryFuncHandle(Context.getNewName(), Value, Context)
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)
  return Operation


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
  Operation = RoseExtractSliceOp.create(Context.getNewName(), BitVector, Low, High)
  print("BIT SLICE OP:")
  Operation.print()
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(Operation)
  Context.pushRootAbstraction(RootAbstraction)

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

  if type(Update.lhs) == Var and not Context.isVariableDefined(Update.lhs.name):
    # This is a newly defined variable. Let's rename the RHS.
    NewRHSExprVal = RHSExprVal
    NewRHSExprVal.setName(Update.lhs.name)
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.replaceAbstraction(RHSExprVal, NewRHSExprVal)
    Context.pushRootAbstraction(RootAbstraction)
    # Cache RHS in the context
    Context.addVariable(RHSExprVal)
    return

  if type(Update.lhs) == BitSlice:
    if not Context.isVariableDefined(Update.lhs.name):
      # This is an implicitly defined bit slice.
      # Define the insert slice operation.
      Op = RoseInsertSliceOp.create()
      # Add the variable to context first
      Context.addVariable(RHSExprVal)


# Function will be compiled later
def CompileFunction(FunctionDef, Context : x86RoseContext):
  assert(type(FunctionDef) == FuncDef)
  print("COMPILE FUNCTION")
  print("FUNCDEF:")
  print(FunctionDef)
  # Add the function definiton to the current context
  # This function will be compiled later.
  Context.addFunctionDef(FunctionDef)


def CompileCall(CallStmt, Context : x86RoseContext):
  print("COMPILE CALL")
  assert type(CallStmt.func) == str
  FunctionName = CallStmt.func

  # Compile arguments first
  print("COMPILE ARGUMENTS")
  ArgValuesList = list()
  for Arg in CallStmt.args:
    ArgValuesList.append(CompileExpression(Arg, Context))
  print("ARGUMENTS COMPILED")

  # Check if this is a call to a builtin function
  # The builtins do not modify the environment
  if FunctionName in Builtins:
    return Builtins[FunctionName](Context.getNewName(), ArgValuesList, Context)

  # This is a function call
  FunctionDef = Context.getFunctionDef(FunctionName)
  assert len(FunctionDef.params) == len(CallStmt.args)

  # Check if we are compiling this function for the first time
  if Context.getFunction(CallStmt.func) == RoseUndefRegion():
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
      FuncArgList.append(ArgVal)
      # Add arguments to the child context
      ChildContext.addVariable(ArgVal)
    
    # Compile the function and its arguments
    Function = RoseFunction.create(FunctionName, FuncArgList, RoseType.getUndefTy())
    print("Function:")
    print(Function)
    print(FunctionDef.params)
    print(type(FunctionDef.params))
    
    # Add this function as the root abstraction for this this child context
    ChildContext.pushRootAbstraction(Function)
    Context.createContextForFunction(FunctionDef.name, ChildContext)
    print("FUNCTION ADDED TO CONTEXT")
    
    # Compile the function body
    ReturnValue = RoseUndefValue()
    for Stmt in FunctionDef.body:
      if type(Stmt) == Return:
        ReturnValue = CompileExpression(Stmt.val, ChildContext)
        break
      CompileStatement(Stmt, ChildContext)
    assert ReturnValue != RoseUndefValue()
    print("FUNCTION GENERATED")

    # Pop the root function from the child context 
    CompiledFunction = ChildContext.popRootAbstraction()

    # Set the return value for this function
    CompiledFunction.setRetVal(ReturnValue)

    # Cache this function in this context now
    Context.addFunction(CompiledFunction)

    # Add this function to the root abstraction and update context
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.addAbstraction(CompiledFunction)
    Context.pushRootAbstraction(RootAbstraction)

    # Destroy the child context now
    Context.destroyContextForFunction(FunctionDef.name)

  # Compile call statement now.
  # If the compiled call returns void, we add it to the root function,
  # or else we just return it.
  Function = Context.getFunction(FunctionName)
  if Function.getType().getReturnType() == RoseType.isVoidTy():
    FunctionCall = RoseCallOp.create("", Function, ArgValuesList)
    print(FunctionCall)
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.addAbstraction(FunctionCall)
    Context.pushRootAbstraction(RootAbstraction)
    Context.addCompiledStmt(CallStmt.func, FunctionCall)
  else:
    FunctionCall = RoseCallOp.create(Context.getNewName(), Function, ArgValuesList)
    print(FunctionCall)
    RootAbstraction = Context.popRootAbstraction()
    RootAbstraction.addAbstraction(FunctionCall)
    Context.pushRootAbstraction(RootAbstraction)
    return FunctionCall


def CompileForLoop(ForStmt, Context : x86RoseContext):
  # Generate an empty for loop
  One = RoseConstant.create(1, RoseType.getIntegerTy(32))
  MinusOne = RoseConstant.create(-1, RoseType.getIntegerTy(32))
  Step = One if ForStmt.inc else MinusOne
  Begin = CompileExpression(ForStmt.begin, Context)
  End = CompileExpression(ForStmt.end, Context)
  Loop = RoseForLoop.create(ForStmt.iterator.name, Begin, End, Step)

  # Add a new context for this loop and add loop as root abstraction 
  ChildContext = x86RoseContext()
  ChildContext.pushRootAbstraction(Loop)
  Context.createContextForLoop(ForStmt.iterator.name, ChildContext)

  # Add the iterator to the child context
  ChildContext.addVariable(Loop.getIterator())

  # Comoile all the statements in this loop
  for Stmt in ForStmt.body:
    CompileStatement(Stmt, ChildContext)
  
  # Pop the root loop from the child context 
  CompiledLoop = ChildContext.popRootAbstraction()

  # Add loop to the root abstraction
  RootAbstraction = Context.popRootAbstraction()
  RootAbstraction.addAbstraction(CompiledLoop)
  Context.pushRootAbstraction(RootAbstraction)

  # Remove the child context now
  Context.destroyContextForLoop(ForStmt.iterator.name)


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
      ParamValues.append(ParamVal)
    # Cache compiled parameter
    RootContext.addCompiledStmt(Param.name, ParamVal)

  ReturnsMask = Sema.rettype.startswith('__mmask')
  if Sema.rettype != 'void':
    RetType = x86Types[Sema.rettype]
    # if the environment has 'k' defined. E.g. k is a parameter
    # the k cannot be returned implicitly
    if not ReturnsMask or RootContext.isVariableDefined('k'):
      print("adding dst to context")
      RetValue = RoseValue.create('dst', RetType)
    else:
      print("adding k to context")
      RetValue = RoseValue.create('k', RetType)
  else:
    ReturnsVoid = True
    RetType = RoseType.getVoidTy()
    RetValue = RoseValue.create("", RetType)
  
  # Add return value to the context
  RootContext.addVariable(RetValue)
  RootContext.addCompiledStmt(RetValue.getName(), RetValue)
  
  # Define a Rose function
  RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetType)

  # Add the arguments to context too
  RootFunction.setRetValName(RetValue.getName())
  for ParamVal in ParamValues:
    ParamVal.setFunction(RootFunction)
    RootContext.addVariable(ParamVal)
  
  # Add the root function now
  RootContext.pushRootAbstraction(RootFunction)

  # Compile all the statements
  for Stmt in Sema.spec:
    if type(Stmt) == Return:
      Dst = Update(lhs=Var('dst'), rhs=Stmt.val)
      CompileStatement(Dst, RootContext)
      break
    CompileStatement(Stmt, RootContext)
  
  Outputs = [RootContext.getVariableValue(OutParam) for OutParam in OutParams]
  if not ReturnsVoid:
    if not ReturnsMask:
      RetVal = RootContext.getVariableValue("dst")
    else:
      RetVal = RootContext.getVariableValue("k")
    Outputs = [RetVal] + Outputs
  return ParamValues, Outputs


CompileAbstractions = {
  For: CompileForLoop,
  Number: CompileNumber,
  #Var: CompileVar,
  FuncDef: CompileFunction,
  Call: CompileCall,
  BitSlice: CompileBitSlice,
  Update: CompileUpdate,
  UnaryExpr: CompileUnaryExpr,
  Select: CompileSelect,
  If: CompileIf,
  #BinaryExpr: CompileBinaryExpr,
  #While: compile_while,
  #Match: CompileMatch,
  #Lookup: compile_lookup,
}


def HandleToSignExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args, Context : x86RoseContext):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseSignExtendOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToZeroExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args, Context : x86RoseContext):
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
  def LamdaImplFunc(Name : str, Value, Context : x86RoseContext):
    assert Value.getType().isBitVectorTy() == True
    return RoseNotOp.create(Value)
  
  return LamdaImplFunc


def HandleToNeg():
  def LamdaImplFunc(Name : str, Value, Context : x86RoseContext):
    assert Value.getType().isBitVectorTy() == True
    return RoseNegOp.create(Value)
  
  return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
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
  param_vals, outs = CompileSemantics(spec)
  print(param_vals, outs)
