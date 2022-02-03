
from RoseType import RoseType


FloatTy = RoseType.getFloatTy()
FloatTyBitwidth = FloatTy.getBitwidth()

DoubleTy = RoseType.getDoubleTy()
DoubleTyBitwidth = DoubleTy.getBitwidth()


# Define types used in x86 pseudocodes
x86Types = {
    '_m512i': RoseType.getBitVectorTy(512),
    '__m512i': RoseType.getBitVectorTy(512),
    '__m256i': RoseType.getBitVectorTy(256),
    '__m128i': RoseType.getBitVectorTy(128),
    '__m64': RoseType.getBitVectorTy(64),

    # single precision floats
    '__m512': RoseType.getVectorTy(FloatTy, 512 / FloatTyBitwidth),
    '__m256': RoseType.getVectorTy(FloatTy, 256 / FloatTyBitwidth),
    '__m128': RoseType.getVectorTy(FloatTy, 128 / FloatTyBitwidth),
    '_m512': RoseType.getVectorTy(FloatTy, 512 / FloatTyBitwidth),
    '_m256': RoseType.getVectorTy(FloatTy, 256 / FloatTyBitwidth),
    '_m128': RoseType.getVectorTy(FloatTy, 128 / FloatTyBitwidth),

    # double precision floats
    '__m512d': RoseType.getVectorTy(DoubleTy, 512 / DoubleTyBitwidth),
    '__m256d': RoseType.getVectorTy(DoubleTy, 256 / DoubleTyBitwidth),
    '__m128d': RoseType.getVectorTy(DoubleTy, 128 / DoubleTyBitwidth),
    '_m512d': RoseType.getVectorTy(DoubleTy, 512 / DoubleTyBitwidth),
    '_m256d': RoseType.getVectorTy(DoubleTy, 256 / DoubleTyBitwidth),
    '_m128d': RoseType.getVectorTy(DoubleTy, 128 / DoubleTyBitwidth),

    # masks
    '__mmask8': RoseType.getBitVectorTy(8),
    '__mmask16': RoseType.getBitVectorTy(16),
    '__mmask32': RoseType.getBitVectorTy(32),
    '__mmask64': RoseType.getBitVectorTy(64),

    'float': RoseType.getVectorTy(FloatTy, 32 / FloatTyBitwidth),
    'double': RoseType.getVectorTy(DoubleTy, 64 / DoubleTyBitwidth),
    'int': RoseType.getBitVectorTy(32),
    'char': RoseType.getBitVectorTy(8),
    'short': RoseType.getIntegerTy(16),
    'unsigned short': RoseType.getBitVectorTy(16),
    'const int': RoseType.getBitVectorTy(32),
    'uint': RoseType.getBitVectorTy(32),
    'unsigned int': RoseType.getBitVectorTy(32),
    'unsigned char': RoseType.getBitVectorTy(8),
    'unsigned long': RoseType.getBitVectorTy(64),
    '__int64': RoseType.getBitVectorTy(64),
    '__int32': RoseType.getBitVectorTy(32),
    'unsigned __int32': RoseType.getBitVectorTy(32),
    'unsigned __int64': RoseType.getBitVectorTy(64),
    '_MM_PERM_ENUM': RoseType.getBitVectorTy(8),

    'bit': RoseType.getBitVectorTy(1),
    'byte': RoseType.getBitVectorTy(8),
    'word': RoseType.getBitVectorTy(16),
    'dword': RoseType.getBitVectorTy(32),
    'qword': RoseType.getBitVectorTy(64),
    'm128': RoseType.getBitVectorTy(128),
}

