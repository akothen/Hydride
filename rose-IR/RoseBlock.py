from RoseOperation import RoseOperation
from RoseFunctionCall import RoseFunctionCall
from RoseRegion import RoseRegion


# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock(RoseRegion):
    def __init__(self, OpList : list, ParentRegion):
        # Sanity check
        for Op in OpList:
            assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        super().__init__(ParentRegion, OpList)
        
    @staticmethod
    def create(OpList : list, ParentRegion):
        return RoseBlock(OpList, ParentRegion)

    def getOps(self):
        return self.getChildren()

    def addOp(self, Op):
        assert(isinstance(Op, RoseOperation)
            or isinstance(Op, RoseFunctionCall))
        self.addChild(Op)
 

