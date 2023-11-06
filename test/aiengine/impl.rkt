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
  (pretty-print "lane_number")
  (pretty-print lane_number)
  (pretty-print "half_num_lanes")
  (pretty-print half_num_lanes)
  (define bvxoffsets
    (if (>= lane_number half_num_lanes)
      (integer->bitvector xoffsets (bitvector 32))
      (integer->bitvector xoffsets_hi (bitvector 32))
    )
  )
  (pretty-print "bvxoffsets")
  (pretty-print bvxoffsets)
  ;; Grab the 4 bits of xoffsets/xoffsets_hi
  (define low_index (* (- (- half_num_lanes 1) (modulo lane_number half_num_lanes)) 4))
  ;;(define high_index (- 1 reverse_input_index))
  (pretty-print "low_index")
  (pretty-print low_index)
  (define high_index (+ low_index 3))
  (pretty-print "high_index")
  (pretty-print high_index)
  (define ext_bvxoffsets (extract high_index low_index bvxoffsets))
  (pretty-print "ext_bvxoffsets")
  (pretty-print ext_bvxoffsets)
  (define offset (bitvector->integer ext_bvxoffsets))
  (pretty-print "offset")
  (pretty-print offset)
  (define result (modulo (+ lane_number (+ xstart offset)) total_num_lanes))
  (pretty-print result)
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
        (pretty-print %int_o)
        (fprintf (current-output-port) "\n\n")
        (define %o (integer->bitvector %int_o (bitvector 32)))
        %o
      )
    )
  )
  dst
)

(define xbuff (bv -6 512))
(define xoffset (bitvector->integer (bv #xECA86420 32)))
(define xoffset_hi (bitvector->integer (bv #xFDB97531 32)))

(pretty-print "v16int32_abs16 w/ offset:")
(pretty-print "xbuff:")
(pretty-print xbuff)
(pretty-print "xoffset:")
(pretty-print xoffset)
(pretty-print "xoffset_hi:")
(pretty-print xoffset_hi)
(pretty-print (v16int32_abs16 xbuff 0 xoffset xoffset_hi))
