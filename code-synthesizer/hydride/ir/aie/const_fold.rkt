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
(require hydride/ir/aie/definition)

(require hydride/ir/aie/interpreter)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (aie:const-fold prog )
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
	[(nop v1) (aie:const-fold v1)]
	[(idx-add i1 i2)(idx-add i1 i2) ]
	[(idx-mul i1 i2) (idx-mul i1 i2) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) (vector)))
]
		[else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 )]
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(define v4-folded (aie:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
(lit (aie:interpret ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
]
		[else ( llvm_shuffle_vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
		)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-add_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sub_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-mul_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-sdiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o ) (vector)))
]
		[else ( llvm-vect-udiv_dsl v0-folded v1-folded num_2 prec_i_o )]
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( llvm-zext_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( llvm-zext_dsl v0-folded size_i size_o )]
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( scalar_splat_dsl v0-folded size_i size_o ) (vector)))
]
		[else ( scalar_splat_dsl v0-folded size_i size_o )]
		)
	]
	[ (shift_bytes_dsl v0 v1 num_2 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( shift_bytes_dsl v0-folded v1-folded num_2 size_i_o prec_i_o ) (vector)))
]
		[else ( shift_bytes_dsl v0-folded v1-folded num_2 size_i_o prec_i_o )]
		)
	]
	[ (ups_to_v32acc32_dsl v0)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( ups_to_v32acc32_dsl v0-folded ) (vector)))
]
		[else ( ups_to_v32acc32_dsl v0-folded )]
		)
	]
	[ (srs_to_v32int16_dsl v0)
		(define v0-folded (aie:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (aie:interpret ( srs_to_v32int16_dsl v0-folded ) (vector)))
]
		[else ( srs_to_v32int16_dsl v0-folded )]
		)
	]
	[ (mac_elem_32_dsl v0 v1 v2)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(define v2-folded (aie:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (aie:interpret ( mac_elem_32_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( mac_elem_32_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (mul_conv_32x8_dsl v0 v1)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( mul_conv_32x8_dsl v0-folded v1-folded ) (vector)))
]
		[else ( mul_conv_32x8_dsl v0-folded v1-folded )]
		)
	]
	[ (shuffle_v128int4_lo_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( shuffle_v128int4_lo_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( shuffle_v128int4_lo_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (shuffle_v128int4_hi_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( shuffle_v128int4_hi_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( shuffle_v128int4_hi_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( add_v16acc64_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( add_v16acc64_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (mul_elem_16_2_v16acc64_dsl v0 v1 size_i_o prec_i prec_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( mul_elem_16_2_v16acc64_dsl v0-folded v1-folded size_i_o prec_i prec_o ) (vector)))
]
		[else ( mul_elem_16_2_v16acc64_dsl v0-folded v1-folded size_i_o prec_i prec_o )]
		)
	]
	[ (mul_elem_16_2_conf_v16acc64_dsl v0 v1 v2 prec_i prec_o num_5)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(define v2-folded (aie:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (aie:interpret ( mul_elem_16_2_conf_v16acc64_dsl v0-folded v1-folded v2-folded prec_i prec_o num_5 ) (vector)))
]
		[else ( mul_elem_16_2_conf_v16acc64_dsl v0-folded v1-folded v2-folded prec_i prec_o num_5 )]
		)
	]
	[ (sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (aie:const-fold v0))
		(define v1-folded (aie:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (aie:interpret ( sub_v16acc64_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( sub_v16acc64_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

