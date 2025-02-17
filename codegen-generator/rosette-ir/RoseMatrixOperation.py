from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseValues import *


# An operation in Rosette
# An operation is either an instruction.
class RoseMatrixOp(RoseOperation):
    def __init__(self, Opcode: RoseOpcode, Name: str, Operands: list,
                 ParentBlock=RoseAbstractions.RoseUndefRegion()):
        # Just invoke the constructor for the base class
        super().__init__(Opcode, Name, Operands, ParentBlock)

    def getOutputBitwidth(self):
        return RoseOpcode.mtxextractrow.getOutputType(self.Operands).getBitwidth()

    def isIndexingBVOp(self):
        return True

    # Nothing to solve for
    # bitvector operations
    def solve(self):
        return None

    # Nothing to simplify for
    # bitvector operations
    def simplify(self):
        return RoseUndefValue()
