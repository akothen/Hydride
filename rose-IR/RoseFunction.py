from types import FunctionType
from RoseValue import RoseValue
from RoseType import RoseType, RoseFunctionType
from RoseRegion import RoseRegion
from RoseArgument import RoseArgument


# This is need to track the lower-level regions,
# blocks, operations, etc. This does not inherit
# any other class for now.
# A function is a region and a value
class RoseFunction(RoseValue, RoseRegion):
    def __init__(self, Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion : RoseRegion):
        # Sanity checks
        for Arg in ArgsList:
            assert isinstance(Arg, RoseArgument)
        self.ReturnValue = None
        self.ArgList = ArgsList
        ArgTyList = [Arg.getType() for Arg in ArgsList]
        FunctionType = RoseFunctionType.create(ArgTyList, RetType)
        RoseValue.__init__(Name, FunctionType)
        RoseRegion.__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(Name : str, ArgsList : list, RetType : RoseType, RegionList : list, ParentRegion : RoseRegion):
        return RoseFunction(Name, ArgsList, RetType, RegionList, ParentRegion)
    
    # Empty function
    @staticmethod
    def create(Name : str, ArgsList : list, RetType : RoseType):
        return RoseFunction(Name, ArgsList, RetType, [], None)
    
    # Empty function skeleton
    @staticmethod
    def create(Name : str, FunctionType : RoseFunctionType):
        ArgTypeList = FunctionType.getArgList()
        ArgsList = []
        for ArgTy, ArgIndex in enumerate(ArgTypeList):
            ArgsList.append(RoseArgument.create("arg", ArgTy, None, ArgIndex))
        Function = RoseFunction(Name, ArgsList, FunctionType.getReturnType(), [], None)
        for Arg, ArgIndex in enumerate(ArgsList):
            Arg.setFunction(Function)
            Function.addArg(Arg, ArgIndex)
        return Function
    
    def getNumArgs(self):
        return len(self.ArgsList)
    
    def getArg(self, Index):
        return self.ArgList[Index]
    
    def getReturnValue(self):
        return self.ReturnValue
    
    def addArg(self, NewArg : RoseValue, ArgIndex : int):
        # Some sanity checks
        assert ArgIndex < len(self.ArgList)
        assert self.ArgList[ArgIndex].getType() == NewArg.getType()
        Arg = RoseArgument.create(NewArg.getName(), NewArg.getType(), self, ArgIndex)
        self.ArgList[ArgIndex] = Arg
        # TODO: Replace uses as well

    def isTopLevelFunction(self):
        return (self.getParent() == None)
    
    def setRetValName(self, Name):
        self.ReturnValue = RoseValue(Name, self.getType().getReturnType())

    def print(self):
        # Print function signature first
        Func_Sig = "(define (" + self.getName()
        for Arg in self.ArgList:
            Func_Sig += (" " + Arg.getName())
        Func_Sig += ")"
        print(Func_Sig)
        # Print regions in this function
        RoseRegion.print()
        print(")")
 

