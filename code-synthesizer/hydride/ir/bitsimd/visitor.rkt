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


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (bitsimd:visitor prog fn)
 (destruct prog
	[(dim-x id) (fn prog)]
	[(dim-y id) (fn prog)]
	[(idx-i id) (fn prog)]
	[(idx-j id) (fn prog)]
	[(reg id) (fn prog) ]
	[(lit v) (fn prog)]
	[(nop v1) (bitsimd:visitor v1 fn)]
	[(idx-add i1 i2) (fn prog) ]
	[(idx-mul i1 i2) (fn prog) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(define v4-visited (bitsimd:visitor v4 fn))
		(fn ( llvm_shuffle_vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-add_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-sub_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-mul_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-sdiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( llvm-vect-udiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( llvm-zext_dsl v0-visited size_i size_o ))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( scalar_splat_dsl v0-visited size_i size_o ))
	]
	[ (pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAnd_v32_e32__v32_e32__v32_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMin_v64_e32__v64_e32__v64_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimBroadCast_v1024_e16__v16_e16_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( pimBroadCast_v1024_e16__v16_e16_dsl v0-visited size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(define vc_2-visited (bitsimd:visitor vc_2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0-visited v1-visited vc_2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(fn ( pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0-visited v1-visited v2-visited size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 ))
	]
	[ (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMul_v512_e8__v512_e8__v512_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

