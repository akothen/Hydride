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
                   (integer->bitvector i (bitvector precision))
                   ))
  )


(define (create-splat val rows precision)
  (apply concat
         (for/list ([i (range rows )])
                   (bv val (bitvector precision))
                   ))
  )

(define (create-splat-bv val rows)
  (apply concat
         (for/list ([i (range rows )])
                   val
                   ))
  )

(define (pad-with-zeros vec extended-len)
  (define remaining-bits (- extended-len (bvlength vec)))
  (define zero (bv 0 (bitvector remaining-bits)))
  (concat vec zero)
  )


(define (interleave-vectors v1 v2 size prec)
  (define num-elems (/ size prec))

  (apply concat
         (for/list ([i (reverse (range num-elems))])
                   (define low (* prec i))
                   (define high (+ low (- prec 1)))
                   (define v1-extract (extract high low v1))
                   (define v2-extract (extract high low v2))
                   (concat v1-extract v2-extract)
                   )
         )
  )

(define (interleave-vector v1 size prec)
  (define num-elems (/ size prec))
  (define base (/ num-elems 2))
  (apply concat
         (for/list ([i (range num-elems)])
                   (define offset-index
                     (cond 
                       [(eq? (modulo i 2) 0) (/ i 2)]
                       [else (+ base (- (/ (+ i 1) 2) 1))]
                       )
                     )
                   (define random-index (- num-elems 1 offset-index))
                   (define low-index (* random-index prec))
                   (define high-index (+ low-index (- prec 1)))
                   (extract high-index low-index v1)
                   )
         )
  )


(define (deinterleave-vector v1 size prec)
  (define num-elems (/ size prec))
  (define base (/ num-elems 2))
  (apply concat
         (for/list ([i (range num-elems)])
                   (define offset-index
                     (cond 
                       [(< i base) (* i 2)]
                       [else (- (* (+ (- i base) 1) 2) 1)]
                       )
                     )
                   (define random-index (- num-elems 1 offset-index))
                   (define low-index (* random-index prec))
                   (define high-index (+ low-index (- prec 1)))
                   (extract high-index low-index v1)
                   )
         )

  )


(define (write-str-to-file str file)
  (debug-log (format "Writing [~a] to file ~a\n" str file))
  (system (string-append "rm " file))
  (define out (open-output-file file))
  (fprintf out str)
  (close-output-port out)
  (debug-log "Completed writing to file ...")
  )



;; Create random concrete bitvector
;; to use in iterative synthesis
(define (create-concrete-bv bw) 
  (if 
    (<= bw 16)
    (begin
      (define max-val (expt 2 bw))
      (define rand-val (random max-val))
      (integer->bitvector rand-val (bitvector bw))
      )
    (concat
      (create-concrete-bv (/ bw 2))
      (create-concrete-bv (/ bw 2))
      )

    )
  )


;; Create a vector of concrete bitvectors
;; according to the bitwidths specified 
;; in the list
(define (create-concrete-bvs bw-list) 
  (define num-bw (length bw-list))
  (define (helper i)
    (define conc-bv (create-concrete-bv (list-ref bw-list i)))
    conc-bv
    )
  (build-vector num-bw helper)
  )

;; Create a vector of concrete 0 bitvectors
;; according to the bitwidths specified 
;; in the list
(define (create-0-bvs bw-list) 
  (define num-bw (length bw-list))
  (define (helper i)
    (define conc-bv (integer->bitvector 0 (bitvector (list-ref bw-list i) )))
    conc-bv
    )
  (build-vector num-bw helper)
  )


(define (append-str-to-file str file)
  (debug-log (format "Append [~a] to file ~a\n" str file))
  (define out (open-output-file file #:exists 'append))
  (fprintf out str)
  (close-output-port out)
  (debug-log "Completed writing to file ...")
  )
