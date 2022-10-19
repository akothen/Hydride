#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/llvm_impl)


(require hydride/ir/hydride/semantics)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/length)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL hydride-interpreter
;; ================================================================================
(define (hydride:interpret prog env)
  (destruct prog
            [(dim-x id) (vector-ref env (- (vector-length env) 2))]
            [(dim-y id) (vector-ref env (- (vector-length env) 1))]
            [(idx-i id) (vector-ref env (- (vector-length env) 4))]
            [(idx-j id) (vector-ref env (- (vector-length env) 3))]
            [(reg id) (vector-ref env id)]
            [(lit v) v]
            [(nop v1) (hydride:interpret v1 env)]
            [(idx-add i1 i2) (+ (hydride:interpret i1 env) (hydride:interpret i2 env))]
            [(idx-mul i1 i2) (* (hydride:interpret i1 env) (hydride:interpret i2 env))]
            [ (vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o)
             (vector-load (hydride:interpret v0 env) size_i_o num_2 
                          num_3 prec_i_o)
             ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (vector-two-input-swizzle (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                       prec_i_o num_4 lane_size 
                                       num_6 num_7 num_8)
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (interleave-vectors (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 prec_i_o)
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (interleave-vector (hydride:interpret v0 env) size_i_o prec_i_o)
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (deinterleave-vector (hydride:interpret v0 env) size_i_o prec_i_o)
             ]
            [ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (llvm:shuffle-vectors (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                   prec_i_o (hydride:interpret v4 env) num_5)
             ]
            [ (_mm512_mulhi_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (_mm512_mulhi_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 lane_size num_4 prec_i_o 
                                 num_6 num_7 num_8 
                                 num_9)
             ]
            [ (_m_from_int_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_m_from_int (hydride:interpret v0 env) size_o lane_size 
                          num_3 prec_i_o num_5 
                          num_6 num_7 num_8)
             ]
            [ (_mm_hsubs_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (_mm_hsubs_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                             lane_size num_4 num_5 
                             num_6 prec_i_o num_8 
                             num_9 num_10 num_11 
                             num_12 num_13 num_14)
             ]
            [ (_mm256_maskz_sllv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (_mm256_maskz_sllv_epi32 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                      lane_size num_7 num_8 
                                      num_9 (hydride:interpret vc_10 env) prec_i_o 
                                      num_12)
             ]
            [ (_mm256_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (_mm256_mask_dpbusd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                       (hydride:interpret v3 env) size_i_o lane_size 
                                       num_6 num_7 num_8 
                                       num_9 num_10 num_11 
                                       num_12 num_13)
             ]
            [ (_mm256_maskz_sra_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 num_11 prec_i_o vc_13 vc_14 num_15 num_16 num_17)
             (_mm256_maskz_sra_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 num_7 num_8 
                                     (hydride:interpret vc_9 env) num_10 num_11 
                                     prec_i_o (hydride:interpret vc_13 env) (hydride:interpret vc_14 env) 
                                     num_15 num_16 num_17)
             ]
            [ (_mm512_xor_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_xor_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7)
             ]
            [ (_mm512_broadcast_i64x4_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (_mm512_broadcast_i64x4 (hydride:interpret v0 env) size_i_o lane_size 
                                     num_3 prec_i_o num_5 
                                     num_6 num_7)
             ]
            [ (_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_and_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7)
             ]
            [ (_mm512_subs_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_subs_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7)
             ]
            [ (_mm512_maskz_srl_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (_mm512_maskz_srl_epi64 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 (hydride:interpret vc_10 env) num_11 
                                     prec_i_o num_13 num_14)
             ]
            [ (_mm256_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm256_maskz_adds_epu16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) size_i_o lane_size 
                                      num_6 prec_i_o num_8 
                                      num_9)
             ]
            [ (_mm_maskz_xor_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_maskz_xor_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  (hydride:interpret v3 env) size_i_o lane_size 
                                  num_6 prec_i_o num_8 
                                  num_9)
             ]
            [ (_mm256_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm256_min_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                              lane_size num_4 prec_i_o 
                              num_6 num_7)
             ]
            [ (_mm256_cvtepi16_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (_mm256_cvtepi16_epi8 (hydride:interpret v0 env) size_i_o lane_size 
                                   num_3 prec_o num_5 
                                   prec_i num_7)
             ]
            [ (_mm_extract_epi32_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (_mm_extract_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                                lane_size num_4 num_5 
                                num_6 prec_o num_8 
                                num_9 prec_i (hydride:interpret vc_11 env) 
                                num_12 num_13 num_14 
                                num_15)
             ]
            [ (_mm256_hsub_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (_mm256_hsub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 num_5 
                                num_6 prec_i_o num_8 
                                num_9 num_10 num_11 
                                num_12 num_13 num_14 
                                num_15)
             ]
            [ (_m_psrldi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (_m_psrldi (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                        size_i_o lane_size num_5 
                        num_6 num_7 (hydride:interpret vc_8 env) 
                        num_9 prec_i_o num_11 
                        num_12 num_13)
             ]
            [ (_mm256_mask_slli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (_mm256_mask_slli_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 (hydride:interpret vc_10 env) num_11 
                                     prec_i_o num_13 num_14 
                                     num_15)
             ]
            [ (_mm512_xor_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm512_xor_si512 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7 num_8 
                               num_9 num_10)
             ]
            [ (_mm256_srl_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 num_10 prec_i_o num_12 num_13 num_14)
             (_mm256_srl_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                               size_i_o lane_size num_5 
                               num_6 num_7 (hydride:interpret vc_8 env) 
                               num_9 num_10 prec_i_o 
                               num_12 num_13 num_14)
             ]
            [ (_mm_maskz_cvtepu8_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (_mm_maskz_cvtepu8_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      size_i_o lane_size num_5 
                                      num_6 num_7 prec_i_o 
                                      num_9)
             ]
            [ (_mm512_srai_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13 num_14)
             (_mm512_srai_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 num_5 
                                num_6 (hydride:interpret vc_7 env) num_8 
                                prec_i_o (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                num_12 num_13 num_14)
             ]
            [ (_m_paddd_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_m_paddd (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                       lane_size num_4 prec_i_o 
                       num_6 num_7)
             ]
            [ (_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_subr_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7)
             ]
            [ (_mm256_cvtsepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (_mm256_cvtsepi32_epi8 (hydride:interpret v0 env) size_i_o lane_size 
                                    num_3 prec_o num_5 
                                    prec_i num_7)
             ]
            [ (_mm512_mulhi_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 num_8 num_9)
             (_mm512_mulhi_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 lane_size num_4 prec_i_o 
                                 num_6 (hydride:interpret vc_7 env) num_8 
                                 num_9)
             ]
            [ (_mm256_mask_srav_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 prec_i_o vc_11 vc_12 num_13)
             (_mm256_mask_srav_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 num_7 num_8 
                                     (hydride:interpret vc_9 env) prec_i_o (hydride:interpret vc_11 env) 
                                     (hydride:interpret vc_12 env) num_13)
             ]
            [ (_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (_mm512_mask3_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                       (hydride:interpret v3 env) num_4 num_5 
                                       prec_i_o num_7 num_8)
             ]
            [ (_mm_mask_sra_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15)
             (_mm_mask_sra_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 num_7 num_8 
                                 (hydride:interpret vc_9 env) num_10 prec_i_o 
                                 (hydride:interpret vc_12 env) (hydride:interpret vc_13 env) num_14 
                                 num_15)
             ]
            [ (_mm_srav_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 prec_i_o vc_9 vc_10 num_11)
             (_mm_srav_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                             lane_size num_4 num_5 
                             num_6 (hydride:interpret vc_7 env) prec_i_o 
                             (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) num_11)
             ]
            [ (_mm_mask_min_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_mask_min_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                (hydride:interpret v3 env) size_i_o lane_size 
                                num_6 prec_i_o num_8 
                                num_9)
             ]
            [ (_mm_mask_min_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_mask_min_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 prec_i_o num_8 
                                 num_9)
             ]
            [ (_m_punpckhdq_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (_m_punpckhdq (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                           lane_size num_4 prec_i_o 
                           num_6 num_7 num_8 
                           num_9 num_10 num_11)
             ]
            [ (_mm_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm_cmplt_epu16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                   lane_size num_4 prec_o 
                                   num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                   prec_i num_10)
             ]
            [ (_mm512_mask_srl_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (_mm512_mask_srl_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                    lane_size num_7 num_8 
                                    num_9 (hydride:interpret vc_10 env) num_11 
                                    num_12 prec_i_o num_14 
                                    num_15 num_16)
             ]
            [ (_mm256_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_mask_cvtepi32_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                        size_i_o lane_size num_5 
                                        prec_i_o num_7 num_8 
                                        num_9)
             ]
            [ (_mm_mask_cmpeq_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm_mask_cmpeq_epi8_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                       (hydride:interpret v3 env) size_i_o lane_size 
                                       num_6 prec_o num_8 
                                       (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                       num_12)
             ]
            [ (_mm256_adds_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm256_adds_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7)
             ]
            [ (_mm_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (_mm_maskz_mulhi_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 prec_i_o num_8 
                                    num_9 num_10 num_11)
             ]
            [ (_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (_mm256_mul_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i 
                               num_6 prec_o num_8)
             ]
            [ (_mm_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (_mm_maskz_dpwssd_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 num_10 num_11 
                                     num_12 num_13)
             ]
            [ (_mm512_mask_cmpgt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm512_mask_cmpgt_epi8_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) size_i_o lane_size 
                                          num_6 prec_o num_8 
                                          (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                          num_12)
             ]
            [ (_mm256_mask_blend_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (_mm256_mask_blend_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      size_i_o lane_size num_5 
                                      prec_i_o num_7 num_8)
             ]
            [ (_mm512_srlv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (_mm512_srlv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                size_i_o lane_size num_5 
                                num_6 num_7 (hydride:interpret vc_8 env) 
                                prec_i_o num_10)
             ]
            [ (_mm256_hsubs_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (_mm256_hsubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 lane_size num_4 num_5 
                                 num_6 num_7 num_8 
                                 prec_i_o num_10 num_11 
                                 num_12 num_13 num_14 
                                 num_15)
             ]
            [ (_mm512_or_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm512_or_si512 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                              lane_size num_4 prec_i_o 
                              num_6 num_7 num_8 
                              num_9 num_10)
             ]
            [ (_mm_broadcastmb_epi64_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8)
             (_mm_broadcastmb_epi64 (hydride:interpret v0 env) size_o lane_size 
                                    num_3 prec_i num_5 
                                    prec_o num_7 num_8)
             ]
            [ (_mm512_maskz_cvtusepi16_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm512_maskz_cvtusepi16_epi8 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           size_i_o lane_size num_5 
                                           prec_i_o num_7 num_8 
                                           num_9)
             ]
            [ (_mm512_maskz_srli_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (_mm512_maskz_srli_epi64 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                      lane_size num_7 num_8 
                                      num_9 (hydride:interpret vc_10 env) num_11 
                                      prec_i_o num_13 num_14 
                                      num_15)
             ]
            [ (_mm_extract_epi8_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (_mm_extract_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                               lane_size num_4 num_5 
                               num_6 prec_o num_8 
                               num_9 prec_i (hydride:interpret vc_11 env) 
                               num_12 num_13 num_14)
             ]
            [ (_mm_cmpeq_epu8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm_cmpeq_epu8_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                  lane_size num_4 prec_o 
                                  num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                  prec_i num_10)
             ]
            [ (_mm_maskz_srlv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (_mm_maskz_srlv_epi32 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                   (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                   lane_size num_7 num_8 
                                   num_9 (hydride:interpret vc_10 env) prec_i_o 
                                   num_12)
             ]
            [ (_mm512_max_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_max_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7)
             ]
            [ (_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (_mm_maskz_dpwssds_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                      lane_size num_7 num_8 
                                      num_9 num_10 num_11 
                                      num_12 num_13)
             ]
            [ (_mm_maskz_sll_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (_mm_maskz_sll_epi64 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                  (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                  lane_size num_7 num_8 
                                  num_9 (hydride:interpret vc_10 env) num_11 
                                  prec_i_o num_13 num_14)
             ]
            [ (_mm_movpi64_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_movpi64_epi64 (hydride:interpret v0 env) size_o lane_size 
                                num_3 prec_i_o num_5 
                                num_6 num_7 num_8)
             ]
            [ (_mm512_fmadd_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7)
             (_mm512_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 num_3 num_4 prec_i_o 
                                 num_6 num_7)
             ]
            [ (_mm_mask_add_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_mask_add_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 prec_i_o num_8 
                                 num_9)
             ]
            [ (_mm_mul_su32_dsl v0 v1 size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11)
             (_mm_mul_su32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                           lane_size num_4 prec_i 
                           num_6 prec_o num_8 
                           num_9 num_10 num_11)
             ]
            [ (_mm_mask_cmpge_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm_mask_cmpge_epi64_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                        (hydride:interpret v3 env) size_i_o lane_size 
                                        num_6 prec_o num_8 
                                        (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                        num_12)
             ]
            [ (_mm256_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm256_cmple_epu32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm512_test_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (_mm512_test_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                     lane_size num_4 prec_o 
                                     num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                     (hydride:interpret vc_9 env) prec_i num_11)
             ]
            [ (_mm_hsub_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (_mm_hsub_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            prec_i_o num_4 num_5 
                            num_6 num_7 num_8 
                            num_9 num_10)
             ]
            [ (_mm_maskz_subs_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_maskz_subs_epu8 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  (hydride:interpret v3 env) size_i_o lane_size 
                                  num_6 prec_i_o num_8 
                                  num_9)
             ]
            [ (_mm_subs_pi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm_subs_pi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                           lane_size num_4 prec_i_o 
                           num_6 num_7)
             ]
            [ (_mm512_mask_srli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (_mm512_mask_srli_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 (hydride:interpret vc_10 env) num_11 
                                     prec_i_o num_13 num_14 
                                     num_15)
             ]
            [ (_mm256_cmpgt_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm256_cmpgt_epu64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm_cmpeq_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                              lane_size num_4 prec_i_o 
                              num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                              num_9)
             ]
            [ (_mm256_mask_sll_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (_mm256_mask_sll_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                    lane_size num_7 num_8 
                                    num_9 (hydride:interpret vc_10 env) num_11 
                                    prec_i_o num_13 num_14)
             ]
            [ (_mm256_mask_cvtepi16_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (_mm256_mask_cvtepi16_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                         size_i_o lane_size num_5 
                                         num_6 num_7 prec_i_o 
                                         num_9)
             ]
            [ (_mm_cvtsi64_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_cvtsi64_si128 (hydride:interpret v0 env) size_o lane_size 
                                num_3 prec_i_o num_5 
                                num_6 num_7 num_8)
             ]
            [ (_mm_rorv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm_rorv_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                             lane_size num_4 prec_i_o 
                             num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                             num_9)
             ]
            [ (_mm512_sra_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (_mm512_sra_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 num_5 
                               num_6 (hydride:interpret vc_7 env) num_8 
                               prec_i_o (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                               num_12 num_13)
             ]
            [ (_mm_mask_cvtsepi16_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm_mask_cvtsepi16_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      size_i_o lane_size num_5 
                                      prec_i_o num_7 num_8 
                                      num_9)
             ]
            [ (_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (_mm_maskz_dpbusds_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                      lane_size num_7 num_8 
                                      num_9 num_10 num_11 
                                      num_12 num_13 num_14)
             ]
            [ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_min_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7)
             ]
            [ (_mm_mask_max_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_mask_max_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 prec_i_o num_8 
                                 num_9)
             ]
            [ (_mm256_mask_srl_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (_mm256_mask_srl_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                    lane_size num_7 num_8 
                                    num_9 (hydride:interpret vc_10 env) num_11 
                                    prec_i_o num_13 num_14)
             ]
            [ (_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10 num_11)
             (_mm256_mulhrs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                  lane_size num_4 prec_i_o 
                                  num_6 num_7 (hydride:interpret vc_8 env) 
                                  (hydride:interpret vc_9 env) num_10 num_11)
             ]
            [ (_mm_cvtm64_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_cvtm64_si64 (hydride:interpret v0 env) size_o lane_size 
                              num_3 prec_i_o num_5 
                              num_6 num_7 num_8)
             ]
            [ (_mm_extract_epi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (_mm_extract_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                                lane_size num_4 num_5 
                                num_6 prec_o num_8 
                                num_9 prec_i (hydride:interpret vc_11 env) 
                                num_12 num_13 num_14 
                                num_15)
             ]
            [ (_mm256_cvtepu8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (_mm256_cvtepu8_epi16 (hydride:interpret v0 env) size_i_o lane_size 
                                   num_3 prec_i num_5 
                                   prec_o num_7)
             ]
            [ (_mm256_mask_srlv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (_mm256_mask_srlv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 (hydride:interpret vc_10 env) prec_i_o 
                                     num_12)
             ]
            [ (_mm_hsub_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (_mm_hsub_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                            lane_size num_4 num_5 
                            num_6 prec_i_o num_8 
                            num_9 num_10 num_11 
                            num_12 num_13 num_14)
             ]
            [ (_mm512_maskz_rorv_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (_mm512_maskz_rorv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) size_i_o lane_size 
                                      num_6 prec_i_o num_8 
                                      (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) num_11)
             ]
            [ (_mm256_mask_test_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (_mm256_mask_test_epi64_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) size_i_o lane_size 
                                          num_6 prec_o num_8 
                                          (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                          prec_i num_13)
             ]
            [ (_mm_maskz_avg_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (_mm_maskz_avg_epu8 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 prec_i_o num_8 
                                 (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) num_11)
             ]
            [ (_mm512_ror_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (_mm512_ror_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 num_5 
                               num_6 prec_i_o (hydride:interpret vc_8 env) 
                               (hydride:interpret vc_9 env) num_10 num_11)
             ]
            [ (_mm_mask_sub_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_mask_sub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 (hydride:interpret v3 env) size_i_o lane_size 
                                 num_6 prec_i_o num_8 
                                 num_9)
             ]
            [ (_mm256_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm256_mask_cmplt_epu64_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                           num_12)
             ]
            [ (_m_psllwi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (_m_psllwi (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                        size_i_o lane_size num_5 
                        num_6 num_7 (hydride:interpret vc_8 env) 
                        num_9 prec_i_o num_11 
                        num_12 num_13)
             ]
            [ (_mm256_max_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm256_max_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7)
             ]
            [ (_mm_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm_sub_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                           lane_size num_4 prec_i_o 
                           num_6 num_7)
             ]
            [ (_mm_cvtsi32_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_cvtsi32_si64 (hydride:interpret v0 env) size_o lane_size 
                               num_3 prec_i_o num_5 
                               num_6 num_7 num_8)
             ]
            [ (_mm_maskz_adds_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm_maskz_adds_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                   (hydride:interpret v3 env) size_i_o lane_size 
                                   num_6 prec_i_o num_8 
                                   num_9)
             ]
            [ (_mm_unpackhi_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (_mm_unpackhi_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7 num_8 
                                num_9 num_10 num_11)
             ]
            [ (_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm256_mask_cmple_epu32_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                           num_12)
             ]
            [ (_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm512_andnot_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                  lane_size num_4 prec_i_o 
                                  num_6 num_7)
             ]
            [ (_mm512_dpwssd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (_mm512_dpwssd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  size_i_o lane_size num_5 
                                  prec_i num_7 num_8)
             ]
            [ (_mm512_mask_mulhi_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 num_10 num_11)
             (_mm512_mask_mulhi_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) size_i_o lane_size 
                                      num_6 prec_i_o num_8 
                                      (hydride:interpret vc_9 env) num_10 num_11)
             ]
            [ (_mm_abs_epi8_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
             (_mm_abs_epi8 (hydride:interpret v0 env) size_i_o lane_size 
                           num_3 prec_i_o num_5 
                           num_6)
             ]
            [ (_mm256_sll_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (_mm256_sll_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                               size_i_o lane_size num_5 
                               num_6 num_7 (hydride:interpret vc_8 env) 
                               num_9 prec_i_o num_11 
                               num_12)
             ]
            [ (_mm256_cvtepi8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (_mm256_cvtepi8_epi16 (hydride:interpret v0 env) size_i_o lane_size 
                                   num_3 prec_i num_5 
                                   prec_o num_7)
             ]
            [ (_mm256_mask_testn_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (_mm256_mask_testn_epi16_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                           prec_i num_13)
             ]
            [ (_mm512_cmpgt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm512_cmpgt_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm512_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (_mm512_mul_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                               lane_size num_4 prec_i 
                               num_6 prec_o num_8)
             ]
            [ (_mm256_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm256_mask_cmple_epi32_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                           num_12)
             ]
            [ (_mm_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (_mm_maskz_dpbusd_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 num_10 num_11 
                                     num_12 num_13 num_14)
             ]
            [ (_mm_movm_epi8_dsl vc_0 vc_1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (_mm_movm_epi8 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                            size_i_o lane_size num_5 
                            prec_i_o num_7 num_8)
             ]
            [ (_mm_sub_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm_sub_si64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                           lane_size num_4 prec_i_o 
                           num_6 num_7 num_8 
                           num_9 num_10)
             ]
            [ (_mm512_maskz_srai_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15 num_16)
             (_mm512_maskz_srai_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) size_i_o lane_size 
                                      num_6 num_7 num_8 
                                      (hydride:interpret vc_9 env) num_10 prec_i_o 
                                      (hydride:interpret vc_12 env) (hydride:interpret vc_13 env) num_14 
                                      num_15 num_16)
             ]
            [ (_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm512_maskz_and_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 prec_i_o num_8 
                                     num_9)
             ]
            [ (_mm256_mask_abs_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (_mm256_mask_abs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    size_i_o lane_size num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (_mm256_mask_rolv_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (_mm256_mask_rolv_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 prec_i_o num_8 
                                     (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) num_11)
             ]
            [ (_mm256_movepi16_mask_dsl vc_0 vc_1 v2 size_o lane_size num_5 prec_o num_7 num_8 num_9)
             (_mm256_movepi16_mask (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                   size_o lane_size num_5 
                                   prec_o num_7 num_8 
                                   num_9)
             ]
            [ (_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm512_mask_subr_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 prec_i_o num_8 
                                     num_9)
             ]
            [ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (_mm_mask_dpwssd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 num_7 num_8 
                                    num_9 num_10 num_11 
                                    num_12)
             ]
            [ (_mm_movemask_epi8_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8)
             (_mm_movemask_epi8 (hydride:interpret v0 env) size_o lane_size 
                                num_3 prec_o num_5 
                                num_6 num_7 num_8)
             ]
            [ (_mm512_mask_cmpge_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm512_mask_cmpge_epu32_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                           num_12)
             ]
            [ (_mm_cvtsi64x_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_cvtsi64x_si128 (hydride:interpret v0 env) size_o lane_size 
                                 num_3 prec_i_o num_5 
                                 num_6 num_7 num_8)
             ]
            [ (_mm_sllv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (_mm_sllv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                             size_i_o lane_size num_5 
                             num_6 num_7 (hydride:interpret vc_8 env) 
                             prec_i_o num_10)
             ]
            [ (_mm_extract_pi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (_mm_extract_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                               lane_size num_4 num_5 
                               num_6 prec_o num_8 
                               num_9 prec_i (hydride:interpret vc_11 env) 
                               num_12 num_13 num_14 
                               num_15)
             ]
            [ (_mm512_maskz_srl_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (_mm512_maskz_srl_epi16 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                     lane_size num_7 num_8 
                                     num_9 (hydride:interpret vc_10 env) num_11 
                                     num_12 prec_i_o num_14 
                                     num_15 num_16)
             ]
            [ (_mm_dpwssds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (_mm_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                size_i_o lane_size num_5 
                                prec_i num_7 num_8)
             ]
            [ (_mm256_maskz_or_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm256_maskz_or_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 prec_i_o num_8 
                                    num_9)
             ]
            [ (_mm256_rolv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm256_rolv_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 prec_i_o 
                                num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                num_9)
             ]
            [ (_mm_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (_mm_blendv_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                              size_i_o lane_size num_5 
                              prec_i_o num_7 num_8)
             ]
            [ (_mm256_setr_m128i_dsl v0 v1)
             (_mm256_setr_m128i (hydride:interpret v0 env) (hydride:interpret v1 env))
             ]
            [ (_mm256_mask_cmpneq_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm256_mask_cmpneq_epi16_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                            (hydride:interpret v3 env) size_i_o lane_size 
                                            num_6 prec_o num_8 
                                            (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                            num_12)
             ]
            [ (_mm256_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (_mm256_testn_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      (hydride:interpret vc_9 env) prec_i num_11)
             ]
            [ (_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_blend_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                 size_i_o lane_size num_5 
                                 prec_i_o num_7 num_8 
                                 num_9)
             ]
            [ (_mm256_maskz_rol_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (_mm256_maskz_rol_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 num_7 num_8 
                                     prec_i_o (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                     num_12 num_13)
             ]
            [ (_mm256_mask_subs_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm256_mask_subs_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 prec_i_o num_8 
                                    num_9)
             ]
            [ (_mm256_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm256_or_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                              lane_size num_4 prec_i_o 
                              num_6 num_7)
             ]
            [ (_mm512_broadcastd_epi32_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (_mm512_broadcastd_epi32 (hydride:interpret v0 env) size_o lane_size 
                                      num_3 prec_i_o num_5 
                                      num_6 num_7)
             ]
            [ (_mm512_and_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm512_and_si512 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7 num_8 
                               num_9 num_10)
             ]
            [ (_mm256_maskz_slli_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (_mm256_maskz_slli_epi16 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                      lane_size num_7 num_8 
                                      num_9 (hydride:interpret vc_10 env) num_11 
                                      prec_i_o num_13 num_14 
                                      num_15)
             ]
            [ (_mm512_cmplt_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm512_cmplt_epi64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm_cmpneq_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm_cmpneq_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                    lane_size num_4 prec_o 
                                    num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                    prec_i num_10)
             ]
            [ (_mm_maskz_ror_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (_mm_maskz_ror_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  (hydride:interpret v3 env) size_i_o lane_size 
                                  num_6 num_7 num_8 
                                  prec_i_o (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                  num_12 num_13)
             ]
            [ (_mm512_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm512_cmpge_epu64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (_mm256_mask_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                        (hydride:interpret v3 env) size_i_o lane_size 
                                        num_6 num_7 num_8 
                                        num_9 num_10 num_11 
                                        num_12 num_13)
             ]
            [ (_mm_cmplt_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm_cmplt_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                              lane_size num_4 prec_i_o 
                              num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                              num_9)
             ]
            [ (_mm512_cvtusepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (_mm512_cvtusepi32_epi8 (hydride:interpret v0 env) size_i_o lane_size 
                                     num_3 prec_o num_5 
                                     prec_i num_7)
             ]
            [ (_mm_mask_sllv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (_mm_mask_sllv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o 
                                  lane_size num_7 num_8 
                                  num_9 (hydride:interpret vc_10 env) prec_i_o 
                                  num_12)
             ]
            [ (_mm256_cmpgt_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm256_cmpgt_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 lane_size num_4 prec_i_o 
                                 num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                 num_9)
             ]
            [ (_mm_cmpge_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm_cmpge_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                   lane_size num_4 prec_o 
                                   num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                   prec_i num_10)
             ]
            [ (_mm_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (_mm_mask_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 num_7 num_8 
                                     num_9 num_10 num_11 
                                     num_12)
             ]
            [ (_mm256_srl_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (_mm256_srl_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                               size_i_o lane_size num_5 
                               num_6 num_7 (hydride:interpret vc_8 env) 
                               num_9 prec_i_o num_11 
                               num_12)
             ]
            [ (_mm_avg_pu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (_mm_avg_pu8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                          lane_size num_4 prec_i_o 
                          num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                          num_9)
             ]
            [ (_mm512_andnot_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm512_andnot_si512 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                                  lane_size num_4 prec_i_o 
                                  num_6 num_7 num_8 
                                  num_9 num_10)
             ]
            [ (_mm512_cmple_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (_mm512_cmple_epi16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                      lane_size num_4 prec_o 
                                      num_6 (hydride:interpret vc_7 env) (hydride:interpret vc_8 env) 
                                      prec_i num_10)
             ]
            [ (_mm256_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm256_mask_cmpgt_epu32_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           (hydride:interpret v3 env) size_i_o lane_size 
                                           num_6 prec_o num_8 
                                           (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                           num_12)
             ]
            [ (_mm512_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12 num_13)
             (_mm512_maskz_mulhrs_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                        (hydride:interpret v3 env) size_i_o lane_size 
                                        num_6 prec_i_o num_8 
                                        num_9 (hydride:interpret vc_10 env) (hydride:interpret vc_11 env) 
                                        num_12 num_13)
             ]
            [ (_mm256_set_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (_mm256_set_m128i (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                               lane_size num_4 prec_i_o 
                               num_6 num_7 num_8 
                               num_9 num_10 num_11)
             ]
            [ (_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (_mm512_mask_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) num_4 num_5 
                                      prec_i_o num_7 num_8)
             ]
            [ (_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (_mm512_dpbusd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                  size_i_o lane_size num_5 
                                  prec_i num_7 num_8 
                                  num_9)
             ]
            [ (_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (_mm256_mask_mul_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 num_7 num_8 
                                    prec_i_o num_10)
             ]
            [ (_mm_unpacklo_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (_mm_unpacklo_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7 num_8 
                                num_9 num_10 num_11)
             ]
            [ (_mm512_mask_max_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm512_mask_max_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) size_i_o lane_size 
                                    num_6 prec_i_o num_8 
                                    num_9)
             ]
            [ (_mm512_mask_andnot_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (_mm512_mask_andnot_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                       (hydride:interpret v3 env) size_i_o lane_size 
                                       num_6 prec_i_o num_8 
                                       num_9)
             ]
            [ (_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (_mm256_adds_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 prec_i_o 
                                num_6 num_7)
             ]
            [ (_mm256_maskz_mullo_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (_mm256_maskz_mullo_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                       (hydride:interpret v3 env) size_i_o lane_size 
                                       num_6 prec_i_o num_8 
                                       num_9 num_10 num_11)
             ]
            [ (_mm512_maskz_broadcast_i64x4_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm512_maskz_broadcast_i64x4 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                           size_i_o lane_size num_5 
                                           prec_i_o num_7 num_8 
                                           num_9)
             ]
            [ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (_mm_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                size_i_o lane_size num_5 
                                prec_i num_7 num_8 
                                num_9)
             ]
            [ (_mm_sign_pi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o vc_10 num_11 num_12)
             (_mm_sign_pi8 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                           size_i_o lane_size num_5 
                           num_6 num_7 (hydride:interpret vc_8 env) 
                           prec_i_o (hydride:interpret vc_10 env) num_11 
                           num_12)
             ]
            [ (_mm_cvtsi32_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (_mm_cvtsi32_si128 (hydride:interpret v0 env) size_o lane_size 
                                num_3 prec_i_o num_5 
                                num_6 num_7 num_8)
             ]
            [ (_mm_mulhi_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (_mm_mulhi_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                              lane_size num_4 prec_i_o 
                              num_6 num_7 num_8 
                              num_9)
             ]
            [ (_mm_add_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (_mm_add_si64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                           lane_size num_4 prec_i_o 
                           num_6 num_7 num_8 
                           num_9 num_10)
             ]
            [ (_mm256_mask_mov_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (_mm256_mask_mov_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    size_i_o lane_size num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (_mm_extract_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (_mm_extract_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                lane_size num_4 num_5 
                                num_6 prec_o num_8 
                                num_9 prec_i (hydride:interpret vc_11 env) 
                                num_12 num_13 num_14)
             ]
            [ (_mm256_maskz_set1_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_maskz_set1_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      size_i_o lane_size num_5 
                                      prec_i_o num_7 num_8 
                                      num_9)
             ]
            [ (_mm_sra_pi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 num_9 prec_i_o vc_11 vc_12 num_13 num_14 num_15)
             (_mm_sra_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                           lane_size num_4 num_5 
                           num_6 (hydride:interpret vc_7 env) num_8 
                           num_9 prec_i_o (hydride:interpret vc_11 env) 
                           (hydride:interpret vc_12 env) num_13 num_14 
                           num_15)
             ]
            [ (_mm512_mask_cmplt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (_mm512_mask_cmplt_epi8_mask (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) size_i_o lane_size 
                                          num_6 prec_o num_8 
                                          (hydride:interpret vc_9 env) (hydride:interpret vc_10 env) prec_i 
                                          num_12)
             ]
            [ (_m_pextrw_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (_m_pextrw (hydride:interpret v0 env) (hydride:interpret v1 env) size_o 
                        lane_size num_4 num_5 
                        num_6 prec_o num_8 
                        num_9 prec_i (hydride:interpret vc_11 env) 
                        num_12 num_13 num_14 
                        num_15)
             ]
            [ (_mm512_maskz_mul_epu32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (_mm512_maskz_mul_epu32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) size_i_o lane_size 
                                     num_6 num_7 num_8 
                                     prec_i_o num_10)
             ]
            [ (_mm_rol_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (_mm_rol_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                            lane_size num_4 num_5 
                            num_6 prec_i_o (hydride:interpret vc_8 env) 
                            (hydride:interpret vc_9 env) num_10 num_11)
             ]
            [ (_mm_unpackhi_epi8_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (_mm_unpackhi_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                prec_i_o num_4 num_5)
             ]
            [ (_mm512_broadcastw_epi16_dsl v0 num_1 prec_i_o)
             (_mm512_broadcastw_epi16 (hydride:interpret v0 env) num_1 prec_i_o)
             ]
            [ (_mm_hadds_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (_mm_hadds_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                             num_3 num_4 num_5 
                             num_6)
             ]
            [ (_mm256_hadd_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (_mm256_hadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                prec_i_o num_4 num_5)
             ]
            [ (_mm_cvtsepi64_epi16_dsl v0 num_1 prec_o prec_i num_4)
             (_mm_cvtsepi64_epi16 (hydride:interpret v0 env) num_1 prec_o 
                                  prec_i num_4)
             ]
            [ (_mm256_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
             (_mm256_maskz_madd52lo_epu64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) (hydride:interpret v4 env) num_5 
                                          num_6)
             ]
            [ (_mm256_mask_adds_epu8_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (_mm256_mask_adds_epu8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) num_4 prec_i_o)
             ]
            [ (_mm512_mask_rem_epi32_dsl v0 v1 v2 v3)
             (_mm512_mask_rem_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env))
             ]
            [ (_mm512_unpacklo_epi64_dsl v0 v1 num_2)
             (_mm512_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
             ]
            [ (_mm256_dpbusds_epi32_dsl v0 v1 v2 size_i_o)
             (_mm256_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                   size_i_o)
             ]
            [ (_mm_unpackhi_epi64_dsl v0 v1 num_2 num_3)
             (_mm_unpackhi_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                 num_3)
             ]
            [ (_mm512_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (_mm512_maskz_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                         (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o)
             ]
            [ (_mm256_unpacklo_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_unpacklo_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                    lane_size num_4 num_5 
                                    prec_i_o num_7 num_8 
                                    num_9)
             ]
            [ (_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i_o)
             (_mm256_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                   size_i_o)
             ]
            [ (_mm_hadd_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (_mm_hadd_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            num_3 num_4 num_5 
                            prec_i_o num_7 num_8 
                            num_9)
             ]
            [ (_mm_madd_pi16_dsl v0 v1 num_2)
             (_mm_madd_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
             ]
            [ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (_mm512_mask_div_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) num_4 num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (_mm256_subs_epi8_dsl v0 v1 num_2 prec_i_o)
             (_mm256_subs_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                               prec_i_o)
             ]
            [ (_mm512_unpacklo_epi16_dsl v0 v1 prec_i_o num_3)
             (_mm512_unpacklo_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) prec_i_o 
                                    num_3)
             ]
            [ (_mm256_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
             (_mm256_maskz_broadcast_i32x2 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                           num_3 prec_i_o num_5)
             ]
            [ (_mm512_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
             (_mm512_mask_madd_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) num_4)
             ]
            [ (_mm256_hadds_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (_mm256_hadds_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                 lane_size num_4 num_5 
                                 num_6 num_7 num_8 
                                 prec_i_o num_10 num_11 
                                 num_12 num_13 num_14 
                                 num_15)
             ]
            [ (_mm256_mask_maddubs_epi16_dsl v0 v1 v2 v3 num_4)
             (_mm256_mask_maddubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                        (hydride:interpret v3 env) num_4)
             ]
            [ (_mm_hsubs_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (_mm_hsubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                              num_3 num_4 num_5 
                              num_6)
             ]
            [ (_mm_rem_epi32_dsl v0 v1 num_2 prec_i_o)
             (_mm_rem_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            prec_i_o)
             ]
            [ (_mm256_madd52hi_epu64_dsl v0 v1 v2 num_3 num_4)
             (_mm256_madd52hi_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    num_3 num_4)
             ]
            [ (_mm256_maskz_unpackhi_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (_mm256_maskz_unpackhi_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                         (hydride:interpret v3 env) num_4 num_5 
                                         num_6 prec_i_o num_8 
                                         num_9 num_10)
             ]
            [ (_mm256_unpackhi_epi16_dsl v0 v1 size_i_o prec_i_o num_4)
             (_mm256_unpackhi_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                    prec_i_o num_4)
             ]
            [ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (_mm512_mask_div_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                    (hydride:interpret v3 env) num_4 num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (_mm512_rem_epi8_dsl v0 v1 prec_i_o)
             (_mm512_rem_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) prec_i_o)
             ]
            [ (_mm_maskz_unpacklo_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8 num_9)
             (_mm_maskz_unpacklo_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) num_4 prec_i_o 
                                      num_6 num_7 num_8 
                                      num_9)
             ]
            [ (_mm256_hsub_epi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (_mm256_hsub_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                prec_i_o num_4 num_5)
             ]
            [ (_mm256_maskz_adds_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (_mm256_maskz_adds_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) num_4 prec_i_o)
             ]
            [ (_mm_div_epu64_dsl v0 v1 num_2 prec_i_o num_4)
             (_mm_div_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            prec_i_o num_4)
             ]
            [ (_mm256_unpackhi_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (_mm256_unpackhi_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                    num_3 prec_i_o num_5 
                                    num_6 num_7 num_8 
                                    num_9)
             ]
            [ (_mm512_maskz_unpacklo_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (_mm512_maskz_unpacklo_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) num_4 num_5 
                                          num_6 prec_i_o num_8 
                                          num_9 num_10)
             ]
            [ (_mm256_unpacklo_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (_mm256_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                    num_3 prec_i_o num_5 
                                    num_6 num_7 num_8 
                                    num_9)
             ]
            [ (_mm256_maskz_subs_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (_mm256_maskz_subs_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) num_4 prec_i_o)
             ]
            [ (_mm_adds_epi8_dsl v0 v1 num_2 prec_i_o)
             (_mm_adds_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            prec_i_o)
             ]
            [ (_mm_mask_unpacklo_epi64_dsl v0 v1 v2 v3 num_4 num_5)
             (_mm_mask_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                      (hydride:interpret v3 env) num_4 num_5)
             ]
            [ (_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (_mm512_mask_subs_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                     (hydride:interpret v3 env) num_4 prec_i_o)
             ]
            [ (_mm_hsub_epi32_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (_mm_hsub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                             num_3 num_4 num_5 
                             prec_i_o num_7 num_8 
                             num_9)
             ]
            [ (_mm_subs_pu8_dsl v0 v1 num_2 prec_i_o)
             (_mm_subs_pu8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                           prec_i_o)
             ]
            [ (_mm256_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
             (_mm256_mask_madd52hi_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
                                         (hydride:interpret v3 env) num_4 num_5)
             ]
            [ (_mm512_adds_epu16_dsl v0 v1 num_2 prec_i_o)
             (_mm512_adds_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                                prec_i_o)
             ]
            [ (_mm256_maskz_cvtusepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (_mm256_maskz_cvtusepi64_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                            num_3 prec_i_o num_5 
                                            num_6)
             ]
            [ (_mm256_unpacklo_epi8_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_unpacklo_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                   lane_size num_4 num_5 
                                   prec_i_o num_7 num_8 
                                   num_9)
             ]
            [ (_mm_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
             (_mm_broadcastmw_epi32 (hydride:interpret v0 env) num_1 prec_i 
                                    prec_o)
             ]
            [ (_mm256_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
             (_mm256_maskz_broadcastq_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                            num_3 prec_i_o)
             ]
            [ (_mm_cvtusepi64_epi8_dsl v0 num_1 prec_o prec_i num_4)
             (_mm_cvtusepi64_epi8 (hydride:interpret v0 env) num_1 prec_o 
                                  prec_i num_4)
             ]
            [ (_mm256_broadcast_i32x4_dsl v0 num_1 prec_i_o num_3)
             (_mm256_broadcast_i32x4 (hydride:interpret v0 env) num_1 prec_i_o 
                                     num_3)
             ]
            [ (_mm256_unpacklo_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (_mm256_unpacklo_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
                                    lane_size num_4 num_5 
                                    prec_i_o num_7 num_8 
                                    num_9)
             ]
            [ (_mm512_div_epi8_dsl v0 v1 num_2 prec_i_o num_4)
             (_mm512_div_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                              prec_i_o num_4)
             ]
            [ (_mm256_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5 num_6)
             (_mm256_maskz_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                          (hydride:interpret v3 env) num_4 num_5 
                                          num_6)
             ]
            [ (_mm_hadd_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (_mm_hadd_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
                            prec_i_o num_4 num_5 
                            num_6 num_7 num_8 
                            num_9 num_10)
             ]
            [ (_mm_maskz_cvtsepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (_mm_maskz_cvtsepi64_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
                                        num_3 prec_i_o num_5 
                                        num_6)
             ]
            [ (_mm_maddubs_pi16_dsl v0 v1 num_2)
             (_mm_maddubs_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
             ]
            [v v]
            )
  )
;; ================================================================================
