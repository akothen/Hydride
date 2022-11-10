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

(define cost_hexagon_V6_veqb_or_128B_dsl 1)
(define cost_hexagon_V6_vmpyieoh_128B_dsl 1)
(define cost_hexagon_V6_vavgub_128B_dsl 1)
(define cost_hexagon_V6_vabsw_128B_dsl 1)
(define cost_hexagon_V6_vmpabuu_128B_dsl 1)
(define cost_hexagon_V6_vmpyiwb_acc_128B_dsl 1)
(define cost_hexagon_V6_vaddwq_128B_dsl 1)
(define cost_hexagon_V6_vmpyiwb_128B_dsl 1)
(define cost_hexagon_V6_vpackwuh_sat_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_64_128B_dsl 1)
(define cost_hexagon_V6_vnot_128B_dsl 1)
(define cost_hexagon_V6_vandvrt_128B_dsl 1)
(define cost_hexagon_V6_vandvqv_128B_dsl 1)
(define cost_hexagon_V6_vmpyiowh_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_acc_128B_dsl 1)
(define cost_hexagon_V6_vunpackh_128B_dsl 1)
(define cost_hexagon_V6_vandnqrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vsubbnq_128B_dsl 1)
(define cost_hexagon_V6_vand_128B_dsl 1)
(define cost_hexagon_V6_vaddhw_128B_dsl 1)
(define cost_hexagon_V6_vaslh_128B_dsl 1)
(define cost_hexagon_V6_vshufeh_128B_dsl 1)
(define cost_hexagon_V6_vaddububb_sat_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_128B_dsl 1)
(define cost_hexagon_V6_vmaxuh_128B_dsl 1)
(define cost_hexagon_V6_vasrhubrndsat_128B_dsl 1)
(define cost_hexagon_V6_vaslw_acc_128B_dsl 1)
(define cost_hexagon_V6_vaslw_128B_dsl 1)
(define cost_hexagon_V6_vmaxw_128B_dsl 1)
(define cost_hexagon_V6_vgtw_xor_128B_dsl 1)
(define cost_hexagon_V6_vroundhub_128B_dsl 1)
(define cost_hexagon_V6_lvsplatb_128B_dsl 1)
(define cost_hexagon_V6_vasrhubsat_128B_dsl 1)
(define cost_hexagon_V6_vsubuhw_128B_dsl 1)
(define cost_hexagon_V6_vandvrt_acc_128B_dsl 1)
(define cost_hexagon_V6_veqw_128B_dsl 1)
(define cost_hexagon_V6_vsh_128B_dsl 1)
(define cost_hexagon_V6_vadduwsat_dv_128B_dsl 1)
(define cost_hexagon_V6_vmpabuu_acc_128B_dsl 1)
(define cost_hexagon_V6_vsubb_128B_dsl 1)
(define cost_hexagon_V6_vswap_128B_dsl 1)
(define cost_hexagon_V6_vmux_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_rnd_128B_dsl 1)
(define cost_hexagon_V6_vasrhbsat_128B_dsl 1)
(define cost_hexagon_V6_vmpabuuv_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhsuisat_acc_128B_dsl 1)
(define cost_hexagon_V6_veqb_and_128B_dsl 1)
(define cost_hexagon_V6_vinsertwr_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhvsat_128B_dsl 1)
(define cost_hexagon_V6_vasruwuhsat_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_128B_dsl 1)
(define cost_hexagon_V6_vlsrb_128B_dsl 1)
(define cost_hexagon_V6_pred_xor_128B_dsl 1)
(define cost_hexagon_V6_vrmpybusv_128B_dsl 1)
(define cost_hexagon_V6_vabsdiffub_128B_dsl 1)
(define cost_hexagon_V6_vmpyh_128B_dsl 1)
(define cost_hexagon_V6_vgtuh_or_128B_dsl 1)
(define cost_hexagon_V6_vmpybusv_acc_128B_dsl 1)
(define cost_hexagon_V6_vsubh_dv_128B_dsl 1)
(define cost_hexagon_V6_vmpahb_128B_dsl 1)
(define cost_hexagon_V6_vmpyubv_128B_dsl 1)
(define cost_hexagon_V6_lo_128B_dsl 1)
(define cost_hexagon_V6_vunpackob_128B_dsl 1)
(define cost_hexagon_V6_vavguhrnd_128B_dsl 1)
(define cost_hexagon_V6_vaddcarrysat_128B_dsl 1)
(define cost_hexagon_V6_vasruhubsat_128B_dsl 1)
(define cost_hexagon_V6_veqb_xor_128B_dsl 1)
(define cost_hexagon_V6_vasrwhsat_128B_dsl 1)
(define cost_hexagon_V6_vgtub_and_128B_dsl 1)
(define cost_hexagon_V6_vshuffob_128B_dsl 1)
(define cost_hexagon_V6_vdealb4w_128B_dsl 1)
(define cost_hexagon_V6_vaddhw_acc_128B_dsl 1)
(define cost_hexagon_V6_vasrwh_128B_dsl 1)
(define cost_hexagon_V6_vrmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpahb_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyiewuh_128B_dsl 1)
(define cost_hexagon_V6_vgth_128B_dsl 1)
(define cost_hexagon_V6_pred_or_n_128B_dsl 1)
(define cost_hexagon_V6_vminub_128B_dsl 1)
(define cost_hexagon_V6_vshufoeh_128B_dsl 1)
(define cost_hexagon_V6_vsathub_128B_dsl 1)
(define cost_hexagon_V6_vgth_or_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl 1)
(define cost_hexagon_V6_vandvnqv_128B_dsl 1)
(define cost_hexagon_V6_hi_128B_dsl 1)
(define cost_hexagon_V6_vgth_and_128B_dsl 1)
(define cost_hexagon_V6_vpackhb_sat_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_128B_dsl 1)
(define cost_hexagon_V6_vlsrh_128B_dsl 1)
(define cost_hexagon_V6_vmpyub_128B_dsl 1)
(define cost_hexagon_V6_vminw_128B_dsl 1)
(define cost_hexagon_V6_vcombine_128B_dsl 1)
(define cost_hexagon_V6_lvsplatw_128B_dsl 1)
(define cost_hexagon_V6_vlsrw_128B_dsl 1)
(define cost_hexagon_V6_vmpyhsat_acc_128B_dsl 1)
(define cost_hexagon_V6_vasrwuhsat_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vroundwh_128B_dsl 1)
(define cost_hexagon_V6_vgtuw_xor_128B_dsl 1)
(define cost_hexagon_V6_vasrh_acc_128B_dsl 1)
(define cost_hexagon_V6_vasrw_acc_128B_dsl 1)
(define cost_hexagon_V6_vdmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vnavgw_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_128B_dsl 1)
(define cost_hexagon_V6_vgtub_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhsusat_acc_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhb_128B_dsl 1)
(define cost_hexagon_V6_vandnqrt_128B_dsl 1)
(define cost_hexagon_V6_vasrwuhrndsat_128B_dsl 1)
(define cost_hexagon_V6_vor_128B_dsl 1)
(define cost_hexagon_V6_vdealb_128B_dsl 1)
(define cost_hexagon_V6_vmpyiewuh_acc_128B_dsl 1)
(define cost_hexagon_V6_vshuffh_128B_dsl 1)
(define cost_hexagon_V6_vpackeh_128B_dsl 1)
(define cost_hexagon_V6_vmpybus_acc_128B_dsl 1)
(define cost_hexagon_V6_vaslh_acc_128B_dsl 1)
(define cost_hexagon_V6_pred_and_n_128B_dsl 1)
(define cost_hexagon_V6_vabsdiffw_128B_dsl 1)
(define cost_hexagon_V6_vabsb_sat_128B_dsl 1)
(define cost_hexagon_V6_vpackoh_128B_dsl 1)
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
	[ (hexagon_V6_veqb_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_veqb_or_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyieoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vavgub_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vavgub_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vabsw_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_vabsw_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vmpabuu_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vmpabuu_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
		(+ cost_hexagon_V6_vmpyiwb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vaddwq_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpyiwb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
		(+ cost_hexagon_V6_vmpyiwb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vpackwuh_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyewuh_64_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
		(+ cost_hexagon_V6_vnot_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vandvrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vandvqv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvqv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyiowh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyih_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vunpackh_128B_dsl v0 prec_i prec_o num_3)
		(+ cost_hexagon_V6_vunpackh_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandnqrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vsubbnq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vsubbnq_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vand_128B_dsl v0 v1 num_2 prec_i_o)
		(+ cost_hexagon_V6_vand_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vaddhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(+ cost_hexagon_V6_vaddhw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vaslh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vaslh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vshufeh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vaddububb_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyewuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vmaxuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrhubrndsat_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6)
		(+ cost_hexagon_V6_vasrhubrndsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaslw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vaslw_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vaslw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vmaxw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vgtw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgtw_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vroundhub_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vroundhub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_lvsplatb_128B_dsl v0 prec_o)
		(+ cost_hexagon_V6_lvsplatb_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrhubsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vsubuhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(+ cost_hexagon_V6_vsubuhw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandvrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_veqw_128B_dsl v0 vc_1 vc_2 v3 prec_o prec_i)
		(+ cost_hexagon_V6_veqw_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3) )
	]
	[ (hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
		(+ cost_hexagon_V6_vsh_128B_dsl (hvx:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vadduwsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vadduwsat_dv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vmpabuu_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vsubb_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vsubb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vswap_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmux_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyowh_rnd_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrhbsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrhbsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpabuuv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpabuuv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vdmpyhsuisat_acc_128B_dsl v0 v1 v2 num_3)
		(+ cost_hexagon_V6_vdmpyhsuisat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_veqb_and_128B_dsl vc_0 v1 vc_2 v3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_veqb_and_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vinsertwr_128B_dsl v0)
		(+ cost_hexagon_V6_vinsertwr_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2)
		(+ cost_hexagon_V6_vdmpyhvsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasruwuhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandqrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandqrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vlsrb_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
		(+ cost_hexagon_V6_pred_xor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vrmpybusv_128B_dsl vc_0 v1 v2 num_3 num_4 num_5)
		(+ cost_hexagon_V6_vrmpybusv_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vabsdiffub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyh_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vmpyh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vgtuh_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgtuh_or_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ cost_hexagon_V6_vmpybusv_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vsubh_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vsubh_dv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpahb_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpahb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
		(+ cost_hexagon_V6_vmpyubv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_lo_128B_dsl v0)
		(+ cost_hexagon_V6_lo_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
		(+ cost_hexagon_V6_vunpackob_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o num_5)
		(+ cost_hexagon_V6_vavguhrnd_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  v3) )
	]
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaddcarrysat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vasruhubsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasruhubsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_veqb_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_veqb_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vasrwhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vgtub_and_128B_dsl v0 vc_1 vc_2 v3 v4 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_and_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
		(+ cost_hexagon_V6_vshuffob_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vdealb4w_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vaddhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
		(+ cost_hexagon_V6_vaddhw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vasrwh_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vrmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpahb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyiewuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vgth_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
		(+ cost_hexagon_V6_vgth_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 (hvx:cost  vc_3) )
	]
	[ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
		(+ cost_hexagon_V6_pred_or_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vminub_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vminub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vshufoeh_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(+ cost_hexagon_V6_vshufoeh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vsathub_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
		(+ cost_hexagon_V6_vsathub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vgth_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgth_or_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyuhe_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandvnqv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_hi_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_hi_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vgth_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgth_and_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  vc_3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vpackhb_sat_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vpackhb_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyih_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vlsrh_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyub_128B_dsl v0 v1 num_2)
		(+ cost_hexagon_V6_vmpyub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vminw_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vminw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vcombine_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vcombine_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_lvsplatw_128B_dsl v0)
		(+ cost_hexagon_V6_lvsplatw_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vlsrw_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vlsrw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
		(+ cost_hexagon_V6_vmpyhsat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vasrwuhsat_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrwuhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vandqrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vroundwh_128B_dsl v0 v1 num_2 num_3)
		(+ cost_hexagon_V6_vroundwh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vgtuw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(+ cost_hexagon_V6_vgtuw_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
		 (hvx:cost  v3)  (hvx:cost  v4)  
		)
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vasrw_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vasrw_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vdmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(+ cost_hexagon_V6_vnavgw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vmpyuhe_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vgtub_128B_dsl vc_0 v1 vc_2 v3 prec_o prec_i)
		(+ cost_hexagon_V6_vgtub_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
		 (hvx:cost  v3) )
	]
	[ (hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2 num_3)
		(+ cost_hexagon_V6_vdmpyhsusat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vdmpyhb_128B_dsl vc_0 v1 v2)
		(+ cost_hexagon_V6_vdmpyhb_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
		(+ cost_hexagon_V6_vandnqrt_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vasrwuhrndsat_128B_dsl v0 v1 v2 num_3 num_4)
		(+ cost_hexagon_V6_vasrwuhrndsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vor_128B_dsl v0 v1 num_2 prec_i_o)
		(+ cost_hexagon_V6_vor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(+ cost_hexagon_V6_vdealb_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vmpyiewuh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(+ cost_hexagon_V6_vshuffh_128B_dsl (hvx:cost  v0)  
		)
	]
	[ (hexagon_V6_vpackeh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
		(+ cost_hexagon_V6_vpackeh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
		(+ cost_hexagon_V6_vmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		)
	]
	[ (hexagon_V6_vaslh_acc_128B_dsl v0 v1 v2)
		(+ cost_hexagon_V6_vaslh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2) )
	]
	[ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
		(+ cost_hexagon_V6_pred_and_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vabsdiffw_128B_dsl v0 v1 prec_i_o)
		(+ cost_hexagon_V6_vabsdiffw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1) )
	]
	[ (hexagon_V6_vabsb_sat_128B_dsl v0 prec_i_o)
		(+ cost_hexagon_V6_vabsb_sat_128B_dsl (hvx:cost  v0) )
	]
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
		(+ cost_hexagon_V6_vpackoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  
		 
		)
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
