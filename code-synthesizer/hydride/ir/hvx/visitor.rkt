#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))


;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (hvx:visitor prog fn)
  (destruct prog
            [(dim-x id) (fn prog)]
            [(dim-y id) (fn prog)]
            [(idx-i id) (fn prog)]
            [(idx-j id) (fn prog)]
            [(reg id) (fn prog) ]
            [(lit v) (fn prog)]
            [(nop v1) (hvx:visitor v1 fn)]
            [(idx-add i1 i2) (fn prog) ]
            [(idx-mul i1 i2) (fn prog) ]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 lane_size num_6 num_7 num_8 ))
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
             ]
            [ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( llvm:shuffle-vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
             ]
            [ (hexagon_V6_vpackwh_sat_128B_dsl v0 v1 num_2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vpackwh_sat_128B_dsl v0-visited v1-visited num_2 num_3 ))
             ]
            [ (hexagon_V6_vmpyowh_sacc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyowh_sacc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vgtb_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtb_and_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_o prec_i ))
             ]
            [ (hexagon_V6_vgtuw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtuw_xor_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_pred_xor_128B_dsl v0-visited v1-visited num_2 prec_o ))
             ]
            [ (hexagon_V6_vdmpyhb_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vdmpyhb_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vassign_128B_dsl v0 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vassign_128B_dsl v0-visited prec_i_o ))
             ]
            [ (hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyowh_rnd_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpyuhv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyuhv_acc_128B_dsl v0-visited v1-visited v2-visited lane_size num_4 num_5 prec_i_o num_7 num_8 num_9 ))
             ]
            [ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_pred_or_n_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyhsat_acc_128B_dsl v0-visited v1-visited v2-visited num_3 num_4 num_5 ))
             ]
            [ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vunpackoh_128B_dsl vc_0-visited v1-visited v2-visited num_3 prec_i_o ))
             ]
            [ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyuhe_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vandvnqv_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vpackeb_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vpackeb_128B_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 ))
             ]
            [ (hexagon_V6_veqh_128B_dsl v0 v1 vc_2 vc_3 prec_o prec_i)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define vc_2-visited (hvx:visitor vc_2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (fn ( hexagon_V6_veqh_128B_dsl v0-visited v1-visited vc_2-visited vc_3-visited prec_o prec_i ))
             ]
            [ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_pred_and_n_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyuhe_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vsb_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vsb_128B_dsl v0-visited lane_size num_2 prec_i prec_o num_5 num_6 ))
             ]
            [ (hexagon_V6_vminub_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vminub_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_vmpybusv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpybusv_128B_dsl v0-visited v1-visited lane_size num_3 prec_i prec_o num_6 num_7 num_8 ))
             ]
            [ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vdealb4w_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vavgb_128B_dsl vc_0 v1 v2 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vavgb_128B_dsl vc_0-visited v1-visited v2-visited prec_i_o ))
             ]
            [ (hexagon_V6_vgtw_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtw_or_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vabsb_128B_dsl v0 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vabsb_128B_dsl v0-visited prec_i_o ))
             ]
            [ (hexagon_V6_veqw_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_veqw_or_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyih_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vmpyihb_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyihb_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vgtuh_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtuh_or_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vpackhb_sat_128B_dsl v0 v1 num_2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vpackhb_sat_128B_dsl v0-visited v1-visited num_2 num_3 ))
             ]
            [ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vaddcarrysat_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vcombine_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vcombine_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vgtub_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtub_and_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_o prec_i ))
             ]
            [ (hexagon_V6_vsatuwuh_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vsatuwuh_128B_dsl v0-visited v1-visited prec_o num_3 num_4 prec_i num_6 ))
             ]
            [ (hexagon_V6_lo_128B_dsl v0)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_lo_128B_dsl v0-visited ))
             ]
            [ (hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmaxuh_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_pred_and_128B_dsl v0 v1 num_2 prec_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_pred_and_128B_dsl v0-visited v1-visited num_2 prec_o ))
             ]
            [ (hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmaxw_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_vpackob_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vpackob_128B_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 ))
             ]
            [ (hexagon_V6_vgtub_128B_dsl v0 vc_1 vc_2 v3 prec_o prec_i)
             (define v0-visited (hvx:visitor v0 fn))
             (define vc_1-visited (hvx:visitor vc_1 fn))
             (define vc_2-visited (hvx:visitor vc_2 fn))
             (define v3-visited (hvx:visitor v3 fn))
             (fn ( hexagon_V6_vgtub_128B_dsl v0-visited vc_1-visited vc_2-visited v3-visited prec_o prec_i ))
             ]
            [ (hexagon_V6_vmpyuh_128B_dsl v0 v1 num_2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyuh_128B_dsl v0-visited v1-visited num_2 num_3 ))
             ]
            [ (hexagon_V6_vdmpyhsuisat_128B_dsl vc_0 v1 v2 num_3)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vdmpyhsuisat_128B_dsl vc_0-visited v1-visited v2-visited num_3 ))
             ]
            [ (hexagon_V6_vsubuhsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vsubuhsat_dv_128B_dsl v0-visited v1-visited lane_size num_3 prec_i_o num_5 num_6 ))
             ]
            [ (hexagon_V6_veqh_xor_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define vc_2-visited (hvx:visitor vc_2 fn))
             (define v3-visited (hvx:visitor v3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_veqh_xor_128B_dsl vc_0-visited v1-visited vc_2-visited v3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vgth_128B_dsl v0 vc_1 v2 vc_3 prec_o prec_i)
             (define v0-visited (hvx:visitor v0 fn))
             (define vc_1-visited (hvx:visitor vc_1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (fn ( hexagon_V6_vgth_128B_dsl v0-visited vc_1-visited v2-visited vc_3-visited prec_o prec_i ))
             ]
            [ (hexagon_V6_vandvrt_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vandvrt_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vnavgub_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vnavgub_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vaddububb_sat_128B_dsl v0-visited v1-visited prec_i_o num_3 ))
             ]
            [ (hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vshuffob_128B_dsl v0-visited v1-visited prec_i_o num_3 ))
             ]
            [ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vandvrt_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vandqrt_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vandqrt_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyiewuh_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vdmpybus_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vdmpybus_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 num_3 num_4)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpabus_acc_128B_dsl v0-visited v1-visited v2-visited num_3 num_4 ))
             ]
            [ (hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpauhb_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vmpyihb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyihb_128B_dsl v0-visited v1-visited num_2 num_3 prec_i_o num_5 num_6 num_7 num_8 ))
             ]
            [ (hexagon_V6_vsububsat_128B_dsl v0 v1 prec_i_o num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vsububsat_128B_dsl v0-visited v1-visited prec_i_o num_3 ))
             ]
            [ (hexagon_V6_veqh_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define vc_3-visited (hvx:visitor vc_3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_veqh_and_128B_dsl vc_0-visited v1-visited v2-visited vc_3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vmpyih_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyih_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vandnqrt_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpybus_acc_128B_dsl v0-visited v1-visited v2-visited num_3 ))
             ]
            [ (hexagon_V6_vmpybus_128B_dsl v0 v1 num_2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpybus_128B_dsl v0-visited v1-visited num_2 ))
             ]
            [ (hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vshuffh_128B_dsl v0-visited lane_size num_2 prec_i_o num_4 num_5 ))
             ]
            [ (hexagon_V6_vrmpyub_128B_dsl v0 v1 num_2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vrmpyub_128B_dsl v0-visited v1-visited num_2 num_3 ))
             ]
            [ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmux_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vdmpyhvsat_128B_dsl vc_0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyiowh_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_lvsplatw_128B_dsl v0)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_lvsplatw_128B_dsl v0-visited ))
             ]
            [ (hexagon_V6_vgtw_xor_128B_dsl v0 vc_1 vc_2 v3 v4 prec_i_o num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define vc_1-visited (hvx:visitor vc_1 fn))
             (define vc_2-visited (hvx:visitor vc_2 fn))
             (define v3-visited (hvx:visitor v3 fn))
             (define v4-visited (hvx:visitor v4 fn))
             (fn ( hexagon_V6_vgtw_xor_128B_dsl v0-visited vc_1-visited vc_2-visited v3-visited v4-visited prec_i_o num_6 ))
             ]
            [ (hexagon_V6_vsubwq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vsubwq_128B_dsl v0-visited v1-visited v2-visited prec_i_o num_4 ))
             ]
            [ (hexagon_V6_vminh_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vminh_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyieoh_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vaddwq_128B_dsl v0-visited v1-visited v2-visited prec_i_o num_4 ))
             ]
            [ (hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vdmpyhb_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vabsdiffh_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vandnqrt_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6 num_7)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyiwb_acc_128B_dsl v0-visited v1-visited v2-visited num_3 num_4 num_5 num_6 num_7 ))
             ]
            [ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define vc_1-visited (hvx:visitor vc_1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define v3-visited (hvx:visitor v3 fn))
             (fn ( hexagon_V6_vavgwrnd_128B_dsl vc_0-visited vc_1-visited v2-visited v3-visited prec_i_o ))
             ]
            [ (hexagon_V6_vandvqv_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vandvqv_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vmpauhb_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpauhb_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vaddbsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vaddbsat_dv_128B_dsl v0-visited v1-visited lane_size num_3 prec_i_o num_5 num_6 ))
             ]
            [ (hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vaddubh_acc_128B_dsl v0-visited v1-visited v2-visited lane_size num_4 num_5 prec_i_o num_7 ))
             ]
            [ (hexagon_V6_vsububh_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vsububh_128B_dsl v0-visited v1-visited lane_size num_3 prec_i prec_o num_6 num_7 ))
             ]
            [ (hexagon_V6_vmpabusv_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpabusv_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vnavgw_128B_dsl vc_0-visited v1-visited v2-visited prec_i_o ))
             ]
            [ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vdmpybus_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vrmpyubv_128B_dsl v0 v1 num_2 num_3 num_4)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vrmpyubv_128B_dsl v0-visited v1-visited num_2 num_3 num_4 ))
             ]
            [ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vdealb_128B_dsl v0-visited lane_size num_2 prec_i_o num_4 num_5 ))
             ]
            [ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpyewuh_128B_dsl v0-visited v1-visited ))
             ]
            [ (hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define vc_1-visited (hvx:visitor vc_1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (define v3-visited (hvx:visitor v3 fn))
             (fn ( hexagon_V6_vavguhrnd_128B_dsl vc_0-visited vc_1-visited v2-visited v3-visited prec_i_o ))
             ]
            [ (hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vdmpyhsusat_acc_128B_dsl v0-visited v1-visited v2-visited num_3 ))
             ]
            [ (hexagon_V6_lvsplath_128B_dsl v0 prec_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_lvsplath_128B_dsl v0-visited prec_o ))
             ]
            [ (hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vnot_128B_dsl v0-visited num_1 prec_i_o ))
             ]
            [ (hexagon_V6_pred_or_128B_dsl v0 v1 num_2 prec_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_pred_or_128B_dsl v0-visited v1-visited num_2 prec_o ))
             ]
            [ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vandqrt_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vabsdiffub_128B_dsl v0-visited v1-visited prec_i_o ))
             ]
            [ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vswap_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vaddhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vaddhw_128B_dsl v0-visited v1-visited lane_size num_3 prec_i prec_o num_6 num_7 ))
             ]
            [ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 prec_i_o)
             (define vc_0-visited (hvx:visitor vc_0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vavguw_128B_dsl vc_0-visited v1-visited v2-visited prec_i_o ))
             ]
            [ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vmpyiewh_acc_128B_dsl v0-visited v1-visited v2-visited ))
             ]
            [ (hexagon_V6_vunpackuh_128B_dsl v0 prec_i prec_o num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vunpackuh_128B_dsl v0-visited prec_i prec_o num_3 ))
             ]
            [ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vrmpybus_acc_128B_dsl v0-visited v1-visited v2-visited num_3 num_4 ))
             ]
            [ (hexagon_V6_vrmpybv_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (define v2-visited (hvx:visitor v2 fn))
             (fn ( hexagon_V6_vrmpybv_acc_128B_dsl v0-visited v1-visited v2-visited num_3 num_4 num_5 ))
             ]
            [ (hexagon_V6_vshufoeb_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vshufoeb_128B_dsl v0-visited v1-visited lane_size num_3 prec_i_o num_5 num_6 ))
             ]
            [ (hexagon_V6_vinsertwr_128B_dsl v0)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vinsertwr_128B_dsl v0-visited ))
             ]
            [ (hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vshufeh_128B_dsl v0-visited v1-visited prec_i_o num_3 ))
             ]
            [ (hexagon_V6_vmpabuu_128B_dsl v0 v1 num_2 num_3)
             (define v0-visited (hvx:visitor v0 fn))
             (define v1-visited (hvx:visitor v1 fn))
             (fn ( hexagon_V6_vmpabuu_128B_dsl v0-visited v1-visited num_2 num_3 ))
             ]
            [ (hexagon_V6_vabsh_sat_128B_dsl v0 prec_i_o)
             (define v0-visited (hvx:visitor v0 fn))
             (fn ( hexagon_V6_vabsh_sat_128B_dsl v0-visited prec_i_o ))
             ]
            [_ (error "Unrecognized expression")]
            )
  )
;; ================================================================================
