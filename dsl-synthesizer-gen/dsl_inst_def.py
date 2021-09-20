from dsl_class import *

BitVectorArg = DSLArg("bvArg", ArgType.BitVectorSymbolic)
LengthArg = DSLArg("bvLen", ArgType.LengthConst)
PrecisionArg = DSLArg("bvPrecision", ArgType.PrecisionConst)



vector_mac = DSLInst("vector-mac", [BitVectorArg, BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])

vector_add = DSLInst("vector-add", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


vector_sub = DSLInst("vector-sub", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


vector_mul = DSLInst("vector-mul", [BitVectorArg, BitVectorArg,
    LengthArg, PrecisionArg])


DSLList = [vector_mac, vector_add, vector_sub, vector_mul]

