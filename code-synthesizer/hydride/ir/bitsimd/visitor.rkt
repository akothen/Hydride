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
	[ (pimMax_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMax_v2048_e8__v2048_e8__v2048_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimOr_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimOr_v2048_e32__v2048_e32__v2048_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimAnd_v32_e8__v32_e8__v32_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAnd_v32_e8__v32_e8__v32_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[ (pimGT_v512_e32__v512_e32__v512_e32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(define vc_0-visited (bitsimd:visitor vc_0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define v3-visited (bitsimd:visitor v3 fn))
		(fn ( pimGT_v512_e32__v512_e32__v512_e32_dsl vc_0-visited vc_1-visited v2-visited v3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ))
	]
	[ (pimEQ_v512_e32__v512_e32__v512_e32_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define vc_1-visited (bitsimd:visitor vc_1 fn))
		(define v2-visited (bitsimd:visitor v2 fn))
		(define vc_3-visited (bitsimd:visitor vc_3 fn))
		(fn ( pimEQ_v512_e32__v512_e32__v512_e32_dsl v0-visited vc_1-visited v2-visited vc_3-visited size_i_o num_5 num_6 num_7 prec_i_o num_9 ))
	]
	[ (pimMin_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMin_v8192_e8__v8192_e8__v8192_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimBroadCast_v512_e32__v32_e32_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(fn ( pimBroadCast_v512_e32__v32_e32_dsl v0-visited size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ))
	]
	[ (pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ))
	]
	[ (pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimSub_v256_e16__v256_e16__v256_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimSub_v256_e16__v256_e16__v256_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ))
	]
	[ (pimMul_v16_e8__v16_e8__v16_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimMul_v16_e8__v16_e8__v16_e8_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ))
	]
	[ (pimXor_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(define v0-visited (bitsimd:visitor v0 fn))
		(define v1-visited (bitsimd:visitor v1 fn))
		(fn ( pimXor_v8_e16__v8_e16__v8_e16_dsl v0-visited v1-visited size_i_o num_3 num_4 num_5 prec_i_o num_7 ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

