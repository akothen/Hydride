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


(require hydride/ir/aie/semantics)
(require hydride/ir/aie/definition)
(require hydride/ir/aie/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (aie:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (aie:interpret v0 env) (aie:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (aie:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (aie:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o (aie:interpret v4 env) num_5)
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (aie:interpret v0 env) (aie:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext (aie:interpret v0 env) size_i size_o)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat (aie:interpret v0 env) size_i size_o)
	]
	[ (v16int32_add16_dsl v0 v1)
		(v16int32_add16 (aie:interpret v0 env) (aie:interpret v1 env))
	]
	[ (v8int32_add8_dsl v0 v1)
		(v8int32_add8 (aie:interpret v0 env) (aie:interpret v1 env))
	]
	[ (v16int32_sub16_dsl v0 v1)
		(v16int32_sub16 (aie:interpret v0 env) (aie:interpret v1 env))
	]
	[ (mul_elem_32_dsl v0 v1)
		(mul_elem_32 (aie:interpret v0 env) (aie:interpret v1 env))
	]
	[ (srs_to_v32int16_dsl v0)
		(srs_to_v32int16 (aie:interpret v0 env))
	]
	[ (ups_8_32_to_8_80_dsl v0)
		(ups_8_32_to_8_80 (aie:interpret v0 env))
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

