from RoseType import RoseType
from RoseRegion import RoseRegion

# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
class RoseFunction(RoseRegion):
    def __init__(self, Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion : RoseRegion):
        self.Name = Name
        self.ArgList = ArgsList
        self.ReturnValue = RoseValue("", RetType)
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion = None):
        return RoseFunction(Name, ArgsList, RetType, RegionList, ParentRegion)
    
    def getNumArgs(self):
        return len(self.ArgsList)
    
    def getArg(self, Index):
        return self.ArgList[Index]
    
    def getReturnValue(self):
        return self.ReturnValue
    
    def getReturnTy(self):
        return self.ReturnValue.getType()
    
    def addArg(self, NewArg):
        self.ArgList.append(NewArg)

    def isTopLevelFunction(self):
        return (self.getParent() == None)

    def print(self):
        # Print function signature first
        Func_Sig = "(define (" + self.Name
        for Arg in self.ArgList:
            Func_Sig += (" " + Arg.getName())
        Func_Sig += ")"
        print(Func_Sig)
        # Pront regions in this function
        super().print()

