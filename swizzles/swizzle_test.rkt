
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


;; DO NOT MODIFY THIS!!!
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



(define a64 (bv #x0001020304050607 64))
(define b64 (bv #x08090a0b0c0d0e0f 64))

(define a72 (bv #x000102030405060708 72))


;; Examples based on: https://homes.cs.washington.edu/~emina/doc/swizzle.asplos19.pdf
;; Note that Mango's implementation of swizzle is correct but made unncessarily
;; complex. We provide a much more simplified implementation.

;; Swizzle instruction signatures:
;; Swizzle 1: (vector-single-input-swizzle v num_elems type_size group_size dis_size rot_factor)
;; Swizzle 2: (vector-two-input-swizzle v1 v2 num_elems type_size lane_offset lane_size group_size fan_size rot_factor)

(define (sol)
  ;; Figure 3
  (pretty-print (vector-single-input-swizzle a64 8 8 8 1 2))
  ;; Figure 4
  (pretty-print (vector-single-input-swizzle a64 8 8 8 3 0))
  ;; Figure 5
  (pretty-print (vector-single-input-swizzle a72 9 8 9 3 0))
  ;; Figure 6
  (pretty-print (vector-single-input-swizzle a64 8 8 4 3 0))
  ;; Figure 7
  (define tmp (vector-single-input-swizzle a72 9 8 9 3 0))
  (pretty-print tmp)
  (pretty-print (vector-single-input-swizzle tmp 9 8 3 1 1))

  (pretty-print (vector-two-input-swizzle a64 b64 8 8 0 4 2 2 0))


)

(sol)






