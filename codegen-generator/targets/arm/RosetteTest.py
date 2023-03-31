from RosetteGen import GenerateRosetteForFunction
from ARMRoseLang import CompileSemantics
from ARMTestCases import *
from ARMRoseCompiler import ARMRoseContext, CompileSemantics
import random
import os



def genData(func):
    esize, elements = func.resolving["esize"], func.resolving["elements"]
    va = [random.getrandbits(esize) for _ in range(elements)]
    vb = [random.getrandbits(esize) for _ in range(elements)]
    return va, vb

def genC(func, va, vb):
    esize = func.resolving["esize"]
    elements = func.resolving["elements"]
    name = func.intrin
    vtype = func.params[0].type
    singletype = vtype.split('x')[0] + "_t"
    rttype = func.rettype
    singlerttype = rttype.split('x')[0] + "_t"
    stra = ", ".join(map(lambda x: f"({singletype})" + str(x), va))
    strb = ", ".join(map(lambda x: f"({singletype})" + str(x), vb))
    vtohex = "vld1" + name[4:]
    hextov = "vst1" + name[4:]
    ccode = f'''
#include <arm_neon.h>
#include <stdio.h>

int main()
{{
    {singletype} dataa[{elements}] = {{{stra}}};
    {singletype} datab[{elements}] = {{{strb}}};
    {vtype} a = {vtohex}(dataa);
    {vtype} b = {vtohex}(datab);
    {rttype} ret = {name}(a, b);
    {singlerttype} datac[{elements}];
    {hextov}(datac, ret);
    for (int i = 0; i < {elements}; i++) {{
        printf("%0{esize // 4}x", (uint16_t)datac[i]);
    }}
    return 0;
}}
'''
    filename = f'rosette_test/{name}.c'
    with open(filename, 'w') as fc:
        fc.write(ccode)
    cmd = f'gcc {filename}; ./a.out'
    result = os.popen(cmd).readlines()
    return result[0]

def rosetteTest(func):
    Function = CompileSemantics(func, ARMRoseContext())
    RosetteCode = GenerateRosetteForFunction(Function, "#lang rosette\n")

    datasize = func.resolving["datasize"]
    nbits = func.resolving["esize"] // 4
    for i in range(10):
        va, vb = genData(func)
        hexa = ''.join(list(map(lambda x: '0' * (nbits - len(hex(x)[2:])) + hex(x)[2:], va)))
        hexb = ''.join(list(map(lambda x: '0' * (nbits - len(hex(x)[2:])) + hex(x)[2:], vb)))
        returnVal = genC(func, va, vb)
        RosetteCode += f"(define a{i} (bv #x{hexa} {datasize}))\n"
        RosetteCode += f"(define b{i} (bv #x{hexb} {datasize}))\n"
        RosetteCode += f"(assert (eq? ({func.intrin} a{i} b{i}) (bv #x{returnVal} {datasize})))\n"

    with open(f'rosette_test/{func.intrin}.rkt', 'w') as f:
        f.write(RosetteCode)

if __name__ == "__main__":
    # rosetteTest(vaddq_s16())
    rosetteTest(vsubq_s16())
