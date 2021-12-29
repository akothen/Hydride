from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
import RoseAbstractions

# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock):
        if ParentBlock != None:
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        # Sanity check to see that the operand list is complete
        assert(Opcode.inputsAreValid(OperandList))
        self.Opcode = Opcode
        self.OperandList = OperandList
        # The result of an operation is a RoseValue
        super().__init__(Name, Opcode.getOutputType(OperandList))
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = None):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert(Index < self.len(self.OperandList))
        self.OperandList[Index] = Operand
    
    def setParentBlock(self, Block):
        self.ParentBlock = Block

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.Opcode)
        for Operand in self.OperandList:
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)
  

