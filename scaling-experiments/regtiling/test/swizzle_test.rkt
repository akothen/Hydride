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


(define (swizzle idx group_size fan_size len rot_factor wrap)
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

   (define (fan_rot gs cf n i)
       (define fan_res (fan cf n i))
       (define fan_rot_res
           (if (equal? wrap 1)
            (group (GCD cf gs) (rot (GCD cf gs) (modulo fan_res gs)) fan_res)
            (rot n fan_res))
        )
        (pretty-print "fan_rot_res:")
        (pretty-print fan_rot_res)
        fan_rot_res
    )
  
   (define result (group group_size (fan_rot group_size fan_size len idx) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-shuffle-swizzle1 v num_elems type_size group_size fan_size rot_factor wrap)
(pretty-print "vector-shuffle-swizzle1")
(define result
       (apply
        concat
        (for/list ([i (reverse (range num_elems))])
          (pretty-print "START SWIZZLED INDEX COMPUTE")
          (pretty-print "raw index:")
          (pretty-print (- (- num_elems 1) i))
          (define swizzled-index (swizzle (- (- num_elems 1) i) group_size fan_size num_elems rot_factor wrap))
          (pretty-print "swizzled-index")
          (pretty-print swizzled-index)
          (ext-bv v (- (- num_elems 1) swizzled-index) type_size)
         )
        )
    )
    result
  )
  
  
(define a64 (bv #x0102030405060708 64))

  
(define (sol)
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 8 1 2 1))
  (pretty-print (vector-shuffle-swizzle1 a64 8 8 8 3 0 1))
  ;;(pretty-print (vector-shuffle-swizzle1 a64 8 8 group_size fan_size rot_factor wrap))
)

(sol)
