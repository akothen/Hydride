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

(require hydride/ir/arm/semantics)
(require hydride/ir/arm/definition)
(require hydride/ir/arm/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (arm:bind-expr prog env)
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
		(vector-two-input-swizzle_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr num_2 env) 
		 (arm:bind-expr prec_i_o env) (arm:bind-expr num_4 env) (arm:bind-expr num_5 env) 
		 (arm:bind-expr num_6 env) (arm:bind-expr num_7 env) (arm:bind-expr num_8 env))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr size_i_o env) 
		 (arm:bind-expr prec_i_o env))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector_dsl (arm:bind-expr v0 env) (arm:bind-expr size_i_o env) (arm:bind-expr prec_i_o env))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector_dsl (arm:bind-expr v0 env) (arm:bind-expr size_i_o env) (arm:bind-expr prec_i_o env))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr num_2 env) 
		 (arm:bind-expr prec_i_o env) (arm:bind-expr v4 env) (arm:bind-expr num_5 env))
	]
	[ (vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmin_u16_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr size_i_o env) 
		 (arm:bind-expr num_3 env) (arm:bind-expr num_4 env) (arm:bind-expr num_5 env) 
		 (arm:bind-expr prec_o env) (arm:bind-expr num_7 env) (arm:bind-expr num_8 env) 
		 (arm:bind-expr num_9 env) (arm:bind-expr num_10 env) (arm:bind-expr num_11 env) 
		 (arm:bind-expr num_12 env) (arm:bind-expr num_13 env) (arm:bind-expr num_14 env) 
		 (arm:bind-expr prec_i env) (arm:bind-expr num_16 env))
	]
	[ (vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmaxq_u16_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr size_i_o env) 
		 (arm:bind-expr num_3 env) (arm:bind-expr num_4 env) (arm:bind-expr num_5 env) 
		 (arm:bind-expr prec_o env) (arm:bind-expr num_7 env) (arm:bind-expr num_8 env) 
		 (arm:bind-expr num_9 env) (arm:bind-expr num_10 env) (arm:bind-expr num_11 env) 
		 (arm:bind-expr num_12 env) (arm:bind-expr num_13 env) (arm:bind-expr num_14 env) 
		 (arm:bind-expr prec_i env) (arm:bind-expr num_16 env))
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmaxq_u16_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr size_i_o env) 
		 (arm:bind-expr num_3 env) (arm:bind-expr num_4 env) (arm:bind-expr num_5 env) 
		 (arm:bind-expr prec_i_o env) (arm:bind-expr num_7 env) (arm:bind-expr num_8 env) 
		 (arm:bind-expr num_9 env) (arm:bind-expr num_10 env))
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vminq_s8_dsl (arm:bind-expr v0 env) (arm:bind-expr v1 env) (arm:bind-expr size_i_o env) 
		 (arm:bind-expr num_3 env) (arm:bind-expr num_4 env) (arm:bind-expr num_5 env) 
		 (arm:bind-expr prec_i_o env) (arm:bind-expr num_7 env) (arm:bind-expr num_8 env) 
		 (arm:bind-expr num_9 env) (arm:bind-expr num_10 env))
	]
	[v v]
 )
)
;; ================================================================================

