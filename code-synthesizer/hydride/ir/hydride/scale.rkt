#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (hydride:scale-expr prog scale-factor)
  (destruct prog
            [(reg id) (reg id) ]
            [(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (
              vector-two-input-swizzle_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (
              interleave-vector_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (
              deinterleave-vector_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              )
             ]
            [ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (
              llvm_shuffle_vectors_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              num_2
              prec_i_o
              (hydride:scale-expr v4 scale-factor)
              num_5
              )
             ]
            [ (_mm512_rem_epu32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm512_rem_epu32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm512_or_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (
              _mm512_or_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              )
             ]
            [ (_mm256_mask_min_epi8_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              _mm256_mask_min_epi8_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm256_xor_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (
              _mm256_xor_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              )
             ]
            [ (_mm_add_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              _mm_add_si64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
            [ (_m_packssdw_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (
              _m_packssdw_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              prec_i
              (* scale-factor num_15)
              num_16
              num_17
              )
             ]
            [ (_mm512_maskz_packus_epi32_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (
              _mm512_maskz_packus_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              num_6
              num_7
              num_8
              num_9
              num_10
              num_11
              num_12
              (* scale-factor size_i_o)
              (* scale-factor num_14)
              num_15
              (* scale-factor num_16)
              prec_i_o
              num_18
              num_19
              num_20
              num_21
              num_22
              num_23
              num_24
              num_25
              num_26
              num_27
              )
             ]
            [ (_mm256_xor_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm256_xor_si256_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              _mm_rolv_epi32_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (_mm_maskz_srl_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (
              _mm_maskz_srl_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
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
              )
             ]
            [ (_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16)
             (
              _mm512_maskz_avg_epu16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              prec_i_o
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (_mm512_mask_rolv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (
              _mm512_mask_rolv_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              prec_i_o
              num_12
              num_13
              num_14
              num_15
              )
             ]
            [ (_mm_hadd_pi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm_hadd_pi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
            [ (_mm512_unpacklo_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (
              _mm512_unpacklo_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm256_cvtepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o prec_i num_7 num_8)
             (
              _mm256_cvtepi64_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_o
              prec_i
              num_7
              num_8
              )
             ]
            [ (_mm256_max_epu64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm256_max_epu64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm_unpacklo_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              _mm_unpacklo_pi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              )
             ]
            [ (_mm512_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15)
             (
              _mm512_srav_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              prec_i_o
              num_14
              num_15
              )
             ]
            [ (_mm_unpacklo_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              _mm_unpacklo_pi8_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (_mm_mask_mul_epu32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17)
             (
              _mm_mask_mul_epu32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              num_8
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              num_15
              num_16
              num_17
              )
             ]
            [ (_mm256_mul_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (
              _mm256_mul_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              prec_i
              prec_o
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm256_mask_testn_epi32_mask_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 vc_6 v7 size_i_o num_9 num_10 num_11 prec_o num_13 prec_i num_15 num_16)
             (
              _mm256_mask_testn_epi32_mask_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              vc_6
              (hydride:scale-expr v7 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_9)
              num_10
              (* scale-factor num_11)
              prec_o
              num_13
              prec_i
              num_15
              num_16
              )
             ]
            [ (_mm_rorv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              _mm_rorv_epi32_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (_mm512_mulhi_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (
              _mm512_mulhi_epu16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm_mul_su32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (
              _mm_mul_su32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              )
             ]
            [ (_mm_broadcast_i32x2_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (
              _mm_broadcast_i32x2_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              num_7
              num_8
              )
             ]
            [ (_mm_mask_ror_epi32_dsl vc_0 v1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              _mm_mask_ror_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              prec_i_o
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              )
             ]
            [ (_mm_mask_rol_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              _mm_mask_rol_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              prec_i_o
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              )
             ]
            [ (_mm_hadd_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (
              _mm_hadd_pi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm256_mask_cmpeq_epu8_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 size_i_o num_8 num_9 num_10 prec_o num_12 prec_i num_14 num_15)
             (
              _mm256_mask_cmpeq_epu8_mask_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              vc_6
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              prec_o
              num_12
              prec_i
              num_14
              num_15
              )
             ]
            [ (_mm512_sll_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (
              _mm512_sll_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              )
             ]
            [ (_mm_sign_pi16_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (
              _mm_sign_pi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              )
             ]
            [ (_mm512_mask_sll_epi64_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (
              _mm512_mask_sll_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              prec_i_o
              num_18
              num_19
              )
             ]
            [ (_mm_add_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm_add_pi8_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm512_mask_srav_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20)
             (
              _mm512_mask_srav_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              vc_6
              vc_7
              (hydride:scale-expr v8 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_10)
              num_11
              (* scale-factor num_12)
              num_13
              num_14
              num_15
              num_16
              num_17
              prec_i_o
              num_19
              num_20
              )
             ]
            [ (_mm_hsub_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (
              _mm_hsub_pi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              num_3
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm256_mulhrs_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              _mm256_mulhrs_epi16_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm256_mask_madd52hi_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              _mm256_mask_madd52hi_epu64_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              num_8
              num_9
              num_10
              num_11
              prec_i_o
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
            [ (_mm512_mask_extracti64x4_epi64_dsl v0 vc_1 vc_2 v3 vc_4 v5 v6 num_7 num_8 num_9 num_10 num_11 size_i_o num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (
              _mm512_mask_extracti64x4_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              vc_4
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              num_7
              num_8
              num_9
              num_10
              num_11
              (* scale-factor size_i_o)
              (* scale-factor num_13)
              num_14
              (* scale-factor num_15)
              prec_i_o
              num_17
              (* scale-factor num_18)
              num_19
              num_20
              num_21
              (* scale-factor num_22)
              num_23
              num_24
              num_25
              )
             ]
            [ (_mm512_sra_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (
              _mm512_sra_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (* scale-factor size_i_o)
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              prec_i_o
              num_15
              num_16
              num_17
              )
             ]
            [ (_mm256_maskz_max_epi32_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              _mm256_maskz_max_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm_abs_epi16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (
              _mm_abs_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              )
             ]
            [ (_mm512_unpacklo_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              _mm512_unpacklo_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              )
             ]
            [ (_mm512_fmadd_epi32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (
              _mm512_fmadd_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
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
            [ (_mm_div_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
             (
              _mm_div_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              (* scale-factor num_9)
              num_10
              (* scale-factor num_11)
              num_12
              )
             ]
            [ (_mm256_mask_sllv_epi16_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (
              _mm256_mask_sllv_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_i_o
              num_17
              )
             ]
            [ (_mm256_mask_abs_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              _mm256_mask_abs_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm_cmpgt_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (
              _mm_cmpgt_epi16_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              )
             ]
            [ (_mm256_unpackhi_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (
              _mm256_unpackhi_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              prec_i_o
              num_7
              num_8
              num_9
              num_10
              )
             ]
            [ (_mm_mask_packs_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (
              _mm_mask_packs_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              (* scale-factor size_i_o)
              (* scale-factor num_14)
              num_15
              (* scale-factor num_16)
              prec_i_o
              num_18
              num_19
              num_20
              num_21
              num_22
              (* scale-factor num_23)
              num_24
              num_25
              num_26
              num_27
              )
             ]
            [ (_mm512_maskz_xor_epi32_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              _mm512_maskz_xor_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm_mask_sra_epi64_dsl vc_0 v1 v2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22)
             (
              _mm_mask_sra_epi64_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              vc_6
              vc_7
              (hydride:scale-expr v8 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_10)
              num_11
              (* scale-factor num_12)
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              prec_i_o
              num_20
              num_21
              num_22
              )
             ]
            [ (_mm_mask_or_epi64_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              _mm_mask_or_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm512_cmplt_epi32_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (
              _mm512_cmplt_epi32_mask_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm512_sllv_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (
              _mm512_sllv_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              prec_i_o
              num_12
              )
             ]
            [ (_mm512_mask3_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              _mm512_mask3_fmadd_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
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
              num_17
              num_18
              )
             ]
            [ (_mm_mask_unpackhi_epi32_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              _mm_mask_unpackhi_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              (* scale-factor num_6)
              num_7
              num_8
              num_9
              (* scale-factor size_i_o)
              (* scale-factor num_11)
              num_12
              (* scale-factor num_13)
              prec_i_o
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
            [ (_mm_avg_epu8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              _mm_avg_epu8_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (
              _mm256_maskz_mulhrs_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              prec_i_o
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
            [ (_mm256_hadd_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm256_hadd_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              )
             ]
            [ (_mm256_and_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm256_and_si256_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm256_cmpeq_epu64_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (
              _mm256_cmpeq_epu64_mask_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              num_7
              prec_o
              prec_i
              num_10
              num_11
              )
             ]
            [ (_mm512_mask_cvtsepi16_epi8_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (
              _mm512_mask_cvtsepi16_epi8_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm512_mulhi_epu32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
             (
              _mm512_mulhi_epu32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              (* scale-factor num_6)
              prec_i_o
              num_8
              num_9
              num_10
              num_11
              )
             ]
            [ (_mm_sub_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (
              _mm_sub_si64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
            [ (_mm256_extract_epi8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (
              _mm256_extract_epi8_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_o
              num_9
              prec_i
              num_11
              num_12
              )
             ]
            [ (_mm_mask_srai_epi16_dsl vc_0 v1 v2 vc_3 v4 vc_5 vc_6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (
              _mm_mask_srai_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              vc_3
              (hydride:scale-expr v4 scale-factor)
              vc_5
              vc_6
              (hydride:scale-expr v7 scale-factor)
              vc_8
              (* scale-factor size_i_o)
              (* scale-factor num_10)
              num_11
              (* scale-factor num_12)
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              prec_i_o
              num_20
              num_21
              num_22
              num_23
              num_24
              )
             ]
            [ (_mm256_sra_epi32_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19)
             (
              _mm256_sra_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              num_10
              num_11
              num_12
              num_13
              prec_i_o
              num_15
              num_16
              num_17
              num_18
              num_19
              )
             ]
            [ (_m_psrawi_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              _m_psrawi_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (* scale-factor size_i_o)
              num_7
              num_8
              num_9
              num_10
              num_11
              num_12
              num_13
              prec_i_o
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              )
             ]
            [ (_mm512_packs_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (
              _mm512_packs_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              num_5
              num_6
              num_7
              num_8
              prec_o
              num_10
              num_11
              num_12
              num_13
              prec_i
              num_15
              num_16
              num_17
              )
             ]
            [ (_mm256_mask_rorv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (
              _mm256_mask_rorv_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              prec_i_o
              num_12
              num_13
              num_14
              num_15
              )
             ]
            [ (_mm512_maskz_srl_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (
              _mm512_maskz_srl_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              prec_i_o
              num_18
              num_19
              )
             ]
            [ (_mm512_mask_rem_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              _mm512_mask_rem_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm256_madd52hi_epu64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm256_madd52hi_epu64_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_4)
              num_5
              num_6
              prec_i
              prec_o
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
            [ (_mm_min_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm_min_epu16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm_andnot_si128_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm_andnot_si128_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm256_maskz_cvtepi16_epi8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (
              _mm256_maskz_cvtepi16_epi8_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
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
              )
             ]
            [ (_mm_test_epi64_mask_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (
              _mm_test_epi64_mask_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
              num_7
              num_8
              prec_o
              prec_i
              num_11
              num_12
              )
             ]
            [ (_mm512_cvtepu8_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (
              _mm512_cvtepu8_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
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
            [ (_mm256_mask_cmpgt_epu64_mask_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 prec_i num_15 num_16)
             (
              _mm256_mask_cmpgt_epu64_mask_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              vc_4
              (hydride:scale-expr v5 scale-factor)
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              num_10
              prec_o
              num_12
              num_13
              prec_i
              num_15
              num_16
              )
             ]
            [ (_mm_maskz_unpacklo_epi64_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              _mm_maskz_unpacklo_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              (* scale-factor num_6)
              num_7
              (* scale-factor num_8)
              (* scale-factor num_9)
              (* scale-factor size_i_o)
              (* scale-factor num_11)
              num_12
              (* scale-factor num_13)
              prec_i_o
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
            [ (_mm512_maskz_unpackhi_epi64_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              _mm512_maskz_unpackhi_epi64_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              (* scale-factor num_6)
              num_7
              num_8
              num_9
              (* scale-factor size_i_o)
              (* scale-factor num_11)
              num_12
              (* scale-factor num_13)
              prec_i_o
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
            [ (_mm512_mask_div_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm512_mask_div_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
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
              num_17
              )
             ]
            [ (_mm_maskz_sll_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (
              _mm_maskz_sll_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
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
              )
             ]
            [ (_mm512_and_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (
              _mm512_and_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              )
             ]
            [ (_mm256_mask_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
             (
              _mm256_mask_dpbusd_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              num_7
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
              num_20
              )
             ]
            [ (_m_pslld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (
              _m_pslld_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              (* scale-factor num_10)
              num_11
              prec_i_o
              num_13
              (* scale-factor num_14)
              num_15
              num_16
              )
             ]
            [ (_mm512_andnot_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (
              _mm512_andnot_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              )
             ]
            [ (_mm512_mask_mulhi_epu32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16)
             (
              _mm512_mask_mulhi_epu32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              (* scale-factor num_9)
              prec_i_o
              num_11
              num_12
              num_13
              num_14
              num_15
              num_16
              )
             ]
            [ (_mm512_subs_epi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _mm512_subs_epi8_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_mm256_rol_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (
              _mm256_rol_epi32_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
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
              )
             ]
            [ (_m_from_int_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (
              _m_from_int_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_i_o
              num_6
              (* scale-factor num_7)
              )
             ]
            [ (_m_psrld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (
              _m_psrld_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              (* scale-factor num_10)
              num_11
              prec_i_o
              num_13
              (* scale-factor num_14)
              num_15
              num_16
              )
             ]
            [ (_mm512_mask_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              _mm512_mask_fmadd_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
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
              num_17
              num_18
              )
             ]
            [ (_mm512_srli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (
              _mm512_srli_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (_mm512_cmpneq_epu8_mask_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (
              _mm512_cmpneq_epu8_mask_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm512_mask_srlv_epi64_dsl vc_0 v1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (
              _mm512_mask_srlv_epi64_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
              num_11
              num_12
              num_13
              num_14
              num_15
              prec_i_o
              num_17
              )
             ]
            [ (_mm512_maskz_mulhi_epi16_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (
              _mm512_maskz_mulhi_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_6)
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
            [ (_mm512_cvtusepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 prec_i num_8 num_9)
             (
              _mm512_cvtusepi64_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_2)
              num_3
              (* scale-factor num_4)
              prec_o
              num_6
              prec_i
              num_8
              num_9
              )
             ]
            [ (_mm512_slli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (
              _mm512_slli_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              )
             ]
            [ (_mm256_mask_unpackhi_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (
              _mm256_mask_unpackhi_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              num_6
              num_7
              num_8
              num_9
              (* scale-factor size_i_o)
              (* scale-factor num_11)
              num_12
              (* scale-factor num_13)
              prec_i_o
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
            [ (_mm512_maskz_unpacklo_epi16_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              _mm512_maskz_unpacklo_epi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor num_5)
              num_6
              num_7
              num_8
              num_9
              (* scale-factor size_i_o)
              (* scale-factor num_11)
              num_12
              (* scale-factor num_13)
              prec_i_o
              num_15
              num_16
              num_17
              num_18
              num_19
              num_20
              num_21
              )
             ]
            [ (_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 vc_3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (
              _mm256_maskz_dpwssd_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              vc_3
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
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
            [ (_mm512_mask_extracti32x4_epi32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 v8 num_9 num_10 num_11 num_12 num_13 size_i_o num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
             (
              _mm512_mask_extracti32x4_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (hydride:scale-expr v7 scale-factor)
              (hydride:scale-expr v8 scale-factor)
              num_9
              num_10
              num_11
              num_12
              num_13
              (* scale-factor size_i_o)
              (* scale-factor num_15)
              num_16
              (* scale-factor num_17)
              prec_i_o
              num_19
              num_20
              (* scale-factor num_21)
              num_22
              num_23
              num_24
              (* scale-factor num_25)
              num_26
              num_27
              num_28
              num_29
              num_30
              num_31
              num_32
              )
             ]
            [ (_mm512_mask_cvtepi16_epi64_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (
              _mm512_mask_cvtepi16_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              num_7
              num_8
              num_9
              num_10
              prec_i_o
              num_12
              num_13
              num_14
              num_15
              )
             ]
            [ (_m_por_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (
              _m_por_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_3)
              num_4
              (* scale-factor num_5)
              prec_i_o
              num_7
              num_8
              )
             ]
            [ (_m_pcmpeqb_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
             (
              _m_pcmpeqb_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              vc_3
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              )
             ]
            [ (_mm_extract_pi16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 num_13 num_14)
             (
              _mm_extract_pi16_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (* scale-factor size_i_o)
              num_4
              num_5
              num_6
              num_7
              prec_o
              num_9
              prec_i
              num_11
              num_12
              num_13
              num_14
              )
             ]
            [ (_mm256_mask_broadcast_i64x2_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (
              _mm256_mask_broadcast_i64x2_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              (* scale-factor num_7)
              prec_i_o
              num_9
              num_10
              num_11
              num_12
              num_13
              )
             ]
            [ (_mm256_hsub_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm256_hsub_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              )
             ]
            [ (_mm_hsub_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (
              _mm_hsub_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
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
              (* scale-factor num_15)
              num_16
              num_17
              )
             ]
            [ (_mm512_mask_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (
              _mm512_mask_dpwssd_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
              num_7
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
              )
             ]
            [ (_mm256_ror_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (
              _mm256_ror_epi32_dsl
              vc_0
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
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
              )
             ]
            [ (_mm256_mask_srli_epi32_dsl v0 vc_1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (
              _mm256_mask_srli_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
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
              )
             ]
            [ (_mm_mask_broadcastd_epi32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              _mm_mask_broadcastd_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm_maskz_madd52lo_epu64_dsl vc_0 v1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (
              _mm_maskz_madd52lo_epu64_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              num_11
              num_12
              prec_i_o
              num_14
              num_15
              num_16
              num_17
              num_18
              (* scale-factor num_19)
              num_20
              num_21
              num_22
              num_23
              )
             ]
            [ (_mm256_blendv_epi8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (
              _mm256_blendv_epi8_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm512_srl_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (
              _mm512_srl_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              num_5
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              num_11
              prec_i_o
              num_13
              num_14
              )
             ]
            [ (_mm256_blend_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (
              _mm256_blend_epi16_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
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
            [ (_mm_mask_sra_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (
              _mm_mask_sra_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (hydride:scale-expr v7 scale-factor)
              vc_8
              (* scale-factor size_i_o)
              (* scale-factor num_10)
              num_11
              (* scale-factor num_12)
              num_13
              num_14
              num_15
              num_16
              num_17
              num_18
              prec_i_o
              num_20
              num_21
              num_22
              num_23
              num_24
              )
             ]
            [ (_mm_maskz_sub_epi8_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              _mm_maskz_sub_epi8_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm512_maskz_andnot_epi64_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              _mm512_maskz_andnot_epi64_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm512_mask_add_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (
              _mm512_mask_add_epi32_dsl
              vc_0
              (hydride:scale-expr v1 scale-factor)
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm256_mask_and_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (
              _mm256_mask_and_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              (hydride:scale-expr v2 scale-factor)
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
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
            [ (_mm_maskz_slli_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (
              _mm_maskz_slli_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              (hydride:scale-expr v1 scale-factor)
              vc_2
              vc_3
              vc_4
              vc_5
              (hydride:scale-expr v6 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_8)
              num_9
              (* scale-factor num_10)
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
              )
             ]
            [ (_mm_maskz_dpbusds_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (
              _mm_maskz_dpbusds_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (hydride:scale-expr v4 scale-factor)
              (hydride:scale-expr v5 scale-factor)
              (* scale-factor size_i_o)
              prec_i_o
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
              num_20
              num_21
              )
             ]
            [ (_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (
              _mm_srlv_epi32_dsl
              (hydride:scale-expr v0 scale-factor)
              vc_1
              vc_2
              (hydride:scale-expr v3 scale-factor)
              (* scale-factor size_i_o)
              (* scale-factor num_5)
              num_6
              (* scale-factor num_7)
              num_8
              num_9
              num_10
              prec_i_o
              num_12
              )
             ]
            [_ (error "Unrecognized expression")]
            )
  )

;; ================================================================================