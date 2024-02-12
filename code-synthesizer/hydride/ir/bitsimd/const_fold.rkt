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
(require hydride/ir/bitsimd/definition)

(require hydride/ir/bitsimd/interpreter)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (bitsimd:const-fold prog )
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
	[(nop v1) (bitsimd:const-fold v1)]
	[(idx-add i1 i2)(idx-add i1 i2) ]
	[(idx-mul i1 i2) (idx-mul i1 i2) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) (vector)))
]
		[else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 )]
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(define v4-folded (bitsimd:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
(lit (bitsimd:interpret ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
]
		[else ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
		)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( llvm-zext_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( llvm-zext_dsl v0-folded size_i size_o )]
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( scalar_splat_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( scalar_splat_dsl v0-folded size_i size_o )]
		)
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimcpy_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( dram_pimcpy_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define vc_1-folded (bitsimd:const-fold vc_1))
		(define v2-folded (bitsimd:const-fold v2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 ) (vector)))
]
		[else ( dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 )]
		)
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimnot_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( dram_pimnot_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimbitcount_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( dram_pimbitcount_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define vc_1-folded (bitsimd:const-fold vc_1))
		(define v2-folded (bitsimd:const-fold v2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12 ) (vector)))
]
		[else ( dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12 )]
		)
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimabs_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 ) (vector)))
]
		[else ( dram_pimabs_v16384_e8__v16384_e8_dsl v0-folded size_i_o num_2 num_3 num_4 prec_i_o num_6 )]
		)
	]
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimpopcount_v1_e16__v16384_e1_dsl v0-folded size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11 ) (vector)))
]
		[else ( dram_pimpopcount_v1_e16__v16384_e1_dsl v0-folded size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11 )]
		)
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define vc_1-folded (bitsimd:const-fold vc_1))
		(define v2-folded (bitsimd:const-fold v2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 ) (vector)))
]
		[else ( dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 )]
		)
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_vadd_v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( dram_vadd_v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(define v0-folded (bitsimd:const-fold v0))
		(define vc_1-folded (bitsimd:const-fold vc_1))
		(define v2-folded (bitsimd:const-fold v2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) (vector)))
]
		[else ( dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 )]
		)
	]
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define v1-folded (bitsimd:const-fold v1))
		(define vc_2-folded (bitsimd:const-fold vc_2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded))
(lit (bitsimd:interpret ( dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0-folded v1-folded vc_2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0-folded v1-folded vc_2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (dram_pimredsum_v1_e8__v16384_e8_dsl v0 size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimredsum_v1_e8__v16384_e8_dsl v0-folded size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 ) (vector)))
]
		[else ( dram_pimredsum_v1_e8__v16384_e8_dsl v0-folded size_i num_2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 )]
		)
	]
	[ (dram_pimbrdcst_v16384_e8__v1_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( dram_pimbrdcst_v16384_e8__v1_e8_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( dram_pimbrdcst_v16384_e8__v1_e8_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

