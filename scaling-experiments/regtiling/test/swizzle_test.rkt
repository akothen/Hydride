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


(define (swizzle idx group_size fan_size rot_factor)
  (define (rot n i)
    (define rot_res
     (modulo (+ i rot_factor) n)
    )
    (pretty-print "rot_res:")
    (pretty-print rot_res)
    rot_res
  )

  (define (GCD a b)
   (define gcd
    (cond
         [(> a b) (GCD b (- a b))]
         [(< a b) (GCD a (- b a))]
         [else a])
    )
    gcd
   )

  (define (fan cf n i)
    (define fan_res
       (modulo (+ (* i cf) (floor (/ i (/ n (GCD cf n))))) n)
    )
    (pretty-print "fan_res:")
    (pretty-print fan_res)
    (pretty-print "(/ n (GCD cf n)):")
    (pretty-print (/ n (GCD cf n)))
    fan_res
  )

  (define (group gs func_res i)
    (define group_res
      (+ (* (floor (/ i gs)) gs) func_res)
    )
    (pretty-print "group_res:")
    (pretty-print group_res)
    group_res
  )

   (define (fan_rot gs cf i)
       (define fan_rot_res
          (rot gs (fan cf gs (modulo i gs)))
        )
        (pretty-print "fan_rot_res:")
        (pretty-print fan_rot_res)
        fan_rot_res
    )
  
   (define result (group group_size (rot group_size (fan fan_size group_size (modulo idx group_size))) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-shuffle-swizzle1 v num_elems type_size group_size fan_size rot_factor)
(pretty-print "vector-shuffle-swizzle1")
(define result
       (apply
        concat
        (for/list ([i (reverse (range num_elems))])
          (pretty-print "START SWIZZLED INDEX COMPUTE")
          (pretty-print "raw index:")
          (pretty-print (- (- num_elems 1) i))
          (define swizzled-index (swizzle (- (- num_elems 1) i) group_size fan_size rot_factor))
          (pretty-print "swizzled-index")
          (pretty-print swizzled-index)
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
  (pretty-print (vector-shuffle-swizzle1 a72 9 8 9 3 -1))
  (pretty-print (vector-shuffle-swizzle1 a72 9 8 9 3 1))
  (pretty-print (vector-shuffle-swizzle1 a72 9 8 9 3 0))
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 4 3 0))
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 4 3 1))
)

(sol)
