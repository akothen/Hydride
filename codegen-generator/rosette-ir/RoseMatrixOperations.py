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
    
    def getRowIndexPos(self):
        return 1
    
    def getBitwidthPos(self):
        return 2
    
    def isIndexingMtxOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented


class RoseMatrixInsertRowOp(RoseMatrixOp):
    def __init__(self, InsertVal: RoseValue, Tile: RoseValue, Idx: RoseValue, ParentBlock):
        inputs = [InsertVal, Tile, Idx]
        super().__init__(RoseOpcode.mtxinsertrow, "", inputs, ParentBlock)

    @staticmethod
    def create(InsertVal: RoseValue, Tile: RoseValue, Idx: RoseValue, ParentBlock=RoseUndefRegion()):
        return RoseMatrixInsertRowOp(InsertVal, Tile, Idx, ParentBlock)

    def getInsertValue(self):
        return self.getOperand(0)

    def getTile(self):
        return self.getOperand(1)

    def getRowIndex(self):
        return self.getOperand(2)
    
    def getRowIndexPos(self):
        return 2

    def getType(self):
        return self.getTile().getType()

    def isIndexingMtxOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented


class RoseMatrixInsertRowsOp(RoseMatrixOp):
    def __init__(self, InsertVal: RoseValue, Tile: RoseValue, RowIdx1: RoseValue, \
                    RowIdx2 : RoseValue, ParentBlock):
        inputs = [InsertVal, Tile, RowIdx1, RowIdx2]
        super().__init__(RoseOpcode.mtxinsertrows, "", inputs, ParentBlock)

    @staticmethod
    def create(InsertVal: RoseValue, Tile: RoseValue, RowIdx1: RoseValue, RowIdx2: RoseValue, \
               ParentBlock=RoseUndefRegion()):
        return RoseMatrixInsertRowsOp(InsertVal, Tile, RowIdx1, RowIdx2, ParentBlock)

    def getInsertValue(self):
        return self.getOperand(0)

    def getTile(self):
        return self.getOperand(1)

    def getLowRowIndexPos(self):
        return 2

    def getHighRowIndexPos(self):
        return 3

    def isIndexingMtxOp(self):
        return True

    def to_rosette(self, NumSpace=0, ReverseIndexing=False):
        NotImplemented

