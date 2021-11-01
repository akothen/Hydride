
#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(custodian-limit-memory (current-custodian) (* 10000 1024 1024))
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



(define (vector-reduce-add vec vec_size stride window_len num_elems type_size)
  (apply concat (for/list ([i  (range num_elems)])
                          (define offset (* i stride))
                          (define slice (vector-load vec vec_size offset window_len type_size))
                          (apply bvadd
                                 (for/list ([j (reverse (range window_len))])
                                           (ext-bv slice j type_size)
                                           )

                                 )
                          )
         )
  )


(define (vector-reduce-mul vec vec_size stride window_len num_elems type_size)
  (apply concat (for/list ([i  (range num_elems)])
                          (define offset (* i stride))
                          (define slice (vector-load vec vec_size offset window_len type_size))
                          (apply bvmul
                                 (for/list ([j (reverse (range window_len))])
                                           (ext-bv slice j type_size)
                                           )

                                 )
                          )
         )
  )

(define (vector-reduce-smax vec vec_size stride window_len num_elems type_size)
  (apply concat (for/list ([i  (range num_elems)])
                          (define offset (* i stride))
                          (define slice (vector-load vec vec_size offset window_len type_size))
                          (apply bvsmax
                                 (for/list ([j (reverse (range window_len))])
                                           (ext-bv slice j type_size)
                                           )

                                 )
                          )
         )
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


;; define a vector mask which contains loads
(define (sub-tensor-ext tensor tensor_size rows cols sub_rows sub_cols type_size idx)
  (define subtensor_size (* (* sub_rows sub_cols) type_size))
  (define subtensors_per_row (/ cols sub_cols)) ; 2
  (define skip_subs (* (quotient idx subtensors_per_row) subtensors_per_row)) ;; number of complete subtensor rows to skip ; skip_subs = 2
  (define subrow_offset (remainder idx subtensors_per_row)) ;; 1
  (define row_size (* cols type_size))
  (define sub_row_size (* sub_cols type_size))
  (define subtensor_start (+ (* subrow_offset sub_row_size) (* skip_subs subtensor_size)))
  (define start_idx (/ subtensor_start type_size))
  ;;subtensor_size
  ;;subtensors_per_row
  ;;skip_subs
  ;;subrow_offset
  (apply concat (for/list ([i (range sub_rows)])
                          (vector-load tensor tensor_size (+ start_idx (* i cols)) sub_cols type_size)
                          
                          ))
)


  

(define vect (apply concat (list (int32 1) (int32 2) (int32 3) (int32 4)  (int32 5) (int32 6))))
(println vect)

(define red-add (vector-reduce-add vect 192 2 2 3 32))
(println "Addition Reduction")
(println red-add)


(println "Multiplication Reduction")
(define red-mul (vector-reduce-mul vect 192 2 2 3 32))
(println red-mul)


(println "Max Reduction")
(define red-max (vector-reduce-smax vect 192 2 2 3 32))
(println red-max)


(define tens (apply concat (for/list ([i (range 16)])
                                     (int32 i))))

(define subt (sub-tensor-ext tens 512 4 4 2 2 32 3 ))

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

(print-mat tens 4 4 32)
(print-mat subt 2 2 32)
