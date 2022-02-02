
from RoseType import RoseType
from RoseHexCommon import *



# Define types used in HVX pseudocode
HexTypes = {
    'v': RoseType.getBitVectorTy(HVXVectorWidth / 2),
    'w': RoseType.getBitVectorTy(32),
    'uw': RoseType.getBitVectorTy(32),
    'h': RoseType.getBitVectorTy(16),
    'uh': RoseType.getBitVectorTy(16),
    'b': RoseType.getBitVectorTy(8),
    'ub': RoseType.getBitVectorTy(8),
}



