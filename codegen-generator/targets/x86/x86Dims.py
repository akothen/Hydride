#############################################################
#
# A dictionary of dimension names for x86.
#
#############################################################


from RoseValues import RoseConstant
from RoseTypes import RoseIntegerType


# Define dimension names used in x86 pseudocodes
x86Dims = {
    'rows': RoseConstant.create(16, RoseIntegerType.create(32)),
    'colsb': RoseConstant.create(512 / 8, RoseIntegerType.create(32)),
}


