
(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 0 4 8)
     (vec-load (reg 0) 128 0 4 8)
     ;(vec-load (apply choose* vars) 128 0 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 4 4 8)
     (vec-load (reg 0) 128 4 4 8)
     ;(vec-load (apply choose* vars) 128 4 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 8 4 8)
     (vec-load (reg 0) 128 8 4 8)
     ;(vec-load (apply choose* vars) 128 8 4 8)
     ]
    [(choose* #t #f)
     ;(vec-load (mem vars #:depth (- k 1)) 128 12 4 8)
     (vec-load (reg 0) 128 12 4 8)
     ;(vec-load (apply choose* vars) 128 12 4 8)
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
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   4 8
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   2 8
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       4 8 0 2
       )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   4 8 1 2
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       4 8 2 2
       )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   8 8 0 4
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   8 8 4 4
    ;   )]
    ;[(choose* #t #f)
    ; (vec-shuffle-ext-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   8 8 6 2
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       1 8
       )
     ]
    [ else ;(choose* #t #f)
     (vec-shuffle-rotate 
       (mem vars #:depth (- k 1))
       0 8
       )
     ]
    ;[(choose* #t #f)
    ; (vec-mul  (shufl vars #:depth (- k 1))  (shufl vars #:depth (- k 1))
    ;                     4 8 
    ;                     )]
    ;[else
    ;  (mem vars #:depth k)]

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
     (vec-reduction (shufl vars #:depth (- k 1)) 4 8
                    )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
          )]
    [else
      (lit (bv 0 (bitvector 8)))
      ]
    )
  )

;; Define arbritray nesting of grammars.
;; Top-grammar invokes grammar with depth k-1
;; 
(define (top-grammar vars #:depth k)
  (assert (> k 0))
  (vec-concat-9 
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
