#============================== Hydride File =================================
#
# Part of the Hydride Compiler Infrastructure.
# <Placeholder for license information>
#
#=============================================================================
#
# Do NOT modify this file. It is automatically generated.
#
#=============================================================================




aie_sema = {

    "v16int32_add16" : {
        "target_instructions" : {
            "v16int32_add16" : {
                "args" : ["SYMBOLIC_BV_512", "SYMBOLIC_BV_512"],
                "in_vectsize" : 512,
                "out_vectsize" : 512,
                "lanesize" : 32,
                "in_precision" : 32,
                "out_precision" : 32,
                "in_vectsize_index" : None,
                "out_vectsize_index" : None,
                "in_lanesize_index" : None,
                "out_lanesize_index" : None,
                "in_precision_index" : None,
                "out_precision_index" : None,
                "arg_permute_map" : [0,1,-1,-1,-1,-1,-1,-1,-1],
                "Signedness" : 1,
                "Cost" : "None",
                "SIMD" : "True",
                "Extensions" : "['avx512f']",
            },

        },
        "semantics": ['"(define (v16int32_add16 xbuff ybuff)"','"(define dst"','"(apply concat"','"(for/list ([%i (reverse (range 0 16 1))])"','"(define %low1 (* 32 %i))"','"(define %high1 (+ %low1 (- 32 1)))"','"(define %ext_xbuff (extract %high1 %low1 xbuff))"','"(define %low2 (* 32 %i))"','"(define %high2 (+ %low2 (- 32 1)))"','"(define %ext_ybuff (extract %high2 %low2 ybuff))"','"(define %o (bvadd %ext_xbuff %ext_ybuff))"','" %o"','")"','")"','")"','"dst"','")"']
    },
}


