
from sema_ast import  FuncDef
from RoseValue import RoseValue
from RoseType import RoseType
from RoseAbstractions import RoseFunction, RoseForLoop, RoseBlock
from RoseConstants import RoseUndefRegion
from RoseOperation import RoseOperation


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
    return self.RootAbstractions.pop(len(self.RootAbstractions) - 1)
  
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
