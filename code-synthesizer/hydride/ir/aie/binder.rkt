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

(require hydride/ir/aie/semantics)
(require hydride/ir/aie/definition)
(require hydride/ir/aie/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (aie:bind-expr prog env)
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
		(vector-two-input-swizzle_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env) (aie:bind-expr num_4 env) (aie:bind-expr num_5 env) 
		 (aie:bind-expr num_6 env) (aie:bind-expr num_7 env) (aie:bind-expr num_8 env))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr size_i_o env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector_dsl (aie:bind-expr v0 env) (aie:bind-expr size_i_o env) (aie:bind-expr prec_i_o env))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector_dsl (aie:bind-expr v0 env) (aie:bind-expr size_i_o env) (aie:bind-expr prec_i_o env))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env) (aie:bind-expr v4 env) (aie:bind-expr num_5 env))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env) (aie:bind-expr num_2 env) 
		 (aie:bind-expr prec_i_o env))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(llvm-zext_dsl (aie:bind-expr v0 env) (aie:bind-expr size_i env) (aie:bind-expr size_o env))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(scalar_splat_dsl (aie:bind-expr v0 env) (aie:bind-expr size_i env) (aie:bind-expr size_o env))
	]
	[ (v16int32_add16_dsl v0 v1)
		(v16int32_add16_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env))
	]
	[ (v8int32_add8_dsl v0 v1)
		(v8int32_add8_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env))
	]
	[ (v16int32_sub16_dsl v0 v1)
		(v16int32_sub16_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env))
	]
	[ (mul_elem_32_dsl v0 v1)
		(mul_elem_32_dsl (aie:bind-expr v0 env) (aie:bind-expr v1 env))
	]
	[ (srs_to_v32int16_dsl v0)
		(srs_to_v32int16_dsl (aie:bind-expr v0 env))
	]
	[ (ups_8_32_to_8_80_dsl v0)
		(ups_8_32_to_8_80_dsl (aie:bind-expr v0 env))
	]
	[v v]
 )
)
;; ================================================================================

