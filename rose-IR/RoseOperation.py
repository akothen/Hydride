from RoseType import RoseType
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode

# An operation in Rosette
# An operation is either an instruction.
# TODO: complete the definition
class RoseOperation:
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock):
        # Sanity check to see that the operand list is complete
        assert(Opcode.inputsAreValid(OperandList))
        self.Opcode = Opcode
        self.OperandList = OperandList
        self.Value = RoseValue(Name, Opcode.getOutputType(OperandList))
        self.ParentBlock = ParentBlock
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = None):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)

    def getName(self):
        return self.Value.getName()
    
    def getType(self):
        return self.Value.getType()

    def setName(self, Name):
        self.Value = RoseValue(Name, self.Value.getType())
    
    def getOperand(self, Index):
        assert(Index < self.len(self.OperandList))
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert(Index < self.len(self.OperandList))
        self.OperandList[Index] = Operand

    def print(self):
        Op = "(define (" + self.Value.getName() + " (" + str(self.Opcode)
        for Operand in self.OperandList:
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)


        
