import re
from collections import namedtuple
from RoseTypes import *


# HalfFloatTy = RoseHalfFloatType.create()
# HalfFloatTyBitwidth = HalfFloatTy.getBitwidth()

FloatTy = RoseFloatType.create()
FloatTyBitwidth = FloatTy.getBitwidth()

DoubleTy = RoseDoubleType.create()
DoubleTyBitwidth = DoubleTy.getBitwidth()


# Define types used in ARM pseudocodes
ARMTypes = {
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
    "int8_t": RoseBitVectorType(8),
    "int16_t": RoseBitVectorType(16),
    "int32_t": RoseBitVectorType(32),
    "int64_t": RoseBitVectorType(64),
    "uint8_t": RoseBitVectorType(8),
    "uint16_t": RoseBitVectorType(16),
    "uint32_t": RoseBitVectorType(32),
    "uint64_t": RoseBitVectorType(64),
}
