#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (hvx:scale-expr prog scale-factor)
  (destruct prog
            [(reg id) (reg id) ]
            [(lit v) (lit v)]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (
              vector-two-input-swizzle_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              num_2
              prec_i_o
              num_4
              num_5
              num_6
              num_7
              num_8
              )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (
              interleave-vectors_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (
              interleave-vector_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (
              deinterleave-vector_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (
              llvm_shuffle_vectors_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              num_2
              prec_i_o
              (hvx:scale-expr v4 scale-factor)
              num_5
              )
             ]
            [ (hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vandqrt_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              vc_3
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              num_6
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vmpyieoh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i
              prec_o
              num_9
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vpackhb_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i num_18 num_19 num_20)
             (
              hexagon_V6_vpackhb_sat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_o
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              prec_i
              num_18
              num_19
              num_20
              )
             ]
            [ (hexagon_V6_vdealh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (
              hexagon_V6_vdealh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              num_2
              num_3
              num_4
              prec_i_o
              num_6
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              hexagon_V6_veqw_or_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyih_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vgtuh_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vgtuh_xor_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vandnqrt_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vandnqrt_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              )
             ]
            [ (hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vaslh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vasrwhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
             (
              hexagon_V6_vasrwhsat_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_o
              num_9
              num_10
              prec_i
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              hexagon_V6_vaslw_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vaddbsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vaddbsat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_vasrwhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
             (
              hexagon_V6_vasrwhrndsat_128B_dsl
              vc_0
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_o
              num_11
              num_12
              num_13
              prec_i
              num_15
              num_16
              num_17
              num_18
              num_19
              )
             ]
            [ (hexagon_V6_vaddhnq_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vaddhnq_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vadduhsat_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vadduhsat_dv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vsubhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vsubhw_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vmpyhv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vmpyhv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vnavgh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vnavgh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vlsrb_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vlsrb_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vunpackoh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              )
             ]
            [ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              hexagon_V6_vmpyiewuh_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              hexagon_V6_vmpahb_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              )
             ]
            [ (hexagon_V6_vaddhw_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vaddhw_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vmpyewuh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vpackob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              hexagon_V6_vpackob_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (hexagon_V6_vroundhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vroundhub_128B_dsl
              vc_0
              vc_1
              vc_2
              vc_3
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_o
              num_11
              num_12
              num_13
              prec_i
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (hexagon_V6_vasrhbrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              hexagon_V6_vasrhbrndsat_128B_dsl
              vc_0
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_o
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_i
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              )
             ]
            [ (hexagon_V6_vmpyubv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyubv_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (
              hexagon_V6_vlsrw_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              )
             ]
            [ (hexagon_V6_vsubw_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vsubw_dv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vgtb_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
             (
              hexagon_V6_vgtb_or_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_o
              num_10
              prec_i
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
             (
              hexagon_V6_vandvrt_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_o
              prec_i
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vdealb4w_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              num_7
              num_8
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vmpyiowh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              num_6
              prec_i_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vshufoeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vshufoeb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (
              hexagon_V6_vasrwh_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_o
              num_9
              prec_i
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              hexagon_V6_vmpabus_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              )
             ]
            [ (hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
             (
              hexagon_V6_vmpyewuh_64_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              num_7
              num_8
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              prec_o
              (* scale-factor num_18)
              num_19
              num_20
              num_21
              num_22
              prec_i
              num_24
              )
             ]
            [ (hexagon_V6_veqb_128B_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (
              hexagon_V6_veqb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              vc_2
              vc_3
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_o
              prec_i
              num_10
              num_11
              )
             ]
            [ (hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (
              hexagon_V6_lo_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              (* scale-factor num_6)
              num_7
              )
             ]
            [ (hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (
              hexagon_V6_vmpyub_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              )
             ]
            [ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyuhe_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              hexagon_V6_vpackeh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vmpyiwh_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (hexagon_V6_vshufoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              hexagon_V6_vshufoh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
             (
              hexagon_V6_vcombine_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              num_6
              num_7
              (* scale-factor num_8)
              prec_i_o
              (* scale-factor num_10)
              num_11
              )
             ]
            [ (hexagon_V6_vmux_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vmux_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              )
             ]
            [ (hexagon_V6_vabsb_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (
              hexagon_V6_vabsb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              )
             ]
            [ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vavguhrnd_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vasrh_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vlsrwv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              hexagon_V6_vandnqrt_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              prec_i_o
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              hexagon_V6_vasrw_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vmpyuh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyuh_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              hexagon_V6_vmpybus_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              )
             ]
            [ (hexagon_V6_veqb_and_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (
              hexagon_V6_veqb_and_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              vc_3
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_o
              prec_i
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vsubwnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vsubwnq_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              vc_3
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vandvqv_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vandvqv_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              )
             ]
            [ (hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              hexagon_V6_vandvnqv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              num_7
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vaddhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vaddhw_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_hi_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (
              hexagon_V6_hi_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              )
             ]
            [ (hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vmpyih_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vmpyiwub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyiwub_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              (* scale-factor num_5)
              num_6
              prec_i_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (
              hexagon_V6_vaslw_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              )
             ]
            [ (hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (
              hexagon_V6_vabsw_sat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              num_7
              )
             ]
            [ (hexagon_V6_vmpyowh_rnd_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vmpyowh_rnd_128B_dsl
              vc_0
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              num_9
              prec_i_o
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              hexagon_V6_vmpabusv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (hexagon_V6_vsubuwsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vsubuwsat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_vunpackub_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (
              hexagon_V6_vunpackub_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i
              prec_o
              num_7
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (
              hexagon_V6_vmpabus_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              num_19
              )
             ]
            [ (hexagon_V6_vmaxuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vmaxuh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_vandqrt_128B_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vandqrt_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              vc_2
              vc_3
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vasrhv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vmpyiewuh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              num_6
              prec_i_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vminh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vminh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_vmpyowh_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              hexagon_V6_vmpyowh_sacc_128B_dsl
              vc_0
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              num_10
              prec_i_o
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              )
             ]
            [ (hexagon_V6_vgtuh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vgtuh_and_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
             (
              hexagon_V6_vandvrt_128B_dsl
              vc_0
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_o
              prec_i
              num_11
              num_12
              num_13
              )
             ]
            [ (hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vaslhv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vavgub_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vavgub_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_veqw_xor_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              hexagon_V6_veqw_xor_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
              (hvx:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              prec_i_o
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vmpyuhe_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              (* scale-factor num_5)
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vmpahb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 num_21)
             (
              hexagon_V6_vmpahb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              prec_i
              num_20
              num_21
              )
             ]
            [ (hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vaslh_acc_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vgtub_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (
              hexagon_V6_vgtub_128B_dsl
              vc_0
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_o
              num_9
              prec_i
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vabsdiffh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
             (
              hexagon_V6_vpackwuh_sat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_o
              num_10
              num_11
              num_12
              num_13
              num_14
              prec_i
              num_16
              num_17
              num_18
              )
             ]
            [ (hexagon_V6_vswap_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (
              hexagon_V6_vswap_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              prec_i_o
              (* scale-factor num_15)
              num_16
              num_17
              )
             ]
            [ (hexagon_V6_vsatwh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
             (
              hexagon_V6_vsatwh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_o
              num_7
              num_8
              prec_i
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vzh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
             (
              hexagon_V6_vzh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              num_2
              num_3
              num_4
              prec_i
              prec_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (hexagon_V6_vasrhbsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
             (
              hexagon_V6_vasrhbsat_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (hvx:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_o
              num_9
              num_10
              num_11
              num_12
              prec_i
              num_14
              num_15
              num_16
              num_17
              )
             ]
            [ (hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (
              hexagon_V6_vshuffh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              num_2
              num_3
              num_4
              prec_i_o
              num_6
              num_7
              num_8
              )
             ]
            [ (hexagon_V6_vmpyuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vmpyuh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              num_12
              )
             ]
            [ (hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              hexagon_V6_vshuffeb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              num_9
              )
             ]
            [ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vaddcarrysat_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (hexagon_V6_vrounduwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vrounduwuh_128B_dsl
              vc_0
              vc_1
              vc_2
              vc_3
              (hvx:scale-expr v4 scale-factor)
              (hvx:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_o
              num_11
              num_12
              num_13
              prec_i
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [_ (error "Unrecognized expression")]
            )
  )