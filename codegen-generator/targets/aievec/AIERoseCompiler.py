from AIEMeta import *
from AIEAllSema import AllSema

import re

def extract_info(s):
    pattern = r"v(?P<NumLanes>\d+)(?P<signed>u?)(?P<Type>int|acc)(?P<SizeOfElement>\d+)"
    match = re.match(pattern, s)
    
    if match:
        dtype = match.group("Type")
        is_signed = dtype == "acc" or match.group("signed") != "u"  # Always True if "acc"

        return {
            "NumLanes": int(match.group("NumLanes")),
            "signed": is_signed,
            "Type": dtype,
            "SizeOfElement": int(match.group("SizeOfElement"))
        }
    return None

# TODO: Add results to first accumulator result when arguments are acc

def AddInstClass(InstName, Sema: AIESema):
    params = Sema.params
    ret_ty_info = extract_info(Sema.rettype)
    lanesize = ret_ty_info['NumLanes']
    datasize = ret_ty_info['SizeOfElement']

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
    lanesize = ret_ty_info['NumLanes']
    datasize = ret_ty_info['SizeOfElement']

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
    lanesize = ret_ty_info['NumLanes']
    datasize = ret_ty_info['SizeOfElement']

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

def SemaToRosette(SemaList):
    for inst, sema in SemaList.items():
        if sema.instclass == "ADD":
            print(AddInstClass(inst, sema))
        
        if sema.instclass == "SUB":
            print(SubInstClass(inst, sema))

        if sema.instclass == "NEG":
            print(NegInstClass(inst, sema))

if __name__ == "__main__":
    print(SemaToRosette(AllSema))