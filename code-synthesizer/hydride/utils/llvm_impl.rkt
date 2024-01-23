#lang rosette
(require rosette/lib/synthax)
(require racket/pretty)
(require rosette/lib/destruct)
(require hydride/utils/bvops)
(require hydride/utils/debug)

;; Implementation of llvm target agnostic operations
;; to lower to.

(provide (all-defined-out))

;; Implementation of the LLVM shufflevector operation. v1 and v2
;; are vectors of type <len x prec> and permute-mask is a
;; vector of type <mask-len x i32>.
(define (llvm_shuffle_vectors v1 v2 len prec permute-mask mask-len)
  (define result
    (apply concat
           (for/list ([i (range mask-len)])
             ;; Get mask index at index i
             (define index-from-right (- mask-len 1 i))
             (define mask-low (* index-from-right 32))
             (define mask-high (+ mask-low 31))
             (define mask-idx-bv (extract mask-high mask-low permute-mask))

             (define mask-idx-val (bitvector->integer mask-idx-bv))

             ;; Identify whether to index into v1 or v2
             (define-values (vec adjusted-idx)
               (if (>= mask-idx-val len)

                   ;; Index into v2
                   (values v2 (- mask-idx-val len))

                   ;; Index into v1
                   (values v1 mask-idx-val)))

             (define vec-index-from-right (- len 1 adjusted-idx))
             (define vec-low (* vec-index-from-right prec))
             (define vec-high (+ vec-low (- prec 1)))
             (extract vec-high vec-low vec))))
  result)

(define (llvm-vect-add a b num_elems precision)
  (define dst
    (apply concat
           (for/list ([%it (reverse (range 0 num_elems 1))])
             (define %low (* precision %it))
             (define %high (%low (- precision 1)))
             (define %exta (extract %high %low a))
             (define %extb (extract %high %low b))
             (bvadd %exta %extb))))
  dst)

(define (llvm-vect-sub a b num_elems precision)
  (define dst
    (apply concat
           (for/list ([%it (reverse (range 0 num_elems 1))])
             (define %low (* precision %it))
             (define %high (%low (- precision 1)))
             (define %exta (extract %high %low a))
             (define %extb (extract %high %low b))
             (bvsub %exta %extb))))
  dst)

(define (llvm-vect-mul a b num_elems precision)
  (define dst
    (apply concat
           (for/list ([%it (reverse (range 0 num_elems 1))])
             (define %low (* precision %it))
             (define %high (%low (- precision 1)))
             (define %exta (extract %high %low a))
             (define %extb (extract %high %low b))
             (bvmul %exta %extb))))
  dst)

(define (llvm-vect-sdiv a b num_elems precision)
  (define dst
    (apply concat
           (for/list ([%it (reverse (range 0 num_elems 1))])
             (define %low (* precision %it))
             (define %high (%low (- precision 1)))
             (define %exta (extract %high %low a))
             (define %extb (extract %high %low b))
             (bvsdiv %exta %extb))))
  dst)

(define (llvm-vect-udiv a b num_elems precision)
  (define dst 
    (apply
      concat
      (for/list ([%it (reverse (range 0 num_elems 1))])
        (define %low (* precision %it))
        (define %high (%low (- precision 1)))
        (define %exta (extract  %high %low a))
        (define %extb (extract  %high %low b))
        (bvudiv %exta %extb)
      )
    )
  )
  dst
)

(define (llvm-zext a input_size output_size)
  (zero-extend a (bitvector output_size))
  )


(define (scalar_splat a input_size output_size)
  (apply concat (for/list ([i (range (/ output_size input_size))])  a ))
  )


;; AIEngine Test
;;
;; Functions that compute lane numbers for vectors 
;; xoffsets, xoffsets_hi have 8 offset values each. 4 bits per offset.
;;
(define (ra_lane_sel lane_number total_num_lanes xstart xoffsets xoffsets_hi)
  (define half_num_lanes (/ total_num_lanes 2))
  ;; Select xoffsets or xoffsets_hi
  (define bvxoffsets
    (if (>= lane_number half_num_lanes)
      (integer->bitvector xoffsets (bitvector 32))
      (integer->bitvector xoffsets_hi (bitvector 32))
    )
  )

  ;; Grab the 4 bits of xoffsets/xoffsets_hi
  (define low_index (* 4 (- (- half_num_lanes 1) (modulo lane_number half_num_lanes))))
  (define high_index (+ low_index 3))
  (define ext_bvxoffsets (extract high_index low_index bvxoffsets))
  (define offset (bitvector->integer ext_bvxoffsets))
  (define result (modulo (+ lane_number (+ xstart offset)) total_num_lanes))
  result
)

;;; Vector Arithmetic

;;
;; v16int32 abs16	(	v32int32 	xbuff,
;;                 int 	xstart,
;;                 unsigned int 	xoffsets,
;;                 unsigned int 	xoffsets_hi 
;; )
;;
;; Description:	
;; for (int i = 0; i < 16; i++)
;;    idx = f( xstart, xoffsets[i]);
;;    o[i] = abs(x[idx])
;;
;; xoffsets, xoffsets_hi have 8 offset values each. 4 bits per offset.
;;
(define (v16int32_abs16 xbuff xstart xoffsets xoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low (* 32 %lane_number))
        (define %high (+ %low (- 32 1)))
        (define %ext_xbuff (extract %high %low xbuff))
        (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
        (define %int_o (abs %int_ext_xbuff))
        (define %o (integer->bitvector %int_o (bitvector 32)))
        %o
      )
    )
  )
  dst
)
