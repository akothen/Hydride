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

(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/llvm_impl)


(require hydride/ir/hydride/definition)


(require hydride/ir/bitsimd/semantics)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (bitsimd:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (bitsimd:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (bitsimd:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o (bitsimd:interpret v4 env) num_5)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext (bitsimd:interpret v0 env) size_i size_o)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat (bitsimd:interpret v0 env) size_i size_o)
	]
	[ (pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimXorScalar_v16384_e16__v16384_e16__v16384_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimOrScalar_v8192_e8__v8192_e8__v8192_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimSub_v8192_e16__v8192_e16__v8192_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMinScalar_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimOr_v4096_e32__v4096_e32__v4096_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimAnd_v32_e32__v32_e32__v32_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v4096_e8__v4096_e8__v4096_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMin_v64_e32__v64_e32__v64_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimSubScalar_v2048_e8__v2048_e8__v2048_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimMulScalar_v256_e32__v256_e32__v256_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMax_v8192_e16__v8192_e16__v8192_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v4096_e32__v4096_e32__v4096_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimAndScalar_v256_e32__v256_e32__v256_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimXor_v8192_e16__v8192_e16__v8192_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7)
	]
	[ (pimBroadCast_v1024_e16__v16_e16_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(pimBroadCast_v1024_e16__v16_e16 (bitsimd:interpret v0 env) size_o num_2 
		 num_3 num_4 prec_i_o 
		 num_6 num_7)
	]
	[ (pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(pimEQ_v512_e16__v512_e16__v512_e16 (bitsimd:interpret vc_0 env) (bitsimd:interpret v1 env) (bitsimd:interpret vc_2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9)
	]
	[ (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMaxScalar_v256_e32__v256_e32__v256_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(pimGT_v16384_e8__v16384_e8__v16384_e8 (bitsimd:interpret vc_0 env) (bitsimd:interpret vc_1 env) (bitsimd:interpret v2 env) 
		 (bitsimd:interpret v3 env) size_i_o num_5 
		 num_6 num_7 prec_i_o 
		 num_9 num_10)
	]
	[ (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimAddScalar_v8_e16__v8_e16__v8_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v8192_e16__v8192_e16__v8192_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12)
	]
	[ (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(pimScaledAdd_v256_e8__v256_e8__v256_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) (bitsimd:interpret v2 env) 
		 size_i_o num_4 num_5 
		 num_6 prec_i_o num_8 
		 num_9)
	]
	[ (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimAdd_v1024_e32__v1024_e32__v1024_e32 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[ (pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(pimMul_v512_e8__v512_e8__v512_e8 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimDivScalar_v32_e16__v32_e16__v32_e16 (bitsimd:interpret v0 env) (bitsimd:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

