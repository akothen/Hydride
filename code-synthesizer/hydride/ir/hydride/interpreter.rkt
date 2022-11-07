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
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
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
	[ (_mm_sub_pi16_dsl v0 v1 num_2 prec_i_o)
		(_mm_sub_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_mask_extracti32x4_epi32_dsl v0 v1 v2 v3 prec_i_o)
		(_mm512_mask_extracti32x4_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) prec_i_o)
	]
	[ (_mm_maskz_sllv_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
		(_mm_maskz_sllv_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (_mm256_mask_adds_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm256_mask_adds_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_mask_cmplt_epi16_mask_dsl v0 vc_1 vc_2 v3 v4 vc_5 num_6 prec_i num_8)
		(_mm_mask_cmplt_epi16_mask (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) (hydride:interpret vc_5 env) 
		 num_6 prec_i num_8)
	]
	[ (_mm_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
		(_mm_mask_madd_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4)
	]
	[ (_mm_mask_srl_epi16_dsl v0 vc_1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
		(_mm_mask_srl_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8)
	]
	[ (_mm_mulhi_pi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm_mulhi_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm_maskz_cvtepu8_epi32_dsl v0 vc_1 v2 num_3 num_4 prec_i_o)
		(_mm_maskz_cvtepu8_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3 num_4 prec_i_o)
	]
	[ (_mm_hadd_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(_mm_hadd_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (_mm_hsubs_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
		(_mm_hsubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 num_6)
	]
	[ (_mm256_extract_epi16_dsl vc_0 v1 v2 num_3 num_4 prec_o prec_i num_7 num_8)
		(_mm256_extract_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 num_4 prec_o 
		 prec_i num_7 num_8)
	]
	[ (_mm_sra_epi64_dsl v0 v1 num_2)
		(_mm_sra_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm256_div_epi16_dsl v0 v1 num_2 prec_i_o num_4)
		(_mm256_div_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4)
	]
	[ (_mm_mask_subs_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm_mask_subs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm256_hadds_epi16_dsl v0 v1)
		(_mm256_hadds_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm256_hsub_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm256_hsub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm512_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
		(_mm512_maskz_madd52lo_epu64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) num_5 
		 num_6)
	]
	[ (_mm256_maskz_extracti64x2_epi64_dsl v0 v1 vc_2 v3 num_4 prec_i_o num_6 num_7)
		(_mm256_maskz_extracti64x2_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (_mm_maskz_cvtepi16_epi8_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
		(_mm_maskz_cvtepi16_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (_mm_hsub_pi32_dsl v0 v1)
		(_mm_hsub_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm256_mask_max_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm256_mask_max_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cmplt_epi16_dsl v0 vc_1 vc_2 v3 prec_i_o)
		(_mm_cmplt_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) prec_i_o)
	]
	[ (_mm_srli_pi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(_mm_srli_pi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cmple_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmple_epu16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm512_movepi64_mask_dsl v0 vc_1 vc_2 num_3 num_4 num_5 num_6)
		(_mm512_movepi64_mask (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 num_3 num_4 num_5 
		 num_6)
	]
	[ (_mm256_testn_epi16_mask_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i num_7)
		(_mm256_testn_epi16_mask (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) num_5 
		 prec_i num_7)
	]
	[ (_mm512_maskz_sll_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
		(_mm512_maskz_sll_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8)
	]
	[ (_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 num_4)
		(_mm256_mask_mul_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4)
	]
	[ (_mm512_cmpneq_epi8_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm512_cmpneq_epi8_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm_mulhrs_pi16_dsl v0 v1 num_2)
		(_mm_mulhrs_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm512_max_epi16_dsl v0 v1 num_2 prec_i_o)
		(_mm512_max_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_madd52lo_epu64_dsl v0 v1 v2 num_3 num_4)
		(_mm512_madd52lo_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 num_4)
	]
	[ (_m_por_dsl v0 v1 num_2 prec_i_o)
		(_m_por (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_unpackhi_epi8_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm_unpackhi_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm256_mask_mul_epu32_dsl v0 v1 v2 v3 num_4)
		(_mm256_mask_mul_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4)
	]
	[ (_mm256_maskz_mulhi_epi16_dsl v0 vc_1 v2 v3 num_4 num_5)
		(_mm256_maskz_mulhi_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5)
	]
	[ (_mm_mul_epi32_dsl v0 v1 num_2)
		(_mm_mul_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm512_packus_epi16_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
		(_mm512_packus_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
		 num_3 prec_o num_5 
		 prec_i)
	]
	[ (_mm512_sllv_epi64_dsl vc_0 v1 vc_2 v3 num_4 prec_i_o num_6)
		(_mm512_sllv_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6)
	]
	[ (_mm_unpacklo_epi64_dsl v0 v1 num_2 prec_i_o num_4)
		(_mm_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4)
	]
	[ (_mm_maskz_dpbusds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(_mm_maskz_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o)
	]
	[ (_m_paddsb_dsl v0 v1 num_2 prec_i_o)
		(_m_paddsb (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_cvtsepi64_epi16_dsl v0 num_1 prec_o prec_i num_4)
		(_mm_cvtsepi64_epi16 (hydride:interpret v0 env) num_1 prec_o 
		 prec_i num_4)
	]
	[ (_mm512_mask_testn_epi32_mask_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 v6 num_7 prec_i num_9)
		(_mm512_mask_testn_epi32_mask (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) (hydride:interpret vc_5 env) 
		 (hydride:interpret v6 env) num_7 prec_i 
		 num_9)
	]
	[ (_m_pminub_dsl v0 v1 num_2 prec_i_o)
		(_m_pminub (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm256_srl_epi64_dsl v0 vc_1 v2 num_3)
		(_mm256_srl_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3)
	]
	[ (_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o num_6)
		(_mm_srlv_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6)
	]
	[ (_mm512_srav_epi64_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o num_7)
		(_mm512_srav_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) num_5 
		 prec_i_o num_7)
	]
	[ (_mm256_maskz_slli_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
		(_mm256_maskz_slli_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8)
	]
	[ (_mm_mulhi_epu16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm_mulhi_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm256_maskz_adds_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm256_maskz_adds_epu8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_mask_cmplt_epu16_mask_dsl v0 v1 vc_2 vc_3 v4 vc_5 num_6 prec_i num_8)
		(_mm_mask_cmplt_epu16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret vc_5 env) 
		 num_6 prec_i num_8)
	]
	[ (_mm256_mask_maddubs_epi16_dsl v0 v1 v2 v3 num_4)
		(_mm256_mask_maddubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4)
	]
	[ (_mm512_mask_ror_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
		(_mm512_mask_ror_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o)
	]
	[ (_mm512_broadcast_i64x4_dsl v0 num_1 prec_i_o num_3)
		(_mm512_broadcast_i64x4 (hydride:interpret v0 env) num_1 prec_i_o 
		 num_3)
	]
	[ (_mm_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
		(_mm_maskz_broadcastq_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o)
	]
	[ (_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3)
		(_mm512_mask_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_mm256_avg_epu16_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm256_avg_epu16 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm512_mask_min_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm512_mask_min_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cvtepi64_epi32_dsl v0 num_1 prec_o prec_i num_4)
		(_mm_cvtepi64_epi32 (hydride:interpret v0 env) num_1 prec_o 
		 prec_i num_4)
	]
	[ (_mm_cmpgt_pi32_dsl vc_0 v1 v2 vc_3 num_4 prec_i_o)
		(_mm_cmpgt_pi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) num_4 prec_i_o)
	]
	[ (_mm512_maskz_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(_mm512_maskz_dpbusd_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o)
	]
	[ (_mm256_mask_abs_epi64_dsl v0 v1 v2 num_3 prec_i_o)
		(_mm256_mask_abs_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o)
	]
	[ (_mm256_mask_sll_epi64_dsl v0 v1 v2 vc_3 v4 num_5)
		(_mm256_mask_sll_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) num_5)
	]
	[ (_mm_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
		(_mm_maskz_unpackhi_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5)
	]
	[ (_mm512_mask_sub_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm512_mask_sub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_xor_epi32_dsl v0 v1 num_2 prec_i_o)
		(_mm_xor_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_blendv_epi8_dsl v0 v1 v2 num_3)
		(_mm_blendv_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3)
	]
	[ (_mm_movepi64_pi64_dsl v0 num_1 prec_i_o num_3)
		(_mm_movepi64_pi64 (hydride:interpret v0 env) num_1 prec_i_o 
		 num_3)
	]
	[ (_mm256_movm_epi64_dsl v0 vc_1 vc_2 num_3 prec_i_o)
		(_mm256_movm_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 num_3 prec_i_o)
	]
	[ (_mm256_sign_epi8_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i_o num_7 num_8)
		(_mm256_sign_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) num_5 
		 prec_i_o num_7 num_8)
	]
	[ (_mm256_maskz_cvtusepi64_epi16_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
		(_mm256_maskz_cvtusepi64_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (_mm_packus_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(_mm_packus_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 prec_o num_7 prec_i 
		 num_9)
	]
	[ (_mm512_max_epu64_dsl v0 v1 num_2 prec_i_o)
		(_mm512_max_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_maskz_subs_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm512_maskz_subs_epu8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm512_ror_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm512_ror_epi64 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm256_abs_epi16_dsl v0 num_1 prec_i_o)
		(_mm256_abs_epi16 (hydride:interpret v0 env) num_1 prec_i_o)
	]
	[ (_mm_maskz_min_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm_maskz_min_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm512_mask_mulhi_epi32_dsl v0 v1 v2 v3)
		(_mm512_mask_mulhi_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_mm_sll_epi64_dsl v0 vc_1 v2 num_3)
		(_mm_sll_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3)
	]
	[ (_mm256_unpacklo_epi64_dsl v0 v1 num_2 num_3)
		(_mm256_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3)
	]
	[ (_mm512_cmpgt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm512_cmpgt_epi16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm512_mul_epu32_dsl v0 v1 num_2)
		(_mm512_mul_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3)
		(_mm512_mask_div_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i)
		(_mm_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 size_i)
	]
	[ (_mm_maddubs_pi16_dsl v0 v1 num_2)
		(_mm_maddubs_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm512_extracti32x4_epi32_dsl v0 v1)
		(_mm512_extracti32x4_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm512_maskz_srlv_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
		(_mm512_maskz_srlv_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (_mm512_div_epu16_dsl v0 v1 num_2 prec_i_o num_4)
		(_mm512_div_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4)
	]
	[ (_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3)
		(_mm512_mask3_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i)
		(_mm256_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 size_i)
	]
	[ (_mm256_cvtepi8_epi32_dsl v0 num_1 prec_i prec_o)
		(_mm256_cvtepi8_epi32 (hydride:interpret v0 env) num_1 prec_i 
		 prec_o)
	]
	[ (_mm_maskz_or_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm_maskz_or_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cmplt_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmplt_epu16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm512_mask_rem_epu32_dsl v0 v1 v2 v3)
		(_mm512_mask_rem_epu32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_mm512_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o)
		(_mm512_mask_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) size_i_o)
	]
	[ (_mm256_hadd_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm256_hadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm256_rorv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm256_rorv_epi32 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_hsub_epi32_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(_mm_hsub_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (_mm256_srai_epi32_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
		(_mm256_srai_epi32 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) num_5 
		 prec_i_o)
	]
	[ (_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(_mm512_maskz_avg_epu16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o)
	]
	[ (_mm_cmpeq_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm_cmpeq_epi32 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o)
		(_mm_mask_dpwssd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) size_i_o)
	]
	[ (_mm512_subs_epi16_dsl v0 v1 num_2 prec_i_o)
		(_mm512_subs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_maskz_sra_epi64_dsl v0 v1 v2 vc_3 num_4)
		(_mm_maskz_sra_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) num_4)
	]
	[ (_mm_sll_pi16_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(_mm_sll_pi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cmpge_epu64_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmpge_epu64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm512_andnot_epi32_dsl v0 v1 num_2 prec_i_o)
		(_mm512_andnot_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_mulhi_epi32_dsl v0 v1)
		(_mm512_mulhi_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm256_unpacklo_epi32_dsl v0 v1 size_i_o prec_i_o num_4)
		(_mm256_unpacklo_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
		 prec_i_o num_4)
	]
	[ (_mm512_maskz_xor_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm512_maskz_xor_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_mul_su32_dsl v0 v1)
		(_mm_mul_su32 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm512_mask_unpackhi_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(_mm512_mask_unpackhi_epi8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10)
	]
	[ (_mm_set1_pi8_dsl v0 num_1 prec_i_o)
		(_mm_set1_pi8 (hydride:interpret v0 env) num_1 prec_i_o)
	]
	[ (_mm512_unpackhi_epi64_dsl v0 v1 num_2)
		(_mm512_unpackhi_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm_mask_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9 num_10)
		(_mm_mask_srav_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 (hydride:interpret v6 env) num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (_mm256_maskz_unpacklo_epi8_dsl v0 v1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(_mm256_maskz_unpacklo_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9 num_10)
	]
	[ (_mm_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
		(_mm_maskz_broadcast_i32x2 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o num_5)
	]
	[ (_mm256_maskz_mulhrs_epi16_dsl v0 vc_1 v2 v3 num_4)
		(_mm256_maskz_mulhrs_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4)
	]
	[ (_mm512_maskz_packs_epi16_dsl v0 v1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(_mm512_maskz_packs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (_mm_mask_sra_epi16_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9)
		(_mm_mask_sra_epi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret vc_4 env) (hydride:interpret v5 env) 
		 (hydride:interpret v6 env) num_7 prec_i_o 
		 num_9)
	]
	[ (_mm512_fmadd_epi32_dsl v0 v1 v2)
		(_mm512_fmadd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env))
	]
	[ (_mm_maskz_unpackhi_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8)
		(_mm_maskz_unpackhi_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6 num_7 num_8)
	]
	[ (_mm256_and_si256_dsl v0 v1 num_2 prec_i_o)
		(_mm256_and_si256 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_mask_mullo_epi64_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7)
		(_mm512_mask_mullo_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (_mm_hadds_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
		(_mm_hadds_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 num_6)
	]
	[ (_mm_unpacklo_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_mm_unpacklo_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm_cmpeq_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmpeq_epi64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm512_rem_epu16_dsl v0 v1 num_2 prec_i_o)
		(_mm512_rem_epu16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_cvtusepi64_epi8_dsl v0 num_1 prec_o prec_i num_4)
		(_mm_cvtusepi64_epi8 (hydride:interpret v0 env) num_1 prec_o 
		 prec_i num_4)
	]
	[ (_m_paddusw_dsl v0 v1 num_2 prec_i_o)
		(_m_paddusw (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_maskz_dpwssd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(_mm512_maskz_dpwssd_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o)
	]
	[ (_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o)
		(_mm_mask_dpbusd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) size_i_o)
	]
	[ (_m_packsswb_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(_m_packsswb (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 num_3 num_4 num_5 
		 prec_o num_7 prec_i 
		 num_9)
	]
	[ (_mm_mask_packus_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
		(_mm_mask_packus_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (_mm256_min_epi16_dsl v0 v1 num_2 prec_i_o)
		(_mm256_min_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
		(_mm_mask_madd52hi_epu64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5)
	]
	[ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3)
		(_mm512_mask_div_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env))
	]
	[ (_m_psllwi_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(_m_psllwi (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm256_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
		(_mm256_broadcastmw_epi32 (hydride:interpret v0 env) num_1 prec_i 
		 prec_o)
	]
	[ (_mm_mask_andnot_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm_mask_andnot_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm256_mask_add_epi8_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(_mm256_mask_add_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_dpwssd_epi32_dsl v0 v1 v2 size_i)
		(_mm_dpwssd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 size_i)
	]
	[ (_mm256_cmple_epi32_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm256_cmple_epi32_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm256_unpackhi_epi8_dsl v0 v1 size_i_o prec_i_o num_4)
		(_mm256_unpackhi_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
		 prec_i_o num_4)
	]
	[ (_mm_madd_pi16_dsl v0 v1 num_2)
		(_mm_madd_pi16 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2)
	]
	[ (_mm256_mask_cvtepi8_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o)
		(_mm256_mask_cvtepi8_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 num_4 prec_i_o)
	]
	[ (_mm256_mask_packus_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(_mm256_mask_packus_epi16 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (_mm256_packs_epi32_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
		(_mm256_packs_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) size_i_o 
		 num_3 prec_o num_5 
		 prec_i)
	]
	[ (_mm_cmpgt_epu8_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmpgt_epu8_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm256_cmpge_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm256_cmpge_epi64_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm_maskz_srl_epi64_dsl v0 v1 vc_2 vc_3 v4 num_5)
		(_mm_maskz_srl_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) num_5)
	]
	[ (_mm256_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(_mm256_maskz_dpwssds_epi32 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) size_i_o)
	]
	[ (_m_punpckhdq_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(_m_punpckhdq (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4 num_5)
	]
	[ (_mm256_dpbusd_epi32_dsl v0 v1 v2 size_i)
		(_mm256_dpbusd_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 size_i)
	]
	[ (_mm512_mask_cmpneq_epu16_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 num_6 prec_i num_8)
		(_mm512_mask_cmpneq_epu16_mask (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) (hydride:interpret vc_5 env) 
		 num_6 prec_i num_8)
	]
	[ (_mm_mask_packs_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
		(_mm_mask_packs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (_mm_mask_rol_epi64_dsl v0 v1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(_mm_mask_rol_epi64 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o)
	]
	[ (_mm256_cvtepu16_epi32_dsl v0 num_1 prec_i prec_o)
		(_mm256_cvtepu16_epi32 (hydride:interpret v0 env) num_1 prec_i 
		 prec_o)
	]
	[ (_mm_mask_unpacklo_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(_mm_mask_unpacklo_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o 
		 num_6 num_7 num_8 
		 num_9)
	]
	[ (_mm_movemask_pi8_dsl v0 num_1 num_2)
		(_mm_movemask_pi8 (hydride:interpret v0 env) num_1 num_2)
	]
	[ (_mm512_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5 num_6)
		(_mm512_maskz_unpacklo_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5 
		 num_6)
	]
	[ (_mm_maskz_srai_epi64_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 num_7 prec_i_o num_9)
		(_mm_maskz_srai_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) (hydride:interpret vc_5 env) 
		 (hydride:interpret vc_6 env) num_7 prec_i_o 
		 num_9)
	]
	[ (_mm512_mask_rolv_epi64_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
		(_mm512_mask_rolv_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o)
	]
	[ (_mm_hadd_pi32_dsl v0 v1)
		(_mm_hadd_pi32 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm256_add_epi8_dsl v0 v1 num_2 prec_i_o)
		(_mm256_add_epi8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm256_maskz_rorv_epi64_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(_mm256_maskz_rorv_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o)
	]
	[ (_mm512_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
		(_mm512_maskz_unpackhi_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 num_5)
	]
	[ (_mm256_extract_epi8_dsl vc_0 v1 v2 num_3 num_4 prec_i num_6)
		(_mm256_extract_epi8 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 num_4 prec_i 
		 num_6)
	]
	[ (_mm256_maskz_max_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm256_maskz_max_epu8 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_sra_pi16_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
		(_mm_sra_pi16 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret vc_2 env) 
		 (hydride:interpret v3 env) (hydride:interpret vc_4 env) num_5 
		 prec_i_o)
	]
	[ (_mm256_mask_cvtsepi32_epi16_dsl v0 v1 v2 num_3 prec_i_o num_5 num_6)
		(_mm256_mask_cvtsepi32_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm_rolv_epi32 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o)
		(_mm256_mask_dpbusds_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) size_i_o)
	]
	[ (_mm256_rol_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm256_rol_epi64 (hydride:interpret vc_0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm512_maskz_and_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(_mm512_maskz_and_epi64 (hydride:interpret v0 env) (hydride:interpret vc_1 env) (hydride:interpret v2 env) 
		 (hydride:interpret v3 env) num_4 prec_i_o)
	]
	[ (_mm_cmplt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
		(_mm_cmplt_epi16_mask (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i num_4)
	]
	[ (_mm256_blend_epi16_dsl v0 v1 v2)
		(_mm256_blend_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env) (hydride:interpret v2 env))
	]
	[ (_mm256_hsubs_epi16_dsl v0 v1)
		(_mm256_hsubs_epi16 (hydride:interpret v0 env) (hydride:interpret v1 env))
	]
	[ (_mm256_extracti32x4_epi32_dsl v0 v1 prec_i_o num_3)
		(_mm256_extracti32x4_epi32 (hydride:interpret v0 env) (hydride:interpret v1 env) prec_i_o 
		 num_3)
	]
	[ (_mm_subs_epu8_dsl v0 v1 num_2 prec_i_o)
		(_mm_subs_epu8 (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (_mm512_mask_srli_epi64_dsl vc_0 v1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
		(_mm512_mask_srli_epi64 (hydride:interpret vc_0 env) (hydride:interpret v1 env) (hydride:interpret v2 env) 
		 (hydride:interpret vc_3 env) (hydride:interpret v4 env) (hydride:interpret v5 env) 
		 num_6 prec_i_o num_8)
	]
	[ (_mm256_set_m128i_dsl v0 v1 num_2 prec_i_o num_4)
		(_mm256_set_m128i (hydride:interpret v0 env) (hydride:interpret v1 env) num_2 
		 prec_i_o num_4)
	]
	[v (error "Unrecognized Term in Interpreterv")]
 )
)
;; ================================================================================
