#############################################################
#
# A dictionary of types for Hexagon instructions.
#
#############################################################


from RoseTypes import *

from RoseHexCommon import *



# Define types used in HVX pseudocode
HexTypes = {
    'v': RoseBitVectorType.create(1024),
    'w': RoseBitVectorType.create(32),
    'uw': RoseBitVectorType.create(32),
    'h': RoseBitVectorType.create(16),
    'uh': RoseBitVectorType.create(16),
    'b': RoseBitVectorType.create(8),
    'ub': RoseBitVectorType.create(8),
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


