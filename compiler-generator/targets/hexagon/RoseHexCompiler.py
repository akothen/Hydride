
###################################################################
#
# Support compilation of HVX pseudocode to Rosette IR.
#
###################################################################


from contextvars import Context
from RoseTypes import *
from RoseValue import RoseValue
from RoseAbstractions import *
from RoseValues import *
from RoseOperations import *
from RoseBitVectorOperations import *
from RoseContext import *

from RoseHexCommon import *
from HexAST import *
from RoseHexTypes import *

import math


# This defines rules specifically for x86 to RoseIR convertion
class HexRoseContext(RoseContext):
  def __init__(self):
    # Maximum vector length
    self.MaxVectorLength = HVXVectorWidth
    # Track the ids that have been extended.
    self.SizeExtended = dict()
    # Integer constant length can change depending on the context in which 
    # is used.
    self.NumberType = RoseIntegerType.create(32)
    #self.IndexNumberType = RoseIntegerType.create(32)
    self.CompileIndexFlag = False
    super().__init__()
  
  def getMaxVectorLength(self):
    return self.MaxVectorLength
  
  def setMaxVectorLength(self, Length : int):
    self.MaxVectorLength = Length

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
    assert isinstance(ChildContext, HexRoseContext)
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



def CompileNumber(Num, Context : HexRoseContext):
  print("COMPILE NUMBER")
  print("NUM:")
  print(Num)
  if Context.isCompileIndexFlagSet():
    ConstantVal = RoseConstant.create(Num.val, RoseIntegerType.create(32))
    #Context.getIndexNumberType())
  else:
    ConstantVal = RoseConstant.create(Num.val, Context.getNumberType())
  Context.addSignednessInfoForValue(ConstantVal, IsSigned=(ConstantVal.getValue() < 0))
  return ConstantVal


def CompileVar(Variable, Context):
  print("COMPILE VARIABLE")
  print("VARIABLE:")
  print(Variable)
  # Check if the variable is already defined and cached. If yes, just return that.
  if Context.isVariableDefined(Variable.name):
    ID = Context.getVariableID(Variable.name)
    return Context.getCompiledAbstractionForID(ID)

  # Create a new rose value. We do not know the bitwidth, so use the maximum bitwidth
  CompiledVar = RoseValue.create(Variable.name, \
          RoseBitVectorType.create(Context.getMaxVectorLength()))

  # Add the variable info to the context
  Context.addVariable(Variable.name, Variable.id)
  Context.addCompiledAbstraction(Variable.id, CompiledVar)
  
  return CompiledVar


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

  # Account for cases here the low and the high indices are the same.
  if not isinstance(High, RoseOperation) \
    and not isinstance(Low, RoseOperation):
    if Low == High:
      return 1
  elif isinstance(High, RoseOperation) \
    and isinstance(Low, RoseOperation):
    if Low.isSameAs(High):
      return 1

  # Just handle one _very_ common case where high = i + some_constant
  # But let's deal with special case first because of the silly case in 
  # HVX pseudocode.
  print("BEFORE HIGH:")
  High.print()
  ConstantMinus = RoseUndefValue()
  if isinstance(High, RoseSubOp):
    if isinstance(High.getOperand(0), RoseConstant):
      ConstantMinus = High.getOperand(0)
      High = High.getOperand(1)
    else:
      assert isinstance(High.getOperand(1), RoseConstant)
      ConstantMinus = High.getOperand(1)
      High = High.getOperand(0)
    # Strip high index of any casts
    if isinstance(High, RoseCastOp) \
    or isinstance(High, RoseBVSignExtendOp) \
    or isinstance(High, RoseBVZeroExtendOp):
      High = High.getOperand(0)
  
  print("ConstantMinus:")
  ConstantMinus.print()
  print("AFTER HIGH:")
  High.print()
  # Now let's continue with the more intuitive case
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
  if isinstance(HighIndexValue, RoseOperation) \
  and isinstance(Low, RoseOperation):
    if Low.isSameAs(HighIndexValue):
      if ConstantMinus == RoseUndefValue():
        return (ConstantHighIndex.getValue() + 1)
      return (ConstantHighIndex.getValue() - ConstantMinus.getValue() + 1)
  
  if not isinstance(HighIndexValue, RoseOperation) \
  and not isinstance(Low, RoseOperation):
    if Low == HighIndexValue:
      if ConstantMinus == RoseUndefValue():
        return (ConstantHighIndex.getValue() + 1)
      return (ConstantHighIndex.getValue() - ConstantMinus.getValue() + 1)

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
  if ConstantMinus == RoseUndefValue():
    assert ConstantHighIndex.getValue() >= ConstantLowIndex.getValue()
    return (ConstantHighIndex.getValue() - ConstantLowIndex.getValue() + 1)
  # Constant mimus is defined
  assert (ConstantHighIndex.getValue() - ConstantMinus.getValue()) \
                                    >= ConstantLowIndex.getValue()
  return ((ConstantHighIndex.getValue() - ConstantMinus.getValue()) \
                                - ConstantLowIndex.getValue() + 1)


def CompileIndex(IndexExpr, Context : HexRoseContext):
  print("COMPILING AN INDEX EXPRESSION:")
  print("IndexExpr:")
  print(IndexExpr)
  Context.setCompileIndexFlag(True)
  CompiledIndex = CompileExpression(IndexExpr, Context)
  Context.setCompileIndexFlag(False)
  # The compiled indices are supposed to be integer values
  # and not bitvectors. However, in some cases it can be a bitvector
  # where indices are in a bitvector. We just change cast the index value.
  if isinstance(CompiledIndex.getType(), RoseBitVectorType):
    print("GENERATING CAST")
    # Indices can only be variables for them to be cast
    assert type(IndexExpr) == Var
    assert Context.isVariableDefined(IndexExpr.name)
    ID = Context.getVariableID(IndexExpr.name)
    assert Context.getCompiledAbstractionForID(ID) == CompiledIndex
    # Generate the casting op
    #Name = "cast." + CompiledIndex.getName()
    CastOp = RoseCastOp.create(Context.genName(), CompiledIndex, \
                  RoseIntegerType.create(CompiledIndex.getType().getBitwidth()))
    # Add this op to the IR and to the context
    Context.addAbstractionToIR(CastOp)
    Context.addCompiledAbstraction(ID, CastOp)
    return CastOp
  return CompiledIndex


def CompileBitSlice(BitSliceExpr, Context : RoseContext):
  print("COMPILE BITSLICE")
  print("BITSLICE:")
  print(BitSliceExpr)
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(BitSliceExpr.id):
    return Context.getCompiledAbstractionForID(BitSliceExpr.id)

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
  High = CompileIndex(BitSliceExpr.hi, Context)
  #Context.setIndexNumberType(OriginalNumberTy)
  print("COMPILED HIGH")
  High.print()
  
  print("COMPILING BITVECTOR")
  BitVector = CompileExpression(BitSliceExpr.bv, Context)
  print("COMPILED BITVECTOR")
  BitVector.print()
  assert isinstance(BitVector.getType(), RoseBitVectorType)
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
  Operation = RoseBVExtractSliceOp.create(Context.genName(), \
                                  BitVector, Low, High, BitwidthValue)
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


def CompileBitIndex(IndexExpr, Context : HexRoseContext):
  print("COMPILING INDX EXPR")
  print("INDEX EXPR:")
  print(IndexExpr)
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(IndexExpr.id):
    return Context.getCompiledAbstractionForID(IndexExpr.id)

  # If the bitindex indexes intoa a variable, compile that.
  if type(IndexExpr.obj) == Var:
    # Compile the vector first
    Vector = CompileExpression(IndexExpr.obj, Context)
    # Element type of this variable must be known
    assert Context.isElemTypeOfVariableKnown(Vector.getName()) == True
    print("Vector.getName():")
    print(Vector.getName())
    ElemType = Context.getElemTypeOfVariable(Vector.getName())

    # Compile the low index
    IndexVal = CompileIndex(IndexExpr.idx, Context)
    CoFactor = RoseConstant.create(ElemType.getBitwidth(),\
                                  IndexVal.getType())
    LowIndex = RoseMulOp.create(Context.genName(), \
                              [CoFactor, IndexVal])
    # Get the high index
    BitwidthValue = CoFactor
    HighIndexOff = RoseConstant.create(BitwidthValue.getValue() - 1, \
                                      LowIndex.getType())
    HighIndex = RoseAddOp.create(Context.genName(), \
                                  [LowIndex, HighIndexOff])
    # Add the generated ops to the IR and the context
    Context.addAbstractionToIR(LowIndex)
    Context.addCompiledAbstraction(LowIndex.getName(), LowIndex)
    Context.addAbstractionToIR(HighIndex)
    Context.addCompiledAbstraction(LowIndex.getName(), HighIndex)
    # Now generate the bvextract op
    Operation = RoseBVExtractSliceOp.create(Context.genName(), Vector, \
                                      LowIndex, HighIndex, BitwidthValue)
  else:
    # Account for another case
    assert type(IndexExpr.obj) == ElemTypeInfo

    # Check for nested bit indices
    InnerBitIndex = IndexExpr.obj.obj
    if type(InnerBitIndex) == BitIndex:
      # Compile the innermost bit index first
      OuterBitIndex = IndexExpr
      OuterBitIndexType = HexTypes[OuterBitIndex.obj.elemtype]
      InnerBitIndexType = HexTypes[InnerBitIndex.obj.elemtype]
      print("OuterBitIndex.idx:")
      print(OuterBitIndex.idx)
      OuterIndex = CompileIndex(OuterBitIndex.idx, Context)
      InnerIndex = CompileIndex(InnerBitIndex.idx, Context)
      print("OuterBitIndex:")
      print(OuterBitIndex)
      print("InnerBitIndex:")
      print(InnerBitIndex)
      print("OuterBitIndexType:")
      OuterBitIndexType.print()
      print("InnerBitIndexType:")
      InnerBitIndexType.print()
      assert type(InnerBitIndex.obj.obj) == Var
      BitVector = CompileExpression(InnerBitIndex.obj.obj, Context)
      # First compute the low index
      OuterCoFactor = RoseConstant.create(OuterBitIndexType.getBitwidth(),\
                                    OuterIndex.getType())
      InnerCoFactor = RoseConstant.create(InnerBitIndexType.getBitwidth(),\
                                    InnerIndex.getType())
      print("OuterCoFactor:")
      OuterCoFactor.print()
      OuterCoFactor.getType().print()
      print("OuterIndex:")
      OuterIndex.print()
      OuterIndex.getType().print()
      print("InnerCoFactor:")
      InnerCoFactor.print()
      InnerCoFactor.getType().print()
      print("InnerIndex:")
      InnerIndex.print()
      InnerIndex.getType().print()
      OuterLowIndex = RoseMulOp.create(Context.genName(), \
                                [OuterCoFactor, OuterIndex])
      InnerLowIndex = RoseMulOp.create(Context.genName(), \
                                [InnerCoFactor, InnerIndex])
      LowIndex = RoseAddOp.create(Context.genName(), \
                                [OuterLowIndex, InnerLowIndex])
      # Generate value for bitwidth
      BitwidthValue = OuterCoFactor
      HighIndexOff = RoseConstant.create(BitwidthValue.getValue() - 1, \
                                        LowIndex.getType())
      HighIndex = RoseAddOp.create(Context.genName(), \
                                    [LowIndex, HighIndexOff])
      # Add the generated ops to the IR and the context
      Context.addAbstractionToIR(OuterLowIndex)
      Context.addCompiledAbstraction(OuterLowIndex.getName(), OuterLowIndex)
      Context.addAbstractionToIR(InnerLowIndex)
      Context.addCompiledAbstraction(InnerLowIndex.getName(), InnerLowIndex)
      Context.addAbstractionToIR(LowIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), LowIndex)
      Context.addAbstractionToIR(HighIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), HighIndex)
      print("OuterLowIndex:")
      OuterLowIndex.print()
      print("InnerLowIndex:")
      InnerLowIndex.print()
      print("LOW INDEX: ")
      LowIndex.print()
      print("HIGH INDEX:")
      HighIndex.print()
      # Now generate the bvextract op
      Operation = RoseBVExtractSliceOp.create(Context.genName(), BitVector, \
                                        LowIndex, HighIndex, BitwidthValue)
      Context.addSignednessInfoForValue(BitVector, \
                             HexTypeSignedness[InnerBitIndex.obj.elemtype])
      # Add this op to context for the inner bitindex
      print(InnerBitIndex)
      Context.addCompiledAbstraction(InnerBitIndex.id, Operation)
    else:
      # Compile the low index first
      ElemType = HexTypes[IndexExpr.obj.elemtype]
      CompiledLowIndex = CompileIndex(IndexExpr.idx, Context)
      print("COMPILED LOW INDEX:")
      print(CompiledLowIndex)
      CompiledLowIndex.print()
      LowCoFactor = RoseConstant.create(ElemType.getBitwidth(),\
                                CompiledLowIndex.getType())
      LowIndex = RoseMulOp.create(Context.genName(), \
                                [LowCoFactor, CompiledLowIndex])
      Context.addAbstractionToIR(LowIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), LowIndex)

      # Compile the vector object
      Vector = CompileExpression(IndexExpr.obj, Context)
      print("VECTOR:")
      print(Vector)
      Vector.print()

      # Get the high index
      #assert Context.isElemTypeOfVariableKnown(Vector.getName()) == True
      #ElemType = Context.getElemTypeOfVariable(Vector.getName())
      #assert ElemType.isBitVectorTy()
      IndexDiff = RoseConstant.create(ElemType.getBitwidth() - 1, LowIndex.getType())
      HighIndex = RoseAddOp.create(Context.genName(), [LowIndex, IndexDiff])
      print("HIGH INDEX:")
      HighIndex.print()
      Context.addAbstractionToIR(HighIndex)
      Context.addCompiledAbstraction(HighIndex.getName(), HighIndex)

      # Get the bitwdith value
      BitwidthValue = RoseConstant.create(ElemType.getBitwidth(), LowIndex.getType())

      # Now, generate the extract op. 
      Operation = RoseBVExtractSliceOp.create(Context.genName(), Vector, \
                                          LowIndex, HighIndex, BitwidthValue)
      Context.addSignednessInfoForValue(Operation, \
                             HexTypeSignedness[IndexExpr.obj.elemtype])
  # Add the op to the IR
  Context.addAbstractionToIR(Operation)

  # Add the operation to the context
  Context.addCompiledAbstraction(IndexExpr.id, Operation)
  print(IndexExpr.id)
  print("==================================")
  Operation.print()

  return Operation


def GetBitSliceIndex(ExprIndex, Context : HexRoseContext, Recurse = True):
  print("ExprIndex:")
  print(ExprIndex)
  # The given bitslice index could be a number
  if type(ExprIndex) == Number:
    print("--NUMBER")
    return RoseConstant.create(ExprIndex.val, RoseIntegerType.create(32))
  
  # The given bitslice index could be a variable
  if type(ExprIndex) == Var:
    print("--VARIABLE")
    if Context.isVariableDefined(ExprIndex.name):
      ID = Context.getVariableID(ExprIndex.name)
      Index = Context.getCompiledAbstractionForID(ID)
      if isinstance(Index.getType(), RoseBitVectorType):
        return RoseCastOp.create(Context.genName(), Index, \
                            RoseIntegerType.create(Index.getType().getBitwidth()))
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
        if isinstance(Operand1.getType(), RoseBitVectorType):
          print("CAST")
          Operand1 = RoseCastOp.create(Context.genName(), Operand1, \
                              RoseIntegerType.create(Operand1.getType().getBitwidth()))
      else:
        return RoseUndefValue()
    elif type(ExprIndex.a) == Number:
      print("EXPRESSION A IS A NUMBER")
      Operand1 = RoseConstant.create(ExprIndex.a.val, RoseIntegerType.create(32))
    elif Recurse == True and type(ExprIndex.a) == BinaryExpr:
      Operand1 = GetBitSliceIndex(ExprIndex.a, Context, Recurse=False)
      if Operand1 == RoseUndefValue():
        return  RoseUndefValue()
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
        if isinstance(Operand2.getType(), RoseBitVectorType):
          Operand2 = RoseCastOp.create(Context.genName(), Operand2, \
                              RoseIntegerType.create(Operand2.getType().getBitwidth()))
      else:
        return RoseUndefinedType.create()
    elif type(ExprIndex.b) == Number:
      print("EXPRESSION B IS A NUMBER")
      Operand2 = RoseConstant.create(ExprIndex.b.val, RoseIntegerType.create(32))
    elif Recurse == True and type(ExprIndex.b) == BinaryExpr:
      Operand2 = GetBitSliceIndex(ExprIndex.b, Context, Recurse=False)
      if Operand2 == RoseUndefValue():
        return  RoseUndefValue()
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
        Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
                                              Operand2, NumIntBits)
    if type(ExprIndex.b) == Number \
    and (type(ExprIndex.a) == BitSlice or type(ExprIndex.a) == BitIndex):
      NumIntBits = ExprIndex.b.val.bit_length()
      if NumIntBits > Operand1.getType().getBitwidth():
        # We need to extend the size of the other operand
        Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
                                              Operand1, NumIntBits)
    # Fix the constants' bitwidths
    if Operand1.getType() != Operand2.getType():
      if isinstance(Operand1, RoseConstant):
        Operand1 = RoseConstant.create(Operand1.getValue(), Operand2.getType())
      elif isinstance(Operand2, RoseConstant):
        Operand2 = RoseConstant.create(Operand2.getValue(), Operand1.getType())
      elif Operand1.getType().getBitwidth() < Operand2.getType().getBitwidth():
        # We need to extend the size of the other operand
        Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
                                        Operand1, Operand2.getType().getBitwidth())
      elif Operand1.getType().getBitwidth() > Operand2.getType().getBitwidth():
        # We need to extend the size of the other operand
        Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
                                        Operand2, Operand1.getType().getBitwidth())
    # Perform the binary operation
    return BinaryOps[ExprIndex.op]()(Context.genName(), Operand1, Operand2)

  # The given bitslice index could be a compiled expression
  if Context.isCompiledAbstraction(ExprIndex.id):
    return Context.getCompiledAbstractionForID(ExprIndex.id)
  
  return RoseUndefValue()


def GetBitIndexType(IndexExpr, Context : HexRoseContext):
  print("GET INDEX TYPE")
  print("INDEX EXPR:")
  print(IndexExpr)
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(IndexExpr.id):
    CompiledVal = Context.getCompiledAbstractionForID(IndexExpr.id)
    return CompiledVal.getType()

  # If the bitindex indexes intoa a variable, compile that.
  if type(IndexExpr.obj) == Var:
    # Get the vector first
    print("--VARIABLE")
    if Context.isVariableDefined(IndexExpr.obj.name):
      ID = Context.getVariableID(IndexExpr.obj.name)
      Vector = Context.getCompiledAbstractionForID(ID)
    else:
      return RoseUndefValue()
    # Element type of this variable must be known
    assert Context.isElemTypeOfVariableKnown(Vector.getName()) == True
    return Context.getElemTypeOfVariable(Vector.getName())
    #ElemType = HexTypes[IndexExpr.elemtype]
    #print("ElemType:")
    #ElemType.print()
    #return ElemType
  
  # Account for another case
  assert type(IndexExpr.obj) == ElemTypeInfo
  ElemType = HexTypes[IndexExpr.obj.elemtype]
  print("----ElemType:")
  ElemType.print()
  return ElemType


def GetExpressionType(Expr, Context : HexRoseContext):
  print("GET EXPRESSION TYPE:")
  print("EXPRESSION:")
  print(Expr)
  # First try to get the type of the Expr
  if type(Expr) == Var:
      if Context.isVariableDefined(Expr.name):
        ID = Context.getVariableID(Expr.name)
        return Context.getCompiledAbstractionForID(ID).getType()
      else:
        return RoseUndefinedType.create()
  
  if type(Expr) == BitIndex:
    return GetBitIndexType(Expr, Context)
  
  if type(Expr) == BitSlice:
    print("GETTING BIT SLICE LOW INDEX")
    Low = GetBitSliceIndex(Expr.lo, Context)
    if Low == RoseUndefValue():
      return RoseUndefinedType.create()
    print("LOW:")
    Low.print()
    print("GETTING BIT SLICE HIGH INDEX")
    High = GetBitSliceIndex(Expr.hi, Context)
    if High == RoseUndefValue():
      return RoseUndefinedType.create()
    print("HIGH:")
    High.print()
    Bitwidth = ComputeBitSliceWidth(Low, High)
    print("Bitwidth from compute Bitwidth slice:")
    print(Bitwidth)
    return RoseBitVectorType.create(Bitwidth)
  
  return RoseUndefinedType.create()


def GetRHSTypeForSpecialCases(RHS, Context : HexRoseContext):
  print("GET RHS TYPE SPECIAL CASES")
  assert type(RHS) == BinaryExpr
  # Check if the operands size is extended. If yes, we return
  # the type with extended size.
  if (((type(RHS.a) == BitSlice and type(RHS.b) == BitSlice) \
  or (type(RHS.a) == BitIndex and type(RHS.b) == BitIndex)) \
  and NeedToExtendOperandSize(RHS.op)) \
  or (type(RHS.a) == Call and type(RHS.b) == Call \
  and RHS.a.funcname in ZeroExtendsSize \
   and RHS.b.funcname in ZeroExtendsSize):
      RHSType = GetExpressionType(RHS.a, Context)
      if not isinstance(RHSType, RoseUndefinedType):
        return RoseBitVectorType.create(RHSType.getBitwidth() * 2)
      RHSType = GetExpressionType(RHS.b, Context)
      if not isinstance(RHSType, RoseUndefinedType):
        return RoseBitVectorType.create(RHSType.getBitwidth() * 2)
  
  # Now if we have a binary op performed with constant (integer),
  # we must take into account the minimum bitwidth required to
  # represent that constant.
  if type(RHS.a) == Number \
  and (type(RHS.b) == BitSlice or type(RHS.b) == BitIndex):
    RHSType = GetExpressionType(RHS.b, Context)
    if isinstance(RHSType, RoseUndefinedType):
      return RoseUndefinedType.create()
    # Binary operation can only be performed on bitvectors and integers
    # so getting bitwidth is OK.
    NumIntBits = RHS.a.val.bit_length()
    if NumIntBits > RHSType.getBitwidth():
      # We need to extend the size of the other operand
      if isinstance(RHSType, RoseBitVectorType):
        return RoseBitVectorType.create(NumIntBits)
      assert RHSType.isIntegerTy()
      return RoseIntegerType.create(NumIntBits)
  # Handle the other case
  if type(RHS.b) == Number \
   and (type(RHS.a) == BitSlice or type(RHS.a) == BitIndex):
    RHSType = GetExpressionType(RHS.a, Context)
    print("RHS TYPE:")
    RHSType.print()
    if isinstance(RHSType, RoseUndefinedType):
      return RoseUndefinedType.create()
    # Binary operation can only be performed on bitvectors and integers
    # so getting bitwidth is OK.
    NumIntBits = RHS.b.val.bit_length()
    print("NumIntBits:")
    print(NumIntBits)
    if NumIntBits > RHSType.getBitwidth():
      # We need to extend the size of the other operand
      if isinstance(RHSType, RoseBitVectorType):
        return RoseBitVectorType.create(NumIntBits)
      assert RHSType.isIntegerTy()
      return RoseIntegerType.create(NumIntBits)

  # Account for the operands' bitwidths
  RHSAType = GetExpressionType(RHS.a, Context)
  if RHSAType == RoseUndefinedType.create():
    return RoseUndefinedType.create()
  RHSBType = GetExpressionType(RHS.b, Context)
  if RHSBType == RoseUndefinedType.create():
    return RoseUndefinedType.create()
  # Shorter type will be extended
  if RHSAType.getBitwidth() < RHSBType.getBitwidth():
    return RHSBType
  if RHSAType.getBitwidth() > RHSBType.getBitwidth():
    return RHSAType

  return RoseUndefinedType.create()


# We try to work out the type of the numbers in RHS.
# This is not meant to be deep. We will extend this
# if we need to.
def GetRHSNumberType(Update, Context : HexRoseContext):
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
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    return GetExpressionType(LHS, Context)

  if type(RHS) == UnaryExpr:
    RHSType = GetExpressionType(RHS.a, Context)
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    return GetExpressionType(LHS, Context)
  
  if type(RHS) == BinaryExpr:
    RHSType = GetRHSTypeForSpecialCases(RHS, Context)
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    RHSType = GetExpressionType(RHS.a, Context)
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    RHSType = GetExpressionType(RHS.b, Context)
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    # Binary ops outside of comparison ops have the 
    # same type as operands, so we could try that.
    if RHS.op not in ComparisonOps:
      return GetExpressionType(LHS, Context)
    return RoseUndefinedType.create()
  
  # See if the RHS is a select op
  if type(RHS) == Select:
    # The condition cannot be a number. Assert that here.
    assert type(RHS.cond) != Number
    RHSType = GetExpressionType(RHS.then, Context)
    print("SELECT RHS THEN:")
    RHSType.print()
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    RHSType = GetExpressionType(RHS.otherwise, Context)
    if not isinstance(RHSType, RoseUndefinedType):
      return RHSType
    print("SELECT LHS BEING ANALYZED")
    return GetExpressionType(LHS, Context)

  # If we do not know what the RHS is, we just give up.
  return RoseUndefinedType.create()


def CompileUpdate(Update, Context : HexRoseContext):
  # We need to get the type of numbers on the RHS
  OriginalNumberTy = Context.getNumberType()
  PredictedType = GetRHSNumberType(Update, Context)
  print("GET RHS TYPE:")
  PredictedType.print()
  if not isinstance(PredictedType, RoseUndefinedType):
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
    print("Update.lhs.hi:")
    print(Update.lhs.hi)
    High = CompileIndex(Update.lhs.hi, Context)
    print("HIGH INDEX:")
    High.print()
    #Context.setIndexNumberType(OriginalNumberTy)
    # Somtimes the maximum allowable vector length has to be increased
    if isinstance(High, RoseConstant):
      if High.getValue() > Context.getMaxVectorLength():
        NewLength = Context.getMaxVectorLength() \
                * math.ceil(High.getValue()/Context.getMaxVectorLength())
        print("NEW LENGTH:")
        print(NewLength)
        Context.setMaxVectorLength(NewLength)
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
    # Sometimes size extension of the RHS is required, so we have to handle it here
    if RHSExprVal.getType().getBitwidth() < Bitwidth:
      # Let's sign-extend
      RHSExprVal = RoseBVSignExtendOp.create(Context.genName(), \
                          RHSExprVal, Bitwidth)
      # Add this add op to the IR and the context
      Context.addAbstractionToIR(RHSExprVal)
      Context.addCompiledAbstraction(RHSExprVal.getName(), RHSExprVal)
    elif RHSExprVal.getType().getBitwidth() > Bitwidth:
      RHSExprVal = RoseBVTruncateOp.create(Context.genName(), \
                          RHSExprVal, Bitwidth)
    # Add an bitslice operation
    LHSOp = RoseBVInsertSliceOp.create(RHSExprVal, BitVector, Low, High, BitwidthValue)
    print("BIT SLICE INSERT OP:")
    LHSOp.print()
  else:
    # This could be a mask generator
    assert type(Update.lhs) == BitIndex
    assert type(Update.lhs.obj) == ElemTypeInfo
    # Check for nested bit indices
    InnerBitIndex = Update.lhs.obj.obj
    if type(InnerBitIndex) == BitIndex:
      # Compile the innermost bit index first
      OuterBitIndex = Update.lhs
      OuterBitIndexType = HexTypes[OuterBitIndex.obj.elemtype]
      InnerBitIndexType = HexTypes[InnerBitIndex.obj.elemtype]
      OuterIndex = CompileIndex(OuterBitIndex.idx, Context)
      InnerIndex = CompileIndex(InnerBitIndex.idx, Context)
      print("OuterBitIndex:")
      print(OuterBitIndex)
      print("InnerBitIndex:")
      print(InnerBitIndex)
      print("OuterBitIndexType:")
      OuterBitIndexType.print()
      print("InnerBitIndexType:")
      InnerBitIndexType.print()
      assert type(InnerBitIndex.obj.obj) == Var
      BitVector = CompileExpression(InnerBitIndex.obj.obj, Context)
      # First compute the low index
      OuterCoFactor = RoseConstant.create(OuterBitIndexType.getBitwidth(),\
                                   OuterIndex.getType())
      InnerCoFactor = RoseConstant.create(InnerBitIndexType.getBitwidth(),\
                                   InnerIndex.getType())
      OuterLowIndex = RoseMulOp.create(Context.genName(), \
                                [OuterCoFactor, OuterIndex])
      InnerLowIndex = RoseMulOp.create(Context.genName(), \
                                [InnerCoFactor, InnerIndex])
      LowIndex = RoseAddOp.create(Context.genName(), \
                                [OuterLowIndex, InnerLowIndex])
      # Generate value for bitwidth
      BitwidthValue = OuterCoFactor
      HighIndexOff = RoseConstant.create(BitwidthValue.getValue() - 1, \
                                        LowIndex.getType())
      HighIndex = RoseAddOp.create(Context.genName(), \
                                        [LowIndex, HighIndexOff])
      # Add the generated ops to the IR and the context
      Context.addAbstractionToIR(OuterLowIndex)
      Context.addCompiledAbstraction(OuterLowIndex.getName(), OuterLowIndex)
      Context.addAbstractionToIR(InnerLowIndex)
      Context.addCompiledAbstraction(InnerLowIndex.getName(), InnerLowIndex)
      Context.addAbstractionToIR(LowIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), LowIndex)
      Context.addAbstractionToIR(HighIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), HighIndex)
      print("OuterLowIndex:")
      OuterLowIndex.print()
      print("InnerLowIndex:")
      InnerLowIndex.print()
      print("LOW INDEX: ")
      LowIndex.print()
      print("HIGH INDEX:")
      HighIndex.print()
      # Now generate the bvinsert op
      # Sometimes size extension of the RHS is required, so we have to handle it here
      if RHSExprVal.getType().getBitwidth() < BitwidthValue.getValue():
        # Let's sign-extend
        RHSExprVal = RoseBVSignExtendOp.create(Context.genName(), \
                      RHSExprVal, BitwidthValue.getValue())
        # Add this add op to the IR and the context
        Context.addAbstractionToIR(RHSExprVal)
        Context.addCompiledAbstraction(RHSExprVal.getName(), RHSExprVal)
      elif RHSExprVal.getType().getBitwidth() > BitwidthValue.getValue():
        RHSExprVal = RoseBVTruncateOp.create(Context.genName(), \
                      RHSExprVal, BitwidthValue.getValue())
        # Add this add op to the IR and the context
        Context.addAbstractionToIR(RHSExprVal)
        Context.addCompiledAbstraction(RHSExprVal.getName(), RHSExprVal)
      # Compile the op
      print("RHSExprVal:")
      RHSExprVal.print()
      BitwidthValue.print()
      LHSOp = RoseBVInsertSliceOp.create(RHSExprVal, BitVector, \
                                    LowIndex, HighIndex, BitwidthValue)
      print("---BIT SLICE INSERT OP:")
      LHSOp.print()
      # Add this op to context for the inner bitindex
      print(InnerBitIndex)
      Context.addCompiledAbstraction(InnerBitIndex.id, LHSOp)
    else:
      # Compile the low index
      LowIndex = CompileExpression(Update.lhs.idx, Context)
      ElemType = HexTypes[Update.lhs.obj.elemtype]
      CompiledLowIndex = CompileIndex(Update.lhs.idx, Context)
      print("COMPILED LOW INDEX:")
      print(CompiledLowIndex)
      CompiledLowIndex.print()
      LowCoFactor = RoseConstant.create(ElemType.getBitwidth(),\
                                CompiledLowIndex.getType())
      LowIndex = RoseMulOp.create(Context.genName(), \
                                [LowCoFactor, CompiledLowIndex])
      Context.addAbstractionToIR(LowIndex)
      Context.addCompiledAbstraction(LowIndex.getName(), LowIndex)
      print("---INDEX:")
      print(LowIndex)
      LowIndex.print()
      BitVector = CompileExpression(Update.lhs.obj, Context)
      print("---VECTOR:")
      print(BitVector)
      BitVector.print()
      print("---RHSExprVal:")
      print(RHSExprVal)
      RHSExprVal.print()
      RHSExprVal.getType().print()
      # Get the high index
      assert Context.isElemTypeOfVariableKnown(BitVector.getName()) == True
      ElemType = Context.getElemTypeOfVariable(BitVector.getName())
      assert isinstance(ElemType, RoseBitVectorType)
      IndexDiff = RoseConstant.create(ElemType.getBitwidth() - 1, LowIndex.getType())
      HighIndex = RoseAddOp.create(Context.genName(), \
                                        [LowIndex, IndexDiff])
      # Add this add op to the IR and the context
      Context.addAbstractionToIR(HighIndex)
      Context.addCompiledAbstraction(HighIndex.getName(), HighIndex)
      # Generate value for bitwidth
      BitwidthValue = RoseConstant.create(ElemType.getBitwidth(), LowIndex.getType())
      # Now generate the bvinsert op
      # Sometimes size extension of the RHS is required, so we have to handle it here
      print("+++ElemType:")
      ElemType.print()
      if RHSExprVal.getType().getBitwidth() < ElemType.getBitwidth():
        # Let's sign-extend
        RHSExprVal = RoseBVSignExtendOp.create(Context.genName(), \
                      RHSExprVal, ElemType.getBitwidth())
        # Add this add op to the IR and the context
        Context.addAbstractionToIR(RHSExprVal)
        Context.addCompiledAbstraction(RHSExprVal.getName(), RHSExprVal)
      elif RHSExprVal.getType().getBitwidth() > ElemType.getBitwidth():
        RHSExprVal = RoseBVTruncateOp.create(Context.genName(), \
                      RHSExprVal, ElemType.getBitwidth())
        # Add this add op to the IR and the context
        Context.addAbstractionToIR(RHSExprVal)
        Context.addCompiledAbstraction(RHSExprVal.getName(), RHSExprVal)
      # Compile the op
      LHSOp = RoseBVInsertSliceOp.create(RHSExprVal, BitVector, LowIndex, HighIndex, BitwidthValue)
      print("---BIT SLICE INSERT OP:")
      LHSOp.print()

  # Add the op to the IR
  Context.addAbstractionToIR(LHSOp)
  
  # Add the operation to the context
  Context.addCompiledAbstraction(Update.lhs.id, LHSOp)

  return LHSOp
  

def CompileSelect(Select, Context : HexRoseContext):
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(Select.id):
    return Context.getCompiledAbstractionForID(Select.id)
  
  print("COMPILE Select EXPRESSION")
  print("SELECT EXPR:")
  print(Select)
  # Compile the operation
  Cond = CompileExpression(Select.cond, Context)
  print("Cond:")
  Cond.print()
  Then = CompileExpression(Select.then, Context)
  Otherwise = CompileExpression(Select.otherwise, Context)
  Operation = RoseSelectOp.create(Context.genName(), Cond, Then, Otherwise)
  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context
  Context.addCompiledAbstraction(Select.id, Operation)
  return Operation


def CompileUnaryExpr(UnaryExpr, Context : HexRoseContext):
  # If this expression is compiled, no need to recompile
  if Context.isCompiledAbstraction(UnaryExpr.id):
    return Context.getCompiledAbstractionForID(UnaryExpr.id)
  
  print("COMPILE UNARY EXPRESSION")
  print("UNARY EXPR:")
  print(UnaryExpr)
  # Compile the operation
  Value = CompileExpression(UnaryExpr.a, Context)
  Operation = UnaryOps[UnaryExpr.op]()(Context.genName(), Value, Context)
  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context
  Context.addCompiledAbstraction(UnaryExpr.id, Operation)
  return Operation


def CompileBinaryExpr(BinaryExpr, Context : HexRoseContext):
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
      if Operand1.getType().getBitwidth() == Operand2.getType().getBitwidth():
        OperandBitwidth = 2 * Operand1.getType().getBitwidth()
        Operand1 = RoseBVSignExtendOp.create(Context.genName(), \
                            Operand1, OperandBitwidth)
        Operand2 = RoseBVSignExtendOp.create(Context.genName(), \
                            Operand2, OperandBitwidth)
        # Add the operations to the IR
        Context.addAbstractionToIR(Operand1)
        Context.addAbstractionToIR(Operand2)
        # Add operations to the context
        Context.addCompiledAbstraction(Operand1.getName(), Operand1)
        Context.addCompiledAbstraction(Operand2.getName(), Operand2)
        ExtendOperandSize = True
      elif Operand1.getType().getBitwidth() > Operand2.getType().getBitwidth():
        Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
                            Operand2, Operand1.getType().getBitwidth())      
        # Add the operations to the IR
        Context.addAbstractionToIR(Operand2)
        # Add operations to the context
        Context.addCompiledAbstraction(Operand2.getName(), Operand2)
        ExtendOperandSize = True
      else:
        Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
                            Operand1, Operand2.getType().getBitwidth())      
        # Add the operations to the IR
        Context.addAbstractionToIR(Operand1)
        # Add operations to the context
        Context.addCompiledAbstraction(Operand1.getName(), Operand1)
        ExtendOperandSize = True
  
  # There are cases where zero_extend(x) * zero_extend(y) need to be extended further.
  if type(BinaryExpr.a) == Call and type(BinaryExpr.b) == Call:
    if BinaryExpr.a.funcname in ZeroExtendsSize \
   and BinaryExpr.b.funcname in ZeroExtendsSize:
      # Double the operands' bitwidths
      assert Operand1.getType().getBitwidth() == Operand2.getType().getBitwidth()
      OperandBitwidth = 2 * Operand1.getType().getBitwidth()
      Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
                          Operand1, OperandBitwidth)
      Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
                          Operand2, OperandBitwidth)      
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand1)
      Context.addAbstractionToIR(Operand2)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand1.getName(), Operand1)
      Context.addCompiledAbstraction(Operand2.getName(), Operand2)
      ExtendOperandSize = True
  
  # There are cases where bitvectors are multiplied to larger numbers
  # TODO: Make this more general if need be. Right now, we deal with this
  # as a special case.
  if type(BinaryExpr.a) == Number \
  and (type(BinaryExpr.b) == BitSlice or type(BinaryExpr.b) == BitIndex):
    NumIntBits = BinaryExpr.a.val.bit_length()
    if NumIntBits > Operand2.getType().getBitwidth():
      # We need to extend the size of the other operand
      Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
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
      Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
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
  # Fix the operands' bitwidths
  if Operand1.getType() != Operand2.getType():
    if isinstance(Operand1, RoseConstant):
      Operand1 = RoseConstant.create(Operand1.getValue(), Operand2.getType())
    elif isinstance(Operand2, RoseConstant):
      Operand2 = RoseConstant.create(Operand2.getValue(), Operand1.getType())
    elif Operand1.getType().getBitwidth() < Operand2.getType().getBitwidth():
      # We need to extend the size of the other operand
      Operand1 = RoseBVZeroExtendOp.create(Context.genName(), \
                                      Operand1, Operand2.getType().getBitwidth())
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand1)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand1.getName(), Operand1)
      ExtendOperandSize = True
    elif Operand1.getType().getBitwidth() > Operand2.getType().getBitwidth():
      # We need to extend the size of the other operand
      Operand2 = RoseBVZeroExtendOp.create(Context.genName(), \
                                      Operand2, Operand1.getType().getBitwidth())
      # Add the operations to the IR
      Context.addAbstractionToIR(Operand2)
      # Add operations to the context
      Context.addCompiledAbstraction(Operand2.getName(), Operand2)
      ExtendOperandSize = True
  
  print('OPERAND1:')
  Operand1.print()
  print(Operand1.getType())
  print("OPERAND2:")
  Operand2.print()
  print(Operand2.getType())

  # Compile the binary operation
  print("GENERATING BINARY OP")
  Operation = BinaryOps[BinaryExpr.op]()(Context.genName(), Operand1, Operand2, Context)
  print("BINARY OP GENERATED")

  # In cases that the indices are being compiled, there are cases where 
  # they can be simplified.
  #if Context.isCompileIndexFlagSet():
  #  SimplifiedOperation = Operation.simplify()
  #  if not isinstance(SimplifiedOperation, RoseUndefValue):
  #    # If the simplified operation is a constant, just return that.
  #    # Otherwise, we do NOT use simplified operation in any way.
  #    if isinstance(SimplifiedOperation, RoseConstant):
  #      return SimplifiedOperation

  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)

  # Add the operation to the context
  Context.addCompiledAbstraction(BinaryExpr.id, Operation)
  print("BINARY OP COMPILED")

  # Now add the operation as an op that has already extended operand sizes
  if ExtendOperandSize == True:
    Context.addSizeExtended(Operation, OperandBitwidth)
  return Operation



# Checks if extension has been performed already
# sign_extend(x * y) = sign_extend(x) * sign_extend(y)
def BuiltinOpPerformed(CallStmt, ArgValuesList : list, Context : HexRoseContext):
  if CallStmt.funcname not in BuiltinExtendsSize:
    return False
  # Builtin extends size. Check if we have already done that.
  [Operation] = ArgValuesList

  # If the operation extends the size, if the bitwidth is already large enough, 
  # it needs not extension, in which case there is nothing to do.
  BuiltinExtendSize = BuiltinExtendsSize[CallStmt.funcname]
  if Operation.getType().getBitwidth() >= BuiltinExtendSize:
    return True

  if not Context.isSizeExtended(Operation):
    return False
  # So the operands have alrady been extended. 
  # Now we need to ensure the size of operation is the same
  # as what we intend to extend using the builtin.
  if BuiltinExtendSize != Context.getExtendedSize(Operation):
    # The size to which the builtin will extend has to be greater
    # than the size to which extension has already taken place.
    assert BuiltinExtendSize > Context.getExtendedSize(Operation)
    return False
  # So thefre is nothing to do
  print("SKIP BUILTIN")
  return True
  

def CompileCall(CallStmt, Context : HexRoseContext):
  print("COMPILE CALL")
  if Context.isCompiledAbstraction(CallStmt.id):
    return Context.getCompiledAbstractionForID(CallStmt.id)

  # This must be a builtin function call.
  assert CallStmt.funcname in Builtins

  # Compile function call arguments first
  print("COMPILE ARGUMENTS")
  ArgValuesList = list()
  for Arg in CallStmt.args:
    CompiledArg = CompileExpression(Arg, Context)
    # Argument type cannot be undefined or void
    assert not isinstance(CompiledArg.getType(), RoseVoidType) \
      and not isinstance(CompiledArg.getType(), RoseUndefinedType)
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
  Operation = Builtins[CallStmt.funcname](Context.genName(), ArgValuesList, Context)

  # Add the operation to the IR
  Context.addAbstractionToIR(Operation)
  # Add the operation to the context
  Context.addCompiledAbstraction(CallStmt.id, Operation)
  return Operation


def CompileForLoop(ForStmt, Context : HexRoseContext):
  # If the loop has been compiled already, no need to recomplie
  if Context.isCompiledAbstraction(ForStmt.id):
    return

  # Compile the loop bounds and step
  print("COMPILING FOR LOOP")
  print("FOR EXPR:")
  print(ForStmt)
  
  # We only handle the common loops, not complex yet.
  assert type(ForStmt) != ComplexFor

  Begin = CompileExpression(ForStmt.begin, Context)
  End = CompileExpression(ForStmt.end, Context)
  assert Begin.getType() == End.getType()
  Step = CompileExpression(ForStmt.step, Context)
  assert Step.getType() == End.getType()

  # Generate the loop
  Loop = RoseForLoop.create(ForStmt.iterator.name, Begin, End, Step)

  # Add loop as root abstraction 
  ChildContext = HexRoseContext()
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


def CompileIf(IfStmt, Context : HexRoseContext):
  print("COMPILING IF:")
  print(IfStmt)
  # Generate a cond region
  Cond = CompileExpression(IfStmt.cond, Context)
  print("CONDITION:")
  Cond.print()
  CondRegion = RoseCond.create(Cond)

  # Add cond region as root abstraction 
  ChildContext = HexRoseContext()
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
  
  # Update the key for the cond key
  UpdatedCondRegion = ChildContext.getRootAbstraction()
  ElseRegionKey = CondRegion.getKeyForElseRegion()
  ChildContext.addKeyForCompiledAbstraction(ElseRegionKey, UpdatedCondRegion)
 
  # Compile all the statement in the otherwise cond region
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


def CompileElemTypeInfo(ElemTypeInfo, Context : HexRoseContext):
  print("COMPILE TYPELOOKUP")
  print("TYPELOOKUP:")
  print(ElemTypeInfo)
  print(ElemTypeInfo.elemtype)
  # ElemTypeInfo tracks types of variables
  if type(ElemTypeInfo.obj) == Var:
    # Check if the variable is already defined and cached. If yes, just return that.
    if Context.isVariableDefined(ElemTypeInfo.obj.name):
      ID = Context.getVariableID(ElemTypeInfo.obj.name)
      FoundValue = Context.getCompiledAbstractionForID(ID)
      # See if the element type of this variable is known, if not add it.
      if Context.isElemTypeOfVariableKnown(ElemTypeInfo.obj.name) == False:
        Context.addElemTypeOfVariable(FoundValue.getName(), HexTypes[ElemTypeInfo.elemtype])
        Context.addSignednessInfoForValue(FoundValue, HexTypeSignedness[ElemTypeInfo.elemtype])
      return FoundValue
    # Create a new rose value. We do not know the bitwidth, so use the maximum bitwidth
    CompiledValue = RoseValue.create(ElemTypeInfo.obj.name, Context.getMaxVectorLength())
    # Add the element type info to the context
    assert Context.isElemTypeOfVariableKnown(ElemTypeInfo.obj.name) == False
    Context.addElemTypeOfVariable(CompiledValue.getName(), HexTypes[ElemTypeInfo.elemtype])
    Context.addSignednessInfoForValue(CompiledValue, HexTypeSignedness[ElemTypeInfo.elemtype])
    # Add the variable info to the context
    Context.addVariable(ElemTypeInfo.obj.name, ElemTypeInfo.obj.id)
  else:
    assert type(ElemTypeInfo.obj) == BitIndex or type(ElemTypeInfo.obj) == BitSlice
    # Compile the bit slice
    CompiledValue = CompileExpression(ElemTypeInfo.obj, Context)
    print("CompiledValue:")
    CompiledValue.print()
    if Context.isElemTypeOfVariableKnown(CompiledValue.getName()) == False:
      Context.addElemTypeOfVariable(CompiledValue.getName(), HexTypes[ElemTypeInfo.elemtype])
      Context.addSignednessInfoForValue(CompiledValue, HexTypeSignedness[ElemTypeInfo.elemtype])
  
  # Add the typelookup to context
  Context.addCompiledAbstraction(ElemTypeInfo.obj.id, CompiledValue)
  return CompiledValue


def CompileExpression(Expr, Context : HexRoseContext):
  print("COMPILE EXPRESSION")
  print("EXPR:")
  print(Expr)
  ExprTy = type(Expr)
  CompiledExpr = CompileAbstractions[ExprTy](Expr, Context)
  return CompiledExpr


def CompileStatement(Stmt, Context : HexRoseContext):
  StmtTy = type(Stmt)
  print("STATEMENT:")
  print(Stmt)
  print("STATEMENT TYPE:")
  print(StmtTy)
  return CompileAbstractions[StmtTy](Stmt, Context)


def FixFunctionsWithReductionPattern(Function : RoseFunction, Context : HexRoseContext):
  print("FixFunctionsWithReductionPattern:")
  # There are times when the return values of the functions are
  # the same as the function argument.
  if not isinstance(Function.getReturnValue(), RoseArgument):
    return
  for Arg in Function.getArgs():
    print("Arg:")
    print(id(Arg))
    Arg.print()
    print("Function.getReturnValue():")
    Function.getReturnValue().print()
    if Arg == Function.getReturnValue():
      print("EQUAL ARG AND RETURN VALUE")
      # Create an alternative to the return value 
      NewReturnValue = RoseValue.create(Context.genName("%" + "dst"), Arg.getType())
      # Replace the uses of the Arg in bvinsert ops and return ops
      ArgUsers = Function.getUsersOf(Arg)
      for User in ArgUsers:
        if isinstance(User, RoseBVInsertSliceOp):
          if User.getInputBitVector() == Arg:
            User.setOperand(1, NewReturnValue)
          continue
        if isinstance(User, RoseReturnOp):
          User.setOperand(0, NewReturnValue)
          Function.setRetVal(NewReturnValue)
          continue
  print("NEW FUNCTIONS:")
  Function.print()
  return


def CompileSemantics(Sema):
  # Create the root context
  RootContext = HexRoseContext()
  
  # Some sanity checks
  assert len(Sema.params) > 0
  assert len(Sema.params) == len(Sema.paramsizes)
  ParamValues = []
  ParamsIDs = []
  OutputParam = RoseUndefValue()
  for Index, Param in enumerate(Sema.params):
    #ParamType = RoseBitVectorType.create(RootContext.getMaxVectorLength())
    ParamType = RoseBitVectorType.create(Sema.paramsizes[Index])
    # Create a new rosette value
    print("Param:")
    print(Param)
    if type(Param) == ElemTypeInfo:
      ParamVal = RoseArgument.create(Param.obj.name, ParamType)
    else:
      assert type(Param) == Var
      ParamVal = RoseArgument.create(Param.name, ParamType)
      # Add the element type info
      print("ParamVal.getName():")
      print(ParamVal.getName())
      print(Sema.paramsizes[Index])
      if ParamVal.getName() in Sema.scalarregs:
        RootContext.addElemTypeOfVariable(ParamVal.getName(), ParamType)
    ParamVal.print()
    if ParamVal.getName() == Sema.retname:
      OutputParam = ParamVal
    #RootContext.addElemTypeOfVariable(ParamVal.getName(), HexTypes[Param.elemtype])
    if type(Param) == ElemTypeInfo:
      ParamsIDs.append(Param.obj.id)
    else:
      ParamsIDs.append(Param.id)
    ParamValues.append(ParamVal)

  if Sema.retsize != None:
    print(Sema.retsize)
    if isinstance(OutputParam, RoseUndefValue):
      RetType = RoseBitVectorType.create(Sema.retsize)  
      #HexTypes[Sema.rettype]
      print("adding dst to context")
      RetValue = RoseValue.create(Sema.retname, RetType)
    else:
      RetValue = OutputParam
  else:
    RetType = RoseVoidType.create()
    RetValue = RoseValue.create("", RetType)
    
  # Define a Rose function
  print("ParamValues:")
  print(ParamValues)
  RootFunction = RoseFunction.create(Sema.intrin, ParamValues, RetValue.getType())
  RootFunction.setRetVal(RetValue)

  # Add return value to the root context
  ReturnID = "return." + RootFunction.getReturnValue().getName()
  RootContext.addVariable(RootFunction.getReturnValue().getName(), ReturnID)
  #RootContext.addElemTypeOfVariable(RootFunction.getReturnValue().getName(), \
  #                                  HexTypes[Sema.rettype])
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
  for Stmt in Sema.spec:
    CompileStatement(Stmt, RootContext)
  
  # Get the compiled function
  CompiledFunction = RootContext.getRootAbstraction()

  # Generate return op
  Op = RoseReturnOp.create(RetValue)
  # NO meed to add this operation to the context but add it to the function
  CompiledFunction.addAbstraction(Op)

  print("RetValue:")
  print(id(RetValue))
  print(RetValue)
  print(type(RetValue))
  print("OutputParam:")
  print(id(OutputParam))
  print(OutputParam)
  print(type(OutputParam))
  # Fix some reduction patterns specific to hexagon
  FixFunctionsWithReductionPattern(CompiledFunction, RootContext)

  print("\n\n\n\n\n")
  CompiledFunction.print()

  return CompiledFunction


CompileAbstractions = {
  ElemTypeInfo : CompileElemTypeInfo, 
  For: CompileForLoop,
  Number: CompileNumber,
  Var: CompileVar,
  Call: CompileCall,
  BitSlice: CompileBitSlice,
  Update: CompileUpdate,
  UnaryExpr: CompileUnaryExpr,
  Select: CompileSelect,
  If: CompileIf,
  BinaryExpr: CompileBinaryExpr,
  BitIndex : CompileBitIndex,
}


def HandleToSignExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    assert Value.getType().getBitwidth() < Bitwidth
    Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  
  return LamdaImplFunc


def HandleToSpecialSignExtend(_):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    # Increase the bitwidth by 2x. 
    Bitwidth = 2 * Value.getType().getBitwidth()
    Op = RoseBVSignExtendOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  
  return LamdaImplFunc


def HandleToZeroExtend(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    assert Value.getType().getBitwidth() < Bitwidth
    Op = RoseBVZeroExtendOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=False)
    return Op
  
  return LamdaImplFunc


def HandleToMin(_):
  def LamdaImplFunc(Name : str, Operands : list, Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operands : list, Context : HexRoseContext):
    assert len(Operands) == 2
    if isinstance(Operands[0].getType(), RoseBitVectorType) \
    and isinstance(Operands[1].getType(), RoseBitVectorType):
      print("Context.isValueSigned(Operands[0]):")
      print(Context.isValueSigned(Operands[0]))
      print("Context.isValueSigned(Operands[1]):")
      print(Context.isValueSigned(Operands[1]))
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


def HandleToSSaturate(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    assert Value.getType().getBitwidth() >= Bitwidth
    Op = RoseBVSSaturateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=True)
    return Op
  
  return LamdaImplFunc


def HandleToUSaturate(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    assert Value.getType().getBitwidth() >= Bitwidth
    Op = RoseBVUSaturateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=False)
    return Op
  
  return LamdaImplFunc


def HandleToTruncate(Bitwidth : int):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    assert Value.getType().getBitwidth() > Bitwidth
    Op = RoseBVTruncateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=Context.isValueSigned(Value))
    return Op

  return LamdaImplFunc


def HandleToSpecialTruncate(_):
  def LamdaImplFunc(Name : str, Args : list, Context : HexRoseContext):
    [Value] = Args
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    Bitwidth = int(Value.getType().getBitwidth() / 2)
    assert Value.getType().getBitwidth() > Bitwidth
    Op = RoseBVTruncateOp.create(Name, Value, Bitwidth)
    Context.addSignednessInfoForValue(Op, IsSigned=Context.isValueSigned(Value))
    return Op

  return LamdaImplFunc


def HandleToAbs(_):
  def LamdaImplFunc(Name : str, Operands : list, Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operands : list, Context : HexRoseContext):
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
  'sat32': HandleToSSaturate(32),
  'sat16': HandleToSSaturate(16),
  'sat8': HandleToSSaturate(8),

  'usat32': HandleToUSaturate(32),
  'usat16': HandleToUSaturate(16),
  'usat8': HandleToUSaturate(8),

  'ZeroExtend16': HandleToZeroExtend(16),
  'ZeroExtend32': HandleToZeroExtend(32),
  'ZeroExtend64': HandleToZeroExtend(64),

  'SignExtend16': HandleToSignExtend(16),
  'SignExtend32': HandleToSignExtend(32),
  'SignExtend64': HandleToSignExtend(64),

  'Truncate8' : HandleToTruncate(8),
  'Truncate16': HandleToTruncate(16),
  'Truncate32' : HandleToTruncate(32),

  'MIN' : HandleToMin(None),
  'MAX' : HandleToMax(None),

  'ABS' : HandleToAbs(None),

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
  def LamdaImplFunc(Name : str, Value : RoseValue, Context : HexRoseContext):
    assert isinstance(Value.getType(), RoseBitVectorType) == True
    Op = RoseBVNotOp.create(Name, Value)
    Context.addSignednessInfoForValue(Op, IsSigned=Context.isValueSigned(Value))
    return Op
  
  return LamdaImplFunc


def HandleToNeg():
  def LamdaImplFunc(Name : str, Value : RoseValue, Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                    Context : HexRoseContext):
    Operands = [Operand1, Operand2]
    print("*******Operand1:")
    Operand1.print()
    print("*******Operand2:")
    Operand2.print()
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVAddOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseAddOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToSub():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    Operands = [Operand1, Operand2]
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVSubOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseSubOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToMul():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    Operands = [Operand1, Operand2]
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVMulOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseMulOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToDiv():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      if Context.isValueSigned(Operand1) == True \
      or Context.isValueSigned(Operand2) == True:
        Op = RoseBVSdivOp.create(Name, Operand1, Operand2)
      else:
        Op = RoseBVUdivOp.create(Name, Operand1, Operand2)
      Context.addSignednessInfoForValue(Op, \
          Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseDivOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToMod():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVSmodOp.create(Name, Operand1, Operand2)
      Context.addSignednessInfoForValue(Op, IsSigned=True)
      return Op
    return RoseModOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToOr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    Operands = [Operand1, Operand2]
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVOrOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseOrOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToXor():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Operands = [Operand1, Operand2]
      Op = RoseBVXorOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseXorOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToAnd():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    Operands = [Operand1, Operand2]
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVAndOp.create(Name, Operands)
      Context.addSignednessInfoForValue(Op, \
        Context.isValueSigned(Operand1) or Context.isValueSigned(Operand2))
      return Op
    return RoseAndOp.create(Name, Operands)
  
  return LamdaImplFunc


def HandleToEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVEQOp.create(Name, Operand1, Operand2)
      Context.addSignednessInfoForValue(Op, IsSigned=False)
      return Op
    return RoseEQOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToNotEqual():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      Op = RoseBVNEQOp.create(Name, Operand1, Operand2)
      Context.addSignednessInfoForValue(Op, IsSigned=False)
      return Op
    return RoseNEQOp.create(Name, Operand1, Operand2)
  
  return LamdaImplFunc


def HandleToLessThan():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    if isinstance(Operand1.getType(), RoseBitVectorType) \
    and isinstance(Operand2.getType(), RoseBitVectorType):
      print("Operand1:")
      Operand1.print()
      print("Operand2:")
      Operand2.print()
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
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
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
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    assert isinstance(Operand1.getType(), RoseBitVectorType) == True
    assert isinstance(Operand2.getType(), RoseBitVectorType) == True
    Op = RoseBVAshrOp.create(Name, Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
    return Op
  
  return LamdaImplFunc


def HandleToLshr():
  def LamdaImplFunc(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, \
                      Context : HexRoseContext):
    assert isinstance(Operand1.getType(), RoseBitVectorType) == True
    assert isinstance(Operand2.getType(), RoseBitVectorType) == True
    Op = RoseBVLshrOp.create(Name, Operand1, Operand2)
    Context.addSignednessInfoForValue(Op, Context.isValueSigned(Operand1))
    return Op
  
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
    '||' : HandleToOr,
    '^' : HandleToXor,
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

LogicalOps = ['&', '|']


def Compile(Test):
  from PseudoCodeParser import GetSpecFrom
  for Inst, Pseudocode in Test.items():
    Spec = GetSpecFrom(Inst, Pseudocode)
    print(Spec)
    CompiledFunction = CompileSemantics(Spec)


test1 ={
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
}

test2 = {
   'Vd.b=vmax(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] > '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
}

test3 = {
   'Vd.b=vnavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                          '(Vu.b[i]-Vv.b[i])/2 ;}',
}

test4 = {
   'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
}

# Fails
test5 = {
   'Qd4=or(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] || QtV[i] '
                    ';}',
}

test6 = {
   'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
}

test7 = {
   'Vd.h=vsub(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]-Vv.h[i]) ;}',
}

test8 = {
 'Vd.b=vmin(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (Vu.b[i] < '
                         'Vv.b[i]) ? Vu.b[i] :Vv.b[i] ;}',
}

test9 = {
 'Vd.b=vnavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                            '(Vu.ub[i]-Vv.ub[i])/2 ;}',
}

test10 = {
 'Vd.b=vavg(Vu.b,Vv.b):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             '(Vu.b[i]+Vv.b[i]+1)/2 ;}',
}

test11 = {
 'Vd.b=vadd(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i]) ;}',
}

test12 = {
 'Vd.b=vabs(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = (ABS(Vu.b[i])) '
                    ';}',
}

test13 = {
 'Vxx.w|=vunpacko(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vxx.uw[i] |= '
                          'Vu.uh[i]<<16 ;}',
}

test14 = {
 'Vxx.h|=vunpacko(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vxx.uh[i] |= '
                          'Vu.ub[i]<<8 ;}',
}

# Fails
test15 = {
   'Vx.w+=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vx.w[i] += '
                            '(Vu.w[i] * Rt.ub[i % 4]) ;}',
}

test16 = {
 'Vd.ub=vmin(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] < Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
}

test17 = {
 'Vd.ub=vmax(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i] > Vv.ub[i]) ? Vu.ub[i]: Vv.ub[i] ;}',
}

test18 = {
 'Vd.uh=vabsdiff(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                              '(Vu.h[i] > Vv.h[i]) ? (Vu.h[i] -Vv.h[i]) : '
                              '(Vv.h[i] - Vu.h[i]) ;}',
}

test19 = {
 'Vd.ub=vavg(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                            '(Vu.ub[i]+Vv.ub[i])/2 ;}',
}

# Fails
test20 = {
 'Qd4=xor(Qs4,Qt4)': 'for (i = 0; i < VELEM(8); i++) {QdV[i]=QsV[i] ^ QtV[i] '
                     ';}',
}

test21 = {
 'Vd.h=vnavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                          '(Vu.h[i]-Vv.h[i])/2 ;}',
}

test22 = {
 'Vd.b=vavg(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]+Vv.b[i])/2 ;}',
}

test23 = {
 'Vd.b=vabs(Vu.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                        'sat8(ABS(Vu.b[i])) ;}',
}

test24 = {
 'Vd.b=vadd(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]+Vv.b[i]) ;}',
}

test25 = {
 'Vd.ub=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                               'usat8(Vv.h[i]);Vd.ub[i+VBITS/16] = '
                               'usat8(Vu.h[i]) ;}',
}

test26 = {
 'Vd.ub=vavg(Vu.ub,Vv.ub):rnd': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                '(Vu.ub[i]+Vv.ub[i]+1)/2 ;}',
}

test27 = {
 'Vd.ub=vsub(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]-Vv.ub[i]) ;}',
}

test28 = {
 'Vd.ub=vsub(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] - Vv.b[i]) ;}',
}

test29 = {
 'Vd.ub=vadd(Vu.ub,Vv.ub):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                                'usat8(Vu.ub[i]+Vv.ub[i]) ;}',
}

test30 = {
 'Vd.ub=vadd(Vu.ub,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.ub[i] = '
                               'usat8(Vu.ub[i] + Vv.b[i]) ;}',
}

test31 = {
 'Vd.w=vabs(Vu.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (ABS(Vu.w[i])) '
                    ';}',
}

test32 = {
 'Vd.uw=vsub(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]-Vv.uw[i]) ;}',
}

test33 = {
 'Vd.uw=vavg(Vu.uw,Vv.uw):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                '(Vu.uw[i]+Vv.uw[i]+1)/2 ;}',
}

test34 = {
 'Vd.uw=vavg(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                            '(Vu.uw[i]+Vv.uw[i])/2 ;}',
}

test35 = {
 'Vd.uw=vadd(Vu.uw,Vv.uw):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                                'usat32(Vu.uw[i]+Vv.uw[i]) ;}',
}

test36 = {
 'Vd.uw=vabsdiff(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                              '(Vu.w[i] > Vv.w[i]) ? (Vu.w[i] -Vv.w[i]) : '
                              '(Vv.w[i] - Vu.w[i]) ;}',
}

test37 = {
 'Vd.h=vsub(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]-Vv.h[i]) ;}',
}


test38 = {
 'Vd.b=vpack(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.b[i] = '
                              'sat8(Vv.h[i]);Vd.b[i+VBITS/16] = sat8(Vu.h[i]) '
                              ';}',
}

test39 = {
 'Vx.uw+=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vx.uw[i] += '
                              '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
}

test40 = {
 'Vd.b=vshuffe(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[0];'
                            'Vd.uh[i].b[1]=Vu.uh[i].ub[0];}',
}

test41 = {
 'Vd.w=vnavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i]-Vv.w[i])/2 ;}',
}

test42 = {
 'Vd.b=vsub(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                         '(Vu.b[i]-Vv.b[i]) ;}',
}

test43 = {
 'Vdd.w=vunpack(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.w[i] = Vu.h[i] '
                        ';}',
}

test44 = {
   'Vd.w=vabs(Vu.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                        'sat32(ABS(Vu.w[i])) ;}',
}

test45 = {
 'Vd.w=vadd(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i]) ;}',
}

test46 = {
   'Vd.w=vadd(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]+Vv.w[i]) ;}',
}

test47 = {
 'Vd.w=vavg(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]+Vv.w[i])/2 ;}',
}

test48 = {
 'Vd.w=vavg(Vu.w,Vv.w):rnd': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             '(Vu.w[i]+Vv.w[i]+1)/2 ;}',
}

test49 = {
 'Vd.w=vmax(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '> Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
}

test50 = {
 'Vd.w=vmin(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = (Vu.w[i] '
                         '< Vv.w[i]) ? Vu.w[i] :Vv.w[i] ;}',
}

# Fails
test51 = {
 'Vd.w=vsatdw(Vu.w, Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            'usat32(Vu.w[i]:Vv.w[i]) ;}',
}

test52 = {
 'Vd.w=vsub(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                         '(Vu.w[i]-Vv.w[i]) ;}',
}

test53 = {
 'Vd.w=vsub(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                             'sat32(Vu.w[i]-Vv.w[i]) ;}',
}

# Fails
test54 = {
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
}

test55 = {
 'Vdd.h=vunpack(Vu.b)': 'for (i = 0; i < VELEM(8); i++) {Vdd.h[i] = Vu.b[i] ;}',
}

test56 = {
   'Vdd.uh=vunpack(Vu.ub)': 'for (i = 0; i < VELEM(8); i++) {Vdd.uh[i] = '
                          'Vu.ub[i] ;}',
}

test57 = {
 'Vdd.uw=vunpack(Vu.uh)': 'for (i = 0; i < VELEM(16); i++) {Vdd.uw[i] = '
                          'Vu.uh[i] ;}',
}

test58 = {
 'Vd.h=vmax(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '> Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
}

test59 = {
 'Vd.h=vmin(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (Vu.h[i] '
                         '< Vv.h[i]) ? Vu.h[i] :Vv.h[i] ;}',
}

test60 = {
 'Vd.h=vsat(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) '
                         '{Vd.w[i].h[0]=sat16(Vv.w[i]);Vd.w[i].h[1]=sat16(Vu.w[i]) '
                         ';}',
}

# Fails
test61 = {
 'Vd.w=vmpyi(Vu.w,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.w[i] * Rt.ub[i % 4]) ;}',
}

test62 = {
 'Vd.uh=vsub(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]-Vv.uh[i]) ;}',
}

test63 = {
 'Vd.uh=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                               'usat16(Vv.w[i]);Vd.uh[i+VBITS/32] = '
                               'usat16(Vu.w[i]) ;}',
}

test64 = {
 'Vd.uh=vmin(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] < Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
}

test65 = {
 'Vd.uh=vmax(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i] > Vv.uh[i]) ? Vu.uh[i]: Vv.uh[i] ;}',
}

test66 = {
 'Vd.uh=vavg(Vu.uh,Vv.uh):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i]+Vv.uh[i]+1)/2 ;}',
}

test67 = {
 'Vd.uh=vavg(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                            '(Vu.uh[i]+Vv.uh[i])/2 ;}',
}

test68 = {
 'Vd.uh=vadd(Vu.uh,Vv.uh):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                'usat16(Vu.uh[i]+Vv.uh[i]) ;}',
}

test69 = {
 'Vd.uh=vabsdiff(Vu.uh,Vv.uh)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = '
                                '(Vu.uh[i] > Vv.uh[i]) ? (Vu.uh[i]- Vv.uh[i]) '
                                ': (Vv.uh[i] - Vu.uh[i]) ;}',
}

test70 = {
 'Vd.ub=vsat(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) '
                          '{Vd.uh[i].b[0]=usat8(Vv.h[i]);Vd.uh[i].b[1]=usat8(Vu.h[i]) '
                          ';}',
}

test71 = {
 'Vd.b=vsub(Vu.b,Vv.b):sat': 'for (i = 0; i < VELEM(8); i++) {Vd.b[i] = '
                             'sat8(Vu.b[i]-Vv.b[i]) ;}',
}

test72 = {
 'Vd.h=vabs(Vu.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = (ABS(Vu.h[i])) '
                    ';}',
}

test73 = {
 'Vd.h=vabs(Vu.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                        'sat16(ABS(Vu.h[i])) ;}',
}

test74 = {
 'Vd.h=vadd(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i]) ;}',
}

test75 = {
 'Vd.h=vadd(Vu.h,Vv.h):sat': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             'sat16(Vu.h[i]+Vv.h[i]) ;}',
}

test76 = {
 'Vd.h=vavg(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                         '(Vu.h[i]+Vv.h[i])/2 ;}',
}

test77 = {
 'Vd.h=vavg(Vu.h,Vv.h):rnd': 'for (i = 0; i < VELEM(16); i++) {Vd.h[i] = '
                             '(Vu.h[i]+Vv.h[i]+1)/2 ;}',
}

test78 = {
 'Vd.h=vpack(Vu.w,Vv.w):sat': 'for (i = 0; i < VELEM(32); i++) {Vd.h[i] = '
                              'sat16(Vv.w[i]);Vd.h[i+VBITS/32] = '
                              'sat16(Vu.w[i]) ;}',
}

test79 = {
 'Vd.h=vpacko(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[1];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] '
                           ';}',
}

# Fails
test80 = {
 'Vd=vxor(Vu,Vv)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = Vu.uh[i] ^ '
                   'Vv.h[i] ;}',
}

# Fails
test81 = {
 'if (!Qv4) Vx.b-=Vu.b': 'for (i = 0; i < VELEM(8); i--) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]-Vu.ub[i] ;}',
}

# Fails
test82 = {
 'if (!Qv4) Vx.b+=Vu.b': 'for (i = 0; i < VELEM(8); i++) {Vx.ub[i]=QvV.i ? '
                         'Vx.ub[i] : Vx.ub[i]+Vu.ub[i] ;}',
}

test83 = {
 'Vd.h=vpacke(Vu.w,Vv.w)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i] = '
                           'Vv.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[0] '
                           ';}',
}

test84 = {
 'Vd.uh=vsat(Vu.uw,Vv.uw)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.w[i].h[0]=usat16(Vv.uw[i]);Vd.w[i].h[1]=usat16(Vu.uw[i]) '
                            ';}',
}

test85 = {
 'Vd.uw=vmpye(Vu.uh,Rt.uh)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].uh[0] * Rt.uh[0]) ;}',
}

# Yay! It compiles!
test86 = {
   'Vd.uw=vrmpy(Vu.ub,Rt.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] * Rt.ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] * Rt.ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] * Rt.ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] * Rt.ub[3]) ;}',
}

test87 = {
   'Vd.uw=vrmpy(Vu.ub,Vv.ub)': 'for (i = 0; i < VELEM(32); i++) {Vd.uw[i] = '
                             '(Vu.uw[i].ub[0] *Vv.uw[i].ub[0]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[1] *Vv.uw[i].ub[1]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[2] *Vv.uw[i].ub[2]);Vd.uw[i] += '
                             '(Vu.uw[i].ub[3] *Vv.uw[i].ub[3]) ;}',
}

test88 = {
 'Vd.b=vdeal(Vu.b)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i ] = '
                     'Vu.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] ;}',
}

test89 = {
 'Vd.b=vdeale(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.ub[0+i ] = '
                           'Vv.uw[i].ub[0];Vd.ub[VBITS/32+i ] = '
                           'Vv.uw[i].ub[2];Vd.ub[2*VBITS/32+i] = '
                           'Vu.uw[i].ub[0];Vd.ub[3*VBITS/32+i] = '
                           'Vu.uw[i].ub[2] ;}',
}

test90 = {
 'Vd.w=vrmpy(Vu.ub,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Vv.w[i].b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Vv.w[i].b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Vv.w[i].b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Vv.w[i].b[3]) ;}',
}

test91 = {
   'Vd.w=vrmpy(Vu.ub,Rt.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                           '(Vu.uw[i].ub[0] * Rt.b[0]);Vd.w[i] += '
                           '(Vu.uw[i].ub[1] * Rt.b[1]);Vd.w[i] += '
                           '(Vu.uw[i].ub[2] * Rt.b[2]);Vd.w[i] += '
                           '(Vu.uw[i].ub[3] * Rt.b[3]) ;}',
}

test92 = {
 'Vd.w=vmpyieo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                            '(Vu.w[i].h[0]*Vv.w[i].h[1]) << 16;}',
}

test93 = {
 'Vd.w=vrmpy(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i] = '
                          '(Vu.w[i].b[0] * Vv.w[i].b[0]);Vd.w[i] += '
                          '(Vu.w[i].b[1] * Vv.w[i].b[1]);Vd.w[i] += '
                          '(Vu.w[i].b[2] * Vv.w[i].b[2]);Vd.w[i] += '
                          '(Vu.w[i].b[3] * Vv.w[i].b[3]) ;}',
}

test94 = {
   'Vd.h=vdeal(Vu.h)': 'for (i = 0; i < VELEM(32); i++) {Vd.uh[i ] = '
                     'Vu.uw[i].uh[0];Vd.uh[i+VBITS/32] = Vu.uw[i].uh[1] ;}',
}

test95 = {
 'Vd.b=vpacke(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[0];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[0] '
                           ';}',
}

test96 = {
 'Vd.b=vpacko(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(16); i++) {Vd.ub[i] = '
                           'Vv.uh[i].ub[1];Vd.ub[i+VBITS/16] = Vu.uh[i].ub[1] '
                           ';}',
}

test97 = {
 'Vd.b=vshuff(Vu.b)': 'for (i = 0; i < VELEM(16); i++) '
                      '{Vd.uh[i].b[0]=Vu.ub[i];Vd.uh[i].b[1]=Vu.ub[i+VBITS/16] '
                      ';}',
}

test98 = {
 'Vd.b=vshuffo(Vu.b,Vv.b)': 'for (i = 0; i < VELEM(16); i++) '
                            '{Vd.uh[i].b[0]=Vv.uh[i].ub[1];Vd.uh[i].b[1]=Vu.uh[i].ub[1] '
                            ';}',
}

test99 = {
 'Vd.h=vshuff(Vu.h)': 'for (i = 0; i < VELEM(32); i++) '
                      '{Vd.uw[i].h[0]=Vu.uh[i];Vd.uw[i].h[1]=Vu.uh[i+VBITS/32] '
                      ';}',
}

test100 = {
 'Vd.h=vshuffe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[0];Vd.uw[i].h[1]=Vu.uw[i].uh[0] '
                            ';}',
}

test101 = {
 'Vd.h=vshuffo(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                            '{Vd.uw[i].h[0]=Vv.uw[i].uh[1];Vd.uw[i].h[1]=Vu.uw[i].uh[1] '
                            ';}',
}

# Parser fails
test102 = {
   'Vd=Vu': 'for (i = 0; i < VELEM(32); i++) {Vd.w[i]=Vu.w[i] ;}',
}

# Fails
test103 = {
 'Vd=vnot(Vu)': 'for (i = 0; i < VELEM(16); i++) {Vd.uh[i] = ~Vu.uh[i] ;}',
}

# Parser fails
test104 = {
 'Vdd.h=vshuffoe(Vu.h,Vv.h)': 'for (i = 0; i < VELEM(32); i++) '
                              '{Vdd.v[0].uw[i].h[0]=Vv.uw[i].uh[0];Vdd.v[0].uw[i].h[1]=Vu.uw[i].uh[0];Vdd.v[1].uw[i].h[0]=Vv.uw[i].uh[1];Vdd.v[1].uw[i].h[1]=Vu.uw[i].uh[1] '
                              ';}',
}

test105 = {
 'Vdd.h=vsub(Vuu.h,Vvv.h)': 'for (i = 0; i < VELEM(16); i++) {Vdd.v[0].h[i] = '
                            '(Vuu.v[0].h[i]-Vvv.v[0].h[i]);Vdd.v[1].h[i] = '
                            '(Vuu.v[1].h[i]-Vvv.v[1].h[i]) ;}',
}


if __name__ == '__main__':
  Compile(test86)

