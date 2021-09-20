from dsl_class import *

BitVectorArg = DSLArg("bvArg", ArgType.BitVectorSymbolic)
LengthArg = DSLArg("bvLen", ArgType.IntConst, is_length=True)
PrecisionArg = DSLArg("bvPrecision", ArgType.IntConst , is_precision = True)



vector_mac = DSLInst("vector-mac", [BitVectorArg, BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])

vector_add = DSLInst("vector-add", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


vector_sub = DSLInst("vector-sub", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


vector_mul = DSLInst("vector-mul", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


print("Hello World")
