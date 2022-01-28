


(define (swizzle idx group_size dis_size rot_factor)
  (define (rot rot_fact n i)
      ;; Note that Rosette's notation of indexing bitvectors is from right to left
     (modulo (- i rot_fact) n)
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
