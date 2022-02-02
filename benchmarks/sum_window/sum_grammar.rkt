(define one 
  (apply concat (for/list ([i (range 12)])
                          (bv 1 (bitvector 8))
                          )

         )
  )



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
       (idx-i 0)
       1
       )
     ]
    [(choose* #t #f)
     (idx-add 
       (idx-i 0)
       2
       )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       2
       ) 6 )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       1
       ) 6 )
     ]

    [(choose* #t #f)
     (idx-mul 
     (idx-add 
       (idx-i 0)
       0
       ) 6 )
     ]
    ;[(choose* #t #f)
    ; (idx-add 
    ;   (idx-exprs vars #:depth (- k 1))
    ;   2
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (idx-mul 
    ;   (idx-exprs vars #:depth (- k 1))
    ;   6
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (nop  
    ;   (idx-exprs vars #:depth (- k 1))
    ;   )
    ; ]
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
               (idx-mul (idx-add (idx-i 0) 2) 6)
               6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 3) 6)
               6 8)  ; Row 0
     ]

    [(choose* #t #f)
     (vec-load (reg 0) 288 
               (idx-mul (idx-add (idx-i 0) 4) 6)
               6 8)  ; Row 0
     ]
    [else
      (lit (bv 0 (bitvector 48)))
      ]
    )
  )

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 6 3 1 0
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-swizzle-double
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 6 6 1 0
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-j 0)
       8
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-add (idx-j 0) 1)
       8
       )
     ]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       (idx-add (idx-j 0) 2)
       8
       )
     ]
    ;[
    ; (choose* #t #f)
    ; (dot-prod
    ;   ;(shufl vars #:depth (- k 1))
    ;   (lit (bv 0 (bitvector 32)))
    ;   (shufl vars #:depth (- k 1))
    ;   (lit one)
    ;   ;(shufl vars #:depth (- k 1))
    ;   4 3 8 8 
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (vec-div  (shufl vars #:depth (- k 1))  
    ;           (lit (concat 
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  (bv 3 (bitvector 8))
    ;                  ))
    ;           4 8 
    ;           )]

    ;[(choose* #t #f)
    ; (vec-div  (shufl vars #:depth (- k 1))  
    ;           (lit  
    ;             (bv 3 (bitvector 8))
    ;             )
    ;           1 8 
    ;           )]
    ;[(choose* #t #f)
    ; (lit one) ; 16 length vector of 1's
    ; ]
    ;[(choose* #t #f)
    ; (lit (bv 0 (bitvector 32)))
    ; ]
    ;[(choose* #t #f)
    ; (vec-reduction (shufl vars #:depth (- k 1)) 6 8
    ;                )]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 12 8
                    )]
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


; Get a sketch of depth 5.
(define sketch-grammar (shufl (list (reg 0) (idx-i 0) (idx-j 0)) #:depth 4))








(define row-i (vec-load (reg 0) 288  (idx-mul (idx-add (idx-i 0) 0) 6)  6 8  ))
(define row-ip1 (vec-load (reg 0) 288 (idx-mul (idx-add (idx-i 0) 1) 6) 6 8  ))
(define row-ip2 (vec-load (reg 0) 288 (idx-mul (idx-add (idx-i 0) 2) 6) 6  8  ))

(define row_0 (vec-shuffle-rotate row-i (idx-j 0) 8))
(define row_1 (vec-shuffle-rotate row-ip1 (idx-j 0) 8))
(define row_2 (vec-shuffle-rotate row-ip2 (idx-j 0) 8))



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
(define reduction (vec-reduction slice 12 8))

(define  (test val i j)
  (interpret reduction (vector val i j))
  )


(displayln "Spec On Image:")
(print-mat (sum image 6 6 3 3 8 ) 4 4 8)


(displayln "DSL on Image [0,0]:")
(println (bitvector->integer (test image 0 0 )))


(displayln "DSL on Image [1,1]:")
(println (bitvector->integer (test image 1 1 )))


(displayln "DSL on Image [2,2]:")
(println (bitvector->integer (test image 2 2 )))
