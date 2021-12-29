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
        FunctionType = RoseType.getFunctionTy(ArgTyList, RetType)
        print(type(FunctionType))
        RoseValue.__init__(self, Name, FunctionType)
        RoseRegion.__init__(self, ParentRegion, RegionList)
    
    # Multiple constructors packaged into one
    @staticmethod
    def create(*args):
        if len(args) == 5:
            if isinstance(args[0], str) and isinstance(args[1], list) \
            and isinstance(args[2], RoseType) and isinstance(args[3], list) \
            and isinstance(args[4], RoseRegion):
                return RoseFunction(args[0], args[1], args[2], args[3], args[4])
        if len(args) == 4:
            if isinstance(args[0], str) and isinstance(args[1], list) \
            and isinstance(args[2], RoseType) and isinstance(args[3], list):
                return RoseFunction(args[0], args[1], args[2], args[3], None)
        if len(args) == 3:
                if isinstance(args[0], str) and isinstance(args[1], list) \
                and isinstance(args[2], RoseType):
                    return RoseFunction(args[0], args[1], args[2], [], None)
        if len(args) == 2:
                if isinstance(args[0], str) and isinstance(args[1], RoseFunctionType):
                    FunctionType = args[1]
                    ArgTypeList = FunctionType.getArgList()
                    ArgsList = []
                    for ArgIndex, ArgTy in enumerate(ArgTypeList):
                        ArgsList.append(RoseArgument.create("arg", ArgTy, None, ArgIndex))
                    Function = RoseFunction(args[0], ArgsList, FunctionType.getReturnType(), [], None)
                    for ArgIndex, Arg in enumerate(ArgsList):
                        Arg.setFunction(Function)
                        Function.addArg(Arg, ArgIndex)
                    return Function
        assert(False)
    
    def getNumArgs(self):
        return len(self.ArgList)
    
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
 

