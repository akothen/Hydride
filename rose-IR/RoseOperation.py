from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseConstants import RoseUndefRegion, RoseUndefValue
import RoseAbstractions 

# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, \
                ParentBlock = RoseUndefRegion()):
        if not isinstance(ParentBlock, RoseUndefRegion):
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        print(OperandList)
        self.Opcode = Opcode
        self.OperandList = OperandList
        self.ParentBlock = ParentBlock
        # The result of an operation is a RoseValue
        super().__init__(Name, Opcode.getOutputType(OperandList))
        # Sanity check to see that the operand list is complete
        self.assertValidationOfInputs()
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = RoseUndefRegion()):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)
    
    # Overridable function
    def assertValidationOfInputs(self):
        assert self.getOpcode().inputsAreValid(self.getOperands())
    
    def __eq__(self, Other):
        if isinstance(Other, RoseUndefValue):
            return False
        assert isinstance(Other, RoseOperation)
        return self.Opcode == Other.Opcode and self.OperandList == Other.OperandList \
           and self.ParentBlock != Other.ParentBlock and super().__eq__(Other)

    def __ne__(self, Other):
        if isinstance(Other, RoseUndefValue):
            return True
        assert isinstance(Other, RoseOperation)
        return self.Opcode != Other.Opcode or self.OperandList != Other.OperandList \
            or self.ParentBlock != Other.ParentBlock or super().__ne__(Other)

    def getOpcode(self):
        return self.Opcode
    
    def getOperands(self):
        return self.OperandList
    
    def getParent(self):
        return self.ParentBlock
    
    def getOperand(self, Index):
        assert Index < self.len(self.OperandList)
        return self.OperandList[Index]
    
    def setOperand(self, Index, Operand):
        assert Index < self.len(self.OperandList)
        self.OperandList[Index] = Operand
    
    def setParent(self, Block):
        assert isinstance(Block, RoseAbstractions.RoseBlock)
        self.ParentBlock = Block

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.getOpcode())
        for Operand in self.getOperands():
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)
  

