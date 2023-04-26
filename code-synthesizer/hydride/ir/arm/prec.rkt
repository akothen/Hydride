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
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)

(require hydride/ir/hydride/definition)
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (arm:get-prec prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
	[(lit v) (bvlength v)]
	[(nop v1) (arm:get-prec v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) num_2]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
	[(vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[else (error "Unable to infer prec for vpmin_u16")]
)

	]
	[(vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[else (error "Unable to infer prec for vpmaxq_u16")]
)

	]
	[(vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[else (error "Unable to infer prec for vmaxq_u16")]
)

	]
	[(vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[else (error "Unable to infer prec for vminq_s8")]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

