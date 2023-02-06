#############################################################
#
# Class for representing macro in Rosette IR.
#
#############################################################


from RoseValues import RoseConstant

from copy import deepcopy


class RoseMacro:
    def __init__(self, Name : str, Value : RoseConstant):
      assert isinstance(Value, RoseConstant)
      self.Name = Name
      self.Value = Value
    
    @staticmethod
    def create(Name : str, Type : RoseType):
        return RoseValue(Name, Type)
    
    def __eq__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name == Other.Name and self.Value == Other.Value

    def __ne__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name != Other.Name or self.Value != Other.Value
    
    def __str__(self):
        return self.getName()

    def getName(self):
        return self.Name
    
    def getValue(self):
      return self.Value
    
    def clone(self):
      return deepcopy(self)

    def print(self, _):
        print("#" + self.Name + " ")
        Value.print()

