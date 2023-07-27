
from ARMEncodingFields import EncodingFields
from ARMAST import Flag, JSONDIR
from ARMTypes import *
import json
from typing import Set, List, Dict, Tuple
from ARMMeta import *

# v[p][q][r]name[u][n][q][x][_high][_lane | laneq][_n][_result]_type
# https://developer.arm.com/documentation/102467/0200/Program-conventions?lang=en

with open(JSONDIR+"encodingmap.json", 'r') as fi:
    enc = json.load(fi)
enckeys = enc.keys()
with open(JSONDIR+"intr.json", 'r') as fi:
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

    for k, intrin_name in namelist:
        Intrin = toI[intrin_name]
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
    candidate_flags = set((i.split("_")[0], i) for i in names)
    bases = find_basename(candidate_flags)

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
    if any(instr["name"].startswith(i) for i in ["vget", "vset"]):  # TODO: too lazy to do
        return False
    if instr["name"] in ["vmaxv_s32", "vmaxv_u32", "vminv_s32", "vminv_u32", "vmov_n_s64", "vmov_n_u64"]:  # TODO: intrinsic mismatch
        return False
    unsupportedGroup = ["Complex", "Cryptography"]
    if any([i in instr["instruction_group"] for i in unsupportedGroup]):
        return False

    def doType(i: str):
        if "float" in i or "poly" in i:
            return False
        if i.count('x') > 1:  # TODO: matrix type
            return False
        return True
    for arg in instr["arguments"]:
        if not doType(arg):
            return False
    if not doType(instr["return_type"]["value"]):
        return False
    if len(instr["base_instruction"]) > 1:  # TODO: vcombine
        return False
    if instr["base_instruction"][0] == "NOP":  # TODO: vreinterpret
        return False
    skip = ["SMMLA", "UMMLA", "USMMLA", "USDOT", "SUDOT",
            "SADDLP", "UADDLP"]  # TODO: not found in XML
    tosupport = ["TBL", "TBX"]  # TODO: need to support
    if any([instr["base_instruction"][0].startswith(j) for j in tosupport+skip]):
        return False
    skip_list = notSSA+UIP+op_mismatch+not_compiled_in_gcc
    if any([j in instr["name"] for j in skip_list]):
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
    # if intrin.startswith("vget"):
    #     return ("DUP_asisdone_only", "aarch64_vector_transfer_vector_cpy_dup_sisd") if "64" in intrin else ("DUP_asimdins_DV_v", "aarch64_vector_transfer_vector_cpy_dup_sisd")
    if intrin.startswith("vset"):
        desiredprefix = "INS"
    if intrin in ['vaddv_s32', 'vaddv_u32']:
        desiredprefix = "ADDV"
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
            desiredprefix += "_asimdins_IV_v" if flag.x or flag.base == 'copy' else "_asimdins_IR_r"
        elif desiredprefix == "DUP":
            # vdup_n_s8 -> DUP_asimdins_DR_r
            # vdup_lane_s8 -> DUP_asimdins_DV_v
            # vdup_lane_s64 -> DUP_asisdone_only
            # vcopy_lane_s64 -> DUP_asisdone_only

            if flag.high or (any(i in intrin for i in ["_lane_s64", "_lane_u64", "_laneq_s64", "_laneq_u64"]) and not flag.q):
                desiredprefix += "_asisdone_only"
            else:
                desiredprefix += "_asimdins_DV_v" if flag.x or flag.lane else "_asimdins_DR_r"
        elif desiredprefix in ["ORR", "BIC"]:
            desiredprefix += "_asimd"
        elif desiredprefix in ["ADDP"]:
            def handleADDP():
                if "addv" in intrin:
                    # if "x2" in intrinsic["arguments"][0]:
                    #     return "_asimd"
                    # else:
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
                    if not flag.q and flag.type.endswith("64") and desiredprefix not in ["SHRN",  "RSHRN", "SQSHRUN", "SQSHRN", "SQRSHRUN", "SQRSHRN", "UQSHRUN", "UQSHRN", "UQRSHRUN", "UQRSHRN"]:
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
            elif any(desiredprefix.startswith(i) for i in PUT0_LANE_N_ELEM_DIFF):
                desiredprefix += "elem" if flag.n or flag.lane else "diff"
            elif any(desiredprefix.startswith(i) for i in PUT0_LANE_N_ELEM_SAME):
                desiredprefix += "elem" if flag.n or flag.lane else "same"
            elif any(desiredprefix.startswith(i) for i in ["SQSHL", "UQSHL"]):
                desiredprefix += "shf" if flag.n else "same"
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
        # print(intrin.name, v)
        assert type(intrin.name) == str

        result[intrin.name] = v

    return result


def genPossibleOpcode(fields):
    candidates = [fields]
    for i, v in fields.items():
        if i.startswith('R'):
            continue
        if 'x' in v:
            # print(fields[i])
            # assert fields[i] == 'x'*len(fields[i])
            ln = fields[i].count('x')
            next_candidates = []
            zz = fields[i]
            for z in range(2**ln):
                z = bin(z)[2:]
                z = '0'*(ln-len(z)) + z
                zz = fields[i]
                for j in z:
                    zz = zz.replace('x', j, 1)
                next_candidates = next_candidates + \
                    [dict(q, **{i: zz})for q in candidates]
            candidates = next_candidates
    for m, v in fields['constraint_ne']:
        candidates = [q for q in candidates if q[m] != v]
    return candidates


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
        # print(intrin.name, v)
        field = EncodingFields[k]
        for expanded_name in expand_instr(intrin):
            # print(expanded_name, extract_assignment_from_name(expanded_name))
            inv_map[k] = inv_map.get(k, []) + [expanded_name]

    def selectField(opcd, k, v):
        return [i for i in opcd if maskeq(i[k], v)]

    def Lane2OrLaneOrN(dicttt):
        if "lane2" not in dicttt and "n" not in dicttt:
            return dicttt["lane"]
        if "lane" not in dicttt and "n" not in dicttt:
            return dicttt["lane2"]
        if "lane" not in dicttt and "lane2" not in dicttt:
            return dicttt["n"]
        assert False

    def LaneOrN(dicttt):
        if "n" not in dicttt:
            return dicttt["lane"]
        if "lane" not in dicttt:
            return dicttt["n"]
        assert False
    skip = []
    skipintrin = []
    name2encoding = {}
    # breakpoint()
    for encodings, intrins in inv_map.items():
        # print(encodings, intrins)
        # if encodings in skip:
        #     continue
        field = EncodingFields[encodings][1]

        # if any(i in field for i in ["immh", "immb", "imm4", "imm5", "imm6"]):
        #     skip.append(encodings)
        #     # TODO: handle this: expand by n
        #     continue
        opcd = genPossibleOpcode(field)
        # print(encodings, field)
        # print(len(intrins), len(opcd), intrins)

        for cc2 in intrins:
            name2encoding[cc2] = encodings
            cc, assignments = extract_assignment_from_name(cc2)
            Flag = IntrinsicsFlags[cc]
            # print(cc2, encodings, field)
            if any(i in cc for i in ["vget_low", "vcreate", "vdup"]):
                if not Flag.lane:
                    assert "lane" not in assignments
                    assignments["lane"] = 0
            if any(encodings.startswith(i) for i in PUT0_LANE_N_ELEM_DIFF+PUT0_LANE_N_ELEM_SAME):
                if "lane" not in assignments:
                    assignments["lane"] = 0
            if "vget_high" in cc:
                assignments["lane"] = 1
            if any(i in cc for i in ["vmovl", "vmov_", "vmovq_"]):
                assert "n" not in assignments
                assignments["n"] = 0

            def guess():
                o = opcd

                def selectQ():
                    if Flag.base == "get":
                        def wrnmQ():
                            if "UMOV" in encodings:
                                return Flag.type.endswith("64")
                            elif "SMOV" in encodings:
                                return Flag.type.endswith("32")
                        return selectField(o, 'Q', '1') if wrnmQ() else selectField(o, 'Q', '0')

                    if Flag.q:
                        return selectField(o, 'Q', '1')
                    else:

                        if Flag.high == "high":
                            return selectField(o, 'Q', '1')
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
                    assert False, f"{cc2}, {encodings}, {assignments}"

                def selectimmh():
                    if Flag.narrow != "n":
                        if Flag.type.endswith('64'):
                            return selectField(o, 'immh', '1xxx')
                        elif Flag.type.endswith('32'):
                            return selectField(o, 'immh', '01xx')
                        elif Flag.type.endswith('16'):
                            return selectField(o, 'immh', '001x')
                        elif Flag.type.endswith('8'):
                            return selectField(o, 'immh', '0001')
                    elif Flag.narrow == "n":
                        if Flag.type.endswith('64'):
                            return selectField(o, 'immh', '01xx')
                        elif Flag.type.endswith('32'):
                            return selectField(o, 'immh', '001x')
                        elif Flag.type.endswith('16'):
                            return selectField(o, 'immh', '0001')

                def selectimmb():
                    def calc(immh, immb):
                        return ((8 << HighestSetBit(immh)) * 2) - UInt(immh + immb)

                    def calc2(immh, immb):
                        return UInt(immh+immb) - (8 << HighestSetBit(immh))
                    # print(f"{cc}, {encodings}, {assignments}, {Flag}")
                    if any(i in encodings for i in ["SHR", 'SRA', "SRI"]):
                        return [i for i in o if calc(i["immh"], i["immb"]) == assignments["n"]]
                    if any(i in encodings for i in ["SHL", "SLI"]):
                        return [i for i in o if calc2(i["immh"], i["immb"]) == assignments["n"]]
                    assert False, f"{cc2}, {encodings}, {assignments}, {Flag}"

                def selectimm5():
                    def dst(imm5):
                        size = LowestSetBit(imm5)
                        if size > 3:
                            return "UNDEFINED"
                        return UInt(ASLArraySlice(imm5, 4, size+1, 5))

                    oo = [i for i in o if dst(
                        i["imm5"]) == (assignments["lane1"] if "imm4" in field and 'x' in field["imm4"] else Lane2OrLaneOrN(assignments))]
                    # vcopy_lane_s8(INS Vd.B[lane1],Vn.B[lane2]) 'x' in imm4 -> lane1
                    # vcopy_lane_s64(DUP Dd,Vn.D[lane2]) 'x' not in imm4 -> lane2
                    # vdup_lane_s8(DUP Vd.8B,Vn.B[lane]) 'x' not in imm4 -> lane

                    # return oo
                    if Flag.type.endswith('64'):
                        return selectField(oo, 'imm5', 'x1000')
                    elif Flag.type.endswith('32'):
                        return selectField(oo, 'imm5', 'xx100')
                    elif Flag.type.endswith('16'):
                        return selectField(oo, 'imm5', 'xxx10')
                    elif Flag.type.endswith('8'):
                        return selectField(oo, 'imm5', 'xxxx1')
                    assert False, (Flag,)

                def selectimm4():
                    if "imm5" in field:  # vcopy_lane
                        def src(imm5, imm4):
                            size = LowestSetBit(imm5)
                            if "1" in ASLArraySlice(imm4, size-1, 0, 4):
                                # Unspecified bits in "imm4" are ignored but should be set to zero by an assembler.
                                return "UNDEFINED"
                            if size > 3:
                                return "UNDEFINED"
                            return UInt(ASLArraySlice(imm4, 3, size, 4))
                        return [i for i in o if src(i["imm5"], i["imm4"]) == assignments["lane2"]]
                    else:
                        wari = (
                            assignments["n"] * int(Flag.type[1:])//8) if Flag.base == 'ext' else assignments["n"]
                        return [i for i in o if UInt(i["imm4"]) == wari]

                def selectimm6():
                    return [i for i in o if UInt(i["imm6"]) == assignments["imm6"]]

                def selectL():
                    return [i for i in o if (i["size"] == '01' and UInt(i["H"]+i["L"]+i["M"]) == assignments["lane"]) or (i["size"] == '10' and UInt(i["H"]+i["L"]) == assignments["lane"] and i["M"] == '0')]
                checkers = ['Q', 'size', 'sz',
                            'immh', 'immb', 'imm5', 'imm4', 'imm6', 'L', 'opcode', ]
                for c in checkers:
                    if c in field and 'x' in field[c]:
                        o = locals()['select'+c]()
                    if len(o) == 1:
                        return o[0]
                    assert len(o) > 0, (cc2, c, encodings,
                                        assignments, Flag, opcd,)
                print(cc2, encodings, assignments)
                for _ in o:
                    print(_)
                assert False

            result[cc2] = guess()
            # assert "vmlsq_" not in cc2, (cc2,
            #                              result[cc2], encodings, assignments)

            # assert len(intrins) <= len(opcd)

            # print(result)
            # return result

    print("==============         Summary         ==============")
    print(f"We do {len(I) - notwedo} and discarded {notwedo} instrisics")
    print("Skipped encodings:", skip)
    print("Skipped intrinsics:", skipintrin)
    print(f"Solved {len(result)} out of {len(I)} instrisics")
    print("==============           End           ==============")
    return result, name2encoding


def genThree():
    return generateARMIntrinsicsFlags(), findMatchingEncoding(), Intrin2Field()

# - IntrinsicsFlags, Intrinsics2Encodings and Intrinsics2Fields be like:
# - vaddl_high_s8 Flag(pair=False, sat=False, round=False, base='add', s2u=False, narrow='l', q=False, x='', high='high', lane='', n=False, result='', type='s8')
# - vaddl_high_s8 aarch64_vector_arithmetic_binary_disparate_add_sub_long
# - vaddl_high_s8 {'Q': '1', 'U': '0', 'size': '00', 'Rm': 'xxxxx', 'o1': '0', 'Rn': 'xxxxx', 'Rd': 'xxxxx', 'constraint_ne': []}


# For lane intrinsics, we need to expand them by lane in Intrinsics2Fields
# For these expansion, there keys in Intrinsics2Fields are different from the original ones
IntrinsicsFlags, Intrinsics2Encodings, (Intrinsics2Fields,
                                        ExpandName2Encoding) = genThree()
# print(ExpandName2Encoding)

if __name__ == "__main__":
    # check = ["vqdmulh_s16", "vaddhn_s64", "vqaddb_s8",
    #          "vrshl_s8", "vqmovn_s64", "vpadd_s8", "vaddl_high_s8"]
    check = ["vmlal_high_n_s16", "vget_lane_s32__lane_0",
             "vmlal_high_lane_s16__lane_0", "vmul_n_s16", "vmla_lane_s16__lane_0", "vqshrun_n_s64__n_1", "vqshrn_n_u64__n_1", "vqshrn_n_u64__n_1", "vdup_n_s8", "vdup_lane_s8__lane_0"]
    check = ["vaddv_s32", "vaddvq_s32", "vaddvq_s64"]
    for v in check:
        vv, _ = extract_assignment_from_name(v)
        print(vv, IntrinsicsFlags[vv])
        print(vv, Intrinsics2Encodings[vv])
        print(v, Intrinsics2Fields[v])
    # genThree()
    # Intrin2Field()
    pass
