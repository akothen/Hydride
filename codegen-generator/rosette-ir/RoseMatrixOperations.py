from RoseValue import RoseValue
from RoseOpcode import RoseOpcode
from RoseTypes import *
from RoseAbstractions import RoseUndefRegion, RoseBlock
from RoseValues import *
from RoseBitVectorOperation import RoseBitVectorOp

# `mtxextractrow <tile> <idx>`
class RoseMatrixExtractRowOp(RoseBitVectorOp):
    def __init__(self, name: str, tile: RoseValue, idx: RoseValue, parentblock):
        inputs = [tile, idx]
        assert RoseOpcode.mtxextractrow.inputsAreValid(inputs)
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
        assert RoseOpcode.mtxextractrow.inputsAreValid(inputs)
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
