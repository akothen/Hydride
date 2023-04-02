from asl.ARMParser import get_parser
from asl.ARMAST import Instruction
from ARMIntrinsics import *
from ARMTypes import *
from ARMAST import *
import json

with open("intr.json", 'r') as fi:
    I = json.load(fi)
with open("asl/arm_instrs.asl") as f:
    data = f.read()
parser = get_parser()
Instrs: List[Instruction] = parser.parse(data)


def genByEncodingFields(enc: str):
    field = EncodingFields[enc]
    op = None
    encoding = None
    for i in Instrs:
        for j in i.instEncodings:
            if j.encName == enc:
                io = i.instExecute
                encoding = j
                break
    assert op is not None
    print(encoding)


if __name__ == "__main__":
    genByEncodingFields(
        "aarch64_vector_arithmetic_binary_uniform_add_wrapping_single_simd")
