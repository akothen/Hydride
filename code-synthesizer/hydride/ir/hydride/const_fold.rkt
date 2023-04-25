#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)

(require hydride/ir/hydride/interpreter)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (hydride:const-fold prog )
  (destruct prog
            [(dim-x id) (dim-x id)]
            [(dim-y id) (dim-y id)]
            [(idx-i id) (idx-i id)]
            [(idx-j id) (idx-j id)]
            [(reg id) (reg id) ]
            [(lit v) (lit v)]
            [(nop v1) (hydride:const-fold v1)]
            [(idx-add i1 i2)(idx-add i1 i2) ]
            [(idx-mul i1 i2) (idx-mul i1 i2) ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
                ]
               [else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
               )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
                ]
               [else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
               )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
                ]
               [else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
               )
             ]
            [ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
                (lit (hydride:interpret ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
                ]
               [else ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
               )
             ]

        [ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
            (define v0-folded (hydride:const-fold v0))
            (define v1-folded (hydride:const-fold v1))
            (cond
            [(and (lit? v0-folded) (lit? v1-folded))
    (lit (hydride:interpret ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
    ]
            [else ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o )]
            )
        ]
        [ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
            (define v0-folded (hydride:const-fold v0))
            (define v1-folded (hydride:const-fold v1))
            (cond
            [(and (lit? v0-folded) (lit? v1-folded))
    (lit (hydride:interpret ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
    ]
            [else ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o )]
            )
        ]
        [ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
            (define v0-folded (hydride:const-fold v0))
            (define v1-folded (hydride:const-fold v1))
            (cond
            [(and (lit? v0-folded) (lit? v1-folded))
    (lit (hydride:interpret ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
    ]
            [else ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o )]
            )
        ]
        [ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
            (define v0-folded (hydride:const-fold v0))
            (define v1-folded (hydride:const-fold v1))
            (cond
            [(and (lit? v0-folded) (lit? v1-folded))
    (lit (hydride:interpret ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
    ]
            [else ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o )]
            )
        ]
        [ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
            (define v0-folded (hydride:const-fold v0))
            (define v1-folded (hydride:const-fold v1))
            (cond
            [(and (lit? v0-folded) (lit? v1-folded))
    (lit (hydride:interpret ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
    ]
		[else ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
            [ (_mm512_rem_epu32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_rem_epu32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_rem_epu32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm512_or_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_or_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
                ]
               [else ( _mm512_or_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
               )
             ]
            [ (_mm256_mask_min_epi8_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_mask_min_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_mask_min_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_xor_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_xor_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
                ]
               [else ( _mm256_xor_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
               )
             ]
            [ (_mm_add_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_add_si64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_add_si64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_m_packssdw_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _m_packssdw_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _m_packssdw_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17 )]
               )
             ]
            [ (_mm512_maskz_packus_epi32_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_packus_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 ) (vector)))
                ]
               [else ( _mm512_maskz_packus_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 )]
               )
             ]
            [ (_mm256_xor_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_xor_si256_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_xor_si256_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_rolv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
                ]
               [else ( _mm_rolv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
               )
             ]
            [ (_mm_maskz_srl_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm_maskz_srl_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_maskz_srl_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_maskz_avg_epu16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_maskz_avg_epu16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_mask_rolv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_mask_rolv_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm512_mask_rolv_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm_hadd_pi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hadd_pi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm_hadd_pi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm512_extracti64x4_epi64_dsl vc_0 vc_1 v2 v3 size_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_extracti64x4_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_extracti64x4_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm512_unpacklo_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_unpacklo_epi64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_unpacklo_epi64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_cvtepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o prec_i num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_cvtepi64_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o prec_i num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_cvtepi64_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o prec_i num_7 num_8 )]
               )
             ]
            [ (_mm256_max_epu64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_max_epu64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_max_epu64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_broadcastmb_epi64_dsl v0 size_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_broadcastmb_epi64_dsl v0-folded size_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_broadcastmb_epi64_dsl v0-folded size_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_unpacklo_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpacklo_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_unpacklo_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
                (lit (hydride:interpret ( _mm512_srav_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 ) (vector)))
                ]
               [else ( _mm512_srav_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 )]
               )
             ]
            [ (_mm_unpacklo_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpacklo_pi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_unpacklo_pi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_mask_mul_epu32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_mask_mul_epu32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm_mask_mul_epu32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm256_mul_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_mul_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_mul_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mask_testn_epi32_mask_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 vc_6 v7 size_i_o num_9 num_10 num_11 prec_o num_13 prec_i num_15 num_16)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define vc_6-folded (hydride:const-fold vc_6))
             (define v7-folded (hydride:const-fold v7))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? vc_6-folded) (lit? v7-folded))
                (lit (hydride:interpret ( _mm256_mask_testn_epi32_mask_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded v7-folded size_i_o num_9 num_10 num_11 prec_o num_13 prec_i num_15 num_16 ) (vector)))
                ]
               [else ( _mm256_mask_testn_epi32_mask_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded v7-folded size_i_o num_9 num_10 num_11 prec_o num_13 prec_i num_15 num_16 )]
               )
             ]
            [ (_mm_rorv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_rorv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
                ]
               [else ( _mm_rorv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
               )
             ]
            [ (_mm512_mulhi_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_mulhi_epu16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_mulhi_epu16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_mul_su32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_mul_su32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_mul_su32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_broadcast_i32x2_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_broadcast_i32x2_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_broadcast_i32x2_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_mask_ror_epi32_dsl vc_0 v1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm_mask_ror_epi32_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_mask_ror_epi32_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm_mask_rol_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm_mask_rol_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_mask_rol_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm_hadd_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hadd_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_hadd_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mask_cmpeq_epu8_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 size_i_o num_8 num_9 num_10 prec_o num_12 prec_i num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define vc_6-folded (hydride:const-fold vc_6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded))
                (lit (hydride:interpret ( _mm256_mask_cmpeq_epu8_mask_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded vc_6-folded size_i_o num_8 num_9 num_10 prec_o num_12 prec_i num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_mask_cmpeq_epu8_mask_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded vc_6-folded size_i_o num_8 num_9 num_10 prec_o num_12 prec_i num_14 num_15 )]
               )
             ]
            [ (_mm_movemask_epi8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_movemask_epi8_dsl v0-folded size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_movemask_epi8_dsl v0-folded size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 )]
               )
             ]
            [ (_mm512_sll_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_sll_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_sll_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm_sign_pi16_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_sign_pi16_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm_sign_pi16_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm512_mask_sll_epi64_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_mask_sll_epi64_dsl v0-folded v1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 ) (vector)))
                ]
               [else ( _mm512_mask_sll_epi64_dsl v0-folded v1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 )]
               )
             ]
            [ (_mm_add_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_add_pi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_add_pi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm512_mask_srav_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define vc_6-folded (hydride:const-fold vc_6))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define v8-folded (hydride:const-fold v8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
                (lit (hydride:interpret ( _mm512_mask_srav_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 ) (vector)))
                ]
               [else ( _mm512_mask_srav_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 )]
               )
             ]
            [ (_mm_hsub_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsub_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_hsub_pi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mulhrs_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mulhrs_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm256_mulhrs_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm256_mask_madd52hi_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_mask_madd52hi_epu64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
                ]
               [else ( _mm256_mask_madd52hi_epu64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
               )
             ]
            [ (_mm512_mask_extracti64x4_epi64_dsl v0 vc_1 vc_2 v3 vc_4 v5 v6 num_7 num_8 num_9 num_10 num_11 size_i_o num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_mask_extracti64x4_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded v5-folded v6-folded num_7 num_8 num_9 num_10 num_11 size_i_o num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 ) (vector)))
                ]
               [else ( _mm512_mask_extracti64x4_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded v5-folded v6-folded num_7 num_8 num_9 num_10 num_11 size_i_o num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 )]
               )
             ]
            [ (_mm512_extracti64x2_epi64_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 size_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded))
                (lit (hydride:interpret ( _mm512_extracti64x2_epi64_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded size_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm512_extracti64x2_epi64_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded size_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm512_sra_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
                (lit (hydride:interpret ( _mm512_sra_epi64_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm512_sra_epi64_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 )]
               )
             ]
            [ (_mm256_maskz_max_epi32_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_maskz_max_epi32_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_maskz_max_epi32_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm_abs_epi16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_abs_epi16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
                ]
               [else ( _mm_abs_epi16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
               )
             ]
            [ (_mm512_unpacklo_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_unpacklo_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_unpacklo_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_fmadd_epi32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm_div_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_div_epi64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_div_epi64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_mm256_mask_sllv_epi16_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm256_mask_sllv_epi16_dsl v0-folded v1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 ) (vector)))
                ]
               [else ( _mm256_mask_sllv_epi16_dsl v0-folded v1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 )]
               )
             ]
            [ (_mm256_mask_abs_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_abs_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_mask_abs_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_cmpgt_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_cmpgt_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
                ]
               [else ( _mm_cmpgt_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
               )
             ]
            [ (_mm256_unpackhi_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpackhi_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm256_unpackhi_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_mask_packs_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_mask_packs_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 ) (vector)))
                ]
               [else ( _mm_mask_packs_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 )]
               )
             ]
            [ (_mm512_maskz_xor_epi32_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_xor_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm512_maskz_xor_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 )]
               )
             ]
            [ (_mm_mask_sra_epi64_dsl vc_0 v1 v2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define vc_6-folded (hydride:const-fold vc_6))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define v8-folded (hydride:const-fold v8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
                (lit (hydride:interpret ( _mm_mask_sra_epi64_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 ) (vector)))
                ]
               [else ( _mm_mask_sra_epi64_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 )]
               )
             ]
            [ (_mm_mask_or_epi64_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_mask_or_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_mask_or_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 )]
               )
             ]
            [ (_mm512_cmplt_epi32_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_cmplt_epi32_mask_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ) (vector)))
                ]
               [else ( _mm512_cmplt_epi32_mask_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 )]
               )
             ]
            [ (_mm512_sllv_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_sllv_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm512_sllv_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 )]
               )
             ]
            [ (_mm512_mask3_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask3_fmadd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
                ]
               [else ( _mm512_mask3_fmadd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
               )
             ]
            [ (_mm_mask_unpackhi_epi32_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_mask_unpackhi_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
                ]
               [else ( _mm_mask_unpackhi_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
               )
             ]
            [ (_mm256_dpbusd_epi32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm_avg_epu8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_avg_epu8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_avg_epu8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm256_maskz_mulhrs_epi16_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
                ]
               [else ( _mm256_maskz_mulhrs_epi16_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
               )
             ]
            [ (_mm256_hadd_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hadd_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm256_hadd_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm256_and_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_and_si256_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_and_si256_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_cmpeq_epu64_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_cmpeq_epu64_mask_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_cmpeq_epu64_mask_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 )]
               )
             ]
            [ (_mm512_mask_cvtsepi16_epi8_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_cvtsepi16_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_mask_cvtsepi16_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm512_mulhi_epu32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_mulhi_epu32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_mulhi_epu32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm512_broadcastq_epi64_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_broadcastq_epi64_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_broadcastq_epi64_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_sub_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_sub_si64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_sub_si64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_extract_epi8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_extract_epi8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ) (vector)))
                ]
               [else ( _mm256_extract_epi8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 )]
               )
             ]
            [ (_mm_mask_srai_epi16_dsl vc_0 v1 v2 vc_3 v4 vc_5 vc_6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define vc_6-folded (hydride:const-fold vc_6))
             (define v7-folded (hydride:const-fold v7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? vc_5-folded) (lit? vc_6-folded) (lit? v7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_mask_srai_epi16_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded vc_5-folded vc_6-folded v7-folded vc_8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24 ) (vector)))
                ]
               [else ( _mm_mask_srai_epi16_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded vc_5-folded vc_6-folded v7-folded vc_8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24 )]
               )
             ]
            [ (_mm256_sra_epi32_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
                (lit (hydride:interpret ( _mm256_sra_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 ) (vector)))
                ]
               [else ( _mm256_sra_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 )]
               )
             ]
            [ (_m_psrawi_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
                (lit (hydride:interpret ( _m_psrawi_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _m_psrawi_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm512_packs_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_packs_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm512_packs_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17 )]
               )
             ]
            [ (_mm256_mask_rorv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm256_mask_rorv_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_mask_rorv_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_maskz_srl_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_maskz_srl_epi64_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 ) (vector)))
                ]
               [else ( _mm512_maskz_srl_epi64_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 )]
               )
             ]
            [ (_mm512_mask_rem_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask_rem_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm512_mask_rem_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_madd52hi_epu64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_madd52hi_epu64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm256_madd52hi_epu64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm_min_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_min_epu16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_min_epu16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_andnot_si128_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_andnot_si128_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_andnot_si128_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_maskz_cvtepi16_epi8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_cvtepi16_epi8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_maskz_cvtepi16_epi8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm_test_epi64_mask_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_test_epi64_mask_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 ) (vector)))
                ]
               [else ( _mm_test_epi64_mask_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 )]
               )
             ]
            [ (_mm512_cvtepu8_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_cvtepu8_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_cvtepu8_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_cmpgt_epu64_mask_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 prec_i num_15 num_16)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define v5-folded (hydride:const-fold v5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm256_mask_cmpgt_epu64_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 prec_i num_15 num_16 ) (vector)))
                ]
               [else ( _mm256_mask_cmpgt_epu64_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 prec_i num_15 num_16 )]
               )
             ]
            [ (_mm_maskz_unpacklo_epi64_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 ) (vector)))
                ]
               [else ( _mm_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 )]
               )
             ]
            [ (_mm512_maskz_unpackhi_epi64_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_unpackhi_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 ) (vector)))
                ]
               [else ( _mm512_maskz_unpackhi_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 )]
               )
             ]
            [ (_mm512_mask_div_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask_div_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm512_mask_div_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm_maskz_sll_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm_maskz_sll_epi32_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_maskz_sll_epi32_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm512_and_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_and_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
                ]
               [else ( _mm512_and_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
               )
             ]
            [ (_mm256_mask_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_mask_dpbusd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) (vector)))
                ]
               [else ( _mm256_mask_dpbusd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 )]
               )
             ]
            [ (_m_pslld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _m_pslld_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _m_pslld_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_andnot_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_andnot_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
                ]
               [else ( _mm512_andnot_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
               )
             ]
            [ (_mm512_mask_mulhi_epu32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? v5-folded))
                (lit (hydride:interpret ( _mm512_mask_mulhi_epu32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_mask_mulhi_epu32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_subs_epi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_subs_epi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_subs_epi8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_rol_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_rol_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_rol_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_m_from_int_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _m_from_int_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _m_from_int_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_m_psrld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _m_psrld_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _m_psrld_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_mask_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask_fmadd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
                ]
               [else ( _mm512_mask_fmadd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
               )
             ]
            [ (_mm512_srli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_srli_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
                ]
               [else ( _mm512_srli_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 )]
               )
             ]
            [ (_mm512_cmpneq_epu8_mask_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_cmpneq_epu8_mask_dsl vc_0-folded v1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_cmpneq_epu8_mask_dsl vc_0-folded v1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 )]
               )
             ]
            [ (_mm512_mask_srlv_epi64_dsl vc_0 v1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm512_mask_srlv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 ) (vector)))
                ]
               [else ( _mm512_mask_srlv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 )]
               )
             ]
            [ (_mm512_maskz_mulhi_epi16_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_mulhi_epi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_maskz_mulhi_epi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_cvtusepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 prec_i num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_cvtusepi64_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 prec_i num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_cvtusepi64_epi32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 prec_i num_8 num_9 )]
               )
             ]
            [ (_mm512_slli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_slli_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
                ]
               [else ( _mm512_slli_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 )]
               )
             ]
            [ (_mm256_mask_unpackhi_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_mask_unpackhi_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
                ]
               [else ( _mm256_mask_unpackhi_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
               )
             ]
            [ (_mm512_maskz_unpacklo_epi16_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_unpacklo_epi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm512_maskz_unpacklo_epi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 vc_3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
                (lit (hydride:interpret ( _mm256_maskz_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded v5-folded size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
                ]
               [else ( _mm256_maskz_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded v5-folded size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
               )
             ]
            [ (_mm512_mask_extracti32x4_epi32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 v8 num_9 num_10 num_11 num_12 num_13 size_i_o num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (define v7-folded (hydride:const-fold v7))
             (define v8-folded (hydride:const-fold v8))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded) (lit? v7-folded) (lit? v8-folded))
                (lit (hydride:interpret ( _mm512_mask_extracti32x4_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded v8-folded num_9 num_10 num_11 num_12 num_13 size_i_o num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 ) (vector)))
                ]
               [else ( _mm512_mask_extracti32x4_epi32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded v8-folded num_9 num_10 num_11 num_12 num_13 size_i_o num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 )]
               )
             ]
            [ (_mm512_mask_cvtepi16_epi64_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_cvtepi16_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm512_mask_cvtepi16_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm_movepi32_mask_dsl v0 vc_1 vc_2 vc_3 size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
                (lit (hydride:interpret ( _mm_movepi32_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_movepi32_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_m_por_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _m_por_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _m_por_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_m_pcmpeqb_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded))
                (lit (hydride:interpret ( _m_pcmpeqb_dsl vc_0-folded v1-folded v2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
                ]
               [else ( _m_pcmpeqb_dsl vc_0-folded v1-folded v2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
               )
             ]
            [ (_mm_extract_pi16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_extract_pi16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_extract_pi16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm256_mask_broadcast_i64x2_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_broadcast_i64x2_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_mask_broadcast_i64x2_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_hsub_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hsub_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm256_hsub_epi32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm_hsub_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsub_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm_hsub_epi16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 )]
               )
             ]
            [ (_mm512_mask_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
                ]
               [else ( _mm512_mask_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
               )
             ]
            [ (_mm256_ror_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_ror_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_ror_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm256_mask_srli_epi32_dsl v0 vc_1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm256_mask_srli_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm256_mask_srli_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm_mask_broadcastd_epi32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_broadcastd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_mask_broadcastd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_mm_maskz_madd52lo_epu64_dsl vc_0 v1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? v5-folded))
                (lit (hydride:interpret ( _mm_maskz_madd52lo_epu64_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 ) (vector)))
                ]
               [else ( _mm_maskz_madd52lo_epu64_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 )]
               )
             ]
            [ (_mm256_blendv_epi8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_blendv_epi8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_blendv_epi8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
               )
             ]
            [ (_mm512_srl_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_srl_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_srl_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm256_blend_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_blend_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm256_blend_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_mm_mask_sra_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (define v7-folded (hydride:const-fold v7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded) (lit? v7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_mask_sra_epi32_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded vc_8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24 ) (vector)))
                ]
               [else ( _mm_mask_sra_epi32_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded vc_8-folded size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24 )]
               )
             ]
            [ (_mm_movm_epi8_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
                (lit (hydride:interpret ( _mm_movm_epi8_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_movm_epi8_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_maskz_sub_epi8_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_sub_epi8_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm_maskz_sub_epi8_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm512_maskz_andnot_epi64_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_andnot_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm512_maskz_andnot_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 )]
               )
             ]
            [ (_mm512_mask_add_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_mask_add_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm512_mask_add_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_mask_and_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_mask_and_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm256_mask_and_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 )]
               )
             ]
            [ (_mm_maskz_slli_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define vc_3-folded (hydride:const-fold vc_3))
             (define vc_4-folded (hydride:const-fold vc_4))
             (define vc_5-folded (hydride:const-fold vc_5))
             (define v6-folded (hydride:const-fold v6))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
                (lit (hydride:interpret ( _mm_maskz_slli_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_maskz_slli_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm256_maddubs_epi16_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_maddubs_epi16_dsl vc_0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_maddubs_epi16_dsl vc_0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_maskz_dpbusds_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define v5-folded (hydride:const-fold v5))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? v5-folded))
                (lit (hydride:interpret ( _mm_maskz_dpbusds_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 ) (vector)))
                ]
               [else ( _mm_maskz_dpbusds_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 )]
               )
             ]
            [ (_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define vc_2-folded (hydride:const-fold vc_2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_srlv_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm_srlv_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 )]
               )
             ]
            [v (error "Unrecognized expression in const fold" v)]
            )
  )
;; ================================================================================

