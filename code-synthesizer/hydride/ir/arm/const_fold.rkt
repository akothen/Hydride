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
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( llvm-zext_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( llvm-zext_dsl v0-folded size_i size_o )]
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( scalar_splat_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( scalar_splat_dsl v0-folded size_i size_o )]
		)
	]
	[ (vpmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmin_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 ) (vector)))
]
		[else ( vpmin_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 )]
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmulhq_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulhq_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshrn_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vrshrn_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vpaddq_u8_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vpaddq_u8_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vpaddq_u8_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlsl_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 )]
		)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmlal_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vget_high_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vget_high_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vget_high_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vabal_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_high_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vqdmull_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmull_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 )]
		)
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrnd_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vqrshrnd_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vqmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqmovn_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10 ) (vector)))
]
		[else ( vqmovn_u64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 prec_i num_10 )]
		)
	]
	[ (vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
]
		[else ( vqneg_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 )]
		)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmlsl_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vaba_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vaba_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vaba_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vpadalq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpadalq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vpadalq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vtrn2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn2_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vtrn2_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 )]
		)
	]
	[ (vqshlq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshlq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqshlq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vqabsq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqabsq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
]
		[else ( vqabsq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 )]
		)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_high_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vclez_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vclez_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vclez_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 ) (vector)))
]
		[else ( vqdmull_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 )]
		)
	]
	[ (vsubhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubhn_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) (vector)))
]
		[else ( vsubhn_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 )]
		)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmla_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmls_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmlsq_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlal_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 )]
		)
	]
	[ (vaddw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vaddw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vrsra_n_u64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsra_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vrsra_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vqshrn_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrn_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vqshrn_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
		)
	]
	[ (vqshrnd_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrnd_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ) (vector)))
]
		[else ( vqshrnd_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 )]
		)
	]
	[ (vshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vshl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vpaddlq_s32_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpaddlq_s32_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vpaddlq_s32_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vshrn_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshrn_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vshrn_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
		)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshrn_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ) (vector)))
]
		[else ( vshrn_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 )]
		)
	]
	[ (vqshrn_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrn_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vqshrn_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
		)
	]
	[ (vceqzq_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceqzq_s8_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceqzq_s8_dsl vc_0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vmla_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmla_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqshlu_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshlu_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqshlu_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vabdl_high_u8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_high_u8_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_high_u8_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_high_n_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovn_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vmovn_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrdmulhq_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrdmulhq_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vshll_n_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshll_n_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshll_n_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vaddhn_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddhn_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) (vector)))
]
		[else ( vaddhn_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 )]
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlal_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmovl_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovl_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vtrn1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmul_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmul_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmlal_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_high_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vrshrq_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshrq_n_u16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshrq_n_u16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vcltz_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlsl_high_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vrsra_n_s32_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsra_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrsra_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vabal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_n_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_high_n_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vget_low_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vget_low_u8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vget_low_u8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (vsraq_n_u64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsraq_n_u64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( vsraq_n_u64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (vmlal_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_high_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_high_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vrsra_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsra_n_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrsra_n_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vmul_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmul_n_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vqrdmulh_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrdmulh_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrdmulh_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqrshrun_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrun_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vqrshrun_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vrsubhn_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrsubhn_u16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vrsubhn_u16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
		)
	]
	[ (vaddw_high_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_high_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vaddw_high_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrdmulhq_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrdmulhq_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqrdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrdmulhq_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrdmulhq_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshld_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshld_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 ) (vector)))
]
		[else ( vqdmull_n_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 )]
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
	[ (vshr_n_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshr_n_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( vshr_n_u64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vabs_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
]
		[else ( vabs_s32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 )]
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlsl_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmull_high_n_s32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_n_s32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_high_n_s32_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmulhh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmulhh_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulhh_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vsraq_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsraq_n_s64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( vsraq_n_s64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (vsqadds_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsqadds_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsqadds_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vabal_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_high_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlal_high_n_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmlsl_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmlsl_high_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vaddl_high_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vaddl_high_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlal_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 )]
		)
	]
	[ (vmul_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmul_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_s8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vcombine_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) (vector)))
]
		[else ( vcombine_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 )]
		)
	]
	[ (vmlsl_high_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_high_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuqaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vuqaddq_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vabal_high_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_high_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_high_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vsqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsqadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsqadd_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmull_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmull_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmull_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqrshrns_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrns_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vqrshrns_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vqrshrnh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrnh_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vqrshrnh_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vsra_n_s64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsra_n_s64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( vsra_n_s64_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (vabal_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_s8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vceqq_u16_dsl v0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define vc_3-folded (arm:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded))
(lit (arm:interpret ( vceqq_u16_dsl v0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceqq_u16_dsl v0-folded v1-folded vc_2-folded vc_3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vaddl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vaddl_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmull_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_high_s16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vabal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabal_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vzip1q_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip1q_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vzip1q_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmulh_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulh_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vrhadd_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrhadd_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vrhadd_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vrshrd_n_s64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshrd_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vrshrd_n_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vuzp1q_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp1q_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vuzp1q_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vhsub_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhsub_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vhsub_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqshlh_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshlh_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vqshlh_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vabdl_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vmovl_high_s8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovl_high_s8_dsl v0-folded size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmovl_high_s8_dsl v0-folded size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vcgt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgt_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vcgt_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (vrshr_n_u64_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshr_n_u64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vrshr_n_u64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
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
	[ (vsraq_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsraq_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vsraq_n_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vabdl_high_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_high_s16_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vmlsq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmlsq_s32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vabdq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabdq_s32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vpmaxq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmaxq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 ) (vector)))
]
		[else ( vpmaxq_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 )]
		)
	]
	[ (vshrq_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshrq_n_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshrq_n_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vqdmlal_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlal_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqdmlal_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vshr_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshr_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshr_n_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vrshr_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshr_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshr_n_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
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
	[ (vuqaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuqaddq_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vuqaddq_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vtst_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vtst_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vtst_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vnegq_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 ) (vector)))
]
		[else ( vnegq_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 )]
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
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 ) (vector)))
]
		[else ( vmull_n_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 num_8 prec_o num_10 num_11 num_12 )]
		)
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsra_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vrsra_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vabdl_u32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_u32_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vabdl_high_u32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_high_u32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vabdl_high_u32_dsl vc_0-folded v1-folded v2-folded size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vsubl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vsubl_high_u16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubl_high_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vsubl_high_u16_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vsubw_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vsubw_high_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_high_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vsubw_high_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmov_n_u16_dsl v0-folded size_o num_2 num_3 num_4 prec_o ) (vector)))
]
		[else ( vmov_n_u16_dsl v0-folded size_o num_2 num_3 num_4 prec_o )]
		)
	]
	[ (vmin_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmin_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( vmin_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (vrshrn_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshrn_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vrshrn_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_high_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_high_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vmlal_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlal_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 ) (vector)))
]
		[else ( vqdmlsl_n_s16_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i num_9 num_10 prec_o num_12 num_13 num_14 )]
		)
	]
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsraq_n_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vsraq_n_u8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmlaq_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlaq_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vmlaq_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmvn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmvn_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmvn_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
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
	[ (vqrshld_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshld_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vqrshld_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vzip2q_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip2q_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vzip2q_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vsubq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrn_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 ) (vector)))
]
		[else ( vqshrn_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 prec_i num_9 )]
		)
	]
	[ (vhadd_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhadd_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vhadd_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vshll_high_n_s8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshll_high_n_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshll_high_n_s8_dsl v0-folded v1-folded size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vdotq_s32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vdotq_s32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) (vector)))
]
		[else ( vdotq_s32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 )]
		)
	]
	[ (vmax_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmax_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( vmax_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vmlsl_n_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i num_8 num_9 prec_o num_11 num_12 num_13 num_14 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

