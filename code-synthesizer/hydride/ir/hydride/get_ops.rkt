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
;;                                DSL Get Ops
;; ================================================================================
(define (hydride:get-bv-ops prog)
  (destruct prog
            [(reg id) '()]
            [(lit v) '()]
            [(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
             (remove-duplicates (append (list  'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))
             ]
            [(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))
             ]
            [(interleave-vector_dsl v0 size_i_o prec_i_o)
             (remove-duplicates (append (list  'cond) (hydride:get-bv-ops v0)))
             ]
            [(deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (remove-duplicates (append (list  'cond) (hydride:get-bv-ops v0)))
             ]
            [(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
             (remove-duplicates (append (list  'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))
             ]
            [(_mm512_rem_epu32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsrem) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_rem_epu32")]
               )

             ]
            [(_mm512_or_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_or_epi32")]
               )

             ]
            [(_mm256_mask_min_epi8_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_mask_min_epi8")]
               )

             ]
            [(_mm256_xor_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_xor_epi32")]
               )

             ]
            [(_mm_add_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_add_si64")]
               )

             ]
            [(_m_packssdw_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 32) (equal? num_8 64) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _m_packssdw")]
               )

             ]
            [(_mm512_maskz_packus_epi32_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (cond 
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 512) (equal? num_14 512) (equal? num_15 0) (equal? num_16 512) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 256) (equal? num_14 256) (equal? num_15 0) (equal? num_16 256) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_packus_epi32")]
               )

             ]
            [(_mm256_xor_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 256) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 128) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_xor_si256")]
               )

             ]
            [(_mm_rolv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_rolv_epi32")]
               )

             ]
            [(_mm_maskz_srl_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_maskz_srl_epi32")]
               )

             ]
            [(_mm512_maskz_avg_epu16_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 8) (equal? num_12 1) (equal? num_13 8) (equal? num_14 -1) (equal? num_15 -1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd 'bvashr) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_maskz_avg_epu16")]
               )

             ]
            [(_mm512_mask_rolv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_mask_rolv_epi32")]
               )

             ]
            [(_mm_hadd_pi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 16) (equal? num_13 -1) (equal? num_14 64) (equal? num_15 48) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 128) (equal? num_15 112) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 16) (equal? num_13 -1) (equal? num_14 128) (equal? num_15 112) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 64) (equal? num_15 48) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 32) (equal? num_13 -1) (equal? num_14 128) (equal? num_15 96) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_hadd_pi16")]
               )

             ]
            [(_mm512_extracti64x4_epi64_dsl vc_0 vc_1 v2 v3 size_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 256) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 256) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 128) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 128) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 128) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 128) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 256) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 256) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 128) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 128) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 128) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 0) (equal? num_13 128) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_extracti64x4_epi64")]
               )

             ]
            [(_mm512_unpacklo_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 2) (equal? num_11 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 2) (equal? num_11 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 2) (equal? num_11 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 2) (equal? num_11 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_unpacklo_epi64")]
               )

             ]
            [(_mm256_cvtepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o prec_i num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 16) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 96)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 16) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 96)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? prec_i 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? prec_i 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 8) (equal? prec_i 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 32) (equal? prec_i 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? prec_i 16) (equal? num_7 1) (equal? num_8 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm256_cvtepi64_epi32")]
               )

             ]
            [(_mm256_max_epu64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumax) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_max_epu64")]
               )

             ]
            [(_mm_broadcastmb_epi64_dsl v0 size_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm_broadcastmb_epi64")]
               )

             ]
            [(_mm_unpacklo_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 64) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_unpacklo_pi32")]
               )

             ]
            [(_mm512_srav_epi16_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 256) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 256) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 256) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm512_srav_epi16")]
               )

             ]
            [(_mm_unpacklo_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 32) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 32) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 32) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 32) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 0) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_unpacklo_pi8")]
               )

             ]
            [(_mm_mask_mul_epu32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 0) (equal? num_15 0) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 1) (equal? num_16 1) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_mask_mul_epu32")]
               )

             ]
            [(_mm256_mul_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 128) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 256) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 256) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 128) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_mul_epi32")]
               )

             ]
            [(_mm256_mask_testn_epi32_mask_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 vc_6 v7 size_i_o num_9 num_10 num_11 prec_o num_13 prec_i num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 4) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 4) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 4) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 2) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 2) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 4) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_o 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v7)))]
               [else (error "Unable to get ops  for _mm256_mask_testn_epi32_mask")]
               )

             ]
            [(_mm_rorv_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 -1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_rorv_epi32")]
               )

             ]
            [(_mm512_mulhi_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_mulhi_epu16")]
               )

             ]
            [(_mm_mul_su32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_mul_su32")]
               )

             ]
            [(_mm_broadcast_i32x2_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 2) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 2) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 2) (equal? num_7 64) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 4) (equal? num_7 64) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 4) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 4) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 8) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 2) (equal? num_7 64) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 2) (equal? num_7 32) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm_broadcast_i32x2")]
               )

             ]
            [(_mm_mask_ror_epi32_dsl vc_0 v1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 16) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 16) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_mask_ror_epi32")]
               )

             ]
            [(_mm_mask_rol_epi32_dsl vc_0 v1 v2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 128) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 32) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 16) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 16) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 64) (equal? num_11 8) (equal? num_12 1) (equal? num_13 8) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 0) (equal? num_20 1) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_mask_rol_epi32")]
               )

             ]
            [(_mm_hadd_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_hadd_pi32")]
               )

             ]
            [(_mm256_mask_cmpeq_epu8_mask_dsl v0 vc_1 v2 v3 vc_4 vc_5 vc_6 size_i_o num_8 num_9 num_10 prec_o num_12 prec_i num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 8) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 64) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 32) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? prec_i 16) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_mask_cmpeq_epu8_mask")]
               )

             ]
            [(_mm_movemask_epi8_dsl v0 size_o num_2 num_3 num_4 prec_o num_6 num_7 num_8)
             (cond 
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 1) (equal? num_6 7) (equal? num_7 8) (equal? num_8 16)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 1) (equal? num_6 7) (equal? num_7 8) (equal? num_8 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 7) (equal? num_7 8) (equal? num_8 24)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 1) (equal? num_6 7) (equal? num_7 8) (equal? num_8 24)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm_movemask_epi8")]
               )

             ]
            [(_mm512_sll_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_sll_epi64")]
               )

             ]
            [(_mm_sign_pi16_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? prec_i_o 16) (equal? num_13 16) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 32) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? prec_i_o 16) (equal? num_13 16) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? num_10 1) (equal? num_11 8) (equal? prec_i_o 8) (equal? num_13 8) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? prec_i_o 16) (equal? num_13 16) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 32) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? num_9 8) (equal? num_10 1) (equal? num_11 8) (equal? prec_i_o 8) (equal? num_13 8) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 32) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 8) (equal? num_10 1) (equal? num_11 8) (equal? prec_i_o 8) (equal? num_13 8) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvslt 'bvneg 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_sign_pi16")]
               )

             ]
            [(_mm512_mask_sll_epi64_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_mask_sll_epi64")]
               )

             ]
            [(_mm_add_pi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvaddnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_add_pi8")]
               )

             ]
            [(_mm512_mask_srav_epi32_dsl v0 v1 vc_2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 16) (equal? prec_i_o 16) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 32) (equal? prec_i_o 32) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? prec_i_o 64) (equal? num_19 1) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvult 'cond 'if 'bvashr 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [else (error "Unable to get ops  for _mm512_mask_srav_epi32")]
               )

             ]
            [(_mm_hsub_pi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_hsub_pi32")]
               )

             ]
            [(_mm256_mulhrs_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr 'sign-extend 'bvmul) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr 'sign-extend 'bvmul) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr 'sign-extend 'bvmul) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr 'sign-extend 'bvmul) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_mulhrs_epi16")]
               )

             ]
            [(_mm256_mask_madd52hi_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 208) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 52) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 104) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 0) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 208) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 0) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 104) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 52) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 416) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 52) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 416) (equal? num_9 52) (equal? num_10 1) (equal? num_11 52) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 0) (equal? num_15 52) (equal? num_16 0) (equal? num_17 0) (equal? num_18 128) (equal? num_19 0) (equal? num_20 52) (equal? num_21 52) (equal? num_22 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_mask_madd52hi_epu64")]
               )

             ]
            [(_mm512_mask_extracti64x4_epi64_dsl v0 vc_1 vc_2 v3 vc_4 v5 v6 num_7 num_8 num_9 num_10 num_11 size_i_o num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
             (cond 
               [(and  (equal? num_7 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 512) (equal? size_i_o 256) (equal? num_13 256) (equal? num_14 0) (equal? num_15 256) (equal? prec_i_o 64) (equal? num_17 1) (equal? num_18 256) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 256) (equal? num_23 1) (equal? num_24 64) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 512) (equal? size_i_o 256) (equal? num_13 256) (equal? num_14 0) (equal? num_15 256) (equal? prec_i_o 32) (equal? num_17 1) (equal? num_18 256) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 256) (equal? num_23 1) (equal? num_24 32) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 512) (equal? size_i_o 256) (equal? num_13 256) (equal? num_14 0) (equal? num_15 256) (equal? prec_i_o 32) (equal? num_17 1) (equal? num_18 256) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 256) (equal? num_23 1) (equal? num_24 32) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 256) (equal? size_i_o 128) (equal? num_13 128) (equal? num_14 0) (equal? num_15 128) (equal? prec_i_o 64) (equal? num_17 1) (equal? num_18 128) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 128) (equal? num_23 1) (equal? num_24 64) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 256) (equal? size_i_o 128) (equal? num_13 128) (equal? num_14 0) (equal? num_15 128) (equal? prec_i_o 64) (equal? num_17 1) (equal? num_18 128) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 128) (equal? num_23 1) (equal? num_24 64) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 512) (equal? size_i_o 256) (equal? num_13 256) (equal? num_14 0) (equal? num_15 256) (equal? prec_i_o 64) (equal? num_17 1) (equal? num_18 256) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 256) (equal? num_23 1) (equal? num_24 64) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 256) (equal? size_i_o 128) (equal? num_13 128) (equal? num_14 0) (equal? num_15 128) (equal? prec_i_o 32) (equal? num_17 1) (equal? num_18 128) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 128) (equal? num_23 1) (equal? num_24 32) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? num_7 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 256) (equal? size_i_o 128) (equal? num_13 128) (equal? num_14 0) (equal? num_15 128) (equal? prec_i_o 32) (equal? num_17 1) (equal? num_18 128) (equal? num_19 0) (equal? num_20 0) (equal? num_21 0) (equal? num_22 128) (equal? num_23 1) (equal? num_24 32) (equal? num_25 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_mask_extracti64x4_epi64")]
               )

             ]
            [(_mm512_extracti64x2_epi64_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 size_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? prec_i_o 128) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0) (equal? num_16 128) (equal? num_17 0) (equal? num_18 256) (equal? num_19 0) (equal? num_20 384) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? prec_i_o 128) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0) (equal? num_16 128) (equal? num_17 0) (equal? num_18 256) (equal? num_19 0) (equal? num_20 384) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5)))]
               [else (error "Unable to get ops  for _mm512_extracti64x2_epi64")]
               )

             ]
            [(_mm512_sra_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 512) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 256) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 0) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm512_sra_epi64")]
               )

             ]
            [(_mm256_maskz_max_epi32_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsmax) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvumax) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_maskz_max_epi32")]
               )

             ]
            [(_mm_abs_epi16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0)) 
                (remove-duplicates (append (list  'abs) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm_abs_epi16")]
               )

             ]
            [(_mm512_unpacklo_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_unpacklo_epi16")]
               )

             ]
            [(_mm512_fmadd_epi32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm512_fmadd_epi32")]
               )

             ]
            [(_mm_div_epi64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 128) (equal? num_10 1) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 128) (equal? num_10 1) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 128) (equal? num_10 1) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'sign-extend 'bvsdiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvudiv) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_div_epi64")]
               )

             ]
            [(_mm256_mask_sllv_epi16_dsl v0 v1 vc_2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm256_mask_sllv_epi16")]
               )

             ]
            [(_mm256_mask_abs_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'abs) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_mask_abs_epi16")]
               )

             ]
            [(_mm_cmpgt_epi16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0)) 
                (remove-duplicates (append (list  'if 'bvsgt) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_cmpgt_epi16")]
               )

             ]
            [(_mm256_unpackhi_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 2) (equal? num_9 64) (equal? num_10 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_unpackhi_epi16")]
               )

             ]
            [(_mm_mask_packs_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 size_i_o num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27)
             (cond 
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 0) (equal? num_20 2) (equal? num_21 16) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 1) (equal? num_20 2) (equal? num_21 8) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 16) (equal? num_10 128) (equal? num_11 256) (equal? num_12 16) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 8) (equal? num_18 8) (equal? num_19 0) (equal? num_20 2) (equal? num_21 8) (equal? num_22 0) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 8) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 32) (equal? num_10 128) (equal? num_11 256) (equal? num_12 32) (equal? size_i_o 128) (equal? num_14 128) (equal? num_15 0) (equal? num_16 128) (equal? prec_i_o 16) (equal? num_18 16) (equal? num_19 1) (equal? num_20 2) (equal? num_21 16) (equal? num_22 1) (equal? num_23 128) (equal? num_24 2) (equal? num_25 1) (equal? num_26 16) (equal? num_27 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_mask_packs_epi16")]
               )

             ]
            [(_mm512_maskz_xor_epi32_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvxor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_xor_epi32")]
               )

             ]
            [(_mm_mask_sra_epi64_dsl vc_0 v1 v2 vc_3 vc_4 v5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v8)))]
               [else (error "Unable to get ops  for _mm_mask_sra_epi64")]
               )

             ]
            [(_mm_mask_or_epi64_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_mask_or_epi64")]
               )

             ]
            [(_mm512_cmplt_epi32_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bvslt 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'if 'bvult) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_cmplt_epi32_mask")]
               )

             ]
            [(_mm512_sllv_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvult 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_sllv_epi16")]
               )

             ]
            [(_mm512_mask3_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 64) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask3_fmadd_epi32")]
               )

             ]
            [(_mm_mask_unpackhi_epi32_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (cond 
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 0) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_mask_unpackhi_epi32")]
               )

             ]
            [(_mm256_dpbusd_epi32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i 256) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 256) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm256_dpbusd_epi32")]
               )

             ]
            [(_mm_avg_epu8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'bvashr) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_avg_epu8")]
               )

             ]
            [(_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bvashr 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm256_maskz_mulhrs_epi16")]
               )

             ]
            [(_mm256_hadd_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 32) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 128) (equal? num_15 96) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? num_14 128) (equal? num_15 112) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvaddnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 128) (equal? num_15 112) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvadd) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_hadd_epi32")]
               )

             ]
            [(_mm256_and_si256_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 256) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 128) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_and_si256")]
               )

             ]
            [(_mm256_cmpeq_epu64_mask_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 6)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 6)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_cmpeq_epu64_mask")]
               )

             ]
            [(_mm512_mask_cvtsepi16_epi8_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 112)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 112)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 112)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 112)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 96)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 64)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_mask_cvtsepi16_epi8")]
               )

             ]
            [(_mm512_mulhi_epu32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 64) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm512_mulhi_epu32")]
               )

             ]
            [(_mm512_broadcastq_epi64_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 256) (equal? prec_i_o 128) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm512_broadcastq_epi64")]
               )

             ]
            [(_mm_sub_si64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_sub_si64")]
               )

             ]
            [(_mm256_extract_epi8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 5) (equal? num_4 5) (equal? num_5 0) (equal? num_6 5) (equal? num_7 5) (equal? prec_o 8) (equal? num_9 0) (equal? prec_i 256) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? num_7 4) (equal? prec_o 8) (equal? num_9 0) (equal? prec_i 128) (equal? num_11 0) (equal? num_12 24)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm256_extract_epi8")]
               )

             ]
            [(_mm_mask_srai_epi16_dsl vc_0 v1 v2 vc_3 v4 vc_5 vc_6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 64) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 8) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 8) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_mask_srai_epi16")]
               )

             ]
            [(_mm256_sra_epi32_dsl v0 vc_1 vc_2 v3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 256) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 256) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 128) (equal? num_10 32) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_7 64) (equal? num_8 0) (equal? num_9 64) (equal? num_10 16) (equal? num_11 0) (equal? num_12 64) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_sra_epi32")]
               )

             ]
            [(_m_psrawi_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 128) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 256) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 64) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 128) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 16) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 8) (equal? num_7 8) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? num_13 0) (equal? prec_i_o 64) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _m_psrawi")]
               )

             ]
            [(_mm512_packs_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 prec_i num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 2) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 2) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 2) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 2) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 0) (equal? num_11 16) (equal? num_12 2) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 8) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_o 16) (equal? num_10 1) (equal? num_11 32) (equal? num_12 2) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_packs_epi32")]
               )

             ]
            [(_mm256_mask_rorv_epi32_dsl v0 vc_1 vc_2 vc_3 v4 v5 v6 size_i_o num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 -1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'cond 'bvashr 'bvshl 'bveq 'bvsub 'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm256_mask_rorv_epi32")]
               )

             ]
            [(_mm512_maskz_srl_epi64_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_maskz_srl_epi64")]
               )

             ]
            [(_mm512_mask_rem_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsrem) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsrem) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask_rem_epi32")]
               )

             ]
            [(_mm256_madd52hi_epu64_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 208) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 52) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 416) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 52) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 104) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 52) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 104) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 208) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 416) (equal? prec_i 52) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 52) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvadd 'bvmul) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm256_madd52hi_epu64")]
               )

             ]
            [(_mm_min_epu16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvumin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsmin) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_min_epu16")]
               )

             ]
            [(_mm_andnot_si128_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 128) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 256) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_andnot_si128")]
               )

             ]
            [(_mm256_maskz_cvtepi16_epi8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 96)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 96)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 96)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 96)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 32) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 64) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 1) (equal? num_13 64)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_maskz_cvtepi16_epi8")]
               )

             ]
            [(_mm_test_epi64_mask_dsl vc_0 v1 vc_2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 4)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 6)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_11 1) (equal? num_12 0)) 
                (remove-duplicates (append (list  'bveq 'if 'bvand) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_test_epi64_mask")]
               )

             ]
            [(_mm512_cvtepu8_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'sign-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 16) (equal? prec_i 8) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 1) (equal? num_8 0) (equal? num_9 0)) 
                (remove-duplicates (append (list  'zero-extend) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm512_cvtepu8_epi32")]
               )

             ]
            [(_mm256_mask_cmpgt_epu64_mask_dsl v0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 prec_i num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 4) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 4)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 8) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 2) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 64) (equal? num_15 1) (equal? num_16 6)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 16) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 0) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvugt 'if) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 1) (equal? num_12 1) (equal? num_13 1) (equal? prec_i 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'if 'bvsgt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v5) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm256_mask_cmpgt_epu64_mask")]
               )

             ]
            [(_mm_maskz_unpacklo_epi64_dsl v0 vc_1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 128) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 0) (equal? num_18 64) (equal? num_19 0) (equal? num_20 0) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 128) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 64) (equal? num_19 0) (equal? num_20 64) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 128) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 0) (equal? num_18 64) (equal? num_19 0) (equal? num_20 0) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? num_9 128) (equal? size_i_o 128) (equal? num_11 128) (equal? num_12 0) (equal? num_13 128) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 64) (equal? num_19 0) (equal? num_20 64) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_maskz_unpacklo_epi64")]
               )

             ]
            [(_mm512_maskz_unpackhi_epi64_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? num_5 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 64) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 64) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 64) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 64) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 64) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 256) (equal? num_9 64) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 64) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 64) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 64) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 64) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 0) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 128) (equal? num_9 64) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 64) (equal? num_15 64) (equal? num_16 64) (equal? num_17 64) (equal? num_18 0) (equal? num_19 64) (equal? num_20 2) (equal? num_21 1) (equal? num_22 64) (equal? num_23 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_unpackhi_epi64")]
               )

             ]
            [(_mm512_mask_div_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvsdiv) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvudiv) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask_div_epi32")]
               )

             ]
            [(_mm_maskz_sll_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 64) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 64) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_maskz_sll_epi32")]
               )

             ]
            [(_mm512_and_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_and_epi32")]
               )

             ]
            [(_mm256_mask_dpbusd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
             (cond 
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 8) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 16) (equal? num_19 0) (equal? num_20 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_mask_dpbusd_epi32")]
               )

             ]
            [(_m_pslld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _m_pslld")]
               )

             ]
            [(_mm512_andnot_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
                (remove-duplicates (append (list  'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_andnot_epi32")]
               )

             ]
            [(_mm512_mask_mulhi_epu32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bvashr 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 512) (equal? prec_i_o 32) (equal? num_11 1) (equal? num_12 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bvashr 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [else (error "Unable to get ops  for _mm512_mask_mulhi_epu32")]
               )

             ]
            [(_mm512_subs_epi8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsubnuw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 64) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm512_subs_epi8")]
               )

             ]
            [(_mm256_rol_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_rol_epi32")]
               )

             ]
            [(_m_from_int_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
             (cond 
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 96)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 32)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
                (remove-duplicates (append (list  ) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _m_from_int")]
               )

             ]
            [(_m_psrld_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _m_psrld")]
               )

             ]
            [(_mm512_mask_fmadd_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 64) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask_fmadd_epi32")]
               )

             ]
            [(_mm512_srli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvlshr) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_srli_epi16")]
               )

             ]
            [(_mm512_cmpneq_epu8_mask_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 6)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 6)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? prec_i 16) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? prec_i 32) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? prec_i 64) (equal? num_10 1) (equal? num_11 4)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_cmpneq_epu8_mask")]
               )

             ]
            [(_mm512_mask_srlv_epi64_dsl vc_0 v1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 16) (equal? prec_i_o 16) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 32) (equal? prec_i_o 32) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 64) (equal? prec_i_o 64) (equal? num_17 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'bvult) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm512_mask_srlv_epi64")]
               )

             ]
            [(_mm512_maskz_mulhi_epi16_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0) (equal? num_13 0) (equal? num_14 64) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0) (equal? num_13 0) (equal? num_14 128) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 16) (equal? num_13 0) (equal? num_14 32) (equal? num_15 0) (equal? num_16 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_mulhi_epi16")]
               )

             ]
            [(_mm512_cvtusepi64_epi32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 prec_i num_8 num_9)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 32) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 112)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 112)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 32) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_2 256) (equal? num_3 0) (equal? num_4 256) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 8) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 96)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? prec_i 64) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvusat) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? prec_i 32) (equal? num_8 1) (equal? num_9 64)) 
                (remove-duplicates (append (list  'bvssat) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm512_cvtusepi64_epi32")]
               )

             ]
            [(_mm512_slli_epi16_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 16) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? num_11 0) (equal? prec_i_o 32) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0) (equal? num_16 8) (equal? num_17 0) (equal? num_18 0)) 
                (remove-duplicates (append (list  'cond 'zero-extend 'bvugt 'bvshl) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_slli_epi16")]
               )

             ]
            [(_mm256_mask_unpackhi_epi16_dsl vc_0 v1 v2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
             (cond 
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 8) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 16) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 64) (equal? num_20 1) (equal? num_21 32) (equal? num_22 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_mask_unpackhi_epi16")]
               )

             ]
            [(_mm512_maskz_unpacklo_epi16_dsl vc_0 v1 vc_2 v3 v4 num_5 num_6 num_7 num_8 num_9 size_i_o num_11 num_12 num_13 prec_i_o num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 1) (equal? num_20 16) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 1) (equal? num_20 16) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 1) (equal? num_20 16) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 1) (equal? num_20 8) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 1) (equal? num_20 32) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 1) (equal? num_20 32) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 1) (equal? num_20 32) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 32) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 32) (equal? num_15 32) (equal? num_16 32) (equal? num_17 32) (equal? num_18 2) (equal? num_19 1) (equal? num_20 32) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 1) (equal? num_20 8) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 16) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 16) (equal? num_15 16) (equal? num_16 16) (equal? num_17 16) (equal? num_18 2) (equal? num_19 1) (equal? num_20 16) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 256) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 256) (equal? num_11 256) (equal? num_12 0) (equal? num_13 256) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 1) (equal? num_20 8) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? num_5 512) (equal? num_6 128) (equal? num_7 0) (equal? num_8 64) (equal? num_9 8) (equal? size_i_o 512) (equal? num_11 512) (equal? num_12 0) (equal? num_13 512) (equal? prec_i_o 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 8) (equal? num_18 2) (equal? num_19 1) (equal? num_20 8) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_unpacklo_epi16")]
               )

             ]
            [(_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 vc_3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
             (cond 
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 16) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 16) (equal? num_10 8) (equal? num_11 0) (equal? num_12 16) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0) (equal? num_19 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [else (error "Unable to get ops  for _mm256_maskz_dpwssd_epi32")]
               )

             ]
            [(_mm512_mask_extracti32x4_epi32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 v8 num_9 num_10 num_11 num_12 num_13 size_i_o num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
             (cond 
               [(and  (equal? num_9 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 512) (equal? size_i_o 128) (equal? num_15 128) (equal? num_16 0) (equal? num_17 128) (equal? prec_i_o 32) (equal? num_19 2) (equal? num_20 0) (equal? num_21 128) (equal? num_22 0) (equal? num_23 0) (equal? num_24 0) (equal? num_25 128) (equal? num_26 0) (equal? num_27 256) (equal? num_28 0) (equal? num_29 384) (equal? num_30 1) (equal? num_31 32) (equal? num_32 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7) (hydride:get-bv-ops v8)))]
               [(and  (equal? num_9 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 512) (equal? size_i_o 128) (equal? num_15 128) (equal? num_16 0) (equal? num_17 128) (equal? prec_i_o 32) (equal? num_19 2) (equal? num_20 0) (equal? num_21 128) (equal? num_22 0) (equal? num_23 0) (equal? num_24 0) (equal? num_25 128) (equal? num_26 0) (equal? num_27 256) (equal? num_28 0) (equal? num_29 384) (equal? num_30 1) (equal? num_31 32) (equal? num_32 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v6) (hydride:get-bv-ops v8)))]
               [(and  (equal? num_9 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 512) (equal? size_i_o 128) (equal? num_15 128) (equal? num_16 0) (equal? num_17 128) (equal? prec_i_o 64) (equal? num_19 2) (equal? num_20 0) (equal? num_21 128) (equal? num_22 0) (equal? num_23 0) (equal? num_24 0) (equal? num_25 128) (equal? num_26 0) (equal? num_27 256) (equal? num_28 0) (equal? num_29 384) (equal? num_30 1) (equal? num_31 64) (equal? num_32 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7) (hydride:get-bv-ops v8)))]
               [(and  (equal? num_9 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 512) (equal? size_i_o 128) (equal? num_15 128) (equal? num_16 0) (equal? num_17 128) (equal? prec_i_o 64) (equal? num_19 2) (equal? num_20 0) (equal? num_21 128) (equal? num_22 0) (equal? num_23 0) (equal? num_24 0) (equal? num_25 128) (equal? num_26 0) (equal? num_27 256) (equal? num_28 0) (equal? num_29 384) (equal? num_30 1) (equal? num_31 64) (equal? num_32 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v6) (hydride:get-bv-ops v8)))]
               [else (error "Unable to get ops  for _mm512_mask_extracti32x4_epi32")]
               )

             ]
            [(_mm512_mask_cvtepi16_epi64_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 1) (equal? num_10 32) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 16) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 64) (equal? num_8 16) (equal? num_9 1) (equal? num_10 16) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'sign-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 32) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? num_9 1) (equal? num_10 8) (equal? prec_i_o 64) (equal? num_12 1) (equal? num_13 0) (equal? num_14 1) (equal? num_15 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_mask_cvtepi16_epi64")]
               )

             ]
            [(_mm_movepi32_mask_dsl v0 vc_1 vc_2 vc_3 size_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 31) (equal? num_11 32) (equal? num_12 4)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 63) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 2) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 63) (equal? num_11 64) (equal? num_12 6)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 15) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 7) (equal? num_11 8) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 31) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 7) (equal? num_11 8) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 15) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 31) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 7) (equal? num_11 8) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 4) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 63) (equal? num_11 64) (equal? num_12 4)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_o 1) (equal? num_9 1) (equal? num_10 15) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [else (error "Unable to get ops  for _mm_movepi32_mask")]
               )

             ]
            [(_m_por_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 256) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 128) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 512) (equal? num_7 0) (equal? num_8 0)) 
                (remove-duplicates (append (list  'bvor) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _m_por")]
               )

             ]
            [(_m_pcmpeqb_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
             (cond 
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0)) 
                (remove-duplicates (append (list  'bveq 'if) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _m_pcmpeqb")]
               )

             ]
            [(_mm_extract_pi16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12 num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? num_7 2) (equal? prec_o 16) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 0) (equal? num_12 5) (equal? num_13 0) (equal? num_14 16)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? num_7 2) (equal? prec_o 16) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 0) (equal? num_12 5) (equal? num_13 0) (equal? num_14 16)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 0) (equal? prec_i 128) (equal? num_11 0) (equal? num_12 7) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? num_7 2) (equal? prec_o 32) (equal? num_9 0) (equal? prec_i 128) (equal? num_11 0) (equal? num_12 6) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? num_7 2) (equal? prec_o 64) (equal? num_9 0) (equal? prec_i 256) (equal? num_11 0) (equal? num_12 7) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 3) (equal? num_4 3) (equal? num_5 0) (equal? num_6 3) (equal? num_7 3) (equal? prec_o 32) (equal? num_9 0) (equal? prec_i 256) (equal? num_11 0) (equal? num_12 6) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? num_7 4) (equal? prec_o 16) (equal? num_9 0) (equal? prec_i 256) (equal? num_11 0) (equal? num_12 5) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i_o 3) (equal? num_4 3) (equal? num_5 0) (equal? num_6 3) (equal? num_7 3) (equal? prec_o 16) (equal? num_9 0) (equal? prec_i 128) (equal? num_11 0) (equal? num_12 5) (equal? num_13 0) (equal? num_14 16)) 
                (remove-duplicates (append (list  'zero-extend 'bvashr 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm_extract_pi16")]
               )

             ]
            [(_mm256_mask_broadcast_i64x2_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 2) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 4) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 8) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 2) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 4) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 4) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 8) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 2) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 4) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 4) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 4) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 32) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 2) (equal? num_12 64) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_mask_broadcast_i64x2")]
               )

             ]
            [(_mm256_hsub_epi32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 32) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 96) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 112) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 256) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? num_14 112) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm256_hsub_epi32")]
               )

             ]
            [(_mm_hsub_epi16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 112) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? num_14 112) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 -1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 48) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 32) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 2) (equal? num_13 1) (equal? num_14 48) (equal? num_15 64) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsubnsw) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 64) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 -1) (equal? num_11 32) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 96) (equal? num_15 128) (equal? num_16 2) (equal? num_17 0)) 
                (remove-duplicates (append (list  'bvsub) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1)))]
               [else (error "Unable to get ops  for _mm_hsub_epi16")]
               )

             ]
            [(_mm512_mask_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
             (cond 
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 32) (equal? num_9 16) (equal? num_10 0) (equal? num_11 32) (equal? num_12 32) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 1) (equal? num_17 1) (equal? num_18 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask_dpwssd_epi32")]
               )

             ]
            [(_mm256_ror_epi32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15)
             (cond 
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 64) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 16) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 32) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0) (equal? num_15 0)) 
                (remove-duplicates (append (list  'bvsmod 'bvashr 'bvshl 'bvsub 'zero-extend 'bvor) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_ror_epi32")]
               )

             ]
            [(_mm256_mask_srli_epi32_dsl v0 vc_1 v2 v3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvlshr 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm256_mask_srli_epi32")]
               )

             ]
            [(_mm_mask_broadcastd_epi32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_mask_broadcastd_epi32")]
               )

             ]
            [(_mm_maskz_madd52lo_epu64_dsl vc_0 v1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 104) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 208) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 416) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 0) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? num_7 128) (equal? num_8 0) (equal? num_9 104) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 52) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? num_7 512) (equal? num_8 0) (equal? num_9 416) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 52) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? num_7 256) (equal? num_8 0) (equal? num_9 208) (equal? num_10 52) (equal? num_11 1) (equal? num_12 52) (equal? prec_i_o 64) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 52) (equal? num_17 52) (equal? num_18 0) (equal? num_19 128) (equal? num_20 0) (equal? num_21 52) (equal? num_22 52) (equal? num_23 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [else (error "Unable to get ops  for _mm_maskz_madd52lo_epu64")]
               )

             ]
            [(_mm256_blendv_epi8_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 7) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 7) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_blendv_epi8")]
               )

             ]
            [(_mm512_srl_epi64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 prec_i_o num_13 num_14)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? num_11 0) (equal? prec_i_o 64) (equal? num_13 0) (equal? num_14 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm512_srl_epi64")]
               )

             ]
            [(_mm256_blend_epi16_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 8) (equal? num_11 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm256_blend_epi16")]
               )

             ]
            [(_mm_mask_sra_epi32_dsl v0 vc_1 v2 vc_3 vc_4 vc_5 v6 v7 vc_8 size_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i_o num_20 num_21 num_22 num_23 num_24)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6) (hydride:get-bv-ops v7)))]
               [(and  (equal? size_i_o 256) (equal? num_10 256) (equal? num_11 0) (equal? num_12 256) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 32) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_10 512) (equal? num_11 0) (equal? num_12 512) (equal? num_13 16) (equal? num_14 1) (equal? num_15 16) (equal? num_16 0) (equal? num_17 64) (equal? num_18 0) (equal? prec_i_o 16) (equal? num_20 1) (equal? num_21 0) (equal? num_22 64) (equal? num_23 0) (equal? num_24 0)) 
                (remove-duplicates (append (list  'cond 'if 'bvashr 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_mask_sra_epi32")]
               )

             ]
            [(_mm_movm_epi8_dsl v0 vc_1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 64) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 16) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 32) (equal? num_11 0)) 
                (remove-duplicates (append (list  'cond 'bveq) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops vc_3)))]
               [else (error "Unable to get ops  for _mm_movm_epi8")]
               )

             ]
            [(_mm_maskz_sub_epi8_dsl vc_0 v1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsub) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvsubnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm_maskz_sub_epi8")]
               )

             ]
            [(_mm512_maskz_andnot_epi64_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvnot 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops vc_2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_maskz_andnot_epi64")]
               )

             ]
            [(_mm512_mask_add_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
             (cond 
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 -1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvadd) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnuw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 8) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvaddnsw) (hydride:get-bv-ops v1) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm512_mask_add_epi32")]
               )

             ]
            [(_mm256_mask_and_epi32_dsl v0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
             (cond 
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 256) (equal? num_6 256) (equal? num_7 0) (equal? num_8 256) (equal? prec_i_o 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [(and  (equal? size_i_o 512) (equal? num_6 512) (equal? num_7 0) (equal? num_8 512) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bveq 'bvand) (hydride:get-bv-ops v0) (hydride:get-bv-ops v2) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4)))]
               [else (error "Unable to get ops  for _mm256_mask_and_epi32")]
               )

             ]
            [(_mm_maskz_slli_epi32_dsl v0 v1 vc_2 vc_3 vc_4 vc_5 v6 size_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 64) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 256) (equal? num_8 256) (equal? num_9 0) (equal? num_10 256) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 128) (equal? num_8 128) (equal? num_9 0) (equal? num_10 128) (equal? num_11 32) (equal? num_12 1) (equal? num_13 32) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 32) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [(and  (equal? size_i_o 512) (equal? num_8 512) (equal? num_9 0) (equal? num_10 512) (equal? num_11 16) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 8) (equal? num_16 0) (equal? prec_i_o 16) (equal? num_18 0) (equal? num_19 8) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'cond 'bvshl 'bveq 'zero-extend 'bvugt) (hydride:get-bv-ops v0) (hydride:get-bv-ops v1) (hydride:get-bv-ops vc_3) (hydride:get-bv-ops v6)))]
               [else (error "Unable to get ops  for _mm_maskz_slli_epi32")]
               )

             ]
            [(_mm256_maddubs_epi16_dsl vc_0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
             (cond 
               [(and  (equal? size_i 256) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 256) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 256) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 64) (equal? prec_o 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul 'zero-extend) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 512) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops vc_0) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [(and  (equal? size_i 256) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 16) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 0)) 
                (remove-duplicates (append (list  'bvadd 'sign-extend 'bvmul) (hydride:get-bv-ops v1) (hydride:get-bv-ops v2)))]
               [else (error "Unable to get ops  for _mm256_maddubs_epi16")]
               )

             ]
            [(_mm_maskz_dpbusds_epi32_dsl v0 vc_1 vc_2 v3 v4 v5 size_i_o prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21)
             (cond 
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 512) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvaddnsw 'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [(and  (equal? size_i_o 256) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 32) (equal? num_10 8) (equal? num_11 0) (equal? num_12 32) (equal? num_13 32) (equal? num_14 1) (equal? num_15 32) (equal? num_16 -1) (equal? num_17 1) (equal? num_18 1) (equal? num_19 16) (equal? num_20 0) (equal? num_21 0)) 
                (remove-duplicates (append (list  'bvadd 'cond 'sign-extend 'bveq 'bvmul 'zero-extend) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3) (hydride:get-bv-ops v4) (hydride:get-bv-ops v5)))]
               [else (error "Unable to get ops  for _mm_maskz_dpbusds_epi32")]
               )

             ]
            [(_mm_srlv_epi32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 prec_i_o num_12)
             (cond 
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_i_o 64) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 256) (equal? num_5 256) (equal? num_6 0) (equal? num_7 256) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_i_o 16) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_i_o 32) (equal? num_12 0)) 
                (remove-duplicates (append (list  'cond 'bvlshr 'bvult) (hydride:get-bv-ops v0) (hydride:get-bv-ops v3)))]
               [else (error "Unable to get ops  for _mm_srlv_epi32")]
               )

             ]
            )
  )
;; ================================================================================
