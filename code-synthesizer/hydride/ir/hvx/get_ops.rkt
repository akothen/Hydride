#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Get Ops
;; ================================================================================
(define (hvx:get-bv-ops prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(remove-duplicates (append (list  'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (hvx:get-bv-ops v0)))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (hvx:get-bv-ops v0)))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(remove-duplicates (append (list  'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v4)))
	]
	[(hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 2) (equal? num_8 8) (equal? num_9 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 2) (equal? num_8 16) (equal? num_9 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vshuffob_128B")]
)

	]
	[(hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'bvxor 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'bvxor 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'bvxor 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_veqw_xor_128B")]
)

	]
	[(hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'bvadd 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vasrh_acc_128B")]
)

	]
	[(hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhb_acc_128B")]
)

	]
	[(hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'if 'bvult) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvslt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvslt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvslt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'if 'bvult) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vminuh_128B")]
)

	]
	[(hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvshl 'bvmul 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyieoh_128B")]
)

	]
	[(hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvusat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvssat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 1) (equal? num_17 8) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvusat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 1) (equal? num_17 8) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvssat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vpackwuh_sat_128B")]
)

	]
	[(hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 32) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 64) (equal? num_12 2) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vpackeh_128B")]
)

	]
	[(hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyih_acc_128B")]
)

	]
	[(hexagon_V6_lvsplatb_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
		(cond 
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 8) (equal? num_6 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 16) (equal? num_6 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_lvsplatb_128B")]
)

	]
	[(hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vasrw_acc_128B")]
)

	]
	[(hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvand 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvand 'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvand 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvand 'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvand 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvand 'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vgtuw_and_128B")]
)

	]
	[(hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvshl 'bvand 'bvadd 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vaslh_acc_128B")]
)

	]
	[(hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0) (equal? prec_o 16) (equal? num_21 1024) (equal? num_22 -1) (equal? num_23 1) (equal? num_24 0) (equal? num_25 24) (equal? num_26 1032) (equal? num_27 1) (equal? num_28 0) (equal? num_29 16) (equal? num_30 8) (equal? num_31 2) (equal? num_32 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 0) (equal? prec_o 16) (equal? num_21 1024) (equal? num_22 -1) (equal? num_23 0) (equal? num_24 0) (equal? num_25 24) (equal? num_26 1032) (equal? num_27 0) (equal? num_28 0) (equal? num_29 16) (equal? num_30 8) (equal? num_31 2) (equal? num_32 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpabus_128B")]
)

	]
	[(hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvshl 'bvand 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vaslw_acc_128B")]
)

	]
	[(hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsgt 'bvsub 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvugt 'bvsub 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvugt 'bvsub 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsgt 'bvsub 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vabsdiffh_128B")]
)

	]
	[(hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vshuffeb_128B")]
)

	]
	[(hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 4) (equal? num_13 -1) (equal? num_14 0)) 
  (remove-duplicates (append (list  'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vaddcarrysat_128B")]
)

	]
	[(hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvand) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvand) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_pred_and_128B")]
)

	]
	[(hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvugt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvugt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvugt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vgtb_128B")]
)

	]
	[(hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vaddubh_128B")]
)

	]
	[(hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvmul 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyewuh_128B")]
)

	]
	[(hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyh_128B")]
)

	]
	[(hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiewuh_128B")]
)

	]
	[(hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1040) (equal? num_13 1024) (equal? num_14 16) (equal? num_15 2) (equal? num_16 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1032) (equal? num_13 1024) (equal? num_14 8) (equal? num_15 2) (equal? num_16 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vshufoeh_128B")]
)

	]
	[(hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
		(cond 
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 32) (equal? num_6 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_lvsplatw_128B")]
)

	]
	[(hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvaddnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vaddhsat_128B")]
)

	]
	[(hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 1024) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 8) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0)) 
  (remove-duplicates (append (list  'bvnot 'bveq 'cond 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vswap_128B")]
)

	]
	[(hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vinsertwr_128B")]
)

	]
	[(hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)) 
  (remove-duplicates (append (list  'abs) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)) 
  (remove-duplicates (append (list  'abs) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)) 
  (remove-duplicates (append (list  'abs) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vabsh_128B")]
)

	]
	[(hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvshl 'zero-extend 'bvor) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvshl 'zero-extend 'bvor) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vunpackoh_128B")]
)

	]
	[(hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'abs 'bvssat) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'abs 'bvssat) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'abs 'bvssat) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vabsw_sat_128B")]
)

	]
	[(hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 4) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vandqrt_128B")]
)

	]
	[(hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvsub 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvsub 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvsub 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vsubuhw_128B")]
)

	]
	[(hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvor 'if 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvor 'if 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvor 'if 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_veqw_or_128B")]
)

	]
	[(hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnsw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsubnuw) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsub) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vsubh_128B")]
)

	]
	[(hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiewh_acc_128B")]
)

	]
	[(hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvusat 'bvashr 'bvshl 'zero-extend 'bvadd) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvashr 'bvshl 'bvadd 'bvssat 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvusat 'bvashr 'bvshl 'bvadd 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vasruhubrndsat_128B")]
)

	]
	[(hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiowh_128B")]
)

	]
	[(hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvashr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvashr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vaslhv_128B")]
)

	]
	[(hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? num_10 0) (equal? prec_i 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? num_10 1) (equal? prec_i 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? num_10 1) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? num_10 1) (equal? prec_i 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? num_10 0) (equal? prec_i 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvxor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vgtub_xor_128B")]
)

	]
	[(hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyih_128B")]
)

	]
	[(hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 2) (equal? num_17 16) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 0) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiwh_acc_128B")]
)

	]
	[(hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvnot 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vandvnqv_128B")]
)

	]
	[(hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvand 'zero-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvand 'zero-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vlsrh_128B")]
)

	]
	[(hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 0) (equal? num_21 0) (equal? prec_i_o 16) (equal? num_23 -1) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 0) (equal? num_27 24) (equal? num_28 1032) (equal? num_29 1) (equal? num_30 0) (equal? num_31 16) (equal? num_32 8) (equal? num_33 1024) (equal? num_34 2) (equal? num_35 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? prec_i_o 16) (equal? num_23 -1) (equal? num_24 -1) (equal? num_25 0) (equal? num_26 0) (equal? num_27 24) (equal? num_28 1032) (equal? num_29 0) (equal? num_30 0) (equal? num_31 16) (equal? num_32 8) (equal? num_33 1024) (equal? num_34 2) (equal? num_35 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpabus_acc_128B")]
)

	]
	[(hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vmux_128B")]
)

	]
	[(hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvsub) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvsub) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvsub) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvsub) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vnavgw_128B")]
)

	]
	[(hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvshl 'bvand 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vaslh_128B")]
)

	]
	[(hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 1) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 4) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvnot 'if 'bvor) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vandnqrt_acc_128B")]
)

	]
	[(hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 2) (equal? num_10 64) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 2) (equal? num_10 32) (equal? num_11 16) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vdealb_128B")]
)

	]
	[(hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? prec_i_o 32) (equal? num_25 -1) (equal? num_26 -1) (equal? num_27 1) (equal? num_28 1) (equal? num_29 24) (equal? num_30 16) (equal? num_31 1040) (equal? num_32 1) (equal? num_33 1) (equal? num_34 16) (equal? num_35 16) (equal? num_36 16) (equal? num_37 1024) (equal? num_38 4) (equal? num_39 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? prec_i_o 32) (equal? num_25 -1) (equal? num_26 -1) (equal? num_27 1) (equal? num_28 1) (equal? num_29 24) (equal? num_30 16) (equal? num_31 1040) (equal? num_32 1) (equal? num_33 1) (equal? num_34 16) (equal? num_35 16) (equal? num_36 16) (equal? num_37 1024) (equal? num_38 4) (equal? num_39 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpahb_acc_128B")]
)

	]
	[(hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvusat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvusat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvssat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vrounduhub_128B")]
)

	]
	[(hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvand) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vlsrw_128B")]
)

	]
	[(hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'bvlshr 'bvssat 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'bvlshr 'bvssat 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyowh_128B")]
)

	]
	[(hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 0) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvusat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvssat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 0) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvusat) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vsathub_128B")]
)

	]
	[(hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhvsat_acc_128B")]
)

	]
	[(hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'if 'bveq) (hvx:get-bv-ops v1) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'if 'bveq) (hvx:get-bv-ops v1) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'if 'bveq) (hvx:get-bv-ops v1) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_veqw_128B")]
)

	]
	[(hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyub_acc_128B")]
)

	]
	[(hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 0) (equal? num_11 256) (equal? num_12 8) (equal? num_13 0) (equal? num_14 256) (equal? prec_i_o 8) (equal? num_16 4) (equal? num_17 32) (equal? num_18 16) (equal? num_19 4) (equal? num_20 8) (equal? num_21 64) (equal? num_22 4) (equal? num_23 8) (equal? num_24 96) (equal? num_25 16) (equal? num_26 4) (equal? num_27 8) (equal? num_28 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vdealb4w_128B")]
)

	]
	[(hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvadd) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vrmpybv_128B")]
)

	]
	[(hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vrmpybus_acc_128B")]
)

	]
	[(hexagon_V6_vdmpybus_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend 'bvadd) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vdmpybus_128B")]
)

	]
	[(hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvand 'if 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvand 'if 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvand 'if 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_veqh_and_128B")]
)

	]
	[(hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyuhe_128B")]
)

	]
	[(hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 32) (equal? num_13 16) (equal? num_14 2) (equal? num_15 16) (equal? num_16 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 64) (equal? num_13 8) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vpackoh_128B")]
)

	]
	[(hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 
  (remove-duplicates (append (list  'bvmul 'bvaddnsw 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 
  (remove-duplicates (append (list  'bvmul 'bvaddnsw 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops vc_0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhisat_128B")]
)

	]
	[(hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 4) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvnot 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vandnqrt_128B")]
)

	]
	[(hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 32) (equal? num_7 2) (equal? num_8 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vshuffh_128B")]
)

	]
	[(hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_12 4) (equal? num_13 1) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvand 'if 'bveq 'bvor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vandvrt_acc_128B")]
)

	]
	[(hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? prec_o 16) (equal? num_19 1024) (equal? num_20 -1) (equal? num_21 0) (equal? num_22 0) (equal? num_23 1032) (equal? num_24 0) (equal? num_25 0) (equal? num_26 8) (equal? num_27 2) (equal? num_28 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? prec_o 16) (equal? num_19 1024) (equal? num_20 -1) (equal? num_21 0) (equal? num_22 0) (equal? num_23 1032) (equal? num_24 0) (equal? num_25 0) (equal? num_26 8) (equal? num_27 2) (equal? num_28 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpabusv_128B")]
)

	]
	[(hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vor_128B")]
)

	]
	[(hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'bvusat) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'bvusat) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 1) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvashr 'bvssat 'bvand) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vasruwuhsat_128B")]
)

	]
	[(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'bvlshr 'bvssat 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'bvlshr 'bvssat 'sign-extend) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyowh_rnd_sacc_128B")]
)

	]
	[(hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'sign-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vaddubh_acc_128B")]
)

	]
	[(hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvusat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvssat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvusat 'bvadd) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vroundwuh_128B")]
)

	]
	[(hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyihb_128B")]
)

	]
	[(hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvxor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvxor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_pred_xor_128B")]
)

	]
	[(hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 4) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvand 'if 'bveq) (hvx:get-bv-ops v2) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vandvrt_128B")]
)

	]
	[(hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vasrwh_128B")]
)

	]
	[(hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vandvqv_128B")]
)

	]
	[(hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vavgwrnd_128B")]
)

	]
	[(hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'if 'bvor) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'if 'bvor) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvugt 'bvor 'if) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvsgt 'if 'bvor) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vgth_or_128B")]
)

	]
	[(hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyuhe_acc_128B")]
)

	]
	[(hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvugt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvugt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmaxw_128B")]
)

	]
	[(hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 4) (equal? num_11 1) (equal? num_12 8) (equal? num_13 0)) 
  (remove-duplicates (append (list  'bvor 'if 'cond 'bveq) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v4)))]
		[else (error "Unable to get ops  for hexagon_V6_vandqrt_acc_128B")]
)

	]
	[(hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 0) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyub_128B")]
)

	]
	[(hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvand 'bvnot) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_pred_and_n_128B")]
)

	]
	[(hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvusat 'bvashr 'bvshl 'bvadd) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvashr 'bvshl 'bvadd 'bvssat) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 
  (remove-duplicates (append (list  'bvand 'bvsub 'bvusat 'bvashr 'bvshl 'bvadd) (hvx:get-bv-ops v3) (hvx:get-bv-ops v4) (hvx:get-bv-ops v5)))]
		[else (error "Unable to get ops  for hexagon_V6_vasruwuhrndsat_128B")]
)

	]
	[(hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)) 
  (remove-duplicates (append (list  'bvshl 'bvand) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vaslw_128B")]
)

	]
	[(hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvudiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 
  (remove-duplicates (append (list  'bvsdiv 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vavguw_128B")]
)

	]
	[(hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'bvusat 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 1) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
  (remove-duplicates (append (list  'bvashr 'bvssat 'bvand 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 0)) 
  (remove-duplicates (append (list  'bvashr 'bvand 'zero-extend 'bvusat) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vasrhubsat_128B")]
)

	]
	[(hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1024) (equal? num_7 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_lo_128B")]
)

	]
	[(hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vassign_128B")]
)

	]
	[(hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'sign-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'sign-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
  (remove-duplicates (append (list  'zero-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
  (remove-duplicates (append (list  'zero-extend) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vunpackh_128B")]
)

	]
	[(hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 1024) (equal? num_11 0)) 
  (remove-duplicates (append (list  ) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vcombine_128B")]
)

	]
	[(hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? prec_o 32) (equal? num_23 1024) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 1) (equal? num_27 24) (equal? num_28 16) (equal? num_29 1040) (equal? num_30 1) (equal? num_31 1) (equal? num_32 16) (equal? prec_i 16) (equal? num_34 16) (equal? num_35 4) (equal? num_36 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? prec_o 32) (equal? num_23 1024) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 1) (equal? num_27 24) (equal? num_28 16) (equal? num_29 1040) (equal? num_30 1) (equal? num_31 1) (equal? num_32 16) (equal? prec_i 16) (equal? num_34 16) (equal? num_35 4) (equal? num_36 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpauhb_128B")]
)

	]
	[(hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpybv_acc_128B")]
)

	]
	[(hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vlsrwv_128B")]
)

	]
	[(hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
  (remove-duplicates (append (list  'bvsub 'if 'cond 'bveq) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vsubhnq_128B")]
)

	]
	[(hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)) 
  (remove-duplicates (append (list  'sign-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)) 
  (remove-duplicates (append (list  'zero-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)) 
  (remove-duplicates (append (list  'sign-extend) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)) 
  (remove-duplicates (append (list  'zero-extend) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vsb_128B")]
)

	]
	[(hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
  (remove-duplicates (append (list  'if 'cond 'bveq 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vaddbq_128B")]
)

	]
	[(hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpybv_128B")]
)

	]
	[(hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvashr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 
  (remove-duplicates (append (list  'bvashr 'bvshl 'bvsgt 'if) (hvx:get-bv-ops v0) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vasrhv_128B")]
)

	]
	[(hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'sign-extend 'bvaddnsw 'bvadd) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'bvaddnsw 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)) 
  (remove-duplicates (append (list  'bvmul 'bvaddnsw 'zero-extend 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhsat_acc_128B")]
)

	]
	[(hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 
  (remove-duplicates (append (list  'bvmul 'bvadd 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 0) (equal? num_20 0) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 
  (remove-duplicates (append (list  'bvmul 'zero-extend 'bvadd) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 
  (remove-duplicates (append (list  'bvmul 'bvaddnsw 'sign-extend) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1) (hvx:get-bv-ops v2)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyh_acc_128B")]
)

	]
	[(hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)) 
  (remove-duplicates (append (list  'bvnot) (hvx:get-bv-ops v0)))]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 1) (equal? num_6 0)) 
  (remove-duplicates (append (list  'bvnot) (hvx:get-bv-ops v0)))]
		[else (error "Unable to get ops  for hexagon_V6_vnot_128B")]
)

	]
	[(hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 
  (remove-duplicates (append (list  'bvnot 'bvor) (hvx:get-bv-ops v0) (hvx:get-bv-ops v1)))]
		[else (error "Unable to get ops  for hexagon_V6_pred_or_n_128B")]
)

	]
	[(hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? prec_o 32) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 2) (equal? prec_i 32) (equal? num_24 0)) 
  (remove-duplicates (append (list  'bvlshr 'bvshl 'bvmul 'sign-extend) (hvx:get-bv-ops v2) (hvx:get-bv-ops v3)))]
		[else (error "Unable to get ops  for hexagon_V6_vmpyewuh_64_128B")]
)

	]
 )
)

;; ================================================================================