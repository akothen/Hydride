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
	[(vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[else (error "Unable to infer prec for vraddhn_s32")]
)

	]
	[(vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[else (error "Unable to infer prec for vmla_n_s32")]
)

	]
	[(vshl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 8]
		[else (error "Unable to infer prec for vshl_s8")]
)

	]
	[(vsubw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 2) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 2) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 2) (equal? num_12 0)) 64]
		[else (error "Unable to infer prec for vsubw_high_u8")]
)

	]
	[(vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 0) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 1) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)) 32]
		[else (error "Unable to infer prec for vmull_n_u16")]
)

	]
	[(vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? num_13 2)) 64]
		[else (error "Unable to infer prec for vmlsl_high_n_s32")]
)

	]
	[(vmlaq_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[else (error "Unable to infer prec for vmlaq_n_u16")]
)

	]
	[(vaddl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? num_12 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0) (equal? num_12 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 0) (equal? num_12 2)) 32]
		[else (error "Unable to infer prec for vaddl_high_s16")]
)

	]
	[(vqsub_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[else (error "Unable to infer prec for vqsub_u8")]
)

	]
	[(vpminq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[else (error "Unable to infer prec for vpminq_s32")]
)

	]
	[(vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)) 32]
		[else (error "Unable to infer prec for vqdmull_n_s16")]
)

	]
	[(vuqaddq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 32]
		[else (error "Unable to infer prec for vuqaddq_s8")]
)

	]
	[(vcgtzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[else (error "Unable to infer prec for vcgtzq_s64")]
)

	]
	[(vrshlq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 8]
		[else (error "Unable to infer prec for vrshlq_s8")]
)

	]
	[(vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 32]
		[else (error "Unable to infer prec for vqdmulhq_n_s32")]
)

	]
	[(vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[else (error "Unable to infer prec for vqabs_s8")]
)

	]
	[(vmovn_u64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)) 8]
		[else (error "Unable to infer prec for vmovn_u64")]
)

	]
	[(vabd_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 8]
		[else (error "Unable to infer prec for vabd_u16")]
)

	]
	[(vqdmlals_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 64]
		[else (error "Unable to infer prec for vqdmlals_s32")]
)

	]
	[(vmul_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[else (error "Unable to infer prec for vmul_n_s32")]
)

	]
	[(vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 64]
		[else (error "Unable to infer prec for vsubl_s8")]
)

	]
	[(vshll_high_n_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 8) (equal? num_10 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 16) (equal? num_10 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 2)) 64]
		[else (error "Unable to infer prec for vshll_high_n_u8")]
)

	]
	[(vmvnq_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for vmvnq_s8")]
)

	]
	[(vsraq_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1)) 8]
		[else (error "Unable to infer prec for vsraq_n_s32")]
)

	]
	[(vqdmull_high_n_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 2)) 64]
		[else (error "Unable to infer prec for vqdmull_high_n_s32")]
)

	]
	[(vsubhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)) 8]
		[else (error "Unable to infer prec for vsubhn_s32")]
)

	]
	[(vclt_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[else (error "Unable to infer prec for vclt_u32")]
)

	]
	[(vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)) 32]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 32]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 32]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)) 8]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)) 16]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)) 32]
		[else (error "Unable to infer prec for vqmovn_s32")]
)

	]
	[(vqshlq_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 4)) 32]
		[else (error "Unable to infer prec for vqshlq_s64")]
)

	]
	[(vceqzq_s64_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)) 64]
		[else (error "Unable to infer prec for vceqzq_s64")]
)

	]
	[(vmlal_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 64]
		[else (error "Unable to infer prec for vmlal_s32")]
)

	]
	[(vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 32) (equal? num_18 2)) 64]
		[else (error "Unable to infer prec for vqdmlsl_high_n_s32")]
)

	]
	[(vabdl_high_s8_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 2)) 16]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0) (equal? num_14 2)) 32]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 0) (equal? num_14 2)) 64]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 2)) 64]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 2)) 32]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? num_14 2)) 16]
		[else (error "Unable to infer prec for vabdl_high_s8")]
)

	]
	[(vmovq_n_u8_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(cond 
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 64]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 64]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 64]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)) 32]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)) 64]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)) 16]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)) 8]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)) 16]
		[else (error "Unable to infer prec for vmovq_n_u8")]
)

	]
	[(vrhaddq_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[else (error "Unable to infer prec for vrhaddq_s8")]
)

	]
	[(vtst_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 32]
		[else (error "Unable to infer prec for vtst_s8")]
)

	]
	[(vmovl_high_u16_dsl vc_0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 8) (equal? num_10 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 16) (equal? num_10 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2)) 16]
		[else (error "Unable to infer prec for vmovl_high_u16")]
)

	]
	[(vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 32) (equal? num_18 2)) 64]
		[else (error "Unable to infer prec for vqdmlal_high_n_s32")]
)

	]
	[(vmls_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 16]
		[else (error "Unable to infer prec for vmls_n_s16")]
)

	]
	[(vcgt_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[else (error "Unable to infer prec for vcgt_u16")]
)

	]
	[(vsub_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[else (error "Unable to infer prec for vsub_s64")]
)

	]
	[(vceq_s8_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)) 64]
		[else (error "Unable to infer prec for vceq_s8")]
)

	]
	[(vmlaq_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[else (error "Unable to infer prec for vmlaq_s32")]
)

	]
	[(vqdmull_high_s32_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2)) 64]
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 2)) 32]
		[else (error "Unable to infer prec for vqdmull_high_s32")]
)

	]
	[(vabdl_s8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)) 64]
		[else (error "Unable to infer prec for vabdl_s8")]
)

	]
	[(vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 64]
		[else (error "Unable to infer prec for vmlsl_n_s32")]
)

	]
	[(vmlsl_high_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0) (equal? num_13 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 2)) 32]
		[else (error "Unable to infer prec for vmlsl_high_u32")]
)

	]
	[(vrsra_n_s8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1)) 32]
		[else (error "Unable to infer prec for vrsra_n_s8")]
)

	]
	[(vadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)) 32]
		[else (error "Unable to infer prec for vadd_u64")]
)

	]
	[(vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 64]
		[else (error "Unable to infer prec for vmull_n_s32")]
)

	]
	[(vhadd_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[else (error "Unable to infer prec for vhadd_u8")]
)

	]
	[(vaddw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 2) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 2) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 2) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1)) 16]
		[else (error "Unable to infer prec for vaddw_high_s32")]
)

	]
	[(vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)) 16]
		[else (error "Unable to infer prec for vtrn1_u16")]
)

	]
	[(vrshl_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[else (error "Unable to infer prec for vrshl_s32")]
)

	]
	[(vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)) 64]
		[else (error "Unable to infer prec for vmull_u32")]
)

	]
	[(vsra_n_u8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0)) 16]
		[else (error "Unable to infer prec for vsra_n_u8")]
)

	]
	[(vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)) 32]
		[else (error "Unable to infer prec for vqdmull_s32")]
)

	]
	[(vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[else (error "Unable to infer prec for vmaxq_u16")]
)

	]
	[(vshll_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 32]
		[else (error "Unable to infer prec for vshll_n_u16")]
)

	]
	[(vzip1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)) 32]
		[else (error "Unable to infer prec for vzip1_s32")]
)

	]
	[(vcgeq_u32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[else (error "Unable to infer prec for vcgeq_u32")]
)

	]
	[(vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 2)) 32]
		[else (error "Unable to infer prec for vqdmlal_high_n_s16")]
)

	]
	[(vqneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)) 8]
		[else (error "Unable to infer prec for vqneg_s32")]
)

	]
	[(vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)) 32]
		[else (error "Unable to infer prec for vqdmlsl_n_s16")]
)

	]
	[(vmulq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
		[else (error "Unable to infer prec for vmulq_u8")]
)

	]
	[(vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)) 32]
		[else (error "Unable to infer prec for vtrn2_s32")]
)

	]
	[(vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[else (error "Unable to infer prec for vcltz_s32")]
)

	]
	[(vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 2)) 32]
		[else (error "Unable to infer prec for vqdmlsl_high_s32")]
)

	]
	[(vqdmulh_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)) 16]
		[else (error "Unable to infer prec for vqdmulh_s16")]
)

	]
	[(vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 2)) 32]
		[else (error "Unable to infer prec for vqdmlsl_high_n_s16")]
)

	]
	[(vmlsl_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 2)) 32]
		[else (error "Unable to infer prec for vmlsl_high_n_s16")]
)

	]
	[(vpaddq_u64_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)) 64]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 8]
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 32]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 8]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 16]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 32]
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 32]
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)) 64]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 16]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 16]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 8]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)) 16]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)) 8]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)) 32]
		[else (error "Unable to infer prec for vpaddq_u64")]
)

	]
	[(vmull_high_n_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 1) (equal? num_10 16) (equal? num_11 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 2)) 32]
		[else (error "Unable to infer prec for vmull_high_n_s16")]
)

	]
	[(vqrshlq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 8)) 64]
		[else (error "Unable to infer prec for vqrshlq_s16")]
)

	]
	[(vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 64]
		[else (error "Unable to infer prec for vmlal_n_u32")]
)

	]
	[(vmlsq_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 8]
		[else (error "Unable to infer prec for vmlsq_u16")]
)

	]
	[(vqshl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)) 8]
		[else (error "Unable to infer prec for vqshl_u8")]
)

	]
	[(vuzp2_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)) 16]
		[else (error "Unable to infer prec for vuzp2_s16")]
)

	]
	[(vclezq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[else (error "Unable to infer prec for vclezq_s8")]
)

	]
	[(vqrshl_u8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 8]
		[else (error "Unable to infer prec for vqrshl_u8")]
)

	]
	[(vhsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[else (error "Unable to infer prec for vhsubq_u16")]
)

	]
	[(vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 32]
		[else (error "Unable to infer prec for vmlal_n_s16")]
)

	]
	[(vuzp1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)) 16]
		[else (error "Unable to infer prec for vuzp1_u16")]
)

	]
	[(vqdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)) 16]
		[else (error "Unable to infer prec for vqdmulhq_n_s16")]
)

	]
	[(vshl_u16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 1) (equal? num_13 4)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8)) 64]
		[else (error "Unable to infer prec for vshl_u16")]
)

	]
	[(vabs_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 8]
		[else (error "Unable to infer prec for vabs_s32")]
)

	]
	[(vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)) 64]
		[else (error "Unable to infer prec for vaddl_u8")]
)

	]
	[(vqdmull_high_n_s16_dsl vc_0 v1 v2 size_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2)) 32]
		[else (error "Unable to infer prec for vqdmull_high_n_s16")]
)

	]
	[(vneg_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)) 64]
		[else (error "Unable to infer prec for vneg_s8")]
)

	]
	[(vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)) 32]
		[else (error "Unable to infer prec for vqdmlsls_s32")]
)

	]
	[(vmull_high_n_u32_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2)) 64]
		[else (error "Unable to infer prec for vmull_high_n_u32")]
)

	]
	[(vpmax_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)) 16]
		[else (error "Unable to infer prec for vpmax_u32")]
)

	]
	[(vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)) 64]
		[else (error "Unable to infer prec for vqdmull_n_s32")]
)

	]
	[(vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 64]
		[else (error "Unable to infer prec for vsubw_s8")]
)

	]
	[(vrsra_n_u8_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0)) 64]
		[else (error "Unable to infer prec for vrsra_n_u8")]
)

	]
	[(vcle_s64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 8]
		[else (error "Unable to infer prec for vcle_s64")]
)

	]
	[(vsubl_high_s16_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0) (equal? num_12 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? num_12 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 0) (equal? num_12 2)) 32]
		[else (error "Unable to infer prec for vsubl_high_s16")]
)

	]
	[(vqadd_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 32]
		[else (error "Unable to infer prec for vqadd_u64")]
)

	]
	[(vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)) 32]
		[else (error "Unable to infer prec for vqdmlal_n_s16")]
)

	]
	[(vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)) 64]
		[else (error "Unable to infer prec for vqdmlsl_n_s32")]
)

	]
	[(vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)) 32]
		[else (error "Unable to infer prec for vmlsl_n_u16")]
)

	]
	[(vminq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)) 32]
		[else (error "Unable to infer prec for vminq_u16")]
)

	]
	[(vmlsl_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)) 64]
		[else (error "Unable to infer prec for vmlsl_u16")]
)

	]
	[(vcgez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)) 8]
		[else (error "Unable to infer prec for vcgez_s16")]
)

	]
	[(vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
		[else (error "Unable to infer prec for vmulq_n_s16")]
)

	]
	[(vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0) (equal? num_13 2)) 16]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0) (equal? num_13 2)) 64]
		[else (error "Unable to infer prec for vmlal_high_s8")]
)

	]
	[(vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)) 64]
		[else (error "Unable to infer prec for vqdmlal_n_s32")]
)

	]
	[(vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 2)) 64]
		[else (error "Unable to infer prec for vqdmlal_high_s16")]
)

	]
	[(vmull_high_u8_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 8) (equal? num_10 0) (equal? num_11 2)) 16]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 0) (equal? num_11 2)) 32]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 2)) 64]
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 8) (equal? num_10 1) (equal? num_11 2)) 16]
		[else (error "Unable to infer prec for vmull_high_u8")]
)

	]
	[(vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)) 32]
		[else (error "Unable to infer prec for vmls_n_s32")]
)

	]
	[(vaddw_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)) 32]
		[else (error "Unable to infer prec for vaddw_s16")]
)

	]
	[(vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? num_13 2)) 64]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2)) 64]
		[else (error "Unable to infer prec for vmlal_high_n_u32")]
)

	]
	[(vmovl_u16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1)) 16]
		[else (error "Unable to infer prec for vmovl_u16")]
)

	]
	[(vzip2_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)) 32]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)) 64]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 8]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)) 8]
		[else (error "Unable to infer prec for vzip2_s8")]
)

	]
	[(vqshlb_n_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1)) 8]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 1)) 64]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1)) 32]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1)) 32]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1)) 8]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1)) 16]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1)) 8]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1)) 16]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1)) 16]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1)) 32]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 1)) 64]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 1)) 64]
		[else (error "Unable to infer prec for vqshlb_n_s8")]
)

	]
	[(vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2)) 32]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 2)) 32]
		[else (error "Unable to infer prec for vmlal_high_n_s16")]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

