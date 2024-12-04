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
	[ (pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimAnd_v32_e32__v32_e32__v32_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimAnd_v32_e32__v32_e32__v32_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMin_v64_e32__v64_e32__v64_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimMin_v64_e32__v64_e32__v64_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (pimBroadCast_v1024_e16__v16_e16_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-folded (bitsimd:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (bitsimd:interpret ( pimBroadCast_v1024_e16__v16_e16_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) (vector)))
]
		[else ( pimBroadCast_v1024_e16__v16_e16_dsl v0-folded size_o num_2 num_3 num_4 prec_i_o num_6 num_7 )]
		)
	]
	[ (pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define v1-folded (bitsimd:const-fold v1))
		(define vc_2-folded (bitsimd:const-fold vc_2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0-folded v1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 ) (vector)))
]
		[else ( pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0-folded v1-folded vc_2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 )]
		)
	]
	[ (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-folded (bitsimd:const-fold vc_0))
		(define vc_1-folded (bitsimd:const-fold vc_1))
		(define v2-folded (bitsimd:const-fold v2))
		(define v3-folded (bitsimd:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (bitsimd:interpret ( pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) (vector)))
]
		[else ( pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0-folded vc_1-folded v2-folded v3-folded size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 )]
		)
	]
	[ (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) (vector)))
]
		[else ( pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 )]
		)
	]
	[ (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(define v2-folded (bitsimd:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (bitsimd:interpret ( pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ) (vector)))
]
		[else ( pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0-folded v1-folded v2-folded size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 )]
		)
	]
	[ (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[ (pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimMul_v512_e8__v512_e8__v512_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) (vector)))
]
		[else ( pimMul_v512_e8__v512_e8__v512_e8_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 )]
		)
	]
	[ (pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-folded (bitsimd:const-fold v0))
		(define v1-folded (bitsimd:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (bitsimd:interpret ( pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) (vector)))
]
		[else ( pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0-folded v1-folded size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 )]
		)
	]
	[v (error "Unrecognized expression" v)]
 )
)
;; ================================================================================

