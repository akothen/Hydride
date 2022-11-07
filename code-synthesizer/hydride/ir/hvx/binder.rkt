#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)

(require hydride/ir/hvx/semantics)
(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/length)


(provide (all-defined-out))



;; ================================================================================
;;                                DSL Binder
;; ================================================================================
(define (hvx:bind-expr prog env)
  (destruct prog
            [(dim-x id) (dim-x id)]
            [(dim-y id) (dim-y id)]
            [(idx-i id) (idx-i id)]
            [(idx-j id) (idx-j id)]
            [(reg id) (vector-ref-bv env id)]
            [(lit v) (lit v)]
            [(nop v1) (nop (hvx:bind-expr v1 env))]
            [(idx-add i1 i2) (idx-add i1 i2)]
            [(idx-mul i1 i2) (idx-mul i1 i2)]
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (vector-two-input-swizzle_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                           (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env) (hvx:bind-expr lane_size env) 
                                           (hvx:bind-expr num_6 env) (hvx:bind-expr num_7 env) (hvx:bind-expr num_8 env))
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (interleave-vectors_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr size_i_o env) 
                                     (hvx:bind-expr prec_i_o env))
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (interleave-vector_dsl (hvx:bind-expr v0 env) (hvx:bind-expr size_i_o env) (hvx:bind-expr prec_i_o env))
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (deinterleave-vector_dsl (hvx:bind-expr v0 env) (hvx:bind-expr size_i_o env) (hvx:bind-expr prec_i_o env))
             ]
            [ (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (llvm:shuffle-vectors_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                       (hvx:bind-expr prec_i_o env) (hvx:bind-expr v4 env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vrmpybv_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vrmpybv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpybusv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6)
             (hexagon_V6_vmpybusv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                           (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vrmpyubv_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vrmpyubv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpyowh_128B_dsl v0 v1)
             (hexagon_V6_vmpyowh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_lvsplatw_128B_dsl v0)
             (hexagon_V6_lvsplatw_128B_dsl (hvx:bind-expr v0 env))
             ]
            [ (hexagon_V6_vsubbnq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (hexagon_V6_vsubbnq_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                          (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env))
             ]
            [ (hexagon_V6_veqh_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_veqh_xor_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                           (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vrmpyub_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vrmpyub_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vaddhsat_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vaddhsat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vaddhw_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (hexagon_V6_vaddhw_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                             (hvx:bind-expr lane_size env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                             (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vzb_128B_dsl v0 lane_size num_2 prec_i prec_o num_5)
             (hexagon_V6_vzb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr lane_size env) (hvx:bind-expr num_2 env) 
                                      (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vmaxw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_pred_or_n_128B_dsl v0 v1)
             (hexagon_V6_pred_or_n_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_veqw_and_128B_dsl vc_0 vc_1 v2 v3 v4 prec_i_o num_6)
             (hexagon_V6_veqw_and_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                           (hvx:bind-expr v3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vpackhub_sat_128B_dsl v0 v1)
             (hexagon_V6_vpackhub_sat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vavguwrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (hexagon_V6_vavguwrnd_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                            (hvx:bind-expr v3 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyhv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (hexagon_V6_vmpyhv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                             (hvx:bind-expr lane_size env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                             (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
             (hexagon_V6_vunpackob_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                            (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (hexagon_V6_vmpybusv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                               (hvx:bind-expr lane_size env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                               (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vdmpyhisat_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpyhisat_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vassign_128B_dsl v0)
             (hexagon_V6_vassign_128B_dsl (hvx:bind-expr v0 env))
             ]
            [ (hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (hexagon_V6_vaddwq_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                         (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env))
             ]
            [ (hexagon_V6_vaddhw_128B_dsl v0 v1)
             (hexagon_V6_vaddhw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vgtuh_xor_128B_dsl v0 vc_1 v2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_vgtuh_xor_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                            (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                            (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_lvsplath_128B_dsl v0 prec_o)
             (hexagon_V6_lvsplath_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_vmux_128B_dsl v0 v1 v2)
             (hexagon_V6_vmux_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vdealb4w_128B_dsl v0 v1)
             (hexagon_V6_vdealb4w_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vrmpyubv_128B_dsl v0 v1)
             (hexagon_V6_vrmpyubv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vshuffb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (hexagon_V6_vshuffb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr lane_size env) (hvx:bind-expr num_2 env) 
                                          (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
             (hexagon_V6_vmpyiewuh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
             (hexagon_V6_vshufeh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env) 
                                          (hvx:bind-expr num_3 env))
             ]
            [ (hexagon_V6_vsubw_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vsubw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_pred_not_128B_dsl v0 num_1 prec_o)
             (hexagon_V6_pred_not_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr num_1 env) (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_vmpybv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6)
             (hexagon_V6_vmpybv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                         (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) 
                                         (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vmaxub_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vmaxub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpabus_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vswap_128B_dsl v0 v1 v2)
             (hexagon_V6_vswap_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vadduwsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vadduwsat_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                               (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vgtuw_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_vgtuw_or_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                           (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vmpauhb_128B_dsl v0 v1)
             (hexagon_V6_vmpauhb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (hexagon_V6_vavgwrnd_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                           (hvx:bind-expr v3 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vsububsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vsububsat_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                               (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vmpabuu_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpabuu_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vminuh_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vminuh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vrmpybv_128B_dsl v0 v1)
             (hexagon_V6_vrmpybv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpyub_128B_dsl v0 v1)
             (hexagon_V6_vmpyub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_veqb_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (hexagon_V6_veqb_or_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                          (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_o env) 
                                          (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vmpyiwub_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyiwub_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpyiwub_128B_dsl v0 v1)
             (hexagon_V6_vmpyiwub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vsubuhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6)
             (hexagon_V6_vsubuhw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                          (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) 
                                          (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyuhe_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpyhvsat_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vgtb_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (hexagon_V6_vgtb_or_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                          (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_o env) 
                                          (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vpackwh_sat_128B_dsl v0 v1)
             (hexagon_V6_vpackwh_sat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vrmpybusv_128B_dsl v0 v1)
             (hexagon_V6_vrmpybusv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vabsdiffw_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vabsdiffw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyihb_acc_128B_dsl v0 v1 v2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (hexagon_V6_vmpyihb_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                              (hvx:bind-expr num_3 env) (hvx:bind-expr num_4 env) (hvx:bind-expr prec_i_o env) 
                                              (hvx:bind-expr num_6 env) (hvx:bind-expr num_7 env) (hvx:bind-expr num_8 env))
             ]
            [ (hexagon_V6_vmpyiewuh_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyiewuh_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
             (hexagon_V6_vshuffob_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_3 env))
             ]
            [ (hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (hexagon_V6_vdealb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr lane_size env) (hvx:bind-expr num_2 env) 
                                         (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpybus_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vdmpyhsat_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpyhsat_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpabuu_128B_dsl v0 v1)
             (hexagon_V6_vmpabuu_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vrmpybus_128B_dsl v0 v1)
             (hexagon_V6_vrmpybus_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpyubv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6)
             (hexagon_V6_vmpyubv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                          (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) 
                                          (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpauhb_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vgtuh_128B_dsl vc_0 vc_1 v2 v3 prec_o prec_i)
             (hexagon_V6_vgtuh_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                        (hvx:bind-expr v3 env) (hvx:bind-expr prec_o env) (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vmpyih_128B_dsl v0 v1)
             (hexagon_V6_vmpyih_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vnavgub_128B_dsl v0 v1)
             (hexagon_V6_vnavgub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vpackeh_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
             (hexagon_V6_vpackeh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                          (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                          (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vgth_xor_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_vgth_xor_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr vc_2 env) 
                                           (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vsubb_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vsubb_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                           (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vmpyuhe_128B_dsl v0 v1)
             (hexagon_V6_vmpyuhe_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vinsertwr_128B_dsl v0)
             (hexagon_V6_vinsertwr_128B_dsl (hvx:bind-expr v0 env))
             ]
            [ (hexagon_V6_vgtuw_and_128B_dsl v0 v1 vc_2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_vgtuw_and_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr vc_2 env) 
                                            (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                            (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vrmpybus_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vaddwsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vaddwsat_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                              (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vgth_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (hexagon_V6_vgth_and_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                           (hvx:bind-expr vc_3 env) (hvx:bind-expr v4 env) (hvx:bind-expr prec_i_o env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vandqrt_128B_dsl v0 v1)
             (hexagon_V6_vandqrt_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vand_128B_dsl v0 v1 num_2 prec_i_o)
             (hexagon_V6_vand_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                       (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_veqw_128B_dsl v0 vc_1 v2 vc_3 prec_o prec_i)
             (hexagon_V6_veqw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr vc_1 env) (hvx:bind-expr v2 env) 
                                       (hvx:bind-expr vc_3 env) (hvx:bind-expr prec_o env) (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vmpyh_128B_dsl v0 v1)
             (hexagon_V6_vmpyh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyub_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vaddb_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vaddb_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                           (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vsubbsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5)
             (hexagon_V6_vsubbsat_dv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                              (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vdmpybus_128B_dsl v0 v1)
             (hexagon_V6_vdmpybus_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpyewuh_128B_dsl v0 v1)
             (hexagon_V6_vmpyewuh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vandvrt_128B_dsl v0 v1)
             (hexagon_V6_vandvrt_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vabsw_sat_128B_dsl v0 prec_i_o)
             (hexagon_V6_vabsw_sat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vminh_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vminh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vaddh_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vaddh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vrmpybusv_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vrmpybusv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpyieoh_128B_dsl v0 v1)
             (hexagon_V6_vmpyieoh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vsh_128B_dsl v0 lane_size num_2 prec_i prec_o num_5)
             (hexagon_V6_vsh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr lane_size env) (hvx:bind-expr num_2 env) 
                                      (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) (hvx:bind-expr num_5 env))
             ]
            [ (hexagon_V6_vsatuwuh_128B_dsl v0 v1 prec_o num_3 prec_i)
             (hexagon_V6_vsatuwuh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_o env) 
                                           (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vmpyuhv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (hexagon_V6_vmpyuhv_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                              (hvx:bind-expr lane_size env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                              (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 prec_i_o)
             (hexagon_V6_vavguw_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                         (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyhsat_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vnavgb_128B_dsl vc_0 v1 v2 prec_i_o)
             (hexagon_V6_vnavgb_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                         (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyh_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vsubhsat_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vsubhsat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyuh_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyuh_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vandvrt_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vmpyowh_sacc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyowh_sacc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1)
             (hexagon_V6_vpackwuh_sat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vandvnqv_128B_dsl v0 v1)
             (hexagon_V6_vandvnqv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpyhsusat_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vdmpyhsuisat_128B_dsl vc_0 v1 v2)
             (hexagon_V6_vdmpyhsuisat_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpyhb_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vavgh_128B_dsl vc_0 v1 v2 prec_i_o)
             (hexagon_V6_vavgh_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                        (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vshufoeh_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (hexagon_V6_vshufoeh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                           (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env) 
                                           (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vdmpyhb_128B_dsl v0 v1)
             (hexagon_V6_vdmpyhb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpabuuv_128B_dsl v0 v1)
             (hexagon_V6_vmpabuuv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vandnqrt_128B_dsl v0 v1)
             (hexagon_V6_vandnqrt_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vpackhb_sat_128B_dsl v0 v1)
             (hexagon_V6_vpackhb_sat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_pred_and_n_128B_dsl v0 v1)
             (hexagon_V6_pred_and_n_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vsububsat_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vsububsat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vmpyiowh_128B_dsl v0 v1)
             (hexagon_V6_vmpyiowh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vandvqv_128B_dsl v0 v1)
             (hexagon_V6_vandvqv_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vandnqrt_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vsubhw_128B_dsl v0 v1)
             (hexagon_V6_vsubhw_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vadduwsat_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vadduwsat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_pred_or_128B_dsl v0 v1 num_2 prec_o)
             (hexagon_V6_pred_or_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                          (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
             (hexagon_V6_pred_xor_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                           (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_vaddubh_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6)
             (hexagon_V6_vaddubh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr lane_size env) 
                                          (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env) 
                                          (hvx:bind-expr num_6 env))
             ]
            [ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vmpyih_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
             (hexagon_V6_vabsdiffub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr prec_i_o env))
             ]
            [ (hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vandqrt_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vrmpyub_128B_dsl v0 v1)
             (hexagon_V6_vrmpyub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpybus_128B_dsl v0 v1)
             (hexagon_V6_vmpybus_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpabus_128B_dsl v0 v1)
             (hexagon_V6_vmpabus_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vpackob_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
             (hexagon_V6_vpackob_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                          (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_4 env) (hvx:bind-expr num_5 env) 
                                          (hvx:bind-expr num_6 env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
             (hexagon_V6_vaddcarrysat_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vcombine_128B_dsl v0 v1)
             (hexagon_V6_vcombine_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vgtw_128B_dsl vc_0 v1 v2 vc_3 prec_o prec_i)
             (hexagon_V6_vgtw_128B_dsl (hvx:bind-expr vc_0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env) 
                                       (hvx:bind-expr vc_3 env) (hvx:bind-expr prec_o env) (hvx:bind-expr prec_i env))
             ]
            [ (hexagon_V6_vunpackub_128B_dsl v0 prec_i prec_o)
             (hexagon_V6_vunpackub_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_vunpackh_128B_dsl v0 prec_i prec_o)
             (hexagon_V6_vunpackh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr prec_i env) (hvx:bind-expr prec_o env))
             ]
            [ (hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
             (hexagon_V6_vdmpybus_acc_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr v2 env))
             ]
            [ (hexagon_V6_vsatwh_128B_dsl v0 v1)
             (hexagon_V6_vsatwh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [ (hexagon_V6_vmpyiwb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7)
             (hexagon_V6_vmpyiwb_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env) (hvx:bind-expr num_2 env) 
                                          (hvx:bind-expr num_3 env) (hvx:bind-expr prec_i_o env) (hvx:bind-expr num_5 env) 
                                          (hvx:bind-expr num_6 env) (hvx:bind-expr num_7 env))
             ]
            [ (hexagon_V6_vmpyuh_128B_dsl v0 v1)
             (hexagon_V6_vmpyuh_128B_dsl (hvx:bind-expr v0 env) (hvx:bind-expr v1 env))
             ]
            [v v]
            )
  )
;; ================================================================================
