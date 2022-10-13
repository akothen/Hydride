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
            [ (vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( vector-load_dsl v0-folded size_i_o num_2 num_3 prec_i_o ) (vector)))
                ]
               [else ( vector-load_dsl v0-folded size_i_o num_2 num_3 prec_i_o )]
               )
             ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 lane_size num_6 num_7 num_8 ) (vector)))
                ]
               [else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 lane_size num_6 num_7 num_8 )]
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
            [ (_mm512_mulhi_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_mulhi_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_mulhi_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 )]
               )
             ]
            [ (_m_from_int_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _m_from_int_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _m_from_int_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_hsubs_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsubs_pi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_hsubs_pi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm256_maskz_sllv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_maskz_sllv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm256_maskz_sllv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 )]
               )
             ]
            [ (_mm256_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_dpbusd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_mask_dpbusd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_maskz_sra_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 num_11 prec_i_o vc_13 vc_14 num_15 num_16 num_17)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_13-folded (hydride:const-fold vc_13))
             (define vc_14-folded (hydride:const-fold vc_14))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_13-folded) (lit? vc_14-folded))
                (lit (hydride:interpret ( _mm256_maskz_sra_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 num_11 prec_i_o vc_13-folded vc_14-folded num_15 num_16 num_17 ) (vector)))
                ]
               [else ( _mm256_maskz_sra_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 num_11 prec_i_o vc_13-folded vc_14-folded num_15 num_16 num_17 )]
               )
             ]
            [ (_mm512_xor_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_xor_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_xor_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_broadcast_i64x4_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_broadcast_i64x4_dsl v0-folded size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_broadcast_i64x4_dsl v0-folded size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7 )]
               )
             ]
            [ (_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_and_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_and_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_subs_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_subs_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_subs_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_maskz_srl_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_maskz_srl_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_maskz_srl_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm256_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_adds_epu16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_maskz_adds_epu16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_maskz_xor_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_maskz_xor_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_maskz_xor_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_min_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm256_min_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm256_cvtepi16_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_cvtepi16_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 ) (vector)))
                ]
               [else ( _mm256_cvtepi16_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 )]
               )
             ]
            [ (_mm_extract_epi32_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_extract_epi32_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm_extract_epi32_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm256_hsub_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hsub_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_hsub_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_m_psrldi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _m_psrldi_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _m_psrldi_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_mask_slli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_slli_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_mask_slli_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_xor_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_xor_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm512_xor_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm256_srl_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 num_10 prec_i_o num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_srl_epi16_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 num_10 prec_i_o num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm256_srl_epi16_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 num_10 prec_i_o num_12 num_13 num_14 )]
               )
             ]
            [ (_mm_maskz_cvtepu8_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_maskz_cvtepu8_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
                ]
               [else ( _mm_maskz_cvtepu8_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9 )]
               )
             ]
            [ (_mm512_srai_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm512_srai_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm512_srai_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 num_14 )]
               )
             ]
            [ (_m_paddd_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _m_paddd_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _m_paddd_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_subr_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_subr_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm256_cvtsepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_cvtsepi32_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 ) (vector)))
                ]
               [else ( _mm256_cvtsepi32_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 )]
               )
             ]
            [ (_mm512_mulhi_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded))
                (lit (hydride:interpret ( _mm512_mulhi_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_mulhi_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_srav_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 prec_i_o vc_11 vc_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_11-folded (hydride:const-fold vc_11))
             (define vc_12-folded (hydride:const-fold vc_12))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_11-folded) (lit? vc_12-folded))
                (lit (hydride:interpret ( _mm256_mask_srav_epi16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded prec_i_o vc_11-folded vc_12-folded num_13 ) (vector)))
                ]
               [else ( _mm256_mask_srav_epi16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded prec_i_o vc_11-folded vc_12-folded num_13 )]
               )
             ]
            [ (_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask3_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_mask3_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_mask_sra_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_12-folded (hydride:const-fold vc_12))
             (define vc_13-folded (hydride:const-fold vc_13))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_12-folded) (lit? vc_13-folded))
                (lit (hydride:interpret ( _mm_mask_sra_epi64_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 prec_i_o vc_12-folded vc_13-folded num_14 num_15 ) (vector)))
                ]
               [else ( _mm_mask_sra_epi64_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 prec_i_o vc_12-folded vc_13-folded num_14 num_15 )]
               )
             ]
            [ (_mm_srav_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 prec_i_o vc_9 vc_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_srav_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded prec_i_o vc_9-folded vc_10-folded num_11 ) (vector)))
                ]
               [else ( _mm_srav_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded prec_i_o vc_9-folded vc_10-folded num_11 )]
               )
             ]
            [ (_mm_mask_min_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_min_epi8_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_min_epi8_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_mask_min_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_min_epu16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_min_epu16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_m_punpckhdq_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _m_punpckhdq_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _m_punpckhdq_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmplt_epu16_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm_cmplt_epu16_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm512_mask_srl_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_mask_srl_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 num_12 prec_i_o num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_mask_srl_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 num_12 prec_i_o num_14 num_15 num_16 )]
               )
             ]
            [ (_mm256_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_mask_cvtepi32_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_mask_cvtepi32_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_mask_cmpeq_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_mask_cmpeq_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm_mask_cmpeq_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm256_adds_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_adds_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm256_adds_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_maskz_mulhi_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_maskz_mulhi_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_mul_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i num_6 prec_o num_8 ) (vector)))
                ]
               [else ( _mm256_mul_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i num_6 prec_o num_8 )]
               )
             ]
            [ (_mm_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm_maskz_dpwssd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm512_mask_cmpgt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_mask_cmpgt_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm512_mask_cmpgt_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm256_mask_blend_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_mask_blend_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_mask_blend_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm512_srlv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm512_srlv_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o num_10 ) (vector)))
                ]
               [else ( _mm512_srlv_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o num_10 )]
               )
             ]
            [ (_mm256_hsubs_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hsubs_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_hsubs_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_or_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_or_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm512_or_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_broadcastmb_epi64_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_broadcastmb_epi64_dsl v0-folded size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_broadcastmb_epi64_dsl v0-folded size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8 )]
               )
             ]
            [ (_mm512_maskz_cvtusepi16_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_maskz_cvtusepi16_epi8_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_maskz_cvtusepi16_epi8_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_maskz_srli_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_maskz_srli_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm512_maskz_srli_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 )]
               )
             ]
            [ (_mm_extract_epi8_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_extract_epi8_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_extract_epi8_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 )]
               )
             ]
            [ (_mm_cmpeq_epu8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmpeq_epu8_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm_cmpeq_epu8_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm_maskz_srlv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_maskz_srlv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm_maskz_srlv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 )]
               )
             ]
            [ (_mm512_max_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_max_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_max_epu32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_dpwssds_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm_maskz_dpwssds_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm_maskz_sll_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_maskz_sll_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm_maskz_sll_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm_movpi64_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_movpi64_epi64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_movpi64_epi64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm512_fmadd_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded num_3 num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_mask_add_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_add_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_add_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_mul_su32_dsl v0 v1 size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_mul_su32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_mul_su32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm_mask_cmpge_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_mask_cmpge_epi64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm_mask_cmpge_epi64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm256_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_cmple_epu32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm256_cmple_epu32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm512_test_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm512_test_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded vc_9-folded prec_i num_11 ) (vector)))
                ]
               [else ( _mm512_test_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded vc_9-folded prec_i num_11 )]
               )
             ]
            [ (_mm_hsub_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsub_pi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_hsub_pi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_maskz_subs_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_maskz_subs_epu8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_maskz_subs_epu8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_subs_pi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_subs_pi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm_subs_pi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_mask_srli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_mask_srli_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm512_mask_srli_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 )]
               )
             ]
            [ (_mm256_cmpgt_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_cmpgt_epu64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm256_cmpgt_epu64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmpeq_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm_cmpeq_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm256_mask_sll_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_sll_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm256_mask_sll_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm256_mask_cvtepi16_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_mask_cvtepi16_epi64_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
                ]
               [else ( _mm256_mask_cvtepi16_epi64_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9 )]
               )
             ]
            [ (_mm_cvtsi64_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtsi64_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_cvtsi64_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_rorv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_rorv_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm_rorv_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm512_sra_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm512_sra_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 ) (vector)))
                ]
               [else ( _mm512_sra_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 )]
               )
             ]
            [ (_mm_mask_cvtsepi16_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_mask_cvtsepi16_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_cvtsepi16_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_dpbusds_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_maskz_dpbusds_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_min_epu64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_min_epu64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_mask_max_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_max_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_max_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_srl_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_srl_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 ) (vector)))
                ]
               [else ( _mm256_mask_srl_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 )]
               )
             ]
            [ (_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_8-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm256_mulhrs_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8-folded vc_9-folded num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_mulhrs_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8-folded vc_9-folded num_10 num_11 )]
               )
             ]
            [ (_mm_cvtm64_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtm64_si64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_cvtm64_si64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_extract_epi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_extract_epi16_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm_extract_epi16_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm256_cvtepu8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_cvtepu8_epi16_dsl v0-folded size_i_o lane_size num_3 prec_i num_5 prec_o num_7 ) (vector)))
                ]
               [else ( _mm256_cvtepu8_epi16_dsl v0-folded size_i_o lane_size num_3 prec_i num_5 prec_o num_7 )]
               )
             ]
            [ (_mm256_mask_srlv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_srlv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm256_mask_srlv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 )]
               )
             ]
            [ (_mm_hsub_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsub_pi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_hsub_pi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm512_maskz_rorv_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_maskz_rorv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 ) (vector)))
                ]
               [else ( _mm512_maskz_rorv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 )]
               )
             ]
            [ (_mm256_mask_test_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm256_mask_test_epi64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded vc_11-folded prec_i num_13 ) (vector)))
                ]
               [else ( _mm256_mask_test_epi64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded vc_11-folded prec_i num_13 )]
               )
             ]
            [ (_mm_maskz_avg_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_maskz_avg_epu8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 ) (vector)))
                ]
               [else ( _mm_maskz_avg_epu8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 )]
               )
             ]
            [ (_mm512_ror_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_8-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm512_ror_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8-folded vc_9-folded num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_ror_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8-folded vc_9-folded num_10 num_11 )]
               )
             ]
            [ (_mm_mask_sub_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_sub_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mask_sub_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_cmplt_epu64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm256_mask_cmplt_epu64_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_m_psllwi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _m_psllwi_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _m_psllwi_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 num_13 )]
               )
             ]
            [ (_mm256_max_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_max_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm256_max_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_sub_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm_sub_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm_cvtsi32_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtsi32_si64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_cvtsi32_si64_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_maskz_adds_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_maskz_adds_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm_maskz_adds_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_unpackhi_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpackhi_pi32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_unpackhi_pi32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_cmple_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm256_mask_cmple_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_andnot_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_andnot_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_dpwssd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_dpwssd_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_dpwssd_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 )]
               )
             ]
            [ (_mm512_mask_mulhi_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm512_mask_mulhi_epu32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded num_10 num_11 ) (vector)))
                ]
               [else ( _mm512_mask_mulhi_epu32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded num_10 num_11 )]
               )
             ]
            [ (_mm_abs_epi8_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_abs_epi8_dsl v0-folded size_i_o lane_size num_3 prec_i_o num_5 num_6 ) (vector)))
                ]
               [else ( _mm_abs_epi8_dsl v0-folded size_i_o lane_size num_3 prec_i_o num_5 num_6 )]
               )
             ]
            [ (_mm256_sll_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_sll_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 ) (vector)))
                ]
               [else ( _mm256_sll_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 )]
               )
             ]
            [ (_mm256_cvtepi8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_cvtepi8_epi16_dsl v0-folded size_i_o lane_size num_3 prec_i num_5 prec_o num_7 ) (vector)))
                ]
               [else ( _mm256_cvtepi8_epi16_dsl v0-folded size_i_o lane_size num_3 prec_i num_5 prec_o num_7 )]
               )
             ]
            [ (_mm256_mask_testn_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm256_mask_testn_epi16_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded vc_11-folded prec_i num_13 ) (vector)))
                ]
               [else ( _mm256_mask_testn_epi16_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded vc_11-folded prec_i num_13 )]
               )
             ]
            [ (_mm512_cmpgt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm512_cmpgt_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm512_cmpgt_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm512_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_mul_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i num_6 prec_o num_8 ) (vector)))
                ]
               [else ( _mm512_mul_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i num_6 prec_o num_8 )]
               )
             ]
            [ (_mm256_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_cmple_epi32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm256_mask_cmple_epi32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm_maskz_dpbusd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_maskz_dpbusd_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
               )
             ]
            [ (_mm_movm_epi8_dsl vc_0 vc_1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_movm_epi8_dsl vc_0-folded vc_1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_movm_epi8_dsl vc_0-folded vc_1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_sub_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_sub_si64_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_sub_si64_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm512_maskz_srai_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15 num_16)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_12-folded (hydride:const-fold vc_12))
             (define vc_13-folded (hydride:const-fold vc_13))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_12-folded) (lit? vc_13-folded))
                (lit (hydride:interpret ( _mm512_maskz_srai_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 prec_i_o vc_12-folded vc_13-folded num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_maskz_srai_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 vc_9-folded num_10 prec_i_o vc_12-folded vc_13-folded num_14 num_15 num_16 )]
               )
             ]
            [ (_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_maskz_and_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_maskz_and_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_abs_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_mask_abs_epi16_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_mask_abs_epi16_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_mask_rolv_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_rolv_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 ) (vector)))
                ]
               [else ( _mm256_mask_rolv_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 vc_9-folded vc_10-folded num_11 )]
               )
             ]
            [ (_mm256_movepi16_mask_dsl vc_0 vc_1 v2 size_o lane_size num_5 prec_o num_7 num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_movepi16_mask_dsl vc_0-folded vc_1-folded v2-folded size_o lane_size num_5 prec_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_movepi16_mask_dsl vc_0-folded vc_1-folded v2-folded size_o lane_size num_5 prec_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_subr_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_mask_subr_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_dpwssd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_mask_dpwssd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_mm_movemask_epi8_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_movemask_epi8_dsl v0-folded size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_movemask_epi8_dsl v0-folded size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm512_mask_cmpge_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_mask_cmpge_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm512_mask_cmpge_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm_cvtsi64x_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtsi64x_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_cvtsi64x_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_sllv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_sllv_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o num_10 ) (vector)))
                ]
               [else ( _mm_sllv_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o num_10 )]
               )
             ]
            [ (_mm_extract_pi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_extract_pi16_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm_extract_pi16_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_maskz_srl_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_maskz_srl_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 num_12 prec_i_o num_14 num_15 num_16 ) (vector)))
                ]
               [else ( _mm512_maskz_srl_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 num_12 prec_i_o num_14 num_15 num_16 )]
               )
             ]
            [ (_mm_dpwssds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 ) (vector)))
                ]
               [else ( _mm_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 )]
               )
             ]
            [ (_mm256_maskz_or_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_or_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_maskz_or_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_rolv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_rolv_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm256_rolv_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_blendv_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm_blendv_epi8_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_setr_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_setr_m128i_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_setr_m128i_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm256_mask_cmpneq_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_cmpneq_epi16_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm256_mask_cmpneq_epi16_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm256_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm256_testn_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded vc_9-folded prec_i num_11 ) (vector)))
                ]
               [else ( _mm256_testn_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded vc_9-folded prec_i num_11 )]
               )
             ]
            [ (_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_blend_epi16_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_blend_epi16_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_maskz_rol_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm256_maskz_rol_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_maskz_rol_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 )]
               )
             ]
            [ (_mm256_mask_subs_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_subs_epi8_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_mask_subs_epi8_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_or_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm256_or_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm512_broadcastd_epi32_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_broadcastd_epi32_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 ) (vector)))
                ]
               [else ( _mm512_broadcastd_epi32_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 )]
               )
             ]
            [ (_mm512_and_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_and_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm512_and_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm256_maskz_slli_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_maskz_slli_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_maskz_slli_epi16_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded num_11 prec_i_o num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_cmplt_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm512_cmplt_epi64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm512_cmplt_epi64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm_cmpneq_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmpneq_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm_cmpneq_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm_maskz_ror_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_maskz_ror_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 ) (vector)))
                ]
               [else ( _mm_maskz_ror_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10-folded vc_11-folded num_12 num_13 )]
               )
             ]
            [ (_mm512_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm512_cmpge_epu64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm512_cmpge_epu64_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_dpbusds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
                ]
               [else ( _mm256_mask_dpbusds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 )]
               )
             ]
            [ (_mm_cmplt_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmplt_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm_cmplt_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm512_cvtusepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_cvtusepi32_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 ) (vector)))
                ]
               [else ( _mm512_cvtusepi32_epi8_dsl v0-folded size_i_o lane_size num_3 prec_o num_5 prec_i num_7 )]
               )
             ]
            [ (_mm_mask_sllv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_mask_sllv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 ) (vector)))
                ]
               [else ( _mm_mask_sllv_epi64_dsl vc_0-folded v1-folded v2-folded v3-folded v4-folded size_i_o lane_size num_7 num_8 num_9 vc_10-folded prec_i_o num_12 )]
               )
             ]
            [ (_mm256_cmpgt_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_cmpgt_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm256_cmpgt_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm_cmpge_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_cmpge_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm_cmpge_epi32_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_dpwssds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
                ]
               [else ( _mm_mask_dpwssds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 )]
               )
             ]
            [ (_mm256_srl_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm256_srl_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 ) (vector)))
                ]
               [else ( _mm256_srl_epi64_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded num_9 prec_i_o num_11 num_12 )]
               )
             ]
            [ (_mm_avg_pu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm_avg_pu8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 ) (vector)))
                ]
               [else ( _mm_avg_pu8_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 vc_7-folded vc_8-folded num_9 )]
               )
             ]
            [ (_mm512_andnot_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_andnot_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm512_andnot_si512_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm512_cmple_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_8-folded (hydride:const-fold vc_8))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_8-folded))
                (lit (hydride:interpret ( _mm512_cmple_epi16_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 ) (vector)))
                ]
               [else ( _mm512_cmple_epi16_mask_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_o num_6 vc_7-folded vc_8-folded prec_i num_10 )]
               )
             ]
            [ (_mm256_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm256_mask_cmpgt_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm256_mask_cmpgt_epu32_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_mm512_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12 num_13)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_10-folded (hydride:const-fold vc_10))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_10-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm512_maskz_mulhrs_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10-folded vc_11-folded num_12 num_13 ) (vector)))
                ]
               [else ( _mm512_maskz_mulhrs_epi16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10-folded vc_11-folded num_12 num_13 )]
               )
             ]
            [ (_mm256_set_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_set_m128i_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_set_m128i_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_mask_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_mul_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 ) (vector)))
                ]
               [else ( _mm256_mask_mul_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 )]
               )
             ]
            [ (_mm_unpacklo_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpacklo_pi32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm_unpacklo_pi32_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm512_mask_max_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_max_epu16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_mask_max_epu16_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm512_mask_andnot_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_andnot_epi64_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_mask_andnot_epi64_dsl v0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 )]
               )
             ]
            [ (_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_adds_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 ) (vector)))
                ]
               [else ( _mm256_adds_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 )]
               )
             ]
            [ (_mm256_maskz_mullo_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_mullo_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
                ]
               [else ( _mm256_maskz_mullo_epi32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11 )]
               )
             ]
            [ (_mm512_maskz_broadcast_i64x4_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm512_maskz_broadcast_i64x4_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm512_maskz_broadcast_i64x4_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_sign_pi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o vc_10 num_11 num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_8-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm_sign_pi8_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o vc_10-folded num_11 num_12 ) (vector)))
                ]
               [else ( _mm_sign_pi8_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 num_6 num_7 vc_8-folded prec_i_o vc_10-folded num_11 num_12 )]
               )
             ]
            [ (_mm_cvtsi32_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtsi32_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
                ]
               [else ( _mm_cvtsi32_si128_dsl v0-folded size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8 )]
               )
             ]
            [ (_mm_mulhi_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_mulhi_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_mulhi_epu16_dsl v0-folded v1-folded size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_add_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_add_si64_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_add_si64_dsl v0-folded v1-folded size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm256_mask_mov_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_mask_mov_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm256_mask_mov_epi32_dsl v0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm_extract_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _mm_extract_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 ) (vector)))
                ]
               [else ( _mm_extract_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 )]
               )
             ]
            [ (_mm256_maskz_set1_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_maskz_set1_epi16_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_maskz_set1_epi16_dsl vc_0-folded v1-folded v2-folded size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_sra_pi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 num_9 prec_i_o vc_11 vc_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_7-folded (hydride:const-fold vc_7))
             (define vc_11-folded (hydride:const-fold vc_11))
             (define vc_12-folded (hydride:const-fold vc_12))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_7-folded) (lit? vc_11-folded) (lit? vc_12-folded))
                (lit (hydride:interpret ( _mm_sra_pi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 num_9 prec_i_o vc_11-folded vc_12-folded num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm_sra_pi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 vc_7-folded num_8 num_9 prec_i_o vc_11-folded vc_12-folded num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_mask_cmplt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define vc_9-folded (hydride:const-fold vc_9))
             (define vc_10-folded (hydride:const-fold vc_10))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_9-folded) (lit? vc_10-folded))
                (lit (hydride:interpret ( _mm512_mask_cmplt_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 ) (vector)))
                ]
               [else ( _mm512_mask_cmplt_epi8_mask_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 prec_o num_8 vc_9-folded vc_10-folded prec_i num_12 )]
               )
             ]
            [ (_m_pextrw_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_11-folded (hydride:const-fold vc_11))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_11-folded))
                (lit (hydride:interpret ( _m_pextrw_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _m_pextrw_dsl v0-folded v1-folded size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11-folded num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm512_maskz_mul_epu32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (define vc_0-folded (hydride:const-fold vc_0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_maskz_mul_epu32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 ) (vector)))
                ]
               [else ( _mm512_maskz_mul_epu32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 )]
               )
             ]
            [ (_mm_rol_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define vc_8-folded (hydride:const-fold vc_8))
             (define vc_9-folded (hydride:const-fold vc_9))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? vc_8-folded) (lit? vc_9-folded))
                (lit (hydride:interpret ( _mm_rol_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8-folded vc_9-folded num_10 num_11 ) (vector)))
                ]
               [else ( _mm_rol_epi64_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8-folded vc_9-folded num_10 num_11 )]
               )
             ]
            [ (_mm_unpackhi_epi8_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpackhi_epi8_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
                ]
               [else ( _mm_unpackhi_epi8_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
               )
             ]
            [ (_mm512_broadcastw_epi16_dsl v0 num_1 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm512_broadcastw_epi16_dsl v0-folded num_1 prec_i_o ) (vector)))
                ]
               [else ( _mm512_broadcastw_epi16_dsl v0-folded num_1 prec_i_o )]
               )
             ]
            [ (_mm_hadds_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hadds_pi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 ) (vector)))
                ]
               [else ( _mm_hadds_pi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 )]
               )
             ]
            [ (_mm256_hadd_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hadd_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
                ]
               [else ( _mm256_hadd_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
               )
             ]
            [ (_mm_cvtsepi64_epi16_dsl v0 num_1 prec_o prec_i num_4)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtsepi64_epi16_dsl v0-folded num_1 prec_o prec_i num_4 ) (vector)))
                ]
               [else ( _mm_cvtsepi64_epi16_dsl v0-folded num_1 prec_o prec_i num_4 )]
               )
             ]
            [ (_mm256_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm256_maskz_madd52lo_epu64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded num_5 num_6 ) (vector)))
                ]
               [else ( _mm256_maskz_madd52lo_epu64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded num_5 num_6 )]
               )
             ]
            [ (_mm256_mask_adds_epu8_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_adds_epu8_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
                ]
               [else ( _mm256_mask_adds_epu8_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
               )
             ]
            [ (_mm512_mask_rem_epi32_dsl v0 v1 v2 v3)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_rem_epi32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
                ]
               [else ( _mm512_mask_rem_epi32_dsl v0-folded v1-folded v2-folded v3-folded )]
               )
             ]
            [ (_mm512_unpacklo_epi64_dsl v0 v1 num_2)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_unpacklo_epi64_dsl v0-folded v1-folded num_2 ) (vector)))
                ]
               [else ( _mm512_unpacklo_epi64_dsl v0-folded v1-folded num_2 )]
               )
             ]
            [ (_mm256_dpbusds_epi32_dsl v0 v1 v2 size_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i_o ) (vector)))
                ]
               [else ( _mm256_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i_o )]
               )
             ]
            [ (_mm_unpackhi_epi64_dsl v0 v1 num_2 num_3)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_unpackhi_epi64_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
                ]
               [else ( _mm_unpackhi_epi64_dsl v0-folded v1-folded num_2 num_3 )]
               )
             ]
            [ (_mm512_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (define v4-folded (hydride:const-fold v4))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
                (lit (hydride:interpret ( _mm512_maskz_dpwssds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o ) (vector)))
                ]
               [else ( _mm512_maskz_dpwssds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o )]
               )
             ]
            [ (_mm256_unpacklo_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpacklo_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_unpacklo_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i_o ) (vector)))
                ]
               [else ( _mm256_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i_o )]
               )
             ]
            [ (_mm_hadd_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hadd_pi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_hadd_pi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_madd_pi16_dsl v0 v1 num_2)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_madd_pi16_dsl v0-folded v1-folded num_2 ) (vector)))
                ]
               [else ( _mm_madd_pi16_dsl v0-folded v1-folded num_2 )]
               )
             ]
            [ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_div_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_mask_div_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm256_subs_epi8_dsl v0 v1 num_2 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_subs_epi8_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
                ]
               [else ( _mm256_subs_epi8_dsl v0-folded v1-folded num_2 prec_i_o )]
               )
             ]
            [ (_mm512_unpacklo_epi16_dsl v0 v1 prec_i_o num_3)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_unpacklo_epi16_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
                ]
               [else ( _mm512_unpacklo_epi16_dsl v0-folded v1-folded prec_i_o num_3 )]
               )
             ]
            [ (_mm256_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_maskz_broadcast_i32x2_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 ) (vector)))
                ]
               [else ( _mm256_maskz_broadcast_i32x2_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 )]
               )
             ]
            [ (_mm512_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_madd_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 ) (vector)))
                ]
               [else ( _mm512_mask_madd_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 )]
               )
             ]
            [ (_mm256_hadds_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hadds_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
                ]
               [else ( _mm256_hadds_epi16_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
               )
             ]
            [ (_mm256_mask_maddubs_epi16_dsl v0 v1 v2 v3 num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_maddubs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 ) (vector)))
                ]
               [else ( _mm256_mask_maddubs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 )]
               )
             ]
            [ (_mm_hsubs_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsubs_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 ) (vector)))
                ]
               [else ( _mm_hsubs_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 )]
               )
             ]
            [ (_mm_rem_epi32_dsl v0 v1 num_2 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_rem_epi32_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
                ]
               [else ( _mm_rem_epi32_dsl v0-folded v1-folded num_2 prec_i_o )]
               )
             ]
            [ (_mm256_madd52hi_epu64_dsl v0 v1 v2 num_3 num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_madd52hi_epu64_dsl v0-folded v1-folded v2-folded num_3 num_4 ) (vector)))
                ]
               [else ( _mm256_madd52hi_epu64_dsl v0-folded v1-folded v2-folded num_3 num_4 )]
               )
             ]
            [ (_mm256_maskz_unpackhi_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_unpackhi_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm256_maskz_unpackhi_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 )]
               )
             ]
            [ (_mm256_unpackhi_epi16_dsl v0 v1 size_i_o prec_i_o num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpackhi_epi16_dsl v0-folded v1-folded size_i_o prec_i_o num_4 ) (vector)))
                ]
               [else ( _mm256_unpackhi_epi16_dsl v0-folded v1-folded size_i_o prec_i_o num_4 )]
               )
             ]
            [ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_div_epu32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
                ]
               [else ( _mm512_mask_div_epu32_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
               )
             ]
            [ (_mm512_rem_epi8_dsl v0 v1 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_rem_epi8_dsl v0-folded v1-folded prec_i_o ) (vector)))
                ]
               [else ( _mm512_rem_epi8_dsl v0-folded v1-folded prec_i_o )]
               )
             ]
            [ (_mm_maskz_unpacklo_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_maskz_unpacklo_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_maskz_unpacklo_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_hsub_epi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_hsub_epi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
                ]
               [else ( _mm256_hsub_epi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
               )
             ]
            [ (_mm256_maskz_adds_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_adds_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
                ]
               [else ( _mm256_maskz_adds_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
               )
             ]
            [ (_mm_div_epu64_dsl v0 v1 num_2 prec_i_o num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_div_epu64_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
                ]
               [else ( _mm_div_epu64_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
               )
             ]
            [ (_mm256_unpackhi_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpackhi_epi64_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_unpackhi_epi64_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_maskz_unpacklo_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_maskz_unpacklo_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm512_maskz_unpacklo_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 )]
               )
             ]
            [ (_mm256_unpacklo_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpacklo_epi64_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_unpacklo_epi64_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9 )]
               )
             ]
            [ (_mm256_maskz_subs_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_subs_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
                ]
               [else ( _mm256_maskz_subs_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
               )
             ]
            [ (_mm_adds_epi8_dsl v0 v1 num_2 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_adds_epi8_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
                ]
               [else ( _mm_adds_epi8_dsl v0-folded v1-folded num_2 prec_i_o )]
               )
             ]
            [ (_mm_mask_unpacklo_epi64_dsl v0 v1 v2 v3 num_4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm_mask_unpacklo_epi64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
                ]
               [else ( _mm_mask_unpacklo_epi64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 )]
               )
             ]
            [ (_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm512_mask_subs_epu16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
                ]
               [else ( _mm512_mask_subs_epu16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
               )
             ]
            [ (_mm_hsub_epi32_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hsub_epi32_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm_hsub_epi32_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_subs_pu8_dsl v0 v1 num_2 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_subs_pu8_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
                ]
               [else ( _mm_subs_pu8_dsl v0-folded v1-folded num_2 prec_i_o )]
               )
             ]
            [ (_mm256_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_mask_madd52hi_epu64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
                ]
               [else ( _mm256_mask_madd52hi_epu64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 )]
               )
             ]
            [ (_mm512_adds_epu16_dsl v0 v1 num_2 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_adds_epu16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
                ]
               [else ( _mm512_adds_epu16_dsl v0-folded v1-folded num_2 prec_i_o )]
               )
             ]
            [ (_mm256_maskz_cvtusepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_maskz_cvtusepi64_epi32_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 ) (vector)))
                ]
               [else ( _mm256_maskz_cvtusepi64_epi32_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 )]
               )
             ]
            [ (_mm256_unpacklo_epi8_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpacklo_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_unpacklo_epi8_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_broadcastmw_epi32_dsl v0-folded num_1 prec_i prec_o ) (vector)))
                ]
               [else ( _mm_broadcastmw_epi32_dsl v0-folded num_1 prec_i prec_o )]
               )
             ]
            [ (_mm256_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm256_maskz_broadcastq_epi64_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o ) (vector)))
                ]
               [else ( _mm256_maskz_broadcastq_epi64_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o )]
               )
             ]
            [ (_mm_cvtusepi64_epi8_dsl v0 num_1 prec_o prec_i num_4)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm_cvtusepi64_epi8_dsl v0-folded num_1 prec_o prec_i num_4 ) (vector)))
                ]
               [else ( _mm_cvtusepi64_epi8_dsl v0-folded num_1 prec_o prec_i num_4 )]
               )
             ]
            [ (_mm256_broadcast_i32x4_dsl v0 num_1 prec_i_o num_3)
             (define v0-folded (hydride:const-fold v0))
             (cond
               [(and (lit? v0-folded))
                (lit (hydride:interpret ( _mm256_broadcast_i32x4_dsl v0-folded num_1 prec_i_o num_3 ) (vector)))
                ]
               [else ( _mm256_broadcast_i32x4_dsl v0-folded num_1 prec_i_o num_3 )]
               )
             ]
            [ (_mm256_unpacklo_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm256_unpacklo_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
                ]
               [else ( _mm256_unpacklo_epi32_dsl v0-folded v1-folded size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 )]
               )
             ]
            [ (_mm512_div_epi8_dsl v0 v1 num_2 prec_i_o num_4)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm512_div_epi8_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
                ]
               [else ( _mm512_div_epi8_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
               )
             ]
            [ (_mm256_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (define v3-folded (hydride:const-fold v3))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
                (lit (hydride:interpret ( _mm256_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 ) (vector)))
                ]
               [else ( _mm256_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 )]
               )
             ]
            [ (_mm_hadd_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_hadd_pi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 ) (vector)))
                ]
               [else ( _mm_hadd_pi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 )]
               )
             ]
            [ (_mm_maskz_cvtsepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (define v0-folded (hydride:const-fold v0))
             (define vc_1-folded (hydride:const-fold vc_1))
             (define v2-folded (hydride:const-fold v2))
             (cond
               [(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
                (lit (hydride:interpret ( _mm_maskz_cvtsepi64_epi32_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 ) (vector)))
                ]
               [else ( _mm_maskz_cvtsepi64_epi32_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 )]
               )
             ]
            [ (_mm_maddubs_pi16_dsl v0 v1 num_2)
             (define v0-folded (hydride:const-fold v0))
             (define v1-folded (hydride:const-fold v1))
             (cond
               [(and (lit? v0-folded) (lit? v1-folded))
                (lit (hydride:interpret ( _mm_maddubs_pi16_dsl v0-folded v1-folded num_2 ) (vector)))
                ]
               [else ( _mm_maddubs_pi16_dsl v0-folded v1-folded num_2 )]
               )
             ]
            [_ (error "Unrecognized expression")]
            )
  )
;; ================================================================================

