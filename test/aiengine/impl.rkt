#lang rosette

(require racket/pretty)


(define (llvm-vect-add-ra a b start offset num_elems)
  (define dst
    (apply concat
           (for/list ([%it ( reverse (range 0 num_elems 1))])
             (define %id (+ start (bitvector->integer (bit %it offset))))
             (define %exta (bit %id a))
             (define %extb (bit %id b))
             (bvadd %exta %extb))))
  dst)

;; Lane selection algorithm
(define (select_lane1 lane_number total_num_lanes xstart xoffsets xoffsets_hi)
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

  (fprintf (current-output-port) "lane number: ~a\n" lane_number)
  (fprintf (current-output-port) "bvxoffsets: ~a\n" bvxoffsets)
  (fprintf (current-output-port) "high index: ~a\nlow index: ~a\n" high_index low_index)
  (fprintf (current-output-port) "ext_bvxoffsets: ~a\n" ext_bvxoffsets)
  (fprintf (current-output-port) "offset: ~a\n" offset)
  (fprintf (current-output-port) "result: ~a\n" result)
  (fprintf (current-output-port) "\n\n")
  result
)

(define (v16int32_abs16 xbuff xstart xoffsets xoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number (select_lane1 %i 16 xstart xoffsets xoffsets_hi))
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

(define xbuff_16_32 (bv -1024 512))
(define xbuff_32_32 (bv -6 1024))
(define xoffset (bitvector->integer (bv #xECA86420 32)))
(define xoffset_hi (bitvector->integer (bv #xFDB97531 32)))

(define xoffset_0 (bitvector->integer (bv 0 32)))

;; (pretty-print "v16int32_abs16 w/ offset:")
(pretty-print "xbuff_16_32:")
(pretty-print xbuff_16_32)
;; (pretty-print "xbuff_32_32:")
;; (pretty-print xbuff_32_32)
;; (pretty-print "xoffset:")
;; (pretty-print xoffset)
;; (pretty-print "xoffset_hi:")
;; (pretty-print xoffset_hi)
;; (fprintf (current-output-port) "\n")

(pretty-print (v16int32_abs16_16 xbuff_16_32 0 xoffset xoffset_hi))
(pretty-print (v16int32_abs16_32 xbuff_32_32 0 xoffset xoffset_hi))
