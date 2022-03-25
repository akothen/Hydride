
(define (bvumaxval bitwidth)
  (apply 
  concat
    (for idx (range (0, bitwidth))
      (bv #b1 1)
    )
  )
)

(define (bvsmaxval bitwidth)
  (define res
  (apply 
  concat
    (for idx (range (0, (- bitwidth 1)))
      (bv #b1 1)
    )
  )
  )
  (concat (bv #b0 1) res)
)

(define (bvuminval bitwidth)
  (apply 
  concat
    (for idx (range (0, bitwidth))
      (bv #b1 0)
    )
  )
)

(define (bvsminval bitwidth)
  (define res
  (apply 
  concat
    (for idx (range (0, (- bitwidth 1)))
      (bv #b0 1)
    )
  )
  )
  (concat (bv #b1 1) res)
)

(define (bvssat vect bitwidth)
  (bvsmin (bvsmax vect (bvsminval bitwidth)) (bvsmaxval bitwidth))
)

(define (bvusat vect bitwidth)
  (bvumin (bvumax vect (bvuminval bitwidth)) (bvumaxval bitwidth))
)

