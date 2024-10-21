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
(require hydride/ir/visa/definition)

(require hydride/ir/visa/interpreter)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (visa:const-fold prog )
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
	[(nop v1) (visa:const-fold v1)]
	[(idx-add i1 i2)(idx-add i1 i2) ]
	[(idx-mul i1 i2) (idx-mul i1 i2) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) (vector)))
]
		[else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 )]
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(define v4-folded (visa:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
(lit (visa:interpret ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
]
		[else ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
		)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( llvm-zext_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( llvm-zext_dsl v0-folded size_i size_o )]
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( scalar_splat_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( scalar_splat_dsl v0-folded size_i size_o )]
		)
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(define v2-folded (visa:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (visa:interpret ( VMAD_sat_2_UB_UB_UB_UB_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( VMAD_sat_2_UB_UB_UB_UB_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(define vc_0-folded (visa:const-fold vc_0))
		(define vc_1-folded (visa:const-fold vc_1))
		(define vc_2-folded (visa:const-fold vc_2))
		(define vc_3-folded (visa:const-fold vc_3))
		(define v4-folded (visa:const-fold v4))
		(define v5-folded (visa:const-fold v5))
		(define v6-folded (visa:const-fold v6))
		(define v7-folded (visa:const-fold v7))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded) (lit? v5-folded) (lit? v6-folded) (lit? v7-folded))
(lit (visa:interpret ( VBFI_4_UD_UD_UD_UD_UD_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 ) (vector)))
]
		[else ( VBFI_4_UD_UD_UD_UD_UD_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded v4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 )]
		)
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(define vc_0-folded (visa:const-fold vc_0))
		(define vc_1-folded (visa:const-fold vc_1))
		(define vc_2-folded (visa:const-fold vc_2))
		(define vc_3-folded (visa:const-fold vc_3))
		(define vc_4-folded (visa:const-fold vc_4))
		(define v5-folded (visa:const-fold v5))
		(define v6-folded (visa:const-fold v6))
		(define v7-folded (visa:const-fold v7))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? vc_4-folded) (lit? v5-folded) (lit? v6-folded) (lit? v7-folded))
(lit (visa:interpret ( VBFE_32_D_D_D_D_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 ) (vector)))
]
		[else ( VBFE_32_D_D_D_D_dsl vc_0-folded vc_1-folded vc_2-folded vc_3-folded vc_4-folded v5-folded v6-folded v7-folded size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 )]
		)
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(define vc_0-folded (visa:const-fold vc_0))
		(define vc_1-folded (visa:const-fold vc_1))
		(define v2-folded (visa:const-fold v2))
		(define v3-folded (visa:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (visa:interpret ( VAVG_sat_8_UB_UB_UB_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 ) (vector)))
]
		[else ( VAVG_sat_8_UB_UB_UB_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 )]
		)
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(define v2-folded (visa:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (visa:interpret ( VMAD_4_B_B_B_B_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 ) (vector)))
]
		[else ( VMAD_4_B_B_B_B_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 )]
		)
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VMULH_1_D_D_D_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( VMULH_1_D_D_D_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VMUL_sat_8_UW_UW_UW_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o ) (vector)))
]
		[else ( VMUL_sat_8_UW_UW_UW_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o )]
		)
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VADD_4_W_W_W_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( VADD_4_W_W_W_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( VMOV_1_Q_Q_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( VMOV_1_Q_Q_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(define v2-folded (visa:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (visa:interpret ( VDP4A_sat_32_D_D_D_D_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 ) (vector)))
]
		[else ( VDP4A_sat_32_D_D_D_D_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 )]
		)
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (visa:interpret ( VNOT_32_W_W_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o ) (vector)))
]
		[else ( VNOT_32_W_W_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o )]
		)
	]
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VXOR_32_UD_UD_UD_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o ) (vector)))
]
		[else ( VXOR_32_UD_UD_UD_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o )]
		)
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(define v2-folded (visa:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (visa:interpret ( VDP4A_1_UD_UD_UD_UD_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 ) (vector)))
]
		[else ( VDP4A_1_UD_UD_UD_UD_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 )]
		)
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VMUL_1_UB_UB_UB_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o ) (vector)))
]
		[else ( VMUL_1_UB_UB_UB_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o )]
		)
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VAND_1_UD_UD_UD_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o ) (vector)))
]
		[else ( VAND_1_UD_UD_UD_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o )]
		)
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(define v0-folded (visa:const-fold v0))
		(define v1-folded (visa:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (visa:interpret ( VOR_8_D_D_D_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o ) (vector)))
]
		[else ( VOR_8_D_D_D_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

