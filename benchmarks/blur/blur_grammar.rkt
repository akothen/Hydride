
(define (mem vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    [(choose* #t #f)
     (vec-load (reg 0) 288 0 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 6 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 12 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 18 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 24 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 30 6 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 0 3 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 3 3 8)  ; Row 0
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 6 3 8)  ; Row 1
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 9 3 8)  ; Row 1
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 12 3 8) ; Row 2
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 15 3 8) ; Row 2
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 18 6 8) ; Row 3
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 21 3 8) ; Row 3
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 24 3 8) ; Row 4
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 27 3 8) ; Row 4
     ]
    [(choose* #t #f)
     (vec-load (reg 0) 288 30 3 8) ; Row 5
     ]
    [else
     (vec-load (reg 0) 288 33 3 8) ; Row 5
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
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       1 8
       )]
    [(choose* #t #f)
     (vec-shuffle-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       2 8
       )]
    [(choose* #t #f)
     (vec-shuffle-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       3 8
       )]
    ;[(choose* #t #f)
    ; (vec-shuffle-special
    ;   (shufl vars #:depth (- k 1))
    ;   (shufl vars #:depth (- k 1))
    ;   6 8
    ;   )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 0 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 1 3
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 2 3
       )]
    [(choose* #t #f)
    (vec-shuffle-ext-special
      (shufl vars #:depth (- k 1))
      (shufl vars #:depth (- k 1))
      6 8 3 4
       )]
    [(choose* #t #f)
     (vec-shuffle-ext-special
       (shufl vars #:depth (- k 1))
       (shufl vars #:depth (- k 1))
       6 8 4 2
       )]
    ;[(choose* #t #f)
    ; (vec-shuffle-rotate 
    ;   (shufl vars #:depth (- k 1))
    ;   1 8
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (vec-shuffle-rotate 
    ;   (shufl vars #:depth (- k 1))
    ;   2 8
    ;   )
    ; ]
    ;[(choose* #t #f)
    ; (vec-add  (shufl vars #:depth (- k 1))  (shufl vars #:depth (- k 1))
    ;                     6 8 
    ;                     )]
    [(choose* #t #f)
     (vec-div  (shufl vars #:depth (- k 1))  
                (lit (concat 
             (bv 3 (bitvector 8))
             (bv 3 (bitvector 8))
             (bv 3 (bitvector 8))
             (bv 3 (bitvector 8))
                         ))
                4 8 
                         )]

    [(choose* #t #f)
     (vec-div  (shufl vars #:depth (- k 1))  
                (lit (concat 
             (bv 3 (bitvector 8))
                         ))
                1 8 
                         )]
    [(choose* #t #f)
     (bv 0 (bitvector 8))
     ]
    [(choose* #t #f)
     (bv 0 (bitvector 24))
     ]
    [(choose* #t #f)
     (bv 0 (bitvector 48))
     ]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 4 8
                    )]
    [(choose* #t #f)
     (vec-reduction (shufl vars #:depth (- k 1)) 6 8
                    )]
    [else
      (mem vars #:depth k)]

    )
  )


(define (expr vars #:depth k)
  (assert (> k 0))
  (cond
    [(choose* #t #f)
     (apply choose* vars)]
    ;[(choose* #t #f)
    ; (dot-prod (lit (bv 0 (bitvector 8)))
    ;           (shufl vars #:depth (- k 1))
    ;           (shufl vars #:depth (- k 1))
    ;           1 9 8 8
    ;           )]
    ;[(choose* #t #f)
    ; (vec-reduction (shufl vars #:depth (- k 1)) 4 8
    ;                )]
    [(choose* #t #f)
     (nop (expr vars #:depth (- k 1))
          )]
    [(choose* #t #f)
     (shufl vars #:depth k)
          ]
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
  ;(vec-div 
  (vec-concat-16 
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


    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    (expr vars #:depth (- k 1)) 
    )

  ;(lit (concat 
  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))

  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))
  ;       (bv 9 (bitvector 8))


   ;      (bv 9 (bitvector 8))
   ;      (bv 9 (bitvector 8))
   ;      (bv 9 (bitvector 8))
   ;      (bv 9 (bitvector 8))


    ;     (bv 9 (bitvector 8))
    ;     (bv 9 (bitvector 8))
    ;     (bv 9 (bitvector 8))
    ;     (bv 9 (bitvector 8))
    ;     
    ;     
    ;     ))
;
;  16 8
 ; )
)

; Get a sketch of depth 5.
(define sketch-grammar (top-grammar (list (reg 0)) #:depth 7))
