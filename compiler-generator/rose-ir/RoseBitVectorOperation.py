
from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseType import RoseType
from RoseValues import RoseOperation, RoseUndefValue
import RoseAbstractions 


# An operation in Rosette
# An operation is either an instruction.
class RoseBitVectorOp(RoseOperation):
  def __init__(self, Opcode : RoseOpcode, Name : str, Operands : list, \
              ParentBlock = RoseAbstractions.RoseUndefRegion()):
    # This is a bitvector operation -- at least one of the 
    # operands must be a bitvector.
    assert Opcode.isBitVectorOpcode()
    assert len(Opcode.getBVOpInputs(Operands)) > 0

    # Just invoke the constructor for the base class
    super().__init__(Opcode, Name, Operands, ParentBlock)

  def getBitVectorOperands(self):
    Operands = self.getOperands()
    BVOperands = []
    for Operand in Operands:
      if Operand.getType().isBitVectorTy():
        BVOperands.append(Operand)
    return BVOperands
  
  def getNonBVOperands(self):
    Operands = self.getOperands()
    NonBVOperands = []
    for Operand in Operands:
      if not Operand.getType().isBitVectorTy():
        NonBVOperands.append(Operand)
    return NonBVOperands
  
  def getNumNonBVOperands(self):
    return len(self.getNonBVOperands())

  def isIndexingBVOp(self):
    # Generally this is false except a few
    # exceptions
    return False
  
  # It is used by getOutputBitwidth
  def getBitwidthHandled(self):
    return 0

  def getOutputBitwidth(self):
    Type = self.getType()
    print("OUTPUT TYPE:")
    print(Type)
    Type.print()
    if Type.isVoidTy():
      return self.getBitwidthHandled()
    if Type.isBitVectorTy():
      return Type.getBitwidth()
    assert Type.isBooleanTy()
    return 1

  # Nothing to solve for 
  # bitvector operations
  def solve(self):
    return None

  # Nothing to simplify for 
  # bitvector operations
  def simplify(self):
    return RoseUndefValue()

