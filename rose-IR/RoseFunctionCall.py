
from RoseValue import RoseValue
import RoseAbstractions

# This represents internal and external function calls
# This class is for operations whose opcodes are not known ahead of time.
class RoseFunctionCall(RoseValue):
    def __init__(self, Callee, Name : str, OperandList : list, ParentBlock):
        assert isinstance(Callee, RoseAbstractions.RoseFunction)
        if ParentBlock != None:
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        # Sanity check to see that the operand list is complete
        #assert(Opcode.inputsAreValid(OperandList))
        self.Callee = Callee
        self.OperandList = OperandList
        # The result of an operation is a RoseValue
        super().__init__(Name, Callee.getReturnTy())
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Callee, Name : str, OperandList : list, ParentBlock = None):
        return RoseFunctionCall(Callee, Name, OperandList, ParentBlock)
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert(Index < self.len(self.OperandList))
        self.OperandList[Index] = Operand

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.Opcode)
        for Operand in self.OperandList:
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)
    
 
