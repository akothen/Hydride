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
                "Extensions" : "[]",
            },

        },
        "semantics": ['"(define (v16int32_add16 xbuff ybuff)"','"(define dst"','"(apply concat"','"(for/list ([%i (reverse (range 0 16 1))])"','"(define %low1 (* 32 %i))"','"(define %high1 (+ %low1 (- 32 1)))"','"(define %ext_xbuff (extract %high1 %low1 xbuff))"','"(define %low2 (* 32 %i))"','"(define %high2 (+ %low2 (- 32 1)))"','"(define %ext_ybuff (extract %high2 %low2 ybuff))"','"(define %o (bvadd %ext_xbuff %ext_ybuff))"','" %o"','")"','")"','")"','"dst"','")"']
    },

    "v8int32_add8" : {
        "target_instructions" : {
            "v8int32_add8" : {
                "args" : ["SYMBOLIC_BV_256", "SYMBOLIC_BV_256"],
                "in_vectsize" : 256,
                "out_vectsize" : 256,
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
                "Extensions" : "[]",
            },

        },
        "semantics": ['"(define (v8int32_add8 xbuff ybuff)"','"(define dst"','"(apply concat"','"(for/list ([%i (reverse (range 0 8 1))])"','"(define %low1 (* 32 %i))"','"(define %high1 (+ %low1 (- 32 1)))"','"(define %ext_xbuff (extract %high1 %low1 xbuff))"','"(define %low2 (* 32 %i))"','"(define %high2 (+ %low2 (- 32 1)))"','"(define %ext_ybuff (extract %high2 %low2 ybuff))"','"(define %o (bvadd %ext_xbuff %ext_ybuff))"','" %o"','")"','")"','")"','"dst"','")"']
    },

    "v16int32_sub16" : {
        "target_instructions" : {
            "v16int32_sub16" : {
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
                "Extensions" : "[]",
            },

        },
        "semantics": ['"(define (v16int32_sub16 xbuff ybuff)"','"(define dst"','"(apply concat"','"(for/list ([%i (reverse (range 0 16 1))])"','"(define %low1 (* 32 %i))"','"(define %high1 (+ %low1 (- 32 1)))"','"(define %ext_xbuff (extract %high1 %low1 xbuff))"','"(define %low2 (* 32 %i))"','"(define %high2 (+ %low2 (- 32 1)))"','"(define %ext_ybuff (extract %high2 %low2 ybuff))"','"(define %o (bvsub %ext_xbuff %ext_ybuff))"','" %o"','")"','")"','")"','"dst"','")"']
    },

    "v8acc80_mul32" : {
        "target_instructions" : {
            "v8acc80_mul32" : {
                "args" : ["SYMBOLIC_BV_256", "SYMBOLIC_BV_256"],
                "in_vectsize" : 256,
                "out_vectsize" : 640,
                "lanesize" : 32,
                "in_precision" : 32,
                "out_precision" : 80,
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
                "Extensions" : "[]",
            },

        },
        "semantics": ["(define (v8acc80_mul32 xbuff ybuff)"," (define dst"," (apply concat"," (for/list ([%i (reverse (range 0 8 1))])"," (define %low1 (* 32 %i))"," (define %high1 (+ %low1 (- 32 1)))"," (define %ext_xbuff1 (sign-extend (extract %high1 %low1 xbuff) (bitvector 48)))"," (define %low2 (* 32 %i))"," (define %high2 (+ %low2 (- 32 1)))"," (define %ext_xbuff2 (sign-extend (extract %high2 %low2 ybuff) (bitvector 48)))"," (define %o (sign-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 80)))"," %o"," )"," )"," )"," dst ",")"]
    },

    "srs" : {
        "target_instructions" : {
            "srs" : {
                "args" : ["SYMBOLIC_BV_640"],
                "in_vectsize" : 640,
                "out_vectsize" : 256,
                "lanesize" : 80,
                "in_precision" : 80,
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
                "Extensions" : "[]",
            },

        },
        "semantics": ["(define (srs xbuff)","(define dst","(apply concat","(for/list ([%i (reverse (range 0 8 1))])","(define %low1 (* 32 %i))","(define %high1 (+ %low1 (- 32 1)))","(define %o (extract %high1 %low1 xbuff))","%o",")",")",")","dst ",")"]
    },

}


