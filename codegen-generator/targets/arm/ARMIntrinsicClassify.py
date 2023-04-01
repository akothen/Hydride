# from ARMAST import *
from ARMTypes import *
import json
from typing import Set, List
I = None
OP = None


def get_instr(ID) -> (InstrDesc):
    global I, OP
    if I is None or OP is None:
        with open("intr.json", 'r') as fi:
            I = json.load(fi)
        # with open("op.json", 'r') as fo:
        #     OP = json.load(fo)
    return InstrDesc(**I[ID])


def get_and_parse_instr(ID):
    instr = get_instr(ID)

    # print(ID, instr.name, instr.base_instruction,
    #       instr.return_type["value"], instr.arguments, instr.Operation)
    # if "lane" in instr.name:
    #     print("[Lane] not supported.")
    #     return instr
    # if any([instr.base_instruction.startswith(i) for i in ["ST", "LD", "TB", "ZIP", "UZP"]]):
    #     print("[ST/LD/TB/ZIP/UZP] not supported.")
    #     return instr, None
    # if any([instr.name.startswith(i) for i in ["vabdh"]]):
    #     print("[vabdh] not supported.")
    #     return instr, None
    # if instr.Operation == "NeonOperationId_00015":
    #     print("[NeonOperationId_00015] not supported.")
    #     return instr, None
    return instr


def parse_instr_attr(instr: InstrDesc):
    # Note: Modified Vm.4S[imm2] to Vm.S[imm2] in intr.json

    # - Parse Arguments_Preparation like:
    # - {"a": {"register": "Vn.8B"}, "b": {"register": "Vm.8B"}}
    # It gives prolog:
    # V[n]=a;
    # V[m]=b;
    # And also records
    # a: bits(64)
    # b: bits(64)
    # global defined_sym
    # prolog = ""
    # parsed_input_reg = []
    # for a, reg in instr.Arguments_Preparation.items():
    #     if len(reg) == 1:
    #         assert list(reg.keys())[0] == "register"
    #         reg = parse_reg(list(reg.values())[0])
    #         parsed_input_reg.append(reg)
    #     else:
    #         assert "minimum" in reg and "maximum" in reg
    # not a reg

    # - Parse results: [{"Vd.8B": "result"}]
    # It gives epilog:
    # return V[d];
    # assert len(instr.results) == 1
    # assert len(instr.results[0]) == 1
    # if "void" in instr.results[0]:
    #     epilog = ""
    #     parsed_result_reg = None
    # else:
    #     reg = parse_reg(list(instr.results[0].keys())[0])
    #     parsed_result_reg = reg

    #     epilog = f"\nreturn V[{reg.idx}];"

    # - Parse input type: ["int8x8_t a", "int8x8_t b"]
    parsed_input_type = []
    for arg in instr.arguments:
        arg = parse_type(' '.join(arg.split()[:-1]))
        if isinstance(arg, CType):
            parsed_input_type.append(arg)

    # - Parse return type:
    # - {"return_base_type": "int", "element_bit_size": "8", "value": "int8x8_t"}
    # parsed_return_type = parse_type(instr.return_type["value"])
    # esize = int(instr.return_type["element_bit_size"])

    # - Sanity check
    # print(parsed_input_reg, parsed_input_type)
    # assert(len(parsed_input_reg) == len(parsed_input_type))
    # for preg in parsed_input_reg:
    #     if isinstance(preg, VectorReg) and preg.elements != 1:
    #         assert(f"{preg.elements}{preg.bitspec}" in {
    #             "8B", "16B",  "4H", "8H", "2S", "4S", "2D"})  # WTF is Vn.2H
    # for typ in parsed_input_type+[parsed_return_type]:
    #     assert(typ.basetype in {"int", "uint",
    #            "float", "bfloat", "poly", "const int"})
    # allregs = parsed_input_reg+[parsed_result_reg]
    # datasize = min(get_total_bits(reg) for reg in allregs)

    # for regname, typ in zip(parsed_input_reg, parsed_input_type):
    #     assert(regname.elements == typ.num)
    #     assert(data_bits_spec[regname.bitspec] == typ.bits)
    # assert (len(set(reg.elements for reg in allregs))
    #         == 1) != ("high" in instr.name)
    # elements = parsed_result_reg.elements


# v[p][q][r]name[u][n][q][x][_high][_lane | laneq][_n][_result]_type
# https://developer.arm.com/documentation/102467/0200/Program-conventions?lang=en

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


def find_basename(names: Set[str]):
    namelist = list(names)
    namelist.sort(key=len)
    # print(namelist)
    firmnames = set()
    result = {}
    # count = {}

    def check_attendance_if_stripped(i):
        for j in firmnames:
            if j in i:
                return True
        return False
    for k in namelist:
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
        if i.endswith("b") or i.endswith("h") or i.endswith("s") or i.endswith("d"):
            if check_attendance_if_stripped(i[:-1]):
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
    qwq = set(i.split("_")[0] for i in names)
    # print(qwq)
    bases = find_basename(qwq)

    # x:bhsd
    result = {}
    for i in names:
        f = {
            "high": False,
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
        print(i, ans)
        ans = ans.replace("[", "")
        ans = ans.replace("]", "")
        assert len(suffix) == 1
        assert ans == i
        result[i] = Flag(**f)
    return result


def wedo(instr):
    if not instr["name"].startswith("v"):
        return False
    unsupportedGroup = ["Complex", "Cryptography"]
    if any([i in instr["instruction_group"] for i in unsupportedGroup]):
        return False
    for arg in instr["arguments"]:
        if "float" in arg or "poly" in arg:
            return False
    if "float" in instr["return_type"]["value"] or "poly" in instr["return_type"]["value"]:
        return False
    if len(i["base_instruction"]) > 1:
        return False
    if i["base_instruction"][0] == "NOP":
        return False
    skip = ["SMMLA", "UMMLA", "USMMLA", "USDOT", "SUDOT"
            ]  # TODO: do we need to support these?
    tosupport = ["LD", "ST", "TBL", "TBX"]  # TODO: need to support
    if any([i["base_instruction"][0].startswith(j) for j in tosupport+skip]):
        return False
    return True


if __name__ == "__main__":
    with open("intr.json", 'r') as fi:
        I = json.load(fi)
    # allnames = []
    # for i in I:
    #     # filter instructions we cares
    #     if not i["name"].startswith("v"):
    #         continue
    #     if "Complex" in i["instruction_group"]:
    #         continue
    #     allnames.append(i["name"])
    # result = parse_flag(allnames)
    from ARMIntrinsics import Intrinsics
    with open("encodingmap.json", 'r') as fi:
        enc = json.load(fi)
    enckeys = enc.keys()
    for i in I:
        if not wedo(i):
            continue
        intrin = i["name"]
        assert type(intrin) == str

        flag = Intrinsics[intrin]
        ans = ""
        desiredprefix = i["base_instruction"][0]
        alias = {
            "MVN": "NOT",
            "MOV": "ORR",
        }
        desiredprefix = alias.get(desiredprefix, desiredprefix)

        def checkUniqueness(x):
            ans = set()
            for j in enckeys:
                if j.startswith(x):
                    ans.add(enc[j])
            return list(ans)[0] if len(ans) == 1 else ""
        print(intrin, desiredprefix)
        if (z := checkUniqueness(desiredprefix)):
            ans = z
        else:
            if desiredprefix == "INS":
                desiredprefix += "_asimdins_IV_v" if flag.x else "_asimdins_IR_r"
            elif desiredprefix == "DUP":
                desiredprefix += "_asimdins_DV_v" if flag.x else "_asimdins_DR_r"
            else:
                if flag.high == "high":
                    assert desiredprefix.endswith("2")
                    desiredprefix = desiredprefix[:-1]
                desiredprefix += "_asisd" if flag.x else "_asimd"
            print(intrin, desiredprefix)
            if (z := checkUniqueness(desiredprefix)):
                ans = z
            else:
                desiredprefix += "diff" if flag.narrow else "same"
                print(intrin, desiredprefix)
                if (z := checkUniqueness(desiredprefix)):
                    ans = z
                else:
                    assert False
        print(intrin, ans)
        # Need to verify the similarity of the auto matched encodings
        # with the ones extract from the intrinsics
