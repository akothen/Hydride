#############################################################
#
# A dictionary of types for x86.
#
#############################################################


from RoseTypes import *


FloatTy = RoseFloatType.create()
FloatTyBitwidth = FloatTy.getBitwidth()

DoubleTy = RoseDoubleType.create()
DoubleTyBitwidth = DoubleTy.getBitwidth()


# Define types used in x86 pseudocodes
x86Types = {
    '__tile': RoseMatrixType.create(16, 64, 8),
    'row': RoseBitVectorType.create(64 * 8),

    '_m512i': RoseBitVectorType.create(512),
    '__m512i': RoseBitVectorType.create(512),
    '__m256i': RoseBitVectorType.create(256),
    '__m128i': RoseBitVectorType.create(128),
    '__m64': RoseBitVectorType.create(64),

    # single precision floats
    '__m512': RoseVectorType.create(FloatTy, 512 / FloatTyBitwidth),
    '__m256': RoseVectorType.create(FloatTy, 256 / FloatTyBitwidth),
    '__m128': RoseVectorType.create(FloatTy, 128 / FloatTyBitwidth),
    '_m512': RoseVectorType.create(FloatTy, 512 / FloatTyBitwidth),
    '_m256': RoseVectorType.create(FloatTy, 256 / FloatTyBitwidth),
    '_m128': RoseVectorType.create(FloatTy, 128 / FloatTyBitwidth),

    # double precision floats
    '__m512d': RoseVectorType.create(DoubleTy, 512 / DoubleTyBitwidth),
    '__m256d': RoseVectorType.create(DoubleTy, 256 / DoubleTyBitwidth),
    '__m128d': RoseVectorType.create(DoubleTy, 128 / DoubleTyBitwidth),
    '_m512d': RoseVectorType.create(DoubleTy, 512 / DoubleTyBitwidth),
    '_m256d': RoseVectorType.create(DoubleTy, 256 / DoubleTyBitwidth),
    '_m128d': RoseVectorType.create(DoubleTy, 128 / DoubleTyBitwidth),

    # masks
    '__mmask8': RoseBitVectorType.create(8),
    '__mmask16': RoseBitVectorType.create(16),
    '__mmask32': RoseBitVectorType.create(32),
    '__mmask64': RoseBitVectorType.create(64),

    'float': RoseVectorType.create(FloatTy, 32 / FloatTyBitwidth),
    'double': RoseVectorType.create(DoubleTy, 64 / DoubleTyBitwidth),
    'int': RoseBitVectorType.create(32),
    'char': RoseBitVectorType.create(8),
    'short': RoseBitVectorType.create(16),
    'unsigned short': RoseBitVectorType.create(16),
    'const int': RoseBitVectorType.create(32),
    'uint': RoseBitVectorType.create(32),
    'unsigned int': RoseBitVectorType.create(32),
    'unsigned char': RoseBitVectorType.create(8),
    'unsigned long': RoseBitVectorType.create(64),
    'long long' : RoseBitVectorType.create(64),
    '__int64': RoseBitVectorType.create(64),
    '__int32': RoseBitVectorType.create(32),
    'unsigned __int32': RoseBitVectorType.create(32),
    'unsigned __int64': RoseBitVectorType.create(64),
    '_MM_PERM_ENUM': RoseBitVectorType.create(8),

    'bit': RoseBitVectorType.create(1),
    'byte': RoseBitVectorType.create(8),
    'word': RoseBitVectorType.create(16),
    'dword': RoseBitVectorType.create(32),
    'qword': RoseBitVectorType.create(64),
    'm128': RoseBitVectorType.create(128),

    "SI8": RoseBitVectorType.create(8),
    "SI16": RoseBitVectorType.create(16),
    "SI32": RoseBitVectorType.create(32),
    "SI64": RoseBitVectorType.create(64),
    "UI8": RoseBitVectorType.create(8),
    "UI16":RoseBitVectorType.create(16),
    "UI32": RoseBitVectorType.create(32),
    "UI64": RoseBitVectorType.create(64),
    "FP32": RoseVectorType.create(FloatTy, 32 / FloatTyBitwidth),
    "FP64": RoseVectorType.create(DoubleTy, 512 / DoubleTyBitwidth),
    "M128": RoseBitVectorType.create(128),
    "M256": RoseBitVectorType.create(256),
    "M512": RoseBitVectorType.create(512),
}


