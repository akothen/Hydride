
from sema_ast import  FuncDef
from RoseValue import RoseValue
from RoseType import RoseType
from RoseAbstractions import RoseFunction, RoseForLoop, RoseBlock
from RoseConstants import RoseUndefRegion
from RoseOperation import RoseOperation


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
  
  def addRhsOperation(self, Operation : RoseOperation):
    self.RhsOperations.append(Operation)
  
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
  
  def isVariableDefined(self, Name : str):
    return Name in self.Variables

  def getVariableValue(self, Name : str):
    return self.Variables[Name]

  def setVariableValue(self, Name : str, Value : RoseValue):
    self.Variables[Name] = Value
  
  def setVariableType(self, Name : str, Type : RoseType):
    self.Variables[Name] = RoseValue.create(Name, Type)
  
