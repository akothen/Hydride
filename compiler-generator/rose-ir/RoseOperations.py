
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseAbstractions import RoseUndefRegion
from RoseValues import RoseOperation


class RoseReturnOp(RoseOperation):
  def __init__(self, Value : RoseValue, ParentBlock):
    OperandList = [Value]
    super().__init__(RoseOpcode.ret, "", OperandList, ParentBlock)

  @staticmethod  
  def create(*args):
    if len(args) == 2:
      if isinstance(args[0], RoseValue):
        return RoseReturnOp(args[0], args[1])
    if len(args) == 1:
      if isinstance(args[0], RoseValue):
        return RoseReturnOp(args[0], RoseUndefRegion())
      if not isinstance(args[0], RoseValue):
        Value = RoseValue.create("", RoseType.getVoidTy())
        return RoseReturnOp(Value, args[0])
    if len(args) == 0:
      Value = RoseValue.create("", RoseType.getVoidTy())
      return RoseReturnOp(Value, RoseUndefRegion())
    assert False

  def getReturnedValue(self):
    return self.getOperands(0)

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    String = Spaces + "(" + self.getReturnedValue().getName() + ")"
    return String


class RoseCallOp(RoseOperation):
  def __init__(self, Name : str, Callee, OperandList : list, ParentBlock):
    assert Callee.getType().isFunctionTy()
    Operands = [Callee]
    Operands.extend(OperandList)
    super().__init__(RoseOpcode.call, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Callee, OperandList : list, ParentBlock = RoseUndefRegion()):
    return RoseCallOp(Name, Callee, OperandList, ParentBlock)
  
  def getCallee(self):
    return self.getOperands()[0]
  
  def getCallOperands(self):
    return self.getOperands()[1:]

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))"
    return String

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = ""
    if Name != "":
        String = Spaces + Name + " = "
    else:
      String = Spaces
    String += str(self.Opcode)
    String += " " + self.getCallee().getName() + "("
    for Index, Operand in enumerate(self.getCallOperands()):
        String += " " + str(Operand.getType()) + " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += ","
    String += " )"
    print(String)
  

class RoseSelectOp(RoseOperation):
  def __init__(self, Name : str, Cond : RoseValue, Then : RoseValue, Else : RoseValue, ParentBlock):
    assert Cond.getType().isBooleanTy() or Cond.getType().isBitVectorTy()
    OperandList = [Cond, Then, Else]
    super().__init__(RoseOpcode.select, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Cond : RoseValue, Then : RoseValue, Else : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseSelectOp(Name, Cond, Then, Else, ParentBlock)
  
  def getCondition(self):
    return self.getOperands()[0]
  
  def getThenValue(self):
    return self.getOperands()[1]
  
  def getElseValue(self):
    return self.getOperands()[2]

  def to_rosette(self, NumSpace = 0):
    assert "No direction convertion of Select Op to Rosette!"
    NotImplemented


class RoseCastOp(RoseOperation):
  def __init__(self, Name : str, Operand : RoseValue, TargetType : RoseType, ParentBlock):
    assert TargetType.isBitVectorTy() or TargetType.isBooleanTy() or TargetType.isIntegerTy()
    assert Operand.getType().isBitVectorTy() or Operand.getType().isBooleanTy() \
        or Operand.getType().isIntegerTy()
    assert Operand.getType() != TargetType
    OperandList = [Operand, TargetType]
    super().__init__(RoseOpcode.cast, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand : RoseValue, TargetType : RoseType, 
            ParentBlock = RoseUndefRegion()):
    return RoseCastOp(Name, Operand, TargetType, ParentBlock)

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    if self.getOperand().getType().isBitVectorTy() and self.getType().isIntegerTy():
      String += "bitvector->integer " + self.getOperand().getName() + "))"
    elif self.getOperand().getType().isIntegerTy() and self.getType().isBitVectorTy():
      String += "integer->bitvector " + self.getOperand().getName() + " " \
              "(bitvector " + self.getType().getBitwidth() + "))"
    elif self.getOperand().getType().isBitVectorTy() and self.getType().isBooleanTy():
      String += "bitvector->bool " + self.getOperand().getName() + "))"
    elif self.getOperand().getType().isBooleanTy() and self.getType().isBitVectorTy():
      String += "bool->bitvector " + self.getOperand().getName() + " " \
              "(bitvector " + self.getType().getBitwidth() + "))"
    return String

  def print(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + Name + " = "
    String += str(self.Opcode)
    String += " " + self.getOperand(0).getName() + " " + str(self.getOperand(1))
    print(String)


class RoseAbsOp(RoseOperation):
  def __init__(self, Name : str, Operand : RoseValue, ParentBlock):
    assert Operand.getType().isBitVectorTy() or Operand.getType().isIntegerTy()
    OperandList = [Operand]
    super().__init__(RoseOpcode.abs, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Operand : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseAbsOp(Name, Operand, ParentBlock)



######################################## ARITHMETIC OPERATORS ###########################


class RoseAddOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.add, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAddOp(Name, Operands, ParentBlock)


class RoseSubOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.sub, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseSubOp(Name, Operands, ParentBlock)


class RoseMulOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.mul, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMulOp(Name, Operands, ParentBlock)

  
class RoseDivOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.div, Name, OperandList, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseDivOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseRemOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.rem, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseRemOp(Name, Operand1, Operand2, ParentBlock)
  

class RoseModOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.mod, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseModOp(Name, Operand1, Operand2, ParentBlock)



############################# COMPARISON OPERATORS ###################################

class RoseEQOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.equal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseEQOp(Name, Operand1, Operand2, ParentBlock)

class RoseNEQOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.notequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseNEQOp(Name, Operand1, Operand2, ParentBlock)

  def to_rosette(self, NumSpace = 0):
    Spaces = ""
    for _ in range(NumSpace):
      Spaces += " "
    Name = super().getName()
    String = Spaces + "(define " + Name + " ("
    String += "not (equal? " 
    for Index, Operand in enumerate(self.getOperands()):
        String += " " + Operand.getName() 
        if Index != len(self.getOperands()) - 1:
          String += " "
    String += " )))"
    return String


class RoseLTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.lessthan, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseLTOp(Name, Operand1, Operand2, ParentBlock)



class RoseLEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.lessthanequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseLEOp(Name, Operand1, Operand2, ParentBlock)


class RoseGTOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.greaterthan, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseGTOp(Name, Operand1, Operand2, ParentBlock)


class RoseGEOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert not Operand1.getType().isBitVectorTy()
    assert not Operand2.getType().isBitVectorTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.greaterthanequal, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseGEOp(Name, Operand1, Operand2, ParentBlock)



######################################## ADDITIONAL OPERATORS ###########################


class RoseMinOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.min, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMinOp(Name, Operands, ParentBlock)


class RoseMaxOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert not Operand.getType().isBitVectorTy()
    super().__init__(RoseOpcode.max, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseMaxOp(Name, Operands, ParentBlock)



######################################## BOOLEAN OPERATORS ###########################


class RoseNotOp(RoseOperation):
  def __init__(self, Name : str, Value : RoseValue, ParentBlock):
    assert Value.getType().isBooleanTy()
    OperandList = [Value]
    super().__init__(RoseOpcode.boolnot, Name, OperandList, ParentBlock)

  @staticmethod
  def create(Name : str, Value : RoseValue, ParentBlock = RoseUndefRegion()):
    return RoseNotOp(Name, Value, ParentBlock)

  def getInputValue(self):
    return self.getOperand(0)


class RoseAndOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBooleanTy()
    super().__init__(RoseOpcode.booland, Name, Operands, ParentBlock)
  
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseAndOp(Name, Operands, ParentBlock)


class RoseNandOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBooleanTy()
    super().__init__(RoseOpcode.boolnand, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseNandOp(Name, Operands, ParentBlock)


class RoseOrOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBooleanTy()
    super().__init__(RoseOpcode.boolor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseOrOp(Name, Operands, ParentBlock)


class RoseNorOp(RoseOperation):
  def __init__(self, Name : str, Operands : list, ParentBlock):
    for Operand in Operands:
      assert Operand.getType().isBooleanTy()
    super().__init__(RoseOpcode.boolnor, Name, Operands, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operands : list, ParentBlock = RoseUndefRegion()):
    return RoseNorOp(Name, Operands, ParentBlock)


class RoseXorOp(RoseOperation):
  def __init__(self, Name : str, Operand1 : RoseValue, Operand2 : RoseValue, ParentBlock):
    assert Operand1.getType().isBooleanTy()
    assert Operand2.getType().isBooleanTy()
    OperandList = [Operand1, Operand2]
    super().__init__(RoseOpcode.boolxor, Name, OperandList, ParentBlock)
    
  @staticmethod
  def create(Name : str, Operand1 : RoseValue, Operand2 : RoseValue, 
            ParentBlock = RoseUndefRegion()):
    return RoseXorOp(Name, Operand1, Operand2, ParentBlock)




