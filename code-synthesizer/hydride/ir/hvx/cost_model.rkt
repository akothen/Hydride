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

(define cost_hexagon_V6_vshuffob_128B_dsl 1)
(define cost_hexagon_V6_veqw_xor_128B_dsl 1)
(define cost_hexagon_V6_vasrh_acc_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhb_acc_128B_dsl 2)
(define cost_hexagon_V6_vminuh_128B_dsl 1)
(define cost_hexagon_V6_vmpyieoh_128B_dsl 2)
(define cost_hexagon_V6_vpackwuh_sat_128B_dsl 1)
(define cost_hexagon_V6_vpackeh_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_acc_128B_dsl 2)
(define cost_hexagon_V6_lvsplatb_128B_dsl 1)
(define cost_hexagon_V6_vasrw_acc_128B_dsl 1)
(define cost_hexagon_V6_vgtuw_and_128B_dsl 1)
(define cost_hexagon_V6_vaslh_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpabus_128B_dsl 1)
(define cost_hexagon_V6_vaslw_acc_128B_dsl 1)
(define cost_hexagon_V6_vabsdiffh_128B_dsl 1)
(define cost_hexagon_V6_vshuffeb_128B_dsl 1)
(define cost_hexagon_V6_vaddcarrysat_128B_dsl 1)
(define cost_hexagon_V6_pred_and_128B_dsl 1)
(define cost_hexagon_V6_vgtb_128B_dsl 1)
(define cost_hexagon_V6_vaddubh_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_128B_dsl 2)
(define cost_hexagon_V6_vmpyh_128B_dsl 2)
(define cost_hexagon_V6_vmpyiewuh_128B_dsl 2)
(define cost_hexagon_V6_vshufoeh_128B_dsl 1)
(define cost_hexagon_V6_lvsplatw_128B_dsl 1)
(define cost_hexagon_V6_vaddhsat_128B_dsl 1)
(define cost_hexagon_V6_vswap_128B_dsl 1)
(define cost_hexagon_V6_vinsertwr_128B_dsl 1)
(define cost_hexagon_V6_vabsh_128B_dsl 1)
(define cost_hexagon_V6_vunpackoh_128B_dsl 1)
(define cost_hexagon_V6_vabsw_sat_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_128B_dsl 1)
(define cost_hexagon_V6_vsubuhw_128B_dsl 1)
(define cost_hexagon_V6_veqw_or_128B_dsl 1)
(define cost_hexagon_V6_vsubh_128B_dsl 1)
(define cost_hexagon_V6_vmpyiewh_acc_128B_dsl 2)
(define cost_hexagon_V6_vasruhubrndsat_128B_dsl 1)
(define cost_hexagon_V6_vmpyiowh_128B_dsl 2)
(define cost_hexagon_V6_vaslhv_128B_dsl 1)
(define cost_hexagon_V6_vgtub_xor_128B_dsl 1)
(define cost_hexagon_V6_vmpyih_128B_dsl 2)
(define cost_hexagon_V6_vmpyiwh_acc_128B_dsl 2)
(define cost_hexagon_V6_vandvnqv_128B_dsl 1)
(define cost_hexagon_V6_vlsrh_128B_dsl 1)
(define cost_hexagon_V6_vmpabus_acc_128B_dsl 1)
(define cost_hexagon_V6_vmux_128B_dsl 1)
(define cost_hexagon_V6_vnavgw_128B_dsl 1)
(define cost_hexagon_V6_vaslh_128B_dsl 1)
(define cost_hexagon_V6_vandnqrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vdealb_128B_dsl 1)
(define cost_hexagon_V6_vmpahb_acc_128B_dsl 1)
(define cost_hexagon_V6_vrounduhub_128B_dsl 1)
(define cost_hexagon_V6_vlsrw_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_128B_dsl 2)
(define cost_hexagon_V6_vsathub_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl 2)
(define cost_hexagon_V6_veqw_128B_dsl 1)
(define cost_hexagon_V6_vmpyub_acc_128B_dsl 2)
(define cost_hexagon_V6_vdealb4w_128B_dsl 1)
(define cost_hexagon_V6_vrmpybv_128B_dsl 2)
(define cost_hexagon_V6_vrmpybus_acc_128B_dsl 2)
(define cost_hexagon_V6_vdmpybus_128B_dsl 2)
(define cost_hexagon_V6_veqh_and_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_128B_dsl 2)
(define cost_hexagon_V6_vpackoh_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhisat_128B_dsl 2)
(define cost_hexagon_V6_vandnqrt_128B_dsl 1)
(define cost_hexagon_V6_vshuffh_128B_dsl 1)
(define cost_hexagon_V6_vandvrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpabusv_128B_dsl 1)
(define cost_hexagon_V6_vor_128B_dsl 1)
(define cost_hexagon_V6_vasruwuhsat_128B_dsl 1)
(define cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl 2)
(define cost_hexagon_V6_vaddubh_acc_128B_dsl 1)
(define cost_hexagon_V6_vroundwuh_128B_dsl 1)
(define cost_hexagon_V6_vmpyihb_128B_dsl 2)
(define cost_hexagon_V6_pred_xor_128B_dsl 1)
(define cost_hexagon_V6_vandvrt_128B_dsl 1)
(define cost_hexagon_V6_vasrwh_128B_dsl 1)
(define cost_hexagon_V6_vandvqv_128B_dsl 1)
(define cost_hexagon_V6_vavgwrnd_128B_dsl 1)
(define cost_hexagon_V6_vgth_or_128B_dsl 1)
(define cost_hexagon_V6_vmpyuhe_acc_128B_dsl 2)
(define cost_hexagon_V6_vmaxw_128B_dsl 1)
(define cost_hexagon_V6_vandqrt_acc_128B_dsl 1)
(define cost_hexagon_V6_vmpyub_128B_dsl 2)
(define cost_hexagon_V6_pred_and_n_128B_dsl 1)
(define cost_hexagon_V6_vasruwuhrndsat_128B_dsl 1)
(define cost_hexagon_V6_vaslw_128B_dsl 1)
(define cost_hexagon_V6_vavguw_128B_dsl 1)
(define cost_hexagon_V6_vasrhubsat_128B_dsl 1)
(define cost_hexagon_V6_lo_128B_dsl 1)
(define cost_hexagon_V6_vassign_128B_dsl 1)
(define cost_hexagon_V6_vunpackh_128B_dsl 1)
(define cost_hexagon_V6_vcombine_128B_dsl 1)
(define cost_hexagon_V6_vmpauhb_128B_dsl 1)
(define cost_hexagon_V6_vmpybv_acc_128B_dsl 2)
(define cost_hexagon_V6_vlsrwv_128B_dsl 1)
(define cost_hexagon_V6_vsubhnq_128B_dsl 1)
(define cost_hexagon_V6_vsb_128B_dsl 1)
(define cost_hexagon_V6_vaddbq_128B_dsl 1)
(define cost_hexagon_V6_vmpybv_128B_dsl 2)
(define cost_hexagon_V6_vasrhv_128B_dsl 1)
(define cost_hexagon_V6_vdmpyhsat_acc_128B_dsl 2)
(define cost_hexagon_V6_vmpyh_acc_128B_dsl 2)
(define cost_hexagon_V6_vnot_128B_dsl 1)
(define cost_hexagon_V6_pred_or_n_128B_dsl 1)
(define cost_hexagon_V6_vmpyewuh_64_128B_dsl 2)
(define cost_hexagon_V6_vshuffvdd_128B_dsl 1)
(define cost_hexagon_V6_vdealvdd_128B_dsl 1)

(define (hvx:cost prog)
  (destruct prog
            [(reg id) 1]
            [(lit v) 1 ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (+ 4 (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (+ 1 (hvx:cost  v0)  (hvx:cost  v1)  
                )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (+ 3 (hvx:cost  v0) )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (+ 3 (hvx:cost  v0) )
             ]
            [ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (+ 5 (hvx:cost  v0)  (hvx:cost  v1)  
                (hvx:cost  v4) )
             ]

		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx:cost  v0)  (hvx:cost  v1)  
		)
	]
            [ (hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost_hexagon_V6_vshuffob_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  


                )
             ]
            [ (hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (+ cost_hexagon_V6_veqw_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vasrh_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
             (+ cost_hexagon_V6_vdmpyhb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  




                )
             ]
            [ (hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost_hexagon_V6_vminuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vmpyieoh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
             (+ cost_hexagon_V6_vpackwuh_sat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  





                )
             ]
            [ (hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vpackeh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vmpyih_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_lvsplatb_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (+ cost_hexagon_V6_lvsplatb_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (+ cost_hexagon_V6_vasrw_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  

                )
             ]
            [ (hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vgtuw_and_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vaslh_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
             (+ cost_hexagon_V6_vmpabus_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  









                )
             ]
            [ (hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (+ cost_hexagon_V6_vaslw_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  

                )
             ]
            [ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (+ cost_hexagon_V6_vabsdiffh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  


                )
             ]
            [ (hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (+ cost_hexagon_V6_vshuffeb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  


                )
             ]
            [ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vaddcarrysat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (+ cost_hexagon_V6_pred_and_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (+ cost_hexagon_V6_vgtb_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (+ cost_hexagon_V6_vaddubh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  





                )
             ]
            [ (hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vmpyewuh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (+ cost_hexagon_V6_vmpyh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  






                )
             ]
            [ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vmpyiewuh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (+ cost_hexagon_V6_vshufoeh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  




                )
             ]
            [ (hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (+ cost_hexagon_V6_lvsplatw_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost_hexagon_V6_vaddhsat_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (+ cost_hexagon_V6_vswap_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  vc_3)  



                )
             ]
            [ (hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
             (+ cost_hexagon_V6_vinsertwr_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (+ cost_hexagon_V6_vabsh_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (+ cost_hexagon_V6_vunpackoh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (+ cost_hexagon_V6_vabsw_sat_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vandqrt_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (+ cost_hexagon_V6_vsubuhw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  





                )
             ]
            [ (hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (+ cost_hexagon_V6_veqw_or_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost_hexagon_V6_vsubh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (+ cost_hexagon_V6_vmpyiewh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  




                )
             ]
            [ (hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (+ cost_hexagon_V6_vasruhubrndsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  (hvx:cost  v4)  (hvx:cost  v5)  





                )
             ]
            [ (hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vmpyiowh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (+ cost_hexagon_V6_vaslhv_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
             (+ cost_hexagon_V6_vgtub_xor_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (+ cost_hexagon_V6_vmpyih_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  


                )
             ]
            [ (hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (+ cost_hexagon_V6_vmpyiwh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  





                )
             ]
            [ (hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (+ cost_hexagon_V6_vandvnqv_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost_hexagon_V6_vlsrh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
             (+ cost_hexagon_V6_vmpabus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  










                )
             ]
            [ (hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (+ cost_hexagon_V6_vmux_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  

                )
             ]
            [ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost_hexagon_V6_vnavgw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost_hexagon_V6_vaslh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (+ cost_hexagon_V6_vandnqrt_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vdealb_128B_dsl (hvx:cost  v0)  



                )
             ]
            [ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
             (+ cost_hexagon_V6_vmpahb_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  












                )
             ]
            [ (hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (+ cost_hexagon_V6_vrounduhub_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  vc_3)  (hvx:cost  v4)  (hvx:cost  v5)  




                )
             ]
            [ (hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (+ cost_hexagon_V6_vlsrw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  

                )
             ]
            [ (hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (+ cost_hexagon_V6_vmpyowh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  (hvx:cost  v4)  




                )
             ]
            [ (hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
             (+ cost_hexagon_V6_vsathub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (+ cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (+ cost_hexagon_V6_veqw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  

                )
             ]
            [ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (+ cost_hexagon_V6_vmpyub_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  








                )
             ]
            [ (hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (+ cost_hexagon_V6_vdealb4w_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  








                )
             ]
            [ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vrmpybv_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vrmpybus_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_vdmpybus_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vdmpybus_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (+ cost_hexagon_V6_veqh_and_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vmpyuhe_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (+ cost_hexagon_V6_vpackoh_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  




                )
             ]
            [ (hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (+ cost_hexagon_V6_vdmpyhisat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  




                )
             ]
            [ (hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (+ cost_hexagon_V6_vandnqrt_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (+ cost_hexagon_V6_vshuffh_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
             (+ cost_hexagon_V6_vandvrt_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  vc_3)  (hvx:cost  v4)  (hvx:cost  v5)  


                )
             ]
            [ (hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (+ cost_hexagon_V6_vmpabusv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  








                )
             ]
            [ (hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (+ cost_hexagon_V6_vor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
             (+ cost_hexagon_V6_vasruwuhsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (+ cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  (hvx:cost  v4)  (hvx:cost  v5)  





                )
             ]
            [ (hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (+ cost_hexagon_V6_vaddubh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  






                )
             ]
            [ (hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (+ cost_hexagon_V6_vroundwuh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  vc_3)  (hvx:cost  v4)  (hvx:cost  v5)  




                )
             ]
            [ (hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vmpyihb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  



                )
             ]
            [ (hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (+ cost_hexagon_V6_pred_xor_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
             (+ cost_hexagon_V6_vandvrt_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  vc_3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (+ cost_hexagon_V6_vasrwh_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (+ cost_hexagon_V6_vandvqv_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  vc_3)  

                )
             ]
            [ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vavgwrnd_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vgth_or_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (+ cost_hexagon_V6_vmpyuhe_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  



                )
             ]
            [ (hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (+ cost_hexagon_V6_vmaxw_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (+ cost_hexagon_V6_vandqrt_acc_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  vc_3)  (hvx:cost  v4)  


                )
             ]
            [ (hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (+ cost_hexagon_V6_vmpyub_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  







                )
             ]
            [ (hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (+ cost_hexagon_V6_pred_and_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
             (+ cost_hexagon_V6_vasruwuhrndsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  vc_2)  
                (hvx:cost  v3)  (hvx:cost  v4)  (hvx:cost  v5)  




                )
             ]
            [ (hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (+ cost_hexagon_V6_vaslw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  

                )
             ]
            [ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (+ cost_hexagon_V6_vavguw_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
             (+ cost_hexagon_V6_vasrhubsat_128B_dsl (hvx:cost  vc_0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  v3)  



                )
             ]
            [ (hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (+ cost_hexagon_V6_lo_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (+ cost_hexagon_V6_vassign_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (+ cost_hexagon_V6_vunpackh_128B_dsl (hvx:cost  v0)  


                )
             ]
            [ (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
             (+ cost_hexagon_V6_vcombine_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  


                )
             ]
            [ (hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
             (+ cost_hexagon_V6_vmpauhb_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  











                )
             ]
            [ (hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (+ cost_hexagon_V6_vmpybv_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  






                )
             ]
            [ (hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (+ cost_hexagon_V6_vlsrwv_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vsubhnq_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
                (hvx:cost  vc_3)  


                )
             ]
            [ (hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
             (+ cost_hexagon_V6_vsb_128B_dsl (hvx:cost  v0)  




                )
             ]
            [ (hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (+ cost_hexagon_V6_vaddbq_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  


                )
             ]
            [ (hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (+ cost_hexagon_V6_vmpybv_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  





                )
             ]
            [ (hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (+ cost_hexagon_V6_vasrhv_128B_dsl (hvx:cost  v0)  (hvx:cost  vc_1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (+ cost_hexagon_V6_vdmpyhsat_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  


                )
             ]
            [ (hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (+ cost_hexagon_V6_vmpyh_acc_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  







                )
             ]
            [ (hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (+ cost_hexagon_V6_vnot_128B_dsl (hvx:cost  v0)  

                )
             ]
            [ (hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (+ cost_hexagon_V6_pred_or_n_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  

                )
             ]
            [ (hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
             (+ cost_hexagon_V6_vmpyewuh_64_128B_dsl (hvx:cost  vc_0)  (hvx:cost  vc_1)  (hvx:cost  v2)  
                (hvx:cost  v3)  






                )
             ]
            [ (hexagon_V6_vshuffvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 size_i num_7 num_8)
             (+ cost_hexagon_V6_vshuffvdd_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  

                )
             ]
            [ (hexagon_V6_vdealvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ cost_hexagon_V6_vdealvdd_128B_dsl (hvx:cost  v0)  (hvx:cost  v1)  (hvx:cost  v2)  
		 
		 
		 
		 
		 
		)
	]
            [v  (error "Unrecognized Term in cost model" v)]
            )
  )

;; ================================================================================


(define instcombine:cost_hexagon_V6_vshuffob_128B_dsl 8)
(define instcombine:cost_hexagon_V6_veqw_xor_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasrh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdmpyhb_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vminuh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyieoh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vpackwuh_sat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vpackeh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyih_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_lvsplatb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasrw_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vgtuw_and_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaslh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpabus_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaslw_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vabsdiffh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vshuffeb_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vaddcarrysat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_pred_and_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vgtb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaddubh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyewuh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyiewuh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vshufoeh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_lvsplatw_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vaddhsat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vswap_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vinsertwr_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vabsh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vunpackoh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vabsw_sat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandqrt_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vsubuhw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_veqw_or_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vsubh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyiewh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasruhubrndsat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyiowh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaslhv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vgtub_xor_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyih_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyiwh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandvnqv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vlsrh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpabus_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmux_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vnavgw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaslh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandnqrt_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdealb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpahb_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vrounduhub_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vlsrw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyowh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vsathub_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_veqw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyub_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdealb4w_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vrmpybv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vrmpybus_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdmpybus_128B_dsl 1)
(define instcombine:cost_hexagon_V6_veqh_and_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyuhe_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vpackoh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdmpyhisat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandnqrt_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vshuffh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandvrt_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpabusv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vor_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasruwuhsat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaddubh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vroundwuh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyihb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_pred_xor_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandvrt_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasrwh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandvqv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vavgwrnd_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vgth_or_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyuhe_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmaxw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vandqrt_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyub_128B_dsl 1)
(define instcombine:cost_hexagon_V6_pred_and_n_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasruwuhrndsat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaslw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vavguw_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasrhubsat_128B_dsl 1)
(define instcombine:cost_hexagon_V6_lo_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vassign_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vunpackh_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vcombine_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vmpauhb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpybv_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vlsrwv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vsubhnq_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vsb_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vaddbq_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpybv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vasrhv_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vdmpyhsat_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyh_acc_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vnot_128B_dsl 1)
(define instcombine:cost_hexagon_V6_pred_or_n_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vmpyewuh_64_128B_dsl 1)
(define instcombine:cost_hexagon_V6_vshuffvdd_128B_dsl 8)
(define instcombine:cost_hexagon_V6_vdealvdd_128B_dsl 8)

(define (hvx-instcombine:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 1 (hvx-instcombine:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 1 (hvx-instcombine:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 (hvx-instcombine:cost  v4) )
	]

		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		)
	]
	[ (hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vshuffob_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		)
	]
	[ (hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_veqw_xor_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vasrh_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
		(+ instcombine:cost_hexagon_V6_vdmpyhb_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vminuh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vmpyieoh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vpackwuh_sat_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vpackeh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vmpyih_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_lvsplatb_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
		(+ instcombine:cost_hexagon_V6_lvsplatb_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vasrw_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		)
	]
	[ (hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vgtuw_and_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vaslh_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
		(+ instcombine:cost_hexagon_V6_vmpabus_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vaslw_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		)
	]
	[ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vabsdiffh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		)
	]
	[ (hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vshuffeb_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		)
	]
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vaddcarrysat_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(+ instcombine:cost_hexagon_V6_pred_and_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vgtb_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(+ instcombine:cost_hexagon_V6_vaddubh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vmpyewuh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ instcombine:cost_hexagon_V6_vmpyh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vmpyiewuh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ instcombine:cost_hexagon_V6_vshufoeh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 size_i num_6)
		(+ instcombine:cost_hexagon_V6_lvsplatw_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vaddhsat_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
		(+ instcombine:cost_hexagon_V6_vswap_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  vc_3)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
		(+ instcombine:cost_hexagon_V6_vinsertwr_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ instcombine:cost_hexagon_V6_vabsh_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vunpackoh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ instcombine:cost_hexagon_V6_vabsw_sat_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vandqrt_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(+ instcombine:cost_hexagon_V6_vsubuhw_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_veqw_or_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vsubh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ instcombine:cost_hexagon_V6_vmpyiewh_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(+ instcombine:cost_hexagon_V6_vasruhubrndsat_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vmpyiowh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vaslhv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vgtub_xor_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vmpyih_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vmpyiwh_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vandvnqv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vlsrh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
		(+ instcombine:cost_hexagon_V6_vmpabus_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vmux_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  
		 
		)
	]
	[ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vnavgw_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vaslh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vandnqrt_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vdealb_128B_dsl (hvx-instcombine:cost  v0)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
		(+ instcombine:cost_hexagon_V6_vmpahb_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vrounduhub_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  vc_3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(+ instcombine:cost_hexagon_V6_vlsrw_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vmpyowh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vsathub_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vdmpyhvsat_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(+ instcombine:cost_hexagon_V6_veqw_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  
		 
		)
	]
	[ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(+ instcombine:cost_hexagon_V6_vmpyub_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(+ instcombine:cost_hexagon_V6_vdealb4w_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vrmpybv_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vrmpybus_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vdmpybus_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vdmpybus_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_veqh_and_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vmpyuhe_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(+ instcombine:cost_hexagon_V6_vpackoh_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(+ instcombine:cost_hexagon_V6_vdmpyhisat_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vandnqrt_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vshuffh_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vandvrt_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  vc_3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(+ instcombine:cost_hexagon_V6_vmpabusv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(+ instcombine:cost_hexagon_V6_vor_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vasruwuhsat_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(+ instcombine:cost_hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(+ instcombine:cost_hexagon_V6_vaddubh_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vroundwuh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  vc_3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vmpyihb_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(+ instcombine:cost_hexagon_V6_pred_xor_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vandvrt_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  vc_3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vasrwh_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vandvqv_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  vc_3)  
		 
		)
	]
	[ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vavgwrnd_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vgth_or_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(+ instcombine:cost_hexagon_V6_vmpyuhe_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vmaxw_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(+ instcombine:cost_hexagon_V6_vandqrt_acc_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  vc_3)  (hvx-instcombine:cost  v4)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(+ instcombine:cost_hexagon_V6_vmpyub_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(+ instcombine:cost_hexagon_V6_pred_and_n_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
		(+ instcombine:cost_hexagon_V6_vasruwuhrndsat_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  vc_2)  
		 (hvx-instcombine:cost  v3)  (hvx-instcombine:cost  v4)  (hvx-instcombine:cost  v5)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(+ instcombine:cost_hexagon_V6_vaslw_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(+ instcombine:cost_hexagon_V6_vavguw_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
		(+ instcombine:cost_hexagon_V6_vasrhubsat_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		 
		)
	]
	[ (hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(+ instcombine:cost_hexagon_V6_lo_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ instcombine:cost_hexagon_V6_vassign_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vunpackh_128B_dsl (hvx-instcombine:cost  v0)  
		 
		 
		)
	]
	[ (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vcombine_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
		(+ instcombine:cost_hexagon_V6_vmpauhb_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(+ instcombine:cost_hexagon_V6_vmpybv_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vlsrwv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vsubhnq_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  vc_3)  
		 
		 
		)
	]
	[ (hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
		(+ instcombine:cost_hexagon_V6_vsb_128B_dsl (hvx-instcombine:cost  v0)  
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(+ instcombine:cost_hexagon_V6_vaddbq_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(+ instcombine:cost_hexagon_V6_vmpybv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(+ instcombine:cost_hexagon_V6_vasrhv_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(+ instcombine:cost_hexagon_V6_vdmpyhsat_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		)
	]
	[ (hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(+ instcombine:cost_hexagon_V6_vmpyh_acc_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(+ instcombine:cost_hexagon_V6_vnot_128B_dsl (hvx-instcombine:cost  v0)  
		 
		)
	]
	[ (hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(+ instcombine:cost_hexagon_V6_pred_or_n_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  
		 
		)
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
		(+ instcombine:cost_hexagon_V6_vmpyewuh_64_128B_dsl (hvx-instcombine:cost  vc_0)  (hvx-instcombine:cost  vc_1)  (hvx-instcombine:cost  v2)  
		 (hvx-instcombine:cost  v3)  
		 
		 
		 
		 
		 
		 
		)
	]
	[ (hexagon_V6_vshuffvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 size_i num_7 num_8)
		(+ instcombine:cost_hexagon_V6_vshuffvdd_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		)
	]
	[ (hexagon_V6_vdealvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(+ instcombine:cost_hexagon_V6_vdealvdd_128B_dsl (hvx-instcombine:cost  v0)  (hvx-instcombine:cost  v1)  (hvx-instcombine:cost  v2)  
		 
		 
		 
		 
		 
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================
