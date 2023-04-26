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
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_vpmin_u16_dsl 1)
(define cost_vpmaxq_u16_dsl 1)
(define cost_vmaxq_u16_dsl 1)
(define cost_vminq_s8_dsl 1)

(define (arm:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (arm:cost  v0)  (arm:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (arm:cost  v0)  (arm:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (arm:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (arm:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (arm:cost  v0)  (arm:cost  v1)  
		 (arm:cost  v4) )
	]
	[ (vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmin_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(+ cost_vpmaxq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vmaxq_u16_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ cost_vminq_s8_dsl (arm:cost  v0)  (arm:cost  v1)  
		 
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

