
from sema_ast import  FuncDef
from RoseValue import RoseValue
from RoseType import RoseType
from RoseAbstractions import RoseFunction, RoseForLoop, RoseBlock
from RoseConstants import RoseUndefRegion
from RoseOperation import RoseOperation


# Keeps track of all variables, functions and contexts
class RoseContext:
  def __init__(self):
    # Keep track of all variables (arguments, LHS)
    self.Variables = {}
    # Keep track of RHS
    self.RhsOperations = {}
    # Cache the functions we encounter
    self.FunctionDefs = {}
    self.Functions = {}
    # Track the contexts we encounter
    self.ParentConext = None
    self.Contexts = {}
    # Heirarchical abstractions such as functions, loops and cond regions.
    # Blocks are not dealt with by this compiler.
    self.RootAbstractions = []
    # track range of defined bits for implicitly defined variables
    # mapping <implicit var> -> <highest defined bit>
    self.DefinedRange = {}
  
  def pushRootAbstraction(self, Abstraction):
    self.RootAbstractions.append(Abstraction)
    
  def popRootAbstraction(self):
    return self.RootAbstractions.pop(len(self.RootAbstractions) - 1)
  
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
  
  def addContext(self, FunctionName : str, Context):
    assert isinstance(Context, RoseContext)
    self.Contexts[FunctionName] = Context
    Context.setParentContext(self)
  
  def getContext(self, AbstractionName : str):
    return self.Contexts.get(AbstractionName, None)
  
  def addRhsOperation(self, Operation : RoseOperation):
    self.RhsOperations.append(Operation)
  
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


