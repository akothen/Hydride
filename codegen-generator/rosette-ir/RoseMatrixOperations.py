################################################################
#
# This file contains matrix operations modeled as bitvector ops.
#
#################################################################


from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseValues import *
from RoseBitVectorOperation import RoseBitVectorOp

# `mtxextractrow <tile> <idx>`
# originally: `class RoseMatrixInsertRowOp(RoseBitVectorOp):`
# however:    `assert len(Opcode.getBVOpInputs(Operands)) > 0`
class RoseMatrixExtractRowOp(RoseOperation):
    def __init__(self, name: str, tile: RoseValue, idx: RoseValue, parentblock):
        inputs = [tile, idx]
        super().__init__(RoseOpcode.mtxextractrow, name, inputs, parentblock)

    @staticmethod
    def create(name: str, tile: RoseValue, idx: RoseValue, parentblock=RoseUndefRegion()):
        return RoseMatrixExtractRowOp(name, tile, idx, parentblock)

    def getTile(self):
        return self.getOperand(0)

    def getRowIndex(self):
        return self.getOperand(1)

    def getOutputBitwidth(self):
        return RoseOpcode.mtxextractrow.getOutputType(self.Operands).getBitwidth()

    def isIndexingBVOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented


# `mtxinsertrow <elements> <tile> <idx>`
class RoseMatrixInsertRowOp(RoseBitVectorOp):
    def __init__(self, elements: RoseValue, tile: RoseValue, idx: RoseValue, parentblock):
        inputs = [elements, tile, idx]
        super().__init__(RoseOpcode.mtxinsertrow, "", inputs, parentblock)

    @staticmethod
    def create(elements: RoseValue, tile: RoseValue, idx: RoseValue, parentblock=RoseUndefRegion()):
        return RoseMatrixInsertRowOp(elements, tile, idx, parentblock)

    def getElements(self):
        return self.getOperand(0)

    def getTile(self):
        return self.getOperand(1)

    def getRowIndex(self):
        return self.getOperand(2)

    def isIndexingBVOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented


# `mtxinsertrow <elements> <tile> <idx>`
class RoseMatrixInsertElementOp(RoseBitVectorOp):
    def __init__(self, element: RoseValue, tile: RoseValue, r1: RoseValue, c1: RoseValue, r2: RoseValue, c2: RoseValue, parentblock):
        inputs = [element, tile, r1, c1, r2, c2]
        super().__init__(RoseOpcode.mtxinsertel, "", inputs, parentblock)

    @staticmethod
    def create(element: RoseValue, tile: RoseValue, r1: RoseValue, c1: RoseValue, r2: RoseValue, c2: RoseValue, parentblock=RoseUndefRegion()):
        return RoseMatrixInsertElementOp(element, tile, r1, c1, r2, c2, parentblock)

    def getElement(self):
        return self.getOperand(0)

    def getTile(self):
        return self.getOperand(1)

    def getRowRange(self):
        return self.getOperand(2), self.getOperand(4)

    def getColRange(self):
        return self.getOperand(3), self.getOperand(5)

    def isIndexingBVOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented
