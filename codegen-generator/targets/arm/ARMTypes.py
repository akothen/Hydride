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
    "int8x16_t": RoseBitVectorType(128),
    "int16x8_t": RoseBitVectorType(128),
    "int32x4_t": RoseBitVectorType(128),
    "int64x2_t": RoseBitVectorType(128),
    "uint8x16_t": RoseBitVectorType(128),
    "uint16x8_t": RoseBitVectorType(128),
    "uint32x4_t": RoseBitVectorType(128),
    "uint64x2_t": RoseBitVectorType(128),
    "int8x8_t": RoseBitVectorType(64),
    "int16x4_t": RoseBitVectorType(64),
    "int32x2_t": RoseBitVectorType(64),
    "int64x1_t": RoseBitVectorType(64),
    "uint8x8_t": RoseBitVectorType(64),
    "uint16x4_t": RoseBitVectorType(64),
    "uint32x2_t": RoseBitVectorType(64),
    "uint64x1_t": RoseBitVectorType(64),
}
C2ARMType = {
    "8x8": "8B",
    "8x16": "16B",
    "16x4": "4H",
    "16x8": "8H",
    "32x2": "2S",
    "32x4": "4S",
    "64x1": "1D",
    "64x2": "2D",
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
