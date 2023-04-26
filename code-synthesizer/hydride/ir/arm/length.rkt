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


(require hydride/ir/hydride/definition)
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Length
;; ================================================================================
(define (arm:get-length prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))]
	[(lit v) (bvlength v)]
	[(nop v1) (arm:get-length v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) (* (max 1 (/ num_2 num_5)) (+ num_4 (* 2 num_6)) prec_i_o)]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) (* 2 size_i_o)]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) size_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) size_i_o]
	[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) (* num_5 prec_i_o) ]
	[(vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 64]
		[else (error "Unable to infer length for vpmin_u16: "  prog)]
)

	]
	[(vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 64]
		[else (error "Unable to infer length for vpmaxq_u16: "  prog)]
)

	]
	[(vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[else (error "Unable to infer length for vmaxq_u16: "  prog)]
)

	]
	[(vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 128]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
		[else (error "Unable to infer length for vminq_s8: "  prog)]
)

	]
 )
)
;; ================================================================================

