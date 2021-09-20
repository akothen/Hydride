from dsl_inst_def import DSLList, BitVectorArg, LengthArg, PrecisionArg
from gen_dsl import DSLGen 




Inputs = [BitVectorArg] * 3
Outputs = [BitVectorArg] * 1

InputBitWidth = 128

print("*"*5, "Generating DSL calls for",3,"Input symbolic bitvectors of length",
        InputBitWidth, "*"*5,"\n")

print("*"*25)
print("DSL instructions:\n")
[print("\t"+dsl_inst.str()) for dsl_inst in DSLList]
print("")
print("*"*25)

DSLGenerator = DSLGen(Inputs, Outputs, InputBitWidth, DSLList)

DSLGenerator.generate()
