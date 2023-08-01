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
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrn_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vqshrn_n_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
		)
	]
	[ (vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmov_n_u16_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmov_n_u16_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltzq_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcltzq_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsub_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vsub_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
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
	[ (vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabal_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabal_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdq_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vabdq_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmull_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmull_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovl_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmovl_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 )]
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
	[ (vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vneg_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vneg_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsqaddq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vsqaddq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcle_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcle_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vuzp1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vuzp1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhsubq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhsubq_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshrn_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vshrn_n_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
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
	[ (vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vhadd_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vhadd_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vdotq_u32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) (vector)))
]
		[else ( vdotq_u32_dsl v0-folded v1-folded v2-folded size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 )]
		)
	]
	[ (vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vtst_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vtst_u16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vaba_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaba_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vqdmullh_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vqdmullh_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 )]
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
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmulhq_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulhq_n_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgez_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgez_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddw_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddw_u32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubhn_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) (vector)))
]
		[else ( vsubhn_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 )]
		)
	]
	[ (vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmax_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vmax_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqsub_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqsub_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlal_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlal_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
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
	[ (vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vabdl_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vabdl_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmlsl_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) (vector)))
]
		[else ( vqdmlsl_s32_dsl vc_0-folded v1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 )]
		)
	]
	[ (vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vsra_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vsra_n_s16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip2q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) (vector)))
]
		[else ( vzip2q_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 )]
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
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vtrn1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( vtrn1_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmulh_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulh_n_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcge_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcge_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vabs_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vabs_s8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
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
	[ (vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshrnh_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) (vector)))
]
		[else ( vqshrnh_n_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 )]
		)
	]
	[ (vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmin_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpmin_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
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
	[ (vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcgtq_s8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vadd_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( vadd_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vrsubhn_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) (vector)))
]
		[else ( vrsubhn_s16_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 )]
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
	[ (vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcltq_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vcltq_s32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
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
	[ (vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vminq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vminq_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
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
	[ (vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vceqz_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( vceqz_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
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
	[ (vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmla_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmla_u16_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddhn_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) (vector)))
]
		[else ( vaddhn_s64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 )]
		)
	]
	[ (vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpadal_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vpadal_u16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqadd_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( vqadd_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vceqq_u8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o ) (vector)))
]
		[else ( vceqq_u8_dsl v0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o )]
		)
	]
	[ (vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vzip1q_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vzip1q_u64_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
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
	[ (vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshr_n_s64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshr_n_s64_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmovn_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vmovn_s64_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vclez_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vclez_s16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
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
	[ (vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vaddl_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vaddl_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpmax_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) (vector)))
]
		[else ( vpmax_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 )]
		)
	]
	[ (vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vshr_n_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vshr_n_u8_dsl vc_0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmlsl_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vmlsl_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqneg_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vqneg_s16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (arm:interpret ( vcgtzd_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( vcgtzd_s64_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vmls_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vmls_u32_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 )]
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
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vqmovn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) (vector)))
]
		[else ( vqmovn_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 )]
		)
	]
	[ (vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vmul_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vmul_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(define v2-folded (arm:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (arm:interpret ( vpaddq_u32_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( vpaddq_u32_dsl vc_0-folded v1-folded v2-folded size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vmvn_u8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( vmvn_u8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vsubw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( vsubw_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vget_low_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( vget_low_u32_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
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
	[ (vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (arm:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (arm:interpret ( vget_high_u16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( vget_high_u16_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (vpaddl_s16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(define vc_0-folded (arm:const-fold vc_0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded))
(lit (arm:interpret ( vpaddl_s16_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) (vector)))
]
		[else ( vpaddl_s16_dsl vc_0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 )]
		)
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vqrdmulhs_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrdmulhs_s32_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqdmulh_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqdmulh_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vqdmulh_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (vshl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshl_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vshl_s16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vshll_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vshll_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) (vector)))
]
		[else ( vshll_n_s32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 )]
		)
	]
	[ (vqrshl_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshl_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vqrshl_s16_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vrshld_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshld_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) (vector)))
]
		[else ( vrshld_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 )]
		)
	]
	[ (vqshlb_n_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshlb_n_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vqshlb_n_u8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vqshl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (arm:const-fold v0))
		(define v1-folded (arm:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (arm:interpret ( vqshl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( vqshl_s8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (vrshr_n_s8_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshr_n_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshr_n_s8_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vrsraq_n_s64_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsraq_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrsraq_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqrshrnd_n_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrnd_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vqrshrnd_n_u64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vrshrn_n_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vrshrn_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vrshrn_n_u32_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vrsraq_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrsraq_n_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrsraq_n_u8_dsl vc_0-folded vc_1-folded v2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (vqrshrn_n_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define v2-folded (arm:const-fold v2))
		(define v3-folded (arm:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (arm:interpret ( vqrshrn_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 ) (vector)))
]
		[else ( vqrshrn_n_s64_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 num_13 prec_i num_15 )]
		)
	]
	[ (vrshr_n_u16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (arm:const-fold vc_0))
		(define vc_1-folded (arm:const-fold vc_1))
		(define vc_2-folded (arm:const-fold vc_2))
		(define v3-folded (arm:const-fold v3))
		(define v4-folded (arm:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (arm:interpret ( vrshr_n_u16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( vrshr_n_u16_dsl vc_0-folded vc_1-folded vc_2-folded v3-folded v4-folded size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

