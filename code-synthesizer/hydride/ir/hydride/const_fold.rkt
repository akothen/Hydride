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
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
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
	[ (_mm_sub_pi16_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_sub_pi16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm_sub_pi16_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_mask_extracti32x4_epi32_dsl v0 v1 v2 v3 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_extracti32x4_epi32_dsl v0-folded v1-folded v2-folded v3-folded prec_i_o ) (vector)))
]
		[else ( _mm512_mask_extracti32x4_epi32_dsl v0-folded v1-folded v2-folded v3-folded prec_i_o )]
		)
	]
	[ (_mm_maskz_sllv_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm_maskz_sllv_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( _mm_maskz_sllv_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (_mm256_mask_adds_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_adds_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_mask_adds_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_mask_cmplt_epi16_mask_dsl v0 vc_1 vc_2 v3 v4 vc_5 num_6 prec_i num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(define vc_5-folded (hydride:const-fold vc_5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? vc_5-folded))
(lit (hydride:interpret ( _mm_mask_cmplt_epi16_mask_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded vc_5-folded num_6 prec_i num_8 ) (vector)))
]
		[else ( _mm_mask_cmplt_epi16_mask_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded vc_5-folded num_6 prec_i num_8 )]
		)
	]
	[ (_mm_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_madd_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 ) (vector)))
]
		[else ( _mm_mask_madd_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 )]
		)
	]
	[ (_mm_mask_srl_epi16_dsl v0 vc_1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm_mask_srl_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o num_8 ) (vector)))
]
		[else ( _mm_mask_srl_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o num_8 )]
		)
	]
	[ (_mm_mulhi_pi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_mulhi_pi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( _mm_mulhi_pi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (_mm_maskz_cvtepu8_epi32_dsl v0 vc_1 v2 num_3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_maskz_cvtepu8_epi32_dsl v0-folded vc_1-folded v2-folded num_3 num_4 prec_i_o ) (vector)))
]
		[else ( _mm_maskz_cvtepu8_epi32_dsl v0-folded vc_1-folded v2-folded num_3 num_4 prec_i_o )]
		)
	]
	[ (_mm_hadd_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_hadd_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( _mm_hadd_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
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
	[ (_mm256_extract_epi16_dsl vc_0 v1 v2 num_3 num_4 prec_o prec_i num_7 num_8)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_extract_epi16_dsl vc_0-folded v1-folded v2-folded num_3 num_4 prec_o prec_i num_7 num_8 ) (vector)))
]
		[else ( _mm256_extract_epi16_dsl vc_0-folded v1-folded v2-folded num_3 num_4 prec_o prec_i num_7 num_8 )]
		)
	]
	[ (_mm_sra_epi64_dsl v0 v1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_sra_epi64_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( _mm_sra_epi64_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (_mm256_div_epi16_dsl v0 v1 num_2 prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_div_epi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
]
		[else ( _mm256_div_epi16_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
		)
	]
	[ (_mm_mask_subs_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_subs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_mask_subs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm256_hadds_epi16_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_hadds_epi16_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm256_hadds_epi16_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm256_hsub_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_hsub_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( _mm256_hsub_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (_mm512_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm512_maskz_madd52lo_epu64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded num_5 num_6 ) (vector)))
]
		[else ( _mm512_maskz_madd52lo_epu64_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded num_5 num_6 )]
		)
	]
	[ (_mm256_maskz_extracti64x2_epi64_dsl v0 v1 vc_2 v3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_extracti64x2_epi64_dsl v0-folded v1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( _mm256_maskz_extracti64x2_epi64_dsl v0-folded v1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (_mm_maskz_cvtepi16_epi8_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_maskz_cvtepi16_epi8_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( _mm_maskz_cvtepi16_epi8_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (_mm_hsub_pi32_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_hsub_pi32_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm_hsub_pi32_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm256_mask_max_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_max_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_mask_max_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cmplt_epi16_dsl v0 vc_1 vc_2 v3 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_cmplt_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded prec_i_o ) (vector)))
]
		[else ( _mm_cmplt_epi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded prec_i_o )]
		)
	]
	[ (_mm_srli_pi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_srli_pi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_srli_pi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cmple_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmple_epu16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmple_epu16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm512_movepi64_mask_dsl v0 vc_1 vc_2 num_3 num_4 num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded))
(lit (hydride:interpret ( _mm512_movepi64_mask_dsl v0-folded vc_1-folded vc_2-folded num_3 num_4 num_5 num_6 ) (vector)))
]
		[else ( _mm512_movepi64_mask_dsl v0-folded vc_1-folded vc_2-folded num_3 num_4 num_5 num_6 )]
		)
	]
	[ (_mm256_testn_epi16_mask_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i num_7)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm256_testn_epi16_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded num_5 prec_i num_7 ) (vector)))
]
		[else ( _mm256_testn_epi16_mask_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded num_5 prec_i num_7 )]
		)
	]
	[ (_mm512_maskz_sll_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_maskz_sll_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 ) (vector)))
]
		[else ( _mm512_maskz_sll_epi32_dsl v0-folded v1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 )]
		)
	]
	[ (_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_mul_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 ) (vector)))
]
		[else ( _mm256_mask_mul_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 )]
		)
	]
	[ (_mm512_cmpneq_epi8_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_cmpneq_epi8_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm512_cmpneq_epi8_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm_mulhrs_pi16_dsl v0 v1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_mulhrs_pi16_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( _mm_mulhrs_pi16_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (_mm512_max_epi16_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_max_epi16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm512_max_epi16_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_madd52lo_epu64_dsl v0 v1 v2 num_3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm512_madd52lo_epu64_dsl v0-folded v1-folded v2-folded num_3 num_4 ) (vector)))
]
		[else ( _mm512_madd52lo_epu64_dsl v0-folded v1-folded v2-folded num_3 num_4 )]
		)
	]
	[ (_m_por_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_por_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _m_por_dsl v0-folded v1-folded num_2 prec_i_o )]
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
	[ (_mm256_mask_mul_epu32_dsl v0 v1 v2 v3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_mul_epu32_dsl v0-folded v1-folded v2-folded v3-folded num_4 ) (vector)))
]
		[else ( _mm256_mask_mul_epu32_dsl v0-folded v1-folded v2-folded v3-folded num_4 )]
		)
	]
	[ (_mm256_maskz_mulhi_epi16_dsl v0 vc_1 v2 v3 num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_mulhi_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
]
		[else ( _mm256_maskz_mulhi_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 )]
		)
	]
	[ (_mm_mul_epi32_dsl v0 v1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_mul_epi32_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( _mm_mul_epi32_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (_mm512_packus_epi16_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_packus_epi16_dsl v0-folded v1-folded size_i_o num_3 prec_o num_5 prec_i ) (vector)))
]
		[else ( _mm512_packus_epi16_dsl v0-folded v1-folded size_i_o num_3 prec_o num_5 prec_i )]
		)
	]
	[ (_mm512_sllv_epi64_dsl vc_0 v1 vc_2 v3 num_4 prec_i_o num_6)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_sllv_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 ) (vector)))
]
		[else ( _mm512_sllv_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 )]
		)
	]
	[ (_mm_unpacklo_epi64_dsl v0 v1 num_2 prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_unpacklo_epi64_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
]
		[else ( _mm_unpacklo_epi64_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
		)
	]
	[ (_mm_maskz_dpbusds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm_maskz_dpbusds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o ) (vector)))
]
		[else ( _mm_maskz_dpbusds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o )]
		)
	]
	[ (_m_paddsb_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_paddsb_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _m_paddsb_dsl v0-folded v1-folded num_2 prec_i_o )]
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
	[ (_mm512_mask_testn_epi32_mask_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 v6 num_7 prec_i num_9)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define vc_5-folded (hydride:const-fold vc_5))
		(define v6-folded (hydride:const-fold v6))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded))
(lit (hydride:interpret ( _mm512_mask_testn_epi32_mask_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded num_7 prec_i num_9 ) (vector)))
]
		[else ( _mm512_mask_testn_epi32_mask_dsl v0-folded vc_1-folded vc_2-folded v3-folded vc_4-folded vc_5-folded v6-folded num_7 prec_i num_9 )]
		)
	]
	[ (_m_pminub_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_pminub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _m_pminub_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm256_srl_epi64_dsl v0 vc_1 v2 num_3)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_srl_epi64_dsl v0-folded vc_1-folded v2-folded num_3 ) (vector)))
]
		[else ( _mm256_srl_epi64_dsl v0-folded vc_1-folded v2-folded num_3 )]
		)
	]
	[ (_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_srlv_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 ) (vector)))
]
		[else ( _mm_srlv_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o num_6 )]
		)
	]
	[ (_mm512_srav_epi64_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o num_7)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded))
(lit (hydride:interpret ( _mm512_srav_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o num_7 ) (vector)))
]
		[else ( _mm512_srav_epi64_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o num_7 )]
		)
	]
	[ (_mm256_maskz_slli_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm256_maskz_slli_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 ) (vector)))
]
		[else ( _mm256_maskz_slli_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 )]
		)
	]
	[ (_mm_mulhi_epu16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_mulhi_epu16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( _mm_mulhi_epu16_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (_mm256_maskz_adds_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_adds_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_maskz_adds_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_mask_cmplt_epu16_mask_dsl v0 v1 vc_2 vc_3 v4 vc_5 num_6 prec_i num_8)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define vc_5-folded (hydride:const-fold vc_5))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? vc_5-folded))
(lit (hydride:interpret ( _mm_mask_cmplt_epu16_mask_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded vc_5-folded num_6 prec_i num_8 ) (vector)))
]
		[else ( _mm_mask_cmplt_epu16_mask_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded vc_5-folded num_6 prec_i num_8 )]
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
	[ (_mm512_mask_ror_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_mask_ror_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded num_6 prec_i_o ) (vector)))
]
		[else ( _mm512_mask_ror_epi32_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded num_6 prec_i_o )]
		)
	]
	[ (_mm512_broadcast_i64x4_dsl v0 num_1 prec_i_o num_3)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm512_broadcast_i64x4_dsl v0-folded num_1 prec_i_o num_3 ) (vector)))
]
		[else ( _mm512_broadcast_i64x4_dsl v0-folded num_1 prec_i_o num_3 )]
		)
	]
	[ (_mm_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_maskz_broadcastq_epi64_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o ) (vector)))
]
		[else ( _mm_maskz_broadcastq_epi64_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o )]
		)
	]
	[ (_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_mm256_avg_epu16_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_avg_epu16_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_avg_epu16_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm512_mask_min_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_min_epu16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_mask_min_epu16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cvtepi64_epi32_dsl v0 num_1 prec_o prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm_cvtepi64_epi32_dsl v0-folded num_1 prec_o prec_i num_4 ) (vector)))
]
		[else ( _mm_cvtepi64_epi32_dsl v0-folded num_1 prec_o prec_i num_4 )]
		)
	]
	[ (_mm_cmpgt_pi32_dsl vc_0 v1 v2 vc_3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded))
(lit (hydride:interpret ( _mm_cmpgt_pi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_cmpgt_pi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm512_maskz_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm512_maskz_dpbusd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o ) (vector)))
]
		[else ( _mm512_maskz_dpbusd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o )]
		)
	]
	[ (_mm256_mask_abs_epi64_dsl v0 v1 v2 num_3 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_mask_abs_epi64_dsl v0-folded v1-folded v2-folded num_3 prec_i_o ) (vector)))
]
		[else ( _mm256_mask_abs_epi64_dsl v0-folded v1-folded v2-folded num_3 prec_i_o )]
		)
	]
	[ (_mm256_mask_sll_epi64_dsl v0 v1 v2 vc_3 v4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm256_mask_sll_epi64_dsl v0-folded v1-folded v2-folded vc_3-folded v4-folded num_5 ) (vector)))
]
		[else ( _mm256_mask_sll_epi64_dsl v0-folded v1-folded v2-folded vc_3-folded v4-folded num_5 )]
		)
	]
	[ (_mm_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_maskz_unpackhi_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
]
		[else ( _mm_maskz_unpackhi_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 )]
		)
	]
	[ (_mm512_mask_sub_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_sub_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_mask_sub_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_xor_epi32_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_xor_epi32_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm_xor_epi32_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm_blendv_epi8_dsl v0 v1 v2 num_3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_blendv_epi8_dsl v0-folded v1-folded v2-folded num_3 ) (vector)))
]
		[else ( _mm_blendv_epi8_dsl v0-folded v1-folded v2-folded num_3 )]
		)
	]
	[ (_mm_movepi64_pi64_dsl v0 num_1 prec_i_o num_3)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm_movepi64_pi64_dsl v0-folded num_1 prec_i_o num_3 ) (vector)))
]
		[else ( _mm_movepi64_pi64_dsl v0-folded num_1 prec_i_o num_3 )]
		)
	]
	[ (_mm256_movm_epi64_dsl v0 vc_1 vc_2 num_3 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded))
(lit (hydride:interpret ( _mm256_movm_epi64_dsl v0-folded vc_1-folded vc_2-folded num_3 prec_i_o ) (vector)))
]
		[else ( _mm256_movm_epi64_dsl v0-folded vc_1-folded vc_2-folded num_3 prec_i_o )]
		)
	]
	[ (_mm256_sign_epi8_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm256_sign_epi8_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( _mm256_sign_epi8_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (_mm256_maskz_cvtusepi64_epi16_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_maskz_cvtusepi64_epi16_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( _mm256_maskz_cvtusepi64_epi16_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (_mm_packus_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_packus_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9 ) (vector)))
]
		[else ( _mm_packus_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9 )]
		)
	]
	[ (_mm512_max_epu64_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_max_epu64_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm512_max_epu64_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_maskz_subs_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_subs_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_maskz_subs_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm512_ror_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_ror_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_ror_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm256_abs_epi16_dsl v0 num_1 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm256_abs_epi16_dsl v0-folded num_1 prec_i_o ) (vector)))
]
		[else ( _mm256_abs_epi16_dsl v0-folded num_1 prec_i_o )]
		)
	]
	[ (_mm_maskz_min_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_maskz_min_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_maskz_min_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm512_mask_mulhi_epi32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_mulhi_epi32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask_mulhi_epi32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_mm_sll_epi64_dsl v0 vc_1 v2 num_3)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_sll_epi64_dsl v0-folded vc_1-folded v2-folded num_3 ) (vector)))
]
		[else ( _mm_sll_epi64_dsl v0-folded vc_1-folded v2-folded num_3 )]
		)
	]
	[ (_mm256_unpacklo_epi64_dsl v0 v1 num_2 num_3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_unpacklo_epi64_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( _mm256_unpacklo_epi64_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (_mm512_cmpgt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_cmpgt_epi16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm512_cmpgt_epi16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm512_mul_epu32_dsl v0 v1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_mul_epu32_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( _mm512_mul_epu32_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_div_epu32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask_div_epu32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i ) (vector)))
]
		[else ( _mm_dpbusds_epi32_dsl v0-folded v1-folded v2-folded size_i )]
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
	[ (_mm512_extracti32x4_epi32_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_extracti32x4_epi32_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm512_extracti32x4_epi32_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm512_maskz_srlv_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_maskz_srlv_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( _mm512_maskz_srlv_epi32_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (_mm512_div_epu16_dsl v0 v1 num_2 prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_div_epu16_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
]
		[else ( _mm512_div_epu16_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
		)
	]
	[ (_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask3_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask3_fmadd_epi32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i ) (vector)))
]
		[else ( _mm256_dpwssds_epi32_dsl v0-folded v1-folded v2-folded size_i )]
		)
	]
	[ (_mm256_cvtepi8_epi32_dsl v0 num_1 prec_i prec_o)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm256_cvtepi8_epi32_dsl v0-folded num_1 prec_i prec_o ) (vector)))
]
		[else ( _mm256_cvtepi8_epi32_dsl v0-folded num_1 prec_i prec_o )]
		)
	]
	[ (_mm_maskz_or_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_maskz_or_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_maskz_or_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cmplt_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmplt_epu16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmplt_epu16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm512_mask_rem_epu32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_rem_epu32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask_rem_epu32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_mm512_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_dpwssds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o ) (vector)))
]
		[else ( _mm512_mask_dpwssds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o )]
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
	[ (_mm256_rorv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_rorv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_rorv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
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
	[ (_mm256_srai_epi32_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded))
(lit (hydride:interpret ( _mm256_srai_epi32_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o ) (vector)))
]
		[else ( _mm256_srai_epi32_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o )]
		)
	]
	[ (_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_maskz_avg_epu16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o ) (vector)))
]
		[else ( _mm512_maskz_avg_epu16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o )]
		)
	]
	[ (_mm_cmpeq_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_cmpeq_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_cmpeq_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_dpwssd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o ) (vector)))
]
		[else ( _mm_mask_dpwssd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o )]
		)
	]
	[ (_mm512_subs_epi16_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_subs_epi16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm512_subs_epi16_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm_maskz_sra_epi64_dsl v0 v1 v2 vc_3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded))
(lit (hydride:interpret ( _mm_maskz_sra_epi64_dsl v0-folded v1-folded v2-folded vc_3-folded num_4 ) (vector)))
]
		[else ( _mm_maskz_sra_epi64_dsl v0-folded v1-folded v2-folded vc_3-folded num_4 )]
		)
	]
	[ (_mm_sll_pi16_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_sll_pi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_sll_pi16_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cmpge_epu64_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmpge_epu64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmpge_epu64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm512_andnot_epi32_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_andnot_epi32_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm512_andnot_epi32_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_mulhi_epi32_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_mulhi_epi32_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm512_mulhi_epi32_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm256_unpacklo_epi32_dsl v0 v1 size_i_o prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_unpacklo_epi32_dsl v0-folded v1-folded size_i_o prec_i_o num_4 ) (vector)))
]
		[else ( _mm256_unpacklo_epi32_dsl v0-folded v1-folded size_i_o prec_i_o num_4 )]
		)
	]
	[ (_mm512_maskz_xor_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_xor_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_maskz_xor_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_mul_su32_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_mul_su32_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm_mul_su32_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm512_mask_unpackhi_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_unpackhi_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 ) (vector)))
]
		[else ( _mm512_mask_unpackhi_epi8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 )]
		)
	]
	[ (_mm_set1_pi8_dsl v0 num_1 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm_set1_pi8_dsl v0-folded num_1 prec_i_o ) (vector)))
]
		[else ( _mm_set1_pi8_dsl v0-folded num_1 prec_i_o )]
		)
	]
	[ (_mm512_unpackhi_epi64_dsl v0 v1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_unpackhi_epi64_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( _mm512_unpackhi_epi64_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (_mm_mask_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9 num_10)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(define v6-folded (hydride:const-fold v6))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
(lit (hydride:interpret ( _mm_mask_srav_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( _mm_mask_srav_epi16_dsl v0-folded vc_1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (_mm256_maskz_unpacklo_epi8_dsl v0 v1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_unpacklo_epi8_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 ) (vector)))
]
		[else ( _mm256_maskz_unpacklo_epi8_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 )]
		)
	]
	[ (_mm_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_maskz_broadcast_i32x2_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 ) (vector)))
]
		[else ( _mm_maskz_broadcast_i32x2_dsl v0-folded vc_1-folded v2-folded num_3 prec_i_o num_5 )]
		)
	]
	[ (_mm256_maskz_mulhrs_epi16_dsl v0 vc_1 v2 v3 num_4)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_mulhrs_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 ) (vector)))
]
		[else ( _mm256_maskz_mulhrs_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 )]
		)
	]
	[ (_mm512_maskz_packs_epi16_dsl v0 v1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_packs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( _mm512_maskz_packs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (_mm_mask_sra_epi16_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define v5-folded (hydride:const-fold v5))
		(define v6-folded (hydride:const-fold v6))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
(lit (hydride:interpret ( _mm_mask_sra_epi16_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded num_7 prec_i_o num_9 ) (vector)))
]
		[else ( _mm_mask_sra_epi16_dsl vc_0-folded v1-folded v2-folded vc_3-folded vc_4-folded v5-folded v6-folded num_7 prec_i_o num_9 )]
		)
	]
	[ (_mm512_fmadd_epi32_dsl v0 v1 v2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( _mm512_fmadd_epi32_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (_mm_maskz_unpackhi_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_maskz_unpackhi_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
]
		[else ( _mm_maskz_unpackhi_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 )]
		)
	]
	[ (_mm256_and_si256_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_and_si256_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm256_and_si256_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_mask_mullo_epi64_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_mullo_epi64_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( _mm512_mask_mullo_epi64_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (_mm_hadds_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_hadds_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 ) (vector)))
]
		[else ( _mm_hadds_epi16_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 num_6 )]
		)
	]
	[ (_mm_unpacklo_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_unpacklo_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( _mm_unpacklo_epi32_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (_mm_cmpeq_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmpeq_epi64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmpeq_epi64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm512_rem_epu16_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm512_rem_epu16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm512_rem_epu16_dsl v0-folded v1-folded num_2 prec_i_o )]
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
	[ (_m_paddusw_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_paddusw_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _m_paddusw_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_maskz_dpwssd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm512_maskz_dpwssd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o ) (vector)))
]
		[else ( _mm512_maskz_dpwssd_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o )]
		)
	]
	[ (_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_dpbusd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o ) (vector)))
]
		[else ( _mm_mask_dpbusd_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o )]
		)
	]
	[ (_m_packsswb_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_packsswb_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9 ) (vector)))
]
		[else ( _m_packsswb_dsl v0-folded v1-folded num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9 )]
		)
	]
	[ (_mm_mask_packus_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_packus_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( _mm_mask_packus_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (_mm256_min_epi16_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_min_epi16_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm256_min_epi16_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_madd52hi_epu64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
]
		[else ( _mm_mask_madd52hi_epu64_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 )]
		)
	]
	[ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_mask_div_epi32_dsl v0-folded v1-folded v2-folded v3-folded ) (vector)))
]
		[else ( _mm512_mask_div_epi32_dsl v0-folded v1-folded v2-folded v3-folded )]
		)
	]
	[ (_m_psllwi_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _m_psllwi_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _m_psllwi_dsl v0-folded vc_1-folded vc_2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm256_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm256_broadcastmw_epi32_dsl v0-folded num_1 prec_i prec_o ) (vector)))
]
		[else ( _mm256_broadcastmw_epi32_dsl v0-folded num_1 prec_i prec_o )]
		)
	]
	[ (_mm_mask_andnot_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_andnot_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_mask_andnot_epi32_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm256_mask_add_epi8_dsl v0 v1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_add_epi8_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_mask_add_epi8_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_dpwssd_epi32_dsl v0 v1 v2 size_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm_dpwssd_epi32_dsl v0-folded v1-folded v2-folded size_i ) (vector)))
]
		[else ( _mm_dpwssd_epi32_dsl v0-folded v1-folded v2-folded size_i )]
		)
	]
	[ (_mm256_cmple_epi32_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_cmple_epi32_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm256_cmple_epi32_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm256_unpackhi_epi8_dsl v0 v1 size_i_o prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_unpackhi_epi8_dsl v0-folded v1-folded size_i_o prec_i_o num_4 ) (vector)))
]
		[else ( _mm256_unpackhi_epi8_dsl v0-folded v1-folded size_i_o prec_i_o num_4 )]
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
	[ (_mm256_mask_cvtepi8_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_mask_cvtepi8_epi32_dsl v0-folded v1-folded v2-folded num_3 num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_mask_cvtepi8_epi32_dsl v0-folded v1-folded v2-folded num_3 num_4 prec_i_o )]
		)
	]
	[ (_mm256_mask_packus_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_packus_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( _mm256_mask_packus_epi16_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (_mm256_packs_epi32_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_packs_epi32_dsl v0-folded v1-folded size_i_o num_3 prec_o num_5 prec_i ) (vector)))
]
		[else ( _mm256_packs_epi32_dsl v0-folded v1-folded size_i_o num_3 prec_o num_5 prec_i )]
		)
	]
	[ (_mm_cmpgt_epu8_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmpgt_epu8_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmpgt_epu8_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm256_cmpge_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_cmpge_epi64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm256_cmpge_epi64_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm_maskz_srl_epi64_dsl v0 v1 vc_2 vc_3 v4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm_maskz_srl_epi64_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded num_5 ) (vector)))
]
		[else ( _mm_maskz_srl_epi64_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded num_5 )]
		)
	]
	[ (_mm256_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hydride:interpret ( _mm256_maskz_dpwssds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o ) (vector)))
]
		[else ( _mm256_maskz_dpwssds_epi32_dsl v0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o )]
		)
	]
	[ (_m_punpckhdq_dsl v0 v1 num_2 prec_i_o num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _m_punpckhdq_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( _m_punpckhdq_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (_mm256_dpbusd_epi32_dsl v0 v1 v2 size_i)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i ) (vector)))
]
		[else ( _mm256_dpbusd_epi32_dsl v0-folded v1-folded v2-folded size_i )]
		)
	]
	[ (_mm512_mask_cmpneq_epu16_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 num_6 prec_i num_8)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define vc_5-folded (hydride:const-fold vc_5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
(lit (hydride:interpret ( _mm512_mask_cmpneq_epu16_mask_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded num_6 prec_i num_8 ) (vector)))
]
		[else ( _mm512_mask_cmpneq_epu16_mask_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded num_6 prec_i num_8 )]
		)
	]
	[ (_mm_mask_packs_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_packs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( _mm_mask_packs_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (_mm_mask_rol_epi64_dsl v0 v1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm_mask_rol_epi64_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o ) (vector)))
]
		[else ( _mm_mask_rol_epi64_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o )]
		)
	]
	[ (_mm256_cvtepu16_epi32_dsl v0 num_1 prec_i prec_o)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm256_cvtepu16_epi32_dsl v0-folded num_1 prec_i prec_o ) (vector)))
]
		[else ( _mm256_cvtepu16_epi32_dsl v0-folded num_1 prec_i prec_o )]
		)
	]
	[ (_mm_mask_unpacklo_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_mask_unpacklo_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 num_9 ) (vector)))
]
		[else ( _mm_mask_unpacklo_epi16_dsl v0-folded v1-folded v2-folded v3-folded num_4 prec_i_o num_6 num_7 num_8 num_9 )]
		)
	]
	[ (_mm_movemask_pi8_dsl v0 num_1 num_2)
		(define v0-folded (hydride:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hydride:interpret ( _mm_movemask_pi8_dsl v0-folded num_1 num_2 ) (vector)))
]
		[else ( _mm_movemask_pi8_dsl v0-folded num_1 num_2 )]
		)
	]
	[ (_mm512_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 ) (vector)))
]
		[else ( _mm512_maskz_unpacklo_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 num_6 )]
		)
	]
	[ (_mm_maskz_srai_epi64_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 num_7 prec_i_o num_9)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(define vc_5-folded (hydride:const-fold vc_5))
		(define vc_6-folded (hydride:const-fold vc_6))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded))
(lit (hydride:interpret ( _mm_maskz_srai_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded vc_6-folded num_7 prec_i_o num_9 ) (vector)))
]
		[else ( _mm_maskz_srai_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded vc_4-folded vc_5-folded vc_6-folded num_7 prec_i_o num_9 )]
		)
	]
	[ (_mm512_mask_rolv_epi64_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_mask_rolv_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded num_6 prec_i_o ) (vector)))
]
		[else ( _mm512_mask_rolv_epi64_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded v5-folded num_6 prec_i_o )]
		)
	]
	[ (_mm_hadd_pi32_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_hadd_pi32_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm_hadd_pi32_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm256_add_epi8_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_add_epi8_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm256_add_epi8_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm256_maskz_rorv_epi64_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm256_maskz_rorv_epi64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o ) (vector)))
]
		[else ( _mm256_maskz_rorv_epi64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o )]
		)
	]
	[ (_mm512_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_unpackhi_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 ) (vector)))
]
		[else ( _mm512_maskz_unpackhi_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 num_5 )]
		)
	]
	[ (_mm256_extract_epi8_dsl vc_0 v1 v2 num_3 num_4 prec_i num_6)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_extract_epi8_dsl vc_0-folded v1-folded v2-folded num_3 num_4 prec_i num_6 ) (vector)))
]
		[else ( _mm256_extract_epi8_dsl vc_0-folded v1-folded v2-folded num_3 num_4 prec_i num_6 )]
		)
	]
	[ (_mm256_maskz_max_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_maskz_max_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_maskz_max_epu8_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_sra_pi16_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define vc_2-folded (hydride:const-fold vc_2))
		(define v3-folded (hydride:const-fold v3))
		(define vc_4-folded (hydride:const-fold vc_4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? vc_4-folded))
(lit (hydride:interpret ( _mm_sra_pi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o ) (vector)))
]
		[else ( _mm_sra_pi16_dsl vc_0-folded v1-folded vc_2-folded v3-folded vc_4-folded num_5 prec_i_o )]
		)
	]
	[ (_mm256_mask_cvtsepi32_epi16_dsl v0 v1 v2 num_3 prec_i_o num_5 num_6)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_mask_cvtsepi32_epi16_dsl v0-folded v1-folded v2-folded num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( _mm256_mask_cvtsepi32_epi16_dsl v0-folded v1-folded v2-folded num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm_rolv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm_rolv_epi32_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_mask_dpbusds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o ) (vector)))
]
		[else ( _mm256_mask_dpbusds_epi32_dsl v0-folded v1-folded v2-folded v3-folded size_i_o )]
		)
	]
	[ (_mm256_rol_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm256_rol_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm256_rol_epi64_dsl vc_0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm512_maskz_and_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define vc_1-folded (hydride:const-fold vc_1))
		(define v2-folded (hydride:const-fold v2))
		(define v3-folded (hydride:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hydride:interpret ( _mm512_maskz_and_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o ) (vector)))
]
		[else ( _mm512_maskz_and_epi64_dsl v0-folded vc_1-folded v2-folded v3-folded num_4 prec_i_o )]
		)
	]
	[ (_mm_cmplt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_cmplt_epi16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 ) (vector)))
]
		[else ( _mm_cmplt_epi16_mask_dsl v0-folded v1-folded num_2 prec_i num_4 )]
		)
	]
	[ (_mm256_blend_epi16_dsl v0 v1 v2)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hydride:interpret ( _mm256_blend_epi16_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( _mm256_blend_epi16_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (_mm256_hsubs_epi16_dsl v0 v1)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_hsubs_epi16_dsl v0-folded v1-folded ) (vector)))
]
		[else ( _mm256_hsubs_epi16_dsl v0-folded v1-folded )]
		)
	]
	[ (_mm256_extracti32x4_epi32_dsl v0 v1 prec_i_o num_3)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_extracti32x4_epi32_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
]
		[else ( _mm256_extracti32x4_epi32_dsl v0-folded v1-folded prec_i_o num_3 )]
		)
	]
	[ (_mm_subs_epu8_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm_subs_epu8_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( _mm_subs_epu8_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (_mm512_mask_srli_epi64_dsl vc_0 v1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
		(define vc_0-folded (hydride:const-fold vc_0))
		(define v1-folded (hydride:const-fold v1))
		(define v2-folded (hydride:const-fold v2))
		(define vc_3-folded (hydride:const-fold vc_3))
		(define v4-folded (hydride:const-fold v4))
		(define v5-folded (hydride:const-fold v5))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded))
(lit (hydride:interpret ( _mm512_mask_srli_epi64_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o num_8 ) (vector)))
]
		[else ( _mm512_mask_srli_epi64_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded v5-folded num_6 prec_i_o num_8 )]
		)
	]
	[ (_mm256_set_m128i_dsl v0 v1 num_2 prec_i_o num_4)
		(define v0-folded (hydride:const-fold v0))
		(define v1-folded (hydride:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hydride:interpret ( _mm256_set_m128i_dsl v0-folded v1-folded num_2 prec_i_o num_4 ) (vector)))
]
		[else ( _mm256_set_m128i_dsl v0-folded v1-folded num_2 prec_i_o num_4 )]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

