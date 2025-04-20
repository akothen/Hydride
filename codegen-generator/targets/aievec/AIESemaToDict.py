from AIEMeta import *
from AIEAllSema import AllSema

import re
import pprint


def extract_info(s):
    pattern = r"v(?P<NumLanes>\d+)(?P<signed>u?)(?P<Type>int|acc)(?P<SizeOfElement>\d+)"
    match = re.match(pattern, s)

    if match:
        dtype = match.group("Type")
        is_signed = (
            dtype == "acc" or match.group("signed") != "u"
        )  # Always True if "acc"

        return {
            "NumLanes": int(match.group("NumLanes")),
            "signed": is_signed,
            "Type": dtype,
            "SizeOfElement": int(match.group("SizeOfElement")),
        }
    return None


def SemaToDict(SemaList):
    with open("AIEngineSema.py", "w") as f:
        f.write(
            """# ============================== Hydride File =================================\n"""
        )
        f.write("""# Part of the Hydride Compiler Infrastructure.\n""")
        f.write(
            """# ============================== Hydride File =================================\n"""
        )
        ADD_entries = []
        ADD_classname_set = False
        ADD_classname = ""
        SUB_entries = []
        SUB_classname_set = False
        SUB_classname = "False"
        ELTMUL_entries = []
        ELTMUL_classname_set = False
        ELTMUL_classname = "False"
        ELTMUL_CONF_entries = []
        ELTMUL_CONF_classname_set = False
        ELTMUL_CONF_classname = "False"
        MM_entries = []
        MM_classname_set = False
        MM_classname = "False"

        for inst, sema in SemaList.items():
            if sema.instclass == "ADD":
                if ADD_classname_set:
                    continue
                else:
                    ADD_classname = inst
                ADD_entries.append(ADDInstEntry(inst, sema))
            if sema.instclass == "SUB":
                if SUB_classname_set:
                    continue
                else:
                    SUB_classname = inst
                SUB_entries.append(SUBInstEntry(inst, sema))
            if sema.instclass == "ELTMUL":
                if sema.conf:
                    if ELTMUL_CONF_classname_set:
                        continue
                    else:
                        ELTMUL_CONF_classname = inst
                    ELTMUL_CONF_entries.append(ELTMULInstEntry(inst, sema))

                else:
                    if ELTMUL_classname_set:
                        continue
                    else:
                        ELTMUL_classname = inst
                    ELTMUL_entries.append(ELTMULInstEntry(inst, sema))
        if ADD_entries:
            ADD_sema_str = f"""
        '"(define ({ADD_classname} arg0 arg1 %lanesize %datasize)"',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%i (range 0 %lanesize 1)])"',
        '"(define %low1 (* %datasize %i))"',
        '"(define %high1 (+ %low1 (- %datasize 1)))"',
        '"(define %ext_xbuff (extract %high1 %low1 arg0))"',
        '"(define %low2 (* %datasize %i))"',
        '"(define %high2 (+ %low2 (- %datasize 1)))"',
        '"(define %ext_ybuff (extract %high2 %low2 arg1))"',
        '"(define %o (bvadd %ext_xbuff %ext_ybuff))"',
        '"%o"',
        '")"',
        '")"',
        '")"',
        '"dst"',
        '")"',
    """
        SUB_sema_str = f"""
        '"(define ({SUB_classname} arg0 arg1 %lanesize %datasize)"',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%i (range 0 %lanesize 1)])"',
        '"(define %low1 (* %datasize %i))"',
        '"(define %high1 (+ %low1 (- %datasize 1)))"',
        '"(define %ext_xbuff (extract %high1 %low1 arg0))"',
        '"(define %low2 (* %datasize %i))"',
        '"(define %high2 (+ %low2 (- %datasize 1)))"',
        '"(define %ext_ybuff (extract %high2 %low2 arg1))"',
        '"(define %o (bvsub %ext_xbuff %ext_ybuff))"',
        '"%o"',
        '")"',
        '")"',
        '")"',
        '"dst"',
        '")"',
        """
        ELTMUL_sema_str = f"""
        '"(define ({ELTMUL_classname} arg0 arg1 %lanesize %indatasize %outdatasize)"',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%i (reverse (range 0 %lanesize 1))])"',
        '"(define %low1 (* %indatasize %i))"',
        '"(define %high1 (+ %low1 (- %indatasize 1)))"',
        '"(define %ext_a (sign-extend (extract %high1 %low1 arg0) (bitvector %outdatasize)))"',
        '"(define %low2 (* %indatasize %i))"',
        '"(define %high2 (+ %low2 (- %indatasize 1)))"',
        '"(define %ext_b (sign-extend (extract %high2 %low2 arg1) (bitvector %outdatasize)))"',
        '"(define %o (bvmul %ext_a %ext_b))"',
        '"%o"',
        '")"',
        '")"',
        '")"',
        '"dst"',
        '")"',
        """

        ELTMUL_CONF_sema_str = f"""
            '"(define ({ELTMUL_CONF_classname} arg0 arg1 int_sub %lanesize %indatasize %outdatasize)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 %lanesize 1))])"',
            '"(define %low1 (* %indatasize %i))"',
            '"(define %high1 (+ %low1 (- %indatasize 1)))"',
            '"(define %ext_a (sign-extend (extract %high1 %low1 arg0) (bitvector %outdatasize)))"',
            '"(define %low2 (* %indatasize %i))"',
            '"(define %high2 (+ %low2 (- %indatasize 1)))"',
            '"(define %ext_b (sign-extend (extract %high2 %low2 arg1) (bitvector %outdatasize)))"',
            '"(define %o (bvmul %ext_a %ext_b))"',
            '"(if (bveq (extract (+ %i 0) %i int_sub) (bv #b1 1)) (bvneg %o) %o)"',
            '")"',
            '")"',
            '")"',
            '"dst"',
            '")"',
            """

        f.write("""aie_sema = {\n""")
        f.write(
            """
        "ups_to_v32acc32": {
        "target_instructions": {
            "ups_to_v32acc32": {
                "args": ["SYMBOLIC_BV_512"],
                "in_vectsize": 512,
                "out_vectsize": 1024,
                "lanesize": 512,
                "in_precision": 16,
                "out_precision": 32,
                "in_vectsize_index": None,
                "out_vectsize_index": None,
                "in_lanesize_index": None,
                "out_lanesize_index": None,
                "in_precision_index": None,
                "out_precision_index": None,
                "arg_permute_map": [0],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
        },
        "semantics": [
            '"(define (ups_to_v32acc32 vec)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 32 1))])"',
            '"(define %low1 (* 16 %i))"',
            '"(define %high1 (+ %low1 (- 16 1)))"',
            '"(define %o (sign-extend (extract %high1 %low1 vec) (bitvector 32)))"',
            '"%o"',
            '")"',
            '")"',
            '")"',
            '"dst"',
            '")"',
        ],
    },
        """
        )
        f.write(
            """
       "srs_to_v32int16": {
        "target_instructions": {
            "srs_to_v32int16": {
                "args": ["SYMBOLIC_BV_1024"],
                "in_vectsize": 1024,
                "out_vectsize": 512,
                "lanesize": 1024,
                "in_precision": 32,
                "out_precision": 16,
                "in_vectsize_index": None,
                "out_vectsize_index": None,
                "in_lanesize_index": None,
                "out_lanesize_index": None,
                "in_precision_index": None,
                "out_precision_index": None,
                "arg_permute_map": [0],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
        },
        "semantics": [
            '"(define (srs_to_v32int16 acc)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 32 1))])"',
            '"(define %low1 (* 32 %i))"',
            '"(define %high1 (+ %low1 (- 32 1)))"',
            '"(define %o (extract 15 0 (extract %high1 %low1 acc)))"',
            '"%o"',
            '")"',
            '")"',
            '")"',
            '"dst "',
            '")"',
        ],
    }, 
        """
        )
        f.write(
        """
       "mac_elem_32": {
        "target_instructions": {
            "mac_elem_32": {
                "args": ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512", "SYMBOLIC_BV_1024"],
                "in_vectsize": 512,
                "out_vectsize": 1024,
                "lanesize": 512,
                "in_precision": 16,
                "out_precision": 32,
                "in_vectsize_index": None,
                "out_vectsize_index": None,
                "in_lanesize_index": None,
                "out_lanesize_index": None,
                "in_precision_index": None,
                "out_precision_index": None,
                "arg_permute_map": [],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
        },
        "semantics": [
            '"(define (mac_elem_32 a b c)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 32 1))])"',
            '"(define %low1 (* 16 %i))"',
            '"(define %high1 (+ %low1 (- 16 1)))"',
            '"(define %ext_a (sign-extend (extract %high1 %low1 a) (bitvector 32)))"',
            '"(define %low2 (* 16 %i))"',
            '"(define %high2 (+ %low2 (- 16 1)))"',
            '"(define %ext_b (sign-extend (extract %high2 %low2 b) (bitvector 32)))"',
            '"(define %low3 (* 32 %i))"',
            '"(define %high3 (+ %low3 (- 32 1)))"',
            '"(define %ext_c (extract %high3 %low3 c))"',
            '"(define %o (bvadd %ext_c (bvmul %ext_a %ext_b)))"',
            '"%o"',
            '")"',
            '")"',
            '")"',
            '"dst"',
            '")"'
        ],
    }, 
        """
        )
        f.write(
        """
       "mul_conv_32x8": {
        "target_instructions": {
            "mul_conv_32x8": {
                "args": ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512"],
                "in_vectsize": 512,
                "out_vectsize": 1024,
                "lanesize": 512,
                "in_precision": 8,
                "out_precision": 32,
                "in_vectsize_index": None,
                "out_vectsize_index": None,
                "in_lanesize_index": None,
                "out_lanesize_index": None,
                "in_precision_index": None,
                "out_precision_index": None,
                "arg_permute_map": [],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
        },
        "semantics": [
            '"(define (mul_conv_32x8 matA matB) "',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 32 1))])"',
            '"(define res"',
            '"(apply bvadd"',
            '"(for/list ([%j (reverse (range 0 8 1))])"',
            '"(define %aLo1 (* 8 (+ %i %j)))"',
            '"(define %aHi1 (+ %aLo1 (- 8 1)))"',
            '"(define %bLo1 (* 8 %j))"',
            '"(define %bHi1 (+ %bLo1 (- 8 1)))"',
            '"(define %ext_a1 (sign-extend (extract %aHi1 %aLo1 matA) (bitvector 32)))"',
            '"(define %ext_b1 (sign-extend (extract %bHi1 %bLo1 matB) (bitvector 32)))"',
            '"(define %elem (bvmul %ext_a1 %ext_b1))"',
            '"%elem"',
            '")"',
            '")"',
            '")"',
            '"res"',
            '")"',
            '")"',
            '")"',
            '"dst"',
            '")"',
        ],
    }, 
        """
        )
        f.write(
            f"""\t"{ADD_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in ADD_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{ADD_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{ELTMUL_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in ELTMUL_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{ELTMUL_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{ELTMUL_CONF_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in ELTMUL_CONF_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{ELTMUL_CONF_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{SUB_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in SUB_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{SUB_sema_str}]""")
        f.write("""\n}""")
        f.write("""\n}""")


def ELTMULInstEntry(InstName, Sema: AIESema):
    params = Sema.params
    in_ty_info_a = extract_info(params[0].type)
    in_ty_info_b = extract_info(params[0].type)
    assert in_ty_info_a["SizeOfElement"] == in_ty_info_b["SizeOfElement"]
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]
    out_vectsize = lanesize * datasize
    in_datasize = in_ty_info_a["SizeOfElement"]
    in_lanesize = in_ty_info_a["NumLanes"]
    in_vectsize = in_lanesize * in_datasize
    is_neg = int("neg" in InstName)

    if Sema.conf:
        ret_str = f"""
    \t"{InstName}" : {{
    \t "args": ["SYMBOLIC_BV_{in_vectsize}", "SYMBOLIC_BV_{in_vectsize}", "SYMBOLIC_BV_32", "{lanesize}", "{in_datasize}", "{datasize}"],
                    "in_vectsize": {in_vectsize},
                    "out_vectsize": {out_vectsize},
                    "lanesize": {in_lanesize},
                    "in_precision": {in_datasize},
                    "out_precision": {datasize},
                    "in_vectsize_index": 2,
                    "out_vectsize_index": 2,
                    "in_lanesize_index": 2,
                    "out_lanesize_index": 2,
                    "in_precision_index": 3,
                    "out_precision_index": 4,
                    "arg_permute_map": [0, 1, 2, -1, -1, -1],
                    "Signedness": {int(all(param.is_signed for param in params))},
                    "Cost": "None",
                    "SIMD": "True",
                    "Extensions": "[]",
    }},"""
    else:
        ret_str = f"""
    \t"{InstName}" : {{
    \t "args": ["SYMBOLIC_BV_{in_vectsize}", "SYMBOLIC_BV_{in_vectsize}", "{lanesize}", "{in_datasize}", "{datasize}"],
                    "in_vectsize": {in_vectsize},
                    "out_vectsize": {out_vectsize},
                    "lanesize": {in_lanesize},
                    "in_precision": {in_datasize},
                    "out_precision": {datasize},
                    "in_vectsize_index": 2,
                    "out_vectsize_index": 2,
                    "in_lanesize_index": 2,
                    "out_lanesize_index": 2,
                    "in_precision_index": 3,
                    "out_precision_index": 4,
                    "arg_permute_map": [0, 1, -1, -1, -1],
                    "Signedness": {int(all(param.is_signed for param in params))},
                    "Cost": "None",
                    "SIMD": "True",
                    "Extensions": "[]",
    }},"""
    return ret_str


def ADDInstEntry(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]
    vectsize = lanesize * datasize

    ret_str = f"""
  \t"{InstName}" : {{
   \t "args": ["SYMBOLIC_BV_{vectsize}", "SYMBOLIC_BV_{vectsize}", "{lanesize}", "{datasize}"],
                "in_vectsize": {vectsize},
                "out_vectsize": {vectsize},
                "lanesize": {lanesize},
                "in_precision": {datasize},
                "out_precision": {datasize},
                "in_vectsize_index": 2,
                "out_vectsize_index": 2,
                "in_lanesize_index": 2,
                "out_lanesize_index": 2,
                "in_precision_index": 3,
                "out_precision_index": 3,
                "arg_permute_map": [0, 1, -1, -1],
                "Signedness": {int(all(param.is_signed for param in params))},
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
  }},"""
    return ret_str

def ShuffleInstEntry(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]
    vectsize = lanesize * datasize

    ret_str = f"""
  \t"{InstName}" : {{
   \t "args": ["SYMBOLIC_BV_{vectsize}", "SYMBOLIC_BV_{vectsize}", "{lanesize}", "{datasize}"],
                "in_vectsize": {vectsize},
                "out_vectsize": {vectsize},
                "lanesize": {lanesize},
                "in_precision": {datasize},
                "out_precision": {datasize},
                "in_vectsize_index": 2,
                "out_vectsize_index": 2,
                "in_lanesize_index": 2,
                "out_lanesize_index": 2,
                "in_precision_index": 3,
                "out_precision_index": 3,
                "arg_permute_map": [0, 1, -1, -1],
                "Signedness": {int(all(param.is_signed for param in params))},
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
  }},"""
    return ret_str


def SUBInstEntry(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]
    vectsize = lanesize * datasize

    ret_str = f"""
  \t"{InstName}" : {{
   \t "args": ["SYMBOLIC_BV_{vectsize}", "SYMBOLIC_BV_{vectsize}", "{lanesize}", "{datasize}"],
                "in_vectsize": {vectsize},
                "out_vectsize": {vectsize},
                "lanesize": {lanesize},
                "in_precision": {datasize},
                "out_precision": {datasize},
                "in_vectsize_index": 2,
                "out_vectsize_index": 2,
                "in_lanesize_index": 2,
                "out_lanesize_index": 2,
                "in_precision_index": 3,
                "out_precision_index": 3,
                "arg_permute_map": [0, 1, -1, -1],
                "Signedness": {int(all(param.is_signed for param in params))},
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
  }},"""
    return ret_str


if __name__ == "__main__":
    SemaToDict(AllSema)
