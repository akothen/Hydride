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
	[ (vabdl_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_high_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabdl_high_s32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
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
	[ (vabd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabd_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vabd_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhsub_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhsub_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vmvn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmvn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmvn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqrdmulhq_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrdmulhq_n_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
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
	[ (vmaxq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmaxq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmaxq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vpadd_s16_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vpadd_s16_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vpadd_s16_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 )]
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
	[ (vceqz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vceqz_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vceqz_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (vqrshl_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshl_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrshl_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmul_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
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
	[ (vmovl_u16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmovl_u16_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_u16_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 )]
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
	[ (vmull_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vtrn2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn2q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vtrn2q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
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
	[ (vmovq_n_s64_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovq_n_s64_dsl v0-folded size_o num_2 num_3 num_4 prec_o ) (vector)))
]
		[else ( vmovq_n_s64_dsl v0-folded size_o num_2 num_3 num_4 prec_o )]
		)
	]
	[ (vqsubd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqsubd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqsubd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmull_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vcge_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcge_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcge_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlaq_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlaq_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqrshlb_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshlb_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrshlb_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlsl_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_high_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vzip1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip1q_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vzip1q_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
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
	[ (vcleq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcleq_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcleq_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vqrdmulh_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqrdmulh_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrdmulh_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vsubq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubq_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vsubq_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vcltzq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltzq_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcltzq_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vqshlq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshlq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqshlq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrhaddq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vrhaddq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovn_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vmovn_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (vhadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhadd_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhadd_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vshlq_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshlq_s64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vshlq_s64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmlal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vsqaddh_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsqaddh_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vsqaddh_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp2_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vuzp2_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
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
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqmovn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) (vector)))
]
		[else ( vqmovn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 )]
		)
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmlsq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmlsl_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
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
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmla_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vrshl_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshl_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshl_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 )]
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
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
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
	[ (vadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vadd_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vadd_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vtrn1q_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn1q_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vtrn1q_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vtst_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vtst_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vtst_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vmin_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmin_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmin_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vqabsh_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqabsh_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqabsh_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vaddl_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_high_u8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_high_u8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlalh_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlalh_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vaddw_high_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_high_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_high_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vshlq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshlq_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshlq_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmul_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vmla_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmla_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqshlb_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqshlb_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqshlb_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmls_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vrshl_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshl_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vrshl_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vmovl_high_s32_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmovl_high_s32_dsl vc_0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_high_s32_dsl vc_0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 )]
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
	[ (vsubl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vpminq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpminq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpminq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vaddl_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vcgez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgez_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgez_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
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
	[ (vuzp1q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp1q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vuzp1q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
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
	[ (vmls_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmls_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vceq_u8_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceq_u8_dsl v0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceq_u8_dsl v0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vcgtz_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtz_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgtz_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vsubw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
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
	[ (vabsq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vabsq_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vabsq_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vcgtq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtq_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcgtq_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vraddhn_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vraddhn_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
		)
	]
	[ (vzip2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip2_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
]
		[else ( vzip2_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

