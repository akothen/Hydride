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
(require hydride/ir/hvx/definition)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (hvx:get-prec prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
	[(lit v) (bvlength v)]
	[(nop v1) (hvx:get-prec v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) num_2]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
	[(hexagon_V6_veqb_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
)

	]
	[(hexagon_V6_vmpyieoh_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vavgub_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(cond 
		[(and  (equal? prec_i_o 8) (equal? num_4 0)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_4 0)) 32]
		[(and  (equal? prec_i_o 32) (equal? num_4 1)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_4 0)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_4 1)) 8]
		[(and  (equal? prec_i_o 16) (equal? num_4 1)) 16]
)

	]
	[(hexagon_V6_vabsw_128B_dsl v0 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 32)) 32]
		[(and  (equal? prec_i_o 8)) 8]
		[(and  (equal? prec_i_o 16)) 16]
)

	]
	[(hexagon_V6_vmpabuu_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 0) (equal? num_3 0)) 16]
		[(and  (equal? num_2 1) (equal? num_3 1)) 16]
)

	]
	[(hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 32) (equal? num_6 64) (equal? num_7 1) (equal? num_8 64) (equal? num_9 4) (equal? num_10 8)) 32]
		[(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 32) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? num_9 4) (equal? num_10 8)) 32]
		[(and  (equal? num_3 512) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 64) (equal? num_7 1) (equal? num_8 64) (equal? num_9 2) (equal? num_10 16)) 32]
		[(and  (equal? num_3 512) (equal? num_4 8) (equal? prec_i_o 16) (equal? num_6 32) (equal? num_7 1) (equal? num_8 32) (equal? num_9 4) (equal? num_10 8)) 16]
)

	]
	[(hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(cond 
		[(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
		[(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
		[(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
)

	]
	[(hexagon_V6_vmpyiwb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
		(cond 
		[(and  (equal? num_2 256) (equal? num_3 8) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 64) (equal? num_7 4) (equal? num_8 8)) 32]
		[(and  (equal? num_2 512) (equal? num_3 8) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 32) (equal? num_7 4) (equal? num_8 8)) 16]
		[(and  (equal? num_2 512) (equal? num_3 16) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 64) (equal? num_7 2) (equal? num_8 16)) 32]
		[(and  (equal? num_2 256) (equal? num_3 8) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 4) (equal? num_8 8)) 32]
)

	]
	[(hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 0) (equal? num_3 0)) 16]
		[(and  (equal? num_2 1) (equal? num_3 1)) 16]
)

	]
	[(hexagon_V6_vmpyewuh_64_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
		(cond 
		[(and  (equal? num_1 1024) (equal? prec_i_o 16)) 16]
		[(and  (equal? num_1 128) (equal? prec_i_o 1)) 1]
)

	]
	[(hexagon_V6_vandvrt_128B_dsl v0 v1)
		(cond 
		[(and ) 1]
)

	]
	[(hexagon_V6_vandvqv_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vmpyiowh_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vunpackh_128B_dsl v0 prec_i prec_o num_3)
		(cond 
		[(and  (equal? prec_i 16) (equal? prec_o 32) (equal? num_3 1)) 32]
		[(and  (equal? prec_i 16) (equal? prec_o 32) (equal? num_3 0)) 32]
		[(and  (equal? prec_i 8) (equal? prec_o 16) (equal? num_3 0)) 16]
		[(and  (equal? prec_i 8) (equal? prec_o 16) (equal? num_3 1)) 16]
)

	]
	[(hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vsubbnq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(cond 
		[(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
)

	]
	[(hexagon_V6_vand_128B_dsl v0 v1 num_2 prec_i_o)
		(cond 
		[(and  (equal? num_2 1024) (equal? prec_i_o 16)) 16]
		[(and  (equal? num_2 128) (equal? prec_i_o 1)) 1]
)

	]
	[(hexagon_V6_vaddhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1)) 32]
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0)) 16]
)

	]
	[(hexagon_V6_vaslh_128B_dsl v0 v1)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
		(cond 
		[(and  (equal? prec_i_o 16) (equal? num_3 16)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_3 8)) 8]
)

	]
	[(hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
		(cond 
		[(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_3 -1)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_3 1)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
		[(and  (equal? prec_i_o 16) (equal? num_3 -1)) 16]
		[(and  (equal? prec_i_o 32) (equal? num_3 1)) 32]
		[(and  (equal? prec_i_o 32) (equal? num_3 0)) 32]
		[(and  (equal? prec_i_o 32) (equal? num_3 -1)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_3 1)) 16]
		[(and  (equal? prec_i_o 16) (equal? num_3 0)) 16]
)

	]
	[(hexagon_V6_vmpyewuh_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 16)) 16]
		[(and  (equal? prec_i_o 8)) 8]
)

	]
	[(hexagon_V6_vasrhubrndsat_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6)
		(cond 
		[(and  (equal? num_3 0) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1)) 8]
		[(and  (equal? num_3 0) (equal? num_4 0) (equal? num_5 0) (equal? num_6 0)) 8]
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1) (equal? num_6 1)) 8]
)

	]
	[(hexagon_V6_vaslw_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vaslw_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 32)) 32]
		[(and  (equal? prec_i_o 16)) 16]
		[(and  (equal? prec_i_o 8)) 8]
)

	]
	[(hexagon_V6_vgtw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(cond 
		[(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
		[(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
		[(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
)

	]
	[(hexagon_V6_vroundhub_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 0) (equal? num_3 0)) 8]
		[(and  (equal? num_2 1) (equal? num_3 1)) 8]
		[(and  (equal? num_2 0) (equal? num_3 0)) 8]
)

	]
	[(hexagon_V6_lvsplatb_128B_dsl v0 prec_o)
		(cond 
		[(and  (equal? prec_o 8)) 8]
		[(and  (equal? prec_o 16)) 16]
)

	]
	[(hexagon_V6_vasrhubsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vsubuhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0)) 16]
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1)) 32]
)

	]
	[(hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 1]
)

	]
	[(hexagon_V6_veqw_128B_dsl v0 vc_1 vc_2 v3 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
)

	]
	[(hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_2 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_5 64) (equal? num_6 1)) 32]
		[(and  (equal? lane_size 32) (equal? num_2 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_5 128) (equal? num_6 0)) 16]
		[(and  (equal? lane_size 64) (equal? num_2 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
		[(and  (equal? lane_size 32) (equal? num_2 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_5 128) (equal? num_6 1)) 16]
)

	]
	[(hexagon_V6_vadduwsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 -1) (equal? num_6 128)) 8]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 128)) 8]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 1) (equal? num_6 128)) 8]
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 -1) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 -1) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 64)) 16]
)

	]
	[(hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(cond 
		[(and  (equal? num_3 0) (equal? num_4 0)) 16]
		[(and  (equal? num_3 1) (equal? num_4 1)) 16]
)

	]
	[(hexagon_V6_vsubb_128B_dsl v0 v1 prec_i_o num_3)
		(cond 
		[(and  (equal? prec_i_o 8) (equal? num_3 -1)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_3 1)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_3 1)) 32]
		[(and  (equal? prec_i_o 32) (equal? num_3 -1)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_3 -1)) 16]
		[(and  (equal? prec_i_o 16) (equal? num_3 1)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
		[(and  (equal? prec_i_o 32) (equal? num_3 0)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_3 0)) 16]
)

	]
	[(hexagon_V6_vswap_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vmux_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vasrhbsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vmpabuuv_128B_dsl v0 v1)
		(cond 
		[(and ) 16]
		[(and ) 16]
)

	]
	[(hexagon_V6_vdmpyhsuisat_acc_128B_dsl v0 v1 v2 num_3)
		(cond 
		[(and  (equal? num_3 0)) 32]
		[(and  (equal? num_3 0)) 32]
		[(and  (equal? num_3 1)) 32]
		[(and  (equal? num_3 1)) 32]
)

	]
	[(hexagon_V6_veqb_and_128B_dsl vc_0 v1 vc_2 v3 v4 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
)

	]
	[(hexagon_V6_vinsertwr_128B_dsl v0)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vasruwuhsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vandqrt_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vlsrb_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
		(cond 
		[(and  (equal? num_2 128) (equal? prec_o 1)) 1]
		[(and  (equal? num_2 1024) (equal? prec_o 16)) 16]
)

	]
	[(hexagon_V6_vrmpybusv_128B_dsl vc_0 v1 v2 num_3 num_4 num_5)
		(cond 
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 0)) 32]
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 0)) 32]
		[(and  (equal? num_3 0) (equal? num_4 0) (equal? num_5 0)) 32]
		[(and  (equal? num_3 0) (equal? num_4 0) (equal? num_5 0)) 32]
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1)) 32]
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1)) 32]
)

	]
	[(hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 8)) 8]
		[(and  (equal? prec_i_o 16)) 16]
)

	]
	[(hexagon_V6_vmpyh_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1) (equal? num_3 1)) 32]
		[(and  (equal? num_2 0) (equal? num_3 0)) 32]
)

	]
	[(hexagon_V6_vgtuh_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(cond 
		[(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
		[(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
		[(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
)

	]
	[(hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 128)) 16]
		[(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 64)) 32]
		[(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64)) 32]
		[(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128)) 16]
		[(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64)) 32]
		[(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 128)) 16]
)

	]
	[(hexagon_V6_vsubh_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(cond 
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 -1) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 -1) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 32)) 32]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 128)) 8]
		[(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 -1) (equal? num_6 128)) 8]
		[(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 1) (equal? num_6 128)) 8]
)

	]
	[(hexagon_V6_vmpahb_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0) (equal? num_8 0)) 16]
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0) (equal? num_8 1)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 1) (equal? num_8 0)) 16]
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0) (equal? num_8 0)) 32]
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1) (equal? num_8 1)) 32]
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 1) (equal? num_8 1)) 16]
)

	]
	[(hexagon_V6_lo_128B_dsl v0)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
		(cond 
		[(and  (equal? num_3 8) (equal? prec_i_o 16)) 16]
		[(and  (equal? num_3 16) (equal? prec_i_o 32)) 32]
)

	]
	[(hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o num_5)
		(cond 
		[(and  (equal? prec_i_o 16) (equal? num_5 0)) 16]
		[(and  (equal? prec_i_o 32) (equal? num_5 1)) 32]
		[(and  (equal? prec_i_o 32) (equal? num_5 0)) 32]
		[(and  (equal? prec_i_o 8) (equal? num_5 0)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_5 1)) 8]
		[(and  (equal? prec_i_o 16) (equal? num_5 1)) 16]
)

	]
	[(hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vasruhubsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_veqb_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
)

	]
	[(hexagon_V6_vasrwhsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vgtub_and_128B_dsl v0 vc_1 vc_2 v3 v4 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
)

	]
	[(hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
		(cond 
		[(and  (equal? prec_i_o 8) (equal? num_3 8)) 8]
		[(and  (equal? prec_i_o 16) (equal? num_3 16)) 16]
)

	]
	[(hexagon_V6_vdealb4w_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vaddhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 64)) 32]
		[(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 64)) 32]
		[(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 128)) 16]
)

	]
	[(hexagon_V6_vasrwh_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(cond 
		[(and  (equal? num_3 1) (equal? num_4 1)) 32]
		[(and  (equal? num_3 0) (equal? num_4 0)) 32]
		[(and  (equal? num_3 0) (equal? num_4 0)) 32]
		[(and  (equal? num_3 1) (equal? num_4 1)) 32]
)

	]
	[(hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vgth_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
)

	]
	[(hexagon_V6_pred_or_n_128B_dsl v0 v1)
		(cond 
		[(and ) 1]
)

	]
	[(hexagon_V6_vminub_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 8)) 8]
		[(and  (equal? prec_i_o 16)) 16]
)

	]
	[(hexagon_V6_vshufoeh_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(cond 
		[(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 16) (equal? num_6 64)) 16]
		[(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 8) (equal? num_6 128)) 8]
)

	]
	[(hexagon_V6_vsathub_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
		(cond 
		[(and  (equal? prec_o 8) (equal? num_3 8) (equal? num_4 0) (equal? prec_i 16) (equal? num_6 0)) 8]
		[(and  (equal? prec_o 16) (equal? num_3 16) (equal? num_4 1) (equal? prec_i 32) (equal? num_6 1)) 16]
		[(and  (equal? prec_o 16) (equal? num_3 16) (equal? num_4 0) (equal? prec_i 32) (equal? num_6 0)) 16]
)

	]
	[(hexagon_V6_vgth_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(cond 
		[(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
		[(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
		[(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
)

	]
	[(hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vandvnqv_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_hi_128B_dsl v0 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 8)) 8]
		[(and  (equal? prec_i_o 32)) 32]
)

	]
	[(hexagon_V6_vgth_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(cond 
		[(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
		[(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
		[(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
)

	]
	[(hexagon_V6_vpackhb_sat_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1) (equal? num_3 1)) 8]
		[(and  (equal? num_2 0) (equal? num_3 0)) 8]
)

	]
	[(hexagon_V6_vmpyih_128B_dsl v0 v1)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vlsrh_128B_dsl v0 v1)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vmpyub_128B_dsl v0 v1 num_2)
		(cond 
		[(and  (equal? num_2 0)) 16]
		[(and  (equal? num_2 1)) 16]
)

	]
	[(hexagon_V6_vminw_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 32)) 32]
		[(and  (equal? prec_i_o 16)) 16]
		[(and  (equal? prec_i_o 8)) 8]
)

	]
	[(hexagon_V6_vcombine_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_lvsplatw_128B_dsl v0)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vlsrw_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
		(cond 
		[(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1)) 32]
		[(and  (equal? num_3 -1) (equal? num_4 0) (equal? num_5 0)) 32]
		[(and  (equal? num_3 -1) (equal? num_4 1) (equal? num_5 1)) 32]
)

	]
	[(hexagon_V6_vasrwuhsat_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vroundwh_128B_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1) (equal? num_3 1)) 16]
		[(and  (equal? num_2 0) (equal? num_3 0)) 16]
		[(and  (equal? num_2 0) (equal? num_3 0)) 16]
)

	]
	[(hexagon_V6_vgtuw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(cond 
		[(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
		[(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
		[(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
)

	]
	[(hexagon_V6_vasrh_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_vasrw_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
		[(and ) 16]
)

	]
	[(hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(cond 
		[(and  (equal? prec_i_o 32) (equal? num_4 1)) 32]
		[(and  (equal? prec_i_o 16) (equal? num_4 1)) 16]
		[(and  (equal? prec_i_o 8) (equal? num_4 1)) 8]
		[(and  (equal? prec_i_o 8) (equal? num_4 0)) 8]
)

	]
	[(hexagon_V6_vmpyuhe_128B_dsl v0 v1)
		(cond 
		[(and ) 32]
)

	]
	[(hexagon_V6_vgtub_128B_dsl vc_0 v1 vc_2 v3 prec_o prec_i)
		(cond 
		[(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
		[(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
		[(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
)

	]
	[(hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2 num_3)
		(cond 
		[(and  (equal? num_3 0)) 32]
		[(and  (equal? num_3 1)) 32]
		[(and  (equal? num_3 0)) 32]
		[(and  (equal? num_3 1)) 32]
)

	]
	[(hexagon_V6_vdmpyhb_128B_dsl vc_0 v1 v2)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vandnqrt_128B_dsl v0 v1)
		(cond 
		[(and ) 8]
)

	]
	[(hexagon_V6_vasrwuhrndsat_128B_dsl v0 v1 v2 num_3 num_4)
		(cond 
		[(and  (equal? num_3 0) (equal? num_4 0)) 16]
		[(and  (equal? num_3 1) (equal? num_4 1)) 16]
		[(and  (equal? num_3 0) (equal? num_4 0)) 16]
)

	]
	[(hexagon_V6_vor_128B_dsl v0 v1 num_2 prec_i_o)
		(cond 
		[(and  (equal? num_2 1024) (equal? prec_i_o 16)) 16]
		[(and  (equal? num_2 128) (equal? prec_i_o 1)) 1]
)

	]
	[(hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(cond 
		[(and  (equal? lane_size 16) (equal? num_2 16) (equal? prec_i_o 8) (equal? num_4 16) (equal? num_5 8)) 8]
		[(and  (equal? lane_size 32) (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 32) (equal? num_5 2)) 16]
)

	]
	[(hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
		[(and ) 32]
)

	]
	[(hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(cond 
		[(and  (equal? lane_size 32) (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 32) (equal? num_5 2)) 16]
		[(and  (equal? lane_size 16) (equal? num_2 16) (equal? prec_i_o 8) (equal? num_4 16) (equal? num_5 8)) 8]
)

	]
	[(hexagon_V6_vpackeh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
		(cond 
		[(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32) (equal? num_6 16)) 16]
		[(and  (equal? num_2 8) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 64) (equal? num_6 8)) 8]
)

	]
	[(hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
		(cond 
		[(and  (equal? num_3 1)) 16]
		[(and  (equal? num_3 0)) 16]
)

	]
	[(hexagon_V6_vaslh_acc_128B_dsl v0 v1 v2)
		(cond 
		[(and ) 16]
)

	]
	[(hexagon_V6_pred_and_n_128B_dsl v0 v1)
		(cond 
		[(and ) 1]
)

	]
	[(hexagon_V6_vabsdiffw_128B_dsl v0 v1 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 32)) 32]
		[(and  (equal? prec_i_o 16)) 16]
)

	]
	[(hexagon_V6_vabsb_sat_128B_dsl v0 prec_i_o)
		(cond 
		[(and  (equal? prec_i_o 8)) 8]
		[(and  (equal? prec_i_o 16)) 16]
		[(and  (equal? prec_i_o 32)) 32]
)

	]
	[(hexagon_V6_vpackoh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
		(cond 
		[(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32) (equal? num_6 16) (equal? num_7 16)) 16]
		[(and  (equal? num_2 8) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 64) (equal? num_6 8) (equal? num_7 8)) 8]
)

	]
	[(vector-ashr_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1024) (equal? num_3 32)) 32]
		[(and  (equal? num_2 1024) (equal? num_3 64)) 64]
		[(and  (equal? num_2 1024) (equal? num_3 8)) 8]
		[(and  (equal? num_2 1024) (equal? num_3 16)) 16]
)

	]
	[(vector-lshr_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1024) (equal? num_3 32)) 32]
		[(and  (equal? num_2 1024) (equal? num_3 64)) 64]
		[(and  (equal? num_2 1024) (equal? num_3 8)) 8]
		[(and  (equal? num_2 1024) (equal? num_3 16)) 16]
)

	]
	[(vector-shl_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 1024) (equal? num_3 32)) 32]
		[(and  (equal? num_2 1024) (equal? num_3 64)) 64]
		[(and  (equal? num_2 1024) (equal? num_3 8)) 8]
		[(and  (equal? num_2 1024) (equal? num_3 16)) 16]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================
