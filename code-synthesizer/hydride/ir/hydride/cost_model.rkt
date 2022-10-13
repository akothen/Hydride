#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)

(require hydride/ir/hydride/definition)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================


(define cost__mm512_mulhi_epi16_dsl 5)
(define cost__m_from_int_dsl 1)
(define cost__mm_hsubs_pi16_dsl 3)
(define cost__mm256_maskz_sllv_epi32_dsl 1)
(define cost__mm256_mask_dpbusd_epi32_dsl 4)
(define cost__mm256_maskz_sra_epi32_dsl 4)
(define cost__mm512_xor_epi64_dsl 1)
(define cost__mm512_broadcast_i64x4_dsl 8)
(define cost__mm512_and_epi32_dsl 1)
(define cost__mm512_subs_epu16_dsl 1)
(define cost__mm512_maskz_srl_epi64_dsl 4)
(define cost__mm256_maskz_adds_epu16_dsl 1)
(define cost__mm_maskz_xor_epi64_dsl 1)
(define cost__mm256_min_epi8_dsl 1)
(define cost__mm256_cvtepi16_epi8_dsl 4)
(define cost__mm_extract_epi32_dsl 3)
(define cost__mm256_hsub_epi32_dsl 3)
(define cost__m_psrldi_dsl 1)
(define cost__mm256_mask_slli_epi64_dsl 1)
(define cost__mm512_xor_si512_dsl 1)
(define cost__mm256_srl_epi16_dsl 4)
(define cost__mm_maskz_cvtepu8_epi64_dsl 3)
(define cost__mm512_srai_epi64_dsl 1)
(define cost__m_paddd_dsl 1)
(define cost__mm512_subr_epi32_dsl 4)
(define cost__mm256_cvtsepi32_epi8_dsl 4)
(define cost__mm512_mulhi_epu32_dsl 4)
(define cost__mm256_mask_srav_epi16_dsl 1)
(define cost__mm512_mask3_fmadd_epi32_dsl 4)
(define cost__mm_mask_sra_epi64_dsl 2)
(define cost__mm_srav_epi64_dsl 1)
(define cost__mm_mask_min_epi8_dsl 1)
(define cost__mm_mask_min_epu16_dsl 1)
(define cost__m_punpckhdq_dsl 1)
(define cost__mm_cmplt_epu16_mask_dsl 3)
(define cost__mm512_mask_srl_epi32_dsl 4)
(define cost__mm256_mask_cvtepi32_epi8_dsl 4)
(define cost__mm_mask_cmpeq_epi8_mask_dsl 3)
(define cost__mm256_adds_epu16_dsl 1)
(define cost__mm_maskz_mulhi_epi16_dsl 5)
(define cost__mm256_mul_epu32_dsl 5)
(define cost__mm_maskz_dpwssd_epi32_dsl 4)
(define cost__mm512_mask_cmpgt_epi8_mask_dsl 3)
(define cost__mm256_mask_blend_epi32_dsl 1)
(define cost__mm512_srlv_epi64_dsl 1)
(define cost__mm256_hsubs_epi16_dsl 3)
(define cost__mm512_or_si512_dsl 1)
(define cost__mm_broadcastmb_epi64_dsl 4)
(define cost__mm512_maskz_cvtusepi16_epi8_dsl 4)
(define cost__mm512_maskz_srli_epi64_dsl 1)
(define cost__mm_extract_epi8_dsl 3)
(define cost__mm_cmpeq_epu8_mask_dsl 3)
(define cost__mm_maskz_srlv_epi32_dsl 1)
(define cost__mm512_max_epu32_dsl 1)
(define cost__mm_maskz_dpwssds_epi32_dsl 4)
(define cost__mm_maskz_sll_epi64_dsl 2)
(define cost__mm_movpi64_epi64_dsl 2)
(define cost__mm512_fmadd_epi32_dsl 4)
(define cost__mm_mask_add_epi32_dsl 1)
(define cost__mm_mul_su32_dsl 5)
(define cost__mm_mask_cmpge_epi64_mask_dsl 3)
(define cost__mm256_cmple_epu32_mask_dsl 3)
(define cost__mm512_test_epi32_mask_dsl 3)
(define cost__mm_hsub_pi32_dsl 3)
(define cost__mm_maskz_subs_epu8_dsl 1)
(define cost__mm_subs_pi8_dsl 1)
(define cost__mm512_mask_srli_epi64_dsl 1)
(define cost__mm256_cmpgt_epu64_mask_dsl 3)
(define cost__mm_cmpeq_epi32_dsl 1)
(define cost__mm256_mask_sll_epi64_dsl 4)
(define cost__mm256_mask_cvtepi16_epi64_dsl 3)
(define cost__mm_cvtsi64_si128_dsl 2)
(define cost__mm_rorv_epi32_dsl 1)
(define cost__mm512_sra_epi64_dsl 4)
(define cost__mm_mask_cvtsepi16_epi8_dsl 4)
(define cost__mm_maskz_dpbusds_epi32_dsl 4)
(define cost__mm512_min_epu64_dsl 3)
(define cost__mm_mask_max_epi32_dsl 1)
(define cost__mm256_mask_srl_epi64_dsl 4)
(define cost__mm256_mulhrs_epi16_dsl 5)
(define cost__mm_cvtm64_si64_dsl 2)
(define cost__mm_extract_epi16_dsl 3)
(define cost__mm256_cvtepu8_epi16_dsl 3)
(define cost__mm256_mask_srlv_epi64_dsl 1)
(define cost__mm_hsub_pi16_dsl 3)
(define cost__mm512_maskz_rorv_epi64_dsl 1)
(define cost__mm256_mask_test_epi64_mask_dsl 3)
(define cost__mm_maskz_avg_epu8_dsl 1)
(define cost__mm512_ror_epi64_dsl 1)
(define cost__mm_mask_sub_epi32_dsl 1)
(define cost__mm256_mask_cmplt_epu64_mask_dsl 3)
(define cost__m_psllwi_dsl 1)
(define cost__mm256_max_epi64_dsl 3)
(define cost__mm_sub_epi8_dsl 1)
(define cost__mm_cvtsi32_si64_dsl 1)
(define cost__mm_maskz_adds_epi16_dsl 1)
(define cost__mm_unpackhi_pi32_dsl 1)
(define cost__mm256_mask_cmple_epu32_mask_dsl 3)
(define cost__mm512_andnot_epi32_dsl 1)
(define cost__mm512_dpwssd_epi32_dsl 4)
(define cost__mm512_mask_mulhi_epu32_dsl 4)
(define cost__mm_abs_epi8_dsl 1)
(define cost__mm256_sll_epi64_dsl 4)
(define cost__mm256_cvtepi8_epi16_dsl 3)
(define cost__mm256_mask_testn_epi16_mask_dsl 3)
(define cost__mm512_cmpgt_epi32_mask_dsl 3)
(define cost__mm512_mul_epi32_dsl 5)
(define cost__mm256_mask_cmple_epi32_mask_dsl 3)
(define cost__mm_maskz_dpbusd_epi32_dsl 4)
(define cost__mm_movm_epi8_dsl 4)
(define cost__mm_sub_si64_dsl 1)
(define cost__mm512_maskz_srai_epi16_dsl 1)
(define cost__mm512_maskz_and_epi64_dsl 1)
(define cost__mm256_mask_abs_epi16_dsl 1)
(define cost__mm256_mask_rolv_epi32_dsl 1)
(define cost__mm256_movepi16_mask_dsl 1)
(define cost__mm512_mask_subr_epi32_dsl 4)
(define cost__mm_mask_dpwssd_epi32_dsl 4)
(define cost__mm_movemask_epi8_dsl 2)
(define cost__mm512_mask_cmpge_epu32_mask_dsl 3)
(define cost__mm_cvtsi64x_si128_dsl 2)
(define cost__mm_sllv_epi64_dsl 1)
(define cost__mm_extract_pi16_dsl 3)
(define cost__mm512_maskz_srl_epi16_dsl 4)
(define cost__mm_dpwssds_epi32_dsl 4)
(define cost__mm256_maskz_or_epi32_dsl 1)
(define cost__mm256_rolv_epi32_dsl 1)
(define cost__mm_blendv_epi8_dsl 2)
(define cost__mm256_setr_m128i_dsl 3)
(define cost__mm256_mask_cmpneq_epi16_mask_dsl 3)
(define cost__mm256_testn_epi32_mask_dsl 3)
(define cost__mm256_blend_epi16_dsl 1)
(define cost__mm256_maskz_rol_epi64_dsl 1)
(define cost__mm256_mask_subs_epi8_dsl 1)
(define cost__mm256_or_epi32_dsl 1)
(define cost__mm512_broadcastd_epi32_dsl 3)
(define cost__mm512_and_si512_dsl 1)
(define cost__mm256_maskz_slli_epi16_dsl 1)
(define cost__mm512_cmplt_epi64_mask_dsl 3)
(define cost__mm_cmpneq_epi32_mask_dsl 3)
(define cost__mm_maskz_ror_epi32_dsl 1)
(define cost__mm512_cmpge_epu64_mask_dsl 3)
(define cost__mm256_mask_dpbusds_epi32_dsl 4)
(define cost__mm_cmplt_epi16_dsl 1)
(define cost__mm512_cvtusepi32_epi8_dsl 4)
(define cost__mm_mask_sllv_epi64_dsl 1)
(define cost__mm256_cmpgt_epi64_dsl 3)
(define cost__mm_cmpge_epi32_mask_dsl 3)
(define cost__mm_mask_dpwssds_epi32_dsl 4)
(define cost__mm256_srl_epi64_dsl 4)
(define cost__mm_avg_pu8_dsl 1)
(define cost__mm512_andnot_si512_dsl 1)
(define cost__mm512_cmple_epi16_mask_dsl 3)
(define cost__mm256_mask_cmpgt_epu32_mask_dsl 3)
(define cost__mm512_maskz_mulhrs_epi16_dsl 5)
(define cost__mm256_set_m128i_dsl 3)
(define cost__mm512_mask_fmadd_epi32_dsl 4)
(define cost__mm512_dpbusd_epi32_dsl 4)
(define cost__mm256_mask_mul_epi32_dsl 5)
(define cost__mm_unpacklo_pi32_dsl 1)
(define cost__mm512_mask_max_epu16_dsl 1)
(define cost__mm512_mask_andnot_epi64_dsl 1)
(define cost__mm256_adds_epi16_dsl 1)
(define cost__mm256_maskz_mullo_epi32_dsl 10)
(define cost__mm512_maskz_broadcast_i64x4_dsl 8)
(define cost__mm_dpbusds_epi32_dsl 4)
(define cost__mm_sign_pi8_dsl 1)
(define cost__mm_cvtsi32_si128_dsl 2)
(define cost__mm_mulhi_epu16_dsl 5)
(define cost__mm_add_si64_dsl 1)
(define cost__mm256_mask_mov_epi32_dsl 1)
(define cost__mm_extract_epi64_dsl 3)
(define cost__mm256_maskz_set1_epi16_dsl 3)
(define cost__mm_sra_pi32_dsl 1)
(define cost__mm512_mask_cmplt_epi8_mask_dsl 3)
(define cost__m_pextrw_dsl 3)
(define cost__mm512_maskz_mul_epu32_dsl 5)
(define cost__mm_rol_epi64_dsl 1)
(define cost__mm_unpackhi_epi8_dsl 1)
(define cost__mm512_broadcastw_epi16_dsl 3)
(define cost__mm_hadds_pi16_dsl 3)
(define cost__mm256_hadd_epi32_dsl 3)
(define cost__mm_cvtsepi64_epi16_dsl 4)
(define cost__mm256_maskz_madd52lo_epu64_dsl 4)
(define cost__mm256_mask_adds_epu8_dsl 1)
(define cost__mm512_mask_rem_epi32_dsl 4)
(define cost__mm512_unpacklo_epi64_dsl 1)
(define cost__mm256_dpbusds_epi32_dsl 4)
(define cost__mm_unpackhi_epi64_dsl 1)
(define cost__mm512_maskz_dpwssds_epi32_dsl 4)
(define cost__mm256_unpacklo_epi16_dsl 1)
(define cost__mm256_dpwssds_epi32_dsl 4)
(define cost__mm_hadd_pi16_dsl 3)
(define cost__mm_madd_pi16_dsl 4)
(define cost__mm512_mask_div_epi32_dsl 4)
(define cost__mm256_subs_epi8_dsl 1)
(define cost__mm512_unpacklo_epi16_dsl 1)
(define cost__mm256_maskz_broadcast_i32x2_dsl 3)
(define cost__mm512_mask_madd_epi16_dsl 5)
(define cost__mm256_hadds_epi16_dsl 3)
(define cost__mm256_mask_maddubs_epi16_dsl 5)
(define cost__mm_hsubs_epi16_dsl 3)
(define cost__mm_rem_epi32_dsl 4)
(define cost__mm256_madd52hi_epu64_dsl 4)
(define cost__mm256_maskz_unpackhi_epi8_dsl 1)
(define cost__mm256_unpackhi_epi16_dsl 1)
(define cost__mm512_mask_div_epu32_dsl 4)
(define cost__mm512_rem_epi8_dsl 4)
(define cost__mm_maskz_unpacklo_epi8_dsl 1)
(define cost__mm256_hsub_epi16_dsl 3)
(define cost__mm256_maskz_adds_epi8_dsl 1)
(define cost__mm_div_epu64_dsl 4)
(define cost__mm256_unpackhi_epi64_dsl 1)
(define cost__mm512_maskz_unpacklo_epi16_dsl 1)
(define cost__mm256_unpacklo_epi64_dsl 1)
(define cost__mm256_maskz_subs_epi8_dsl 1)
(define cost__mm_adds_epi8_dsl 1)
(define cost__mm_mask_unpacklo_epi64_dsl 1)
(define cost__mm512_mask_subs_epu16_dsl 1)
(define cost__mm_hsub_epi32_dsl 3)
(define cost__mm_subs_pu8_dsl 1)
(define cost__mm256_mask_madd52hi_epu64_dsl 4)
(define cost__mm512_adds_epu16_dsl 1)
(define cost__mm256_maskz_cvtusepi64_epi32_dsl 4)
(define cost__mm256_unpacklo_epi8_dsl 1)
(define cost__mm_broadcastmw_epi32_dsl 4)
(define cost__mm256_maskz_broadcastq_epi64_dsl 3)
(define cost__mm_cvtusepi64_epi8_dsl 4)
(define cost__mm256_broadcast_i32x4_dsl 8)
(define cost__mm256_unpacklo_epi32_dsl 1)
(define cost__mm512_div_epi8_dsl 4)
(define cost__mm256_maskz_unpacklo_epi64_dsl 1)
(define cost__mm_hadd_pi32_dsl 3)
(define cost__mm_maskz_cvtsepi64_epi32_dsl 4)
(define cost__mm_maddubs_pi16_dsl 4)

(define (hydride:cost prog)
  (destruct prog
            [(idx-i id) 1]
            [(idx-j id) 1]
            [(reg id) 1]
            [(lit v) 1 ]
            [(nop v1) (+ 1 (hydride:cost v1))]
            [(dim-x id) 4]
            [(dim-y id) 4]
            [(idx-add i1 i2) (+ 4 (hydride:cost i1) (hydride:cost i2))]
            [(idx-mul i1 i2) (+ 4 (hydride:cost i1) (hydride:cost i2))]
            [ (vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o)
             (+ 2 (* 1 (hydride:cost  v0))  
                )
             ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (+ 2 (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (+ 2 (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (+ 2 (* 1 (hydride:cost  v0)) )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (+ 2 (* 1 (hydride:cost  v0)) )
             ]
            [ (_mm512_mulhi_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (+ cost__mm512_mulhi_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_m_from_int_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__m_from_int_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_hsubs_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost__mm_hsubs_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  



                )
             ]
            [ (_mm256_maskz_sllv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (+ cost__mm256_maskz_sllv_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost__mm256_mask_dpbusd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  


                )
             ]
            [ (_mm256_maskz_sra_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 num_11 prec_i_o vc_13 vc_14 num_15 num_16 num_17)
             (+ cost__mm256_maskz_sra_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  
                (* 14 (hydride:cost  vc_13))  (* 15 (hydride:cost  vc_14))  
                )
             ]
            [ (_mm512_xor_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_xor_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_broadcast_i64x4_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (+ cost__mm512_broadcast_i64x4_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_and_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_subs_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_subs_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_maskz_srl_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (+ cost__mm512_maskz_srl_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm256_maskz_adds_epu16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_maskz_xor_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_maskz_xor_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm256_min_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm256_cvtepi16_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (+ cost__mm256_cvtepi16_epi8_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_extract_epi32_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (+ cost__mm_extract_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  

                )
             ]
            [ (_mm256_hsub_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (+ cost__mm256_hsub_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  




                )
             ]
            [ (_m_psrldi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (+ cost__m_psrldi_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  

                )
             ]
            [ (_mm256_mask_slli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (+ cost__mm256_mask_slli_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm512_xor_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm512_xor_si512_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_srl_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 num_10 prec_i_o num_12 num_13 num_14)
             (+ cost__mm256_srl_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  

                )
             ]
            [ (_mm_maskz_cvtepu8_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (+ cost__mm_maskz_cvtepu8_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm512_srai_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13 num_14)
             (+ cost__mm512_srai_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  
                (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_m_paddd_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__m_paddd_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_subr_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm256_cvtsepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (+ cost__mm256_cvtsepi32_epi8_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_mulhi_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 num_8 num_9)
             (+ cost__mm512_mulhi_epu32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  
                )
             ]
            [ (_mm256_mask_srav_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 prec_i_o vc_11 vc_12 num_13)
             (+ cost__mm256_mask_srav_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 12 (hydride:cost  vc_11))  
                (* 13 (hydride:cost  vc_12)) )
             ]
            [ (_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost__mm512_mask3_fmadd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  
                )
             ]
            [ (_mm_mask_sra_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15)
             (+ cost__mm_mask_sra_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  
                (* 13 (hydride:cost  vc_12))  (* 14 (hydride:cost  vc_13))  
                )
             ]
            [ (_mm_srav_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 prec_i_o vc_9 vc_10 num_11)
             (+ cost__mm_srav_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  
                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10)) )
             ]
            [ (_mm_mask_min_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_mask_min_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_mask_min_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_mask_min_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_m_punpckhdq_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (+ cost__m_punpckhdq_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm_cmplt_epu16_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_mask_srl_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (+ cost__mm512_mask_srl_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm256_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_mask_cvtepi32_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_mask_cmpeq_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm_mask_cmpeq_epi8_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_adds_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm256_adds_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (+ cost__mm_maskz_mulhi_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (+ cost__mm256_mul_epu32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost__mm_maskz_dpwssd_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  


                )
             ]
            [ (_mm512_mask_cmpgt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm512_mask_cmpgt_epi8_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_mask_blend_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (+ cost__mm256_mask_blend_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm512_srlv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (+ cost__mm512_srlv_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm256_hsubs_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (+ cost__mm256_hsubs_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  




                )
             ]
            [ (_mm512_or_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm512_or_si512_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_broadcastmb_epi64_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8)
             (+ cost__mm_broadcastmb_epi64_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_maskz_cvtusepi16_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm512_maskz_cvtusepi16_epi8_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm512_maskz_srli_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (+ cost__mm512_maskz_srli_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm_extract_epi8_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (+ cost__mm_extract_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm_cmpeq_epu8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm_cmpeq_epu8_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_maskz_srlv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (+ cost__mm_maskz_srlv_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm512_max_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_max_epu32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost__mm_maskz_dpwssds_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  


                )
             ]
            [ (_mm_maskz_sll_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (+ cost__mm_maskz_sll_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm_movpi64_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_movpi64_epi64_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_fmadd_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_fmadd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm_mask_add_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_mask_add_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_mul_su32_dsl v0 v1 size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11)
             (+ cost__mm_mul_su32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_mask_cmpge_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm_mask_cmpge_epi64_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm256_cmple_epu32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_test_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (+ cost__mm512_test_epi32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm_hsub_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm_hsub_pi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_maskz_subs_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_maskz_subs_epu8_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_subs_pi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm_subs_pi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_mask_srli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (+ cost__mm512_mask_srli_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm256_cmpgt_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm256_cmpgt_epu64_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm_cmpeq_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm256_mask_sll_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (+ cost__mm256_mask_sll_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_mask_cvtepi16_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (+ cost__mm256_mask_cvtepi16_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_cvtsi64_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_cvtsi64_si128_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_rorv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm_rorv_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_sra_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (+ cost__mm512_sra_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  
                (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm_mask_cvtsepi16_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm_mask_cvtsepi16_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost__mm_maskz_dpbusds_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  


                )
             ]
            [ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_min_epu64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_mask_max_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_mask_max_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_mask_srl_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (+ cost__mm256_mask_srl_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10 num_11)
             (+ cost__mm256_mulhrs_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 9 (hydride:cost  vc_8))  
                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm_cvtm64_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_cvtm64_si64_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_extract_epi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (+ cost__mm_extract_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  

                )
             ]
            [ (_mm256_cvtepu8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (+ cost__mm256_cvtepu8_epi16_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm256_mask_srlv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (+ cost__mm256_mask_srlv_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm_hsub_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost__mm_hsub_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  



                )
             ]
            [ (_mm512_maskz_rorv_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (+ cost__mm512_maskz_rorv_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10)) )
             ]
            [ (_mm256_mask_test_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (+ cost__mm256_mask_test_epi64_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm_maskz_avg_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (+ cost__mm_maskz_avg_epu8_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10)) )
             ]
            [ (_mm512_ror_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (+ cost__mm512_ror_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 9 (hydride:cost  vc_8))  
                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm_mask_sub_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_mask_sub_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm256_mask_cmplt_epu64_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_m_psllwi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (+ cost__m_psllwi_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  

                )
             ]
            [ (_mm256_max_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm256_max_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm_sub_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_cvtsi32_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_cvtsi32_si64_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_maskz_adds_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm_maskz_adds_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_unpackhi_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (+ cost__mm_unpackhi_pi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm256_mask_cmple_epu32_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm512_andnot_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_dpwssd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (+ cost__mm512_dpwssd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm512_mask_mulhi_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 num_10 num_11)
             (+ cost__mm512_mask_mulhi_epu32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm_abs_epi8_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
             (+ cost__mm_abs_epi8_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm256_sll_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (+ cost__mm256_sll_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  

                )
             ]
            [ (_mm256_cvtepi8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (+ cost__mm256_cvtepi8_epi16_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm256_mask_testn_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (+ cost__mm256_mask_testn_epi16_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm512_cmpgt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm512_cmpgt_epi32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (+ cost__mm512_mul_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm256_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm256_mask_cmple_epi32_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost__mm_maskz_dpbusd_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  


                )
             ]
            [ (_mm_movm_epi8_dsl vc_0 vc_1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (+ cost__mm_movm_epi8_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm_sub_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm_sub_si64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_maskz_srai_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15 num_16)
             (+ cost__mm512_maskz_srai_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  
                (* 13 (hydride:cost  vc_12))  (* 14 (hydride:cost  vc_13))  
                )
             ]
            [ (_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm512_maskz_and_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_mask_abs_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (+ cost__mm256_mask_abs_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm256_mask_rolv_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (+ cost__mm256_mask_rolv_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10)) )
             ]
            [ (_mm256_movepi16_mask_dsl vc_0 vc_1 v2 size_o lane_size num_5 prec_o num_7 num_8 num_9)
             (+ cost__mm256_movepi16_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm512_mask_subr_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (+ cost__mm_mask_dpwssd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  


                )
             ]
            [ (_mm_movemask_epi8_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8)
             (+ cost__mm_movemask_epi8_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_mask_cmpge_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm512_mask_cmpge_epu32_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm_cvtsi64x_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_cvtsi64x_si128_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_sllv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (+ cost__mm_sllv_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_extract_pi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (+ cost__mm_extract_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  

                )
             ]
            [ (_mm512_maskz_srl_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (+ cost__mm512_maskz_srl_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm_dpwssds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (+ cost__mm_dpwssds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm256_maskz_or_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm256_maskz_or_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_rolv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm256_rolv_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (+ cost__mm_blendv_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm256_setr_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (+ cost__mm256_setr_m128i_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_mask_cmpneq_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm256_mask_cmpneq_epi16_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (+ cost__mm256_testn_epi32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_blend_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm256_maskz_rol_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (+ cost__mm256_maskz_rol_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm256_mask_subs_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm256_mask_subs_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm256_or_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm512_broadcastd_epi32_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (+ cost__mm512_broadcastd_epi32_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm512_and_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm512_and_si512_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_maskz_slli_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (+ cost__mm256_maskz_slli_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  

                )
             ]
            [ (_mm512_cmplt_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm512_cmplt_epi64_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_cmpneq_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm_cmpneq_epi32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_maskz_ror_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (+ cost__mm_maskz_ror_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm512_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm512_cmpge_epu64_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost__mm256_mask_dpbusds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  


                )
             ]
            [ (_mm_cmplt_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm_cmplt_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_cvtusepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (+ cost__mm512_cvtusepi32_epi8_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_mask_sllv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (+ cost__mm_mask_sllv_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  

                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm256_cmpgt_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm256_cmpgt_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_cmpge_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm_cmpge_epi32_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (+ cost__mm_mask_dpwssds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  


                )
             ]
            [ (_mm256_srl_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (+ cost__mm256_srl_epi64_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  

                )
             ]
            [ (_mm_avg_pu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (+ cost__mm_avg_pu8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm512_andnot_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm512_andnot_si512_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_cmple_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (+ cost__mm512_cmple_epi16_mask_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  (* 9 (hydride:cost  vc_8))  
                )
             ]
            [ (_mm256_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm256_mask_cmpgt_epu32_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm512_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12 num_13)
             (+ cost__mm512_maskz_mulhrs_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 11 (hydride:cost  vc_10))  (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm256_set_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (+ cost__mm256_set_m128i_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost__mm512_mask_fmadd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  
                )
             ]
            [ (_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (+ cost__mm512_dpbusd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (+ cost__mm256_mask_mul_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_unpacklo_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (+ cost__mm_unpacklo_pi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_mask_max_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm512_mask_max_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm512_mask_andnot_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (+ cost__mm512_mask_andnot_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (+ cost__mm256_adds_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm256_maskz_mullo_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (+ cost__mm256_maskz_mullo_epi32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm512_maskz_broadcast_i64x4_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm512_maskz_broadcast_i64x4_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (+ cost__mm_dpbusds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_sign_pi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o vc_10 num_11 num_12)
             (+ cost__mm_sign_pi8_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                (* 9 (hydride:cost  vc_8))  
                (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_mm_cvtsi32_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (+ cost__mm_cvtsi32_si128_dsl (* 1 (hydride:cost  v0))  

                )
             ]
            [ (_mm_mulhi_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (+ cost__mm_mulhi_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_add_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm_add_si64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_mask_mov_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (+ cost__mm256_mask_mov_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm_extract_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (+ cost__mm_extract_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  
                )
             ]
            [ (_mm256_maskz_set1_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_maskz_set1_epi16_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  


                )
             ]
            [ (_mm_sra_pi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 num_9 prec_i_o vc_11 vc_12 num_13 num_14 num_15)
             (+ cost__mm_sra_pi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 8 (hydride:cost  vc_7))  
                (* 12 (hydride:cost  vc_11))  
                (* 13 (hydride:cost  vc_12))  
                )
             ]
            [ (_mm512_mask_cmplt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (+ cost__mm512_mask_cmplt_epi8_mask_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                (* 10 (hydride:cost  vc_9))  (* 11 (hydride:cost  vc_10))  
                )
             ]
            [ (_m_pextrw_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (+ cost__m_pextrw_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                (* 12 (hydride:cost  vc_11))  

                )
             ]
            [ (_mm512_maskz_mul_epu32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (+ cost__mm512_maskz_mul_epu32_dsl (* 1 (hydride:cost  vc_0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm_rol_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (+ cost__mm_rol_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                (* 9 (hydride:cost  vc_8))  
                (* 10 (hydride:cost  vc_9)) )
             ]
            [ (_mm_unpackhi_epi8_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (+ cost__mm_unpackhi_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm512_broadcastw_epi16_dsl v0 num_1 prec_i_o)
             (+ cost__mm512_broadcastw_epi16_dsl (* 1 (hydride:cost  v0)) )
             ]
            [ (_mm_hadds_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (+ cost__mm_hadds_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm256_hadd_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (+ cost__mm256_hadd_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm_cvtsepi64_epi16_dsl v0 num_1 prec_o prec_i num_4)
             (+ cost__mm_cvtsepi64_epi16_dsl (* 1 (hydride:cost  v0))  
                )
             ]
            [ (_mm256_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
             (+ cost__mm256_maskz_madd52lo_epu64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4))  
                )
             ]
            [ (_mm256_mask_adds_epu8_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (+ cost__mm256_mask_adds_epu8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm512_mask_rem_epi32_dsl v0 v1 v2 v3)
             (+ cost__mm512_mask_rem_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm512_unpacklo_epi64_dsl v0 v1 num_2)
             (+ cost__mm512_unpacklo_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1)) )
             ]
            [ (_mm256_dpbusds_epi32_dsl v0 v1 v2 size_i_o)
             (+ cost__mm256_dpbusds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                )
             ]
            [ (_mm_unpackhi_epi64_dsl v0 v1 num_2 num_3)
             (+ cost__mm_unpackhi_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm512_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (+ cost__mm512_maskz_dpwssds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  (* 5 (hydride:cost  v4)) )
             ]
            [ (_mm256_unpacklo_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_unpacklo_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i_o)
             (+ cost__mm256_dpwssds_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                )
             ]
            [ (_mm_hadd_pi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm_hadd_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_madd_pi16_dsl v0 v1 num_2)
             (+ cost__mm_madd_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1)) )
             ]
            [ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost__mm512_mask_div_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  
                )
             ]
            [ (_mm256_subs_epi8_dsl v0 v1 num_2 prec_i_o)
             (+ cost__mm256_subs_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm512_unpacklo_epi16_dsl v0 v1 prec_i_o num_3)
             (+ cost__mm512_unpacklo_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
             (+ cost__mm256_maskz_broadcast_i32x2_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                )
             ]
            [ (_mm512_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
             (+ cost__mm512_mask_madd_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm256_hadds_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (+ cost__mm256_hadds_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  




                )
             ]
            [ (_mm256_mask_maddubs_epi16_dsl v0 v1 v2 v3 num_4)
             (+ cost__mm256_mask_maddubs_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm_hsubs_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (+ cost__mm_hsubs_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  

                )
             ]
            [ (_mm_rem_epi32_dsl v0 v1 num_2 prec_i_o)
             (+ cost__mm_rem_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_madd52hi_epu64_dsl v0 v1 v2 num_3 num_4)
             (+ cost__mm256_madd52hi_epu64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                )
             ]
            [ (_mm256_maskz_unpackhi_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost__mm256_maskz_unpackhi_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_unpackhi_epi16_dsl v0 v1 size_i_o prec_i_o num_4)
             (+ cost__mm256_unpackhi_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost__mm512_mask_div_epu32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  
                )
             ]
            [ (_mm512_rem_epi8_dsl v0 v1 prec_i_o)
             (+ cost__mm512_rem_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1)) )
             ]
            [ (_mm_maskz_unpacklo_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8 num_9)
             (+ cost__mm_maskz_unpacklo_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_hsub_epi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (+ cost__mm256_hsub_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_maskz_adds_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (+ cost__mm256_maskz_adds_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm_div_epu64_dsl v0 v1 num_2 prec_i_o num_4)
             (+ cost__mm_div_epu64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_unpackhi_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (+ cost__mm256_unpackhi_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_maskz_unpacklo_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost__mm512_maskz_unpacklo_epi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  

                )
             ]
            [ (_mm256_unpacklo_epi64_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 num_9)
             (+ cost__mm256_unpacklo_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm256_maskz_subs_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (+ cost__mm256_maskz_subs_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm_adds_epi8_dsl v0 v1 num_2 prec_i_o)
             (+ cost__mm_adds_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm_mask_unpacklo_epi64_dsl v0 v1 v2 v3 num_4 num_5)
             (+ cost__mm_mask_unpacklo_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (+ cost__mm512_mask_subs_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm_hsub_epi32_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm_hsub_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_subs_pu8_dsl v0 v1 num_2 prec_i_o)
             (+ cost__mm_subs_pu8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
             (+ cost__mm256_mask_madd52hi_epu64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3)) )
             ]
            [ (_mm512_adds_epu16_dsl v0 v1 num_2 prec_i_o)
             (+ cost__mm512_adds_epu16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_maskz_cvtusepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (+ cost__mm256_maskz_cvtusepi64_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm256_unpacklo_epi8_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_unpacklo_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
             (+ cost__mm_broadcastmw_epi32_dsl (* 1 (hydride:cost  v0))  
                )
             ]
            [ (_mm256_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
             (+ cost__mm256_maskz_broadcastq_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                )
             ]
            [ (_mm_cvtusepi64_epi8_dsl v0 num_1 prec_o prec_i num_4)
             (+ cost__mm_cvtusepi64_epi8_dsl (* 1 (hydride:cost  v0))  
                )
             ]
            [ (_mm256_broadcast_i32x4_dsl v0 num_1 prec_i_o num_3)
             (+ cost__mm256_broadcast_i32x4_dsl (* 1 (hydride:cost  v0))  
                )
             ]
            [ (_mm256_unpacklo_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost__mm256_unpacklo_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm512_div_epi8_dsl v0 v1 num_2 prec_i_o num_4)
             (+ cost__mm512_div_epi8_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  
                )
             ]
            [ (_mm256_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5 num_6)
             (+ cost__mm256_maskz_unpacklo_epi64_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  
                (* 4 (hydride:cost  v3))  
                )
             ]
            [ (_mm_hadd_pi32_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10)
             (+ cost__mm_hadd_pi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1))  


                )
             ]
            [ (_mm_maskz_cvtsepi64_epi32_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (+ cost__mm_maskz_cvtsepi64_epi32_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  vc_1))  (* 3 (hydride:cost  v2))  

                )
             ]
            [ (_mm_maddubs_pi16_dsl v0 v1 num_2)
             (+ cost__mm_maddubs_pi16_dsl (* 1 (hydride:cost  v0))  (* 2 (hydride:cost  v1)) )
             ]
            [_ 4]
            )
  )
;; ================================================================================
