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


# TODO: Add results to first accumulator result when arguments are acc


def AddInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name})
    (define dst
    (apply concat
      (for/list ([%i (range 0 {lanesize} 1)])
        (define %low1 (* {datasize} %i))
        (define %high1 (+ %low1 (- {datasize} 1)))
        (define %ext_xbuff (extract %high1 %low1 {params[0].type}_{params[0].name}))
        (define %low2 (* {datasize} %i))
        (define %high2 (+ %low2 (- {datasize} 1)))
        (define %ext_ybuff (extract %high2 %low2 {params[1].type}_{params[1].name}))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    """
    return ret_str


def SubInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name})
    (define dst
    (apply concat
      (for/list ([%i (range 0 {lanesize} 1)])
        (define %low1 (* {datasize} %i))
        (define %high1 (+ %low1 (- {datasize} 1)))
        (define %ext_xbuff (extract %high1 %low1 {params[0].type}_{params[0].name}))
        (define %low2 (* {datasize} %i))
        (define %high2 (+ %low2 (- {datasize} 1)))
        (define %ext_ybuff (extract %high2 %low2 {params[1].type}_{params[1].name}))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    """
    return ret_str


def NegInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name})
    (define dst
    (apply concat
      (for/list ([%i (range 0 {lanesize} 1)])
        (define %low1 (* {datasize} %i))
        (define %high1 (+ %low1 (- {datasize} 1)))
        (define %ext_xbuff (extract %high1 %low1 {params[0].type}_{params[0].name}))
        (define %o (bvneg %ext_xbuff))
        %o
      )
    )
    )
    dst
    )
    """
    return ret_str


def EltwiseMacInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    param_ty_info = extract_info(params[0].type)

    param_lanesize = param_ty_info["NumLanes"]
    param_datasize = param_ty_info["SizeOfElement"]
    ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name} {params[2].type}_{params[2].name})
    (define dst
    (apply concat
    (for/list ([%i (reverse (range 0 {lanesize} 1))])
    (define %low1 (* {param_datasize} %i))
    (define %high1 (+ %low1 (- {param_datasize} 1)))
    (define %ext_a (sign-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {datasize})))
    (define %low2 (* {param_datasize} %i))
    (define %high2 (+ %low2 (- {param_datasize} 1)))
    (define %ext_b (sign-extend (extract %high2 %low2 {params[1].type}_{params[1].name}) (bitvector {datasize})))
    (define %low3 (* {datasize} %i))
    (define %high3 (+ %low3 (- {datasize} 1)))
    (define %ext_c (extract %high3 %low3 {params[2].type}_{params[2].name}))
    (define %o (bvadd %ext_c (bvmul %ext_a %ext_b)))
    %o
    )
    )
    )
    dst
    )
    """
    return ret_str


def AddMacInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    param0_ty_info = extract_info(params[0].type)
    param1_ty_info = extract_info(params[1].type)

    param0_lanesize = param0_ty_info["NumLanes"]
    param0_datasize = param0_ty_info["SizeOfElement"]

    param1_lanesize = param1_ty_info["NumLanes"]
    param1_datasize = param1_ty_info["SizeOfElement"]

    ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name} {params[2].type}_{params[2].name} {params[3].type}_{params[3].name})
    (define dst
    (apply concat
    (for/list ([%i (reverse (range 0 {lanesize} 1))])
    (define %low1 (* {param0_datasize} %i))
    (define %high1 (+ %low1 (- {param0_datasize} 1)))
    (define %ext_a (sign-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {param1_datasize})))
    (define %low2 (* {param1_datasize} %i))
    (define %high2 (+ %low2 (- {param1_datasize} 1)))
    (define %ext_b (sign-extend (extract %high2 %low2 {params[1].type}_{params[1].name}) (bitvector {datasize})))
    (define %low3 (* {datasize} %i))
    (define %high3 (+ %low3 (- {datasize} 1)))
    (define %ext_c (extract %high3 %low3 {params[2].type}_{params[2].name}))
    (define %low4 (* {datasize} %i))
    (define %high4 (+ %low4 (- {datasize} 1)))
    (define %ext_d (extract %high4 %low4 {params[3].type}_{params[3].name}))
    (define %o (bvadd %ext_d (bvadd %ext_c (bvmul %ext_a %ext_b))))
    %o
    )
    )
    )
    dst
    )
    """
    return ret_str


def EltwiseMulInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info["NumLanes"]
    datasize = ret_ty_info["SizeOfElement"]

    param_ty_info = extract_info(params[0].type)

    param_lanesize = param_ty_info["NumLanes"]
    param_datasize = param_ty_info["SizeOfElement"]
    if Sema.conf:
        if len(params) == 3:
            ret_str = f"""
        (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name} {params[2].type}_{params[2].name})
        (define dst
        (apply concat
          (for/list ([%i (range 0 {lanesize} 1)])
            (define %low1 (* {param_datasize} %i))
            (define %high1 (+ %low1 (- {param_datasize} 1)))
            (define %ext_xbuff (sign-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {datasize})))
            (define %low2 (* {param_datasize} %i))
            (define %high2 (+ %low2 (- {datasize} 1)))
            (define %ext_ybuff (sign-extend (extract %high2 %low2 {params[1].type}_{params[1].name}) (bitvector {datasize})))
            (define %o (bvmul %ext_xbuff %ext_ybuff))
            %o
          )
        )
        )
        (if ({params[2].type}_{params[2].name}) (bvneg dst) dst)
        )
        """

    elif len(params) == 4:
        ret_str = f"""
        (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name} {params[2].type}_{params[2].name} {params[3].type}_{params[3].name})
        (define dst
        (apply concat
          (for/list ([%i (range 0 {lanesize} 1)])
            (define %low1 (* {param_datasize} %i))
            (define %high1 (+ %low1 (- {param_datasize} 1)))
            (define %ext_xbuff 
            (if ({params[1].type}_{params[1].name})
              (sign-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {datasize}))
              (zero-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {datasize}))
              )
            )
            (define %low2 (* {param_datasize} %i))
            (define %high2 (+ %low2 (- {datasize} 1)))
            (define %ext_ybuff
              (if ({params[3].type}_{params[3].name})
              (sign-extend (extract %high2 %low2 {params[2].type}_{params[2].name}) (bitvector {datasize}))
              (zero-extend (extract %high2 %low2 {params[2].type}_{params[2].name}) (bitvector {datasize}))
              )
            )
            (define %o (bvmul %ext_xbuff %ext_ybuff))
            %o
          )
        )
        )
        dst
        )
        """

    else:
        ret_str = f"""
    (define ({InstName} {params[0].type}_{params[0].name} {params[1].type}_{params[1].name})
    (define dst
    (apply concat
      (for/list ([%i (range 0 {lanesize} 1)])
        (define %low1 (* {param_datasize} %i))
        (define %high1 (+ %low1 (- {param_datasize} 1)))
        (define %ext_xbuff (sign-extend (extract %high1 %low1 {params[0].type}_{params[0].name}) (bitvector {datasize})))
        (define %low2 (* {param_datasize} %i))
        (define %high2 (+ %low2 (- {datasize} 1)))
        (define %ext_ybuff (sign-extend (extract %high2 %low2 {params[1].type}_{params[1].name}) (bitvector {datasize})))
        (define %o (bvmul %ext_xbuff %ext_ybuff))
        %o
      )
    )
    )
    dst
    )
    """
    return ret_str


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
        f.write("""aie_sema = {\n""")
        f.write(
            f"""\t"add_v16acc64"  : {{ 
    "target_instructions" : {{"""
        )
        for i in ADD_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{ADD_sema_str}]""")
        f.write("""\n\n},\n""")

        f.write(
            f"""\t"sub_v16acc64"  : {{ 
    "target_instructions" : {{"""
        )
        for i in SUB_entries:
            f.write(f"""\t\t{i}""")
        f.write("""\n},""")
        f.write(f""" "semantics": [{SUB_sema_str}]""")
        f.write("""\n}""")
        f.write("""\n}""")


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


def SemaToRosette(SemaList):
    with open(AIEROSETTEDIR + "aie_sema.rkt", "w") as f:
        f.write("""#lang rosette\n""")
        f.write("""(require \"bvops.rkt\")\n""")
        for inst, sema in SemaList.items():
            if sema.instclass == "ADD":
                f.write(f"{AddInstClass(inst, sema)}")
                # print(AddInstClass(inst, sema))

            if sema.instclass == "SUB":
                f.write(f"{SubInstClass(inst, sema)}")
                # print(SubInstClass(inst, sema))

            if sema.instclass == "NEG":
                f.write(f"{NegInstClass(inst, sema)}")
                # print(NegInstClass(inst, sema))

            if sema.instclass == "ELTMAC":
                f.write(f"{EltwiseMacInstClass(inst, sema)}")

            if sema.instclass == "ADDMAC":
                f.write(f"{AddMacInstClass(inst, sema)}")

            if sema.instclass == "ELTMUL":
                f.write(f"{EltwiseMulInstClass(inst, sema)}")
                # print(EltwiseMulInstClass(inst, sema))

    f.close()


if __name__ == "__main__":
    # SemaToRosette(AllSema)
    SemaToDict(AllSema)
