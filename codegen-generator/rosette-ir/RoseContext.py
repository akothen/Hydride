
from RoseType import *
from RoseValue import RoseValue
from RoseValues import *
from RoseAbstractions import RoseFunction, RoseUndefRegion

from copy import deepcopy


# This is a generic context that could be used across
# different architectures.
class RoseContext:
  class RoseValueNameGen():
    def __init__(self):
      self.NameMap = dict()
    
    def genName(self, Prefix : str = ""):
      if Prefix in self.NameMap:
        Counter = self.NameMap[Prefix]
        Name = Prefix + str(Counter)
        self.NameMap[Prefix] = Counter + 1
      else:
        Name = Prefix + "0"
        self.NameMap[Prefix] = 1
      if Prefix == "":
        return "%" + Name
      return Name
  
  def __init__(self):
    self.CompiledAbstractions = dict()   # ID --> Some Rose abstraction
    # Track the contexts we encounter
    self.ParentContext = None
    self.Contexts = dict()   # ID --> child context
    # Mapping functions to their contexts
    self.FunctionToContexts = dict()
    # Heirarchical abstractions such as functions, loops and cond regions.
    # Blocks are not dealt with by this compiler.
    self.RootAbstractions = list()
    # Variable names are associated with their IDs
    self.Variables = dict()    # Name --> ID
    # Map variable names to the element types
    self.VariablesToElemTypes = dict()
    # Track the rose value --> signedness 
    self.CompiledValToSignedness = dict()
    # Map abstractions to the key
    self.CompiledAbstractionsKeys = dict()   # Abstraction --> abstraction key
    # Name generator
    self.NameGenerator = self.RoseValueNameGen()
  
  def genName(self, Prefix : str = ""):
    return self.NameGenerator.genName(Prefix)

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
  
  def addSignednessInfoForValue(self, Value : RoseValue, IsSigned : bool):
    assert not isinstance(Value, RoseUndefValue)
    print("addSignednessInfoForValue:")
    Value.print()
    self.CompiledValToSignedness[Value] = IsSigned
  
  def isValueSigned(self, Value : RoseValue):
    assert not isinstance(Value, RoseUndefValue)
    assert Value in self.CompiledValToSignedness
    return self.CompiledValToSignedness[Value]

  def isValueSignKnown(self, Value : RoseValue):
    assert not isinstance(Value, RoseUndefValue)
    return Value in self.CompiledValToSignedness

  def addVariable(self, Name : str, ID : str):
    self.Variables[Name] = ID
  
  def getVariableID(self, Name : str):
    assert Name in self.Variables
    return self.Variables[Name]
  
  def isVariableDefined(self, Name : str):
    if Name in self.Variables:
      return True
    return False
  
  def addElemTypeOfVariable(self, Name : str, ElemType : RoseType):
    self.VariablesToElemTypes[Name] = ElemType
  
  def isElemTypeOfVariableKnown(self, Name : str):
    if Name in self.VariablesToElemTypes:
      return True
    return False

  def getVariablesToElemTypes(self):
    return self.VariablesToElemTypes
  
  def getElemTypeOfVariable(self, Name : str):
    assert Name in self.VariablesToElemTypes
    return self.VariablesToElemTypes[Name]
  
  def createContext(self, ID : str, ChildContext):
    assert isinstance(ChildContext, RoseContext)
    ChildContext.setParentContext(self)
    self.Contexts[ID] = ChildContext
  
  def copyContext(self, ID : str, Function : RoseFunction):
    assert not isinstance(Function, RoseUndefRegion)
    self.FunctionToContexts[Function] = self.Contexts[ID]

  def destroyContext(self, ID : str):
    self.Contexts[ID] = None
  
  def getChildContext(self, ID : str):
    return self.Contexts[ID] 
  
  def getContextOfChildFunction(self, Function : RoseFunction):
    assert Function in self.FunctionToContexts
    return self.FunctionToContexts[Function]

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

  def getCompiledValToSignednessMap(self):
    return self.CompiledValToSignedness
  
  def getNameGenerator(self):
    return self.NameGenerator

  def getDefinedVariables(self):
    return self.Variables

  def copyAbstractionsFromParent(self):
    assert not self.isRootContext()
    assert isinstance(self.ParentContext, RoseContext)
    self.CompiledAbstractions = deepcopy(self.ParentContext.getCompiledAbstractions())
    # Copy the variables too
    for Name, ID in self.ParentContext.getDefinedVariables().items():
      self.Variables[Name] = ID
    # Copy over the element type information as well
    for Name, ElemType in self.ParentContext.getVariablesToElemTypes().items():
      self.VariablesToElemTypes[Name] = ElemType
    # Copy over the signedeness information as well
    for Value, IsSigned in self.ParentContext.getCompiledValToSignednessMap().items():
      self.CompiledValToSignedness[Value] = IsSigned
    # Copy over the name generator
    self.NameGenerator = self.ParentContext.getNameGenerator()
 
  def replaceParentAbstractionsWithChild(self):
    for Name, ID in self.ParentContext.getDefinedVariables().items():
      # Get the ID for the same variable name in curreent context
      ChildVarID = self.Variables[Name]
      Abstraction = self.CompiledAbstractions[ChildVarID]
      self.ParentContext.updateCompiledAbstraction(ID, Abstraction)
    # Copy over the name generator to the parent
    self.NameGenerator = self.ParentContext.getNameGenerator()


