from AIEMeta import *
from AIEAllSema import AllSema

import re
import pprint


def extract_conv_info(s):
    match = re.match(r"mul_conv_(\d+)x(\d+)", s)
    if match:
        return {"M": int(match.group(1)), "N": int(match.group(2))}
    else:
        return None


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
        ADD_classname = ""

        SUB_entries = []
        SUB_classname = ""

        ELTMUL_entries = []
        ELTMUL_classname = ""

        ELTMUL_CONF_entries = []
        ELTMUL_CONF_classname = ""

        MM_entries = []
        MM_classname = ""

        MULCONV_entries = []
        MULCONV_classname = ""

        SHUFFLELO_entries = []
        SHUFFLELO_classname = ""

        SHUFFLELO_entries = []
        SHUFFLELO_classname = ""

        SHUFFLEHI_entries = []
        SHUFFLEHI_classname = ""

        SHIFT_entries = []
        SHIFT_classname = ""

        SHIFT_BYTES_entries = []
        SHIFT_BYTES_classname = ""

        for inst, sema in SemaList.items():
            if sema.instclass == "SHUFFLE_2_LO":
                if not SHUFFLELO_classname:
                    SHUFFLELO_classname = inst
                SHUFFLELO_entries.append(ShuffleInstEntry(inst, sema))
            if sema.instclass == "SHUFFLE_2_HI":
                if not SHUFFLEHI_classname:
                    SHUFFLEHI_classname = inst
                SHUFFLEHI_entries.append(ShuffleInstEntry(inst, sema))
            if sema.instclass == "SHIFT_ELEMS":
                if not SHIFT_classname:
                    SHIFT_classname = inst
                SHIFT_entries.append(ShiftInstEntry(inst, sema))
            if sema.instclass == "ADD":
                if not ADD_classname:
                    ADD_classname = inst
                ADD_entries.append(ADDInstEntry(inst, sema))
            if sema.instclass == "SUB":
                if not SUB_classname:
                    SUB_classname = inst
                SUB_entries.append(SUBInstEntry(inst, sema))
            if sema.instclass == "ELTMUL":
                if sema.conf:
                    if not ELTMUL_CONF_classname:
                        ELTMUL_CONF_classname = inst
                    ELTMUL_CONF_entries.append(ELTMULInstEntry(inst, sema))
                else:
                    if not ELTMUL_classname:
                        ELTMUL_classname = inst
                    ELTMUL_entries.append(ELTMULInstEntry(inst, sema))
            if sema.instclass == "MULCONV":
                if not MULCONV_classname:
                    MULCONV_classname = inst
                MULCONV_entries.append(MULCONVInstEntry(inst, sema))

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

        MULCONV_sema_str = f"""
        '"(define ({MULCONV_classname} matA matB m n in_lanesize lanesize indatasize outdatasize) "',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%i (reverse (range 0 m 1))])"',
        '"(define res"',
        '"(apply bvadd"',
        '"(for/list ([%j (reverse (range 0 n 1))])"',
        '"(define %aLo1 (* indatasize (+ %i %j)))"',
        '"(define %aHi1 (+ %aLo1 (- indatasize 1)))"',
        '"(define %bLo1 (* indatasize %j))"',
        '"(define %bHi1 (+ %bLo1 (- indatasize 1)))"',
        '"(define %ext_a1 (sign-extend (extract %aHi1 %aLo1 matA) (bitvector outdatasize)))"',
        '"(define %ext_b1 (sign-extend (extract %bHi1 %bLo1 matB) (bitvector outdatasize)))"',
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
        """

        SHIFT_sema_str = f"""
        '"(define ({SHIFT_classname} a b shift %lanesize %datasize)"',
        '"(define dst (extract (+ (- (* %lanesize %datasize) 1) (* %datasize shift)) (* %datasize shift) (concat a b)))"',
        '"dst"',
        '")"',
        """

        SHUFFLELO_sema_str = f"""
        '"(define ({SHUFFLELO_classname} arg0 arg1 %lanesize %indatasize)"',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%inner.it (reverse (range 0 %lanesize 1))])"',
        '"(define %low (* %indatasize %inner.it))"',
        '"(define %high (+ %inner.it (- %indatasize 1)))"',
        '"(define %a (extract %high %low arg0))"',
        '"(define %b (extract %high %low arg1))"',
        '"(concat %a %b))))"',
        '"(extract (- (* %lanesize %indatasize) 1) 0 dst))"',
        """

        SHUFFLEHI_sema_str = f"""
        '"(define ({SHUFFLEHI_classname} arg0 arg1 %lanesize %indatasize)"',
        '"(define dst"',
        '"(apply concat"',
        '"(for/list ([%inner.it (reverse (range 0 %lanesize 1))])"',
        '"(define %low (* %indatasize %inner.it))"',
        '"(define %high (+ %inner.it (- %indatasize 1)))"',
        '"(define %a (extract %high %low arg0))"',
        '"(define %b (extract %high %low arg1))"',
        '"(concat %a %b))))"',
        '"(extract (- (* 2 (* %lanesize %indatasize)) 1) (* %lanesize %indatasize) dst))"',
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
        "concat_v16int16": {
        "target_instructions": {
            "concat_v16int16": {
                "args": ["SYMBOLIC_BV_256", "SYMBOLIC_BV_256", "16", "32", "16", "16"],
                "in_vectsize": 256,
                "out_vectsize": 512,
                "lanesize": 256,
                "in_precision": 16,
                "out_precision": 32,
                "in_vectsize_index": 2,
                "out_vectsize_index": 3,
                "in_lanesize_index": 2,
                "out_lanesize_index": 3,
                "in_precision_index": 4,
                "out_precision_index": 5,
                "arg_permute_map": [0, 1, -1, -1, -1, -1],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
            "concat_v32int8": {
                "args": ["SYMBOLIC_BV_256", "SYMBOLIC_BV_256", "32", "64", "8", "8"],
                "in_vectsize": 256,
                "out_vectsize": 512,
                "lanesize": 256,
                "in_precision": 8,
                "out_precision": 8,
                "in_vectsize_index": 2,
                "out_vectsize_index": 3,
                "in_lanesize_index": 2,
                "out_lanesize_index": 3,
                "in_precision_index": 4,
                "out_precision_index": 5,
                "arg_permute_map": [0, 1, -1, -1, -1, -1],
                "Signedness": 1,
                "Cost": "None",
                "SIMD": "True",
                "Extensions": "[]",
            },
        },
        "semantics": [
            '"(define (concat_v16int16 vecA vecB %inlanesize %outlanesize %inprec %outprec)"',
            '"(concat vecA vecB)"',
            '")"',
        ],
    },
        """
        
        )
        f.write(
            """
        "ups_to_v16acc32": {
        "target_instructions": {
            "ups_to_v16acc32": {
                "args": ["SYMBOLIC_BV_256"],
                "in_vectsize": 256,
                "out_vectsize": 512,
                "lanesize": 256,
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
            '"(define (ups_to_v16acc32 vec)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 16 1))])"',
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
       "srs_to_v16int16": {
        "target_instructions": {
            "srs_to_v16int16": {
                "args": ["SYMBOLIC_BV_1024"],
                "in_vectsize": 1024,
                "out_vectsize": 256,
                "lanesize": 1024,
                "in_precision": 64,
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
            '"(define (srs_to_v16int16 acc)"',
            '"(define dst"',
            '"(apply concat"',
            '"(for/list ([%i (reverse (range 0 16 1))])"',
            '"(define %low1 (* 64 %i))"',
            '"(define %high1 (+ %low1 (- 64 1)))"',
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
            f"""\t"{MULCONV_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in MULCONV_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{MULCONV_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{SHIFT_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in SHIFT_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{SHIFT_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{SHUFFLELO_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in SHUFFLELO_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{SHUFFLELO_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"{SHUFFLEHI_classname}"  : {{ 
    "target_instructions" : {{"""
        )
        for i in SHUFFLEHI_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{SHUFFLEHI_sema_str}]""")
        f.write("""\n\n},\n""")

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


def MULCONVInstEntry(InstName, Sema: AIESema):
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
    conv_dict = extract_conv_info(InstName)
    m = conv_dict["M"]
    n = conv_dict["N"]

    ret_str = f"""
    \t"{InstName}" : {{
    \t "args": ["SYMBOLIC_BV_{in_vectsize}", "SYMBOLIC_BV_{in_vectsize}", "{m}", "{n}" , "{in_lanesize}", "{lanesize}", "{in_datasize}", "{datasize}"],
                    "in_vectsize": {in_vectsize},
                    "out_vectsize": {out_vectsize},
                    "lanesize": {in_lanesize},
                    "in_precision": {in_datasize},
                    "out_precision": {datasize},
                    "in_vectsize_index": 4,
                    "out_vectsize_index": 5,
                    "in_lanesize_index": 4,
                    "out_lanesize_index": 5,
                    "in_precision_index": 6,
                    "out_precision_index": 7,
                    "arg_permute_map": [0, 1, -1, -1, -1, -1, -1, -1],
                    "Signedness": {int(all(param.is_signed for param in params))},
                    "Cost": "None",
                    "SIMD": "True",
                    "Extensions": "[]",
    }},"""
    return ret_str

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


def ShiftInstEntry(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]
    vectsize = lanesize * datasize

    ret_str = f"""
  \t"{InstName}" : {{
   \t "args": ["SYMBOLIC_BV_{vectsize}", "SYMBOLIC_BV_{vectsize}", "SYMBOLIC_BV_32", "{lanesize}", "{datasize}"],
                "in_vectsize": {vectsize},
                "out_vectsize": {vectsize},
                "lanesize": {lanesize},
                "in_precision": {datasize},
                "out_precision": {datasize},
                "in_vectsize_index": 3,
                "out_vectsize_index": 3,
                "in_lanesize_index": 3,
                "out_lanesize_index": 3,
                "in_precision_index": 4,
                "out_precision_index": 4,
                "arg_permute_map": [0, 1, 2, -1, -1],
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
