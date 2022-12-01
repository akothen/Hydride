#############################################################
#
# A dictionary of dimension names for x86.
#
#############################################################


from RoseValues import RoseConstant
from RoseTypes import RoseIntegerType


# Define dimension names used in x86 pseudocodes
x86Dims = {
    # AMX section 3.4 of Arch. Instr. Set Ext. Programming Ref.
    # todo: KUNAL - make these all function params.
    'rows': RoseConstant.create(10, RoseIntegerType.create(8)),  # for testing...
    'colsb': RoseConstant.create(10, RoseIntegerType.create(16)),  # for testing...

    # 'max_rows': RoseConstant.create(16, RoseIntegerType.create(8)),
    # 'max_colsb': RoseConstant.create(512 // 8, RoseIntegerType.create(16)),
}


