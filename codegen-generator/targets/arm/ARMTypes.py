from collections import namedtuple
from RoseTypes import *


HalfFloatTy = RoseHalfFloatType.create()
HalfFloatTyBitwidth = HalfFloatTy.getBitwidth()

FloatTy = RoseFloatType.create()
FloatTyBitwidth = FloatTy.getBitwidth()

DoubleTy = RoseDoubleType.create()
DoubleTyBitwidth = DoubleTy.getBitwidth()


# Define types used in ARM pseudocodes
ARMTypes = {
    "float32x2_t": RoseBitVectorType(64),
    "int16x8_t": RoseBitVectorType(128),
}

ARMSema = namedtuple('ARMSema', [
    'intrin', 'inst', 'params',
    'spec', 'rettype', 'ret_is_signed',
    'inst_form',
    'extensions',
    'imm_width',
    'xed',
    'elem_type',
    'preparation',
    'resolving',
])
Parameter = namedtuple(
    'Parameter', ['name', 'type', 'is_signed', 'is_imm', 'is_mask'])
