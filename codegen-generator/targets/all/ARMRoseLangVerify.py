from os import listdir, remove
from RoseCodeGenerator import RoseCodeGenerator
from RoseAbstractions import RoseFunction
import ARMRoseLang
from RosetteGen import GenerateRosetteForFunction
import sys
from RoseToolsUtils import *


def EmitCode(F1: RoseFunction, F2: RoseFunction):
    assert F1.Name == F2.Name

    AllRosetteCode = """#lang rosette
(require "../bvops.rkt")
"""
    Fname = F1.Name
    F1.Name = F1.Name+".check"
    RosetteCode1 = GenerateRosetteForFunction(F1, "")
    RosetteCode2 = GenerateRosetteForFunction(F2, "")
    AllRosetteCode += RosetteCode1+RosetteCode2
    As = ""
    NBit = 0
    for Arg in F1.getArgs():
        Bitwidth = Arg.getType().getBitwidth()
        Aname = Arg.getName()
        if Aname == "n" and "_n_" in Fname:
            NBit = Bitwidth
            continue
        AllRosetteCode += "(define-symbolic {} (bitvector {}))\n".format(Aname,
                                                                         str(Bitwidth))
        As += Aname + " "
    if "_n_" in Fname and NBit:
        N = int(Fname.split(".")[0].split("_")[-1][1:])
        for n in range(1, N):
            AAs = As+f"(bv {n} {NBit}) "
            AllRosetteCode += f"(verify (assert (equal? ({Fname}.check {AAs}) ({Fname} {AAs}))))\n"
    else:
        AllRosetteCode += f"(verify (assert (equal? ({Fname}.check {As}) ({Fname} {As}))))\n"

    with open(f'rosette_test/verify/{Fname}.rkt', 'w') as f:
        f.write(AllRosetteCode)


def Emit():
    CodeGenerator = RoseCodeGenerator(Target="ARM")
    ARMRoseLang.DEBUG = False
    F_ref = ARMRoseLang.Compile()
    ARMRoseLang.DEBUG = True
    F_check = CodeGenerator.codeGen(
        JustGenRosette=False, ExtractConstants=False)
    for ref, check in zip(F_ref, F_check):
        EmitCode(check.getLatestFunction(), ref.getLatestFunction())


def VerifyRacket(fname):
    if any(i in fname for i in ["abs", "abd", "aba", "qd", "qrd"]):
        return
    try:
        print(f"Verifying: {fname}")
        p = subprocess.Popen(
            ["racket", f"rosette_test/verify/{fname}"], stdout=subprocess.PIPE)
        Output, Err = p.communicate()
        Output = Output.decode('utf-8')
        # Err = Err.decode('utf-8', "ignore")
        # print(f"{Output =}")
        # print(f"{Err =}")
        if "(model" in Output:
            print(f"Failed: {fname}")
            print(Output)
            return False
        if not Err:
            remove(f"rosette_test/verify/{fname}")
            return True
            # Out = Output.split("\n")
            # # print("Out[0]:")
            # # print(Out[0])
            # # print("Out[1]:")
            # # print(Out[1])
            # if "unsat" in Out[0] or "unsat" in Out[1]:
            #     # print(f"Verified: {fname}")
            #     return True
        print(f"Failed: {fname}")
        print(Output)
        # print("Err:")
        # print(Err)
    except IOError:
        print("Error making: {}.rkt".format(fname))
        print(f"Failed: {fname}")


def Verify():
    from multiprocessing import Pool
    tasks = listdir("rosette_test/verify/")
    # tasks = ["vtrn1_s16.rkt"]
    # print(tasks)
    Pool(6).map(VerifyRacket, tasks)


if __name__ == "__main__":
    if "--emit" in sys.argv:
        Emit()
    else:
        Verify()
