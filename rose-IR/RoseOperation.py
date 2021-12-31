from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseConstants import RoseUndefRegion
import RoseAbstractions 

# An operation in Rosette
# An operation is either an instruction.
class RoseOperation(RoseValue):
    def __init__(self, Opcode : RoseOpcode, Name : str, OperandList : list, \
                ParentBlock = RoseUndefRegion(), SubClassData = None):
        if not isinstance(ParentBlock, RoseUndefRegion):
            assert isinstance(ParentBlock, RoseAbstractions.RoseBlock)
        print(OperandList)
        OpSubClassData = {}
        OpSubClassData["opcode"] = Opcode
        OpSubClassData["operands"] = OperandList
        OpSubClassData["parent"] = ParentBlock
        OpSubClassData["subclassdata"] = SubClassData
        # The result of an operation is a RoseValue
        Type = Opcode.getOutputType(OperandList)
        RoseValue.__init__(self, Name, Type, OpSubClassData)
        # Sanity check to see that the operand list is complete
        self.assertValidationOfInputs()
    
    @staticmethod
    def create(Opcode : RoseOpcode, Name : str, OperandList : list, ParentBlock = RoseUndefRegion()):
        return RoseOperation(Opcode, Name, OperandList, ParentBlock)
    
    def assertValidationOfInputs(self):
        assert self.getOpcode().inputsAreValid(self.getOperands())

    def getOpcode(self):
        return self.getSubClassData()["opcode"]
    
    def getOperands(self):
        return self.getSubClassData()["operands"]
    
    def getParent(self):
        return self.getSubClassData()["parent"]
    
    def getOpSubClassData(self):
        return self.getSubClassData()["subclassdata"]
    
    def getOperand(self, Index):
        OperandList = self.getOperands()
        assert Index < self.len(OperandList)
        return OperandList[Index]
    
    def setOperand(self, Index, Operand):
        OperandList = self.getOperands()
        assert Index < self.len(OperandList)
        OperandList[Index] = Operand
        self.setSubClassData(OperandList, "operands")
    
    def setParent(self, Block):
        assert isinstance(Block, RoseAbstractions.RoseBlock)
        self.setSubClassData(Block, "operands")

    def print(self):
        Op = "(define (" + self.getName() + " (" + str(self.getOpcode())
        for Operand in self.getOperands():
            Op += (" " + Operand.getName())
        Op += ")"
        print(Op)
  

