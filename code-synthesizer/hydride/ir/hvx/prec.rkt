#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)

(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))


;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (hvx:get-prec prog env)
  (destruct prog
            [(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
            [(lit v) (bvlength v)]
            [(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) num_2]
            [(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
            [(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
            [(hexagon_V6_vpackwh_sat_128B_dsl v0 v1 num_2 num_3)
             (cond 
               [(and  (equal? num_2 1) (equal? num_3 1)) 16]
               [(and  (equal? num_2 0) (equal? num_3 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyowh_sacc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vgtb_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (cond 
               [(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
               [(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
               [(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
               )

             ]
            [(hexagon_V6_vgtuw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               )

             ]
            [(hexagon_V6_pred_xor_128B_dsl v0 v1 num_2 prec_o)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_o 1)) 1]
               [(and  (equal? num_2 1024) (equal? prec_o 16)) 16]
               )

             ]
            [(hexagon_V6_vdmpyhb_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vassign_128B_dsl v0 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]
            [(hexagon_V6_vmpyowh_rnd_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vmpyuhv_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64)) 32]
               [(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 128)) 16]
               [(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128)) 16]
               [(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 128)) 16]
               [(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 64)) 32]
               [(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64)) 32]
               )

             ]
            [(hexagon_V6_pred_or_n_128B_dsl v0 v1)
             (cond 
               [(and ) 1]
               )

             ]
            [(hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
             (cond 
               [(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1)) 32]
               [(and  (equal? num_3 -1) (equal? num_4 1) (equal? num_5 1)) 32]
               [(and  (equal? num_3 -1) (equal? num_4 0) (equal? num_5 0)) 32]
               )

             ]
            [(hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 num_3 prec_i_o)
             (cond 
               [(and  (equal? num_3 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 8) (equal? prec_i_o 16)) 16]
               )

             ]
            [(hexagon_V6_vmpyuhe_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vandvnqv_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vpackeb_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 64) (equal? num_6 8)) 8]
               [(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32) (equal? num_6 16)) 16]
               )

             ]
            [(hexagon_V6_veqh_128B_dsl v0 v1 vc_2 vc_3 prec_o prec_i)
             (cond 
               [(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
               [(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
               [(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
               )

             ]
            [(hexagon_V6_pred_and_n_128B_dsl v0 v1)
             (cond 
               [(and ) 1]
               )

             ]
            [(hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vsb_128B_dsl v0 lane_size num_2 prec_i prec_o num_5 num_6)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_2 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_5 128) (equal? num_6 1)) 16]
               [(and  (equal? lane_size 32) (equal? num_2 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_5 128) (equal? num_6 0)) 16]
               [(and  (equal? lane_size 64) (equal? num_2 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_5 64) (equal? num_6 1)) 32]
               [(and  (equal? lane_size 64) (equal? num_2 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               )

             ]
            [(hexagon_V6_vminub_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               )

             ]
            [(hexagon_V6_vmpybusv_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 1) (equal? num_8 0)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0) (equal? num_8 1)) 32]
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 1) (equal? num_8 1)) 16]
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1) (equal? num_8 1)) 32]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(hexagon_V6_vdealb4w_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vavgb_128B_dsl vc_0 v1 v2 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(hexagon_V6_vgtw_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               )

             ]
            [(hexagon_V6_vabsb_128B_dsl v0 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(hexagon_V6_veqw_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               )

             ]
            [(hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vmpyihb_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vgtuh_or_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               )

             ]
            [(hexagon_V6_vpackhb_sat_128B_dsl v0 v1 num_2 num_3)
             (cond 
               [(and  (equal? num_2 1) (equal? num_3 1)) 8]
               [(and  (equal? num_2 0) (equal? num_3 0)) 8]
               )

             ]
            [(hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vcombine_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vgtub_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_o prec_i)
             (cond 
               [(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
               [(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
               [(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
               )

             ]
            [(hexagon_V6_vsatuwuh_128B_dsl v0 v1 prec_o num_3 num_4 prec_i num_6)
             (cond 
               [(and  (equal? prec_o 16) (equal? num_3 16) (equal? num_4 0) (equal? prec_i 32) (equal? num_6 0)) 16]
               [(and  (equal? prec_o 8) (equal? num_3 8) (equal? num_4 0) (equal? prec_i 16) (equal? num_6 0)) 8]
               [(and  (equal? prec_o 16) (equal? num_3 16) (equal? num_4 1) (equal? prec_i 32) (equal? num_6 1)) 16]
               )

             ]
            [(hexagon_V6_lo_128B_dsl v0)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vmaxuh_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]
            [(hexagon_V6_pred_and_128B_dsl v0 v1 num_2 prec_o)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_o 1)) 1]
               [(and  (equal? num_2 1024) (equal? prec_o 16)) 16]
               )

             ]
            [(hexagon_V6_vmaxw_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]
            [(hexagon_V6_vpackob_128B_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 64) (equal? num_6 8) (equal? num_7 8)) 8]
               [(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32) (equal? num_6 16) (equal? num_7 16)) 16]
               )

             ]
            [(hexagon_V6_vgtub_128B_dsl v0 vc_1 vc_2 v3 prec_o prec_i)
             (cond 
               [(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
               [(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
               [(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
               )

             ]
            [(hexagon_V6_vmpyuh_128B_dsl v0 v1 num_2 num_3)
             (cond 
               [(and  (equal? num_2 0) (equal? num_3 0)) 32]
               [(and  (equal? num_2 1) (equal? num_3 1)) 32]
               )

             ]
            [(hexagon_V6_vdmpyhsuisat_128B_dsl vc_0 v1 v2 num_3)
             (cond 
               [(and  (equal? num_3 0)) 32]
               [(and  (equal? num_3 1)) 32]
               [(and  (equal? num_3 1)) 32]
               [(and  (equal? num_3 0)) 32]
               )

             ]
            [(hexagon_V6_vsubuhsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 1) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 -1) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 32)) 32]
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 -1) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 -1) (equal? num_6 32)) 32]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 32)) 32]
               )

             ]
            [(hexagon_V6_veqh_xor_128B_dsl vc_0 v1 vc_2 v3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               )

             ]
            [(hexagon_V6_vgth_128B_dsl v0 vc_1 v2 vc_3 prec_o prec_i)
             (cond 
               [(and  (equal? prec_o 2) (equal? prec_i 16)) 2]
               [(and  (equal? prec_o 4) (equal? prec_i 32)) 4]
               [(and  (equal? prec_o 1) (equal? prec_i 8)) 1]
               )

             ]
            [(hexagon_V6_vandvrt_128B_dsl v0 v1)
             (cond 
               [(and ) 1]
               )

             ]
            [(hexagon_V6_vnavgub_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vaddububb_sat_128B_dsl v0 v1 prec_i_o num_3)
             (cond 
               [(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_3 0)) 16]
               [(and  (equal? prec_i_o 32) (equal? num_3 -1)) 32]
               [(and  (equal? prec_i_o 8) (equal? num_3 -1)) 8]
               [(and  (equal? prec_i_o 32) (equal? num_3 1)) 32]
               [(and  (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_3 1)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_3 1)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_3 -1)) 16]
               )

             ]
            [(hexagon_V6_vshuffob_128B_dsl v0 v1 prec_i_o num_3)
             (cond 
               [(and  (equal? prec_i_o 8) (equal? num_3 8)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_3 16)) 16]
               )

             ]
            [(hexagon_V6_vandvrt_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 1]
               )

             ]
            [(hexagon_V6_vandqrt_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vmpyiewuh_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vdmpybus_128B_dsl v0 v1)
             (cond 
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 num_3 num_4)
             (cond 
               [(and  (equal? num_3 1) (equal? num_4 1)) 16]
               [(and  (equal? num_3 0) (equal? num_4 0)) 16]
               )

             ]
            [(hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vmpyihb_128B_dsl v0 v1 num_2 num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? num_2 512) (equal? num_3 8) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 32) (equal? num_7 4) (equal? num_8 8)) 16]
               [(and  (equal? num_2 256) (equal? num_3 8) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 64) (equal? num_7 4) (equal? num_8 8)) 32]
               [(and  (equal? num_2 512) (equal? num_3 16) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 64) (equal? num_7 2) (equal? num_8 16)) 32]
               [(and  (equal? num_2 256) (equal? num_3 8) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 4) (equal? num_8 8)) 32]
               )

             ]
            [(hexagon_V6_vsububsat_128B_dsl v0 v1 prec_i_o num_3)
             (cond 
               [(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_3 -1)) 16]
               [(and  (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? prec_i_o 32) (equal? num_3 -1)) 32]
               [(and  (equal? prec_i_o 16) (equal? num_3 0)) 16]
               [(and  (equal? prec_i_o 32) (equal? num_3 1)) 32]
               [(and  (equal? prec_i_o 16) (equal? num_3 1)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_3 1)) 8]
               [(and  (equal? prec_i_o 8) (equal? num_3 0)) 8]
               [(and  (equal? prec_i_o 8) (equal? num_3 -1)) 8]
               )

             ]
            [(hexagon_V6_veqh_and_128B_dsl vc_0 v1 v2 vc_3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               )

             ]
            [(hexagon_V6_vmpyih_128B_dsl v0 v1)
             (cond 
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vandnqrt_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vmpybus_acc_128B_dsl v0 v1 v2 num_3)
             (cond 
               [(and  (equal? num_3 1)) 16]
               [(and  (equal? num_3 0)) 16]
               )

             ]
            [(hexagon_V6_vmpybus_128B_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 1)) 16]
               [(and  (equal? num_2 0)) 16]
               )

             ]
            [(hexagon_V6_vshuffh_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 32) (equal? num_5 2)) 16]
               [(and  (equal? lane_size 16) (equal? num_2 16) (equal? prec_i_o 8) (equal? num_4 16) (equal? num_5 8)) 8]
               )

             ]
            [(hexagon_V6_vrmpyub_128B_dsl v0 v1 num_2 num_3)
             (cond 
               [(and  (equal? num_2 0) (equal? num_3 0)) 32]
               [(and  (equal? num_2 1) (equal? num_3 1)) 32]
               )

             ]
            [(hexagon_V6_vmux_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vmpyiowh_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_lvsplatw_128B_dsl v0)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vgtw_xor_128B_dsl v0 vc_1 vc_2 v3 v4 prec_i_o num_6)
             (cond 
               [(and  (equal? prec_i_o 4) (equal? num_6 32)) 4]
               [(and  (equal? prec_i_o 2) (equal? num_6 16)) 2]
               [(and  (equal? prec_i_o 1) (equal? num_6 8)) 1]
               )

             ]
            [(hexagon_V6_vsubwq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (cond 
               [(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
               )

             ]
            [(hexagon_V6_vminh_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(hexagon_V6_vmpyieoh_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vaddwq_128B_dsl v0 v1 v2 prec_i_o num_4)
             (cond 
               [(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? prec_i_o 16) (equal? num_4 16)) 16]
               )

             ]
            [(hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vabsdiffh_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(hexagon_V6_vandnqrt_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vmpyiwb_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5 num_6 num_7)
             (cond 
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? num_5 1) (equal? num_6 4) (equal? num_7 8)) 32]
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? num_5 0) (equal? num_6 4) (equal? num_7 8)) 32]
               [(and  (equal? num_3 512) (equal? num_4 16) (equal? num_5 1) (equal? num_6 2) (equal? num_7 16)) 32]
               )

             ]
            [(hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]
            [(hexagon_V6_vandvqv_128B_dsl v0 v1)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vmpauhb_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vaddbsat_dv_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 1) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 1) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 32)) 32]
               [(and  (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 -1) (equal? num_6 64)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 -1) (equal? num_6 32)) 32]
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 -1) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 16) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 1) (equal? num_6 32)) 32]
               )

             ]
            [(hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 lane_size num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_4 16) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 128)) 16]
               [(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 64)) 32]
               [(and  (equal? lane_size 64) (equal? num_4 32) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 64)) 32]
               )

             ]
            [(hexagon_V6_vsububh_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0)) 16]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0)) 32]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1)) 32]
               )

             ]
            [(hexagon_V6_vmpabusv_128B_dsl v0 v1)
             (cond 
               [(and ) 16]
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               )

             ]
            [(hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 16]
               )

             ]
            [(hexagon_V6_vrmpyubv_128B_dsl v0 v1 num_2 num_3 num_4)
             (cond 
               [(and  (equal? num_2 0) (equal? num_3 0) (equal? num_4 0)) 32]
               [(and  (equal? num_2 1) (equal? num_3 1) (equal? num_4 0)) 32]
               [(and  (equal? num_2 1) (equal? num_3 1) (equal? num_4 1)) 32]
               )

             ]
            [(hexagon_V6_vdealb_128B_dsl v0 lane_size num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? lane_size 16) (equal? num_2 16) (equal? prec_i_o 8) (equal? num_4 16) (equal? num_5 8)) 8]
               [(and  (equal? lane_size 32) (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 32) (equal? num_5 2)) 16]
               )

             ]
            [(hexagon_V6_vmpyewuh_128B_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vavguhrnd_128B_dsl vc_0 vc_1 v2 v3 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(hexagon_V6_vdmpyhsusat_acc_128B_dsl v0 v1 v2 num_3)
             (cond 
               [(and  (equal? num_3 0)) 32]
               [(and  (equal? num_3 1)) 32]
               [(and  (equal? num_3 0)) 32]
               [(and  (equal? num_3 1)) 32]
               )

             ]
            [(hexagon_V6_lvsplath_128B_dsl v0 prec_o)
             (cond 
               [(and  (equal? prec_o 16)) 16]
               [(and  (equal? prec_o 8)) 8]
               )

             ]
            [(hexagon_V6_vnot_128B_dsl v0 num_1 prec_i_o)
             (cond 
               [(and  (equal? num_1 1024) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 128) (equal? prec_i_o 1)) 1]
               )

             ]
            [(hexagon_V6_pred_or_128B_dsl v0 v1 num_2 prec_o)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_o 1)) 1]
               [(and  (equal? num_2 1024) (equal? prec_o 16)) 16]
               )

             ]
            [(hexagon_V6_vandqrt_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vabsdiffub_128B_dsl v0 v1 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               )

             ]
            [(hexagon_V6_vswap_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 8]
               )

             ]
            [(hexagon_V6_vaddhw_128B_dsl v0 v1 lane_size num_3 prec_i prec_o num_6 num_7)
             (cond 
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 1)) 32]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_6 64) (equal? num_7 0)) 32]
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_6 128) (equal? num_7 0)) 16]
               )

             ]
            [(hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 8)) 8]
               [(and  (equal? prec_i_o 16)) 16]
               )

             ]
            [(hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vunpackuh_128B_dsl v0 prec_i prec_o num_3)
             (cond 
               [(and  (equal? prec_i 16) (equal? prec_o 32) (equal? num_3 0)) 32]
               [(and  (equal? prec_i 8) (equal? prec_o 16) (equal? num_3 1)) 16]
               [(and  (equal? prec_i 8) (equal? prec_o 16) (equal? num_3 0)) 16]
               [(and  (equal? prec_i 16) (equal? prec_o 32) (equal? num_3 1)) 32]
               )

             ]
            [(hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 num_3 num_4)
             (cond 
               [(and  (equal? num_3 1) (equal? num_4 1)) 32]
               [(and  (equal? num_3 0) (equal? num_4 0)) 32]
               )

             ]
            [(hexagon_V6_vrmpybv_acc_128B_dsl v0 v1 v2 num_3 num_4 num_5)
             (cond 
               [(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 1)) 32]
               [(and  (equal? num_3 0) (equal? num_4 0) (equal? num_5 0)) 32]
               [(and  (equal? num_3 1) (equal? num_4 1) (equal? num_5 0)) 32]
               )

             ]
            [(hexagon_V6_vshufoeb_128B_dsl v0 v1 lane_size num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? lane_size 32) (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 8) (equal? num_6 128)) 8]
               [(and  (equal? lane_size 64) (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 16) (equal? num_6 64)) 16]
               )

             ]
            [(hexagon_V6_vinsertwr_128B_dsl v0)
             (cond 
               [(and ) 32]
               )

             ]
            [(hexagon_V6_vshufeh_128B_dsl v0 v1 prec_i_o num_3)
             (cond 
               [(and  (equal? prec_i_o 16) (equal? num_3 16)) 16]
               [(and  (equal? prec_i_o 8) (equal? num_3 8)) 8]
               )

             ]
            [(hexagon_V6_vmpabuu_128B_dsl v0 v1 num_2 num_3)
             (cond 
               [(and  (equal? num_2 0) (equal? num_3 0)) 16]
               [(and  (equal? num_2 1) (equal? num_3 1)) 16]
               )

             ]
            [(hexagon_V6_vabsh_sat_128B_dsl v0 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]

            [
             v

             1
             ]
            )
  )
;; ================================================================================
