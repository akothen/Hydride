
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

  def copyAbstractionsFromParent(self):
    assert not self.isRootContext()
    assert isinstance(self.ParentContext, RoseContext)
    self.CompiledAbstractions = deepcopy(self.ParentContext.getCompiledAbstractions())

