from RoseValue import RoseValue
from RoseRegion import RoseRegion


# Class representing loops
# Loops have headers and region list for body
class RoseForLoop(RoseRegion):
    def __init__(self, IteratorName : str, Start : RoseValue, End : RoseValue, Step : RoseValue, 
                RegionList : list, ParentRegion : RoseRegion):
        # Loop header information
        self.Iterator = RoseValue(IteratorName, RoseType.getIntegerTy())
        self.Start = Start
        self.End = End
        self.Step = Step
        # Loop region body
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue, 
                RegionList : list, ParentRegion : RoseRegion):
        return RoseForLoop(IteratorName, Start, End, Step, RegionList, ParentRegion)

    # Empty loop
    @staticmethod
    def create(IteratorName : str, End : RoseValue, Start : RoseValue, Step : RoseValue):
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
            + self.Start.print() + " " + self.End.print() + " " + self.Step.print() + ")])"
        print(LoopHeader)
        # Print regions in this loop
        super().print()
        print(")")

