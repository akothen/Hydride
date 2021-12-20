from RoseValue import RoseValue
from RoseRegion import RoseRegion


# Class representing loops
# Loops have headers and region list for body
class RoseLoop(RoseRegion):
    def __init__(self, InductionVar : RoseValue, Start : int, End : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        # Loop header information
        self.InductionVar = InductionVar
        self.Start = Start
        self.End = End
        self.Step = Step
        # Loop region body
        super().__init__(ParentRegion, RegionList)
    
    @staticmethod
    def create(InductionVar : RoseValue, End : int, Start : int, Step : int, 
                RegionList : list, ParentRegion : RoseRegion):
        return RoseLoop(InductionVar, Start, End, Step, RegionList, ParentRegion)

    # More regular loop
    @staticmethod
    def create(InductionVar : RoseValue, End : int, RegionList : list, ParentRegion : RoseRegion):
        return RoseLoop(InductionVar, 0, End, 1, RegionList, ParentRegion)

    # Empty loop
    @staticmethod
    def create(InductionVar : RoseValue, End : int, Start = 0, Step = 1):
        return RoseLoop(InductionVar, Start, End, Step, [], None)

    def getInductionVariable(self):
        return self.InductionVar
    
    def getStartIndex(self):
        return self.Start

    def getEndIndex(self):
        return self.End

    def getStep(self):
        return self.Step

    def print(self):
        LoopHeader = "(for/list ([" + self.InductionVar.getName() + " (range " \
            + str(self.Start) + " " + str(self.End) + " " + str(self.Step) + ")])"
        print(LoopHeader)
        # Print regions in this loop
        super().print()
        print(")")

