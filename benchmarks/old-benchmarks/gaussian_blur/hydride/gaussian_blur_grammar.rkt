

(define one 
  (apply concat (for/list ([i (range 12)])
                          (bv 1 (bitvector 8))
                          )

         )
  )


  (define g_filter (concat 
                 (bv 1 (bitvector 8)) (bv 2 (bitvector 8)) (bv 1 (bitvector 8))
                 (bv 2 (bitvector 8)) (bv 4 (bitvector 8)) (bv 2 (bitvector 8))
                 (bv 1 (bitvector 8)) (bv 2 (bitvector 8)) (bv 1 (bitvector 8))
                 (bv 0 (bitvector 8)) (bv 0 (bitvector 8)) (bv 0 (bitvector 8))
                 ))


(define (idx-exprs vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (idx-i 0)
     ]
    [(choose* #t #f)
     (idx-j 0)
    ]
    [(choose* #t #f)
     (idx-add 
       (idx-exprs vars #:depth (- k 1))
       1
       )
     ]
    [(choose* #t #f)
     (idx-add 
       (idx-exprs vars #:depth (- k 1))
       2
       )
     ]
    [(choose* #t #f)
     (idx-mul 
       (idx-exprs vars #:depth (- k 1))
       6
       )
     ]
    [else
       0 
      ]
    )
  )

(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 0) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               ;(idx-exprs vars #:depth 2) 
               (idx-mul (idx-add (idx-i 0) 1) 6)
               6 8)  ; Row 0
     ]

    [(choose* #t #f)
     (vec-load (reg 0) 288 
               ;(idx-exprs vars #:depth 2) 
               (idx-mul (idx-add (idx-i 0) 2) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
      (lit (bv 0 (bitvector 48)))
     ]

    [(choose* #t #f)
      (lit g_filter)
     ]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       ;(shufl vars #:depth (- k 1))
       ;(shufl vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       6 8 (idx-j 0) 6 3 1 0
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       ;(shufl vars #:depth (- k 1))
       ;(shufl vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       (mem vars #:depth (- k 1))
       6 8 0 6 6 1 0
       )
     ]

    [(choose* #t #f)
     (nop (mem vars #:depth (- k 1))
                    )]

    [else ;(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 2) 6)
               6 8)  ; Row 0
     ]
    )
  )

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [
     (choose* #t #f)
     (dot-prod
       ;(shufl vars #:depth (- k 1))
       (lit (bv 0 (bitvector 8)))
       (mem vars #:depth (- k 1))
       ;(mem vars #:depth (- k 1))
        (lit g_filter)
       1 12 8 8 
       )
     ]
    [
     (choose* #t #f)
     (vec-div 
            (shufl vars #:depth (- k 1))
            (lit (bv 16 (bitvector 8)))
              1 8)
     ]

    [(choose* #t #f)
     (nop (shufl vars #:depth (- k 1))
                    )]
    [else
      (mem vars #:depth k)]

    )
  )


;(define (expr vars #:depth k)
;  (assert (> k 0))
;  (cond
;    [(choose* #t #f)
;     (apply choose* vars)]
;    ;[(choose* #t #f)
;    ; (dot-prod (lit (bv 0 (bitvector 8)))
;    ;           (shufl vars #:depth (- k 1))
;    ;           (shufl vars #:depth (- k 1))
;    ;           1 9 8 8
;    ;           )]
;    ;[(choose* #t #f)
;    ; (vec-reduction (shufl vars #:depth (- k 1)) 4 8
;    ;                )]
;    [(choose* #t #f)
;     (nop (expr vars #:depth (- k 1))
;          )]
;    [else
;     (shufl vars #:depth k)
;          ]
;    )
;  )

;; Define arbritray nesting of grammars.
;; Top-grammar invokes grammar with depth k-1
;; 

; Get a sketch of depth 5.
(define sketch-grammar (shufl (list (reg 0) (idx-i 0) (idx-j 0)) #:depth 5))




(define (blur-dsl-loop img) 
  (apply concat
         (for/list ([i (range 4)]) 
                   (apply concat
                          (for/list ([j (range 4)]) 
                                    (define row-i (vec-load (reg 0) 288 (* i 6) 6 8  ))
                                    (define row-ip1 (vec-load (reg 0) 288 (* (+ i 1) 6) 6 8  ))
                                    (define row-ip2 (vec-load (reg 0) 288 (* (+ i 2) 6) 6  8  ))

                                    (define row_0 (vec-shuffle-rotate row-i j 8))
                                    (define row_1 (vec-shuffle-rotate row-ip1 j 8))
                                    (define row_2 (vec-shuffle-rotate row-ip2 j 8))



                                    (define left-concat (vec-shuffle-swizzle-double
                                                          row_0
                                                          row_1
                                                          6 8 0 6 3 1 0
                                                          ))


                                    (define right-concat (vec-shuffle-swizzle-double
                                                           row_2
                                                           (lit (bv 0 (bitvector 48)))
                                                           6 8 0 6 3 1 0
                                                           ))

                                    (define slice (vec-shuffle-swizzle-double
                                                    left-concat right-concat
                                                    6 8 0 6 6 1 0
                                                    ))




                                    (define horizontal-red (dot-prod
                                                             (lit (bv 0 (bitvector 32)))
                                                             slice
                                                             (lit one)
                                                             4 3 8 8 
                                                             ))



                                    (define horizontal-div (vec-div horizontal-red (lit (concat 
                                        (bv 3 (bitvector 8)) (bv 3 (bitvector 8))  (bv 3 (bitvector 8))(bv 3 (bitvector 8))
                                                                                          )
                                                                                        ) 4 8)
                                      )



                                    (define vertical-reduction (vec-reduction horizontal-div 4 8))



                                    (define result-i-j (vec-div vertical-reduction (lit (bv 3 (bitvector 8))) 1 8  ))

                                    (interpret result-i-j (vector img))
                                    )
                                    )


                          )
                   )
)

(displayln "Spec On Image:")
(print-mat (blur image 6 6 3 3 8 ) 4 4 8)

(displayln "DSL on Image:")
(print-mat (blur-dsl-loop image) 4 4 8)
;(define temp (blur-dsl-loop image))





