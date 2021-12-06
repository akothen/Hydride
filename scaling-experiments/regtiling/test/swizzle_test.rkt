#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)


;; Some uility functions
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)


(define (swizzle idx group_size dis_size rot_factor)
  (define (rot rot_fact n i)
     (modulo (+ i rot_fact) n)
  )

  (define (displace dis_factor n i)
       (modulo (+ (* i dis_factor) (floor (/ i (/ n (gcd dis_factor n))))) n)
  )

  (define (group gs group_idx i)
      (+ (* (floor (/ i gs)) gs) group_idx)
  )
  
   (define result (group group_size (rot rot_factor group_size (displace dis_size group_size (modulo idx group_size))) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-shuffle-swizzle1 v num_elems type_size group_size dis_size rot_factor)
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
  
  
(define a64 (bv #x0102030405060708 64))
(define a72 (bv #x010203040506070809 72))

  
(define (sol)
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 8 1 -2))
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 8 3 0))
  (pretty-print (vector-shuffle-swizzle1 a72 9 8 9 3 0))
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 4 3 0))
  (define tmp (vector-shuffle-swizzle1 a72 9 8 9 3 0))
  (pretty-print tmp)
  (pretty-print (vector-shuffle-swizzle1 tmp 9 8 3 1 -1))
)

(sol)
