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


(provide (all-defined-out))



;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (get-prec prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
	[(lit v) (bvlength v)]
	[(nop v1) (get-prec v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o) prec_i_o]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) num_2]
	[(_mm512_mask_testn_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm512_maskz_mulhi_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
)

	]
	[(_mm_cmpge_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm512_mask_cmpge_epu8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(cond 
		[(and  (equal? size_i 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
		[(and  (equal? size_i 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
		[(and  (equal? size_i 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
)

	]
	[(_mm512_maskz_broadcast_i64x2_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 2)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 8)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 8)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 4)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 4)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 2)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 2)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 2)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 2)) 32]
)

	]
	[(_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 8)) 16]
)

	]
	[(_mm_maddubs_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? prec_i 8) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 8)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 8) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 8)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 8) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 8)) 16]
)

	]
	[(_mm256_mask_min_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
)

	]
	[(_mm256_avg_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm256_mask_cmpgt_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm512_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
)

	]
	[(_mm512_mask_cvtsepi32_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
)

	]
	[(_mm_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
)

	]
	[(_mm_maskz_sub_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
)

	]
	[(_mm512_mask_div_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 64)) 32]
)

	]
	[(_mm512_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm512_madd52hi_epu64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 416) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 52) (equal? num_11 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 416) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 0) (equal? num_11 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 208) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 0) (equal? num_11 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 104) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 0) (equal? num_11 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 104) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 52) (equal? num_11 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 208) (equal? prec_i 52) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 52) (equal? num_10 52) (equal? num_11 128)) 64]
)

	]
	[(_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
)

	]
	[(_mm512_mullo_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 16]
)

	]
	[(_mm256_mask_cmpneq_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm512_mask_reduce_add_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
)

	]
	[(_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
)

	]
	[(_mm256_subs_epu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm512_abs_epi64_dsl v0 size_i_o lane_size num_3 prec_i_o num_5)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0)) 64]
)

	]
	[(_mm_urem_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm512_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
)

	]
	[(_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16)) 32]
)

	]
	[(_mm256_maskz_andnot_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
)

	]
	[(_mm256_maskz_cvtepu32_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
)

	]
	[(_mm256_mask_xor_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
)

	]
	[(_mm512_mask_rem_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
)

	]
	[(_mm_mask_cvtepi32_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32)) 32]
)

	]
	[(_mm512_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm512_reduce_add_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
)

	]
	[(_mm256_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
)

	]
	[(_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
)

	]
	[(_mm_mask_cmplt_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
)

	]
	[(_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
)

	]
	[(_mm512_reduce_and_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
)

	]
	[(_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
)

	]
	[(_mm256_max_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
)

	]
	[(_mm256_mask_madd52lo_epu64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 208) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 0) (equal? num_12 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 416) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 0) (equal? num_12 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 104) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 52) (equal? num_12 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 104) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 0) (equal? num_12 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 416) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 52) (equal? num_12 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 208) (equal? num_7 52) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 52) (equal? num_11 52) (equal? num_12 128)) 64]
)

	]
	[(_mm256_test_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(cond 
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
)

	]
	[(_mm256_xor_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
)

	]
	[(_mm512_cmpeq_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm512_maskz_subs_epi8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
)

	]
	[(_mm_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm_maskz_mul_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
)

	]
	[(_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128)) 64]
)

	]
	[(_mm512_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm256_maskz_min_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
)

	]
	[(_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
)

	]
	[(_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm_dpbusds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(cond 
		[(and  (equal? size_i 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
		[(and  (equal? size_i 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
		[(and  (equal? size_i 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16)) 32]
)

	]
	[(_mm256_cmpneq_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
)

	]
	[(_m_pmovmskb_dsl v0 size_o lane_size num_3 prec_o num_5 num_6)
		(cond 
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) 1]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) 1]
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) 1]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) 1]
)

	]
	[(_mm512_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16)) 8]
)

	]
	[(_mm_mask_mul_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64)) 64]
)

	]
	[(_mm_cmpgt_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm512_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
)

	]
	[(_mm512_mask_reduce_and_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
)

	]
	[(_mm256_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 32]
)

	]
	[(_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
)

	]
	[(_mm_mask_blend_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
)

	]
	[(_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm512_maskz_mov_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 32]
)

	]
	[(_mm_cvtepu16_epi32_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64)) 64]
)

	]
	[(_mm256_broadcastmw_epi32_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
)

	]
	[(_mm512_mask_div_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 64)) 32]
)

	]
	[(_mm512_maskz_maddubs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_10 8)) 16]
)

	]
	[(_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 32]
)

	]
	[(_mm_cmplt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
)

	]
	[(_mm512_mask_cmpge_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm_dpwssds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(cond 
		[(and  (equal? size_i 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
		[(and  (equal? size_i 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
		[(and  (equal? size_i 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
)

	]
	[(_mm_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
)

	]
	[(_mm_dpwssd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(cond 
		[(and  (equal? size_i 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
		[(and  (equal? size_i 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
		[(and  (equal? size_i 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 32]
)

	]
	[(_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32)) 16]
)

	]
	[(_mm512_subs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64)) 64]
)

	]
	[(_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm512_mask_reduce_or_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
)

	]
	[(_mm256_cmpgt_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 32]
)

	]
	[(_mm256_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32)) 16]
)

	]
	[(_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm_cvtusepi64_epi32_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32)) 16]
)

	]
	[(_mm512_reduce_or_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
		[(and  (equal? size_i 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
)

	]
	[(_mm_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
)

	]
	[(_mm256_movm_epi64_dsl v0 size_o lane_size num_3 prec_o num_5 vc_6 vc_7)
		(cond 
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 64) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_o 64) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_o 8) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 64) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_o 16) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0)) prec_o]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_o 32) (equal? num_5 0)) prec_o]
)

	]
	[(_mm256_maskz_madd_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_10 16)) 32]
)

	]
	[(_mm512_mask_adds_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
)

	]
	[(_mm_maskz_avg_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
)

	]
	[(_mm_mask_or_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
)

	]
	[(_mm_maskz_abs_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 8]
)

	]
	[(_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
)

	]
	[(_mm256_cmpgt_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
)

	]
	[(_mm_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
)

	]
	[(_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
)

	]
	[(_mm_cmplt_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
)

	]
	[(_mm256_maskz_set1_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
)

	]
	[(_mm_adds_pu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
)

	]
	[(_mm256_mask_cmpeq_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(cond 
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm_maskz_add_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
)

	]
	[(_mm256_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32)) 16]
)

	]
	[(_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 64]
)

	]
	[(_mm512_broadcast_i64x2_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 2)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 2)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 4)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 8)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 4)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 4)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 2)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 2)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 2)) 32]
)

	]
	[(_mm512_cmple_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8)) 1]
)

	]
	[(_mm256_maskz_max_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
)

	]
	[(_mm512_maskz_madd52lo_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 prec_i_o num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 416) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 0) (equal? num_13 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 208) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 52) (equal? num_13 128)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 208) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 0) (equal? num_13 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 104) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 0) (equal? num_13 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 104) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 52) (equal? num_13 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 416) (equal? num_8 52) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 52) (equal? num_12 52) (equal? num_13 128)) 64]
)

	]
	[(_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16)) 32]
)

	]
	[(_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		(cond 
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
		[(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
		[(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
)

	]
	[(_mm_movepi16_mask_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 vc_7 vc_8)
		(cond 
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 16)) prec_o]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 32)) prec_o]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 4) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 64)) prec_o]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 64)) prec_o]
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 16) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 16)) prec_o]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 2) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 64)) prec_o]
		[(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 16)) prec_o]
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 16) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) prec_o]
		[(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_3 4) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 32)) prec_o]
		[(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_3 16) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 32)) prec_o]
		[(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) prec_o]
		[(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 8)) prec_o]
)

	]
	[(_mm256_mask_test_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(cond 
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 32) (equal? lane_size 32) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64)) 1]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16)) 1]
		[(and  (equal? size_i_o 16) (equal? lane_size 16) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
		[(and  (equal? size_i_o 8) (equal? lane_size 8) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32)) 1]
)

	]
	[(_mm256_mask_max_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0)) 64]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0)) 16]
)

	]
	[(_mm_madd_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? prec_i 16) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 16)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? prec_i 16) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 16)) 32]
		[(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? prec_i 16) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 16)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 16) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 16)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 16) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 16)) 32]
)

	]
	[(_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0)) 32]
)

	]
	[(_mm_div_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
)

	]
	[(_mm256_idiv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32)) 16]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 8) (equal? num_8 16)) 8]
		[(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 128)) 64]
		[(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32) (equal? num_8 64)) 32]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

