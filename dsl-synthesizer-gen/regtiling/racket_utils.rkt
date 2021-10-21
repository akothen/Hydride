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
  (define total_num_elems (/ mem_size type_size))
  (define result 
  (ext-bv mem (- (- total_num_elems  1) index) type_size))
  result
)

;; Bitvector vector "load" instruction
(define (vector-load mem mem_size start num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ i start) type_size))
    ))
  result
)

;; Bitvector vector "gather" instruction
(define (strided-gather mem mem_size start stride num_elems type_size)
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (scalar-load mem mem_size (+ (* i stride) start) type_size))
    ))
  result
)


;; An example of a masked vector "load" instruction
(define (masked-vector-load mem mem_size start num_elems type_size mask mask_size mask_type_size)
  (define total_num_mask_elems (/ mask_size mask_type_size))
  (define result
    (apply
    concat
    (for/list ([i (range num_elems)])
      (if (equal? (ext-bv mask (- (- total_num_mask_elems 1) i) mask_type_size) (bv 0 mask_type_size))
          (bv 0 type_size)          
          (scalar-load mem mem_size (+ i start) type_size))
    )))
  result
)

;; Example of vector shuffle
(define (vector-shuffle v1 v2 num_elems type_size mask mask_num_elems mask_type_size)
  (define result
   (apply
    concat
    (for/list ([i (reverse (range mask_num_elems))])
      (define index (bitvector->natural (ext-bv mask i mask_type_size)))
      (pretty-print (ext-bv mask i mask_type_size))
      (pretty-print index)
      (if (< index num_elems)
          (ext-bv v1 (- (- num_elems  1) index) type_size)
          (ext-bv v2 (- (- num_elems  1) (- index num_elems)) type_size))
      )))
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
  result
)

;; Implementation of a simple custom concat operation
(define (vector-shufl-concat v1 v2 num_elems type_size)
 (define old_size (* num_elems type_size))
 (define result_size (* 2 old_size))
 (define new-v1 (zero-extend v1 (bitvector result_size)))
 (define new-v2 (zero-extend v2 (bitvector result_size)))
 (define result (bvor (bvshl new-v1 (bv old_size result_size)) new-v2))
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
