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
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (vector-two-input-swizzle (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
                                       prec_i_o num_4 num_5 
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
            [ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (llvm_shuffle_vectors (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
                                   prec_i_o (hvx:interpret v4 env) num_5)
             ]
[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-add (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sub (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-mul (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-sdiv (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(llvm-vect-udiv (hvx:interpret v0 env) (hvx:interpret v1 env) num_2 
		 prec_i_o)
	]
            [ (hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (hexagon_V6_vshuffob_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       prec_i_o num_7 num_8 
                                       num_9)
             ]
            [ (hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (hexagon_V6_veqw_xor_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                       (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                       num_6 num_7 num_8 
                                       prec_i_o num_10 num_11 
                                       num_12)
             ]
            [ (hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vasrh_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) size_i_o num_5 
                                        num_6 num_7 prec_i_o 
                                        num_9 num_10 num_11 
                                        num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
             (hexagon_V6_vdmpyhb_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          size_i prec_o num_5 
                                          num_6 num_7 num_8 
                                          num_9 num_10 num_11 
                                          num_12 prec_i num_14 
                                          num_15 num_16)
             ]
            [ (hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (hexagon_V6_vminuh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                     num_3 num_4 num_5 
                                     prec_i_o num_7 num_8)
             ]
            [ (hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
             (hexagon_V6_vmpyieoh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                       size_i_o num_4 num_5 
                                       num_6 prec_i prec_o 
                                       num_9 num_10 num_11 
                                       num_12 num_13)
             ]
            [ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
             (hexagon_V6_vpackwuh_sat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                           num_3 num_4 num_5 
                                           num_6 num_7 num_8 
                                           prec_o num_10 num_11 
                                           num_12 num_13 num_14 
                                           prec_i num_16 num_17 
                                           num_18)
             ]
            [ (hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vpackeh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      prec_i_o num_10 num_11 
                                      num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vmpyih_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         size_i_o num_4 num_5 
                                         num_6 prec_i_o num_8 
                                         num_9 num_10 num_11 
                                         num_12 num_13 num_14)
             ]
            [ (hexagon_V6_lvsplatb_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (hexagon_V6_lvsplatb_128B (hvx:interpret v0 env) size_o num_2 
                                       num_3 num_4 prec_o 
                                       num_6)
             ]
            [ (hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (hexagon_V6_vasrw_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) size_i_o num_5 
                                        num_6 num_7 prec_i_o 
                                        num_9 num_10)
             ]
            [ (hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (hexagon_V6_vgtuw_and_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                        num_6 num_7 num_8 
                                        prec_i_o num_10 num_11 
                                        num_12 num_13)
             ]
            [ (hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vaslh_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) size_i_o num_5 
                                        num_6 num_7 prec_i_o 
                                        num_9 num_10 num_11 
                                        num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
             (hexagon_V6_vmpabus_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      prec_i num_10 num_11 
                                      num_12 num_13 num_14 
                                      num_15 num_16 num_17 
                                      num_18 num_19 prec_o 
                                      num_21 num_22 num_23 
                                      num_24 num_25 num_26 
                                      num_27 num_28 num_29 
                                      num_30 num_31 num_32)
             ]
            [ (hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (hexagon_V6_vaslw_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) size_i_o num_5 
                                        num_6 num_7 prec_i_o 
                                        num_9 num_10)
             ]
            [ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (hexagon_V6_vabsdiffh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                        num_3 num_4 num_5 
                                        prec_i_o num_7 num_8 
                                        num_9 num_10)
             ]
            [ (hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (hexagon_V6_vshuffeb_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       prec_i_o num_7 num_8 
                                       num_9)
             ]
            [ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vaddcarrysat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                           size_i_o num_4 num_5 
                                           num_6 num_7 prec_i_o 
                                           num_9 num_10 num_11 
                                           num_12 num_13 num_14)
             ]
            [ (hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (hexagon_V6_pred_and_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_o 
                                       num_3 num_4 num_5 
                                       prec_o num_7)
             ]
            [ (hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (hexagon_V6_vgtb_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                   (hvx:interpret v3 env) size_i_o num_5 
                                   num_6 num_7 prec_o 
                                   num_9 prec_i num_11 
                                   num_12)
             ]
            [ (hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (hexagon_V6_vaddubh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      prec_i num_10 num_11 
                                      num_12 num_13 prec_o 
                                      num_15 num_16 num_17 
                                      num_18 num_19 num_20)
             ]
            [ (hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (hexagon_V6_vmpyewuh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                       size_i_o num_4 num_5 
                                       num_6 num_7 prec_i_o 
                                       num_9 num_10 num_11 
                                       num_12 num_13)
             ]
            [ (hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (hexagon_V6_vmpyh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                    num_3 num_4 num_5 
                                    num_6 num_7 num_8 
                                    prec_i num_10 num_11 
                                    num_12 num_13 num_14 
                                    prec_o num_16 num_17 
                                    num_18 num_19 num_20 
                                    num_21 num_22)
             ]
            [ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
             (hexagon_V6_vmpyiewuh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                        num_3 num_4 num_5 
                                        num_6 prec_i_o num_8 
                                        num_9 num_10 num_11 
                                        num_12)
             ]
            [ (hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (hexagon_V6_vshufoeh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       num_6 num_7 num_8 
                                       prec_i_o num_10 num_11 
                                       num_12 num_13 num_14 
                                       num_15 num_16)
             ]
            [ (hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (hexagon_V6_lvsplatw_128B (hvx:interpret v0 env) size_o num_2 
                                       num_3 num_4 prec_o 
                                       num_6)
             ]
            [ (hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (hexagon_V6_vaddhsat_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       prec_i_o num_7 num_8)
             ]
            [ (hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (hexagon_V6_vswap_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                    (hvx:interpret vc_3 env) size_i_o num_5 
                                    num_6 num_7 num_8 
                                    num_9 num_10 num_11 
                                    num_12 num_13 prec_i_o 
                                    num_15 num_16 num_17)
             ]
            [ (hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
             (hexagon_V6_vinsertwr_128B (hvx:interpret v0 env) size_o num_2 
                                        num_3 num_4 prec_o 
                                        num_6 num_7)
             ]
            [ (hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (hexagon_V6_vabsh_128B (hvx:interpret v0 env) size_i_o num_2 
                                    num_3 num_4 prec_i_o 
                                    num_6)
             ]
            [ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (hexagon_V6_vunpackoh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        size_i_o num_4 num_5 
                                        num_6 num_7 prec_i_o 
                                        num_9 num_10 num_11)
             ]
            [ (hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (hexagon_V6_vabsw_sat_128B (hvx:interpret v0 env) size_i_o num_2 
                                        num_3 num_4 prec_i_o 
                                        num_6 num_7)
             ]
            [ (hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (hexagon_V6_vandqrt_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                      (hvx:interpret v3 env) size_i_o num_5 
                                      num_6 num_7 prec_i_o 
                                      num_9 num_10 num_11 
                                      num_12)
             ]
            [ (hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (hexagon_V6_vsubuhw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      prec_i num_10 num_11 
                                      num_12 num_13 prec_o 
                                      num_15 num_16 num_17 
                                      num_18 num_19 num_20)
             ]
            [ (hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (hexagon_V6_veqw_or_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                      (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                      num_6 num_7 num_8 
                                      prec_i_o num_10 num_11 
                                      num_12)
             ]
            [ (hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (hexagon_V6_vsubh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                    num_3 num_4 num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (hexagon_V6_vmpyiewh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                           size_i_o num_4 num_5 
                                           num_6 num_7 prec_i_o 
                                           num_9 num_10 num_11 
                                           num_12 num_13 num_14 
                                           num_15 num_16)
             ]
            [ (hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (hexagon_V6_vasruhubrndsat_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                             (hvx:interpret v3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                             size_i_o num_7 num_8 
                                             num_9 prec_o num_11 
                                             num_12 num_13 num_14 
                                             num_15 prec_i num_17 
                                             num_18 num_19 num_20 
                                             num_21 num_22 num_23)
             ]
            [ (hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
             (hexagon_V6_vmpyiowh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       num_6 prec_i_o num_8 
                                       num_9 num_10 num_11 
                                       num_12 num_13)
             ]
            [ (hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (hexagon_V6_vaslhv_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                     size_i_o num_4 num_5 
                                     num_6 prec_i_o num_8 
                                     num_9)
             ]
            [ (hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
             (hexagon_V6_vgtub_xor_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                        (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                        num_6 num_7 num_8 
                                        prec_o num_10 prec_i 
                                        num_12 num_13)
             ]
            [ (hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (hexagon_V6_vmpyih_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                     num_3 num_4 num_5 
                                     prec_i_o num_7 num_8 
                                     num_9 num_10)
             ]
            [ (hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (hexagon_V6_vmpyiwh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          size_i_o num_4 num_5 
                                          num_6 num_7 prec_i_o 
                                          num_9 num_10 num_11 
                                          num_12 num_13 num_14 
                                          num_15 num_16 num_17 
                                          num_18)
             ]
            [ (hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (hexagon_V6_vandvnqv_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                       size_i_o num_4 num_5 
                                       num_6 num_7 prec_i_o 
                                       num_9 num_10)
             ]
            [ (hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (hexagon_V6_vlsrh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                    size_i_o num_4 num_5 
                                    num_6 prec_i_o num_8 
                                    num_9 num_10)
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
             (hexagon_V6_vmpabus_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          size_i_o num_4 num_5 
                                          num_6 num_7 num_8 
                                          num_9 num_10 num_11 
                                          num_12 num_13 num_14 
                                          num_15 num_16 num_17 
                                          num_18 num_19 num_20 
                                          num_21 prec_i_o num_23 
                                          num_24 num_25 num_26 
                                          num_27 num_28 num_29 
                                          num_30 num_31 num_32 
                                          num_33 num_34 num_35)
             ]
            [ (hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (hexagon_V6_vmux_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
                                   (hvx:interpret v3 env) size_i_o num_5 
                                   num_6 num_7 prec_i_o 
                                   num_9 num_10 num_11)
             ]
            [ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (hexagon_V6_vnavgw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                     size_i_o num_4 num_5 
                                     num_6 prec_i_o num_8 
                                     num_9 num_10)
             ]
            [ (hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (hexagon_V6_vaslh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                    size_i_o num_4 num_5 
                                    num_6 prec_i_o num_8 
                                    num_9 num_10)
             ]
            [ (hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (hexagon_V6_vandnqrt_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                           (hvx:interpret v3 env) size_i_o num_5 
                                           num_6 num_7 num_8 
                                           prec_i_o num_10 num_11 
                                           num_12)
             ]
            [ (hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vdealb_128B (hvx:interpret v0 env) size_i_o num_2 
                                     num_3 num_4 num_5 
                                     num_6 num_7 prec_i_o 
                                     num_9 num_10 num_11 
                                     num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
             (hexagon_V6_vmpahb_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         size_i_o num_4 num_5 
                                         num_6 num_7 num_8 
                                         num_9 num_10 num_11 
                                         num_12 num_13 num_14 
                                         num_15 num_16 num_17 
                                         num_18 num_19 num_20 
                                         num_21 num_22 num_23 
                                         prec_i_o num_25 num_26 
                                         num_27 num_28 num_29 
                                         num_30 num_31 num_32 
                                         num_33 num_34 num_35 
                                         num_36 num_37 num_38 
                                         num_39)
             ]
            [ (hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (hexagon_V6_vrounduhub_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                         (hvx:interpret vc_3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                         size_i_o num_7 num_8 
                                         num_9 prec_o num_11 
                                         num_12 num_13 prec_i 
                                         num_15 num_16 num_17 
                                         num_18)
             ]
            [ (hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (hexagon_V6_vlsrw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                    size_i_o num_4 num_5 
                                    num_6 prec_i_o num_8)
             ]
            [ (hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (hexagon_V6_vmpyowh_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                      (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                      num_6 num_7 num_8 
                                      num_9 prec_i_o num_11 
                                      num_12 num_13 num_14 
                                      num_15 num_16 num_17 
                                      num_18)
             ]
            [ (hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
             (hexagon_V6_vsathub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      prec_o num_7 num_8 
                                      prec_i num_10 num_11 
                                      num_12)
             ]
            [ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (hexagon_V6_vdmpyhvsat_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                             size_i_o prec_o num_5 
                                             num_6 prec_i num_8 
                                             num_9 num_10 num_11)
             ]
            [ (hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (hexagon_V6_veqw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret vc_2 env) 
                                   (hvx:interpret v3 env) size_i_o num_5 
                                   num_6 num_7 prec_o 
                                   prec_i num_10 num_11)
             ]
            [ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (hexagon_V6_vmpyub_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         size_i_o num_4 num_5 
                                         num_6 num_7 num_8 
                                         num_9 num_10 num_11 
                                         num_12 num_13 num_14 
                                         num_15 num_16 num_17 
                                         prec_i_o num_19 num_20 
                                         num_21 num_22 num_23 
                                         num_24 num_25 num_26 
                                         num_27 num_28)
             ]
            [ (hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (hexagon_V6_vdealb4w_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       num_6 num_7 num_8 
                                       num_9 num_10 num_11 
                                       num_12 num_13 num_14 
                                       prec_i_o num_16 num_17 
                                       num_18 num_19 num_20 
                                       num_21 num_22 num_23 
                                       num_24 num_25 num_26 
                                       num_27 num_28)
             ]
            [ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (hexagon_V6_vrmpybv_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                      size_i_o prec_o num_5 
                                      num_6 prec_i num_8 
                                      num_9 num_10 num_11 
                                      num_12 num_13)
             ]
            [ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (hexagon_V6_vrmpybus_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                           size_i_o prec_o num_5 
                                           num_6 prec_i num_8 
                                           num_9 num_10 num_11 
                                           num_12 num_13)
             ]
            [ (hexagon_V6_vdmpybus_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vdmpybus_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                       size_i prec_o num_5 
                                       num_6 prec_i num_8 
                                       num_9 num_10 num_11 
                                       num_12 num_13 num_14)
             ]
            [ (hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (hexagon_V6_veqh_and_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                       (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                       num_6 num_7 num_8 
                                       prec_i_o num_10 num_11 
                                       num_12)
             ]
            [ (hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (hexagon_V6_vmpyuhe_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      prec_i prec_o num_8 
                                      num_9 num_10 num_11 
                                      num_12)
             ]
            [ (hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (hexagon_V6_vpackoh_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      prec_i_o num_10 num_11 
                                      num_12 num_13 num_14 
                                      num_15 num_16)
             ]
            [ (hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (hexagon_V6_vdmpyhisat_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         size_i prec_o num_5 
                                         num_6 prec_i num_8 
                                         num_9 num_10 num_11 
                                         num_12 num_13 num_14 
                                         num_15)
             ]
            [ (hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (hexagon_V6_vandnqrt_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                       size_i_o num_4 num_5 
                                       num_6 num_7 prec_i_o 
                                       num_9 num_10 num_11)
             ]
            [ (hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (hexagon_V6_vshuffh_128B (hvx:interpret v0 env) size_i_o num_2 
                                      num_3 num_4 prec_i_o 
                                      num_6 num_7 num_8)
             ]
            [ (hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
             (hexagon_V6_vandvrt_acc_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                          (hvx:interpret vc_3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                          size_i_o num_7 num_8 
                                          num_9 prec_o prec_i 
                                          num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (hexagon_V6_vmpabusv_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       num_6 num_7 num_8 
                                       prec_i num_10 num_11 
                                       num_12 num_13 num_14 
                                       num_15 num_16 num_17 
                                       prec_o num_19 num_20 
                                       num_21 num_22 num_23 
                                       num_24 num_25 num_26 
                                       num_27 num_28)
             ]
            [ (hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (hexagon_V6_vor_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                  num_3 num_4 num_5 
                                  prec_i_o num_7)
             ]
            [ (hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
             (hexagon_V6_vasruwuhsat_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          (hvx:interpret v3 env) size_i_o num_5 
                                          num_6 num_7 prec_o 
                                          num_9 num_10 prec_i 
                                          num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (hexagon_V6_vmpyowh_rnd_sacc_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                               (hvx:interpret v3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                               size_i_o num_7 num_8 
                                               num_9 num_10 prec_i_o 
                                               num_12 num_13 num_14 
                                               num_15 num_16 num_17 
                                               num_18 num_19 num_20 
                                               num_21 num_22)
             ]
            [ (hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (hexagon_V6_vaddubh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          size_i_o num_4 num_5 
                                          num_6 num_7 num_8 
                                          num_9 num_10 num_11 
                                          num_12 num_13 num_14 
                                          num_15 prec_i_o num_17 
                                          num_18 num_19 num_20 
                                          num_21 num_22 num_23)
             ]
            [ (hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (hexagon_V6_vroundwuh_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                        (hvx:interpret vc_3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                        size_i_o num_7 num_8 
                                        num_9 prec_o num_11 
                                        num_12 num_13 prec_i 
                                        num_15 num_16 num_17 
                                        num_18)
             ]
            [ (hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vmpyihb_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 prec_i_o num_8 
                                      num_9 num_10 num_11 
                                      num_12 num_13 num_14)
             ]
            [ (hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (hexagon_V6_pred_xor_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_o 
                                       num_3 num_4 num_5 
                                       prec_o num_7)
             ]
            [ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
             (hexagon_V6_vandvrt_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                      (hvx:interpret vc_3 env) (hvx:interpret v4 env) size_i_o 
                                      num_6 num_7 num_8 
                                      prec_o prec_i num_11 
                                      num_12 num_13)
             ]
            [ (hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (hexagon_V6_vasrwh_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                     (hvx:interpret v3 env) size_i_o num_5 
                                     num_6 num_7 prec_o 
                                     num_9 prec_i num_11 
                                     num_12)
             ]
            [ (hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (hexagon_V6_vandvqv_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                      (hvx:interpret vc_3 env) size_i_o num_5 
                                      num_6 num_7 prec_i_o 
                                      num_9 num_10 num_11)
             ]
            [ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (hexagon_V6_vavgwrnd_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                       (hvx:interpret v3 env) size_i_o num_5 
                                       num_6 num_7 prec_i_o 
                                       num_9 num_10 num_11 
                                       num_12)
             ]
            [ (hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (hexagon_V6_vgth_or_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                      (hvx:interpret v3 env) (hvx:interpret v4 env) size_i_o 
                                      num_6 num_7 num_8 
                                      prec_i_o num_10 num_11 
                                      num_12 num_13)
             ]
            [ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (hexagon_V6_vmpyuhe_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          size_i_o num_4 num_5 
                                          num_6 num_7 prec_i_o 
                                          num_9 num_10 num_11 
                                          num_12 num_13 num_14)
             ]
            [ (hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (hexagon_V6_vmaxw_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                    num_3 num_4 num_5 
                                    prec_i_o num_7 num_8)
             ]
            [ (hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (hexagon_V6_vandqrt_acc_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                          (hvx:interpret vc_3 env) (hvx:interpret v4 env) size_i_o 
                                          num_6 num_7 num_8 
                                          prec_i_o num_10 num_11 
                                          num_12 num_13)
             ]
            [ (hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (hexagon_V6_vmpyub_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                     num_3 num_4 num_5 
                                     num_6 num_7 num_8 
                                     prec_i num_10 num_11 
                                     num_12 num_13 num_14 
                                     num_15 prec_o num_17 
                                     num_18 num_19 num_20 
                                     num_21 num_22 num_23 
                                     num_24 num_25)
             ]
            [ (hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (hexagon_V6_pred_and_n_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_o 
                                         num_3 num_4 num_5 
                                         prec_o num_7)
             ]
            [ (hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
             (hexagon_V6_vasruwuhrndsat_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret vc_2 env) 
                                             (hvx:interpret v3 env) (hvx:interpret v4 env) (hvx:interpret v5 env) 
                                             size_i_o num_7 num_8 
                                             num_9 prec_o num_11 
                                             num_12 num_13 prec_i 
                                             num_15 num_16 num_17 
                                             num_18 num_19)
             ]
            [ (hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (hexagon_V6_vaslw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                    size_i_o num_4 num_5 
                                    num_6 prec_i_o num_8)
             ]
            [ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (hexagon_V6_vavguw_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                     size_i_o num_4 num_5 
                                     num_6 prec_i_o num_8 
                                     num_9 num_10)
             ]
            [ (hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
             (hexagon_V6_vasrhubsat_128B (hvx:interpret vc_0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         (hvx:interpret v3 env) size_i_o num_5 
                                         num_6 num_7 prec_o 
                                         num_9 num_10 num_11 
                                         num_12 prec_i num_14 
                                         num_15 num_16 num_17)
             ]
            [ (hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (hexagon_V6_lo_128B (hvx:interpret v0 env) size_i_o num_2 
                                 num_3 num_4 prec_i_o 
                                 num_6 num_7)
             ]
            [ (hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (hexagon_V6_vassign_128B (hvx:interpret v0 env) size_i_o num_2 
                                      num_3 num_4 prec_i_o 
                                      num_6)
             ]
            [ (hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (hexagon_V6_vunpackh_128B (hvx:interpret v0 env) size_i_o num_2 
                                       num_3 num_4 prec_i 
                                       prec_o num_7 num_8 
                                       num_9)
             ]
            [ (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
             (hexagon_V6_vcombine_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                       num_3 num_4 num_5 
                                       num_6 num_7 num_8 
                                       prec_i_o num_10 num_11)
             ]
            [ (hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
             (hexagon_V6_vmpauhb_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                      num_3 num_4 num_5 
                                      num_6 num_7 num_8 
                                      num_9 num_10 num_11 
                                      num_12 num_13 num_14 
                                      num_15 num_16 num_17 
                                      num_18 num_19 num_20 
                                      num_21 prec_o num_23 
                                      num_24 num_25 num_26 
                                      num_27 num_28 num_29 
                                      num_30 num_31 num_32 
                                      prec_i num_34 num_35 
                                      num_36)
             ]
            [ (hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (hexagon_V6_vmpybv_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                         size_i_o num_4 num_5 
                                         num_6 num_7 num_8 
                                         num_9 num_10 num_11 
                                         num_12 num_13 num_14 
                                         num_15 prec_i_o num_17 
                                         num_18 num_19 num_20 
                                         num_21 num_22 num_23)
             ]
            [ (hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (hexagon_V6_vlsrwv_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                     size_i_o num_4 num_5 
                                     num_6 prec_i_o num_8 
                                     num_9)
             ]
            [ (hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (hexagon_V6_vsubhnq_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                      (hvx:interpret vc_3 env) size_i_o num_5 
                                      num_6 num_7 prec_i_o 
                                      num_9 num_10 num_11 
                                      num_12)
             ]
            [ (hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
             (hexagon_V6_vsb_128B (hvx:interpret v0 env) size_i_o num_2 
                                  num_3 num_4 num_5 
                                  num_6 num_7 prec_i 
                                  num_9 num_10 num_11 
                                  prec_o num_13 num_14 
                                  num_15 num_16 num_17)
             ]
            [ (hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (hexagon_V6_vaddbq_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                     (hvx:interpret v3 env) size_i_o num_5 
                                     num_6 num_7 prec_i_o 
                                     num_9 num_10 num_11 
                                     num_12)
             ]
            [ (hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (hexagon_V6_vmpybv_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_i_o 
                                     num_3 num_4 num_5 
                                     num_6 num_7 num_8 
                                     prec_i num_10 num_11 
                                     num_12 num_13 prec_o 
                                     num_15 num_16 num_17 
                                     num_18 num_19 num_20)
             ]
            [ (hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (hexagon_V6_vasrhv_128B (hvx:interpret v0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                     size_i_o num_4 num_5 
                                     num_6 prec_i_o num_8 
                                     num_9)
             ]
            [ (hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (hexagon_V6_vdmpyhsat_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                            size_i prec_o num_5 
                                            num_6 prec_i num_8 
                                            num_9 num_10 num_11)
             ]
            [ (hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (hexagon_V6_vmpyh_acc_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        size_i_o num_4 num_5 
                                        num_6 num_7 num_8 
                                        num_9 num_10 num_11 
                                        num_12 num_13 num_14 
                                        num_15 num_16 prec_i_o 
                                        num_18 num_19 num_20 
                                        num_21 num_22 num_23 
                                        num_24 num_25)
             ]
            [ (hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (hexagon_V6_vnot_128B (hvx:interpret v0 env) size_i_o num_2 
                                   num_3 num_4 prec_i_o 
                                   num_6)
             ]
            [ (hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (hexagon_V6_pred_or_n_128B (hvx:interpret v0 env) (hvx:interpret v1 env) size_o 
                                        num_3 num_4 num_5 
                                        prec_o num_7)
             ]
            [ (hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
             (hexagon_V6_vmpyewuh_64_128B (hvx:interpret vc_0 env) (hvx:interpret vc_1 env) (hvx:interpret v2 env) 
                                          (hvx:interpret v3 env) size_i_o num_5 
                                          num_6 num_7 num_8 
                                          num_9 num_10 num_11 
                                          num_12 num_13 num_14 
                                          num_15 num_16 prec_o 
                                          num_18 num_19 num_20 
                                          num_21 num_22 prec_i 
                                          num_24)
             ]
            [ (hexagon_V6_vshuffvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 size_i num_7 num_8)
             (hexagon_V6_vshuffvdd_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
                                        size_o num_4 num_5 
                                        size_i num_7 num_8)
             ]
[ (hexagon_V6_vdealvdd_128B_dsl v0 v1 v2 size_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(hexagon_V6_vdealvdd_128B (hvx:interpret v0 env) (hvx:interpret v1 env) (hvx:interpret v2 env) 
		 size_o num_4 num_5 
		 num_6 num_7 num_8 
		 num_9 num_10 num_11 
		 num_12 num_13 num_14 
		 num_15 num_16 num_17 
		 num_18)
	]

            [v (error "Unrecognized Term in Interpreter" v)]
            )
  )
;; ================================================================================
