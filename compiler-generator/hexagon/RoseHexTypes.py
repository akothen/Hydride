
from RoseType import RoseType



# Define types used in Hexagon pseudocode
HexTypes = {
    'w': RoseType.getBitVectorTy(32),
    'uw': RoseType.getBitVectorTy(32),
    'h': RoseType.getBitVectorTy(16),
    'uh': RoseType.getBitVectorTy(16),
    'b': RoseType.getBitVectorTy(8),
    'ub': RoseType.getBitVectorTy(8),
}
