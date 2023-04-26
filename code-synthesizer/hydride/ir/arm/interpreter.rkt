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


(require hydride/ir/arm/semantics)
(require hydride/ir/arm/definition)
(require hydride/ir/arm/length)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (arm:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(vector-two-input-swizzle (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (arm:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (arm:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm_shuffle_vectors (arm:interpret v0 env) (arm:interpret v1 env) num_2 
		 prec_i_o (arm:interpret v4 env) num_5)
	]
	[ (vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmin_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(vpmaxq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_o num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 prec_i num_16)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vmaxq_u16 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(vminq_s8 (arm:interpret v0 env) (arm:interpret v1 env) size_i_o 
		 num_3 num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9 num_10)
	]
	[v (error "Unrecognized Term in Interpreter" v)]
 )
)
;; ================================================================================

