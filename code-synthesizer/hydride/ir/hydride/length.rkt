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
;;                                DSL Get Length
;; ================================================================================
(define (get-length prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref env id))]
	[(lit v) (bvlength v)]
	[(nop v1) (get-length v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o) (* num_3 prec_i_o)]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) (* (/ num_2 lane_size) (* 2 num_6) prec_i_o)]
	[(_mm512_mask_testn_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		size_i_o
	]
	[(_mm512_maskz_mulhi_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		size_i_o
	]
	[(_mm_cmpge_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm512_mask_cmpge_epu8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		-1 ;; Unable to reason about length
	]
	[(_mm512_maskz_broadcast_i64x2_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm_maddubs_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		size_i_o
	]
	[(_mm256_mask_min_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm256_avg_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		size_i_o
	]
	[(_mm256_mask_cmpgt_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm512_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		size_i_o
	]
	[(_mm512_mask_cvtsepi32_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		size_i_o
	]
	[(_mm_maskz_sub_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm512_mask_div_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		size_i_o
	]
	[(_mm512_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_madd52hi_epu64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		size_i_o
	]
	[(_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		size_i_o
	]
	[(_mm512_mullo_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		size_i_o
	]
	[(_mm256_mask_cmpneq_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm512_mask_reduce_add_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_subs_epu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_abs_epi64_dsl v0 size_i_o lane_size num_3 prec_i_o num_5)
		size_i_o
	]
	[(_mm_urem_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		size_i_o
	]
	[(_mm_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		size_i_o
	]
	[(_mm256_maskz_andnot_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm256_maskz_cvtepu32_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		size_i_o
	]
	[(_mm256_mask_xor_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm512_mask_rem_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_mask_cvtepi32_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		size_i_o
	]
	[(_mm512_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		size_i_o
	]
	[(_mm512_reduce_add_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		-1 ;; Unable to reason about length
	]
	[(_mm256_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		size_i_o
	]
	[(_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_mask_cmplt_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		size_i_o
	]
	[(_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_reduce_and_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		-1 ;; Unable to reason about length
	]
	[(_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_max_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		size_i_o
	]
	[(_mm256_mask_madd52lo_epu64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		size_i_o
	]
	[(_mm256_test_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		size_i_o
	]
	[(_mm256_xor_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_cmpeq_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm512_maskz_subs_epi8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm_maskz_mul_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		size_i_o
	]
	[(_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		size_i_o
	]
	[(_mm512_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm256_maskz_min_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		size_i_o
	]
	[(_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm_dpbusds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		-1 ;; Unable to reason about length
	]
	[(_mm256_cmpneq_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_m_pmovmskb_dsl v0 size_o lane_size num_3 prec_o num_5 num_6)
		size_o
	]
	[(_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		size_i_o
	]
	[(_mm512_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm_mask_mul_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		size_i_o
	]
	[(_mm_cmpgt_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm512_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm512_mask_reduce_and_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm256_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		size_i_o
	]
	[(_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		size_i_o
	]
	[(_mm_mask_blend_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		size_i_o
	]
	[(_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm512_maskz_mov_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		size_i_o
	]
	[(_mm_cvtepu16_epi32_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		size_i_o
	]
	[(_mm256_broadcastmw_epi32_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7)
		size_o
	]
	[(_mm512_mask_div_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		size_i_o
	]
	[(_mm512_maskz_maddubs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		size_i_o
	]
	[(_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		size_i_o
	]
	[(_mm_cmplt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm512_mask_cmpge_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm_dpwssds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		-1 ;; Unable to reason about length
	]
	[(_mm_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm_dpwssd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		-1 ;; Unable to reason about length
	]
	[(_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12)
		size_i_o
	]
	[(_mm512_subs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		size_i_o
	]
	[(_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm512_mask_reduce_or_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm256_cmpgt_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		size_i_o
	]
	[(_mm256_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10)
		size_i_o
	]
	[(_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm_cvtusepi64_epi32_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		size_i_o
	]
	[(_mm512_reduce_or_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		-1 ;; Unable to reason about length
	]
	[(_mm_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		size_i_o
	]
	[(_mm256_movm_epi64_dsl v0 size_o lane_size num_3 prec_o num_5 vc_6 vc_7)
		size_o
	]
	[(_mm256_maskz_madd_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		size_i_o
	]
	[(_mm512_mask_adds_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_maskz_avg_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10)
		size_i_o
	]
	[(_mm_mask_or_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_maskz_abs_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		size_i_o
	]
	[(_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_cmpgt_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_cmplt_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		size_i_o
	]
	[(_mm256_maskz_set1_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		size_i_o
	]
	[(_mm_adds_pu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm256_mask_cmpeq_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		size_i_o
	]
	[(_mm_maskz_add_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm256_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		size_i_o
	]
	[(_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		size_i_o
	]
	[(_mm_udiv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		size_i_o
	]
	[(_mm512_broadcast_i64x2_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
		size_i_o
	]
	[(_mm512_cmple_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		size_i_o
	]
	[(_mm256_maskz_max_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm512_maskz_madd52lo_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 prec_i_o num_11 num_12 num_13)
		size_i_o
	]
	[(_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		size_i_o
	]
	[(_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		size_o
	]
	[(_mm_movepi16_mask_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 vc_7 vc_8)
		size_o
	]
	[(_mm256_mask_test_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		size_i_o
	]
	[(_mm256_mask_max_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
	[(_mm_madd_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		size_i_o
	]
	[(_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		size_i_o
	]
 )
)
;; ================================================================================
