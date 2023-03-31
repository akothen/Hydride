from RosetteGen import GenerateRosetteForFunction
from ARMRoseLang import CompileSemantics
from ARMTestCases import *
from ARMRoseCompiler import ARMRoseContext, CompileSemantics


def rosetteTest(func):
    Function = CompileSemantics(func, ARMRoseContext())
    RosetteCode = GenerateRosetteForFunction(Function, "")
    with open(f'rosette_test/{func.intrin}', 'w') as f:
        f.write(RosetteCode)
    print(RosetteCode)