(define int128? (bitvector 128))
(define int32? (bitvector 32))
(define int8? (bitvector 8))
(define int4? (bitvector 4))

(define (int4 i)
  (bv i int4?))

(define (int8 i)
  (bv i int8?))

(define (int32 i)
  (bv i int32?))

(define (int128 i)
  (bv i int128?))

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

(define (no-op a) a)

;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
  (ext-bv mat row_idx row_size)
)

;; Assuming row major matricies
(define (ext-matrix-col mat rows cols col_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= col_idx 0))
  (assume (< col_idx cols))
  (apply concat
  (for/list ([i (reverse (range rows))])
            (define row_start_idx (* i cols))
            (define row_col (+ row_start_idx (- (- cols 1) col_idx )))
            (ext-bv mat row_col type-size)
    )
  )
)

;; Bitvector scalar "load" instruction
(define (scalar-load mem mem_size index type_size)
  (assert (equal? (bvlength mem) mem_size))
  (define total_num_elems (/ mem_size type_size))
  (define result 
  (ext-bv mem (- (- total_num_elems  1) index) type_size))
  (assert (equal? (bvlength result) type_size))
  result
)

;; Bitvector vector "load" instruction
(define (vector-load mem mem_size start num_elems type_size)
  (assert (equal? (bvlength mem) mem_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ i start) type_size))
    ))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Bitvector vector "gather" instruction
(define (strided-gather mem mem_size start stride num_elems type_size)
  (assert (equal? (bvlength mem) mem_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ (* i stride) start) type_size))
    ))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)


;; An example of a masked vector "load" instruction
(define (masked-vector-load mem mem_size start type_size mask num_elems mask_type_size)
  (assert (equal? (bvlength mem) mem_size))
  (assert (equal? (bvlength mask) (* num_elems mask_type_size)))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (if (equal? (ext-bv mask (- (- num_elems 1) i) mask_type_size) (bv 0 mask_type_size))
          (bv 0 type_size)          
          (scalar-load mem mem_size (+ i start) type_size))
    )))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Example of vector shuffle
(define (vector-shuffle v1 v2 num_elems type_size mask mask_num_elems mask_type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (assert (equal? (bvlength mask) (* mask_num_elems mask_type_size)))
  (define result
   (apply
    concat
    (for/list ([i (reverse (range mask_num_elems))])
      (define index (bitvector->natural (ext-bv mask i mask_type_size)))
      (if (< index num_elems)
          (ext-bv v1 (- (- num_elems  1) index) type_size)
          (ext-bv v2 (- (- num_elems  1) (- index num_elems)) type_size))
      )))
  (assert (equal? (bvlength result) (* mask_num_elems type_size)))
  result
)

;; Specialized (mask-less) shuffle 
(define (vector-shuffle-special v1 v2 num_elems type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define result
   (apply
    concat
    (for/list ([i (reverse (range num_elems))])
       (concat
          (ext-bv v1 i type_size)
          (ext-bv v2 i type_size)
          )
        )
      ))
  (assert (equal? (bvlength result) (* 2 (bvlength v1))))
  result
)

;; Specialized (mask-less) shuffle and extract
(define (vector-shuffle-ext-special v1 v2 num_elems type_size start num_lump)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define result
    (concat 
    (apply
     concat
     (for/list ([i (range num_lump)])
          (ext-bv v1 (- (- num_elems  1) (+ i start)) type_size))
     )
     (apply
     concat
     (for/list ([i (range num_lump)])
          (ext-bv v2 (- (- num_elems  1) (+ i start)) type_size))
      )
     )
    )
  (assert (equal? (bvlength result) (* (* 2 num_lump) type_size)))
  result
)

;; Bitvector to vector
(define (bv-to-vector v num_elems type_size)
  (assert (equal? (bvlength v) (* num_elems type_size)))
  (define result (make-vector num_elems))
  (for/list ([i (reverse (range num_elems))])
    (define tmp (bitvector->integer (ext-bv v i type_size)))
    (vector-set! result (- (- num_elems 1) i) tmp)
    )
  (assert (equal? (vector-length result) num_elems))
  result
)

;; vector to bitvector
(define (vector-to-bv v type_size)
  (define num_elems (vector-length v))
  (define result
    (apply
     concat
      (for/list ([i (range num_elems)])
        (integer->bitvector (vector-ref v i) (bitvector type_size))
        )
      )
    )
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Perform shuffle on vector
(define (vector-shuffle-special-internal v1 v2)
  (assert (equal? (vector-length v1) (vector-length v2)))
  (define num_elems (+ (vector-length v1) (vector-length v2)))
  (define result (make-vector num_elems))
  (for/list ([i (range (vector-length v1))])
    (define tmp1 (vector-ref v1 i))
    (define tmp2 (vector-ref v2 i))
    (vector-set! result (* 2 i) tmp1)
    (vector-set! result (+ (* 2 i) 1) tmp2)
  )
  (assert (equal? (vector-length result) (* 2 (vector-length v1))))
  result
)

;; Specialized shuffle version 2
(define (vector-shuffle-special-cast v1 v2 num_elems type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define vect1 (bv-to-vector v1 num_elems type_size))
  (define vect2 (bv-to-vector v2 num_elems type_size))
  (define res-vect (vector-shuffle-special-internal vect1 vect2))
  (define result (vector-to-bv res-vect type_size))
  result
)


;; Perform shuffle-ext on vectors
(define (vector-shuffle-ext-special-internal v1 v2 start num_lump)
  (assert (equal? (vector-length v1) (vector-length v2)))
  (define result (make-vector (* 2 num_lump)))
  (for/list ([i (range num_lump)])
    (define tmp (vector-ref v1 (+ start i)))
    (vector-set! result i tmp)
  )
  (for/list ([i (range num_lump)])
    (define tmp (vector-ref v2 (+ start i)))
    (vector-set! result (+ num_lump i) tmp)
  )
  (assert (equal? (vector-length result) (* 2 num_lump)))
  result
)


;; Specialized (mask-less) shuffle and extract version 2
(define (vector-shuffle-ext-special-cast v1 v2 num_elems type_size start num_lump)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define vect1 (bv-to-vector v1 num_elems type_size))
  (define vect2 (bv-to-vector v2 num_elems type_size))
  (define res-vect (vector-shuffle-ext-special-internal vect1 vect2 start num_lump))
  (define result (vector-to-bv res-vect type_size))
  result
)


;; An example of vector broadcast
(define (vector-broadcast val num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (ext-bv val 0 type_size)
    )))
  (assert (equal? (bvlength result) (* num_elems type_size)))
  result
)

;; Implementation of a simple custom concat operation
(define (vector-shufl-concat v1 v2 num_elems type_size)
 (assert (equal? (bvlength v1) (bvlength v2)))
 (assert (equal? (bvlength v1) (* num_elems type_size)))
 (define old_size (* num_elems type_size))
 (define result_size (* 2 old_size))
 (define new-v1 (zero-extend v1 (bitvector result_size)))
 (define new-v2 (zero-extend v2 (bitvector result_size)))
 (define result (bvor (bvshl new-v1 (bv old_size result_size)) new-v2))
 (assert (equal? (bvlength result) ( * 2 (bvlength v1))))
 result
)


;; Interleave-low instruction
(define (vector-interleave-low v1 v2 num_elems type_size num_lanes)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define num_lanes_elems (/ num_elems num_lanes))
  (define low (/ num_lanes_elems 2))
  (define high num_lanes_elems)
  (define result
    (apply
     concat
     (for/list ([i (reverse (range num_lanes))])
       (apply
        concat
        (for/list ([j (reverse (range low high))])
          (concat (ext-bv v1 (+ j (* i num_lanes_elems)) type_size) (ext-bv v2 (+ j (* i num_lanes_elems)) type_size))
         )
        )
       )
     )
    )
  (assert (equal? (bvlength result) (bvlength v1)))
  result
)


;; Interleave-high instruction
(define (vector-interleave-high v1 v2 num_elems type_size num_lanes)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (define num_lanes_elems (/ num_elems num_lanes))
  (define low 0)
  (define high (/ num_lanes_elems 2))
  (define result
    (apply
     concat
     (for/list ([i (reverse (range num_lanes))])
       (apply
        concat
        (for/list ([j (reverse (range low high))])
          (concat (ext-bv v1 (+ j (* i num_lanes_elems)) type_size) (ext-bv v2 (+ j (* i num_lanes_elems)) type_size))
         )
        )
       )
     )
    )
  (assert (equal? (bvlength result) (bvlength v1)))
  result
)

;; masked-blend instuction
(define (vector-masked-blend v1 v2 num_elems type_size mask mask_type_size)
  (assert (equal? (bvlength v1) (bvlength v2)))
  (assert (equal? (bvlength v1) (* num_elems type_size)))
  (assert (equal? (bvlength mask) (* num_elems mask_type_size)))
  (define result
    (apply 
    concat
    (for/list ([i (reverse (range num_elems))])
      (pretty-print (ext-bv mask i mask_type_size))
      (if (equal? (ext-bv mask i mask_type_size) (bv 0 mask_type_size))
      (ext-bv v1 i type_size)
      (ext-bv v2 i type_size)
     )
    )
    )
  )
  (assert (equal? (bvlength result) (bvlength v1)))
  result
)


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

;; General version of swizzle with two input vectors
(define (vector-shuffle-swizzle2 v1 v2 num_elems type_size group_size fan_size rot_factor wrap)
  (define result
    (apply
     concat
     (for/list ([i (range (/ num_elems (* 2 group_size)))])
       (apply
        concat
        (for/list ([j (range group_size)])
           (define raw-index (- (- num_elems  1) (+ (* i group_size) j)))
           (define swizzled-index (swizzle raw-index group_size fan_size num_elems rot_factor wrap))
          (ext-bv v1 swizzled-index type_size)
         )
        )
       (apply
        concat
        (for/list ([j (range group_size (* 2 group_size))])
          (define raw-index (- (- num_elems  1) (+ (* i group_size) j)))
          (define swizzled-index (swizzle raw-index group_size fan_size num_elems rot_factor wrap))
          (ext-bv v2 swizzled-index type_size)
         )
        )
       )
     )
    )
  result
)

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))])
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (print " ")
            )
  (println "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))])
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
)
)