from RoseType import RoseType

# Base class for Rosette values. The values have name
# and type. Keeping this simple for now.
class RoseValue:
    def __init__(self, Name : str, Type : RoseType):
        self.Name = Name
        self.Type = Type

    def getType(self):
        return self.Type

    def getName(self):
        return self.Name
    
    def setName(self, Name : str):
        self.Name = Name

    def print(self):
        print(self.Name)
