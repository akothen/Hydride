;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================

#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)


(require hydride/ir/hydride/definition)
(require hydride/ir/arm/definition)

(require hydride/ir/arm/interpreter)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (arm:const-fold prog )
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
	[(nop v1) (arm:const-fold v1)]
	[(idx-add i1 i2)(idx-add i1 i2) ]
	[(idx-mul i1 i2) (idx-mul i1 i2) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) (vector)))
]
		[else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 )]
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
(lit (arm:interpret ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
]
		[else ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtd_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcgtd_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqdmulh_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmulh_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlaq_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlaq_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vqrshl_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshl_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrshl_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vzip2q_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip2q_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
]
		[else ( vzip2q_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
		)
	]
	[ (vmaxq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmaxq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmaxq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vrsubhn_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrsubhn_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vrsubhn_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
		)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubl_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vabs_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vabs_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vcltq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltq_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcltq_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_high_n_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_high_n_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqshl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshl_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqshl_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqshl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshl_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqshl_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vuzp2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp2q_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vuzp2q_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vsqaddq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsqaddq_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vsqaddq_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vminq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vminq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmulq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmulq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmulq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vuzp1_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp1_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vuzp1_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vqdmlal_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_high_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vpminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpminq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpminq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmla_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmlslh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlslh_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlslh_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_high_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_high_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 )]
		)
	]
	[ (vqrshlq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshlq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrshlq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vsubl_high_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_high_u32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubl_high_u32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vmovl_high_s8_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmovl_high_s8_dsl vc_0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_high_s8_dsl vc_0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovn_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vmovn_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmul_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqrdmulhq_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrdmulhq_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn2_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vtrn2_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vtst_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vtst_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vtst_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vqmovunh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqmovunh_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) (vector)))
]
		[else ( vqmovunh_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 )]
		)
	]
	[ (vaddhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vaddhn_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vaddhn_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
		)
	]
	[ (vtrn1_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn1_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vtrn1_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vhaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vclez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vclez_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vclez_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vmlsq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlsq_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 )]
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqrdmulhq_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrdmulhq_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmls_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmvnq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmvnq_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmvnq_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmulq_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmulq_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vpmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmax_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpmax_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vmull_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vhsub_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhsub_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhsub_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vcltzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltzd_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcltzd_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vcleq_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcleq_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcleq_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vmull_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_n_u32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_n_u32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 )]
		)
	]
	[ (vsubw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vadd_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vadd_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vcgtz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgtz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vqnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmla_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vaddl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vmull_high_n_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_n_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_n_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vrshlq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshlq_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshlq_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlsq_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlsq_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vsubw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_high_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_high_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vpaddq_s64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vpaddq_s64_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vpaddq_s64_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqadd_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqadd_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlsl_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vshld_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshld_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vshld_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vshlq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshlq_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshlq_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqsubq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqsubq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vsubq_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubq_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vsubq_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vmovl_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmovl_s32_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_s32_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 )]
		)
	]
	[ (vrshl_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshl_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vrshl_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrhaddq_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vrhaddq_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vcgez_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgez_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgez_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vmlal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vzip1_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip1_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vzip1_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqabsq_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqabsq_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqabsq_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vceqzq_s64_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceqzq_s64_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vceqzq_s64_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlals_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlals_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_high_n_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_high_n_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vceqq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vceqq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceqq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vcge_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcge_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcge_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

