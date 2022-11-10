#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)




(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)

(require hydride/ir/hvx/interpreter)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Constant Fold Expression
;; ================================================================================
(define (hvx:const-fold prog )
 (destruct prog
	[(dim-x id) (dim-x id)]
	[(dim-y id) (dim-y id)]
	[(idx-i id) (idx-i id)]
	[(idx-j id) (idx-j id)]
	[(reg id) (reg id) ]
	[(lit v) (lit v)]
	[(nop v1) (hvx:const-fold v1)]
	[(idx-add i1 i2)(idx-add i1 i2) ]
	[(idx-mul i1 i2) (idx-mul i1 i2) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 lane_size num_6 num_7 num_8 ) (vector)))
]
		[else ( vector-two-input-swizzle_dsl v0-folded v1-folded num_2 prec_i_o num_4 lane_size num_6 num_7 num_8 )]
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vectors_dsl v0-folded v1-folded size_i_o prec_i_o )]
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( interleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( interleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o ) (vector)))
]
		[else ( deinterleave-vector_dsl v0-folded size_i_o prec_i_o )]
		)
	]
	[ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v4-folded))
(lit (hvx:interpret ( llvm:shuffle-vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 ) (vector)))
]
		[else ( llvm:shuffle-vectors_dsl v0-folded v1-folded num_2 prec_i_o v4-folded num_5 )]
		)
	]
	[ (hexagon_V6_vandvrt_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vandvrt_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vandvrt_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vaslh_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vaslh_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vaslh_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 num_3 num_4 num_5)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vrmpybv_128B_dsl vc_0-folded v1-folded v2-folded num_3 num_4 num_5 ) (vector)))
]
		[else ( hexagon_V6_vrmpybv_128B_dsl vc_0-folded v1-folded v2-folded num_3 num_4 num_5 )]
		)
	]
	[ (hexagon_V6_vminh_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vminh_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vminh_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_pred_xor_128B_dsl v0-folded v1-folded num_2 prec_o ) (vector)))
]
		[else ( hexagon_V6_pred_xor_128B_dsl v0-folded v1-folded num_2 prec_o )]
		)
	]
	[ (hexagon_V6_vmaxh_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmaxh_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vmaxh_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vshufoeb_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vshufoeb_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vshufoeb_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vasrwuhrndsat_128B_dsl v0 v1 v2 num_3 num_4)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrwuhrndsat_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 ) (vector)))
]
		[else ( hexagon_V6_vasrwuhrndsat_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 )]
		)
	]
	[ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpybusv_acc_128B_dsl v0-folded v1-folded v2-folded lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 ) (vector)))
]
		[else ( hexagon_V6_vmpybusv_acc_128B_dsl v0-folded v1-folded v2-folded lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 )]
		)
	]
	[ (hexagon_V6_vaslw_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vaslw_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vaslw_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyewuh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyewuh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vandnqrt_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vandnqrt_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vgtw_128B_dsl v0 vc_1 v2 vc_3 prec_o prec_i)
		(define v0-folded (hvx:const-fold v0))
		(define vc_1-folded (hvx:const-fold vc_1))
		(define v2-folded (hvx:const-fold v2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded))
(lit (hvx:interpret ( hexagon_V6_vgtw_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtw_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vsubwq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vsubwq_128B_dsl v0-folded v1-folded v2-folded prec_i_o num_4 ) (vector)))
]
		[else ( hexagon_V6_vsubwq_128B_dsl v0-folded v1-folded v2-folded prec_i_o num_4 )]
		)
	]
	[ (hexagon_V6_vasruhubsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasruhubsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasruhubsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vgtb_and_128B_dsl v0 vc_1 v2 vc_3 v4 prec_o prec_i)
		(define v0-folded (hvx:const-fold v0))
		(define vc_1-folded (hvx:const-fold vc_1))
		(define v2-folded (hvx:const-fold v2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtb_and_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtb_and_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_lvsplatw_128B_dsl v0)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_lvsplatw_128B_dsl v0-folded ) (vector)))
]
		[else ( hexagon_V6_lvsplatw_128B_dsl v0-folded )]
		)
	]
	[ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_pred_and_n_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_pred_and_n_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrhubsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrhubsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vunpackub_128B_dsl v0 prec_i prec_o num_3)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vunpackub_128B_dsl v0-folded prec_i prec_o num_3 ) (vector)))
]
		[else ( hexagon_V6_vunpackub_128B_dsl v0-folded prec_i prec_o num_3 )]
		)
	]
	[ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyieoh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyieoh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_lo_128B_dsl v0)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_lo_128B_dsl v0-folded ) (vector)))
]
		[else ( hexagon_V6_lo_128B_dsl v0-folded )]
		)
	]
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vrmpybus_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 ) (vector)))
]
		[else ( hexagon_V6_vrmpybus_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 )]
		)
	]
	[ (hexagon_V6_vrounduhub_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vrounduhub_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vrounduhub_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_vmpyowh_sacc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyowh_sacc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyowh_sacc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vnot_128B_dsl v0-folded num_1 prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vnot_128B_dsl v0-folded num_1 prec_i_o )]
		)
	]
	[ (hexagon_V6_vcombine_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vcombine_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vcombine_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrh_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrh_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vasrw_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrw_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrw_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyewuh_64_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyewuh_64_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_veqh_xor_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_veqh_xor_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 ) (vector)))
]
		[else ( hexagon_V6_veqh_xor_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 )]
		)
	]
	[ (hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vaddububb_sat_128B_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
]
		[else ( hexagon_V6_vaddububb_sat_128B_dsl v0-folded v1-folded prec_i_o num_3 )]
		)
	]
	[ (hexagon_V6_vrounduwuh_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vrounduwuh_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vrounduwuh_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_vmpabus_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpabus_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vmpabus_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_vadduhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vadduhw_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 ) (vector)))
]
		[else ( hexagon_V6_vadduhw_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 )]
		)
	]
	[ (hexagon_V6_vavguh_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vavguh_128B_dsl vc_0-folded v1-folded v2-folded prec_i_o num_4 ) (vector)))
]
		[else ( hexagon_V6_vavguh_128B_dsl vc_0-folded v1-folded v2-folded prec_i_o num_4 )]
		)
	]
	[ (hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyubv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 num_8 ) (vector)))
]
		[else ( hexagon_V6_vmpyubv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 num_8 )]
		)
	]
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vaddcarrysat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vaddcarrysat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_pred_or_128B_dsl v0 v1 num_2 prec_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_pred_or_128B_dsl v0-folded v1-folded num_2 prec_o ) (vector)))
]
		[else ( hexagon_V6_pred_or_128B_dsl v0-folded v1-folded num_2 prec_o )]
		)
	]
	[ (hexagon_V6_vasrwhsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrwhsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrwhsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vassign_128B_dsl v0 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vassign_128B_dsl v0-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vassign_128B_dsl v0-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vadduhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vadduhw_acc_128B_dsl v0-folded v1-folded v2-folded lane_size num_4 num_5 prec_i_o num_7 ) (vector)))
]
		[else ( hexagon_V6_vadduhw_acc_128B_dsl v0-folded v1-folded v2-folded lane_size num_4 num_5 prec_i_o num_7 )]
		)
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasruwuhsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasruwuhsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vandvrt_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vandvrt_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vshuffeb_128B_dsl v0 v1 prec_i_o num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vshuffeb_128B_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
]
		[else ( hexagon_V6_vshuffeb_128B_dsl v0-folded v1-folded prec_i_o num_3 )]
		)
	]
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyiewuh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyiewuh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vasrwh_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrwh_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrwh_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vminuh_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vminuh_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vminuh_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vpackhub_sat_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vpackhub_sat_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vpackhub_sat_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 num_3)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vdmpyhisat_128B_dsl vc_0-folded v1-folded v2-folded num_3 ) (vector)))
]
		[else ( hexagon_V6_vdmpyhisat_128B_dsl vc_0-folded v1-folded v2-folded num_3 )]
		)
	]
	[ (hexagon_V6_vsatwh_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vsatwh_128B_dsl v0-folded v1-folded prec_o num_3 num_4 prec_i num_6 ) (vector)))
]
		[else ( hexagon_V6_vsatwh_128B_dsl v0-folded v1-folded prec_o num_3 num_4 prec_i num_6 )]
		)
	]
	[ (hexagon_V6_vnavgub_128B_dsl vc_0 v1 v2 prec_i_o num_4)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vnavgub_128B_dsl vc_0-folded v1-folded v2-folded prec_i_o num_4 ) (vector)))
]
		[else ( hexagon_V6_vnavgub_128B_dsl vc_0-folded v1-folded v2-folded prec_i_o num_4 )]
		)
	]
	[ (hexagon_V6_vabsh_sat_128B_dsl v0 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vabsh_sat_128B_dsl v0-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vabsh_sat_128B_dsl v0-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vmpybus_128B_dsl v0 v1 num_2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpybus_128B_dsl v0-folded v1-folded num_2 ) (vector)))
]
		[else ( hexagon_V6_vmpybus_128B_dsl v0-folded v1-folded num_2 )]
		)
	]
	[ (hexagon_V6_vpackwh_sat_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vpackwh_sat_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vpackwh_sat_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_pred_or_n_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_pred_or_n_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyhsat_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 ) (vector)))
]
		[else ( hexagon_V6_vmpyhsat_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 )]
		)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vdealb_128B_dsl v0-folded lane_size num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( hexagon_V6_vdealb_128B_dsl v0-folded lane_size num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (hexagon_V6_vlsrb_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vlsrb_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vlsrb_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vandqrt_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vandqrt_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vandqrt_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmaxuh_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vmaxuh_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vlsrw_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vlsrw_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vlsrw_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_veqw_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_veqw_and_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 ) (vector)))
]
		[else ( hexagon_V6_veqw_and_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 )]
		)
	]
	[ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyiewuh_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyiewuh_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vdmpyhb_128B_dsl vc_0 v1 v2)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vdmpyhb_128B_dsl vc_0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vdmpyhb_128B_dsl vc_0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vaddw_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vaddw_dv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vaddw_dv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vmpauhb_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpauhb_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpauhb_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vandvqv_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vandvqv_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vandvqv_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vpackeb_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vpackeb_128B_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vpackeb_128B_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vgtub_xor_128B_dsl v0 vc_1 vc_2 v3 v4 prec_o prec_i)
		(define v0-folded (hvx:const-fold v0))
		(define vc_1-folded (hvx:const-fold vc_1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define v3-folded (hvx:const-fold v3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtub_xor_128B_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtub_xor_128B_dsl v0-folded vc_1-folded vc_2-folded v3-folded v4-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vaddwnq_128B_dsl v0 v1 v2 prec_i_o num_4)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vaddwnq_128B_dsl v0-folded v1-folded v2-folded prec_i_o num_4 ) (vector)))
]
		[else ( hexagon_V6_vaddwnq_128B_dsl v0-folded v1-folded v2-folded prec_i_o num_4 )]
		)
	]
	[ (hexagon_V6_vgtw_or_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtw_or_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 ) (vector)))
]
		[else ( hexagon_V6_vgtw_or_128B_dsl v0-folded v1-folded vc_2-folded vc_3-folded v4-folded prec_i_o num_6 )]
		)
	]
	[ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vdmpybus_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vdmpybus_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyih_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyih_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vgtw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtw_xor_128B_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded prec_i_o num_6 ) (vector)))
]
		[else ( hexagon_V6_vgtw_xor_128B_dsl vc_0-folded v1-folded v2-folded vc_3-folded v4-folded prec_i_o num_6 )]
		)
	]
	[ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vandqrt_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vandqrt_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_pred_and_128B_dsl v0 v1 num_2 prec_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_pred_and_128B_dsl v0-folded v1-folded num_2 prec_o ) (vector)))
]
		[else ( hexagon_V6_pred_and_128B_dsl v0-folded v1-folded num_2 prec_o )]
		)
	]
	[ (hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyowh_rnd_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyowh_rnd_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpybus_acc_128B_dsl v0-folded v1-folded v2-folded num_3 ) (vector)))
]
		[else ( hexagon_V6_vmpybus_acc_128B_dsl v0-folded v1-folded v2-folded num_3 )]
		)
	]
	[ (hexagon_V6_vgtub_128B_dsl vc_0 v1 vc_2 v3 prec_o prec_i)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define v3-folded (hvx:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded))
(lit (hvx:interpret ( hexagon_V6_vgtub_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtub_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vabsdiffh_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vabsdiffh_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vabsdiffub_128B_dsl v0-folded v1-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vabsdiffub_128B_dsl v0-folded v1-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2 num_3 num_4)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpabuu_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 ) (vector)))
]
		[else ( hexagon_V6_vmpabuu_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 )]
		)
	]
	[ (hexagon_V6_vsubb_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vsubb_dv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vsubb_dv_128B_dsl v0-folded v1-folded lane_size num_3 prec_i_o num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyih_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyih_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vsubhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vsubhw_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 ) (vector)))
]
		[else ( hexagon_V6_vsubhw_128B_dsl v0-folded v1-folded lane_size num_3 prec_i prec_o num_6 num_7 )]
		)
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmux_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmux_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vasrhbsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrhbsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrhbsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyiowh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyiowh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6 num_7)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyiwb_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 num_6 num_7 ) (vector)))
]
		[else ( hexagon_V6_vmpyiwb_acc_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 num_6 num_7 )]
		)
	]
	[ (hexagon_V6_vmpyuh_128B_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyuh_128B_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( hexagon_V6_vmpyuh_128B_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (hexagon_V6_vabsh_128B_dsl v0 prec_i_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vabsh_128B_dsl v0-folded prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vabsh_128B_dsl v0-folded prec_i_o )]
		)
	]
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyuhe_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyuhe_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vdmpyhsat_128B_dsl vc_0 v1 v2 num_3)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vdmpyhsat_128B_dsl vc_0-folded v1-folded v2-folded num_3 ) (vector)))
]
		[else ( hexagon_V6_vdmpyhsat_128B_dsl vc_0-folded v1-folded v2-folded num_3 )]
		)
	]
	[ (hexagon_V6_vmpyiwh_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyiwh_128B_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 ) (vector)))
]
		[else ( hexagon_V6_vmpyiwh_128B_dsl v0-folded v1-folded num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 )]
		)
	]
	[ (hexagon_V6_vgtub_and_128B_dsl vc_0 v1 vc_2 v3 v4 prec_o prec_i)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define v3-folded (hvx:const-fold v3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtub_and_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtub_and_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vdealb4w_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vdealb4w_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vgtub_or_128B_dsl v0 vc_1 v2 vc_3 v4 prec_o prec_i)
		(define v0-folded (hvx:const-fold v0))
		(define vc_1-folded (hvx:const-fold vc_1))
		(define v2-folded (hvx:const-fold v2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? v0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? vc_3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_vgtub_or_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_vgtub_or_128B_dsl v0-folded vc_1-folded v2-folded vc_3-folded v4-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vdmpyhvsat_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vdmpyhvsat_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vandvnqv_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vandvnqv_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vunpackoh_128B_dsl vc_0-folded v1-folded v2-folded num_3 prec_i_o ) (vector)))
]
		[else ( hexagon_V6_vunpackoh_128B_dsl vc_0-folded v1-folded v2-folded num_3 prec_i_o )]
		)
	]
	[ (hexagon_V6_vaslh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vaslh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vaslh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vshuffh_128B_dsl v0-folded lane_size num_2 prec_i_o num_4 num_5 ) (vector)))
]
		[else ( hexagon_V6_vshuffh_128B_dsl v0-folded lane_size num_2 prec_i_o num_4 num_5 )]
		)
	]
	[ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o num_5)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define vc_1-folded (hvx:const-fold vc_1))
		(define v2-folded (hvx:const-fold v2))
		(define v3-folded (hvx:const-fold v3))
		(cond
		[(and (lit? vc_0-folded) (lit? vc_1-folded) (lit? v2-folded) (lit? v3-folded))
(lit (hvx:interpret ( hexagon_V6_vavguhrnd_128B_dsl vc_0-folded vc_1-folded v2-folded v3-folded prec_i_o num_5 ) (vector)))
]
		[else ( hexagon_V6_vavguhrnd_128B_dsl vc_0-folded vc_1-folded v2-folded v3-folded prec_i_o num_5 )]
		)
	]
	[ (hexagon_V6_vinsertwr_128B_dsl v0)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vinsertwr_128B_dsl v0-folded ) (vector)))
]
		[else ( hexagon_V6_vinsertwr_128B_dsl v0-folded )]
		)
	]
	[ (hexagon_V6_veqw_or_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define vc_2-folded (hvx:const-fold vc_2))
		(define v3-folded (hvx:const-fold v3))
		(define v4-folded (hvx:const-fold v4))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? vc_2-folded) (lit? v3-folded) (lit? v4-folded))
(lit (hvx:interpret ( hexagon_V6_veqw_or_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded prec_i_o num_6 ) (vector)))
]
		[else ( hexagon_V6_veqw_or_128B_dsl vc_0-folded v1-folded vc_2-folded v3-folded v4-folded prec_i_o num_6 )]
		)
	]
	[ (hexagon_V6_vasrwuhsat_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrwuhsat_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vasrwuhsat_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vsubuwsat_128B_dsl v0 v1 prec_i_o num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vsubuwsat_128B_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
]
		[else ( hexagon_V6_vsubuwsat_128B_dsl v0-folded v1-folded prec_i_o num_3 )]
		)
	]
	[ (hexagon_V6_vmpyihb_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyihb_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyihb_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vshufoh_128B_dsl v0 v1 prec_i_o num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vshufoh_128B_dsl v0-folded v1-folded prec_i_o num_3 ) (vector)))
]
		[else ( hexagon_V6_vshufoh_128B_dsl v0-folded v1-folded prec_i_o num_3 )]
		)
	]
	[ (hexagon_V6_vasrhubrndsat_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vasrhubrndsat_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vasrhubrndsat_128B_dsl v0-folded v1-folded v2-folded num_3 num_4 num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_vsh_128B_dsl v0-folded lane_size num_2 prec_i prec_o num_5 num_6 ) (vector)))
]
		[else ( hexagon_V6_vsh_128B_dsl v0-folded lane_size num_2 prec_i prec_o num_5 num_6 )]
		)
	]
	[ (hexagon_V6_vmpabusv_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpabusv_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpabusv_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_veqb_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
		(define vc_0-folded (hvx:const-fold vc_0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(define vc_3-folded (hvx:const-fold vc_3))
		(cond
		[(and (lit? vc_0-folded) (lit? v1-folded) (lit? v2-folded) (lit? vc_3-folded))
(lit (hvx:interpret ( hexagon_V6_veqb_128B_dsl vc_0-folded v1-folded v2-folded vc_3-folded prec_o prec_i ) (vector)))
]
		[else ( hexagon_V6_veqb_128B_dsl vc_0-folded v1-folded v2-folded vc_3-folded prec_o prec_i )]
		)
	]
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vpackoh_128B_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 ) (vector)))
]
		[else ( hexagon_V6_vpackoh_128B_dsl v0-folded v1-folded num_2 prec_i_o num_4 num_5 num_6 num_7 )]
		)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vaslw_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vaslw_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vlsrh_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vlsrh_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vlsrh_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( hexagon_V6_vmpyuhe_128B_dsl v0-folded v1-folded ) (vector)))
]
		[else ( hexagon_V6_vmpyuhe_128B_dsl v0-folded v1-folded )]
		)
	]
	[ (hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vmpauhb_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vmpauhb_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vswap_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vswap_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (hexagon_V6_lvsplath_128B_dsl v0 prec_o)
		(define v0-folded (hvx:const-fold v0))
		(cond
		[(and (lit? v0-folded))
(lit (hvx:interpret ( hexagon_V6_lvsplath_128B_dsl v0-folded prec_o ) (vector)))
]
		[else ( hexagon_V6_lvsplath_128B_dsl v0-folded prec_o )]
		)
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(define v2-folded (hvx:const-fold v2))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded) (lit? v2-folded))
(lit (hvx:interpret ( hexagon_V6_vandnqrt_acc_128B_dsl v0-folded v1-folded v2-folded ) (vector)))
]
		[else ( hexagon_V6_vandnqrt_acc_128B_dsl v0-folded v1-folded v2-folded )]
		)
	]
	[ (vector-ashr_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( vector-ashr_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( vector-ashr_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (vector-lshr_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( vector-lshr_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( vector-lshr_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[ (vector-shl_dsl v0 v1 num_2 num_3)
		(define v0-folded (hvx:const-fold v0))
		(define v1-folded (hvx:const-fold v1))
		(cond
		[(and (lit? v0-folded) (lit? v1-folded))
(lit (hvx:interpret ( vector-shl_dsl v0-folded v1-folded num_2 num_3 ) (vector)))
]
		[else ( vector-shl_dsl v0-folded v1-folded num_2 num_3 )]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

