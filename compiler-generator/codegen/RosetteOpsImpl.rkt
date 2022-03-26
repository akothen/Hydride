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

(define (bvaddnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt b zerobv) 
          (bvugt a (bvsub (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt b zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [else (bvadd a b)]
  )
  )
  result
)

(define (bvaddnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) b))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvadd a b)
    )
  )
  )
  result
)

(define (bvsubnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt (bvneg b) zerobv) 
          (bvugt a (bvsub (bvsmaxval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt (bvneg b) zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [else (bvsub a b)]
  )
  )
  result
)

(define (bvsubnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) (bvneg b)))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvsub a b)
    )
  )
  )
  result
)



;; Tests
(define au64 (bvumaxval 64))
(define bu64 (bv #x0000000000000001 64))
(pretty-print "au64:")
(pretty-print au64)
(pretty-print "bu64:")
(pretty-print bu64)
(pretty-print "(bvaddnuw au64 bu64 64):")
(pretty-print (bvaddnuw au64 bu64 64))
(pretty-print "(bvadd au64 bu64):")
(pretty-print (bvadd au64 bu64))
(define as64 (bvsmaxval 64))
(define bs64 (bv #x0000000000000001 64))
(pretty-print "as64:")
(pretty-print as64)
(pretty-print "bs64:")
(pretty-print bs64)
(pretty-print "(bvaddnsw as64 bs64 64):")
(pretty-print (bvaddnsw as64 bs64 64))


