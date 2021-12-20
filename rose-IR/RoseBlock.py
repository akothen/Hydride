from RoseOperation import RoseOperation
from RoseFunctionCall import RoseFunctionCall


# Definition of Block 
# A block is a list of operations and function calls
# Blocka sre contained in regions
class RoseBlock:
    def __init__(self, OpList : list, ParentRegion):
        # Sanity check
        for Op in OpList:
            assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        self.OpList = OpList
        self.ParentRegion = ParentRegion
        
    @staticmethod
    def create(OpList : list, ParentRegion):
        return RoseBlock(OpList, ParentRegion)

    def getOps(self):
        return self.OpList

    def addOp(self, Op):
        assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        self.OpList.append(Op)

    def print(self):
        for Op in self.OpList:
            Op.print()


