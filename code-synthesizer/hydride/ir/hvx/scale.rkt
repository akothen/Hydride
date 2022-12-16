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
            [ (hexagon_V6_vmpabuuv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_o num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29)
             (
              hexagon_V6_vmpabuuv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              prec_o
              num_20
              num_21
              num_22
              num_23
              num_24
              num_25
              num_26
              num_27
              num_28
              num_29
              )
             ]
            [ (hexagon_V6_vmpyiwb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (
              hexagon_V6_vmpyiwb_128B_dsl
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
            [ (hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
             (
              hexagon_V6_vsathub_128B_dsl
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
            [ (hexagon_V6_vasruhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
             (
              hexagon_V6_vasruhubsat_128B_dsl
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
            [ (hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (
              hexagon_V6_vswap_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              vc_3
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
            [ (hexagon_V6_vgtuh_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (
              hexagon_V6_vgtuh_128B_dsl
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
            [ (hexagon_V6_vaddbq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vaddbq_128B_dsl
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
            [ (hexagon_V6_veqb_or_128B_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (
              hexagon_V6_veqb_or_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
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
              )
             ]
            [ (hexagon_V6_vmpabuu_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 prec_o num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33)
             (
              hexagon_V6_vmpabuu_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
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
              prec_o
              num_22
              num_23
              num_24
              num_25
              num_26
              num_27
              num_28
              num_29
              num_30
              num_31
              num_32
              num_33
              )
             ]
            [ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              hexagon_V6_vmpyiewh_acc_128B_dsl
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
            [ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              hexagon_V6_vmpyowh_rnd_sacc_128B_dsl
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
            [ (hexagon_V6_veqb_and_128B_dsl v0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (
              hexagon_V6_veqb_and_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
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
            [ (hexagon_V6_veqw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              hexagon_V6_veqw_xor_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              vc_3
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
            [ (hexagon_V6_vgth_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vgth_and_128B_dsl
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
            [ (hexagon_V6_vaddw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vaddw_128B_dsl
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
            [ (hexagon_V6_vsubhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (
              hexagon_V6_vsubhw_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              prec_o
              (* scale-factor num_15)
              num_16
              num_17
              num_18
              num_19
              num_20
              )
             ]
            [ (hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 prec_i_o num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39 num_40)
             (
              hexagon_V6_vmpauhb_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              num_8
              (* scale-factor num_9)
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
              num_24
              prec_i_o
              num_26
              num_27
              num_28
              num_29
              num_30
              num_31
              num_32
              num_33
              num_34
              num_35
              num_36
              num_37
              num_38
              num_39
              num_40
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
            [ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (
              hexagon_V6_vmpyhsat_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              prec_i_o
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              num_24
              num_25
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
            [ (hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vandqrt_128B_dsl
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
            [ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              hexagon_V6_vmpybusv_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              num_6
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_i_o
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
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
            [ (hexagon_V6_vavgubrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vavgubrnd_128B_dsl
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
            [ (hexagon_V6_vavguh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vavguh_128B_dsl
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
            [ (hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              hexagon_V6_vshuffob_128B_dsl
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
            [ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (
              hexagon_V6_vmpyub_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              num_17
              prec_i_o
              num_19
              num_20
              num_21
              num_22
              num_23
              num_24
              num_25
              num_26
              num_27
              num_28
              )
             ]
            [ (hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              hexagon_V6_vshufoeh_128B_dsl
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
              (* scale-factor num_14)
              num_15
              num_16
              num_17
              )
             ]
            [ (hexagon_V6_vmpahb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 prec_o num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 prec_i num_35 num_36 num_37)
             (
              hexagon_V6_vmpahb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
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
              prec_o
              num_24
              num_25
              num_26
              num_27
              num_28
              num_29
              num_30
              num_31
              num_32
              num_33
              prec_i
              num_35
              num_36
              num_37
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
            [ (hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vandnqrt_128B_dsl
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
              num_11
              )
             ]
            [ (hexagon_V6_vasrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vasrwv_128B_dsl
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
            [ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
             (
              hexagon_V6_vandvrt_128B_dsl
              vc_0
              vc_1
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
              num_13
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
            [ (hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vlsrh_128B_dsl
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
            [ (hexagon_V6_vsubh_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vsubh_dv_128B_dsl
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
              )
             ]
            [ (hexagon_V6_vpackwh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
             (
              hexagon_V6_vpackwh_sat_128B_dsl
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
            [ (hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vroundwuh_128B_dsl
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
            [ (hexagon_V6_vaslwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vaslwv_128B_dsl
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
            [ (hexagon_V6_vabsw_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (
              hexagon_V6_vabsw_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              )
             ]
            [ (hexagon_V6_vshufeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              hexagon_V6_vshufeh_128B_dsl
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
            [ (hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vmaxw_128B_dsl
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
            [ (hexagon_V6_vshuffb_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (
              hexagon_V6_vshuffb_128B_dsl
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
            [ (hexagon_V6_vasrwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
             (
              hexagon_V6_vasrwuhsat_128B_dsl
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
            [ (hexagon_V6_vandnqrt_acc_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              hexagon_V6_vandnqrt_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
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
            [ (hexagon_V6_vnavgub_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (
              hexagon_V6_vnavgub_128B_dsl
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
            [ (hexagon_V6_vmpybus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (
              hexagon_V6_vmpybus_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_o
              (* scale-factor num_17)
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              num_24
              num_25
              )
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 prec_i_o num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36)
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
              num_8
              (* scale-factor num_9)
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
              prec_i_o
              num_24
              num_25
              num_26
              num_27
              num_28
              num_29
              num_30
              num_31
              num_32
              num_33
              num_34
              num_35
              num_36
              )
             ]
            [ (hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              hexagon_V6_vmpyowh_128B_dsl
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
            [ (hexagon_V6_vaddhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (
              hexagon_V6_vaddhw_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              prec_o
              (* scale-factor num_15)
              num_16
              num_17
              num_18
              num_19
              num_20
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
            [ (hexagon_V6_vmux_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vmux_128B_dsl
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
              )
             ]
            [ (hexagon_V6_vaddb_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vaddb_dv_128B_dsl
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
            [ (hexagon_V6_vsubububb_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              hexagon_V6_vsubububb_sat_128B_dsl
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
            [ (hexagon_V6_vsubbnq_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              hexagon_V6_vsubbnq_128B_dsl
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
            [ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vandqrt_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              vc_2
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
            [ (hexagon_V6_vpackhub_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i num_18 num_19 num_20)
             (
              hexagon_V6_vpackhub_sat_128B_dsl
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
            [ (hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (
              hexagon_V6_vdealb_128B_dsl
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
            [ (hexagon_V6_vadduhw_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              hexagon_V6_vadduhw_acc_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (hvx:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              num_6
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_i_o
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              )
             ]
            [ (hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vunpackob_128B_dsl
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
            [ (hexagon_V6_vgtw_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              hexagon_V6_vgtw_or_128B_dsl
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
            [ (hexagon_V6_vsh_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
             (
              hexagon_V6_vsh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              num_4
              num_5
              num_6
              (* scale-factor num_7)
              prec_i
              num_9
              num_10
              num_11
              prec_o
              (* scale-factor num_13)
              num_14
              num_15
              num_16
              num_17
              )
             ]
            [ (hexagon_V6_vasrhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              hexagon_V6_vasrhubrndsat_128B_dsl
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
            [ (hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              hexagon_V6_vmpyh_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              num_14
              prec_o
              (* scale-factor num_16)
              num_17
              num_18
              num_19
              num_20
              num_21
              num_22
              )
             ]
            [ (hexagon_V6_vlsrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (
              hexagon_V6_vlsrhv_128B_dsl
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
            [ (hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (
              hexagon_V6_vmpybv_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              (hvx:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              (* scale-factor num_8)
              prec_i
              num_10
              num_11
              num_12
              num_13
              prec_o
              (* scale-factor num_15)
              num_16
              num_17
              num_18
              num_19
              num_20
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
            [ (hexagon_V6_veqb_128B_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (
              hexagon_V6_veqb_128B_dsl
              (hvx:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hvx:scale-expr v3 scale-factor)
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
            [ (hexagon_V6_vabsb_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (
              hexagon_V6_vabsb_sat_128B_dsl
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
            [ (hexagon_V6_vandvqv_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              hexagon_V6_vandvqv_128B_dsl
              vc_0
              (hvx:scale-expr v1 scale-factor)
              vc_2
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
            [ (hexagon_V6_vunpackuh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (
              hexagon_V6_vunpackuh_128B_dsl
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
            [_ (error "Unrecognized expression")]
            )
  )

;; ================================================================================
