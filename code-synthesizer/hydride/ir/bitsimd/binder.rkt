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

(require hydride/ir/bitsimd/semantics)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (bitsimd:bind-expr prog env)
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (vector-ref-bv env id)]
	[(lit v) (lit v)]
	[(idx-add i1 i2) (idx-add i1 i2)]
	[(idx-mul i1 i2) (idx-mul i1 i2)]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr prec_i_o env))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr v4 env) (bitsimd:bind-expr num_5 env))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr prec_i_o env))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr size_o env))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_i env) (bitsimd:bind-expr size_o env))
	]
	[ (pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimAnd_v32_e32__v32_e32__v32_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMin_v64_e32__v64_e32__v64_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimBroadCast_v1024_e16__v16_e16_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(pimBroadCast_v1024_e16__v16_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr size_o env) (bitsimd:bind-expr num_2 env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env))
	]
	[ (pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(pimEQ_v512_e16__v512_e16__v512_e16_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr vc_2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_9 env))
	]
	[ (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl (bitsimd:bind-expr vc_0 env) (bitsimd:bind-expr vc_1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr v3 env) (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr prec_i_o env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env))
	]
	[ (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env) (bitsimd:bind-expr num_11 env) 
		 (bitsimd:bind-expr num_12 env))
	]
	[ (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr v2 env) 
		 (bitsimd:bind-expr size_i_o env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr num_6 env) (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env))
	]
	[ (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[ (pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(pimMul_v512_e8__v512_e8__v512_e8_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env) 
		 (bitsimd:bind-expr num_9 env) (bitsimd:bind-expr num_10 env))
	]
	[ (pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl (bitsimd:bind-expr v0 env) (bitsimd:bind-expr v1 env) (bitsimd:bind-expr size_i_o env) 
		 (bitsimd:bind-expr num_3 env) (bitsimd:bind-expr num_4 env) (bitsimd:bind-expr num_5 env) 
		 (bitsimd:bind-expr prec_i_o env) (bitsimd:bind-expr num_7 env) (bitsimd:bind-expr num_8 env))
	]
	[v v]
 )
)
;; ================================================================================

