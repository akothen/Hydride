#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)

(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/llvm_impl)


(require hydride/ir/hydride/definition)


(require hydride/ir/hvx/semantics)
(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/length)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (hvx:interpret prog env)
 (destruct prog
	[(reg id) (vector-ref-bv env id)]
	[(lit v) v]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
		(vector-two-input-swizzle (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o num_4 lane_size 
		 num_6 num_7 num_8)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(interleave-vectors (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
		 prec_i_o)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(interleave-vector (hvx:interpret v0 env) size_i_o prec_i_o)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(deinterleave-vector (hvx:interpret v0 env) size_i_o prec_i_o)
	]
	[ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(llvm:shuffle-vectors (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o (hvx:interpret v4 env) num_5)
	]
	[ (hexagon_V6_veqb_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(hexagon_V6_veqb_or_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 (hvx:interpret vc_3 env) (hvx:interpret v4 env) prec_o 
		 prec_i)
	]
	[ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
		(hexagon_V6_vmpyieoh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vavgub_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(hexagon_V6_vavgub_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 prec_i_o num_4)
	]
	[ (hexagon_V6_vabsw_128B_dsl v0 prec_i_o)
		(hexagon_V6_vabsw_128B (hvx:interpret v0 env) prec_i_o)
	]
	[ (hexagon_V6_vmpabuu_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vmpabuu_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
		(hexagon_V6_vmpyiwb_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4 prec_i_o 
		 num_6 num_7 num_8 
		 num_9 num_10)
	]
	[ (hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(hexagon_V6_vaddwq_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 prec_i_o num_4)
	]
	[ (hexagon_V6_vmpyiwb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
		(hexagon_V6_vmpyiwb_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3 prec_i_o num_5 
		 num_6 num_7 num_8)
	]
	[ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vpackwuh_sat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl v0 v1)
		(hexagon_V6_vmpyewuh_64_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
		(hexagon_V6_vnot_128B (hvx:interpret v0 env) num_1 prec_i_o)
	]
	[ (hexagon_V6_vandvrt_128B_dsl v0 v1)
		(hexagon_V6_vandvrt_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vandvqv_128B_dsl v0 v1)
		(hexagon_V6_vandvqv_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
		(hexagon_V6_vmpyiowh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vmpyih_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vunpackh_128B_dsl v0 prec_i prec_o num_3)
		(hexagon_V6_vunpackh_128B (hvx:interpret v0 env) prec_i prec_o 
		 num_3)
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vandnqrt_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vsubbnq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(hexagon_V6_vsubbnq_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 prec_i_o num_4)
	]
	[ (hexagon_V6_vand_128B_dsl v0 v1 num_2 prec_i_o)
		(hexagon_V6_vand_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (hexagon_V6_vaddhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(hexagon_V6_vaddhw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i prec_o 
		 num_6 num_7)
	]
	[ (hexagon_V6_vaslh_128B_dsl v0 v1)
		(hexagon_V6_vaslh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
		(hexagon_V6_vshufeh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o 
		 num_3)
	]
	[ (hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
		(hexagon_V6_vaddububb_sat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o 
		 num_3)
	]
	[ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
		(hexagon_V6_vmpyewuh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vmaxuh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vasrhubrndsat_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6)
		(hexagon_V6_vasrhubrndsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4 num_5 
		 num_6)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vaslw_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vaslw_128B_dsl v0 v1)
		(hexagon_V6_vaslw_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vmaxw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vgtw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(hexagon_V6_vgtw_xor_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_i_o 
		 num_6)
	]
	[ (hexagon_V6_vroundhub_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vroundhub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_lvsplatb_128B_dsl v0 prec_o)
		(hexagon_V6_lvsplatb_128B (hvx:interpret v0 env) prec_o)
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrhubsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vsubuhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(hexagon_V6_vsubuhw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i prec_o 
		 num_6 num_7)
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vandvrt_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_veqw_128B_dsl v0 vc_1 vc_2 v3 prec_o prec_i)
		(hexagon_V6_veqw_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) prec_o prec_i)
	]
	[ (hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
		(hexagon_V6_vsh_128B (hvx:interpret v0 env) lane_size num_2 
		 prec_i prec_o num_5 
		 num_6)
	]
	[ (hexagon_V6_vadduwsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(hexagon_V6_vadduwsat_dv_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(hexagon_V6_vmpabuu_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4)
	]
	[ (hexagon_V6_vsubb_128B_dsl v0 v1 prec_i_o num_3)
		(hexagon_V6_vsubb_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o 
		 num_3)
	]
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
		(hexagon_V6_vswap_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
		(hexagon_V6_vmux_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
		(hexagon_V6_vmpyowh_rnd_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vasrhbsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrhbsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vmpabuuv_128B_dsl v0 v1)
		(hexagon_V6_vmpabuuv_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vdmpyhsuisat_acc_128B_dsl v0 v1 v2 num_3)
		(hexagon_V6_vdmpyhsuisat_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3)
	]
	[ (hexagon_V6_veqb_and_128B_dsl vc_0 v1 vc_2 v3 v4 prec_o prec_i)
		(hexagon_V6_veqb_and_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_o 
		 prec_i)
	]
	[ (hexagon_V6_vinsertwr_128B_dsl v0)
		(hexagon_V6_vinsertwr_128B (hvx:interpret v0 env))
	]
	[ (hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2)
		(hexagon_V6_vdmpyhvsat_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasruwuhsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vandqrt_128B_dsl v0 v1)
		(hexagon_V6_vandqrt_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vlsrb_128B_dsl v0 v1)
		(hexagon_V6_vlsrb_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
		(hexagon_V6_pred_xor_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_o)
	]
	[ (hexagon_V6_vrmpybusv_128B_dsl vc_0 v1 v2 num_3 num_4 num_5)
		(hexagon_V6_vrmpybusv_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4 num_5)
	]
	[ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vabsdiffub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vmpyh_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vmpyh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_vgtuh_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(hexagon_V6_vgtuh_or_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_i_o 
		 num_6)
	]
	[ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
		(hexagon_V6_vmpybusv_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 lane_size num_4 num_5 
		 prec_i_o num_7 num_8 
		 num_9)
	]
	[ (hexagon_V6_vsubh_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(hexagon_V6_vsubh_dv_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (hexagon_V6_vmpahb_128B_dsl v0 v1)
		(hexagon_V6_vmpahb_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
		(hexagon_V6_vmpyubv_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i prec_o 
		 num_6 num_7 num_8)
	]
	[ (hexagon_V6_lo_128B_dsl v0)
		(hexagon_V6_lo_128B (hvx:interpret v0 env))
	]
	[ (hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
		(hexagon_V6_vunpackob_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 prec_i_o)
	]
	[ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o num_5)
		(hexagon_V6_vavguhrnd_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
		 (hvx:interpret v3 env) prec_i_o num_5)
	]
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
		(hexagon_V6_vaddcarrysat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vasruhubsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasruhubsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_veqb_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
		(hexagon_V6_veqb_xor_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 (hvx:interpret vc_3 env) (hvx:interpret v4 env) prec_o 
		 prec_i)
	]
	[ (hexagon_V6_vasrwhsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrwhsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vgtub_and_128B_dsl v0 vc_1 vc_2 v3 v4 prec_o prec_i)
		(hexagon_V6_vgtub_and_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_o 
		 prec_i)
	]
	[ (hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
		(hexagon_V6_vshuffob_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o 
		 num_3)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
		(hexagon_V6_vdealb4w_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vaddhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
		(hexagon_V6_vaddhw_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 lane_size num_4 num_5 
		 prec_i_o num_7)
	]
	[ (hexagon_V6_vasrwh_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrwh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(hexagon_V6_vrmpybus_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4)
	]
	[ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vmpahb_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
		(hexagon_V6_vmpyiewuh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vgth_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
		(hexagon_V6_vgth_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 (hvx:interpret vc_3 env) prec_o prec_i)
	]
	[ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
		(hexagon_V6_pred_or_n_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vminub_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vminub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vshufoeh_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(hexagon_V6_vshufoeh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) lane_size 
		 num_3 prec_i_o num_5 
		 num_6)
	]
	[ (hexagon_V6_vsathub_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
		(hexagon_V6_vsathub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_o 
		 num_3 num_4 prec_i 
		 num_6)
	]
	[ (hexagon_V6_vgth_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(hexagon_V6_vgth_or_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_i_o 
		 num_6)
	]
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vmpyuhe_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl v0 v1 v2)
		(hexagon_V6_vmpyowh_rnd_sacc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
		(hexagon_V6_vandvnqv_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_hi_128B_dsl v0 prec_i_o)
		(hexagon_V6_hi_128B (hvx:interpret v0 env) prec_i_o)
	]
	[ (hexagon_V6_vgth_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(hexagon_V6_vgth_and_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret vc_3 env) (hvx:interpret v4 env) prec_i_o 
		 num_6)
	]
	[ (hexagon_V6_vpackhb_sat_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vpackhb_sat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1)
		(hexagon_V6_vmpyih_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vlsrh_128B_dsl v0 v1)
		(hexagon_V6_vlsrh_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmpyub_128B_dsl v0 v1 num_2)
		(hexagon_V6_vmpyub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2)
	]
	[ (hexagon_V6_vminw_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vminw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vcombine_128B_dsl v0 v1)
		(hexagon_V6_vcombine_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_lvsplatw_128B_dsl v0)
		(hexagon_V6_lvsplatw_128B (hvx:interpret v0 env))
	]
	[ (hexagon_V6_vlsrw_128B_dsl v0 v1)
		(hexagon_V6_vlsrw_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
		(hexagon_V6_vmpyhsat_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4 num_5)
	]
	[ (hexagon_V6_vasrwuhsat_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrwuhsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vandqrt_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vroundwh_128B_dsl v0 v1 num_2 num_3)
		(hexagon_V6_vroundwh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (hexagon_V6_vgtuw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
		(hexagon_V6_vgtuw_xor_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
		 (hvx:interpret v3 env) (hvx:interpret v4 env) prec_i_o 
		 num_6)
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vasrw_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vasrw_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vdmpybus_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(hexagon_V6_vnavgw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 prec_i_o num_4)
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
		(hexagon_V6_vmpyuhe_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vgtub_128B_dsl vc_0 v1 vc_2 v3 prec_o prec_i)
		(hexagon_V6_vgtub_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
		 (hvx:interpret v3 env) prec_o prec_i)
	]
	[ (hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2 num_3)
		(hexagon_V6_vdmpyhsusat_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3)
	]
	[ (hexagon_V6_vdmpyhb_128B_dsl vc_0 v1 v2)
		(hexagon_V6_vdmpyhb_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
		(hexagon_V6_vandnqrt_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vasrwuhrndsat_128B_dsl v0 v1 v2 num_3 num_4)
		(hexagon_V6_vasrwuhrndsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3 num_4)
	]
	[ (hexagon_V6_vor_128B_dsl v0 v1 num_2 prec_i_o)
		(hexagon_V6_vor_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(hexagon_V6_vdealb_128B (hvx:interpret v0 env) lane_size num_2 
		 prec_i_o num_4 num_5)
	]
	[ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vmpyiewuh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(hexagon_V6_vshuffh_128B (hvx:interpret v0 env) lane_size num_2 
		 prec_i_o num_4 num_5)
	]
	[ (hexagon_V6_vpackeh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
		(hexagon_V6_vpackeh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6)
	]
	[ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
		(hexagon_V6_vmpybus_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 num_3)
	]
	[ (hexagon_V6_vaslh_acc_128B_dsl v0 v1 v2)
		(hexagon_V6_vaslh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env))
	]
	[ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
		(hexagon_V6_pred_and_n_128B (hvx:interpret v0 env) (hvx:interpret v1 env))
	]
	[ (hexagon_V6_vabsdiffw_128B_dsl v0 v1 prec_i_o)
		(hexagon_V6_vabsdiffw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) prec_i_o)
	]
	[ (hexagon_V6_vabsb_sat_128B_dsl v0 prec_i_o)
		(hexagon_V6_vabsb_sat_128B (hvx:interpret v0 env) prec_i_o)
	]
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
		(hexagon_V6_vpackoh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o num_4 num_5 
		 num_6 num_7)
	]
	[ (vector-ashr_dsl v0 v1 num_2 num_3)
		(vector-ashr (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (vector-lshr_dsl v0 v1 num_2 num_3)
		(vector-lshr (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[ (vector-shl_dsl v0 v1 num_2 num_3)
		(vector-shl (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 num_3)
	]
	[v (error "Unrecognized Term in Interpreterv")]
 )
)
;; ================================================================================
