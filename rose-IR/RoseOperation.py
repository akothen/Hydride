from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseConstants import RoseUndefRegion
import RoseAbstractions 
#from RoseAbstractions import RoseBlock

# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock):
        if not isinstance(ParentBlock, RoseUndefRegion):
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        self.Opcode = Opcode
        self.OperandList = OperandList
        print(OperandList)
        # Sanity check to see that the operand list is complete
        self.assertValidationOfInputs()
        # The result of an operation is a RoseValue
        super().__init__(Name, self.getType())
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = RoseUndefRegion()):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)
    
    def assertValidationOfInputs(self):
        assert(self.Opcode.inputsAreValid(self.OperandList))
    
    def getOperands(self):
        return self.OperandList
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def getType(self):
        return self.Opcode.getOutputType(self.OperandList)
    
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
  

