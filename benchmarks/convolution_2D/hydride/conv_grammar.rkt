
(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 0 4 8)
     (vec-load (reg 0) 128 (idx-mul (idx-add (idx-i 0) 0) 4) 4 8)
     ;(vec-load (apply choose* vars) 128 0 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 4 4 8)
     (vec-load (reg 0) 128 (idx-mul (idx-add (idx-i 0) 1) 4) 4 8)
     ;(vec-load (apply choose* vars) 128 4 4 8)
     ]

    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 8 4 8)
     (vec-load (reg 1) 32 0 4 8)
     ;(vec-load (apply choose* vars) 128 8 4 8)
     ]

    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 32 0 2 8)
     (vec-load (reg 1) 32 0 2 8)
     ;(vec-load (apply choose* vars) 32 0 2 8)
     ]
    [else
      ;(vec-load (mem vars #:depth (- k 1)) 32 2 2 8)
      (vec-load (reg 1) 32 2 2 8)
      ;(vec-load (apply choose* vars) 32 2 2 8)
      ]
    )
  )

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]

    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       4 8 (idx-j 0) 2
       )]

    [(choose* #t #f)
    (vec-shuffle-rotate       
       (mem vars #:depth (- k 1))
       (idx-j 0) 8
       )]

    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       4 8 0 2
       )]
    [(choose* #t #f)
     (nop (shufl vars #:depth (- k 1))
          )]

    [else ;(choose* #t #f)
       (mem vars #:depth (- k 1))       
     ]
    )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (dot-prod (lit (bv 0 (bitvector 8)))
               (shufl vars #:depth (- k 1))
               (shufl vars #:depth (- k 1))
               1 4 8 8
               )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
          )]
    [else
      (lit (bv 0 (bitvector 8)))
      ]
    )
  )


; Get a sketch of depth 5.
(define sketch-grammar (expr (list (reg 0) (reg 1) (idx-i 0) (idx-j 0)) #:depth 4))


(define row-i (vec-load (reg 0) 128  (idx-mul (idx-add (idx-i 0) 0) 4)  4 8  ))
(define row-ip1 (vec-load (reg 0) 128 (idx-mul (idx-add (idx-i 0) 1) 4) 4 8  ))

(define row_0 (vec-shuffle-rotate row-i (idx-j 0)  8))
(define row_1 (vec-shuffle-rotate row-ip1 (idx-j 0) 8))

(define slice (vec-shuffle-ext-special
                row_0 row_1
                4 8 0 2
                ))
(define reduction (vec-reduction slice 12 8))

(define  (test val i j)
  (interpret reduction (vector val i j))
  )


