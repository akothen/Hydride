from RoseType import RoseType


# Base class for Rosette values. The values have name
# and type. Keeping this simple for now.
class RoseValue:
    def __init__(self, Name : str, Type : RoseType, SubClassData = None):
        self.Name = Name
        self.Type = Type
        self.SubClassData = SubClassData
        print(self.SubClassData)
    
    @staticmethod
    def create(Name : str, Type : RoseType, SubClassData = None):
        return RoseValue(Name, Type, SubClassData)
    
    def __eq__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name == Other.Name and self.Type == Other.Type \
            and self.SubClassData == Other.SubClassData

    def __ne__(self, Other):
        assert isinstance(Other, RoseValue)
        return self.Name != Other.Name or self.Type != Other.Type \
            or self.SubClassData != Other.SubClassData

    def getType(self):
        return self.Type

    def getName(self):
        return self.Name
    
    def getSubClassData(self):
        return self.SubClassData
    
    def setSubClassData(self, Data, Key = None):
        if Key == None:
            self.SubClassData = Data
        else:
            self.SubClassData[Key] = Data
    
    def setName(self, Name : str):
        self.Name = Name
    
    def print(self, Debug = False):
        print(self.Name)
        if Debug == True:
            self.Type.print()
