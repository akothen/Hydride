from RoseValue import RoseValue
from RoseRegion import RoseRegion


# Class representing for loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
    def __init__(self, IteratorName : str, Start : int, End : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        # Loop header information
        self.Iterator = RoseValue(IteratorName, RoseType.getIntegerTy())
        self.Start = Start
        self.End = End
        self.Step = Step
        # Loop region body
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(IteratorName : str, End : int, Start : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        return RoseForLoop(IteratorName, Start, End, Step, RegionList, ParentRegion)

    # More regular loop
    @staticmethod
    def create(IteratorName : str, End : int, RegionList : list, ParentRegion : RoseRegion):
        return RoseForLoop(IteratorName, 0, End, 1, RegionList, ParentRegion)

    # Empty loop
    @staticmethod
    def create(IteratorName : str, End : int, Start = 0, Step = 1):
        return RoseForLoop(IteratorName, Start, End, Step, [], None)

    def getIterator(self):
        return self.Iterator
    
    def getStartIndex(self):
        return self.Start

    def getEndIndex(self):
        return self.End

    def getStep(self):
        return self.Step
    
    def setIteratorName(self, Name):
        self.Iterator = RoseValue(Name, self.Iterator.getType())

    def print(self):
        LoopHeader = "(for/list ([" + self.Iterator.getName() + " (range " \
            + str(self.Start) + " " + str(self.End) + " " + str(self.Step) + ")])"
        print(LoopHeader)
        # Print regions in this loop
        super().print()
        print(")")

        
