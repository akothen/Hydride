#lang rosette
(require racket/pretty)

(provide (all-defined-out))


(define (swizzle idx group_size dis_size rot_factor)
  (define (rotate rot_fact n i)
      ;; Note that Rosette's notation of indexing bitvectors is from right to left
     (modulo (- i rot_fact) n)
  )
  (define (displace dis_factor n i)
       (modulo (+ (* i dis_factor) (floor (/ i (/ n (gcd dis_factor n))))) n)
  )
  (define (group gs group_idx i)
      (+ (* (floor (/ i gs)) gs) group_idx)
  )
  (define result (group group_size (rotate rot_factor group_size (displace dis_size group_size (modulo idx group_size))) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-single-input-swizzle v num_elems type_size group_size dis_size rot_factor)
(define result
       (apply
        concat
        (for/list ([i (reverse (range num_elems))])
          (define swizzled-index (swizzle (- (- num_elems 1) i) group_size dis_size rot_factor))
          (ext-bv v (- (- num_elems 1) swizzled-index) type_size)
         )
        )
    )
    result
)

;; General version of swizzle with two input vectors
(define (vector-two-input-swizzle v1 v2 num_elems type_size lane_offset lane_size group_size dis_size rot_factor)
  (define high_lane_offset (+ group_size lane_offset))
  (define result
    (apply
     concat
     (for/list ([i (range 0 num_elems lane_size)])
        (apply
          concat
          (for/list ([j (range lane_offset (* 2 high_lane_offset))])
            (define raw-index (- j lane_offset))
            (define swizzled-index (swizzle raw-index (* 2 group_size) dis_size rot_factor))
            (if (< swizzled-index group_size)
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (+ i lane_offset swizzled-index)))
              (ext-bv v1 adjusted-swizzled-index type_size)
             )
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (- (+ i lane_offset swizzled-index) group_size)))
              (ext-bv v2 adjusted-swizzled-index type_size)
             )
            )
          )
        )
      )
     )
    )
  result
)

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

(define (pad_high_bits vect bitwidth target_bitwidth)
  (if (equal? bitwidth target_bitwidth)
    (begin
      vect
    )
    (begin
      (concat (bv 0 (- target_bitwidth bitwidth)) vect)
    )
  )
)

(define (bvaddnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt b zerobv) 
          (bvsgt a (bvsub (bvsmaxval bitwidth) b))) 
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
          (bvsgt a (bvsub (bvsmaxval bitwidth) (bvneg b)))) 
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

