##################################################################
#
# This files contains the class derived by bitvector ops
# that are comparison ops.
#
##################################################################


from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseBlock
from RoseBitVectorOperation import RoseBitVectorOp


class RoseComparisonBitVectorOp(RoseBitVectorOp):
  def __init__(self, Opcode : RoseOpcode,  Name : str,  Operand1 : RoseValue, \
                      Operand2 : RoseValue, ParentBlock : RoseBlock):
    assert isinstance(Operand1.getType(), RoseBitVectorType)
    assert isinstance(Operand2.getType(), RoseBitVectorType)
    OperandList = [Operand1, Operand2]
    super().__init__(Opcode, Name, OperandList, ParentBlock)

