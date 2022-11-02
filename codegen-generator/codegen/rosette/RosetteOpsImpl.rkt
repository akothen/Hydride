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
    [(bvslt vect (bv (bitvector->integer (bvsminval sat_size)) bitwidth)) (bvsminval sat_size)]
    [(bvsgt vect (bv (bitvector->integer (bvsmaxval sat_size)) bitwidth)) (bvsmaxval sat_size)]
    [else (extract (- sat_size 1) 0 vect)])
  )
  (begin
   vect
  )
 )
)


(define (bvusat vect bitwidth sat_size)
  (if (bvugt vect (bv (bitvector->natural (bvumaxval sat_size)) bitwidth)) 
    (begin
      (bvumaxval sat_size)
    )
    (begin
      (extract (- sat_size 1) 0 vect)
    )
  )
)


(define (bvpadhighbits vect num_pad_bits)
  (if (equal? num_pad_bits 0)
    (begin
      vect
    )
    (begin
      (concat (bv 0 num_pad_bits) vect)
    )
  )
)


(define (bvaddnsw a b bitwidth)
  (define c (bvadd a b))
  (define result
  (cond
    [(and (> (bitvector->integer a) 0) (> (bitvector->integer b) 0)
          (< (bitvector->integer c) 0))
          (bvsmaxval bitwidth)]
    [(and (< (bitvector->integer a) 0) (< (bitvector->integer b) 0)
          (> (bitvector->integer c) 0))
          (bvsminval bitwidth)]
    [else (bvadd a b)]
  )
  )
  result
)


(define (bvaddnuw a b bitwidth)
  (bvadd a (bvumin (bvsub (bvumaxval bitwidth) a) b))
)


(define (bvsubnsw a b bitwidth)
  (define result
  (cond
     [(and (> (bitvector->integer b) 0)
           (< (bitvector->integer a) (bitvector->integer (bvadd (bvsminval bitwidth) b))))
            (bvsminval bitwidth)]
     [(and (< (bitvector->integer b) 0)
           (> (bitvector->integer a) (bitvector->integer (bvadd (bvsmaxval bitwidth) b))))
            (bvsmaxval bitwidth)]
      [else (bvsub a b)]
  )
  )
  result
)


(define (bvsubnuw a b bitwidth)
  (bvsub a (bvumin a b))
)


(define (bvmulnsw a b bitwidth)
  (define minusonebv (bv -1 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bveq a minusonebv) (bveq b (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
      [(and (bveq b minusonebv) (bveq a (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
    [(and (bvsgt a (bvsdiv (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a (bvsdiv (bvsminval bitwidth) b)))
          (bvsmaxval bitwidth)]
    [else (bvmul a b)]
  )
  )
  result
)


(define (bvmulnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvudiv (bvumaxval bitwidth) b))
    (begin
      (bvumaxval bitwidth)
    )
    (begin
      (bvmul a b)
    )
  )
  )
  result
)


(define (bvsizeext vect ext_size is_signed)
  (define result 
    (if (equal? is_signed #t)
      (begin
        (sign-extend vect (bitvector ext_size))
      )
      (begin
        (zero-extend vect (bitvector ext_size))
      )
    )
  )
  result
)


;; Tests
(define (test)
  (define au64 (bvumaxval 64))
  (define bu64 (bv #x0000000000000002 64))
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
  (pretty-print "(bvmulnuw au64 bu64 64):")
  (pretty-print (bvmulnuw au64 bu64 64))
)




