from RoseOperation import RoseOperation
from RoseFunctionCall import RoseFunctionCall


# Definition of Block 
# A block is a list of operations and function calls
class RoseBlock:
    def __init__(self, OpList : list):
        # Sanity check
        for Op in OpList:
            assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        self.OpList = OpList
        
    @staticmethod
    def create(OpList : list):
        return RoseBlock(OpList)

    def getOps(self):
        return self.OpList

    def addOp(self, Op):
        assert(isinstance(Op, RoseOperation) 
            or isinstance(Op, RoseFunctionCall))
        self.OpList.append(Op)

    def print(self):
        for Op in self.OpList:
            Op.print()


