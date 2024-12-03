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
from RoseMatrixOperation import RoseMatrixOp


class RoseMatrixExtractRowOp(RoseMatrixOp):
    def __init__(self, Name: str, Tile: RoseValue, Idx: RoseValue, \
                    NumBits : RoseValue, ParentBlock : RoseBlock):
        Operands = [Tile, Idx, NumBits]
        super().__init__(RoseOpcode.mtxextractrow, Name, Operands, ParentBlock)

    @staticmethod
    def create(name: str, Tile: RoseValue, Idx: RoseValue, NumBits : RoseValue, \
                ParentBlock=RoseUndefRegion()):
        return RoseMatrixExtractRowOp(name, Tile, Idx, NumBits, ParentBlock)

    def getTile(self):
        return self.getOperand(0)

    def getRowIndex(self):
        return self.getOperand(1)

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented


class RoseMatrixInsertRowOp(RoseMatrixOp):
    def __init__(self, Elements: RoseValue, Tile: RoseValue, Idx: RoseValue, ParentBlock):
        inputs = [Elements, Tile, Idx]
        super().__init__(RoseOpcode.mtxinsertrow, "", inputs, ParentBlock)

    @staticmethod
    def create(Elements: RoseValue, Tile: RoseValue, Idx: RoseValue, ParentBlock=RoseUndefRegion()):
        return RoseMatrixInsertRowOp(Elements, Tile, Idx, ParentBlock)

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


class RoseMatrixInsertElementOp(RoseMatrixOp):
    def __init__(self, element: RoseValue, Tile: RoseValue, r1: RoseValue, c1: RoseValue, r2: RoseValue, c2: RoseValue, ParentBlock):
        inputs = [element, Tile, r1, c1, r2, c2]
        super().__init__(RoseOpcode.mtxinsertel, "", inputs, ParentBlock)

    @staticmethod
    def create(element: RoseValue, Tile: RoseValue, r1: RoseValue, c1: RoseValue, r2: RoseValue, c2: RoseValue, ParentBlock=RoseUndefRegion()):
        return RoseMatrixInsertElementOp(element, Tile, r1, c1, r2, c2, ParentBlock)

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
