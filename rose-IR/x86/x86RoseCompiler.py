
from RoseType import RoseType
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *

from AST import *
from x86Types import x86Types

from copy import deepcopy


# This is a generic context that could be used across
# different architectures.
class RoseContext:
  def __init__(self):
    self.CompiledAbstractions = dict()   # ID --> Some Rose abstraction
    # Track the contexts we encounter
    self.ParentContext = None
    self.Contexts = dict()   # ID --> child context
    # Heirarchical abstractions such as functions, loops and cond regions.
    # Blocks are not dealt with by this compiler.
    self.RootAbstractions = list()
    # Variable names are associated with their IDs
    self.Variables = dict()    # Name --> ID
  
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
  
  def getChildContext(self, ID : str):
    return self.Contexts[ID] 

  def pushRootAbstraction(self, Abstraction):
    self.RootAbstractions.append(Abstraction)
    
  def popRootAbstraction(self):
    return self.RootAbstractions.pop()
  
  def getRootAbstraction(self):
    return self.RootAbstractions[len(self.RootAbstractions) - 1]
  
  def addAbstractionToIR(self, Abstraction):
    TailAbstraction = self.popRootAbstraction()
    TailAbstraction.addAbstraction(Abstraction)
    self.pushRootAbstraction(TailAbstraction)

  def setParentContext(self, Context):
    assert isinstance(Context, RoseContext)
    self.ParentContext = Context
  
  def isRootContext(self):
    return self.ParentContext == None
  
  def getCompiledAbstractions(self):
    return self.CompiledAbstractions
  
  def getDefinedVariables(self):
    return self.Variables

  def copyAbstractionsFromParent(self):
    assert not self.isRootContext()
    assert isinstance(self.ParentContext, RoseContext)
    self.CompiledAbstractions = deepcopy(self.ParentContext.getCompiledAbstractions())
    # Copy the variables too
    for Name, ID in self.ParentContext.getDefinedVariables().items():
      print("VARIABLE NAME:")
      print(Name)
      self.Variables[Name] = ID

  
  def replaceParentAbstractionsWithChild(self):
    for Name, ID in self.ParentContext.getDefinedVariables().items():
      # Get the ID for the same variable name in curreent context
      ChildVarID = self.Variables[Name]
      Abstraction = self.CompiledAbstractions[ChildVarID]
      self.ParentContext.updateCompiledAbstraction(ID, Abstraction)


# This defines rules specifically for x86 to RoseIR convertion
class x86RoseContext(RoseContext):
  def __init__(self):
    # Maximum vector length
    self.MaxVectorLength = 512
    # Cache function definitions. This is needed because functions are
    # compiled when a call is compiled.
    self.FunctionDefs = dict()  # Function name --> FuncDef
    # Track the ids that have been extended.
    self.SizeExtended = dict()
    # Integer constant length can change depending on the context in which 
    # is used.
    self.NumberType = RoseType.getIntegerTy(32)
    #self.IndexNumberType = RoseType.getIntegerTy(32)
    self.CompileIndexFlag = False
    super().__init__()
  
  def getMaxVectorLength(self):
    return self.MaxVectorLength

  def addFunctionDef(self, FunctionDef):
    assert(type(FunctionDef) == FuncDef)
    self.FunctionDefs[FunctionDef.name] = FunctionDef
  
  def getFunctionDef(self, Name : str):
    return self.FunctionDefs[Name]

  def addSizeExtended(self, Operation : RoseValue, Bitwidth : int):
    self.SizeExtended[Operation] = Bitwidth
  
  def getExtendedSize(self, Operation : str):
    assert Operation in self.SizeExtended
    return self.SizeExtended[Operation]
  
  def isSizeExtended(self, Operation : str):
    return Operation in self.SizeExtended
  
  def setNumberType(self, Type : RoseType):
    self.NumberType = Type

  def getNumberType(self):
    return self.NumberType
  
  def setCompileIndexFlag(self, Flag : bool):
    self.CompileIndexFlag = Flag

  #def setIndexNumberType(self, Type : RoseType):
  #  self.IndexNumberType = Type

  #def getIndexNumberType(self):
  #  return self.IndexNumberType
  
  def isCompileIndexFlagSet(self):
    return self.CompileIndexFlag == True

  def createContext(self, ID : str, ChildContext):
    print("CREATING CONTEXT")
    assert isinstance(ChildContext, x86RoseContext)
    assert self.isCompiledAbstraction(ID)
    Abstraction = self.getCompiledAbstractionForID(ID)
    if isinstance(Abstraction, RoseFunction):
      # A function accepts no external variables besides arguments
      super().createContext(ID, ChildContext)
    elif isinstance(Abstraction, RoseForLoop) \
      or isinstance(Abstraction, RoseCond):
      # Copy all the compiled abstractions from this context to the child
      ChildContext.setParentContext(self)
      ChildContext.copyAbstractionsFromParent()
      super().createContext(ID, ChildContext)
  
  def destroyContext(self, ContextName : str):
    print("ROOT ABSTRACTION:")
    print(self.getRootAbstraction())
    self.getRootAbstraction().print()
    ChildContext = self.getChildContext(ContextName)
    if isinstance(ChildContext.getRootAbstraction(), RoseFunction):
      super().destroyContext(ContextName)
    elif isinstance(ChildContext.getRootAbstraction(), RoseForLoop) \
       or isinstance(ChildContext.getRootAbstraction(), RoseCond):
      print("HERE")
      ChildContext.replaceParentAbstractionsWithChild()
      super().destroyContext(ContextName)
    


def CompileNumber(Num, Context : x86RoseContext):
  print("COMPILE NUMBER")
  print("NUM:")
  print(Num)
  if isinstance(Num.val, int):
    if Context.isCompileIndexFlagSet():
      ConstantVal = RoseConstant.create(Num.val, RoseType.getIntegerTy(32))
      #Context.getIndexNumberType())
    else:
      ConstantVal = RoseConstant.create(Num.val, Context.getNumberType())
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
  Var = RoseValue.create(Variable.name, \
          RoseType.getBitVectorTy(Context.getMaxVectorLength()))

  # Add the variable info to the context
  Context.addVariable(Variable.name, Variable.id)
  Context.addCompiledAbstraction(Variable.id, Var)
  
  return Var


# Always assume that the bitwidth returned by this function is a constant
def ComputeBitSliceWidth(Low : RoseValue, High : RoseValue, TotalBitwidth : int = None):
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
  print("HighIndexValue:")
  HighIndexValue.print()
  HighIndexValue.getType().print()
  print("Low:")
  Low.print()
  Low.getType().print()

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


def CompileIndex(IndexExpr, Context : x86RoseContext):
  print("COMPILING AN INDEX EXPRESSION:")
  print("IndexExpr:")
  print(IndexExpr)
  Context.setCompileIndexFlag(True)
  CompiledIndex = CompileExpression(IndexExpr, Context)
  Context.setCompileIndexFlag(False)
  # The compiled indices are supposed to be integer values
  # and not bitvectors. However, in some cases it can be a bitvector
  # where indices are in a bitvector. We just change cast the index value.
  if CompiledIndex.getType().isBitVectorTy():
    print("GENERATING CAST")
    # Indices can only be variables for them to be cast
    assert type(IndexExpr) == Var
    assert Context.isVariableDefined(IndexExpr.name)
    ID = Context.getVariableID(IndexExpr.name)
    assert Context.getCompiledAbstractionForID(ID) == CompiledIndex
    # Generate the casting op
    Name = "cast." + CompiledIndex.getName()
    CastOp = RoseCastOp.create(Name, CompiledIndex, \
                  RoseType.getIntegerTy(CompiledIndex.getType().getBitwidth()))
    # Add this op to the IR and to the context
    Context.addAbstractionToIR(CastOp)
    Context.addCompiledAbstraction(ID, CastOp)
    return CastOp
  return CompiledIndex


def CompileBitSlice(BitSliceExpr, Context : RoseContext):
  print("COMPILE BITSLICE")
  print("BITSLICE:")
  print(BitSliceExpr)
  # First compile low and high expressions
  print("COMPILING LOW")
  Low = CompileIndex(BitSliceExpr.lo, Context)
  print("COMPILED LOW")
  Low.print()

  # Special case for the magic variable 'MAX' 
  print("COMPILING HIGH")
  # Set the new index number type for the high index since
  # it should have the same type as the low index.
  #OriginalNumberTy = Context.getIndexNumberType()
  #Context.setIndexNumberType(Low.getType())
  if (type(BitSliceExpr.hi) == Var and BitSliceExpr.hi.name == 'MAX'):
    MaxVectorLength = Context.getMaxVectorLength()
    High = RoseConstant.create(MaxVectorLength - 1, RoseType.getIntegerTy(32))
  else:
    High = CompileIndex(BitSliceExpr.hi, Context)
  #Context.setIndexNumberType(OriginalNumberTy)
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
  
  # Compute the bitwidth that is extracted in this slice
  Bitwidth = ComputeBitSliceWidth(Low, High, BitVector.getType().getBitwidth())
  print("^^^^^Bitwidth:")
  print(Bitwidth)
  BitwidthValue = RoseConstant.create(Bitwidth, Low.getType())

  # Add an bitslice operation
  Operation = RoseBVExtractSliceOp.create(BitSliceExpr.id, BitVector, Low, High, BitwidthValue)
  print("BIT SLICE EXTRACT OP:")
  Operation.print()

  # Add the op to the IR
  Context.addAbstractionToIR(Operation)

  # Add the operation to the context
  Context.addCompiledAbstraction(BitSliceExpr.id, Operation)
  print(BitSliceExpr.id)
  print("==================================")
  Operation.getType().print()

  return Operation


def CompileBitIndex(IndexExpr, Context : x86RoseContext):
  print("COMPILING INDX EXPR")
  print("INDEX EXPR:")
  print(IndexExpr)
  # Compile the index first
  IndexVal = CompileIndex(IndexExpr.idx, Context)
  print("INDEX:")
  print(IndexVal)
  IndexVal.print()

  # Compile the vector object
  Vector = CompileExpression(IndexExpr.obj, Context)
  print("VECTOR:")
  print(Vector)
  Vector.print()

  # The bit slice size here is 1 bit
  BitwidthValue = RoseConstant.create(1, IndexVal.getType())

  # Now, generate the extract op. 
  Operation = RoseBVExtractSliceOp.create(IndexExpr.id, Vector, IndexVal, IndexVal, BitwidthValue)

  # Add the op to the IR
  Context.addAbstractionToIR(Operation)

  # Add the operation to the context
  Context.addCompiledAbstraction(IndexExpr.id, Operation)
  print(IndexExpr.id)
  print("==================================")
  Operation.getType().print()

  return Operation


def GetBitSliceIndex(ExprIndex, Context : x86RoseContext):
  # The given bitslice index could be a number
  if type(ExprIndex) == Number:
    print("--NUMBER")
    return RoseConstant.create(ExprIndex.val, RoseType.getIntegerTy(32))
  
  # The given bitslice index could be a variable
  if type(ExprIndex) == Var:
    print("--VARIABLE")
    if Context.isVariableDefined(ExprIndex.name):
      ID = Context.getVariableID(ExprIndex.name)
      Index = Context.getCompiledAbstractionForID(ID)
      if Index.getType().isBitVectorTy():
        return RoseCastOp.create("cast." + Index.getName(), Index, \
                            RoseType.getIntegerTy(Index.getType().getBitwidth()))
      return Index
    return RoseUndefValue()
  
  # The given bitslice index could be a binary operation
  if type(ExprIndex) == BinaryExpr:
    print("--BINARY EXPRESSION")
    # Try the first operand
    if type(ExprIndex.a) == Var:
      print("EXPRESSION A IS A VARIABLE")
      if Context.isVariableDefined(ExprIndex.a.name):
        ID = Context.getVariableID(ExprIndex.a.name)
        Operand1 = Context.getCompiledAbstractionForID(ID)
        if Operand1.getType().isBitVectorTy():
          print("CAST")
          Operand1 = RoseCastOp.create("cast." + Operand1.getName(), Operand1, \
                              RoseType.getIntegerTy(Operand1.getType().getBitwidth()))
      else:
        return RoseUndefValue()
    elif type(ExprIndex.a) == Number:
      print("EXPRESSION A IS A NUMBER")
      Operand1 = RoseConstant.create(ExprIndex.a.val, RoseType.getIntegerTy(32))
    elif Context.isCompiledAbstraction(ExprIndex.a.id):
      Operand1 = Context.getCompiledAbstractionForID(ExprIndex.a.id)
    else:
      return RoseUndefValue()
    # Try the second operand
    if type(ExprIndex.b) == Var:
      print("EXPRESSION B IS A VARIABLE")
      if Context.isVariableDefined(ExprIndex.b.name):
        ID = Context.getVariableID(ExprIndex.b.name)
        Operand2 = Context.getCompiledAbstractionForID(ID)
        if Operand2.getType().isBitVectorTy():
          Operand2 = RoseCastOp.create("cast." + Operand2.getName(), Operand2, \
                              RoseType.getIntegerTy(Operand2.getType().getBitwidth()))
      else:
        return RoseType.getUndefTy()
    elif type(ExprIndex.b) == Number:
      print("EXPRESSION B IS A NUMBER")
      Operand2 = RoseConstant.create(ExprIndex.b.val, RoseType.getIntegerTy(32))
    elif Context.isCompiledAbstraction(ExprIndex.b.id):
      Operand2 = Context.getCompiledAbstractionForID(ExprIndex.b.id)
    else:
      return RoseUndefValue()
    # Generate the index
    print("Operand1:")
    Operand1.print()
    Operand1.getType().print()
    print("Operand2:")
    Operand2.print()
    Operand2.getType().print()
    # Account for all special cases
    # The operands of a binary op may need some fixing up
    if type(ExprIndex.a) == Number \
    and (type(ExprIndex.b) == BitSlice or type(ExprIndex.b) == BitIndex):
      NumIntBits = ExprIndex.a.val.bit_length()
      if NumIntBits > Operand2.getType().getBitwidth():
        # We need to extend the size of the other operand
        Operand2 = RoseBVZeroExtendOp.create("zext." + Operand2.getName(), \
                                              Operand2, NumIntBits)
    if type(ExprIndex.b) == Number \
    and (type(ExprIndex.a) == BitSlice or type(ExprIndex.a) == BitIndex):
      NumIntBits = ExprIndex.b.val.bit_length()
      if NumIntBits > Operand1.getType().getBitwidth():
        # We need to extend the size of the other operand
        Operand1 = RoseBVZeroExtendOp.create("zext." + Operand1.getName(), \
                                              Operand1, NumIntBits)
    # Fix the constants' bitwidths
    if Operand1.getType() != Operand2.getType():
      if isinstance(Operand1, RoseConstant):
        Operand1 = RoseConstant.create(Operand1.getValue(), Operand2.getType())
      else:
        assert isinstance(Operand2, RoseConstant)
        Operand2 = RoseConstant.create(Operand2.getValue(), Operand1.getType())
    # Perform the binary operation
    return BinaryOps[ExprIndex.op]()(ExprIndex.id, Operand1, Operand2)

  # The given bitslice index could be a compiled expression
  if Context.isCompiledAbstraction(ExprIndex.id):
    return Context.getCompiledAbstractionForID(ExprIndex.id)
  
  return RoseUndefValue()


def GetExpressionType(Expr, Context : x86RoseContext):
  print("GET EXPRESSION TYPE:")
  print("EXPRESSION:")
  print(Expr)
  # First try to get the type of the Expr
  if type(Expr) == Var:
      if Context.isVariableDefined(Expr.name):
        ID = Context.getVariableID(Expr.name)
        return Context.getCompiledAbstractionForID(ID).getType()
      else:
        return RoseType.getUndefTy()
  
  if type(Expr) == BitIndex:
    return RoseType.getBitVectorTy(1)
  
  if type(Expr) == BitSlice:
    print("GETTING BIT SLICE LOW INDEX")
    Low = GetBitSliceIndex(Expr.lo, Context)
    if Low == RoseUndefValue():
      return RoseType.getUndefTy()
    print("LOW:")
    Low.print()
    print("GETTING BIT SLICE HIGH INDEX")
    High = GetBitSliceIndex(Expr.hi, Context)
    if High == RoseUndefValue():
      return RoseType.getUndefTy()
    print("HIGH:")
    High.print()
    Bitwidth = ComputeBitSliceWidth(Low, High)
    return RoseType.getBitVectorTy(Bitwidth)
  
  return RoseType.getUndefTy()


def GetRHSTypeForSpecialCases(RHS, Context : x86RoseContext):
  print("GET RHS TYPE SPECIAL CASES")
  assert type(RHS) == BinaryExpr
  # Check if the operands size is extended. If yes, we return
  # the type with extended size.
  if (((type(RHS.a) == BitSlice and type(RHS.b) == BitSlice) \
  or (type(RHS.a) == BitIndex and type(RHS.b) == BitIndex)) \
  and NeedToExtendOperandSize(RHS.op)) \
  or (type(RHS.a) == Call and type(RHS.b) == Call \
  and BinaryExpr.a.funcname in ZeroExtendsSize \
   and BinaryExpr.b.funcname in ZeroExtendsSize):
      RHSType = GetExpressionType(RHS.a, Context)
      if not RHSType.isUndefTy():
        return RoseType.getBitVectorTy(RHSType.getBitwidth() * 2)
      RHSType = GetExpressionType(RHS.b, Context)
      if not RHSType.isUndefTy():
        return RoseType.getBitVectorTy(RHSType.getBitwidth() * 2)
  
  # Now if we have a binary op performed with constant (integer),
  # we must take into account the minimum bitwidth required to
  # represent that constant.
  if type(RHS.a) == Number \
  and (type(RHS.b) == BitSlice or type(RHS.b) == BitIndex):
    RHSType = GetExpressionType(RHS.b, Context)
    if RHSType.isUndefTy():
      return RoseType.getUndefTy()
    # Binary operation can only be performed on bitvectors and integers
    # so getting bitwidth is OK.
    NumIntBits = RHS.a.val.bit_length()
    if NumIntBits > RHSType.getBitwidth():
      # We need to extend the size of the other operand
      if RHSType.isBitVectorTy():
        return RoseType.getBitVectorTy(NumIntBits)
      assert RHSType.isIntegerTy()
      return RoseType.getIntegerTy(NumIntBits)
  # Handle the other case
  if type(RHS.b) == Number \
   and (type(RHS.a) == BitSlice or type(RHS.a) == BitIndex):
    RHSType = GetExpressionType(RHS.a, Context)
    print("RHS TYPE:")
    RHSType.print()
    if RHSType.isUndefTy():
      return RoseType.getUndefTy()
    # Binary operation can only be performed on bitvectors and integers
    # so getting bitwidth is OK.
    NumIntBits = RHS.b.val.bit_length()
    print("NumIntBits:")
    print(NumIntBits)
    if NumIntBits > RHSType.getBitwidth():
      # We need to extend the size of the other operand
      if RHSType.isBitVectorTy():
        return RoseType.getBitVectorTy(NumIntBits)
      assert RHSType.isIntegerTy()
      return RoseType.getIntegerTy(NumIntBits)
  
  return RoseType.getUndefTy()


# We try to work out the type of the numbers in RHS.
# This is not meant to be deep. We will extend this
# if we need to.
def GetRHSNumberType(Update, Context : x86RoseContext):
  RHS = Update.rhs
  LHS = Update.lhs

  # If the RHS is just a number, use the LHS type.
  if type(RHS) == Number:
    return GetExpressionType(LHS, Context)

  # If the RHS is just a variable or a bitslice,
  # Just get its type
  if type(RHS) == Var or type(RHS) == BitIndex \
  or type(RHS) == BitSlice:
    RHSType = GetExpressionType(RHS, Context)
    if not RHSType.isUndefTy():
      return RHSType
    return GetExpressionType(LHS, Context)

  if type(RHS) == UnaryExpr:
    RHSType = GetExpressionType(RHS.a, Context)
    if not RHSType.isUndefTy():
      return RHSType
    return GetExpressionType(LHS, Context)
  
  if type(RHS) == BinaryExpr:
    RHSType = GetRHSTypeForSpecialCases(RHS, Context)
    if not RHSType.isUndefTy():
      return RHSType
    RHSType = GetExpressionType(RHS.a, Context)
    if not RHSType.isUndefTy():
      return RHSType
    RHSType = GetExpressionType(RHS.b, Context)
    if not RHSType.isUndefTy():
      return RHSType
    # Binary ops outside of comparison ops have the 
    # same type as operands, so we could try that.
    if RHS.op not in ComparisonOps:
      return GetExpressionType(LHS, Context)
    return RoseType.getUndefTy()
  
  # See if the RHS is a select op
  if type(RHS) == Select:
    # The condition cannot be a number. Assert that here.
    assert type(RHS.cond) != Number
    RHSType = GetExpressionType(RHS.then, Context)
    if not RHSType.isUndefTy():
      return RHSType
    RHSType = GetExpressionType(RHS.otherwise, Context)
    if not RHSType.isUndefTy():
      return RHSType
    print("SELECT LHS BEING ANALYZED")
    return GetExpressionType(LHS, Context)

  # If we do not know what the RHS is, we just give up.
  return RoseType.getUndefTy()


def CompileUpdate(Update, Context : x86RoseContext):
  # We need to get the type of numbers on the RHS
  OriginalNumberTy = Context.getNumberType()
  PredictedType = GetRHSNumberType(Update, Context)
  if not PredictedType.isUndefTy():
    Context.setNumberType(PredictedType)
  else:
    print("!!!!!!! LHS TYPE UNDEFINED")
  
  print("COMPILE UPDATE")
  print("UPDATE:")
  print(Update)
  print("COMPILING RHS")
  RHSExprVal = CompileExpression(Update.rhs, Context)
  Context.setNumberType(OriginalNumberTy)
  print(type(RHSExprVal))
  print("COMPILED RHS")
  RHSExprVal.print()

  if type(Update.lhs) == Var:
    # Get the ID associated with the RHS value
    ID = Update.rhs.id
    # Update the ID associated with this variable name
    Context.addVariable(Update.lhs.name, ID)
    return RHSExprVal

  # We should be compiling the bitslice as LHS now
  if type(Update.lhs) == BitSlice:
    print(Update.lhs)
    print(Update)
    print(Update.lhs.lo)
    print(Context.getCompiledAbstractions())
    print(Context.getDefinedVariables())
    print("*************************************")
    # Compile the LHS Bitslice
    # Compile the low index
    Low = CompileIndex(Update.lhs.lo, Context)
    # Compile the high index
    #OriginalNumberTy = Context.getIndexNumberType()
    #Context.setIndexNumberType(Low.getType())
    if (type(Update.lhs.hi) == Var and Update.lhs.hi.name == 'MAX'):
      MaxVectorLength = Context.getMaxVectorLength()
      High = RoseConstant.create(MaxVectorLength - 1, RoseType.getIntegerTy(32))
    else:
      High = CompileIndex(Update.lhs.hi, Context)
    #Context.setIndexNumberType(OriginalNumberTy)
    # Compile the bitvector
    BitVector = CompileExpression(Update.lhs.bv, Context)
    print("BITVECTOR======:")
    BitVector.print()
    Low.print()
    High.print()
    # Do some sanity check if possible
    if isinstance(Low, RoseConstant):
      assert Low.getValue() >= 0 and Low.getValue() < BitVector.getType().getBitwidth()
    if isinstance(High, RoseConstant):
      assert High.getValue() >= 0 and High.getValue() < BitVector.getType().getBitwidth()
    if isinstance(Low, RoseConstant) and isinstance(High, RoseConstant):
      assert High.getValue() >= Low.getValue()
    # Compute the bitwidth that is inserted in this slice
    Bitwidth = ComputeBitSliceWidth(Low, High, BitVector.getType().getBitwidth())
    print("^^^^^Bitwidth:")
    print(Bitwidth)
    BitwidthValue = RoseConstant.create(Bitwidth, Low.getType())
    print("!!!!!RHSExprVal:")
    RHSExprVal.getType().print()
    # Add an bitslice operation
    LHSOp = RoseBVInsertSliceOp.create(RHSExprVal, BitVector, Low, High, BitwidthValue)
    print("BIT SLICE INSERT OP:")
    LHSOp.print()
  else:
    # This could be a mask generator
    assert type(Update.lhs) == BitIndex
    # Compile the LHS mask
    IndexVal = CompileExpression(Update.lhs.idx, Context)
    print("---INDEX:")
    print(IndexVal)
    IndexVal.print()
    # Compile the vector
    BitVector = CompileExpression(Update.lhs.obj, Context)
    print("---VECTOR:")
    print(BitVector)
    BitVector.print()
    print("---RHSExprVal:")
    print(RHSExprVal)
    RHSExprVal.print()
    RHSExprVal.getType().print()
    # The bit slice size here is 1 bit
    BitwidthValue = RoseConstant.create(1, IndexVal.getType())
    # Compile the op
    LHSOp = RoseBVInsertSliceOp.create(RHSExprVal, BitVector, IndexVal, IndexVal, BitwidthValue)
    print("---BIT SLICE INSERT OP:")
    LHSOp.print()

  # Add the op to the IR
  Context.addAbstractionToIR(LHSOp)
  
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
  Context.addAbstractionToIR(Operation)
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
  Operation = UnaryOps[UnaryExpr.op]()(UnaryExpr.id, Value)
  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context
  Context.addCompiledAbstraction(UnaryExpr.id, Operation)
  return Operation


def CompileBinaryExpr(BinaryExpr, Context : x86RoseContext):
    # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(BinaryExpr.id):
    return Context.getCompiledAbstractionForID(BinaryExpr.id)

  print("COMPILING BINARY EXPRESSION")
  print("BINARY EXPR:")
  print(BinaryExpr)
  # Compile the operands
  Operand1 = CompileExpression(BinaryExpr.a, Context)
  Operand2 = CompileExpression(BinaryExpr.b, Context)
  print("--Operand1:")
  Operand1.print()
  Operand1.getType().print()
  print("--Operand2:")
  Operand2.print()
  Operand2.getType().print()

  # We have to deal with the special case
  ExtendOperandSize = False
  OperandBitwidth = None
  if (type(BinaryExpr.a) == BitSlice and type(BinaryExpr.b) == BitSlice) \
  or (type(BinaryExpr.a) == BitIndex and type(BinaryExpr.b) == BitIndex):
    if NeedToExtendOperandSize(BinaryExpr.op):
      # We need to sign extend the operands first. Double the operands' bitwidths
      assert Operand1.getType().getBitwidth() == Operand2.getType().getBitwidth()
      OperandBitwidth = 2 * Operand1.getType().getBitwidth()
      Operand1 = RoseBVSignExtendOp.create("sext." + Operand1.getName(), \
                          Operand1, OperandBitwidth)
      Operand2 = RoseBVSignExtendOp.create("sext." + Operand2.getName(), \
                          Operand2, OperandBitwidth)
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand1)
      Context.addAbstractionToIR(Operand2)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand1.getName(), Operand1)
      Context.addCompiledAbstraction(Operand2.getName(), Operand2)
      ExtendOperandSize = True
  
  # There are cases where zero_extend(x) * zero_extend(y) need to be extended further.
  if type(BinaryExpr.a) == Call and type(BinaryExpr.b) == Call:
    if BinaryExpr.a.funcname in ZeroExtendsSize \
   and BinaryExpr.b.funcname in ZeroExtendsSize:
      # Double the operands' bitwidths
      assert Operand1.getType().getBitwidth() == Operand2.getType().getBitwidth()
      OperandBitwidth = 2 * Operand1.getType().getBitwidth()
      Operand1 = RoseBVZeroExtendOp.create("zext." + Operand1.getName(), \
                          Operand1, OperandBitwidth)
      Operand2 = RoseBVZeroExtendOp.create("zext." + Operand2.getName(), \
                          Operand2, OperandBitwidth)      
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand1)
      Context.addAbstractionToIR(Operand2)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand1.getName(), Operand1)
      Context.addCompiledAbstraction(Operand2.getName(), Operand2)
      ExtendOperandSize = True
  
  # There are cases where bitvectors are multiplied to larger numbers
  if type(BinaryExpr.a) == Number \
  and (type(BinaryExpr.b) == BitSlice or type(BinaryExpr.b) == BitIndex):
    NumIntBits = BinaryExpr.a.val.bit_length()
    if NumIntBits > Operand2.getType().getBitwidth():
      # We need to extend the size of the other operand
      Operand2 = RoseBVZeroExtendOp.create("zext." + Operand2.getName(), \
                                            Operand2, NumIntBits)
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand2)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand2.getName(), Operand2)
      ExtendOperandSize = True
  if type(BinaryExpr.b) == Number \
  and (type(BinaryExpr.a) == BitSlice or type(BinaryExpr.a) == BitIndex):
    NumIntBits = BinaryExpr.b.val.bit_length()
    if NumIntBits > Operand1.getType().getBitwidth():
      # We need to extend the size of the other operand
      Operand1 = RoseBVZeroExtendOp.create("zext." + Operand1.getName(), \
                                            Operand1, NumIntBits)
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand1)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand1.getName(), Operand1)
      ExtendOperandSize = True
  print("Operand1:")
  Operand1.print()
  Operand1.getType().print()
  print("Operand2:")
  Operand2.print()
  Operand2.getType().print()
  # Fix the constants' bitwidths
  if Operand1.getType() != Operand2.getType():
    if isinstance(Operand1, RoseConstant):
      Operand1 = RoseConstant.create(Operand1.getValue(), Operand2.getType())
    else:
      assert isinstance(Operand2, RoseConstant)
      Operand2 = RoseConstant.create(Operand2.getValue(), Operand1.getType())

  print('OPERAND1:')
  Operand1.print()
  print(Operand1.getType())
  print("OPERAND2:")
  Operand2.print()
  print(Operand2.getType())

  # Compile the binary operation
  print("GENERATING BINARY OP")
  Operation = BinaryOps[BinaryExpr.op]()(BinaryExpr.id, Operand1, Operand2)
  print("BINARY OP GENERATED")

  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)

  # Add the operation to the context
  Context.addCompiledAbstraction(BinaryExpr.id, Operation)
  print("BINARY OP COMPILED")

  # Now add the operation as an op that has already extended operand sizes
  if ExtendOperandSize == True:
    Context.addSizeExtended(Operation, OperandBitwidth)
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
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context (although this is unnecessary)
  Context.addCompiledAbstraction(ReturnStmt.id, Operation)
  return Operation


# Checks if extension has been performed already
# sign_extend(x * y) = sign_extend(x) * sign_extend(y)
def BuiltinOpPerformed(CallStmt, ArgValuesList : list, Context : x86RoseContext):
  if CallStmt.funcname not in BuiltinExtendsSize:
    return False
  # Builtin extends size. Check if we have already done that.
  [Operation] = ArgValuesList
  if not Context.isSizeExtended(Operation):
    return False
  # So the operands have alrady been extended. 
  # Now we need to ensure the size of operation is the same
  # as what we intend to extend using the builtin.
  BuiltinExtendSize = BuiltinExtendsSize[CallStmt.funcname]
  if BuiltinExtendSize != Context.getExtendedSize(Operation):
    # The size to which the builtin will extend has to be greater
    # than the size to which extension has already taken place.
    assert BuiltinExtendSize > Context.getExtendedSize(Operation)
    return False
  # So thefre is nothing to do
  print("SKIP BUILTIN")
  return True
  

def CompileBuiltIn(CallStmt, Context : x86RoseContext):
  # If the call is compiled, no need to recompile
  if Context.isCompiledAbstraction(CallStmt.id):
    return Context.getCompiledAbstractionForID(CallStmt.id)

  # Function name has to be one of the bultins
  assert CallStmt.funcname in Builtins

  # Compile function call arguments first
  print("COMPILE ARGUMENTS")
  ArgValuesList = list()
  for Arg in CallStmt.args:
    CompiledArg = CompileExpression(Arg, Context)
    # Argument type cannot be undefined or void
    assert not CompiledArg.getType().isVoidTy() and not CompiledArg.getType().isUndefTy()
    ArgValuesList.append(CompiledArg)
  print("ARGUMENTS COMPILED")

  # Now we have to deal with one special case
  # where we hvae already performed the buitin operation.
  if BuiltinOpPerformed(CallStmt, ArgValuesList, Context) == True:
    # Nothing to do. Just map this operation id to its operand's operation.
    # There is nothing new to add to the IR.
    [Operation] = ArgValuesList
    Context.addCompiledAbstraction(CallStmt.id, Operation)
    return Operation
  
  # Check if this is a call to a builtin function
  Operation = Builtins[CallStmt.funcname](CallStmt.id, ArgValuesList)
  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context
  Context.addCompiledAbstraction(CallStmt.id, Operation)
  return Operation


def CompileCall(CallStmt, Context : x86RoseContext):
  print("COMPILE CALL")
  # If this is a builtin function call, just compile it.
  if CallStmt.funcname in Builtins:
    return CompileBuiltIn(CallStmt, Context)

   # If the call is compiled, no need to recompile
  if Context.isCompiledAbstraction(CallStmt.id):
    return Context.getCompiledAbstractionForID(CallStmt.id)

  # Try to get the types of the arguments first
  print("TRYING TO GET TYPES OF ARGUMENTS")
  ArgTypesUndefined = False
  ArgsTypeList = list()
  for Arg in CallStmt.args:
    ArgType = GetExpressionType(Arg, Context)
    # Argument type cannot be undefined or void
    assert not ArgType.isVoidTy()
    if ArgType.isUndefTy():
      ArgTypesUndefined = True
      break
    ArgsTypeList.append(ArgType)
  print("ARGUMENTS TYPES FOUND")

  # Compile the arguments (we have no other choice)
  ArgValuesList = list()
  if ArgTypesUndefined == True:
    print("COMPILE ARGUMENTS")
    for Arg in CallStmt.args:
      CompiledArg = CompileExpression(Arg, Context)
      # Argument type cannot be undefined or void
      assert not CompiledArg.getType().isVoidTy() and not CompiledArg.getType().isUndefTy()
      ArgValuesList.append(CompiledArg)
    ArgsTypeList = [Arg.getType() for Arg in ArgValuesList]
    print("ARGUMENTS COMPILED")

  # This is a function call
  FunctionDef = Context.getFunctionDef(CallStmt.funcname)
  assert len(FunctionDef.params) == len(CallStmt.args)

  # Check if we are compiling this function for the first time
  if Context.isCompiledAbstraction(FunctionDef.id) == False:
    print("COMPILING FUNCTION")
    ChildContext = x86RoseContext()
    FuncArgList = []
    for Index  in range(len(FunctionDef.params)):
      Param = FunctionDef.params[Index]
      ArgType = ArgsTypeList[Index]
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
        ParamWidth = ArgType.getBitwidth()
      print("ParamWidth:")
      print(ParamWidth)
      print("Arg.getType().getBitwidth():")
      print(ArgType.getBitwidth())
      assert ArgType.getBitwidth() == ParamWidth
      ArgVal = RoseArgument.create(ParamName, ArgType, RoseUndefValue(), Index)
      ChildContext.addVariable(ParamName, Param.id)
      FuncArgList.append(ArgVal)
      print("PARAM NAME:")
      print(ParamName)
    
    # Compile the function and its arguments
    print("GENERATE FUNCTION")
    Function = RoseFunction.create(CallStmt.funcname, FuncArgList, RoseType.getUndefTy())
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
    CompiledFunction = ChildContext.getRootAbstraction()

    # Set the return value for this function
    CompiledFunction.setRetVal(ReturnValue)

    # Add this function to the root abstraction and update context
    Context.addAbstractionToIR(CompiledFunction)

    # Update the compiled function in this context now
    Context.updateCompiledAbstraction(FunctionDef.id, CompiledFunction)

    # Destroy the child context now
    Context.destroyContext(FunctionDef.id)
    print("COMPILED FUNCITON:")
    CompiledFunction.print()
  
  # Compile the function call arguments now
  if ArgTypesUndefined == False:
    print("COMPILE ARGUMENTS")
    ArgValuesList = list()
    for Arg in CallStmt.args:
      CompiledArg = CompileExpression(Arg, Context)
      # Argument type cannot be undefined or void
      assert not CompiledArg.getType().isVoidTy() and not CompiledArg.getType().isUndefTy()
      ArgValuesList.append(CompiledArg)
    print("ARGUMENTS COMPILED")

  # Compile call statement now.
  Function = Context.getCompiledAbstractionForID(FunctionDef.id)
  FunctionCall = RoseCallOp.create(CallStmt.id, Function, ArgValuesList)
  print(FunctionCall)
  # Add the op to the IR
  Context.addAbstractionToIR(FunctionCall)
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
  print("COMPILING FOR LOOP")
  print("FOR EXPR:")
  print(ForStmt)
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
  print("ITERATOR:")
  print(Loop.getIterator())
  Loop.getIterator().print()
  print(Loop.getIterator().getType())
  ChildContext.addVariable(ForStmt.iterator.name, ForStmt.iterator.id)
  ChildContext.addCompiledAbstraction(ForStmt.iterator.id, Loop.getIterator())

  # Comoile all the statements in this loop
  for Stmt in ForStmt.body:
    CompileStatement(Stmt, ChildContext)
  
  # Pop the root loop from the child context 
  CompiledLoop = ChildContext.getRootAbstraction()

  # Add loop to the root abstraction
  Context.addAbstractionToIR(CompiledLoop)

  # Update the compiled loop to the current context
  Context.updateCompiledAbstraction(ForStmt.id, CompiledLoop)

  # Remove the child context now
  print("REMOVE CHILD CONTEXT")
  Context.destroyContext(ForStmt.id)


def CompileIf(IfStmt, Context : x86RoseContext):
  # Generate a cond region
  Cond = CompileExpression(IfStmt.cond, Context)
  CondRegion = RoseCond.create(Cond)

  # Add cond region as root abstraction 
  ChildContext = x86RoseContext()
  ChildContext.pushRootAbstraction(CondRegion)

  # Add the generated cond region to the current context
  Context.addCompiledAbstraction(IfStmt.id, CondRegion)

  # Add a new context for this loop
  Context.createContext(IfStmt.id, ChildContext)

  # Compile all the statements in this cond region
  for Stmt in IfStmt.then:
    CompileStatement(Stmt, ChildContext)
  for Stmt in IfStmt.otherwise:
    CompileStatement(Stmt, ChildContext)

  # Pop the root cond region from the child context 
  CompiledCondRegion = ChildContext.getRootAbstraction()

  # Add cond region to the root abstraction
  Context.addAbstractionToIR(CompiledCondRegion)

  # Update the compiled cond region to the current context
  Context.updateCompiledAbstraction(IfStmt.id, CompiledCondRegion)

  # Remove the child context now
  Context.destroyContext(IfStmt.id)


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
  CompiledFunction = RootContext.getRootAbstraction()

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
  BitIndex : CompileBitIndex,
  #While: CompileWhile,
  #Match: CompileMatch,
  #Lookup: CompileLookup,
}


def HandleToSignExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseBVSignExtendOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToZeroExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    if Value.getType().getBitwidth() > Bitwidth:
      return Value
    return RoseBVZeroExtendOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


# TODO: Take into account signedness
def HandleToMin(_):
  def LamdaImplFunc(Name : str, Operands : list):
    assert len(Operands) == 2
    if Operands[0].getType().isBitVectorTy() \
    and Operands[1].getType().isBitVectorTy():
      return RoseBVSminOp.create(Name, Operands)
    return RoseMinOp.create(Name, Operands)
  
  return LamdaImplFunc


# TODO: Take into account signedness
def HandleToMax(_):
  def LamdaImplFunc(Name : str, Operands : list):
    assert len(Operands) == 2
    if Operands[0].getType().isBitVectorTy() \
    and Operands[1].getType().isBitVectorTy():
      return RoseBVSmaxOp.create(Name, Operands)
    return RoseMaxOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToSSaturate(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    assert Value.getType().getBitwidth() >= Bitwidth
    return RoseBVSSaturateOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToUSaturate(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args):
    [Value] = Args
    assert Value.getType().isBitVectorTy() == True
    assert Value.getType().getBitwidth() >= Bitwidth
    return RoseBVUSaturateOp.create(Name, Value, Bitwidth)
  
  return LamdaImplFunc


def HandleToAbs(_):
  def LamdaImplFunc(Name : str, Operands : list):
    assert len(Operands) == 1
    [Value] = Operands
    return RoseAbsOp.create(Name, Value)
  
  return LamdaImplFunc


def HandleToInt(_):
  def LamdaImplFunc(_, Operands : list):
    assert len(Operands) == 1
    [Value] = Operands
    assert Value.getType().isBitVectorTy() == True
    return Value
  
  return LamdaImplFunc


def HandleToRemainder(_):
  def LamdaImplFunc(Name : str, Operands : list):
    assert len(Operands) == 2
    if Operands[0].getType().isBitVectorTy() \
    and Operands[1].getType().isBitVectorTy():
      return RoseBVSremOp.create(Name, Operands[0], Operands[1])
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

  'MIN' : HandleToMin(None),
  'MAX' : HandleToMax(None),

  'ABS' : HandleToAbs(None),

  'Int' : HandleToInt(None),

  'REMAINDER' : HandleToRemainder(None),
}

# Extends size
BuiltinExtendsSize = {
   'ZeroExtend16' : 16, 
   'ZeroExtend32' : 32, 
   'ZeroExtend64' : 64,
   'SignExtend16' : 16, 
   'SignExtend32' : 32, 
   'SignExtend64' : 64, 
}

ZeroExtendsSize = [ 'ZeroExtend16', 'ZeroExtend32', 'ZeroExtend64' ]


def HandleToNot():
  def LamdaImplFunc(Name : str, Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseBVNotOp.create(Name, Value)
  
  return LamdaImplFunc


def HandleToNeg():
  def LamdaImplFunc(Name : str, Value):
    assert Value.getType().isBitVectorTy() == True
    return RoseBVNegOp.create(Name, Value)
  
  return LamdaImplFunc


# Some unary oprations
UnaryOps = {
    'NOT': HandleToNot,
    '-': HandleToNeg,
    '~': HandleToNot,
}


def HandleToAdd():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    Operands = [Operand1, Operand2]
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVAddOp.create(Name, Operands)
    return RoseAddOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToSub():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    Operands = [Operand1, Operand2]
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSubOp.create(Name, Operands)
    return RoseSubOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToMul():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    Operands = [Operand1, Operand2]
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVMulOp.create(Name, Operands)
    return RoseMulOp.create(Name, Operands)
  
  return LamdaImplFunc


# TODO: Take signedness into account
def HandleToDiv():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSdivOp.create(Name, Operand1, Operand2)
    return RoseDivOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToMod():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSmodOp.create(Name, Operand1, Operand2)
    return RoseModOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToOr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    Operands = [Operand1, Operand2]
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVOrOp.create(Name, Operands)
    return RoseOrOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToXor():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      Operands = [Operand1, Operand2]
      return RoseBVXorOp.create(Name, Operands)
    return RoseXorOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToAnd():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    Operands = [Operand1, Operand2]
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVAndOp.create(Name, Operands)
    return RoseAndOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVEQOp.create(Name, Operand1, Operand2)
    return RoseEQOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToNotEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVNEQOp.create(Name, Operand1, Operand2)
    return RoseNEQOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLessThan():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSLTOp.create(Name, Operand1, Operand2)
    return RoseLTOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLessThanEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSLEOp.create(Name, Operand1, Operand2)
    return RoseLEOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToGreaterThan():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSGTOp.create(Name, Operand1, Operand2)
    return RoseGTOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToGreaterThanEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    if Operand1.getType().isBitVectorTy() \
    and Operand2.getType().isBitVectorTy():
      return RoseBVSGEOp.create(Name, Operand1, Operand2)
    return RoseGEOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToAshr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseBVAshrOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLshr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue):
    assert Operand1.getType().isBitVectorTy() == True
    assert Operand2.getType().isBitVectorTy() == True
    return RoseBVLshrOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


BinaryOps = {
    '+': HandleToAdd,
    '-' : HandleToSub,
    '*' : HandleToMul,
    '/' : HandleToDiv,
    '%' : HandleToMod,
    '<' : HandleToLessThan,
    '<=' : HandleToLessThanEqual,
    '>' : HandleToGreaterThan,
    '>=' : HandleToGreaterThanEqual,
    '==' : HandleToEqual,
    '!=' : HandleToNotEqual,
    '>>' : HandleToAshr,
    '<<' : HandleToLshr,
    '&' : HandleToAnd,
    '|' : HandleToOr,
    'AND' : HandleToAnd,
    'OR' : HandleToOr,
    'XOR' : HandleToXor,
}

def NeedToExtendOperandSize(Op):
  if Op == "*" or Op == '/':
    return True
  return False

# These are binary ops whose output type is not the same
# as the operand types.
ComparisonOps = [ '<', '<=', '>', '>=', '==', '!=']

# Strides definitions
Strides = {
  'bit': 1,
  'byte': 8,
  'word': 16,
  'dword': 32,
  'qword': 64,
  'm128': 128,
}


def Compile():
  from PseudoCodeParser import GetSemaFromXML
  import xml.etree.ElementTree as ET

  sema = test11()
  print(sema)
  intrin_node = ET.fromstring(sema)
  spec = GetSemaFromXML(intrin_node)
  print(spec)
  CompiledFunction = CompileSemantics(spec)


def test1():
  return '''
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

def test2():
  return '''
<intrinsic tech="AVX2" name="_mm256_unpacklo_epi16">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<parameter type="__m256i" varname="b" etype="UI16"/>
	<description>Unpack and interleave 16-bit integers from the low half of each 128-bit lane in "a" and "b", and store the results in "dst".</description>
	<operation>
DEFINE INTERLEAVE_WORDS(src1[127:0], src2[127:0]) {
	dst[15:0] := src1[15:0] 
	dst[31:16] := src2[15:0] 
	dst[47:32] := src1[31:16] 
	dst[63:48] := src2[31:16] 
	dst[79:64] := src1[47:32] 
	dst[95:80] := src2[47:32] 
	dst[111:96] := src1[63:48] 
	dst[127:112] := src2[63:48] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_WORDS(a[127:0], b[127:0])
dst[255:128] := INTERLEAVE_WORDS(a[255:128], b[255:128])
	</operation>
	<instruction name="VPUNPCKLWD" form="ymm, ymm, ymm" xed="VPUNPCKLWD_YMMqq_YMMqq_YMMqq"/>
	<header>immintrin.h</header>
</intrinsic>
  '''


def test3():
  return '''
<intrinsic tech="AVX2" name="_mm_broadcastb_epi8">
	<type>Integer</type>
	<CPUID>AVX2</CPUID>
	<category>Swizzle</category>
	<return type="__m128i" varname="dst" etype="UI8"/>
	<parameter type="__m128i" varname="a" etype="UI8"/>
	<description>Broadcast the low packed 8-bit integer from "a" to all elements of "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	dst[i+7:i] := a[7:0]
ENDFOR
	</operation>
	<instruction name="VPBROADCASTB" form="xmm, xmm" xed="VPBROADCASTB_XMMdq_XMMb"/>
	<header>immintrin.h</header>
</intrinsic>
  '''
#dst[MAX:128] := 0


def test4():
  return '''
<intrinsic tech="SSSE3" vexEq="TRUE" name="_mm_hadd_epi16">
	<type>Integer</type>
	<CPUID>SSSE3</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI16"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Horizontally add adjacent pairs of 16-bit integers in "a" and "b", and pack the signed 16-bit results in "dst".</description>
	<operation>
dst[15:0] := a[31:16] + a[15:0]
dst[31:16] := a[63:48] + a[47:32]
dst[47:32] := a[95:80] + a[79:64]
dst[63:48] := a[127:112] + a[111:96]
dst[79:64] := b[31:16] + b[15:0]
dst[95:80] := b[63:48] + b[47:32]
dst[111:96] := b[95:80] + b[79:64]
dst[127:112] := b[127:112] + b[111:96]
	</operation>
	<instruction name="PHADDW" form="xmm, xmm" xed="PHADDW_XMMdq_XMMdq"/>
	<header>tmmintrin.h</header>
</intrinsic>
  '''

def test5():
  return '''
<intrinsic tech="AVX-512" name="_mm_cmpeq_epi8_mask">
	<type>Integer</type>
	<type>Mask</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Compare</category>
	<return type="__mmask16" varname="k" etype="MASK"/>
	<parameter type="__m128i" varname="a" etype="SI8"/>
	<parameter type="__m128i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b" for equality, and store the results in mask vector "k".</description>
	<operation>
FOR j := 0 to 15
	i := j*8
	k[j] := ( a[i+7:i] == b[i+7:i] ) ? 1 : 0
ENDFOR
	</operation>
	<instruction name="VPCMPB" form="k, xmm, xmm" xed="VPCMPB_MASKmskw_MASKmskw_XMMi8_XMMi8_IMM8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
  '''
#k[MAX:16] := 0


def test6():
  return '''
<intrinsic tech="AVX" name="_mm256_setr_m128i">
	<type>Integer</type>
	<CPUID>AVX</CPUID>
	<category>Set</category>
	<return type="__m256i" varname="dst" etype="M128"/>
	<parameter type="__m128i" varname="lo" etype="M128"/>
	<parameter type="__m128i" varname="hi" etype="M128"/>
	<description>Set packed __m256i vector "dst" with the supplied values.</description>
	<operation>
dst[127:0] := lo[127:0]
dst[255:128] := hi[127:0]
	</operation>
	<instruction name="VINSERTF128" form="ymm, ymm, xmm, imm8" xed="VINSERTF128_YMMqq_YMMqq_XMMdq_IMMb"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test7():
  return '''
<intrinsic tech="AVX-512" name="_mm256_permutexvar_epi16">
	<type>Integer</type>
	<CPUID>AVX512VL</CPUID>
	<CPUID>AVX512BW</CPUID>
	<category>Miscellaneous</category>
	<return type="__m256i" varname="dst" etype="UI16"/>
	<parameter type="__m256i" varname="idx" etype="UI16"/>
	<parameter type="__m256i" varname="a" etype="UI16"/>
	<description>Shuffle 16-bit integers in "a" across lanes using the corresponding index in "idx", and store the results in "dst".</description>
	<operation>
FOR j := 0 to 15
	i := j*16
	id := idx[i+3:i]*16
	dst[i+15:i] := a[id+15:id]
ENDFOR
	</operation>
	<instruction name="VPERMW" form="ymm, ymm, ymm" xed="VPERMW_YMMu16_MASKmskw_YMMu16_YMMu16_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:256] := 0


def test8():
  return '''
<intrinsic tech="AVX-512" name="_mm512_min_epi8">
	<type>Integer</type>
	<CPUID>AVX512BW</CPUID>
	<category>Arithmetic</category>
	<return type="__m512i" varname="dst" etype="UI8"/>
	<parameter type="__m512i" varname="a" etype="SI8"/>
	<parameter type="__m512i" varname="b" etype="SI8"/>
	<description>Compare packed signed 8-bit integers in "a" and "b", and store packed minimum values in "dst".</description>
	<operation>
FOR j := 0 to 63
	i := j*8
	dst[i+7:i] := MIN(a[i+7:i], b[i+7:i])
ENDFOR
	</operation>
	<instruction name="VPMINSB" form="zmm, zmm, zmm" xed="VPMINSB_ZMMi8_MASKmskw_ZMMi8_ZMMi8_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst[MAX:512] := 0


def test9():
  return '''
<intrinsic tech="AVX-512" name="_mm_dpwssds_epi32">
	<type>Integer</type>
	<CPUID>AVX512_VNNI</CPUID>
	<CPUID>AVX512VL</CPUID>
	<category>Arithmetic</category>
	<return type="__m128i" varname="dst" etype="SI32"/>
	<parameter type="__m128i" varname="src" etype="SI32"/>
	<parameter type="__m128i" varname="a" etype="SI16"/>
	<parameter type="__m128i" varname="b" etype="SI16"/>
	<description>Multiply groups of 2 adjacent pairs of signed 16-bit integers in "a" with corresponding 16-bit integers in "b", producing 2 intermediate signed 32-bit results. Sum these 2 results with the corresponding 32-bit integer in "src" using signed saturation, and store the packed 32-bit results in "dst".</description>
	<operation>
FOR j := 0 to 3
	tmp1.dword := SignExtend32(a.word[2*j]) * SignExtend32(b.word[2*j])
	tmp2.dword := SignExtend32(a.word[2*j+1]) * SignExtend32(b.word[2*j+1])
	dst.dword[j] := src.dword[j] + tmp1 + tmp2
ENDFOR
	</operation>
	<instruction name="VPDPWSSDS" form="xmm, xmm, xmm" xed="VPDPWSSDS_XMMi32_MASKmskw_XMMi16_XMMu32_AVX512"/>
	<header>immintrin.h</header>
</intrinsic>
'''
#dst.dword[j] := Saturate32(src.dword[j] + tmp1 + tmp2)
#dst[MAX:128] := 0


def test10():
  return '''
;;<intrinsic tech="AVX-512/KNC" sequence="TRUE" name="_mm512_reduce_add_epi64">
;;	<type>Integer</type>
;;	<CPUID>AVX512F/KNCNI</CPUID>
;;	<category>Arithmetic</category>
;;	<return type="__int64" varname="dst" etype="UI64"/>
;;	<parameter type="__m512i" varname="a" etype="UI64"/>
;;	<description>Reduce the packed 64-bit integers in "a" by addition. Returns the sum of all elements in "a".</description>
;;	<operation>
;;dst[63:0] := 0
;;FOR j := 0 to 7
;;	i := j*64
;;	dst[63:0] := dst[63:0] + a[i+63:i]
;;ENDFOR
;;	</operation>
;;	<header>immintrin.h</header>
;;</intrinsic>
'''

def test11():
  return '''
<intrinsic tech="Other" name="_bswap64">
	<type>Integer</type>
	<category>Bit Manipulation</category>
	<return type="__int64" varname="dst" etype="UI64"/>
	<parameter type="__int64" varname="a" etype="UI64"/>
	<description>Reverse the byte order of 64-bit integer "a", and store the result in "dst". This intrinsic is provided for conversion between little and big endian values.</description>
	<operation>
dst[7:0] := a[63:56]
dst[15:8] := a[55:48]
dst[23:16] := a[47:40]
dst[31:24] := a[39:32]
dst[39:32] := a[31:24]
dst[47:40] := a[23:16]
dst[55:48] := a[15:8]
dst[63:56] := a[7:0]
	</operation>
	<instruction name="BSWAP" form="r64" xed="BSWAP_GPRv"/>
	<header>immintrin.h</header>
</intrinsic>
'''


if __name__ == '__main__':
  Compile()


