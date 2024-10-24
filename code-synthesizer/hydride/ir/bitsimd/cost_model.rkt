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
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_pimMax_v2048_e8__v2048_e8__v2048_e8_dsl 1)
(define cost_pimOr_v2048_e32__v2048_e32__v2048_e32_dsl 1)
(define cost_pimAnd_v32_e8__v32_e8__v32_e8_dsl 1)
(define cost_pimGT_v512_e32__v512_e32__v512_e32_dsl 1)
(define cost_pimEQ_v512_e32__v512_e32__v512_e32_dsl 1)
(define cost_pimMin_v8192_e8__v8192_e8__v8192_e8_dsl 1)
(define cost_pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl 1)
(define cost_pimBroadCast_v512_e32__v32_e32_dsl 1)
(define cost_pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl 1)
(define cost_pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl 1)
(define cost_pimSub_v256_e16__v256_e16__v256_e16_dsl 1)
(define cost_pimMul_v16_e8__v16_e8__v16_e8_dsl 1)
(define cost_pimXor_v8_e16__v8_e16__v8_e16_dsl 1)

(define (bitsimd:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (bitsimd:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (bitsimd:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 (bitsimd:cost  v4) )
	]
		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		)
	]
		[ (llvm-zext_dsl v0 size_i size_o)
		(+ 1 (bitsimd:cost  v0) )
	]
		[ (scalar_splat_dsl v0 size_i size_o)
		(+ 1 (bitsimd:cost  v0) )
	]
	[ (pimMax_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_pimMax_v2048_e8__v2048_e8__v2048_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimOr_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_pimOr_v2048_e32__v2048_e32__v2048_e32_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimAnd_v32_e8__v32_e8__v32_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_pimAnd_v32_e8__v32_e8__v32_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimGT_v512_e32__v512_e32__v512_e32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ cost_pimGT_v512_e32__v512_e32__v512_e32_dsl (bitsimd:cost  vc_0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  v3)  
		 
		)
	]
	[ (pimEQ_v512_e32__v512_e32__v512_e32_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(+ cost_pimEQ_v512_e32__v512_e32__v512_e32_dsl (bitsimd:cost  v0)  (bitsimd:cost  vc_1)  (bitsimd:cost  v2)  
		 (bitsimd:cost  vc_3)  
		 
		)
	]
	[ (pimMin_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_pimMin_v8192_e8__v8192_e8__v8192_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		 
		)
	]
	[ (pimBroadCast_v512_e32__v32_e32_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ cost_pimBroadCast_v512_e32__v32_e32_dsl (bitsimd:cost  v0)  
		 
		)
	]
	[ (pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		 
		)
	]
	[ (pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost_pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		 
		)
	]
	[ (pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimSub_v256_e16__v256_e16__v256_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ cost_pimSub_v256_e16__v256_e16__v256_e16_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[ (pimMul_v16_e8__v16_e8__v16_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_pimMul_v16_e8__v16_e8__v16_e8_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		 
		)
	]
	[ (pimXor_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ cost_pimXor_v8_e16__v8_e16__v8_e16_dsl (bitsimd:cost  v0)  (bitsimd:cost  v1)  
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

