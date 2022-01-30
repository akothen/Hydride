
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
    # Map abstractions to the key
    self.CompiledAbstractionsKeys = dict()   # Abstraction --> abstraction key
  
  def isCompiledAbstraction(self, ID : str):
    if ID in self.CompiledAbstractions:
      return True
    return False
  
  def addCompiledAbstraction(self, ID : str, Abstraction):
    self.CompiledAbstractions[ID] = Abstraction

  def addKeyForCompiledAbstraction(self, Key, Abstraction):
    self.CompiledAbstractionsKeys[Abstraction] = Key
    
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
  
  def getRootAbstraction(self):
    return self.RootAbstractions[len(self.RootAbstractions) - 1]
  
  def addAbstractionToIR(self, Abstraction):
    TailAbstraction = self.RootAbstractions.pop()
    if TailAbstraction in self.CompiledAbstractionsKeys:
      Key = self.CompiledAbstractionsKeys[TailAbstraction]
      TailAbstraction.addAbstraction(Abstraction, Key)
      self.CompiledAbstractionsKeys[TailAbstraction] = Key
    else:
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
