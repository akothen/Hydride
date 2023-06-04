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
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vraddhn_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vraddhn_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
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
	[ (vsubw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_high_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_high_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 )]
		)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlaq_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlaq_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlaq_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vaddl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqsub_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqsub_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqsub_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vpminq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpminq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpminq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
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
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuqaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vuqaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vcgtzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtzq_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgtzq_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqdmulhq_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmulhq_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqabs_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqabs_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
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
	[ (vabd_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabd_u16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vabd_u16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vmul_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmul_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmvnq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmvnq_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmvnq_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (vsraq_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vsraq_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsraq_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 )]
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
	[ (vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsubhn_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vsubhn_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
		)
	]
	[ (vclt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vclt_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vclt_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqmovn_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) (vector)))
]
		[else ( vqmovn_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 )]
		)
	]
	[ (vceqzq_s64_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceqzq_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vceqzq_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
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
	[ (vabdl_high_s8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_high_s8_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabdl_high_s8_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmovq_n_u8_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovq_n_u8_dsl v0-folded size_o num_2 num_3 num_4 prec_o ) (vector)))
]
		[else ( vmovq_n_u8_dsl v0-folded size_o num_2 num_3 num_4 prec_o )]
		)
	]
	[ (vrhaddq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrhaddq_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vrhaddq_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vtst_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vtst_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vtst_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vmovl_high_s16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 size_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
(lit (arm:interpret ( vmovl_high_s16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded size_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vmovl_high_s16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded size_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 )]
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
	[ (vcgt_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgt_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcgt_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vsub_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsub_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vsub_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vceq_s8_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceq_s8_dsl v0-folded vc_1-folded v2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceq_s8_dsl v0-folded vc_1-folded v2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vmlaq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlaq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlaq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_high_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_high_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabdl_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlsl_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define v5-folded (arm:const-fold v5))
		(define v6-folded (arm:const-fold v6))
		(define v7-folded (arm:const-fold v7))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded) (lit? v7-folded))
(lit (arm:interpret ( vrsra_n_u8_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) (vector)))
]
		[else ( vrsra_n_u8_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 )]
		)
	]
	[ (vadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 )]
		)
	]
	[ (vhadd_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhadd_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhadd_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vaddw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_high_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_high_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn1_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vtrn1_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vsra_n_u8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vsra_n_u8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsra_n_u8_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmull_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmaxq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmaxq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vzip1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vzip1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vcgeq_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgeq_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcgeq_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
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
	[ (vmulq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmulq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmulq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
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
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcltz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_high_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqdmulh_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmulh_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
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
	[ (vpaddq_u64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vpaddq_u64_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vpaddq_u64_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_n_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_n_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlsq_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlsq_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp2_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vuzp2_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vclezq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vclezq_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vclezq_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vhsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhsubq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhsubq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vuzp1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp1_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vuzp1_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vqdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqdmulhq_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmulhq_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
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
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vneg_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vneg_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vneg_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsls_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsls_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
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
	[ (vpmax_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmax_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpmax_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
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
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vcle_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcle_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcle_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vsubl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubl_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vminq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vminq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vminq_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vcgez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgez_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgez_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmulq_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmulq_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_high_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
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
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlal_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vmull_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_u8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_u8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmls_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vaddw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vmovl_s16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 prec_i prec_o num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded))
(lit (arm:interpret ( vmovl_s16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 prec_i prec_o num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vmovl_s16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded size_i_o num_7 num_8 num_9 prec_i prec_o num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vzip2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip2_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
]
		[else ( vzip2_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
		)
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_high_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vshr_n_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vshr_n_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vshr_n_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqrshrnd_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define v5-folded (arm:const-fold v5))
		(define v6-folded (arm:const-fold v6))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
(lit (arm:interpret ( vqrshrnd_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) (vector)))
]
		[else ( vqrshrnd_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 )]
		)
	]
	[ (vqshrunh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshrunh_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 ) (vector)))
]
		[else ( vqshrunh_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 )]
		)
	]
	[ (vshr_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vshr_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vshr_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vrshr_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(define v6-folded (arm:const-fold v6))
		(define v7-folded (arm:const-fold v7))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? v6-folded) (lit? v7-folded))
(lit (arm:interpret ( vrshr_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) (vector)))
]
		[else ( vrshr_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 )]
		)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define v5-folded (arm:const-fold v5))
		(define v6-folded (arm:const-fold v6))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
(lit (arm:interpret ( vrshrn_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) (vector)))
]
		[else ( vrshrn_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 )]
		)
	]
	[ (vshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshrn_n_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 ) (vector)))
]
		[else ( vshrn_n_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 )]
		)
	]
	[ (vqshrn_n_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshrn_n_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 ) (vector)))
]
		[else ( vqshrn_n_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 )]
		)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define v5-folded (arm:const-fold v5))
		(define v6-folded (arm:const-fold v6))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded))
(lit (arm:interpret ( vqrshrns_n_u32_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) (vector)))
]
		[else ( vqrshrns_n_u32_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 )]
		)
	]
	[ (vrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(define vc_6-folded (arm:const-fold vc_6))
		(define vc_7-folded (arm:const-fold vc_7))
		(define v8-folded (arm:const-fold v8))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
(lit (arm:interpret ( vrshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
]
		[else ( vrshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
		)
	]
	[ (vqshls_s32_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqshls_s32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqshls_s32_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vshll_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vshll_n_u16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vshll_n_u16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vrshl_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(define vc_6-folded (arm:const-fold vc_6))
		(define vc_7-folded (arm:const-fold vc_7))
		(define v8-folded (arm:const-fold v8))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
(lit (arm:interpret ( vrshl_u16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
]
		[else ( vrshl_u16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
		)
	]
	[ (vqshlq_u64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqshlq_u64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqshlq_u64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqrshld_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(define vc_6-folded (arm:const-fold vc_6))
		(define vc_7-folded (arm:const-fold vc_7))
		(define v8-folded (arm:const-fold v8))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
(lit (arm:interpret ( vqrshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
]
		[else ( vqrshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
		)
	]
	[ (vshll_high_n_s8_dsl v0 vc_1 vc_2 v3 size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vshll_high_n_s8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vshll_high_n_s8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vshld_s64_dsl v0 vc_1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (arm:interpret ( vshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vshld_s64_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqshlh_n_u16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqshlh_n_u16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqshlh_n_u16_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(define vc_4-folded (arm:const-fold vc_4))
		(define vc_5-folded (arm:const-fold vc_5))
		(define vc_6-folded (arm:const-fold vc_6))
		(define vc_7-folded (arm:const-fold vc_7))
		(define v8-folded (arm:const-fold v8))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? vc_5-folded) (lit? vc_6-folded) (lit? vc_7-folded) (lit? v8-folded))
(lit (arm:interpret ( vqrshlq_u16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) (vector)))
]
		[else ( vqrshlq_u16_dsl v0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded vc_5-folded vc_6-folded vc_7-folded v8-folded size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

