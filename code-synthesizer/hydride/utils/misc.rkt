#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require hydride/utils/bvops)
(require hydride/utils/debug)


(provide (all-defined-out))



;; Swizzle functions

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

;; Extract num_extract contigous elements of individual size type_size
(define (vector-extract-slice v1 num_elems type_size offset num_extract)
  (define result
    (apply
      concat
      (for/list ([i (range num_extract)])
                (define offset-from-right (- num_elems offset 1))
                (define index (+ offset i))
                (ext-bv v1 (- (- num_elems 1) index) type_size)
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


;; Utilities to print matrix 

;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
  (ext-bv mat row_idx row_size)
  )

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))] )
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (display " ")
            )
  (displayln "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))] )
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
            )
  mat
  )


(define (create-tensor rows cols precision)
  (apply concat
         (for/list ([i (range (* rows cols))])
                   (bv i (bitvector precision))
                   ))
  )


(define (create-splat val rows precision)
  (apply concat
         (for/list ([i (range rows )])
                   (bv val (bitvector precision))
                   ))
  )

(define (pad-with-zeros vec extended-len)
  (define remaining-bits (- extended-len (bvlength vec)))
  (define zero (bv 0 (bitvector remaining-bits)))
  (concat vec zero)
  )


(define (write-str-to-file str file)
  (debug-log (format "Writing [~a] to file ~a\n" str file))
  (system (string-append "rm " file))
  (define out (open-output-file file))
  (fprintf out str)
  (close-output-port out)
  (debug-log "Completed writing to file ...")
  )
