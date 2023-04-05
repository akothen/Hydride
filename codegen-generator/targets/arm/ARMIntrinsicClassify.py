
from ARMEncodingFields import EncodingFields
from ARMAST import Flag
from ARMTypes import *
import json
from typing import Set, List, Dict, Tuple

# v[p][q][r]name[u][n][q][x][_high][_lane | laneq][_n][_result]_type
# https://developer.arm.com/documentation/102467/0200/Program-conventions?lang=en

with open("encodingmap.json", 'r') as fi:
    enc = json.load(fi)
enckeys = enc.keys()
with open("intr.json", 'r') as fi:
    I = json.load(fi)
toI = {i["name"]: InstrDesc(**i) for i in I}


def printParsedName(parsed, full=False):
    start = "v"
    if parsed["pair"]:
        start += "[p]"
    if parsed["sat"]:
        start += "[q]"
    if parsed["round"]:
        start += "[r]"
    start += parsed["base"]
    if parsed["s2u"]:
        start += "[u]"
    if parsed["narrow"]:
        start += "["+parsed["narrow"]+"]"
    if parsed["q"]:
        start += "[q]"
    if parsed["x"]:
        start += "["+parsed["x"]+"]"
    if not full:
        return start
    if parsed["high"]:
        start += "[_"+parsed["high"]+"]"
    if parsed["lane"]:
        start += "[_"+parsed["lane"]+"]"
    if parsed["n"]:
        start += "[_n]"
    if parsed["result"]:
        start += "[_"+parsed["result"]+"]"
    if parsed["type"]:
        start += "_"+parsed["type"]
    return start


def find_basename(names: Set[Tuple[str, str]]):
    namelist = list(names)
    namelist.sort(key=lambda x: len(x[0]))
    # print(namelist)
    firmnames = set()
    result = {}
    # count = {}

    def check_suffix(base, intrin):
        base = base.lower()
        if base in intrin:
            return base
        if base[1:] in intrin:
            return base[1:]
        if base[: -1] in intrin:
            return base[: -1]
        if base[1: -1] in intrin:
            return base[1: -1]
        return None

    for k, iiiii in namelist:
        Intrin = toI[iiiii]
        baseinstruction = Intrin.base_instruction[0]
        suffix_to_check = check_suffix(baseinstruction, k)

        def check_attendance_if_stripped(i, onlyInIntrin=False):
            if suffix_to_check and onlyInIntrin:
                if suffix_to_check not in i:
                    return False
            for j in firmnames:
                if j in i:
                    return True
            return False

        i = k
        assert i.startswith("v")
        i = i[1:]
        f = {
            "pair": False,
            "sat": False,
            "round": False,
            "s2u": False,
            "narrow": "",
            "q": False,
            "x": "",
        }
        if i.endswith("b") or i.endswith("h") or i.endswith("s") or i.endswith("d"):
            if check_attendance_if_stripped(i[:-1], True):
                f["x"] = i[-1]
                i = i[:-1]
        if i.endswith("q"):
            if check_attendance_if_stripped(i[:-1]):
                f["q"] = True
                i = i[:-1]
        if i.endswith("n") or i.endswith("l") or i.endswith("w"):
            if check_attendance_if_stripped(i[:-1]):
                f["narrow"] = i[-1]
                i = i[:-1]
        if i.endswith("u"):
            if check_attendance_if_stripped(i[:-1]):
                f["s2u"] = True
                i = i[:-1]
        if i.startswith("p"):
            if check_attendance_if_stripped(i[1:]):
                f["pair"] = True
                i = i[1:]
        if i.startswith("q"):
            if check_attendance_if_stripped(i[1:]):
                f["sat"] = True
                i = i[1:]
        if i.startswith("r"):
            if check_attendance_if_stripped(i[1:]):
                f["round"] = True
                i = i[1:]
        f["base"] = i
        result[k] = f
        firmnames.add(i)
        # assert iiiii != 'vqaddb_s8', f"{suffix_to_check} {i}"
        # print(k, i)
        # count[i] = count.get(i, 0) + 1
    # for k, v in sorted(result.items(), key=lambda x: x[0]):
    #     ans = printParsedName(v)
    #     # print(k, printParsedName(k, v))
    #     ans = ans.replace("[", "")
    #     ans = ans.replace("]", "")
    #     assert ans == k
    return result


def parse_flag(names: List[str]):
    qwq = set((i.split("_")[0], i) for i in names)
    # print(qwq)
    bases = find_basename(qwq)

    # x:bhsd
    result = {}
    for i in names:
        f = {
            "high": "",
            "lane": "",
            "n": False,
            "result": "",
            "type": "",
        }
        suffix = i.split("_")[1:]
        if suffix[0] == "high":
            f["high"] = "high"
            suffix = suffix[1:]
        elif suffix[0] == "low":
            f["high"] = "low"
            suffix = suffix[1:]
        if suffix[0] == "laneq":
            f["lane"] = "laneq"
            suffix = suffix[1:]
        elif suffix[0] == "lane":
            f["lane"] = "lane"
            suffix = suffix[1:]
        if suffix[0] == "n":
            f["n"] = True
            suffix = suffix[1:]
        if len(suffix) > 1:
            f["result"] = suffix[0]
            suffix = suffix[1:]
        f["type"] = suffix[0]

        f.update(bases[i.split("_")[0]])
        ans = printParsedName(f, full=True)
        # f["parsedname"] = ans
        # print(k, printParsedName(k, v))
        # print(i, ans)
        ans = ans.replace("[", "")
        ans = ans.replace("]", "")
        assert len(suffix) == 1
        assert ans == i
        result[i] = Flag(**f)
    return result


def wedo(instr):
    if not instr["name"].startswith("v"):
        return False
    if instr["name"] in ["vmaxv_s32", "vmaxv_u32", "vminv_s32", "vminv_u32"]:
        return False
    unsupportedGroup = ["Complex", "Cryptography"]
    if any([i in instr["instruction_group"] for i in unsupportedGroup]):
        return False

    def doType(i: str):
        if "float" in i or "poly" in i:
            return False
        if i.count('x') > 1:  # QWQ
            return False
        return True
    for arg in instr["arguments"]:
        if not doType(arg):
            return False
    if not doType(instr["return_type"]["value"]):
        return False
    if len(instr["base_instruction"]) > 1:
        return False
    if instr["base_instruction"][0] == "NOP":
        return False
    skip = ["SMMLA", "UMMLA", "USMMLA", "USDOT", "SUDOT", "SADDLP", "UADDLP"
            ]  # TODO: do we need to support these?
    tosupport = ["TBL", "TBX"]  # TODO: need to support
    if any([instr["base_instruction"][0].startswith(j) for j in tosupport+skip]):
        return False
    return True


def generateARMIntrinsicsFlags() -> (Dict[str, Flag]):
    allnames = []
    for i in I:
        # filter instructions we cares
        if not i["name"].startswith("v"):
            continue
        if "Complex" in i["instruction_group"]:
            continue
        allnames.append(i["name"])
    # print(parse_flag(allnames))
    return parse_flag(allnames)


IntrinsicsFlags = generateARMIntrinsicsFlags()


def searchEncodingForIntrinsic(intrinsic: InstrDesc):

    intrin = intrinsic["name"]
    # print("Dealing with", intrin)
    assert type(intrin) == str

    flag = IntrinsicsFlags[intrin]
    desiredprefix = intrinsic["base_instruction"][0]
    alias = {
        "MVN": "NOT",
        "MOV": "ORR",
    }
    desiredprefix = alias.get(desiredprefix, desiredprefix)

    def checkUniqueness(x):
        ans = set()
        for j in enckeys:
            if j.startswith(x):
                ans.add(j)
        # print("Try", x, "got", ans)
        if len(ans) != 1:
            return False
        k = list(ans)[0]
        return (k, enc[k])

    # print(intrin, desiredprefix)
    if (z := checkUniqueness(desiredprefix)):
        return z
    else:
        if desiredprefix in ["LD1", "LD2", "LD3", "LD4",
                             "ST1", "ST2", "ST3", "ST4"]:
            i = desiredprefix[-1]
            desiredprefix += f"_asisdlse_R{i}"
        elif desiredprefix in ["LD1R", "LD2R", "LD3R", "LD4R"]:
            i = desiredprefix[-2]
            desiredprefix += f"_asisdlso_R{i}"
        elif desiredprefix in ["UMOV", "SMOV"]:
            desiredprefix += "_asimdins_X_x"
        elif desiredprefix == "INS":
            desiredprefix += "_asimdins_IV_v" if flag.x else "_asimdins_IR_r"
        elif desiredprefix == "DUP":
            desiredprefix += "_asimdins_DV_v" if flag.x else "_asimdins_DR_r"
        elif desiredprefix in ["ORR", "BIC"]:
            desiredprefix += "_asimd"
        elif desiredprefix in ["ADDP"]:
            def handleADDP():
                if "addv" in intrin:
                    return "_asisd"
                if flag.x == "d":
                    return "_asisd"
                return "_asimd"
            desiredprefix += handleADDP()
        else:
            if flag.high == "high":
                assert desiredprefix.endswith("2")
                desiredprefix = desiredprefix[:-1]
            # desiredprefix += "_asisd" if flag.x else "_asimd"
            if (z := checkUniqueness(desiredprefix + "_asi")):
                desiredprefix += "_asi"
            else:
                def isSisd(flag):
                    if 'qmovn' in intrin or 'qmovun' in intrin:
                        return True if flag.x else False
                    if flag.pair:
                        return False
                    if not flag.q and flag.type.endswith("64"):
                        return True
                    if flag.x:
                        return True
                    return False
                desiredprefix += "_asisd" if isSisd(flag) else "_asimd"
        # print(intrin, desiredprefix)
        if (z := checkUniqueness(desiredprefix)):
            return z
        else:
            if any(desiredprefix.startswith(i) for i in ["CMEQ", "CMGE", "CMGT", "CMLE", "CMLT"]):
                # print(intrin, flag)
                if flag.base.endswith("z"):
                    desiredprefix += "misc_Z"
                else:
                    desiredprefix += "same"
            elif any(desiredprefix.startswith(i) for i in ["SMLAL", "UMLAL", "SMLSL", "UMLSL", "SQDMLAL", "UQDMLAL", "SQDMLSL", "UQDMLSL", "SMULL", "UMULL", "SQDMULL", "UQDMULL"]):
                desiredprefix += "diff"
            else:
                desiredprefix += "diff" if flag.narrow else "same"
            # print(intrin, desiredprefix)
            if (z := checkUniqueness(desiredprefix)):
                return z
            else:
                print(intrin, desiredprefix)
                assert False


def findMatchingEncoding():
    result = {}
    for i in I:
        intrin = InstrDesc(**i)
        if not wedo(i):
            continue
        k, v = searchEncodingForIntrinsic(i)
        assert type(intrin.name) == str

        result[intrin.name] = v

    return result


def genPossibleOpcode(fields):
    qwq = [fields]
    for i, v in fields.items():
        if i.startswith('R'):
            continue
        if 'x' in v:
            # print(fields[i])
            # assert fields[i] == 'x'*len(fields[i])
            ln = fields[i].count('x')
            nqwq = []
            zz = fields[i]
            for z in range(2**ln):
                z = bin(z)[2:]
                z = '0'*(ln-len(z)) + z
                zz = fields[i]
                for j in z:
                    zz = zz.replace('x', j, 1)
                nqwq = nqwq + [dict(q, **{i: zz})for q in qwq]
            qwq = nqwq
    for m, v in fields['constraint_ne']:
        qwq = [q for q in qwq if q[m] != v]
    return qwq


def Intrin2Field():
    result = {}
    inv_map = {}

    notwedo = 0
    for i in I:
        intrin = InstrDesc(**i)
        if not wedo(i):
            notwedo += 1
            continue
        k, v = searchEncodingForIntrinsic(i)
        field = EncodingFields[k]
        # print(intrin.name, field)
        inv_map[k] = inv_map.get(k, []) + [intrin.name]

    def selectField(opcd, k, v):
        return [i for i in opcd if i[k] == v]

    skip = []
    for encodings, intrins in inv_map.items():
        # print(encodings, intrins)
        # if encodings in skip:
        #     continue
        field = EncodingFields[encodings][1]
        if any(i in field for i in ["immh", "immb", "imm4", "imm5", "imm6"]):
            skip.append(encodings)
            # TODO: handle this: expand by n
            continue
        opcd = genPossibleOpcode(field)
        # print(encodings, field)
        # print(len(intrins), len(opcd), intrins)

        for cc in intrins:
            Flag = IntrinsicsFlags[cc]
            if Flag.n or Flag.lane:
                # TODO: handle this: expand by n
                # select lane by lane
                continue

            def guess():
                o = opcd

                def selectQ():
                    if Flag.q:
                        return selectField(o, 'Q', '1')
                    else:
                        if Flag.high == "high":
                            return selectField(o, 'Q', '1')
                        # if Flag.pair:
                        #     return selectField(o, 'Q', '1')
                        # else:
                        return selectField(o, 'Q', '0')

                def selectsize():
                    if Flag.narrow != "n":
                        if "pair" in encodings:
                            if Flag.type.endswith('64'):
                                return selectField(o, 'size', '11')
                            if Flag.type.endswith('32'):
                                return selectField(o, 'size', '11')
                            assert False, (cc, encodings)
                        else:
                            if Flag.type.endswith('64'):
                                return selectField(o, 'size', '11')
                            elif Flag.type.endswith('32'):
                                return selectField(o, 'size', '10')
                            elif Flag.type.endswith('16'):
                                return selectField(o, 'size', '01')
                            elif Flag.type.endswith('8'):
                                return selectField(o, 'size', '00')
                    elif Flag.narrow == "n":
                        if Flag.type.endswith('64'):
                            return selectField(o, 'size', '10')
                        elif Flag.type.endswith('32'):
                            return selectField(o, 'size', '01')
                        elif Flag.type.endswith('16'):
                            return selectField(o, 'size', '00')

                    assert False

                def selectsz():
                    if Flag.type.endswith('32'):
                        return selectField(o, 'sz', '0')
                    assert False

                def selectopcode():
                    if encodings in ["LD1_asisdlse_R1_1v", "ST1_asisdlse_R1_1v"]:
                        if Flag.type == "x2":
                            return selectField(o, 'opcode', '1010')
                        if Flag.type == "x3":
                            return selectField(o, 'opcode', '0110')
                        if Flag.type == "x4":
                            return selectField(o, 'opcode', '0010')
                        return selectField(o, 'opcode', '0111')
                    assert False

                checkers = ['Q', 'size', 'sz', 'opcode']
                for c in checkers:
                    if c in field:
                        o = locals()['select'+c]()
                    if len(o) == 1:
                        return o[0]
                    assert len(o) > 0
                print(cc, encodings)
                for _ in o:
                    print(_)
                assert False
            # print(c, guess())
            result[cc] = guess()

            # assert len(intrins) <= len(opcd)

            # print(result)
            # return result

    print("==============         Summary         ==============")
    print(f"We do {len(I) - notwedo} and discarded {notwedo} instrisics")
    print("Skipped encodings:", skip)
    print(f"Solved {len(result)} out of {len(I)} instrisics")
    print("==============           End           ==============")
    return result


def genThree():
    return generateARMIntrinsicsFlags(), findMatchingEncoding(), Intrin2Field()


IntrinsicsFlags, Intrinsics2Encodings, Intrinsics2Fields = genThree()


if __name__ == "__main__":
    check = ["vqdmulh_s16", "vaddhn_s64", "vqaddb_s8",
             "vrshl_s8", "vqmovn_s64", "vpadd_s8", "vaddl_high_s8"]
    for v in check:

        print(v, IntrinsicsFlags[v])
        print(v, Intrinsics2Encodings[v])
        print(v, Intrinsics2Fields[v])
    # genThree()
    # Intrin2Field()
    pass
