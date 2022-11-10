#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))




;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================

(define cost_hexagon_V6_vandvrt_128B_dsl 1)
(define cost_hexagon_V6_vaslh_acc_128B_dsl 1)
(define cost_hexagon_V6_vrmpybv_128B_dsl 1)
(define cost_hexagon_V6_vminh_128B_dsl 1)
(define cost_hexagon_V6_pred_xor_128B_dsl 1)
(define cost_hexagon_V6_vmaxh_128B_dsl 1)
(define cost_hexagon_V6_vshufoeb_128B_dsl 1)
(define cost_hexagon_V6_vasrwuhrndsat_128B_dsl 1)
(define cost_hexagon_V6_vmpybusv_acc_128B_dsl 1)
(define cost_hexagon_V6_vaslw_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_128B_dsl 1)
(define cost_hexagon_V6_vandnqrt_128B_dsl 1)
(define cost_hexagon_V6_vgtw_128B_dsl 1)
(define cost_hexagon_V6_vsubwq_128B_dsl 1)
(define cost_hexagon_V6_vasruhubsat_128B_dsl 1)
(define cost_hexagon_V6_vgtb_and_128B_dsl 1)
(define cost_hexagon_V6_lvsplatw_128B_dsl 1)
(define cost_hexagon_V6_pred_and_n_128B_dsl 1)
(define cost_hexagon_V6_vasrhubsat_128B_dsl 1)
(define cost_hexagon_V6_vunpackub_128B_dsl 1)
(define cost_hexagon_V6_vmpyieoh_128B_dsl 1)
(define cost_hexagon_V6_lo_128B_dsl 1)
(define cost_hexagon_V6_vrmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vrounduhub_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_sacc_128B_dsl 1)
(define cost_hexagon_V6_vnot_128B_dsl 1)
(define cost_hexagon_V6_vcombine_128B_dsl 1)
(define cost_hexagon_V6_vasrh_acc_128B_dsl 1)
(define cost_hexagon_V6_vasrw_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_64_128B_dsl 1)
(define cost_hexagon_V6_veqh_xor_128B_dsl 1)
(define cost_hexagon_V6_vaddububb_sat_128B_dsl 1)
(define cost_hexagon_V6_vrounduwuh_128B_dsl 1)
(define cost_hexagon_V6_vmpabus_128B_dsl 1)
(define cost_hexagon_V6_vadduhw_128B_dsl 1)
(define cost_hexagon_V6_vavguh_128B_dsl 1)
(define cost_hexagon_V6_vmpyubv_128B_dsl 1)
(define cost_hexagon_V6_vaddcarrysat_128B_dsl 1)
(define cost_hexagon_V6_pred_or_128B_dsl 1)
(define cost_hexagon_V6_vasrwhsat_128B_dsl 1)
(define cost_hexagon_V6_vassign_128B_dsl 1)
(define cost_hexagon_V6_vadduhw_acc_128B_dsl 1)
(define cost_hexagon_V6_vasruwuhsat_128B_dsl 1)
(define cost_hexagon_V6_vandvrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vshuffeb_128B_dsl 1)
(define cost_hexagon_V6_vmpyiewuh_128B_dsl 1)
(define cost_hexagon_V6_vasrwh_128B_dsl 1)
(define cost_hexagon_V6_vminuh_128B_dsl 1)
(define cost_hexagon_V6_vpackhub_sat_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhisat_128B_dsl 1)
(define cost_hexagon_V6_vsatwh_128B_dsl 1)
(define cost_hexagon_V6_vnavgub_128B_dsl 1)
(define cost_hexagon_V6_vabsh_sat_128B_dsl 1)
(define cost_hexagon_V6_vmpybus_128B_dsl 1)
(define cost_hexagon_V6_vpackwh_sat_128B_dsl 1)
(define cost_hexagon_V6_pred_or_n_128B_dsl 1)
(define cost_hexagon_V6_vmpyhsat_acc_128B_dsl 1)
(define cost_hexagon_V6_vdealb_128B_dsl 1)
(define cost_hexagon_V6_vlsrb_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_128B_dsl 1)
(define cost_hexagon_V6_vmaxuh_128B_dsl 1)
(define cost_hexagon_V6_vlsrw_128B_dsl 1)
(define cost_hexagon_V6_veqw_and_128B_dsl 1)
(define cost_hexagon_V6_vmpyiewuh_acc_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhb_128B_dsl 1)
(define cost_hexagon_V6_vaddw_dv_128B_dsl 1)
(define cost_hexagon_V6_vmpauhb_128B_dsl 1)
(define cost_hexagon_V6_vandvqv_128B_dsl 1)
(define cost_hexagon_V6_vpackeb_128B_dsl 1)
(define cost_hexagon_V6_vgtub_xor_128B_dsl 1)
(define cost_hexagon_V6_vaddwnq_128B_dsl 1)
(define cost_hexagon_V6_vgtw_or_128B_dsl 1)
(define cost_hexagon_V6_vdmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_acc_128B_dsl 1)
(define cost_hexagon_V6_vgtw_xor_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_acc_128B_dsl 1)
(define cost_hexagon_V6_pred_and_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_rnd_128B_dsl 1)
(define cost_hexagon_V6_vmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vgtub_128B_dsl 1)
(define cost_hexagon_V6_vabsdiffh_128B_dsl 1)
(define cost_hexagon_V6_vabsdiffub_128B_dsl 1)
(define cost_hexagon_V6_vmpabuu_acc_128B_dsl 1)
(define cost_hexagon_V6_vsubb_dv_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_128B_dsl 1)
(define cost_hexagon_V6_vsubhw_128B_dsl 1)
(define cost_hexagon_V6_vmux_128B_dsl 1)
(define cost_hexagon_V6_vasrhbsat_128B_dsl 1)
(define cost_hexagon_V6_vmpyiowh_128B_dsl 1)
(define cost_hexagon_V6_vmpyiwb_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyuh_128B_dsl 1)
(define cost_hexagon_V6_vabsh_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_acc_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhsat_128B_dsl 1)
(define cost_hexagon_V6_vmpyiwh_128B_dsl 1)
(define cost_hexagon_V6_vgtub_and_128B_dsl 1)
(define cost_hexagon_V6_vdealb4w_128B_dsl 1)
(define cost_hexagon_V6_vgtub_or_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl 1)
(define cost_hexagon_V6_vandvnqv_128B_dsl 1)
(define cost_hexagon_V6_vunpackoh_128B_dsl 1)
(define cost_hexagon_V6_vaslh_128B_dsl 1)
(define cost_hexagon_V6_vshuffh_128B_dsl 1)
(define cost_hexagon_V6_vavguhrnd_128B_dsl 1)
(define cost_hexagon_V6_vinsertwr_128B_dsl 1)
(define cost_hexagon_V6_veqw_or_128B_dsl 1)
(define cost_hexagon_V6_vasrwuhsat_128B_dsl 1)
(define cost_hexagon_V6_vsubuwsat_128B_dsl 1)
(define cost_hexagon_V6_vmpyihb_acc_128B_dsl 1)
(define cost_hexagon_V6_vshufoh_128B_dsl 1)
(define cost_hexagon_V6_vasrhubrndsat_128B_dsl 1)
(define cost_hexagon_V6_vsh_128B_dsl 1)
(define cost_hexagon_V6_vmpabusv_128B_dsl 1)
(define cost_hexagon_V6_veqb_128B_dsl 1)
(define cost_hexagon_V6_vpackoh_128B_dsl 1)
(define cost_hexagon_V6_vaslw_acc_128B_dsl 1)
(define cost_hexagon_V6_vlsrh_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_128B_dsl 1)
(define cost_hexagon_V6_vmpauhb_acc_128B_dsl 1)
(define cost_hexagon_V6_vswap_128B_dsl 1)
(define cost_hexagon_V6_lvsplath_128B_dsl 1)
(define cost_hexagon_V6_vandnqrt_acc_128B_dsl 1)
(define cost_vector-ashr_dsl 1)
(define cost_vector-lshr_dsl 1)
(define cost_vector-shl_dsl 1)

(define (hvx:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
		(+ 4 (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (hvx:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (hvx:cost  v0) )
	]
		[ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (hvx:cost  v0)  (hvx:cost  v1)  
		 (hvx:cost  v4) )
	]
	[ (hexagon_V6_vandvrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vaslh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaslh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 num_3 num_4 num_5)
		(+ cost_hexagon_V6_vrmpybv_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vminh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vminh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
		(+ cost_hexagon_V6_pred_xor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmaxh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vmaxh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vshufoeb_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vshufoeb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vasrwuhrndsat_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vasrwuhrndsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_hexagon_V6_vmpybusv_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vaslw_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vaslw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyewuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandnqrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vgtw_128B_dsl v0 vc_1 v2 vc_3 prec_o prec_i)
		(+ cost_hexagon_V6_vgtw_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3) )
	]
	[ (hexagon_V6_vsubwq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vsubwq_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vasruhubsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasruhubsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vgtb_and_128B_dsl v0 vc_1 v2 vc_3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_vgtb_and_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_lvsplatw_128B_dsl v0)
		(+ cost_hexagon_V6_lvsplatw_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
		(+ cost_hexagon_V6_pred_and_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrhubsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vunpackub_128B_dsl v0 prec_i prec_o num_3)
		(+ cost_hexagon_V6_vunpackub_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyieoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_lo_128B_dsl v0)
		(+ cost_hexagon_V6_lo_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vrmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vrounduhub_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vrounduhub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyowh_sacc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyowh_sacc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
		(+ cost_hexagon_V6_vnot_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vcombine_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vcombine_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vasrw_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyewuh_64_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_veqh_xor_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_veqh_xor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vaddububb_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vrounduwuh_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vrounduwuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpabus_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vmpabus_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vadduhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(+ cost_hexagon_V6_vadduhw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vavguh_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vavguh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
		(+ cost_hexagon_V6_vmpyubv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaddcarrysat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_pred_or_128B_dsl v0 v1 num_2 prec_o)
		(+ cost_hexagon_V6_pred_or_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vasrwhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vassign_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_vassign_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vadduhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
		(+ cost_hexagon_V6_vadduhw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasruwuhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandvrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vshuffeb_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vshuffeb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyiewuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrwh_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vminuh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vminuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vpackhub_sat_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vpackhub_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 num_3)
		(+ cost_hexagon_V6_vdmpyhisat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vsatwh_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
		(+ cost_hexagon_V6_vsatwh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vnavgub_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vnavgub_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vabsh_sat_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_vabsh_sat_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vmpybus_128B_dsl v0 v1 num_2)
		(+ cost_hexagon_V6_vmpybus_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vpackwh_sat_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vpackwh_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
		(+ cost_hexagon_V6_pred_or_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
		(+ cost_hexagon_V6_vmpyhsat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(+ cost_hexagon_V6_vdealb_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vlsrb_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vandqrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandqrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vmaxuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vlsrw_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_veqw_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_veqw_and_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyiewuh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vdmpyhb_128B_dsl vc_0 v1 v2)
		(+ cost_hexagon_V6_vdmpyhb_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vaddw_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vaddw_dv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpauhb_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpauhb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vandvqv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvqv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vpackeb_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
		(+ cost_hexagon_V6_vpackeb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vgtub_xor_128B_dsl v0 vc_1 vc_2 v3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_xor_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vaddwnq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vaddwnq_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vgtw_or_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgtw_or_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vdmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyih_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vgtw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgtw_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandqrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_pred_and_128B_dsl v0 v1 num_2 prec_o)
		(+ cost_hexagon_V6_pred_and_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyowh_rnd_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
		(+ cost_hexagon_V6_vmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vgtub_128B_dsl vc_0 v1 vc_2 v3 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3) )
	]
	[ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vabsdiffh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vabsdiffub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vmpabuu_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vsubb_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vsubb_dv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyih_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vsubhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(+ cost_hexagon_V6_vsubhw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmux_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vasrhbsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrhbsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyiowh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6 num_7)
		(+ cost_hexagon_V6_vmpyiwb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vmpyuh_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vmpyuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vabsh_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_vabsh_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyuhe_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vdmpyhsat_128B_dsl vc_0 v1 v2 num_3)
		(+ cost_hexagon_V6_vdmpyhsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpyiwh_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
		(+ cost_hexagon_V6_vmpyiwh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vgtub_and_128B_dsl vc_0 v1 vc_2 v3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_and_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vdealb4w_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vgtub_or_128B_dsl v0 vc_1 v2 vc_3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_or_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvnqv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
		(+ cost_hexagon_V6_vunpackoh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vaslh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vaslh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(+ cost_hexagon_V6_vshuffh_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o num_5)
		(+ cost_hexagon_V6_vavguhrnd_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  v3) )
	]
	[ (hexagon_V6_vinsertwr_128B_dsl v0)
		(+ cost_hexagon_V6_vinsertwr_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_veqw_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_veqw_or_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vasrwuhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwuhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vsubuwsat_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vsubuwsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyihb_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyihb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vshufoh_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vshufoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vasrhubrndsat_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6)
		(+ cost_hexagon_V6_vasrhubrndsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
		(+ cost_hexagon_V6_vsh_128B_dsl (hvx:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vmpabusv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpabusv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_veqb_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
		(+ cost_hexagon_V6_veqb_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3) )
	]
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
		(+ cost_hexagon_V6_vpackoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaslw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vlsrh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyuhe_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpauhb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vswap_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_lvsplath_128B_dsl v0 prec_o)
		(+ cost_hexagon_V6_lvsplath_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandnqrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (vector-ashr_dsl v0 v1 num_2 num_3)
		(+ cost_vector-ashr_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (vector-lshr_dsl v0 v1 num_2 num_3)
		(+ cost_vector-lshr_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (vector-shl_dsl v0 v1 num_2 num_3)
		(+ cost_vector-shl_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[v  (error "Unrecognized Term in cost model")]
 )
)
;; ================================================================================
