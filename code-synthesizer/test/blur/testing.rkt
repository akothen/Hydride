#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)


(current-solver (boolector))
(current-bitwidth 16)



(custodian-limit-memory (current-custodian) (* 22000 1024 1024))



;; ================================================================================

(displayln "Creating Grammar ...")
(define scale_factor 1)

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (lit (?? (bitvector (/ 128 scale_factor ))))
     ]
    [(choose* #t #f)
     (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 0 8 (/ 16 scale_factor) )
     ]
    [(choose* #t #f)

     (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 8 8 (/ 16 scale_factor) )
     ]
    [else
      (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 16 8 (/ 16 scale_factor) )
      ]
    ;[else
    ;(lit (?? (bitvector 128)))
    ;]
    )
  )

(define (shuffle vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      8				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      8				;; Lane Size 
      2				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      8				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      8				;; Lane Size 
      4				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      8				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      8				;; Lane Size 
      2				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      vector-two-input-swizzle_dsl
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      (shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
      8				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      8				;; Lane Size 
      4				;; Integer Operand 
      1				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [else
      (mem vars #:depth k)
      ]
    )
  )

(define (operations vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (
      _mm256_cvtepi64_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      32				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      64				;; Precision Operand 
      )]
    [(choose* #t #f)
     (
      _mm256_cvtepi64_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      64				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      16				;; Precision Operand 
      )]
    [(choose* #t #f)
     (
      _m_paddw_dsl
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      64				;; Integer Operand 
      64				;; Lane Size 
      64				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _m_paddw_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm256_max_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      64				;; Integer Operand 
      64				;; Lane Size 
      64				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm256_max_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm512_div_epi64_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      32				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm_cvtepi16_epi64_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      32				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      64				;; Precision Operand 
      )]
    [(choose* #t #f)
     (
      _mm_cvtepi16_epi64_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      64				;; Integer Operand 
      8				;; Precision Operand 
      0				;; Integer Operand 
      16				;; Precision Operand 
      )]
    [(choose* #t #f)
     (
      _mm512_min_epu64_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm512_min_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm512_min_epi8_dsl
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
      64				;; Integer Operand 
      64				;; Lane Size 
      64				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _m_pmaxub_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm256_broadcastq_epi64_dsl
      (operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
      128				;; Integer Operand 
      128				;; Lane Size 
      128				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [(choose* #t #f)
     (
      _mm256_broadcastq_epi64_dsl
      (operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
      256				;; Integer Operand 
      256				;; Lane Size 
      256				;; Integer Operand 
      16				;; Precision Operand 
      0				;; Integer Operand 
      0				;; Integer Operand 
      )]
    [else
      (mem vars #:depth k)
      ]
    )
  )

;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
  (ext-bv mat row_idx row_size)
  )

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))] )
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (display " ")
            )
  (displayln "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))] )
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
            )
  mat
  )

;; Scalar implementation for tiled blur-x
(define (blur-x img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )
  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvadd
                                               ;; i,j
                                               (ext-bv img (+ (* i  cols) j) ip)
                                               ;; i,j+1
                                               (ext-bv img (+ (* (+ i 1)  cols) j ) ip)
                                               ;; i,j+2
                                               (ext-bv img (+ (* (+ i 2)  cols) j ) ip)
                                               )
                                             )

                            )



                     )

                   (define divide (apply concat (for/list ([k (reverse (range cols))])
                                                          (define divide-res 
                                                            (bvsdiv 
                                                              (sign-extend (ext-bv reduce k ip) (bitvector op) )
                                                              (sign-extend (ext-bv three k ip) (bitvector op) )
                                                              )
                                                            )
                                                          (extract (- ip 1) 0 divide-res )
                                                          ))
                     )
                   divide
                   )
         )
  )


(define (blur-x-subexpr-load_row1 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (ext-bv img (+ (* (+ i 2)  cols) j ) ip)
                                             )
                            ))
                   reduce
                   ))
  )


(define (blur-x-subexpr-load_row2 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (ext-bv img (+ (* (+ i 1)  cols) j ) ip)
                                             )
                            ))
                   reduce



                   ))
  )

(define (blur-x-subexpr-load_row3 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (ext-bv img (+ (* (+ i 0)  cols) j ) ip)
                                             )
                            ))

                   reduce
                   ))
  )


(define (blur-x-subexpr-add2 expr1 expr2)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvadd
                                               ;; i,j
                                               (ext-bv expr1  j ip)
                                               ;; i,j+1
                                               (ext-bv expr2  j  ip)

                                               )
                                             )))
                   reduce

                   ))
  )


(define (blur-x-subexpr-div3 expr1)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvsdiv
                                               ;; i,j
                                               (ext-bv expr1  j ip)
                                               ;; i,j+1
                                               (ext-bv three  j  ip)

                                               )
                                             )))
                   reduce


                   ))
  )

(define (blur-x-sub img)
  (define row1 (blur-x-subexpr-load_row1 img)) ;; subexpr1
  (define row2 (blur-x-subexpr-load_row2 img)) ;; subexpr2
  (define row3 (blur-x-subexpr-load_row3 img)) ;; subexpr3

  (define add_1_2 (blur-x-subexpr-add2 row1 row2)) ;; subexpr4
  (define add_1_3 (blur-x-subexpr-add2 add_1_2 row3)) ;; subexpr5

  (define res (blur-x-subexpr-div3 add_1_3)) ;; subexpr6

  res

  )

(define (create-tensor rows cols precision)
  (apply concat
         (for/list ([i (range (* rows cols))])
                   (bv i (bitvector precision))
                   ))

  )

(define test-image (create-tensor 3 8 (/ 16 scale_factor)))


(displayln "Input Image")
(print-mat test-image 3 8 (/ 16 scale_factor))

(define result (blur-x test-image))
(displayln "Blurred Image")
(print-mat result 1 8 (/ 16 scale_factor))


(define result_sub (blur-x-sub test-image))
(displayln "Blurred Image Computed using sub expressions")
(print-mat result_sub 1 8 (/ 16 scale_factor))



;; Manual solution
(define load_row_0 (vector-load_dsl (reg 0) (/ 384 scale_factor) 0 8 (/ 16 scale_factor)))
(define load_row_1 (vector-load_dsl (reg 0) (/ 384 scale_factor) 8 8 (/ 16 scale_factor)))
(define load_row_2 (vector-load_dsl (reg 0) (/ 384 scale_factor) 16 8 (/ 16 scale_factor)))

(define add_0_1 (_m_paddw_dsl load_row_0 load_row_1 (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0))
(define add_0_2 (_m_paddw_dsl add_0_1 load_row_2 (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0))

(define three_vector (lit (apply concat (for/list ([k (range 8)]) (bv 3 (bitvector (/ 16 scale_factor ))) ) )))

(define div_3 (_mm512_div_epi64_dsl add_0_2 three_vector (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0 (/ 32 scale_factor)))

(displayln "Manual Blurred Image")
(print-mat (interpret div_3 (vector test-image 0 0 1 8)) 1 8 (/ 16 scale_factor))

;; 
;(displayln "Verifying Current implementation")

;(define-symbolic cex_sym (bitvector (/ 384 scale_factor)))

;(define cex 
;  (verify 
;    (begin
;      ;(assert (equal? (interpret div_3 (vector cex_sym 0 0 1 8)) (blur-x cex_sym)  ))
;      (assert (equal? (blur-x-sub cex_sym) (blur-x cex_sym)  ))
;      )
;    ))


;(assert (sat? cex) "Verification Passed!")
;(define cex_v0 (evaluate cex_sym cex))
;(display "cex_v0 ")
;(displayln cex_v0)


(displayln "Beginning Synthesis ...")
;; ================================================================================
;;                                Synthesis Query
;; ================================================================================

;; Synthesizing each sub-expression seperately:


(define synth_depth 2)




(define (invoke_subexpr_1 args)
  (blur-x-subexpr-load_row1  (vector-ref args 0))
  )


(define (invoke_subexpr_2 args)
  (blur-x-subexpr-load_row2  (vector-ref args 0))
  )


(define (invoke_subexpr_3 args)
  (blur-x-subexpr-load_row3  (vector-ref args 0))
  )


(define (invoke_subexpr_4 args)
  (blur-x-subexpr-add2  (vector-ref args 0) (vector-ref args 1)
                        )
  )


(define (invoke_subexpr_5 args)
  (blur-x-subexpr-add2  (vector-ref args 0) (vector-ref args 1)
                        )
  )


(define (invoke_subexpr_6 args)
  (blur-x-subexpr-div3  (vector-ref args 0) 
                        ))

(define spec_exprs

  (list
    invoke_subexpr_1
    invoke_subexpr_2
    invoke_subexpr_3
    invoke_subexpr_4
    invoke_subexpr_5
    invoke_subexpr_6
    )

  )


(define spec_inputs_sizes 

  (list
    (list 384)
    (list 384)
    (list 384)
    (list 128 128)
    (list 128 128)
    (list 128 )
    )

  )

(println spec_inputs_sizes)


(define spec_grammars

  (list
    (operations (list (reg 0) ) #:depth 1 )
    (operations (list (reg 0) ) #:depth 1 )
    (operations (list (reg 0) ) #:depth 1 )
    (operations (list (reg 0) (reg 1)) #:depth synth_depth )
    (operations (list (reg 0) (reg 1)) #:depth synth_depth )
    (operations (list (reg 0) ) #:depth synth_depth )

    )

  )

(for/list ([i (range (length spec_exprs))])
          (clear-vc!)
          (displayln "===================================")
          (display "Synthesizing Subexpression #")
          (displayln i)
          (define sub_expr (list-ref spec_exprs i))
          (define bw-list (list-ref spec_inputs_sizes i))

          ;(define test_grammar (operations (list (reg 0) (reg 1)) #:depth synth_depth ))
          (define test_grammar (list-ref spec_grammars i))

          (println sub_expr)
          (println bw-list)

          (define-values (satisfiable? materialize elap) 
                         (synthesize-sol sub_expr test_grammar bw-list #f cost) )

          (displayln "Synthesis step completed!")
          (display "Synthesis took ")
          (display elap)
          (displayln " seconds")

          (if satisfiable? 
            (begin
              (displayln "Solution")
              (pretty-print materialize)
              )
            (displayln "Unsatisfiable")
            )


          )


