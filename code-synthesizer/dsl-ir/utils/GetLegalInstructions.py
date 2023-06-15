from RoseValidityChecker import RoseISAValidityChecker
from common.DSLParser import parse_dict
from LatestSemantics import semantcs
import json
import sys
import subprocess as sb
import os

dsl_list = parse_dict(semantcs)

Checker = RoseISAValidityChecker()

legality_map = {}


items = range(len(dsl_list))


def task(i):
    dsl_inst = dsl_list[i]
    for ctx in dsl_inst.contexts:
        try:
            is_legal = Checker.checkValidityOnTarget(ctx.name, "x86")
            if is_legal:
                legality_map[ctx.name] = 1
            else:
                legality_map[ctx.name] = 0

        except:
            legality_map[ctx.name] = 0
        finally:
            print(ctx.name, "valid?", legality_map[ctx.name])


for i in items:
    task(i)


print("Completed all tasks!")

with open("legal_insts.py", "w+") as WriteFile:
    WriteFile.write("legal_map=")
    WriteFile.write(json.dumps(legality_map, indent=4))
