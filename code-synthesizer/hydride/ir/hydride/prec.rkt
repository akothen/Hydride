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


(provide (all-defined-out))



;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (get-prec prog env)
  (destruct prog
            [(dim-x id) 1]
            [(dim-y id) 1]
            [(idx-i id) 1]
            [(idx-j id) 1]
            [(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
            [(lit v) (bvlength v)]
            [(nop v1) (get-prec v1 env)]
            [(idx-add i1 i2) 1]
            [(idx-mul i1 i2) 1]
            [(vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o) prec_i_o]
            [(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) num_2]
            [(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
            [(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
            [(_mm512_mulhi_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               )

             ]
            [(_m_from_int_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 32]
               )

             ]
            [(_mm_hsubs_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 48) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 112) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 16]
               )

             ]
            [(_mm256_maskz_sllv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               )

             ]
            [(_mm256_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               )

             ]
            [(_mm256_maskz_sra_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 num_11 prec_i_o vc_13 vc_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_15 64) (equal? num_16 0) (equal? num_17 0)) 16]
               )

             ]
            [(_mm512_xor_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               )

             ]
            [(_mm512_broadcast_i64x4_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 4) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 4) (equal? num_7 0)) 32]
               )

             ]
            [(_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_mm512_subs_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               )

             ]
            [(_mm256_maskz_packus_epi16_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 256) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                  ]
               )

             ]
            [(_mm512_maskz_packus_epi32_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                ]
               )

             ]
            [(_mm512_maskz_srl_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               )

             ]
            [(_mm_maskz_packus_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) 16]
               )

             ]
            [(_mm256_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               )

             ]
            [(_mm512_maskz_packs_epi16_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                              ]
               )

             ]
            [(_mm_maskz_xor_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm256_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               )

             ]
            [(_mm256_cvtepi16_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 96)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 96)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 16]
               )

             ]
            [(_mm_extract_epi32_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? num_5 32) (equal? num_6 0) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 128) (equal? num_12 6) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 32]
               )

             ]
            [(_mm256_hsub_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 2) (equal? num_12 96) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? num_12 112) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               )

             ]
            [(_mm_maskz_packs_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) 16]
               )

             ]
            [(_mm256_maskz_packus_epi32_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                    ]
               )

             ]
            [(_m_psrldi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               )

             ]
            [(_mm256_mask_slli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               )

             ]
            [(_mm512_xor_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 256]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               )

             ]
            [(_mm256_srl_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 num_10 prec_i_o num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 32) (equal? num_7 0) (equal? num_9 64) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 32]
               )

             ]
            [(_mm_maskz_cvtepu8_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               )

             ]
            [(_mm512_srai_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 16) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 16) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 128) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_12 8) (equal? num_13 0) (equal? num_14 0)) 16]
               )

             ]
            [(_m_paddd_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_mm256_cvtsepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 96)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 96)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 112)) 8]
               )

             ]
            [(_mm512_mulhi_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0)) 32]
               )

             ]
            [(_mm256_mask_srav_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 prec_i_o vc_11 vc_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 64) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 16) (equal? num_8 0) (equal? prec_i_o 16) (equal? num_13 0)) 16]
               )

             ]
            [(_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0)) 32]
               )

             ]
            [(_mm_mask_sra_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? num_7 64) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 0)) 64]
               )

             ]
            [(_mm_srav_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 prec_i_o vc_9 vc_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 64) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 16) (equal? num_6 0) (equal? prec_i_o 16) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 32) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? prec_i_o 16) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 32) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 32) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 64) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 16) (equal? num_6 0) (equal? prec_i_o 16) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 64) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_11 0)) 64]
               )

             ]
            [(_mm_mask_min_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_mask_min_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_m_punpckhdq_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 32]
               )

             ]
            [(_mm256_maskz_packs_epi16_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 256) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                  ]
               )

             ]
            [(_mm_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               )

             ]
            [(_mm512_mask_srl_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               )

             ]
            [(_mm256_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 8]
               )

             ]
            [(_mm_mask_cmpeq_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               )

             ]
            [(_mm256_adds_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               )

             ]
            [(_mm_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 16]
               )

             ]
            [(_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               )

             ]
            [(_mm_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               )

             ]
            [(_mm512_mask_cmpgt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               )

             ]
            [(_mm256_mask_blend_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               )

             ]
            [(_mm512_srlv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               )

             ]
            [(_mm256_hsubs_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? num_12 112) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               )

             ]
            [(_mm512_or_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 256]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               )

             ]
            [(_mm_broadcastmb_epi64_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(_mm512_maskz_cvtusepi16_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 112)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 112)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               )

             ]
            [(_mm512_maskz_srli_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               )

             ]
            [(_mm_extract_epi8_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? num_5 32) (equal? num_6 0) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 128) (equal? num_12 0) (equal? num_13 0) (equal? num_14 24)) 8]
               )

             ]
            [(_mm_cmpeq_epu8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               )

             ]
            [(_mm_maskz_srlv_epi32_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               )

             ]
            [(_mm512_max_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               )

             ]
            [(_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)) 32]
               )

             ]
            [(_mm_maskz_sll_epi64_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               )

             ]
            [(_mm_movpi64_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 64]
               )

             ]
            [(_mm256_mask_packus_epi16_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 256) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                  ]
               )

             ]
            [(_mm512_fmadd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_mask_add_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               )

             ]
            [(_mm_mul_su32_dsl v0 v1 size_o lane_size num_4 prec_i num_6 prec_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i 64) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 64]
               )

             ]
            [(_mm_mask_cmpge_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               )

             ]
            [(_mm256_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               )

             ]
            [(_mm512_test_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 0)) 1]
               )

             ]
            [(_m_packuswb_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? prec_i 32) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 8]
               )

             ]
            [(_mm_hsub_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 32]
               )

             ]
            [(_mm_maskz_subs_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               )

             ]
            [(_mm_subs_pi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               )

             ]
            [(_mm512_mask_srli_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               )

             ]
            [(_mm256_cmpgt_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               )

             ]
            [(_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm256_mask_sll_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               )

             ]
            [(_mm_maskz_packs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) 8]
               )

             ]
            [(_mm256_mask_cvtepi16_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_9 0)) 64]
               )

             ]
            [(_mm_cvtsi64_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 64]
               )

             ]
            [(_mm_rorv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm512_sra_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 64) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 64) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 64) (equal? num_6 0) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               )

             ]
            [(_mm_mask_cvtsepi16_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 112)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 32) (equal? num_9 64)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 96)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 112)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 64) (equal? num_9 64)) 8]
               )

             ]
            [(_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               )

             ]
            [(_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_mm_mask_max_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               )

             ]
            [(_mm256_mask_packs_epi16_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 256) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                  ]
               )

             ]
            [(_mm256_mask_srl_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 64]
               )

             ]
            [(_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1) (equal? num_10 32) (equal? num_11 0)) 16]
               )

             ]
            [(_mm_cvtm64_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 64]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_3 32) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(_mm_extract_epi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? num_5 32) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 128) (equal? num_12 5) (equal? num_13 0) (equal? num_14 0) (equal? num_15 16)) 16]
               )

             ]
            [(_mm256_cvtepu8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               )

             ]
            [(_mm256_mask_srlv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               )

             ]
            [(_mm_hsub_pi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 48) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 112) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 96) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 32]
               )

             ]
            [(_mm512_maskz_rorv_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               )

             ]
            [(_mm256_mask_test_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 6)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 0)) 1]
               )

             ]
            [(_mm_maskz_avg_epu8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_11 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_11 0)) 16]
               )

             ]
            [(_mm512_ror_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 128) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               )

             ]
            [(_mm512_mask_packus_epi16_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                              ]
               )

             ]
            [(_mm_mask_sub_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm_mask_packs_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) 16]
               )

             ]
            [(_mm256_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               )

             ]
            [(_mm256_maskz_packs_epi32_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                    ]
               )

             ]
            [(_m_psllwi_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 16) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 64]
               )

             ]
            [(_mm256_max_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               )

             ]
            [(_mm_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               )

             ]
            [(_mm_cvtsi32_si64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32)) 32]
               )

             ]
            [(_mm_maskz_adds_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               )

             ]
            [(_mm_unpackhi_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 32]
               )

             ]
            [(_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               )

             ]
            [(_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_mm512_dpwssd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(_mm_mask_packs_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) 8]
               )

             ]
            [(_mm512_mask_mulhi_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_10 64) (equal? num_11 0)) 32]
               )

             ]
            [(_mm_abs_epi8_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0)) 16]
               )

             ]
            [(_mm512_mask_packus_epi32_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                ]
               )

             ]
            [(_mm512_mask_packs_epi16_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                              ]
               )

             ]
            [(_mm256_sll_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               )

             ]
            [(_mm256_cvtepi8_epi16_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 32) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 16) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_i 16) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 32) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_i 8) (equal? num_5 0) (equal? prec_o 64) (equal? num_7 0)) 64]
               )

             ]
            [(_mm256_mask_testn_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_13 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_13 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_13 4)) 1]
               )

             ]
            [(_mm512_cmpgt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               )

             ]
            [(_mm512_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 256) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 128) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? prec_i 32) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0)) 64]
               )

             ]
            [(_mm256_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               )

             ]
            [(_mm_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_7 32) (equal? num_8 32) (equal? num_9 8) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0) (equal? num_13 16) (equal? num_14 0)) 32]
               )

             ]
            [(_mm_movm_epi8_dsl vc_0 vc_1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) prec_i_o]
               )

             ]
            [(_mm_sub_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               )

             ]
            [(_mm512_maskz_srai_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 vc_9 num_10 prec_i_o vc_12 vc_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 32) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 64) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? num_10 0) (equal? prec_i_o 16) (equal? num_14 8) (equal? num_15 0) (equal? num_16 0)) 16]
               )

             ]
            [(_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm256_mask_abs_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(_mm256_mask_rolv_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_11 0)) 32]
               )

             ]
            [(_mm256_movepi16_mask_dsl vc_0 vc_1 v2 size_o lane_size num_5 prec_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_5 16) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_5 32) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 8) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_5 16) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 4) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 32) (equal? num_9 4)) prec_o]
               [(and  (equal? size_o 16) (equal? lane_size 16) (equal? num_5 16) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 8) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 8) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 4) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 64) (equal? num_9 4)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 8) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 8) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 2) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 64) (equal? num_9 6)) prec_o]
               [(and  (equal? size_o 8) (equal? lane_size 8) (equal? num_5 8) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) prec_o]
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_5 32) (equal? prec_o 1) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) prec_o]
               )

             ]
            [(_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               )

             ]
            [(_mm_movemask_epi8_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 7) (equal? num_7 8) (equal? num_8 16)) 1]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 7) (equal? num_7 8) (equal? num_8 24)) 1]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_3 8) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 7) (equal? num_7 8) (equal? num_8 24)) 1]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_o 1) (equal? num_5 0) (equal? num_6 7) (equal? num_7 8) (equal? num_8 0)) 1]
               )

             ]
            [(_mm512_mask_cmpge_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               )

             ]
            [(_mm_cvtsi64x_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64)) 64]
               )

             ]
            [(_mm_sllv_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_10 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_10 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 64) (equal? num_7 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               )

             ]
            [(_mm_extract_pi16_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? num_5 32) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_12 5) (equal? num_13 0) (equal? num_14 0) (equal? num_15 16)) 16]
               )

             ]
            [(_mm512_maskz_srl_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 num_12 prec_i_o num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 32) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_11 64) (equal? num_12 0) (equal? prec_i_o 16) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 16]
               )

             ]
            [(_mm_dpwssds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0) (equal? num_8 0)) 32]
               )

             ]
            [(_mm256_maskz_or_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm_mask_packus_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) 16]
               )

             ]
            [(_mm256_rolv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               )

             ]
            [(_mm256_setr_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 128) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 128]
               )

             ]
            [(_mm256_mask_cmpneq_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               )

             ]
            [(_mm256_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_11 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_11 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_11 0)) 1]
               )

             ]
            [(_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 8) (equal? num_9 0)) 16]
               )

             ]
            [(_mm256_maskz_rol_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               )

             ]
            [(_mm256_mask_subs_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               )

             ]
            [(_mm256_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 32]
               )

             ]
            [(_m_packsswb_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 32) (equal? prec_i 32) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? prec_i 32) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? prec_i 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 32) (equal? num_5 64) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 32) (equal? prec_i 32) (equal? num_12 64) (equal? num_13 2) (equal? num_14 0)) 16]
               )

             ]
            [(_mm512_broadcastd_epi32_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7)
             (cond 
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 128]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 128]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 32]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0)) 64]
               )

             ]
            [(_mm512_and_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 256]
               )

             ]
            [(_mm256_maskz_slli_epi16_dsl vc_0 vc_1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 num_11 prec_i_o num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 8) (equal? num_14 0) (equal? num_15 0)) 64]
               )

             ]
            [(_mm512_cmplt_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               )

             ]
            [(_mm256_mask_packus_epi32_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 256) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                    ]
               )

             ]
            [(_mm_cmpneq_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               )

             ]
            [(_mm256_mask_packs_epi32_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 256) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 128) (equal? num_13 2) (equal? num_14 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                                                    ]
               )

             ]
            [(_mm_maskz_ror_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o vc_10 vc_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 128) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 32) (equal? num_12 0) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? num_7 8) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_12 0) (equal? num_13 0)) 64]
               )

             ]
            [(_mm512_maskz_packs_epi32_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 128) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                ]
               )

             ]
            [(_mm512_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               )

             ]
            [(_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 8) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 0)) 32]
               )

             ]
            [(_mm_cmplt_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               )

             ]
            [(_mm512_cvtusepi32_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 96)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 16) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 112)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 256) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 16) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 64) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 64)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 64) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 64)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 32) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 32) (equal? prec_o 8) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 96)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_3 32) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 64) (equal? num_7 96)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_3 128) (equal? prec_o 16) (equal? num_5 0) (equal? prec_i 32) (equal? num_7 0)) 16]
               )

             ]
            [(_mm_mask_sllv_epi64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 vc_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_12 0)) 32]
               )

             ]
            [(_mm256_cmpgt_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_cmpge_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               )

             ]
            [(_mm_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 16) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0)) 32]
               )

             ]
            [(_mm256_srl_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 num_9 prec_i_o num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 64) (equal? num_7 0) (equal? num_9 0) (equal? prec_i_o 64) (equal? num_11 0) (equal? num_12 0)) 64]
               )

             ]
            [(_mm_maskz_packus_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) 8]
               )

             ]
            [(_mm_avg_pu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8 num_9)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_9 0)) 16]
               )

             ]
            [(_mm512_andnot_si512_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 256]
               [(and  (equal? size_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 512) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 512]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 128]
               )

             ]
            [(_mm512_cmple_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 16) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 4) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 2) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 6)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 64) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 32) (equal? num_10 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 0) (equal? prec_i 8) (equal? num_10 0)) 1]
               )

             ]
            [(_mm256_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               )

             ]
            [(_mm512_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 1) (equal? num_12 32) (equal? num_13 0)) 16]
               )

             ]
            [(_mm256_set_m128i_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 256) (equal? num_6 0) (equal? num_7 128) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 128]
               )

             ]
            [(_mm256_packs_epi16_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? prec_i 16) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 2) (equal? prec_i 32) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? prec_i 16) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 2) (equal? prec_i 32) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               )

             ]
            [(_mm_mask_packus_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) 8]
               )

             ]
            [(_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0)) 32]
               )

             ]
            [(_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               )

             ]
            [(_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               )

             ]
            [(_mm_unpacklo_pi32_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 32]
               )

             ]
            [(_mm512_mask_max_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               )

             ]
            [(_mm512_mask_andnot_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 8]
               )

             ]
            [(_mm256_maskz_mullo_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 32) (equal? num_11 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 128) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0)) 32]
               )

             ]
            [(_mm512_maskz_broadcast_i64x4_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 4) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 4) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 4) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 4) (equal? num_9 0)) 64]
               )

             ]
            [(_mm_dpbusds_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 32) (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0) (equal? num_8 16) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_sign_pi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 vc_8 prec_i_o vc_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 8) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 8) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_11 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? num_6 32) (equal? num_7 0) (equal? prec_i_o 32) (equal? num_11 32) (equal? num_12 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 8) (equal? num_7 0) (equal? prec_i_o 8) (equal? num_11 8) (equal? num_12 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_11 16) (equal? num_12 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? prec_i_o 16) (equal? num_11 16) (equal? num_12 0)) 16]
               )

             ]
            [(_mm_cvtsi32_si128_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 128) (equal? lane_size 128) (equal? num_3 128) (equal? prec_i_o 128) (equal? num_5 0) (equal? num_6 0) (equal? num_7 0) (equal? num_8 96)) 32]
               )

             ]
            [(_mm_mulhi_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 128) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 16) (equal? num_8 32) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_add_si64_dsl v0 v1 size_o lane_size num_4 prec_i_o num_6 num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 64]
               )

             ]
            [(_mm256_mask_mov_epi32_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 64]
               )

             ]
            [(_mm_extract_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? num_5 64) (equal? num_6 0) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 128) (equal? num_12 7) (equal? num_13 0) (equal? num_14 0)) 64]
               )

             ]
            [(_mm512_mask_packs_epi32_dsl v0 v1 v2 v3 size_i num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? num_5 128) (equal? num_6 128) (equal? prec_i 32) (equal? num_8 0) (equal? num_9 16) (equal? num_10 16) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                                ]
               )

             ]
            [(_mm256_maskz_set1_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 8]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)) 32]
               )

             ]
            [(_mm_sra_pi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 vc_7 num_8 num_9 prec_i_o vc_11 vc_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? num_5 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 16) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 128) (equal? num_5 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? num_5 16) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? num_5 16) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 64) (equal? lane_size 64) (equal? num_4 64) (equal? num_5 32) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 32) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 256) (equal? num_5 16) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 512) (equal? num_5 16) (equal? num_6 0) (equal? num_8 64) (equal? num_9 0) (equal? prec_i_o 16) (equal? num_13 64) (equal? num_14 0) (equal? num_15 0)) 16]
               )

             ]
            [(_mm512_maskz_packus_epi16_dsl vc_0 v1 v2 v3 size_i prec_i num_6 num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i 512) (equal? prec_i 128) (equal? num_6 128) (equal? num_7 16) (equal? num_8 0) (equal? num_9 8) (equal? num_10 8) (equal? num_11 128) (equal? num_12 0)) -1 ; Unable to reason about precision
                                                                                                                                                                                              ]
               )

             ]
            [(_mm512_mask_cmplt_epi8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 64) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 4) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 4)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 32) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 16) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 8) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 16) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 32) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 8) (equal? num_12 0)) 1]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 2) (equal? prec_o 1) (equal? num_8 0) (equal? prec_i 64) (equal? num_12 6)) 1]
               )

             ]
            [(_m_pextrw_dsl v0 v1 size_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 prec_i vc_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_o 32) (equal? lane_size 32) (equal? num_4 32) (equal? num_5 32) (equal? num_6 0) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_12 5) (equal? num_13 0) (equal? num_14 0) (equal? num_15 16)) 16]
               )

             ]
            [(_mm512_maskz_mul_epu32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
             (cond 
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_6 128) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_6 256) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_6 64) (equal? num_7 32) (equal? num_8 0) (equal? prec_i_o 64) (equal? num_10 0)) 64]
               )

             ]
            [(_mm_rol_epi64_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_i_o vc_8 vc_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 16) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               [(and  (equal? size_i_o 512) (equal? lane_size 512) (equal? num_4 128) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 64) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 128) (equal? lane_size 128) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 32) (equal? num_10 0) (equal? num_11 0)) 32]
               [(and  (equal? size_i_o 256) (equal? lane_size 256) (equal? num_4 32) (equal? num_5 8) (equal? num_6 0) (equal? prec_i_o 64) (equal? num_10 0) (equal? num_11 0)) 64]
               )

             ]
            [(_mm256_packus_epi32_dsl v0 v1 size_i_o lane_size num_4 num_5 num_6 prec_o num_8 num_9 num_10 num_11 prec_i num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 2) (equal? prec_i 32) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 512) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? prec_i 16) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 8]
               [(and  (equal? size_i_o 512) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 2) (equal? prec_i 32) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 16]
               [(and  (equal? size_i_o 256) (equal? lane_size 128) (equal? num_4 64) (equal? num_5 128) (equal? num_6 8) (equal? prec_o 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 2) (equal? prec_i 16) (equal? num_13 128) (equal? num_14 2) (equal? num_15 0)) 8]
               )

             ]

            [
             v

             1
             ]
            )
  )

;; ================================================================================

