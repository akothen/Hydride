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
            [(dim-x id) 1]
            [(dim-y id) 1]
            [(idx-i id) 1]
            [(idx-j id) 1]
            [(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
            [(lit v) (bvlength v)]
            [(nop v1) (hvx:get-prec v1 env)]
            [(idx-add i1 i2) 1]
            [(idx-mul i1 i2) 1]
            [(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) num_2]
            [(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
            [(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
            [(hexagon_V6_vmpabuuv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_o num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29)
             (cond 
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 0) (equal? prec_o 16) (equal? num_20 1024) (equal? num_21 -1) (equal? num_22 0) (equal? num_23 0) (equal? num_24 1032) (equal? num_25 0) (equal? num_26 0) (equal? num_27 8) (equal? num_28 2) (equal? num_29 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 0) (equal? prec_o 16) (equal? num_20 1024) (equal? num_21 -1) (equal? num_22 0) (equal? num_23 0) (equal? num_24 1032) (equal? num_25 0) (equal? num_26 0) (equal? num_27 8) (equal? num_28 2) (equal? num_29 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyiwb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 16) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 64) (equal? num_11 1) (equal? num_12 4) (equal? num_13 8) (equal? num_14 0)) 32]
               )

             ]
            [(hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 0) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 0) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 0)) 16]
               )

             ]
            [(hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 16]
               )

             ]
            [(hexagon_V6_vasruhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 1) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 8]
               )

             ]
            [(hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 1024) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 1) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 8) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0)) 8]
               )

             ]
            [(hexagon_V6_vgtuh_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 2]
               )

             ]
            [(hexagon_V6_vaddbq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 16]
               )

             ]
            [(hexagon_V6_veqb_or_128B_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 2]
               )

             ]
            [(hexagon_V6_vmpabuu_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 prec_o num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 0) (equal? num_20 0) (equal? prec_o 16) (equal? num_22 1024) (equal? num_23 -1) (equal? num_24 0) (equal? num_25 0) (equal? num_26 24) (equal? num_27 1032) (equal? num_28 0) (equal? num_29 0) (equal? num_30 16) (equal? num_31 8) (equal? num_32 2) (equal? num_33 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 0) (equal? num_15 8) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 0) (equal? prec_o 16) (equal? num_22 1024) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 0) (equal? num_26 24) (equal? num_27 1032) (equal? num_28 1) (equal? num_29 0) (equal? num_30 16) (equal? num_31 8) (equal? num_32 2) (equal? num_33 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 32]
               )

             ]
            [(hexagon_V6_veqb_and_128B_dsl v0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 4) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 2) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 2]
               )

             ]
            [(hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 1]
               [(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)) 16]
               )

             ]
            [(hexagon_V6_veqw_xor_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 0)) 1]
               )

             ]
            [(hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)) 16]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 1) (equal? num_6 0)) 1]
               )

             ]
            [(hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 32) (equal? num_4 0) (equal? num_5 16) (equal? num_6 8) (equal? num_7 16) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 32) (equal? num_11 4) (equal? num_12 2) (equal? num_13 32) (equal? num_14 4) (equal? num_15 8) (equal? num_16 4) (equal? num_17 4) (equal? num_18 0)) 8]
               )

             ]
            [(hexagon_V6_vgth_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               )

             ]
            [(hexagon_V6_vdmpyhisat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 16) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0)) 32]
               )

             ]
            [(hexagon_V6_vaddw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               )

             ]
            [(hexagon_V6_hi_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)) 32]
               )

             ]
            [(hexagon_V6_vsubhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               )

             ]
            [(hexagon_V6_vmpauhb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 prec_i_o num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39 num_40)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? num_24 0) (equal? prec_i_o 32) (equal? num_26 -1) (equal? num_27 -1) (equal? num_28 1) (equal? num_29 1) (equal? num_30 24) (equal? num_31 16) (equal? num_32 1040) (equal? num_33 1) (equal? num_34 1) (equal? num_35 16) (equal? num_36 16) (equal? num_37 16) (equal? num_38 1024) (equal? num_39 4) (equal? num_40 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 8) (equal? num_18 16) (equal? num_19 1024) (equal? num_20 1) (equal? num_21 1) (equal? num_22 0) (equal? num_23 16) (equal? num_24 0) (equal? prec_i_o 32) (equal? num_26 -1) (equal? num_27 -1) (equal? num_28 1) (equal? num_29 1) (equal? num_30 24) (equal? num_31 16) (equal? num_32 1040) (equal? num_33 1) (equal? num_34 1) (equal? num_35 16) (equal? num_36 16) (equal? num_37 16) (equal? num_38 1024) (equal? num_39 4) (equal? num_40 0)) 32]
               )

             ]
            [(hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 1) (equal? num_7 0)) 1]
               )

             ]
            [(hexagon_V6_vdmpyhb_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 4) (equal? num_12 16) (equal? prec_i 16) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 32]
               )

             ]
            [(hexagon_V6_vrmpybv_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_vminh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               )

             ]
            [(hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyhsat_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 1) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 -1) (equal? num_19 0) (equal? num_20 0) (equal? num_21 16) (equal? num_22 16) (equal? num_23 1024) (equal? num_24 2) (equal? num_25 0)) 32]
               )

             ]
            [(hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 1]
               [(and  (equal? size_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_o 16) (equal? num_7 0)) 16]
               )

             ]
            [(hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_12 4) (equal? num_13 1) (equal? num_14 0)) 1]
               )

             ]
            [(hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 4) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 8]
               )

             ]
            [(hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 32) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 4) (equal? num_13 -1) (equal? num_14 0)) 32]
               )

             ]
            [(hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 8]
               )

             ]
            [(hexagon_V6_vmpybusv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 32]
               )

             ]
            [(hexagon_V6_vdmpyhvsat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 32]
               )

             ]
            [(hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 2) (equal? num_17 16) (equal? num_18 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 0) (equal? num_14 64) (equal? num_15 1) (equal? num_16 4) (equal? num_17 8) (equal? num_18 0)) 32]
               )

             ]
            [(hexagon_V6_lvsplatw_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (cond 
               [(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 32) (equal? num_6 0)) 32]
               )

             ]
            [(hexagon_V6_vavgubrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 16]
               )

             ]
            [(hexagon_V6_vavguh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 32]
               )

             ]
            [(hexagon_V6_vpackob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 64) (equal? num_13 8) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 32) (equal? num_13 16) (equal? num_14 2) (equal? num_15 16) (equal? num_16 0)) 16]
               )

             ]
            [(hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 0)) 16]
               )

             ]
            [(hexagon_V6_vroundhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 8]
               )

             ]
            [(hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 2) (equal? num_8 8) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 2) (equal? num_8 16) (equal? num_9 0)) 16]
               )

             ]
            [(hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 0) (equal? num_11 2) (equal? num_12 16) (equal? num_13 32) (equal? num_14 2) (equal? num_15 16) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 0) (equal? num_11 2) (equal? num_12 8) (equal? num_13 64) (equal? num_14 2) (equal? num_15 8) (equal? num_16 0)) 8]
               )

             ]
            [(hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 4) (equal? num_17 4) (equal? prec_i_o 16) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 0) (equal? num_22 4) (equal? num_23 1) (equal? num_24 4) (equal? num_25 8) (equal? num_26 1024) (equal? num_27 2) (equal? num_28 0)) 16]
               )

             ]
            [(hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1040) (equal? num_14 1024) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1032) (equal? num_14 1024) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)) 8]
               )

             ]
            [(hexagon_V6_vmpahb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 prec_o num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 prec_i num_35 num_36 num_37)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? num_22 0) (equal? prec_o 32) (equal? num_24 1024) (equal? num_25 -1) (equal? num_26 1) (equal? num_27 1) (equal? num_28 24) (equal? num_29 16) (equal? num_30 1040) (equal? num_31 1) (equal? num_32 1) (equal? num_33 16) (equal? prec_i 16) (equal? num_35 16) (equal? num_36 4) (equal? num_37 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 8) (equal? num_16 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 1) (equal? num_20 0) (equal? num_21 16) (equal? num_22 0) (equal? prec_o 32) (equal? num_24 1024) (equal? num_25 -1) (equal? num_26 1) (equal? num_27 1) (equal? num_28 24) (equal? num_29 16) (equal? num_30 1040) (equal? num_31 1) (equal? num_32 1) (equal? num_33 16) (equal? prec_i 16) (equal? num_35 16) (equal? num_36 4) (equal? num_37 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 32]
               )

             ]
            [(hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 4) (equal? num_11 0)) 8]
               )

             ]
            [(hexagon_V6_vasrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 16]
               )

             ]
            [(hexagon_V6_vrmpyub_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0)) 16]
               )

             ]
            [(hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 4) (equal? num_12 1) (equal? num_13 0)) 1]
               )

             ]
            [(hexagon_V6_vgtuh_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               )

             ]
            [(hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 1024) (equal? num_11 0)) 8]
               )

             ]
            [(hexagon_V6_lvsplath_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6)
             (cond 
               [(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 16) (equal? num_6 0)) 16]
               [(and  (equal? size_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_o 8) (equal? num_6 0)) 8]
               )

             ]
            [(hexagon_V6_vinsertwr_128B_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7)
             (cond 
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 1) (equal? num_10 64) (equal? num_11 1) (equal? num_12 0)) 32]
               )

             ]
            [(hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0)) 8]
               )

             ]
            [(hexagon_V6_vsubh_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 8]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 8]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 8]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_vpackwh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 16]
               )

             ]
            [(hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               )

             ]
            [(hexagon_V6_vaslwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 16]
               )

             ]
            [(hexagon_V6_vabsw_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0)) 8]
               )

             ]
            [(hexagon_V6_vshufeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0)) 8]
               )

             ]
            [(hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
               )

             ]
            [(hexagon_V6_vshuffb_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 32) (equal? num_7 2) (equal? num_8 0)) 16]
               )

             ]
            [(hexagon_V6_vasrwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 0) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 16) (equal? num_9 16) (equal? num_10 1) (equal? prec_i 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0)) 16]
               )

             ]
            [(hexagon_V6_vandnqrt_acc_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 1) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 4) (equal? num_12 0)) 8]
               )

             ]
            [(hexagon_V6_vnavgub_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0)) 32]
               )

             ]
            [(hexagon_V6_vmpybus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 1) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 4) (equal? num_15 4) (equal? prec_o 16) (equal? num_17 1024) (equal? num_18 0) (equal? num_19 0) (equal? num_20 4) (equal? num_21 1) (equal? num_22 4) (equal? num_23 8) (equal? num_24 2) (equal? num_25 0)) 16]
               )

             ]
            [(hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 prec_i_o num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 1) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 0) (equal? num_21 0) (equal? num_22 0) (equal? prec_i_o 16) (equal? num_24 -1) (equal? num_25 -1) (equal? num_26 1) (equal? num_27 0) (equal? num_28 24) (equal? num_29 1032) (equal? num_30 1) (equal? num_31 0) (equal? num_32 16) (equal? num_33 8) (equal? num_34 1024) (equal? num_35 2) (equal? num_36 0)) 16]
               [(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 8) (equal? num_18 1024) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 0) (equal? prec_i_o 16) (equal? num_24 -1) (equal? num_25 -1) (equal? num_26 0) (equal? num_27 0) (equal? num_28 24) (equal? num_29 1032) (equal? num_30 0) (equal? num_31 0) (equal? num_32 16) (equal? num_33 8) (equal? num_34 1024) (equal? num_35 2) (equal? num_36 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_6 1024) (equal? num_7 0) (equal? num_8 512) (equal? num_9 16) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 16) (equal? num_18 0)) 32]
               )

             ]
            [(hexagon_V6_vaddhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 -1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               )

             ]
            [(hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1024) (equal? num_7 0)) 8]
               )

             ]
            [(hexagon_V6_vmux_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 8]
               )

             ]
            [(hexagon_V6_vaddb_dv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 8]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 1024) (equal? num_13 0)) 8]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 16) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1024) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 1024) (equal? num_6 8) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1024) (equal? num_13 0)) 8]
               )

             ]
            [(hexagon_V6_vasrwhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 16) (equal? num_11 16) (equal? num_12 0) (equal? num_13 -1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 -1) (equal? num_19 0)) 16]
               )

             ]
            [(hexagon_V6_vsubububb_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 32]
               )

             ]
            [(hexagon_V6_vsubbnq_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 16]
               )

             ]
            [(hexagon_V6_vandqrt_acc_128B_dsl v0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 1024) (equal? prec_i_o 8) (equal? num_10 4) (equal? num_11 1) (equal? num_12 8) (equal? num_13 0)) 8]
               )

             ]
            [(hexagon_V6_vpackhub_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i num_18 num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 64) (equal? num_16 0) (equal? prec_i 16) (equal? num_18 1) (equal? num_19 8) (equal? num_20 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 64) (equal? num_16 1) (equal? prec_i 16) (equal? num_18 1) (equal? num_19 8) (equal? num_20 0)) 8]
               )

             ]
            [(hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 32) (equal? num_7 2) (equal? num_8 0)) 16]
               )

             ]
            [(hexagon_V6_vadduhw_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 32) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 16) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? num_7 8) (equal? num_8 0) (equal? num_9 512) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? prec_i_o 16) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 8) (equal? num_21 1024) (equal? num_22 2) (equal? num_23 0)) 16]
               )

             ]
            [(hexagon_V6_vunpackob_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 32]
               )

             ]
            [(hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 0)) 32]
               )

             ]
            [(hexagon_V6_vdmpyhsusat_128B_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 32]
               [(and  (equal? size_i 1024) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 32]
               )

             ]
            [(hexagon_V6_vgtw_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 2) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 4) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 4]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 1) (equal? num_10 0) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 1]
               )

             ]
            [(hexagon_V6_vsh_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 8) (equal? num_9 16) (equal? num_10 1) (equal? num_11 1) (equal? prec_o 16) (equal? num_13 1024) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i 16) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0) (equal? prec_o 32) (equal? num_13 1024) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2) (equal? num_17 0)) 32]
               )

             ]
            [(hexagon_V6_vasrhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 0) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_7 1024) (equal? num_8 0) (equal? num_9 512) (equal? prec_o 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 32) (equal? prec_i 16) (equal? num_17 1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 32) (equal? num_22 -1) (equal? num_23 0)) 8]
               )

             ]
            [(hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)) 32]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0) (equal? prec_o 32) (equal? num_16 1024) (equal? num_17 0) (equal? num_18 0) (equal? num_19 16) (equal? num_20 16) (equal? num_21 2) (equal? num_22 0)) 32]
               )

             ]
            [(hexagon_V6_vlsrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 0)) 32]
               )

             ]
            [(hexagon_V6_vdmpybus_acc_128B_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)) 16]
               [(and  (equal? size_i 1024) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 4) (equal? num_12 8) (equal? num_13 8) (equal? num_14 0)) 16]
               )

             ]
            [(hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 1) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 16) (equal? num_10 32) (equal? num_11 1) (equal? num_12 0) (equal? num_13 0) (equal? prec_o 32) (equal? num_15 1024) (equal? num_16 0) (equal? num_17 0) (equal? num_18 16) (equal? num_19 2) (equal? num_20 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 512) (equal? num_6 8) (equal? num_7 0) (equal? num_8 512) (equal? prec_i 8) (equal? num_10 16) (equal? num_11 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_o 16) (equal? num_15 1024) (equal? num_16 1) (equal? num_17 0) (equal? num_18 8) (equal? num_19 2) (equal? num_20 0)) 16]
               )

             ]
            [(hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 512) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 0)) 32]
               )

             ]
            [(hexagon_V6_veqb_128B_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 2) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 2]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_o 4) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 4]
               )

             ]
            [(hexagon_V6_vabsb_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 0)) 32]
               )

             ]
            [(hexagon_V6_vandvqv_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 8]
               )

             ]
            [(hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)) 8]
               )

             ]
            [(hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 32]
               )

             ]
            [(hexagon_V6_pred_and_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 1]
               )

             ]
            [(hexagon_V6_vunpackuh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 1024) (equal? num_2 1024) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 32]
               )

             ]
            [(hexagon_V6_pred_or_n_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 1) (equal? num_7 0)) 1]
               )

             ]
            [(hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
             (cond 
               [(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? prec_o 32) (equal? num_18 1024) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 2) (equal? prec_i 32) (equal? num_24 0)) 32]
               )

             ]

            [
             v

             1
             ]
            )
  )
;; ================================================================================
