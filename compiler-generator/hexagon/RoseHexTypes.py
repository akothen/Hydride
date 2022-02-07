
from RoseType import RoseType

from RoseHexCommon import *



# Define types used in HVX pseudocode
HexTypes = {
    'v': RoseType.getBitVectorTy(HVXVectorWidth >> 1),
    'w': RoseType.getBitVectorTy(32),
    'uw': RoseType.getBitVectorTy(32),
    'h': RoseType.getBitVectorTy(16),
    'uh': RoseType.getBitVectorTy(16),
    'b': RoseType.getBitVectorTy(8),
    'ub': RoseType.getBitVectorTy(8),
}


HexTypeSignedness = {
    'v': 1,
    'w': 1,
    'uw': 0,
    'h': 1,
    'uh': 0,
    'b': 1,
    'ub': 0,
}


