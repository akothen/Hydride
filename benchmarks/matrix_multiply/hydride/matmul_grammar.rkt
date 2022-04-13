



(define (mem vars #:depth k)
  (assert (> k 0))
    (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
       ;(vec-load (mem vars #:depth (- k 1)) 64 0 4 8)
       (vec-load (reg 0) 64 0 4 8)
    ]
    [(choose* #t #f)
       ;(vec-load (mem vars #:depth (- k 1)) 64 4 4 8)
       (vec-load (reg 0) 64 4 4 8)
    ]
    [(choose* #t #f)
       ; (vec-load (mem vars #:depth (- k 1)) 192 0 6 8)
       (vec-load (reg 1) 192 0 6 8)
    ]
    [(choose* #t #f)
       ; (vec-load (mem vars #:depth (- k 1)) 192 6 6 8)
       (vec-load (reg 1) 192 6 6 8)
    ]
    [(choose* #t #f)
       ; (vec-load (mem vars #:depth (- k 1)) 192 12 6 8)
       (vec-load (reg 1) 192 12 6 8)
    ]
    [else
       ; (vec-load (mem vars #:depth (- k 1)) 192 18 6 8)
       (vec-load (reg 1) 192 18 6 8)
    ]
  )
)

(define (shufl vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-shuffle-special
                    (mem vars #:depth (- k 1))
                    (mem vars #:depth (- k 1))
                    6 8
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 0 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 2 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 4 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 6 2
    )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 8 2
    )]
    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
               192 0 6 4 8
              )]
    [(choose* #t  #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
               192 1 6 4 8
              )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     (vec-strided-gather left_operand 
               192 2 6 4 8
              )]
    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
               192 3 6 4 8
              )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
               192 4 6 4 8
              )]

    [(choose* #t #f)
     (define left_operand (shufl vars #:depth (- k 1) ) )
     ;(assert (equal? (get-length left_operand) (* 4 8)))
     (vec-strided-gather left_operand 
               192 5 6 4 8
              )]
    [else
     (vec-shuffle-ext-special
                    (shufl vars #:depth (- k 1))
                    (shufl vars #:depth (- k 1))
                    12 8 10 2
    )]

   )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (dot-prod (expr vars #:depth (- k 1))
                 (mem vars #:depth (- k 1))
                 (shufl vars #:depth (- k 1))
                 2 2 8 8
    )]
    [(choose* #t #f)
     (vec-reduction (expr vars #:depth (- k 1)) 2 8
    )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
    )]
    [else
      (lit (bv 0 (bitvector 16)))
    ]
   )
  )

;; Define arbritray nesting of grammars.
;; Top-grammar invokes grammar with depth k-1
;; 
(define (top-grammar vars #:depth k)
  (assert (> k 0))
     (vec-concat-12
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 

       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 

       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
       (expr vars #:depth (- k 1)) 
    )
    
  )

; Get a sketch of depth 5.
(define sketch-grammar (top-grammar (list (reg 0) (reg 1)) #:depth 5))
