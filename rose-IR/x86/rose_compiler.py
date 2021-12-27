from sema_ast import Parameter, Spec, BitSlice, Var, Number, Update, \
                    OpUpdate, For, While, If, Call, BinaryExpr, UnaryExpr, \
                    PseudoExpr, PseudoStmt, Return, Select, RegSel, Match, \
                    Case, Lookup, Index, FuncDef, Break
from RoseOpcode import RoseOpcode
from RoseType import RoseType, RoseBitVectorType
#from DerivedRoseTypes import Constant
from RoseValue import RoseValue
from RoseFunctionCall import RoseFunctionCall
from RoseFunction import RoseFunction
from RoseForLoop import RoseForLoop
from RoseBlock import RoseBlock
from RoseOperations import RoseSliceOp, RoseSignExtendOp, RoseZeroExtendOp, \
                          RoseNegOp, RoseNotOp, Constant
from x86Types import x86Types


MaxVectorLength = 512


# Keeps track of all variables, functions and contexts
class RoseContext:
  def __init__(self):
    self.ParentConext = None
    self.Variables = {}
    self.FunctionDefs = {}
    self.Functions = {}
    self.Contexts = {}
    # track range of defined bits for implicitly defined variables
    # mapping <implicit var> -> <highest defined bit>
    self.DefinedRange = {}

  def addFunctionDef(self, Name : str, FunctionDef):
    assert(type(FunctionDef) == FuncDef)
    self.FunctionDefs[Name] = FunctionDef
  
  def getFunctionDef(self, Name : str):
    return self.FunctionDefs[Name]

  def addFunction(self, Function : RoseFunction):
    Name = Function.getName()
    self.Functions[Name] = Function

  def getFunction(self, Name : str):
    return self.Functions[Name]
  
  def addContext(self, FunctionName : str, Context):
    assert isinstance(Context, RoseContext)
    self.Contexts[FunctionName] = Context
    Context.setParentContext(self)
      
  def getContext(self, FunctionName : str):
    return self.Contexts[FunctionName]
  
  def setParentContext(self, Context):
    assert isinstance(Context, RoseContext)
    self.ParentConext = Context

  def getParentConext(self):
    return self.ParentConext

  def addVariable(self, Value : RoseValue, Implicit = False):
    Name = Value.getName()
    assert Name not in self.Variables
    self.Variables[Name] = Value
    if Implicit:
        self.DefinedRange[Name] = 0
  
  def isVariableDefined(self, Name : str):
    return Name in self.Variables

  def getVariableValue(self, Name : str):
    return self.Variables[Name]
  
  def getVariableType(self, Name : str):
    Type = self.Variables[Name].getType()
    if self.isVariableImplicitlyDefined(Name):
        High = self.getHighestDefinedBit(Name)
        ty = ty._replace(bitwidth=hi+1, useful_bits=hi+1)
    return ty

  def setVariableValue(self, Name : str, Value : RoseValue):
    self.Variables[Name] = Value
  
  def setVariableType(self, Name : str, Type : RoseType):
    self.Variables[Name] = RoseValue.create(Name, Type)
  
  def isVariableImplicitlyDefined(self, Name : str):
    return Name in self.DefinedRange

  def updateDefinedRange(self, Name : str, High : int):
    if Name in self.DefinedRange:
        self.DefinedRange[Name] = max(self.DefinedRange[Name], High)

  def getHighestDefinedBit(self, Name : str):
    assert Name in self.DefinedRange
    return self.DefinedRange[Name]



def CompileVar(Variable, Context, _):
  print("COMPILE VARIABLE")
  print("VARIABLE:")
  print(Variable)
  # Create a new rose value
  Val = RoseValue.create(Variable.name, Context.getVariableValue(Variable.name).getType())
  return Val


def CompileStatement(Stmt, Context, pred=True):
  StmtTy = type(Stmt)
  print("STATEMENT:")
  print(Stmt)
  print("STATEMENT TYPE:")
  print(StmtTy)
  CompileAbstractions[StmtTy](Stmt, Context, pred)


def CompileNumber(Num, Context, _):
  print("COMPILE NUMBER")
  print("NUM:")
  print(Num)
  if isinstance(Num.val, int):
      ConstantVal = Constant.create(Num.val, RoseType.getIntegerTy(32))
      return ConstantVal
  else:
      NonConstantVal = Num.val
      return NonConstantVal


def CompileExpression(Expr, env, pred=True, deref=False):
  print("COMPILE EXPRESSION")
  print("EXPR:")
  print(Expr)

  if deref and type(Expr) == Lookup:
      # normalize `x.dword` to `x.dword[1]`
      CompiledExpr = BitSlice(Expr, hi=Number(0), lo=Number(0))

  ExprTy = type(Expr)
  CompiledExpr = CompileAbstractions[ExprTy](Expr, env, pred)
  #if deref:
  #  return get_value(slice_or_val, env), ty
  return CompiledExpr


def CompileForLoop(ForStmt, Context : RoseContext, pred=True):
  One = Constant.create(1, 32)
  MinusOne = Constant.create(-1, 32)
  Step = One if ForStmt.inc else MinusOne
  Begin = CompileExpression(ForStmt.begin, Context, deref=True)
  End = CompileExpression(ForStmt.end, Context, deref=True)

  # Generate an empty for loop
  Loop = RoseForLoop.create(ForStmt.iterator.name, Begin, End, Step)

  # Collect all statements in the loop body
  OpList = []
  for Stmt in ForStmt.body:
      OpList.append(CompileStatement(Stmt, Context, False))

  # Create a new block and add it to the loop
  Block = RoseBlock.create(OpList, Loop)
  Loop.addBlock(Block)

  return Loop


def CompileBitSlice(BitSliceExpr, Context, pred):
  print("COMPILE BITSLICE")
  print("BITSLICE:")
  print(BitSliceExpr)

  # First compile low and high expressions
  print("COMPILING LOW")
  Low = CompileExpression(BitSliceExpr.lo, Context, pred, deref=True)
  print("COMPILED LOW")
  Low.print()

  # Special case for the magic variable 'MAX' 
  print("COMPILING HIGH")
  if (type(BitSliceExpr.hi) == Var and
    BitSliceExpr.hi.name == 'MAX'):
    #hi = conc_val(max_vl - 1, IntegerType(32))
    High = Constant.create(MaxVectorLength - 1, RoseType.getIntegerTy(32))
  else:
    High = CompileExpression(BitSliceExpr.hi, Context, pred, deref=True)
  print("COMPILED HIGH")
  High.print()

  # In case we have a variable implicitly declared,
  # assume only integers can be implicitly declared
  if (type(BitSliceExpr.bv) == Var and
    not Context.isVariableDefined(BitSliceExpr.bv.name)):
    Context.addVariable(RoseValue.create(BitSliceExpr.bv.name,
                  RoseType.getBitVectorTy(MaxVectorLength)), implicit=True)
  
  print("COMPILING BITVECTOR")
  BitVector = CompileExpression(BitSliceExpr.bv, Context, pred)
  print("COMPILED BITVECTOR")
  BitVector.print()
  assert isinstance(BitVector.getType(), RoseBitVectorType)
  print("BITVEVTOR BITWODTH:")
  print(BitVector.getType().getBitwidth())

  # Do some sanity check if possible
  if isinstance(Low, Constant) and isinstance(High, Constant):
    assert BitVector.getType().getBitwidth() == (High.getValue() - Low.getValue() + 1)

  # Add an bitslice operation
  Operation = RoseSliceOp(BitVector, Low, High)
  print("BIT SLICE OP:")
  Operation.print()

  return Operation


def CompileUpdate(Update, Context, pred):
  print("COMPILE UPDATE")
  print("UPDATE:")
  print(Update)

  print("COMPILING RHS")
  RHSExprVal = CompileExpression(Update.rhs, Context, pred)
  RHSExprVal.setName(Update.lhs.name)
  print("COMPILED RHS")
  RHSExprVal.print()
   
  #if type(Update.lhs) == Lookup:
    # normalize `x.dword = foo` into `x.dword[0] = foo`
  #  update = Update._replace(lhs=BitSlice(Update.lhs, hi=Number(0), lo=Number(0)))
  
  if type(Update.lhs) == Var and not Context.isVariableDefined(Update.lhs.name):
    LHSval = RoseValue.create(Update.lhs.name, RHSExprVal.getType())
    Context.addVariable(LHSval, implicit=True)
    assert Context.isVariableDefined(Update.lhs.name)

  print("COMPILING LHS")
  LHSExprVal = CompileExpression(Update.lhs, Context, pred)
  print("COMPILED LHS")
  LHSExprVal.print()

  # Propagate type from RHS
  Context.setVariableType(LHSExprVal.getName(), RHSExprVal.getType())

  return RHSExprVal


# Function will be compiled later
def CompileFunction(FunctionDef, Context : RoseContext, _):
    assert(type(FunctionDef) == FuncDef)
    print("COMPILE FUNCTION")
    print("FUNCDEF:")
    print(FunctionDef)

    # New context for a newly defined function
    NewContext = RoseContext()
    #NewContext.addFunction(FunctionDef.name, None)
    NewContext.addFunctionDef(FunctionDef.name, FunctionDef)
    Context.addContext(FunctionDef.name, NewContext)


def CompileCall(CallStmt, Context : RoseContext, pred):
  print("COMPILE CALL")

  assert type(CallStmt.func) == str
  FunctionName = CallStmt.func

  # Compile arguments first
  print("COMPILE ARGUMENTS")
  ArgValuesList = []
  for Arg in CallStmt.args:
    ArgValuesList.append(CompileExpression(Arg, Context, deref=True))
  print("ARGUMENTS COMPILED")

  # Check if this is a call to a builtin function
  # The builtins do not modify the environment
  if FunctionName in Builtins:
    return Builtins[FunctionName](ArgValuesList, Context)

  # This is a function call
  ChildContext = Context.getContext(FunctionName)
  FunctionDef = Context.getFunctionDef(FunctionName)
  assert len(FunctionDef.params) == len(CallStmt.args)

  # Check if we are compiling this function for the first time
  if ChildContext.getFunction(CallStmt.func) == None:
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
      #arg = fix_bitwidth(arg, param_width)
      Context.addVariable(ParamName, Arg)

    # Comoile the function body
    ReturnValue = None
    FuncOperationList = []
    for Stmt in FunctionDef.body:
        if type(Stmt) == Return:
            ReturnValue = CompileExpression(Stmt.val, ChildContext, pred, deref=True)
            break
        FuncOperationList.append(CompileStatement(Stmt, ChildContext, pred))
    assert(ReturnValue != None)
    
    # Compile the function first
    Function = RoseFunction.create(FunctionName, ArgValuesList, ReturnValue.getType())

    # Create a new block and add it to the function
    Block = RoseBlock.create(FuncOperationList, Function)
    Function.addBlock(Block)
    
    # Add this function to the current context
    Context.addFunction(Function.name, Function)

  # Compile call statement now
  Function = Context.getFunction(FunctionName)
  FunctionCall = RoseFunctionCall.create(Function, ArgValuesList)

  return FunctionCall


def CompileUnaryExpr(UnaryExpr, Context, pred):
  print("COMPILE UNARY EXPRESSION")
  print("UNARY EXPR:")
  print(UnaryExpr)
  Value = CompileExpression(UnaryExpr.a, Context, pred, deref=True)
  UnaryFuncHandle = UnaryOps[UnaryExpr.op]
  return UnaryFuncHandle(Value)


def CompileSemantics(Sema):
  # Create the root context
  RootContext = RoseContext()
  OutParams = []
  returns_void = False
  ParamValues = []
  for Param in Sema.params:
    is_out_param = False
    if Param.type.endswith('*'):
        ParamType = x86Types[Param.type[:-1].strip()]
        OutParams.append(Param.name)
        is_out_param = True
    else:
        ParamType = x86Types[Param.type]
    # override signedness of the variables
    #ParamType = param_type._replace(is_signed=param.is_signed)
    # Create a new rosette value
    ParamVal = RoseValue.create(Param.name, ParamType)
    ParamVal.print()
    #param_val = new_sym_val(param_type)
    if not is_out_param: 
      ParamValues.append(ParamVal)
    RootContext.addVariable(ParamVal)

  ReturnsMask = Sema.rettype.startswith('__mmask')
  if Sema.rettype != 'void':
    RetType = x86Types[Sema.rettype]
    # if the environment has 'k' defined. E.g. k is a parameter
    # the k cannot be returned implicitly
    if not ReturnsMask or RootContext.isVariableDefined('k'):
      print("adding dst to context")
      RootContext.addVariable(RoseValue.create('dst', RetType))
      #RootContext.define('dst', type=RetType, value=new_sym_val(rettype))
    else:
      print("adding k to context")
      RootContext.addVariable(RoseValue.create('k', RetType))
      #RootContext.define('k', type=RetType, value=new_sym_val(rettype))
  else:
    returns_void = True

  # Compile all the statements
  for Stmt in Sema.spec:
    if type(Stmt) == Return:
      assign_to_dst = Update(lhs=Var('dst'), rhs=Stmt.val)
      CompileStatement(assign_to_dst, RootContext)
      break
    CompileStatement(Stmt, RootContext)
  
  Outputs = [RootContext.getVariableValue(OutParam)) for OutParam in OutParams]
  if not returns_void:
    if not ReturnsMask:
      RetVal = RootContext.getVariableValue("dst")
    else:
      RetVal = RootContext.getVariableValue("k")
    Outputs = [RetVal] + Outputs
  return ParamValues, Outputs


CompileAbstractions = {
  For: CompileForLoop,
  Number: CompileNumber,
  Var: CompileVar,
  FuncDef: CompileFunction,
  Call: CompileCall,
  BitSlice: CompileBitSlice,
  Update: CompileUpdate,
  UnaryExpr: CompileUnaryExpr,
  #BinaryExpr: CompileBinaryExpr,
  #Select: compile_select,
  #Match: compile_match,
  #While: compile_while,
  #If: compile_if,
  #Lookup: compile_lookup,
  #PseudoStmt: lambda *_:None
}


def HandleToSignExtend(Bitwidth : int):
  def LamdaImplFunc(Args, Context : RoseContext):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseSignExtendOp.create(Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToZeroExtend(Bitwidth : int):
  def LamdaImplFunc(Args, Context : RoseContext):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseZeroExtendOp.create(Value, Bitwidth)
  
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


def HandleToNot(Bitwidth):
  def LamdaImplFunc(Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseNotOp.create(Value)
  
  return LamdaImplFunc


def HandleToNeg(Bitwidth):
  def LamdaImplFunc(Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseNegOp.create(Value)
  
  return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
}



if __name__ == '__main__':
  from manual_parser import get_spec_from_xml

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
