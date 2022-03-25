#lang rosette
(require racket/pretty)

(provide (all-defined-out))


(define (bvumaxval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b1 1)
    )
  )
)

(define (bvsmaxval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b1 1)
    )
  )
  )
  (concat (bv #b0 1) res)
)

(define (bvuminval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b0 1)
    )
  )
)

(define (bvsminval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b0 1)
    )
  )
  )
  (concat (bv #b1 1) res)
)

(define (bvssat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
  (begin
    (cond
    [(bvslt vect (bvsminval bitwidth)) (bvsminval sat_size)]
    [(bvsgt vect (bvsmaxval bitwidth)) (bvsmaxval bitwidth)]
    [else (extract (- sat_size 1) 0 vect)])
  )
  (begin
   vect
  )
 )
 ;;(bvsmin (bvsmax vect (bvsminval bitwidth)) (bvsmaxval bitwidth))
)

(define (bvusat vect bitwidth sat_size)
  (if (bvugt vect (bvumaxval bitwidth)) 
    (begin
      (bvsmaxval bitwidth)
    )
    (begin
      (extract (- sat_size 1) 0 vect)
    )
  )
  ;;(bvumin (bvumax vect (bvuminval bitwidth)) (bvumaxval bitwidth))
)

