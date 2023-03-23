#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))

;; ================================================================================
;;                                DSL Get Sub-Expressions
;; ================================================================================
(define (hvx:get-sub-exprs prog)
 (destruct prog
	[(reg id) (list (reg id))]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(list v0 v1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(list v0 v1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(list v0 v1 v4)
	]
	[(hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 2) (equal? num_8 8) (equal? num_9 0)); hexagon_V6_vshuffob_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 2) (equal? num_8 16) (equal? num_9 0)); hexagon_V6_vshufoh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vshuffob_128B")]
)

	]
	[(hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqw_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqb_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqh_xor_128B
 
  (list v2 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_veqw_xor_128B")]
)

	]
	[(hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)); hexagon_V6_vasrh_acc_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vasrh_acc_128B")]
)

	]
	[(hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)); hexagon_V6_vdmpyhb_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)); hexagon_V6_vdmpyhb_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhb_acc_128B")]
)

	]
	[(hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vminuh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vminw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vminb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vminh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vminub_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vminuh_128B")]
)

	]
	[(hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)); hexagon_V6_vmpyieoh_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyieoh_128B")]
)

	]
	[(hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)); hexagon_V6_vpackwuh_sat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)); hexagon_V6_vpackwh_sat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 1) (equal? num_17 8) (equal? num_18 0)); hexagon_V6_vpackhub_sat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 1) (equal? num_17 8) (equal? num_18 0)); hexagon_V6_vpackhb_sat_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vpackwuh_sat_128B")]
)

	]
	[(hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 32) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)); hexagon_V6_vpackeh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 64) (equal? num_12 2) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vpackeb_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vpackeh_128B")]
)

	]
	[(hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)); hexagon_V6_vmpyih_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyih_acc_128B")]
)

	]
	[(hexagon_V6_lvsplatb_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
		(cond 
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 8) (equal? num_6 0)); hexagon_V6_lvsplatb_128B
 
  (list v0)]
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 16) (equal? num_6 0)); hexagon_V6_lvsplath_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_lvsplatb_128B")]
)

	]
	[(hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vasrw_acc_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vasrw_acc_128B")]
)

	]
	[(hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuw_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgth_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuh_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtw_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtub_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtb_and_128B
 
  (list v2 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vgtuw_and_128B")]
)

	]
	[(hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)); hexagon_V6_vaslh_acc_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vaslh_acc_128B")]
)

	]
	[(hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0) (equal? prec_o 16) (equal? num_21 1024) (equal? num_22 -1) (equal? num_23 1) (equal? num_24 0) (equal? num_25 24) (equal? num_26 1032) (equal? num_27 1) (equal? num_28 0) (equal? num_29 16) (equal? num_30 8) (equal? num_31 2) (equal? num_32 0)); hexagon_V6_vmpabus_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 0) (equal? prec_o 16) (equal? num_21 1024) (equal? num_22 -1) (equal? num_23 0) (equal? num_24 0) (equal? num_25 24) (equal? num_26 1032) (equal? num_27 0) (equal? num_28 0) (equal? num_29 16) (equal? num_30 8) (equal? num_31 2) (equal? num_32 0)); hexagon_V6_vmpabuu_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpabus_128B")]
)

	]
	[(hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vaslw_acc_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vaslw_acc_128B")]
)

	]
	[(hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); hexagon_V6_vabsdiffh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); hexagon_V6_vabsdiffuh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); hexagon_V6_vabsdiffub_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); hexagon_V6_vabsdiffw_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vabsdiffh_128B")]
)

	]
	[(hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0)); hexagon_V6_vshuffeb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0)); hexagon_V6_vshufeh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vshuffeb_128B")]
)

	]
	[(hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 4) (equal? num_13 -1) (equal? num_14 0)); hexagon_V6_vaddcarrysat_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vaddcarrysat_128B")]
)

	]
	[(hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)); hexagon_V6_pred_and_128B
 
  (list v0 v1)]
		[(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)); hexagon_V6_vand_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_pred_and_128B")]
)

	]
	[(hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgtb_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgtuw_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgtuh_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgtub_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgth_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vgtw_128B
 
  (list v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vgtb_128B")]
)

	]
	[(hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vaddubh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vadduhw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vaddhw_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vaddubh_128B")]
)

	]
	[(hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vmpyewuh_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyewuh_128B")]
)

	]
	[(hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)); hexagon_V6_vmpyh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)); hexagon_V6_vmpyuh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyh_128B")]
)

	]
	[(hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vmpyiewuh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiewuh_128B")]
)

	]
	[(hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1040) (equal? num_13 1024) (equal? num_14 16) (equal? num_15 2) (equal? num_16 0)); hexagon_V6_vshufoeh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1032) (equal? num_13 1024) (equal? num_14 8) (equal? num_15 2) (equal? num_16 0)); hexagon_V6_vshufoeb_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vshufoeh_128B")]
)

	]
	[(hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 size_i num_6)
		(cond 
		[(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? size_i 32) (equal? num_6 0)); hexagon_V6_lvsplatw_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_lvsplatw_128B")]
)

	]
	[(hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddhsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddwsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddbsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vaddububb_sat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vadduwsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddbsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vaddubsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddwsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddh_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vaddubsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vadduhsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vadduwsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddb_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vaddhsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vadduhsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vaddw_dv_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vaddhsat_128B")]
)

	]
	[(hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 1024) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 8) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0)); hexagon_V6_vswap_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vswap_128B")]
)

	]
	[(hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0)); hexagon_V6_vinsertwr_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vinsertwr_128B")]
)

	]
	[(hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)); hexagon_V6_vabsh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)); hexagon_V6_vabsw_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)); hexagon_V6_vabsb_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vabsh_128B")]
)

	]
	[(hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); hexagon_V6_vunpackoh_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); hexagon_V6_vunpackob_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vunpackoh_128B")]
)

	]
	[(hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 0)); hexagon_V6_vabsw_sat_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 0)); hexagon_V6_vabsh_sat_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 0)); hexagon_V6_vabsb_sat_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vabsw_sat_128B")]
)

	]
	[(hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 4) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)); hexagon_V6_vandqrt_128B
 
  (list v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vandqrt_128B")]
)

	]
	[(hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vsubuhw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vsubhw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vsububh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vsubuhw_128B")]
)

	]
	[(hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqw_or_128B
 
  (list v0 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqb_or_128B
 
  (list v0 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqh_or_128B
 
  (list v0 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_veqw_or_128B")]
)

	]
	[(hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsubuhsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsubuwsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubwsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsubuhsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubhsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsububsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubbsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubwsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubhsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsububsat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsubububb_sat_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubb_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vsubbsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vsubuwsat_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubw_dv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); hexagon_V6_vsubh_dv_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vsubh_128B")]
)

	]
	[(hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 0) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)); hexagon_V6_vmpyiewuh_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)); hexagon_V6_vmpyiewh_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiewh_acc_128B")]
)

	]
	[(hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)); hexagon_V6_vasruhubrndsat_128B
 
  (list v3 v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)); hexagon_V6_vasrhbrndsat_128B
 
  (list v3 v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)); hexagon_V6_vasrhubrndsat_128B
 
  (list v3 v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vasruhubrndsat_128B")]
)

	]
	[(hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)); hexagon_V6_vmpyiowh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiowh_128B")]
)

	]
	[(hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vaslhv_128B
 
  (list v0 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vaslwv_128B
 
  (list v0 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vaslhv_128B")]
)

	]
	[(hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? num_10 0) (equal? prec_i 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtub_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? num_10 1) (equal? prec_i 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgth_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? num_10 1) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtw_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuw_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? num_10 1) (equal? prec_i 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtb_xor_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? num_10 0) (equal? prec_i 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuh_xor_128B
 
  (list v2 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vgtub_xor_128B")]
)

	]
	[(hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); hexagon_V6_vmpyih_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyih_128B")]
)

	]
	[(hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 2) (equal? num_17 16) (equal? num_18 0)); hexagon_V6_vmpyiwh_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 0) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)); hexagon_V6_vmpyiwub_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)); hexagon_V6_vmpyiwb_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)); hexagon_V6_vmpyihb_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyiwh_acc_128B")]
)

	]
	[(hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); hexagon_V6_vandvnqv_128B
 
  (list v0 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vandvnqv_128B")]
)

	]
	[(hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)); hexagon_V6_vlsrh_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)); hexagon_V6_vlsrb_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vlsrh_128B")]
)

	]
	[(hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 0) (equal? num_21 0) (equal? prec_i_o 16) (equal? num_23 -1) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 0) (equal? num_27 24) (equal? num_28 1032) (equal? num_29 1) (equal? num_30 0) (equal? num_31 16) (equal? num_32 8) (equal? num_33 1024) (equal? num_34 2) (equal? num_35 0)); hexagon_V6_vmpabus_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? prec_i_o 16) (equal? num_23 -1) (equal? num_24 -1) (equal? num_25 0) (equal? num_26 0) (equal? num_27 24) (equal? num_28 1032) (equal? num_29 0) (equal? num_30 0) (equal? num_31 16) (equal? num_32 8) (equal? num_33 1024) (equal? num_34 2) (equal? num_35 0)); hexagon_V6_vmpabuu_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpabus_acc_128B")]
)

	]
	[(hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)); hexagon_V6_vmux_128B
 
  (list v0 v1 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vmux_128B")]
)

	]
	[(hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vnavgw_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vnavgb_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vnavgh_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vnavgub_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vnavgw_128B")]
)

	]
	[(hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 0)); hexagon_V6_vaslh_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vaslh_128B")]
)

	]
	[(hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 1) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 4) (equal? num_12 0)); hexagon_V6_vandnqrt_acc_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vandnqrt_acc_128B")]
)

	]
	[(hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 2) (equal? num_10 64) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vdealb_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 2) (equal? num_10 32) (equal? num_11 16) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)); hexagon_V6_vdealh_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vdealb_128B")]
)

	]
	[(hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? prec_i_o 32) (equal? num_25 -1) (equal? num_26 -1) (equal? num_27 1) (equal? num_28 1) (equal? num_29 24) (equal? num_30 16) (equal? num_31 1040) (equal? num_32 1) (equal? num_33 1) (equal? num_34 16) (equal? num_35 16) (equal? num_36 16) (equal? num_37 1024) (equal? num_38 4) (equal? num_39 0)); hexagon_V6_vmpahb_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? prec_i_o 32) (equal? num_25 -1) (equal? num_26 -1) (equal? num_27 1) (equal? num_28 1) (equal? num_29 24) (equal? num_30 16) (equal? num_31 1040) (equal? num_32 1) (equal? num_33 1) (equal? num_34 16) (equal? num_35 16) (equal? num_36 16) (equal? num_37 1024) (equal? num_38 4) (equal? num_39 0)); hexagon_V6_vmpauhb_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpahb_acc_128B")]
)

	]
	[(hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vrounduhub_128B
 
  (list v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vroundhub_128B
 
  (list v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vroundhb_128B
 
  (list v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vrounduhub_128B")]
)

	]
	[(hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)); hexagon_V6_vlsrw_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vlsrw_128B")]
)

	]
	[(hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)); hexagon_V6_vmpyowh_128B
 
  (list v3 v4)]
		[(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)); hexagon_V6_vmpyowh_rnd_128B
 
  (list v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyowh_128B")]
)

	]
	[(hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 0) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)); hexagon_V6_vsathub_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vsatwh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 0) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)); hexagon_V6_vsatuwuh_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vsathub_128B")]
)

	]
	[(hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhvsat_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhvsat_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhvsat_acc_128B")]
)

	]
	[(hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_veqw_128B
 
  (list v1 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_veqh_128B
 
  (list v1 v3)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_veqb_128B
 
  (list v1 v3)]
		[else (error "Unable to get ops  for hexagon_V6_veqw_128B")]
)

	]
	[(hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)); hexagon_V6_vmpyub_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)); hexagon_V6_vmpybus_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyub_acc_128B")]
)

	]
	[(hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 0) (equal? num_11 256) (equal? num_12 8) (equal? num_13 0) (equal? num_14 256) (equal? prec_i_o 8) (equal? num_16 4) (equal? num_17 32) (equal? num_18 16) (equal? num_19 4) (equal? num_20 8) (equal? num_21 64) (equal? num_22 4) (equal? num_23 8) (equal? num_24 96) (equal? num_25 16) (equal? num_26 4) (equal? num_27 8) (equal? num_28 0)); hexagon_V6_vdealb4w_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vdealb4w_128B")]
)

	]
	[(hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vrmpybv_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vrmpybv_acc_128B
 
  (list vc_0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpybusv_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpybusv_acc_128B
 
  (list vc_0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpyubv_acc_128B
 
  (list vc_0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpyubv_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vrmpybv_128B")]
)

	]
	[(hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpybus_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpyub_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpybus_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)); hexagon_V6_vrmpyub_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vrmpybus_acc_128B")]
)

	]
	[(hexagon_V6_vdmpybus_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vdmpybus_128B
 
  (list v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vdmpybus_acc_128B
 
  (list vc_0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vdmpybus_128B")]
)

	]
	[(hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqh_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqb_and_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_veqw_and_128B
 
  (list v2 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_veqh_and_128B")]
)

	]
	[(hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)); hexagon_V6_vmpyuhe_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyuhe_128B")]
)

	]
	[(hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 32) (equal? num_13 16) (equal? num_14 2) (equal? num_15 16) (equal? num_16 0)); hexagon_V6_vpackoh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 64) (equal? num_13 8) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)); hexagon_V6_vpackob_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vpackoh_128B")]
)

	]
	[(hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)); hexagon_V6_vdmpyhisat_128B
 
  (list v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)); hexagon_V6_vdmpyhisat_acc_128B
 
  (list vc_0 v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)); hexagon_V6_vdmpyhsuisat_128B
 
  (list v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)); hexagon_V6_vdmpyhsuisat_acc_128B
 
  (list vc_0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhisat_128B")]
)

	]
	[(hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 4) (equal? num_11 0)); hexagon_V6_vandnqrt_128B
 
  (list v0 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vandnqrt_128B")]
)

	]
	[(hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 32) (equal? num_7 2) (equal? num_8 0)); hexagon_V6_vshuffh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0)); hexagon_V6_vshuffb_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vshuffh_128B")]
)

	]
	[(hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_12 4) (equal? num_13 1) (equal? num_14 0)); hexagon_V6_vandvrt_acc_128B
 
  (list v0 v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vandvrt_acc_128B")]
)

	]
	[(hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? prec_o 16) (equal? num_19 1024) (equal? num_20 -1) (equal? num_21 0) (equal? num_22 0) (equal? num_23 1032) (equal? num_24 0) (equal? num_25 0) (equal? num_26 8) (equal? num_27 2) (equal? num_28 0)); hexagon_V6_vmpabusv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? prec_o 16) (equal? num_19 1024) (equal? num_20 -1) (equal? num_21 0) (equal? num_22 0) (equal? num_23 1032) (equal? num_24 0) (equal? num_25 0) (equal? num_26 8) (equal? num_27 2) (equal? num_28 0)); hexagon_V6_vmpabuuv_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpabusv_128B")]
)

	]
	[(hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); hexagon_V6_vor_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 1) (equal? num_7 0)); hexagon_V6_pred_or_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vor_128B")]
)

	]
	[(hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)); hexagon_V6_vasruwuhsat_128B
 
  (list v1 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)); hexagon_V6_vasrwuhsat_128B
 
  (list v1 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 1) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0)); hexagon_V6_vasrwhsat_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vasruwuhsat_128B")]
)

	]
	[(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)); hexagon_V6_vmpyowh_rnd_sacc_128B
 
  (list v3 v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)); hexagon_V6_vmpyowh_sacc_128B
 
  (list v3 v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyowh_rnd_sacc_128B")]
)

	]
	[(hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vaddubh_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vadduhw_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vaddhw_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vaddubh_acc_128B")]
)

	]
	[(hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vroundwuh_128B
 
  (list v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vroundwh_128B
 
  (list v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)); hexagon_V6_vrounduwuh_128B
 
  (list v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vroundwuh_128B")]
)

	]
	[(hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vmpyihb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)); hexagon_V6_vmpyiwh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vmpyiwub_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)); hexagon_V6_vmpyiwb_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyihb_128B")]
)

	]
	[(hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)); hexagon_V6_pred_xor_128B
 
  (list v0 v1)]
		[(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)); hexagon_V6_vxor_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_pred_xor_128B")]
)

	]
	[(hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 4) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vandvrt_128B
 
  (list v2 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vandvrt_128B")]
)

	]
	[(hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)); hexagon_V6_vasrwh_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vasrwh_128B")]
)

	]
	[(hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)); hexagon_V6_vandvqv_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vandvqv_128B")]
)

	]
	[(hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavgwrnd_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavgubrnd_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavghrnd_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavguwrnd_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavguhrnd_128B
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)); hexagon_V6_vavgbrnd_128B
 
  (list v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vavgwrnd_128B")]
)

	]
	[(hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgth_or_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuh_or_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtb_or_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtub_or_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtuw_or_128B
 
  (list v2 v3 v4)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)); hexagon_V6_vgtw_or_128B
 
  (list v2 v3 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vgth_or_128B")]
)

	]
	[(hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0)); hexagon_V6_vmpyuhe_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyuhe_acc_128B")]
)

	]
	[(hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vmaxw_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vmaxh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vmaxuh_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)); hexagon_V6_vmaxub_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); hexagon_V6_vmaxb_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmaxw_128B")]
)

	]
	[(hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 4) (equal? num_11 1) (equal? num_12 8) (equal? num_13 0)); hexagon_V6_vandqrt_acc_128B
 
  (list v1 v2 v4)]
		[else (error "Unable to get ops  for hexagon_V6_vandqrt_acc_128B")]
)

	]
	[(hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 0) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)); hexagon_V6_vmpyub_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)); hexagon_V6_vmpybus_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyub_128B")]
)

	]
	[(hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)); hexagon_V6_pred_and_n_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_pred_and_n_128B")]
)

	]
	[(hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)); hexagon_V6_vasruwuhrndsat_128B
 
  (list v3 v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)); hexagon_V6_vasrwhrndsat_128B
 
  (list v3 v4 v5)]
		[(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)); hexagon_V6_vasrwuhrndsat_128B
 
  (list v3 v4 v5)]
		[else (error "Unable to get ops  for hexagon_V6_vasruwuhrndsat_128B")]
)

	]
	[(hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)); hexagon_V6_vaslw_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vaslw_128B")]
)

	]
	[(hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavguw_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavgh_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavguh_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavgb_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavgub_128B
 
  (list v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)); hexagon_V6_vavgw_128B
 
  (list v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vavguw_128B")]
)

	]
	[(hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)); hexagon_V6_vasrhubsat_128B
 
  (list v1 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 1) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)); hexagon_V6_vasrhbsat_128B
 
  (list v1 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 0)); hexagon_V6_vasruhubsat_128B
 
  (list v1 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vasrhubsat_128B")]
)

	]
	[(hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1024) (equal? num_7 0)); hexagon_V6_lo_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_lo_128B")]
)

	]
	[(hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)); hexagon_V6_vassign_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)); hexagon_V6_hi_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vassign_128B")]
)

	]
	[(hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vunpackh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vunpackb_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)); hexagon_V6_vunpackuh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)); hexagon_V6_vunpackub_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vunpackh_128B")]
)

	]
	[(hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 1024) (equal? num_11 0)); hexagon_V6_vcombine_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vcombine_128B")]
)

	]
	[(hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? prec_o 32) (equal? num_23 1024) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 1) (equal? num_27 24) (equal? num_28 16) (equal? num_29 1040) (equal? num_30 1) (equal? num_31 1) (equal? num_32 16) (equal? prec_i 16) (equal? num_34 16) (equal? num_35 4) (equal? num_36 0)); hexagon_V6_vmpauhb_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? prec_o 32) (equal? num_23 1024) (equal? num_24 -1) (equal? num_25 1) (equal? num_26 1) (equal? num_27 24) (equal? num_28 16) (equal? num_29 1040) (equal? num_30 1) (equal? num_31 1) (equal? num_32 16) (equal? prec_i 16) (equal? num_34 16) (equal? num_35 4) (equal? num_36 0)); hexagon_V6_vmpahb_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpauhb_128B")]
)

	]
	[(hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpybv_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpybusv_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpyhus_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpyubv_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpyuhv_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)); hexagon_V6_vmpyhv_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpybv_acc_128B")]
)

	]
	[(hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vlsrwv_128B
 
  (list v0 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vlsrhv_128B
 
  (list v0 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vlsrwv_128B")]
)

	]
	[(hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); hexagon_V6_vsubhnq_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); hexagon_V6_vsubwq_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)); hexagon_V6_vsubbnq_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); hexagon_V6_vsubhq_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)); hexagon_V6_vsubbq_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); hexagon_V6_vsubwnq_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vsubhnq_128B")]
)

	]
	[(hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)); hexagon_V6_vsb_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)); hexagon_V6_vzh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)); hexagon_V6_vsh_128B
 
  (list v0)]
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)); hexagon_V6_vzb_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vsb_128B")]
)

	]
	[(hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)); hexagon_V6_vaddbq_128B
 
  (list v0 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); hexagon_V6_vaddwq_128B
 
  (list v0 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); hexagon_V6_vaddhnq
 
  (list v0 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); hexagon_V6_vaddhq_128B
 
  (list v0 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)); hexagon_V6_vaddbnq_128B
 
  (list v0 v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); hexagon_V6_vaddwnq_128B
 
  (list v0 v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vaddbq_128B")]
)

	]
	[(hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpybv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpyhv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpybusv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpyubv_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpyhus_128B
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)); hexagon_V6_vmpyuhv_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_vmpybv_128B")]
)

	]
	[(hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vasrhv_128B
 
  (list v0 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)); hexagon_V6_vasrwv_128B
 
  (list v0 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vasrhv_128B")]
)

	]
	[(hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhsat_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhsat_128B
 
  (list v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhsusat_128B
 
  (list v1 v2)]
		[(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)); hexagon_V6_vdmpyhsusat_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vdmpyhsat_acc_128B")]
)

	]
	[(hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)); hexagon_V6_vmpyh_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 0) (equal? num_20 0) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)); hexagon_V6_vmpyuh_acc_128B
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)); hexagon_V6_vmpyhsat_acc_128B
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyh_acc_128B")]
)

	]
	[(hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)); hexagon_V6_vnot_128B
 
  (list v0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 1) (equal? num_6 0)); hexagon_V6_pred_not_128B
 
  (list v0)]
		[else (error "Unable to get ops  for hexagon_V6_vnot_128B")]
)

	]
	[(hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)); hexagon_V6_pred_or_n_128B
 
  (list v0 v1)]
		[else (error "Unable to get ops  for hexagon_V6_pred_or_n_128B")]
)

	]
	[(hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? prec_o 32) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 2) (equal? prec_i 32) (equal? num_24 0)); hexagon_V6_vmpyewuh_64_128B
 
  (list v2 v3)]
		[else (error "Unable to get ops  for hexagon_V6_vmpyewuh_64_128B")]
)

	]
 )
)
;; ================================================================================
