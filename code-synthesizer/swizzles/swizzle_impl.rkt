
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
