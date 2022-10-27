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
            [(llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
            [(_mm_sub_pi16_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm512_mask_extracti32x4_epi32_dsl v0 v1 v2 v3 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 64)) 64]
               [(and  (equal? prec_i_o 64)) 64]
               [(and  (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_maskz_sllv_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               )

             ]
            [(_mm256_mask_adds_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm_mask_cmplt_epi16_mask_dsl v0 vc_1 vc_2 v3 v4 vc_5 num_6 prec_i num_8)
             (cond 
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               )

             ]
            [(_mm_mask_madd_epi16_dsl v0 v1 v2 v3 num_4)
             (cond 
               [(and  (equal? num_4 64)) 32]
               [(and  (equal? num_4 64)) 32]
               [(and  (equal? num_4 128)) 32]
               [(and  (equal? num_4 256)) 32]
               [(and  (equal? num_4 128)) 32]
               [(and  (equal? num_4 256)) 32]
               )

             ]
            [(_mm_mask_srl_epi16_dsl v0 vc_1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm_mulhi_pi16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16) (equal? num_4 0) (equal? num_5 32)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 32) (equal? num_4 0) (equal? num_5 64)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 16) (equal? num_4 0) (equal? num_5 32)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 16) (equal? num_4 0) (equal? num_5 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               )

             ]
            [(_mm_maskz_cvtepu8_epi32_dsl v0 vc_1 v2 num_3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 16) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 32) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 32) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 16) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 64) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm_hadd_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? num_2 64) (equal? num_3 16) (equal? num_4 64) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 128) (equal? num_9 112)) 16]
               [(and  (equal? num_2 32) (equal? num_3 16) (equal? num_4 32) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 64) (equal? num_9 48)) 16]
               [(and  (equal? num_2 64) (equal? num_3 32) (equal? num_4 64) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 128) (equal? num_9 96)) 32]
               )

             ]
            [(_mm_hsubs_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (cond 
               [(and  (equal? num_2 64) (equal? num_3 64) (equal? num_4 128) (equal? num_5 112) (equal? num_6 128)) 16]
               [(and  (equal? num_2 32) (equal? num_3 32) (equal? num_4 64) (equal? num_5 48) (equal? num_6 64)) 16]
               )

             ]
            [(_mm256_extract_epi16_dsl vc_0 v1 v2 num_3 num_4 prec_o prec_i num_7 num_8)
             (cond 
               [(and  (equal? num_3 4) (equal? num_4 4) (equal? prec_o 16) (equal? prec_i 256) (equal? num_7 5) (equal? num_8 0)) 16]
               [(and  (equal? num_3 2) (equal? num_4 2) (equal? prec_o 64) (equal? prec_i 256) (equal? num_7 7) (equal? num_8 0)) 64]
               [(and  (equal? num_3 3) (equal? num_4 3) (equal? prec_o 32) (equal? prec_i 256) (equal? num_7 6) (equal? num_8 0)) 32]
               [(and  (equal? num_3 2) (equal? num_4 2) (equal? prec_o 16) (equal? prec_i 64) (equal? num_7 5) (equal? num_8 16)) 16]
               [(and  (equal? num_3 2) (equal? num_4 2) (equal? prec_o 16) (equal? prec_i 64) (equal? num_7 5) (equal? num_8 16)) 16]
               [(and  (equal? num_3 1) (equal? num_4 1) (equal? prec_o 64) (equal? prec_i 128) (equal? num_7 7) (equal? num_8 0)) 64]
               [(and  (equal? num_3 2) (equal? num_4 2) (equal? prec_o 32) (equal? prec_i 128) (equal? num_7 6) (equal? num_8 0)) 32]
               [(and  (equal? num_3 3) (equal? num_4 3) (equal? prec_o 16) (equal? prec_i 128) (equal? num_7 5) (equal? num_8 16)) 16]
               )

             ]
            [(_mm_sra_epi64_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 128)) 64]
               [(and  (equal? num_2 512)) 64]
               [(and  (equal? num_2 256)) 64]
               )

             ]
            [(_mm256_div_epi16_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 256) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               )

             ]
            [(_mm_mask_subs_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm256_hadds_epi16_dsl v0 v1)
             (cond 
               [(and ) 16]
               )

             ]
            [(_mm256_hsub_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32) (equal? num_5 96)) 32]
               [(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 112)) 16]
               )

             ]
            [(_mm512_maskz_madd52lo_epu64_dsl v0 vc_1 v2 v3 v4 num_5 num_6)
             (cond 
               [(and  (equal? num_5 416) (equal? num_6 0)) 64]
               [(and  (equal? num_5 104) (equal? num_6 0)) 64]
               [(and  (equal? num_5 208) (equal? num_6 0)) 64]
               [(and  (equal? num_5 208) (equal? num_6 52)) 64]
               [(and  (equal? num_5 416) (equal? num_6 52)) 64]
               [(and  (equal? num_5 104) (equal? num_6 52)) 64]
               )

             ]
            [(_mm256_maskz_extracti64x2_epi64_dsl v0 v1 vc_2 v3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 128) (equal? num_7 128)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 128) (equal? num_7 128)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 256) (equal? num_7 256)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 256) (equal? num_7 256)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 128) (equal? num_7 128)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 256) (equal? num_7 256)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 256) (equal? num_7 256)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 128) (equal? num_7 128)) 64]
               )

             ]
            [(_mm_maskz_cvtepi16_epi8_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               )

             ]
            [(_mm_hsub_pi32_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm256_mask_max_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm_cmplt_epi16_dsl v0 vc_1 vc_2 v3 prec_i_o)
             (cond 
               [(and  (equal? prec_i_o 16)) 16]
               [(and  (equal? prec_i_o 32)) 32]
               [(and  (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm_srli_pi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_cmple_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               )

             ]
            [(_mm512_movepi64_mask_dsl v0 vc_1 vc_2 num_3 num_4 num_5 num_6)
             (cond 
               [(and  (equal? num_3 8) (equal? num_4 63) (equal? num_5 64) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                             ]
               [(and  (equal? num_3 4) (equal? num_4 31) (equal? num_5 32) (equal? num_6 4)) -1 ; Unable to reason about precision
                                                                                             ]
               [(and  (equal? num_3 8) (equal? num_4 31) (equal? num_5 32) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                             ]
               [(and  (equal? num_3 32) (equal? num_4 7) (equal? num_5 8) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                            ]
               [(and  (equal? num_3 16) (equal? num_4 15) (equal? num_5 16) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                              ]
               [(and  (equal? num_3 2) (equal? num_4 63) (equal? num_5 64) (equal? num_6 6)) -1 ; Unable to reason about precision
                                                                                             ]
               [(and  (equal? num_3 32) (equal? num_4 15) (equal? num_5 16) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                              ]
               [(and  (equal? num_3 16) (equal? num_4 31) (equal? num_5 32) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                              ]
               [(and  (equal? num_3 16) (equal? num_4 7) (equal? num_5 8) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                            ]
               [(and  (equal? num_3 8) (equal? num_4 15) (equal? num_5 16) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                             ]
               [(and  (equal? num_3 64) (equal? num_4 7) (equal? num_5 8) (equal? num_6 0)) -1 ; Unable to reason about precision
                                                                                            ]
               [(and  (equal? num_3 4) (equal? num_4 63) (equal? num_5 64) (equal? num_6 4)) -1 ; Unable to reason about precision
                                                                                             ]
               )

             ]
            [(_mm256_testn_epi16_mask_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i num_7)
             (cond 
               [(and  (equal? num_5 16) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 32) (equal? num_7 0)) 1]
               [(and  (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 16) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 32) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 2) (equal? prec_i 64) (equal? num_7 6)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 64) (equal? num_7 0)) 1]
               [(and  (equal? num_5 4) (equal? prec_i 32) (equal? num_7 4)) 1]
               [(and  (equal? num_5 64) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 4) (equal? prec_i 64) (equal? num_7 4)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 32) (equal? num_7 0)) 1]
               [(and  (equal? num_5 16) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 2) (equal? prec_i 64) (equal? num_7 6)) 1]
               [(and  (equal? num_5 4) (equal? prec_i 32) (equal? num_7 4)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 64) (equal? num_7 0)) 1]
               [(and  (equal? num_5 16) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 16) (equal? prec_i 32) (equal? num_7 0)) 1]
               [(and  (equal? num_5 64) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 32) (equal? prec_i 8) (equal? num_7 0)) 1]
               [(and  (equal? num_5 16) (equal? prec_i 32) (equal? num_7 0)) 1]
               [(and  (equal? num_5 8) (equal? prec_i 16) (equal? num_7 0)) 1]
               [(and  (equal? num_5 4) (equal? prec_i 64) (equal? num_7 4)) 1]
               )

             ]
            [(_mm512_maskz_sll_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm256_mask_mul_epi32_dsl v0 v1 v2 v3 num_4)
             (cond 
               [(and  (equal? num_4 128)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 64)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 64)) 64]
               [(and  (equal? num_4 128)) 64]
               )

             ]
            [(_mm512_cmpneq_epi8_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               )

             ]
            [(_mm_mulhrs_pi16_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 64)) 16]
               [(and  (equal? num_2 512)) 16]
               [(and  (equal? num_2 256)) 16]
               [(and  (equal? num_2 128)) 16]
               )

             ]
            [(_mm512_max_epi16_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm512_madd52lo_epu64_dsl v0 v1 v2 num_3 num_4)
             (cond 
               [(and  (equal? num_3 416) (equal? num_4 0)) 64]
               [(and  (equal? num_3 104) (equal? num_4 0)) 64]
               [(and  (equal? num_3 208) (equal? num_4 52)) 64]
               [(and  (equal? num_3 104) (equal? num_4 52)) 64]
               [(and  (equal? num_3 416) (equal? num_4 52)) 64]
               [(and  (equal? num_3 208) (equal? num_4 0)) 64]
               )

             ]
            [(_m_por_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 256)) 256]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 128)) 128]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_unpackhi_epi8_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 64)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 32) (equal? num_4 32) (equal? num_5 64)) 32]
               [(and  (equal? num_2 32) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 32)) 8]
               [(and  (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 32) (equal? prec_i_o 8) (equal? num_4 8) (equal? num_5 32)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 64)) 16]
               )

             ]
            [(_mm256_mask_mul_epu32_dsl v0 v1 v2 v3 num_4)
             (cond 
               [(and  (equal? num_4 128)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 64)) 64]
               [(and  (equal? num_4 64)) 64]
               [(and  (equal? num_4 128)) 64]
               )

             ]
            [(_mm256_maskz_mulhi_epi16_dsl v0 vc_1 v2 v3 num_4 num_5)
             (cond 
               [(and  (equal? num_4 256) (equal? num_5 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 16)) 16]
               [(and  (equal? num_4 128) (equal? num_5 0)) 16]
               [(and  (equal? num_4 128) (equal? num_5 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 0)) 16]
               [(and  (equal? num_4 128) (equal? num_5 0)) 16]
               [(and  (equal? num_4 256) (equal? num_5 0)) 16]
               [(and  (equal? num_4 512) (equal? num_5 0)) 16]
               [(and  (equal? num_4 512) (equal? num_5 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 0)) 16]
               [(and  (equal? num_4 128) (equal? num_5 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 16)) 16]
               )

             ]
            [(_mm_mul_epi32_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 64)) 64]
               [(and  (equal? num_2 256)) 64]
               [(and  (equal? num_2 128)) 64]
               )

             ]
            [(_mm512_packus_epi16_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 8) (equal? prec_o 8) (equal? num_5 16) (equal? prec_i 16)) 8]
               [(and  (equal? size_i_o 256) (equal? num_3 16) (equal? prec_o 16) (equal? num_5 32) (equal? prec_i 32)) 16]
               [(and  (equal? size_i_o 512) (equal? num_3 16) (equal? prec_o 16) (equal? num_5 32) (equal? prec_i 32)) 16]
               [(and  (equal? size_i_o 256) (equal? num_3 8) (equal? prec_o 8) (equal? num_5 16) (equal? prec_i 16)) 8]
               )

             ]
            [(_mm512_sllv_epi64_dsl vc_0 v1 vc_2 v3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               )

             ]
            [(_mm_unpacklo_epi64_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 64) (equal? num_4 64)) 64]
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               )

             ]
            [(_mm_maskz_dpbusds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (cond 
               [(and  (equal? size_i_o 128)) 32]
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 512)) 32]
               )

             ]
            [(_m_paddsb_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_cvtsepi64_epi16_dsl v0 num_1 prec_o prec_i num_4)
             (cond 
               [(and  (equal? num_1 32) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 96)) 16]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 96)) 8]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 96)) 8]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 64)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 64)) 8]
               [(and  (equal? num_1 16) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 112)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 64)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 0)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 64)) 32]
               [(and  (equal? num_1 128) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 64)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 64)) 16]
               [(and  (equal? num_1 256) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 0)) 16]
               [(and  (equal? num_1 256) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               )

             ]
            [(_mm512_mask_testn_epi32_mask_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 v6 num_7 prec_i num_9)
             (cond 
               [(and  (equal? num_7 16) (equal? prec_i 32) (equal? num_9 0)) 1]
               [(and  (equal? num_7 16) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 32) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 16) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 16) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 32) (equal? num_9 0)) 1]
               [(and  (equal? num_7 4) (equal? prec_i 64) (equal? num_9 4)) 1]
               [(and  (equal? num_7 2) (equal? prec_i 64) (equal? num_9 6)) 1]
               [(and  (equal? num_7 4) (equal? prec_i 32) (equal? num_9 4)) 1]
               [(and  (equal? num_7 32) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 16) (equal? prec_i 8) (equal? num_9 0)) 1]
               [(and  (equal? num_7 16) (equal? prec_i 32) (equal? num_9 0)) 1]
               [(and  (equal? num_7 32) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 4) (equal? prec_i 64) (equal? num_9 4)) 1]
               [(and  (equal? num_7 2) (equal? prec_i 64) (equal? num_9 6)) 1]
               [(and  (equal? num_7 4) (equal? prec_i 32) (equal? num_9 4)) 1]
               [(and  (equal? num_7 32) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 32) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 64) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 16) (equal? num_9 0)) 1]
               [(and  (equal? num_7 8) (equal? prec_i 64) (equal? num_9 0)) 1]
               )

             ]
            [(_m_pminub_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm256_srl_epi64_dsl v0 vc_1 v2 num_3)
             (cond 
               [(and  (equal? num_3 256)) 64]
               [(and  (equal? num_3 128)) 64]
               [(and  (equal? num_3 512)) 64]
               )

             ]
            [(_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 32)) 32]
               )

             ]
            [(_mm512_srav_epi64_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 64)) 64]
               [(and  (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 64)) 64]
               [(and  (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16)) 16]
               [(and  (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 32)) 32]
               [(and  (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16)) 16]
               [(and  (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 16)) 16]
               [(and  (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64)) 64]
               [(and  (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 32)) 32]
               )

             ]
            [(_mm256_maskz_slli_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm_mulhi_epu16_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 0) (equal? num_5 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 64) (equal? num_4 0) (equal? num_5 128)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 0) (equal? num_5 32)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 64) (equal? num_4 0) (equal? num_5 128)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 32) (equal? num_4 0) (equal? num_5 64)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 32)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 32) (equal? num_4 0) (equal? num_5 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 64) (equal? num_4 0) (equal? num_5 128)) 64]
               )

             ]
            [(_mm256_maskz_adds_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm_mask_cmplt_epu16_mask_dsl v0 v1 vc_2 vc_3 v4 vc_5 num_6 prec_i num_8)
             (cond 
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               )

             ]
            [(_mm256_mask_maddubs_epi16_dsl v0 v1 v2 v3 num_4)
             (cond 
               [(and  (equal? num_4 128)) 16]
               [(and  (equal? num_4 256)) 16]
               [(and  (equal? num_4 64)) 16]
               [(and  (equal? num_4 64)) 16]
               [(and  (equal? num_4 128)) 16]
               [(and  (equal? num_4 256)) 16]
               )

             ]
            [(_mm512_mask_ror_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
             (cond 
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 32) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm512_broadcast_i64x4_dsl v0 num_1 prec_i_o num_3)
             (cond 
               [(and  (equal? num_1 512) (equal? prec_i_o 64) (equal? num_3 4)) 64]
               [(and  (equal? num_1 512) (equal? prec_i_o 32) (equal? num_3 2)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 32) (equal? num_3 2)) 32]
               [(and  (equal? num_1 128) (equal? prec_i_o 32) (equal? num_3 2)) 32]
               [(and  (equal? num_1 512) (equal? prec_i_o 64) (equal? num_3 2)) 64]
               [(and  (equal? num_1 512) (equal? prec_i_o 32) (equal? num_3 8)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 32) (equal? num_3 4)) 32]
               [(and  (equal? num_1 512) (equal? prec_i_o 32) (equal? num_3 4)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 64) (equal? num_3 2)) 64]
               )

             ]
            [(_mm_maskz_broadcastq_epi64_dsl v0 vc_1 v2 num_3 prec_i_o)
             (cond 
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm512_mask_fmadd_epi32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm256_avg_epu16_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm512_mask_min_epu16_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm_cvtepi64_epi32_dsl v0 num_1 prec_o prec_i num_4)
             (cond 
               [(and  (equal? num_1 64) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 64)) 32]
               [(and  (equal? num_1 256) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 64)) 8]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 0)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               [(and  (equal? num_1 16) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 0)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 64)) 16]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 96)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 64)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 0)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 64)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 0)) 8]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 32) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 96)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 0)) 8]
               )

             ]
            [(_mm_cmpgt_pi32_dsl vc_0 v1 v2 vc_3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm512_maskz_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (cond 
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 128)) 32]
               )

             ]
            [(_mm256_mask_abs_epi64_dsl v0 v1 v2 num_3 prec_i_o)
             (cond 
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm256_mask_sll_epi64_dsl v0 v1 v2 vc_3 v4 num_5)
             (cond 
               [(and  (equal? num_5 256)) 64]
               [(and  (equal? num_5 128)) 64]
               [(and  (equal? num_5 512)) 64]
               [(and  (equal? num_5 256)) 64]
               [(and  (equal? num_5 512)) 64]
               [(and  (equal? num_5 128)) 64]
               )

             ]
            [(_mm_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
             (cond 
               [(and  (equal? num_4 64) (equal? num_5 64)) 64]
               [(and  (equal? num_4 0) (equal? num_5 0)) 64]
               [(and  (equal? num_4 0) (equal? num_5 0)) 64]
               [(and  (equal? num_4 64) (equal? num_5 64)) 64]
               )

             ]
            [(_mm512_mask_sub_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm_xor_epi32_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 256)) 256]
               [(and  (equal? num_2 128) (equal? prec_i_o 128)) 128]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_blendv_epi8_dsl v0 v1 v2 num_3)
             (cond 
               [(and  (equal? num_3 128)) 8]
               [(and  (equal? num_3 256)) 8]
               )

             ]
            [(_mm_movepi64_pi64_dsl v0 num_1 prec_i_o num_3)
             (cond 
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 96)) 32]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 64)) 64]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 32)) 32]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 0)) 64]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i_o 64) (equal? num_3 64)) 64]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 0)) 32]
               [(and  (equal? num_1 32) (equal? prec_i_o 32) (equal? num_3 0)) 32]
               )

             ]
            [(_mm256_movm_epi64_dsl v0 vc_1 vc_2 num_3 prec_i_o)
             (cond 
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) prec_i_o]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) prec_i_o]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) prec_i_o]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) prec_i_o]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) prec_i_o]
               [(and  (equal? num_3 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) prec_i_o]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) prec_i_o]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) prec_i_o]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) prec_i_o]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 8)) prec_i_o]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) prec_i_o]
               [(and  (equal? num_3 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32)) prec_i_o]
               [(and  (equal? num_3 128) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm256_sign_epi8_dsl v0 vc_1 vc_2 vc_3 v4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm256_maskz_cvtusepi64_epi16_dsl v0 vc_1 v2 num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 112)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 112)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 64)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 96)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 96)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               )

             ]
            [(_mm_packus_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
             (cond 
               [(and  (equal? num_2 64) (equal? num_3 8) (equal? num_4 64) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 128)) 8]
               [(and  (equal? num_2 32) (equal? num_3 8) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 64)) 8]
               [(and  (equal? num_2 64) (equal? num_3 16) (equal? num_4 64) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 32) (equal? prec_i 32) (equal? num_9 128)) 16]
               [(and  (equal? num_2 32) (equal? num_3 8) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 64)) 8]
               )

             ]
            [(_mm512_max_epu64_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm512_maskz_subs_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm512_ror_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 16) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm256_abs_epi16_dsl v0 num_1 prec_i_o)
             (cond 
               [(and  (equal? num_1 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 64) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_maskz_min_epi8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm512_mask_mulhi_epi32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(_mm_sll_epi64_dsl v0 vc_1 v2 num_3)
             (cond 
               [(and  (equal? num_3 128)) 64]
               [(and  (equal? num_3 256)) 64]
               [(and  (equal? num_3 512)) 64]
               )

             ]
            [(_mm256_unpacklo_epi64_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 128)) 64]
               [(and  (equal? num_2 256)) 64]
               )

             ]
            [(_mm512_cmpgt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               )

             ]
            [(_mm512_mul_epu32_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 256)) 64]
               [(and  (equal? num_2 128)) 64]
               [(and  (equal? num_2 64)) 64]
               )

             ]
            [(_mm512_mask_div_epu32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm_dpbusds_epi32_dsl v0 v1 v2 size_i)
             (cond 
               [(and  (equal? size_i 128)) 32]
               [(and  (equal? size_i 256)) 32]
               [(and  (equal? size_i 512)) 32]
               )

             ]
            [(_mm_maddubs_pi16_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 32)) 16]
               [(and  (equal? num_2 128)) 16]
               [(and  (equal? num_2 256)) 16]
               [(and  (equal? num_2 64)) 16]
               )

             ]
            [(_mm512_extracti32x4_epi32_dsl v0 v1)
             (cond 
               [(and ) 128]
               [(and ) 128]
               )

             ]
            [(_mm512_maskz_srlv_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 num_6 prec_i_o num_8 num_9)
             (cond 
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64) (equal? num_9 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16)) 16]
               )

             ]
            [(_mm512_div_epu16_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 8) (equal? num_4 16)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 16) (equal? num_4 32)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 64) (equal? num_4 128)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 32) (equal? num_4 64)) 32]
               )

             ]
            [(_mm512_mask3_fmadd_epi32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm256_dpwssds_epi32_dsl v0 v1 v2 size_i)
             (cond 
               [(and  (equal? size_i 256)) 32]
               [(and  (equal? size_i 128)) 32]
               [(and  (equal? size_i 512)) 32]
               )

             ]
            [(_mm256_cvtepi8_epi32_dsl v0 num_1 prec_i prec_o)
             (cond 
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i 8) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i 8) (equal? prec_o 16)) 16]
               [(and  (equal? num_1 32) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i 8) (equal? prec_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 16)) 16]
               [(and  (equal? num_1 64) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 32) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 16) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
               )

             ]
            [(_mm_maskz_or_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm_cmplt_epu16_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               )

             ]
            [(_mm512_mask_rem_epu32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(_mm512_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o)
             (cond 
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 128)) 32]
               )

             ]
            [(_mm256_hadd_epi32_dsl v0 v1 num_2 prec_i_o num_4 num_5)
             (cond 
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32) (equal? num_5 96)) 32]
               [(and  (equal? num_2 16) (equal? prec_i_o 16) (equal? num_4 16) (equal? num_5 112)) 16]
               )

             ]
            [(_mm256_rorv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_hsub_epi32_dsl v0 v1 num_2 num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? num_2 64) (equal? num_3 32) (equal? num_4 64) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 96) (equal? num_9 128)) 32]
               [(and  (equal? num_2 32) (equal? num_3 16) (equal? num_4 32) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 48) (equal? num_9 64)) 16]
               [(and  (equal? num_2 64) (equal? num_3 16) (equal? num_4 64) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 112) (equal? num_9 128)) 16]
               )

             ]
            [(_mm256_srai_epi32_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
             (cond 
               [(and  (equal? num_5 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_5 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_5 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_5 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 16) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
             (cond 
               [(and  (equal? num_6 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_6 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_cmpeq_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o)
             (cond 
               [(and  (equal? size_i_o 128)) 32]
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 256)) 32]
               )

             ]
            [(_mm512_subs_epi16_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_maskz_sra_epi64_dsl v0 v1 v2 vc_3 num_4)
             (cond 
               [(and  (equal? num_4 128)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 256)) 64]
               [(and  (equal? num_4 128)) 64]
               [(and  (equal? num_4 512)) 64]
               [(and  (equal? num_4 512)) 64]
               )

             ]
            [(_mm_sll_pi16_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_cmpge_epu64_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               )

             ]
            [(_mm512_andnot_epi32_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 256) (equal? prec_i_o 256)) 256]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 128)) 128]
               )

             ]
            [(_mm512_mulhi_epi32_dsl v0 v1)
             (cond 
               [(and ) 32]
               [(and ) 32]
               )

             ]
            [(_mm256_unpacklo_epi32_dsl v0 v1 size_i_o prec_i_o num_4)
             (cond 
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               )

             ]
            [(_mm512_maskz_xor_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_mul_su32_dsl v0 v1)
             (cond 
               [(and ) 64]
               )

             ]
            [(_mm512_mask_unpackhi_epi8_dsl v0 v1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? num_4 512) (equal? num_5 8) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 8) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 256) (equal? num_5 8) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 8) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               )

             ]
            [(_mm_set1_pi8_dsl v0 num_1 prec_i_o)
             (cond 
               [(and  (equal? num_1 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 128)) 128]
               [(and  (equal? num_1 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_1 256) (equal? prec_i_o 128)) 128]
               [(and  (equal? num_1 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_1 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_1 128) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm512_unpackhi_epi64_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 256)) 64]
               [(and  (equal? num_2 128)) 64]
               )

             ]
            [(_mm_mask_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 64) (equal? num_10 64)) 64]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               )

             ]
            [(_mm256_maskz_unpacklo_epi8_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
             (cond 
               [(and  (equal? num_4 256) (equal? num_5 8) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32) (equal? num_9 32) (equal? num_10 32)) 32]
               [(and  (equal? num_4 512) (equal? num_5 8) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 8) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 8) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 8) (equal? num_9 8) (equal? num_10 8)) 8]
               )

             ]
            [(_mm_maskz_broadcast_i32x2_dsl v0 vc_1 v2 num_3 prec_i_o num_5)
             (cond 
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 4)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 8)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 8)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 4)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 2)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 2)) 64]
               [(and  (equal? num_3 256) (equal? prec_i_o 64) (equal? num_5 2)) 64]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 4)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 2)) 64]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 4)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 64) (equal? num_5 4)) 64]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 4)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               [(and  (equal? num_3 512) (equal? prec_i_o 32) (equal? num_5 2)) 32]
               )

             ]
            [(_mm256_maskz_mulhrs_epi16_dsl v0 vc_1 v2 v3 num_4)
             (cond 
               [(and  (equal? num_4 256)) 16]
               [(and  (equal? num_4 512)) 16]
               [(and  (equal? num_4 128)) 16]
               [(and  (equal? num_4 512)) 16]
               [(and  (equal? num_4 256)) 16]
               [(and  (equal? num_4 128)) 16]
               )

             ]
            [(_mm512_maskz_packs_epi16_dsl v0 vc_1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 16) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 16) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 16) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 32) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 32) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 32) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 16) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 32) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               )

             ]
            [(_mm_mask_sra_epi16_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 num_7 prec_i_o num_9)
             (cond 
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               )

             ]
            [(_mm512_fmadd_epi32_dsl v0 v1 v2)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm_maskz_unpackhi_epi32_dsl v0 vc_1 v2 v3 num_4 prec_i_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 32)) 32]
               )

             ]
            [(_mm256_and_si256_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 256) (equal? prec_i_o 256)) 256]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 512) (equal? prec_i_o 512)) 512]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 128)) 128]
               )

             ]
            [(_mm512_mask_mullo_epi64_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 32)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 64)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 128)) 64]
               )

             ]
            [(_mm_hadds_epi16_dsl v0 v1 num_2 num_3 num_4 num_5 num_6)
             (cond 
               [(and  (equal? num_2 64) (equal? num_3 64) (equal? num_4 128) (equal? num_5 128) (equal? num_6 112)) 16]
               [(and  (equal? num_2 32) (equal? num_3 32) (equal? num_4 64) (equal? num_5 64) (equal? num_6 48)) 16]
               )

             ]
            [(_mm_unpacklo_epi32_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 32) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? num_2 32) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? num_2 32) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               )

             ]
            [(_mm_cmpeq_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               )

             ]
            [(_mm512_rem_epu16_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_cvtusepi64_epi8_dsl v0 num_1 prec_o prec_i num_4)
             (cond 
               [(and  (equal? num_1 16) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 112)) 8]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 0)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 64)) 8]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 96)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 64)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 0)) 16]
               [(and  (equal? num_1 64) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 64)) 32]
               [(and  (equal? num_1 64) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 64)) 16]
               [(and  (equal? num_1 32) (equal? prec_o 16) (equal? prec_i 64) (equal? num_4 96)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 32) (equal? prec_i 64) (equal? num_4 0)) 32]
               [(and  (equal? num_1 32) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 96)) 8]
               [(and  (equal? num_1 128) (equal? prec_o 8) (equal? prec_i 32) (equal? num_4 0)) 8]
               [(and  (equal? num_1 256) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               [(and  (equal? num_1 128) (equal? prec_o 16) (equal? prec_i 32) (equal? num_4 0)) 16]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 64) (equal? num_4 64)) 8]
               [(and  (equal? num_1 64) (equal? prec_o 8) (equal? prec_i 16) (equal? num_4 64)) 8]
               )

             ]
            [(_m_paddusw_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               )

             ]
            [(_mm512_maskz_dpwssd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (cond 
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 128)) 32]
               )

             ]
            [(_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o)
             (cond 
               [(and  (equal? size_i_o 128)) 32]
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 256)) 32]
               )

             ]
            [(_m_packsswb_dsl v0 v1 num_2 num_3 num_4 num_5 prec_o num_7 prec_i num_9)
             (cond 
               [(and  (equal? num_2 32) (equal? num_3 8) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 64)) 8]
               [(and  (equal? num_2 32) (equal? num_3 16) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 32) (equal? prec_i 32) (equal? num_9 64)) 16]
               [(and  (equal? num_2 32) (equal? num_3 8) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 64)) 8]
               [(and  (equal? num_2 64) (equal? num_3 16) (equal? num_4 64) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 32) (equal? prec_i 32) (equal? num_9 128)) 16]
               [(and  (equal? num_2 64) (equal? num_3 8) (equal? num_4 64) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 128)) 8]
               [(and  (equal? num_2 32) (equal? num_3 16) (equal? num_4 32) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 32) (equal? prec_i 32) (equal? num_9 64)) 16]
               )

             ]
            [(_mm_mask_packus_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? num_4 16) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 32) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 16) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 32) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm256_min_epi16_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm_mask_madd52hi_epu64_dsl v0 v1 v2 v3 num_4 num_5)
             (cond 
               [(and  (equal? num_4 104) (equal? num_5 52)) 64]
               [(and  (equal? num_4 208) (equal? num_5 52)) 64]
               [(and  (equal? num_4 416) (equal? num_5 52)) 64]
               [(and  (equal? num_4 104) (equal? num_5 0)) 64]
               [(and  (equal? num_4 416) (equal? num_5 0)) 64]
               [(and  (equal? num_4 208) (equal? num_5 0)) 64]
               )

             ]
            [(_mm512_mask_div_epi32_dsl v0 v1 v2 v3)
             (cond 
               [(and ) 32]
               )

             ]
            [(_m_psllwi_dsl v0 vc_1 vc_2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 32) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 32) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm256_broadcastmw_epi32_dsl v0 num_1 prec_i prec_o)
             (cond 
               [(and  (equal? num_1 128) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 16) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 32) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 16) (equal? prec_o 32)) 32]
               )

             ]
            [(_mm_mask_andnot_epi32_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               )

             ]
            [(_mm256_mask_add_epi8_dsl v0 v1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_dpwssd_epi32_dsl v0 v1 v2 size_i)
             (cond 
               [(and  (equal? size_i 128)) 32]
               [(and  (equal? size_i 256)) 32]
               [(and  (equal? size_i 512)) 32]
               )

             ]
            [(_mm256_cmple_epi32_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               )

             ]
            [(_mm256_unpackhi_epi8_dsl v0 v1 size_i_o prec_i_o num_4)
             (cond 
               [(and  (equal? size_i_o 256) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 16) (equal? num_4 16)) 16]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 8) (equal? num_4 8)) 8]
               )

             ]
            [(_mm_madd_pi16_dsl v0 v1 num_2)
             (cond 
               [(and  (equal? num_2 32)) 32]
               [(and  (equal? num_2 256)) 32]
               [(and  (equal? num_2 64)) 32]
               [(and  (equal? num_2 128)) 32]
               [(and  (equal? num_2 32)) 32]
               )

             ]
            [(_mm256_mask_cvtepi8_epi32_dsl v0 v1 v2 num_3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 32) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 16) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 16) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 64) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 32) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 256) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 64) (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 128) (equal? num_4 8) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 64) (equal? num_4 16) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_3 32) (equal? num_4 8) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 128) (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_3 256) (equal? num_4 8) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm256_mask_packus_epi16_dsl v0 v1 v2 v3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 16) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 32) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 16) (equal? num_6 16) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 512) (equal? num_5 32) (equal? num_6 32) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 16) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 32) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 256) (equal? num_5 32) (equal? num_6 32) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16) (equal? num_10 16)) 16]
               [(and  (equal? num_4 512) (equal? num_5 16) (equal? num_6 16) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 8) (equal? num_10 8)) 8]
               )

             ]
            [(_mm256_packs_epi32_dsl v0 v1 size_i_o num_3 prec_o num_5 prec_i)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 16) (equal? prec_o 16) (equal? num_5 32) (equal? prec_i 32)) 16]
               [(and  (equal? size_i_o 256) (equal? num_3 8) (equal? prec_o 8) (equal? num_5 16) (equal? prec_i 16)) 8]
               [(and  (equal? size_i_o 512) (equal? num_3 16) (equal? prec_o 16) (equal? num_5 32) (equal? prec_i 32)) 16]
               [(and  (equal? size_i_o 512) (equal? num_3 8) (equal? prec_o 8) (equal? num_5 16) (equal? prec_i 16)) 8]
               )

             ]
            [(_mm_cmpgt_epu8_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               )

             ]
            [(_mm256_cmpge_epi64_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               )

             ]
            [(_mm_maskz_srl_epi64_dsl v0 v1 vc_2 vc_3 v4 num_5)
             (cond 
               [(and  (equal? num_5 128)) 64]
               [(and  (equal? num_5 128)) 64]
               [(and  (equal? num_5 256)) 64]
               [(and  (equal? num_5 512)) 64]
               [(and  (equal? num_5 512)) 64]
               [(and  (equal? num_5 256)) 64]
               )

             ]
            [(_mm256_maskz_dpwssds_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o)
             (cond 
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 512)) 32]
               [(and  (equal? size_i_o 128)) 32]
               )

             ]
            [(_m_punpckhdq_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 64) (equal? num_4 64)) 64]
               )

             ]
            [(_mm256_dpbusd_epi32_dsl v0 v1 v2 size_i)
             (cond 
               [(and  (equal? size_i 256)) 32]
               [(and  (equal? size_i 128)) 32]
               [(and  (equal? size_i 512)) 32]
               )

             ]
            [(_mm512_mask_cmpneq_epu16_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 num_6 prec_i num_8)
             (cond 
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 64) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 64) (equal? num_8 4)) 1]
               [(and  (equal? num_6 4) (equal? prec_i 32) (equal? num_8 4)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 32) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 16) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 64) (equal? prec_i 8) (equal? num_8 0)) 1]
               [(and  (equal? num_6 8) (equal? prec_i 32) (equal? num_8 0)) 1]
               [(and  (equal? num_6 2) (equal? prec_i 64) (equal? num_8 6)) 1]
               [(and  (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0)) 1]
               )

             ]
            [(_mm_mask_packs_epi16_dsl v0 v1 v2 v3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? num_4 16) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 32) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 32) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 16) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 8)) 8]
               )

             ]
            [(_mm_mask_rol_epi64_dsl v0 v1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
             (cond 
               [(and  (equal? num_6 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 32) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm256_cvtepu16_epi32_dsl v0 num_1 prec_i prec_o)
             (cond 
               [(and  (equal? num_1 128) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 256) (equal? prec_i 8) (equal? prec_o 16)) 16]
               [(and  (equal? num_1 32) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i 8) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i 8) (equal? prec_o 16)) 16]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 32) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 128) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 256) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 64) (equal? prec_i 16) (equal? prec_o 32)) 32]
               [(and  (equal? num_1 16) (equal? prec_i 8) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 32) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 128) (equal? prec_i 16) (equal? prec_o 64)) 64]
               [(and  (equal? num_1 64) (equal? prec_i 8) (equal? prec_o 16)) 16]
               )

             ]
            [(_mm_mask_unpacklo_epi16_dsl v0 v1 v2 v3 num_4 prec_i_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 16) (equal? num_8 16)) 16]
               [(and  (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 32) (equal? num_7 32) (equal? num_8 32)) 32]
               [(and  (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 8) (equal? num_7 8) (equal? num_8 8)) 8]
               [(and  (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 16) (equal? num_7 16) (equal? num_8 16)) 16]
               )

             ]
            [(_mm_movemask_pi8_dsl v0 num_1 num_2)
             (cond 
               [(and  (equal? num_1 8) (equal? num_2 24)) 1]
               [(and  (equal? num_1 16) (equal? num_2 16)) 1]
               [(and  (equal? num_1 8) (equal? num_2 24)) 1]
               [(and  (equal? num_1 32) (equal? num_2 0)) 1]
               )

             ]
            [(_mm512_maskz_unpacklo_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
             (cond 
               [(and  (equal? num_4 256) (equal? num_5 512)) 64]
               [(and  (equal? num_4 128) (equal? num_5 256)) 64]
               [(and  (equal? num_4 256) (equal? num_5 512)) 64]
               [(and  (equal? num_4 128) (equal? num_5 256)) 64]
               )

             ]
            [(_mm_maskz_srai_epi64_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 num_7 prec_i_o num_9)
             (cond 
               [(and  (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 64)) 64]
               [(and  (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               [(and  (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 16)) 16]
               [(and  (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 32)) 32]
               )

             ]
            [(_mm512_mask_rolv_epi64_dsl v0 vc_1 vc_2 v3 v4 v5 num_6 prec_i_o)
             (cond 
               [(and  (equal? num_6 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_hadd_pi32_dsl v0 v1)
             (cond 
               [(and ) 32]
               )

             ]
            [(_mm256_add_epi8_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_2 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_2 64) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm256_maskz_rorv_epi64_dsl v0 vc_1 vc_2 vc_3 v4 v5 num_6 prec_i_o)
             (cond 
               [(and  (equal? num_6 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm512_maskz_unpackhi_epi64_dsl v0 vc_1 v2 v3 num_4 num_5)
             (cond 
               [(and  (equal? num_4 256) (equal? num_5 512)) 64]
               [(and  (equal? num_4 128) (equal? num_5 256)) 64]
               [(and  (equal? num_4 128) (equal? num_5 256)) 64]
               [(and  (equal? num_4 256) (equal? num_5 512)) 64]
               )

             ]
            [(_mm256_extract_epi8_dsl vc_0 v1 v2 num_3 num_4 prec_i num_6)
             (cond 
               [(and  (equal? num_3 5) (equal? num_4 5) (equal? prec_i 256) (equal? num_6 0)) 8]
               [(and  (equal? num_3 4) (equal? num_4 4) (equal? prec_i 128) (equal? num_6 24)) 8]
               )

             ]
            [(_mm256_maskz_max_epu8_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_4 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_sra_pi16_dsl vc_0 v1 vc_2 v3 vc_4 num_5 prec_i_o)
             (cond 
               [(and  (equal? num_5 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 512) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_5 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_5 256) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm256_mask_cvtsepi32_epi16_dsl v0 v1 v2 num_3 prec_i_o num_5 num_6)
             (cond 
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 64)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 256) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 96)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 64)) 32]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 64)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 96)) 8]
               [(and  (equal? num_3 256) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 0)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 64)) 16]
               [(and  (equal? num_3 256) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 112)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 64)) 8]
               [(and  (equal? num_3 64) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 64)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 0)) 16]
               [(and  (equal? num_3 32) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 96)) 8]
               [(and  (equal? num_3 128) (equal? prec_i_o 32) (equal? num_5 64) (equal? num_6 0)) 32]
               [(and  (equal? num_3 64) (equal? prec_i_o 16) (equal? num_5 32) (equal? num_6 64)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 32) (equal? num_6 0)) 8]
               [(and  (equal? num_3 16) (equal? prec_i_o 8) (equal? num_5 64) (equal? num_6 112)) 8]
               [(and  (equal? num_3 32) (equal? prec_i_o 16) (equal? num_5 64) (equal? num_6 96)) 16]
               [(and  (equal? num_3 128) (equal? prec_i_o 8) (equal? num_5 16) (equal? num_6 0)) 8]
               )

             ]
            [(_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o)
             (cond 
               [(and  (equal? size_i_o 256)) 32]
               [(and  (equal? size_i_o 128)) 32]
               [(and  (equal? size_i_o 512)) 32]
               )

             ]
            [(_mm256_rol_epi64_dsl vc_0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 32) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 16) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 64) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 64) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 32) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm512_maskz_and_epi64_dsl v0 vc_1 v2 v3 num_4 prec_i_o)
             (cond 
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 256) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 512) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 64)) 64]
               [(and  (equal? num_4 128) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 512) (equal? prec_i_o 32)) 32]
               [(and  (equal? num_4 256) (equal? prec_i_o 32)) 32]
               )

             ]
            [(_mm_cmplt_epi16_mask_dsl v0 v1 num_2 prec_i num_4)
             (cond 
               [(and  (equal? num_2 8) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 64) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 64) (equal? num_4 4)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 2) (equal? prec_i 64) (equal? num_4 6)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 16) (equal? prec_i 32) (equal? num_4 0)) 1]
               [(and  (equal? num_2 32) (equal? prec_i 16) (equal? num_4 0)) 1]
               [(and  (equal? num_2 4) (equal? prec_i 32) (equal? num_4 4)) 1]
               [(and  (equal? num_2 64) (equal? prec_i 8) (equal? num_4 0)) 1]
               [(and  (equal? num_2 8) (equal? prec_i 32) (equal? num_4 0)) 1]
               )

             ]
            [(_mm256_blend_epi16_dsl v0 v1 v2)
             (cond 
               [(and ) 16]
               )

             ]
            [(_mm256_hsubs_epi16_dsl v0 v1)
             (cond 
               [(and ) 16]
               )

             ]
            [(_mm256_extracti32x4_epi32_dsl v0 v1 prec_i_o num_3)
             (cond 
               [(and  (equal? prec_i_o 128) (equal? num_3 128)) 128]
               [(and  (equal? prec_i_o 256) (equal? num_3 256)) 256]
               [(and  (equal? prec_i_o 128) (equal? num_3 128)) 128]
               [(and  (equal? prec_i_o 256) (equal? num_3 256)) 256]
               [(and  (equal? prec_i_o 128) (equal? num_3 128)) 128]
               [(and  (equal? prec_i_o 128) (equal? num_3 128)) 128]
               )

             ]
            [(_mm_subs_epu8_dsl v0 v1 num_2 prec_i_o)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 256) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 64) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 256) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 128) (equal? prec_i_o 16)) 16]
               [(and  (equal? num_2 64) (equal? prec_i_o 8)) 8]
               [(and  (equal? num_2 512) (equal? prec_i_o 16)) 16]
               )

             ]
            [(_mm512_mask_srli_epi64_dsl vc_0 v1 v2 vc_3 v4 v5 num_6 prec_i_o num_8)
             (cond 
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 256) (equal? prec_i_o 64) (equal? num_8 64)) 64]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 16)) 16]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               [(and  (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 32)) 32]
               )

             ]
            [(_mm256_set_m128i_dsl v0 v1 num_2 prec_i_o num_4)
             (cond 
               [(and  (equal? num_2 128) (equal? prec_i_o 128) (equal? num_4 128)) 128]
               [(and  (equal? num_2 64) (equal? prec_i_o 64) (equal? num_4 64)) 64]
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 32) (equal? prec_i_o 32) (equal? num_4 32)) 32]
               [(and  (equal? num_2 128) (equal? prec_i_o 128) (equal? num_4 128)) 128]
               )

             ]

            [
             v

             1
             ]
            )
  )

;; ================================================================================

