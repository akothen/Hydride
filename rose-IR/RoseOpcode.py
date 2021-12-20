from enum import Enum, auto
from RoseType import RoseType
from RoseValue import RoseValue

# List of all operations that
# involve bitvectors.
class RoseOpcode(Enum):
    bvadd = auto()
    bvsub = auto()
    bvmul = auto()
    bvsdiv = auto()
    bvudiv = auto()
    bvsrem = auto()
    bvurem = auto()
    bvsmod = auto()
    bvsmin = auto()
    bvumin = auto()
    bvsmax = auto()
    bvumax = auto()
    bveq = auto()
    bvslt = auto()
    bvult = auto()
    bvsle = auto()
    bvule = auto()
    bvsgt = auto()
    bvugt = auto()
    bvsge = auto()
    bvuge = auto()
    bvnot = auto()
    bvand = auto()
    bvor = auto()
    bvxor = auto()
    bvshl = auto()
    bvlshr = auto()
    bvashr = auto()
    bvneg = auto()
    bvzero = auto()
    bvrol = auto()
    bvror = auto()
    bit = auto()
    lsb = auto()
    msb = auto()
    bvadd1 = auto()
    bvsub1 = auto()
    rotateleft = auto()
    rotateright = auto()
    concat = auto()
    bvextract = auto()
    bvsignextract = auto()
    bvzeroextract = auto()
    bvlowextextract = auto()
    bvsignlowextract = auto()
    bvzerolowextract = auto()

    def __str__(self):
        return self.name
    
    def getBVOpInputs(self, Inputs : list):
        BVInputs = []
        for Input in Inputs:
            if Input.getType().isBitVectorTy():
                BVInputs.append(Input)
        return BVInputs

    def getOutputType(self, Inputs : list): 
        assert(len(Inputs) >= 1)
        if self.name == self.bvzero \
        or self.name == self.bit \
        or self.name == self.lsb \
        or self.name == self.msb:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(1)
        if self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1 \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) > 1)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(BVInputs[0].getType().getBitwidth())
        if self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge:
            BVInputs = self.getNumBVOpInputs(Inputs)
            assert(len(BVInputs) == 2)
            return RoseType.getBitVectorTy(1)
        return None

    def inputsAreValid(self, Inputs : list): 
        if self.isValidNumInputs(len(Inputs)) == False:
            return False
        if self.name == self.bvzero \
        or self.name == self.bit \
        or self.name == self.lsb \
        or self.name == self.msb \
        or self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1 \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) == 1:
                return True
            else:
                return False
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) > 1:
                return True
            else:
                return False
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror \
        or self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge:
            BVInputs = self.getNumBVOpInputs(Inputs)
            if len(BVInputs) == 2:
                return True
            else:
                return False
        return None
    
    def isValidNumInputs(self, NumInputs : int):
        if self.name == self.bvzero \
        or self.name == self.lsb \
        or self.name == self.msb \
        or self.name == self.bvneg \
        or self.name == self.bvnot \
        or self.name == self.bvadd1 \
        or self.name == self.bvsub1:
            return (NumInputs == 1)
        if self.name == self.bvadd \
        or self.name == self.bvsub \
        or self.name == self.bvmul \
        or self. name == self.bvor \
        or self. name == self.bvxor \
        or self. name == self.bvand \
        or self. name == self.bvshl \
        or self. name == self.bvlshr \
        or self. name == self.bvashr \
        or self. name == self.bvsmin \
        or self. name == self.bvumin \
        or self. name == self.bvsmax \
        or self. name == self.bvumax:
            return (NumInputs > 1)
        if self.name == self.bvsdiv \
        or self.name == self.bvudiv \
        or self.name == self.bvsrem \
        or self.name == self.bvurem \
        or self.name == self.bvsmod \
        or self.name == self.bvrol \
        or self.name == self.bvror \
        or self.name == self.bit \
        or self.name == self.bveq \
        or self.name == self.bvslt \
        or self.name == self.bvult \
        or self.name == self.bvsle \
        or self.name == self.bvule \
        or self.name == self.bvsgt \
        or self.name == self.bvugt \
        or self.name == self.bvsge \
        or self.name == self.bvuge \
        or self.name == self.rotateleft \
        or self.name == self.rotateright:
            return (NumInputs == 2)
        return None
  

# Let's see how this could be useful
class HighOrderFunctions(Enum):
    apply = auto()
    map = auto()
    zip = auto()

    def __str__(self):
        return self.name
