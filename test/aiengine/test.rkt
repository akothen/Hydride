#lang rosette

(require racket/pretty)


(define (ra16_aux lane_number total_num_lanes bvxoffsets)
  (define half_num_lanes (/ total_num_lanes 2))

  ;; Grab the 4 bits of xoffsets/xoffsets_hi
  (define low_index (* 4 (- (- half_num_lanes 1) (modulo lane_number half_num_lanes))))
  (define high_index (+ low_index 3))
  (define ext_bvxoffsets (extract high_index low_index bvxoffsets))
  (define offset (bitvector->integer ext_bvxoffsets))
  offset
)

(define (ra16_lane_sel lane_number total_num_lanes xstart xoffsets xoffsets_hi xsquare)
  (define half_num_lanes (/ total_num_lanes 2))
  ;; Select xoffsets or xoffsets_hi
  (define bvxoffsets
    (if (>= lane_number half_num_lanes)
      (integer->bitvector xoffsets (bitvector 32))
      (integer->bitvector xoffsets_hi (bitvector 32))
    )
  )

  (define perm_idx
      (
        if (even? lane_number)
          (modulo (+ lane_number (+ xstart (* 2 (ra16_aux lane_number 16 bvxoffsets)))) total_num_lanes)
          (modulo (+ lane_number (+ xstart (* 2 (ra16_aux lane_number 16 bvxoffsets)) (* 2 (+ 1 (ra16_aux (- lane_number 1) 16 bvxoffsets))))) total_num_lanes)
      )
  )
    perm_idx
)

(define (v32int16_abs16 xbuff xstart xoffsets xoffsets_hi xsquare)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %perm_idx (ra16_lane_sel %i 16 xstart xoffsets xoffsets_hi xsquare))
        (define %low_even (* 16 %perm_idx))
        (define %high_even (+ %low_even (- 16 1)))
        (define %ext_even_xbuff (extract %high_even %low_even xbuff))
        (define %low_odd (* 16 (+ 1 %perm_idx)))
        (define %high_odd (+ %low_odd (- 16 1)))
        (define %ext_odd_xbuff (extract %high_odd %low_odd xbuff))
        (define %int_ext_even_xbuff (bitvector->integer %ext_even_xbuff))
        (define %int_ext_odd_xbuff (bitvector->integer %ext_odd_xbuff))
        ;; (define %int_o_even (abs %int_ext_even_xbuff))
        ;; (define %int_o_odd (abs %int_ext_odd_xbuff))
        (define %int_o_even %int_ext_even_xbuff)
        (define %int_o_odd %int_ext_odd_xbuff)
        (define %o_even (integer->bitvector %int_o_even (bitvector 16)))
        (define %o_odd (integer->bitvector %int_o_odd (bitvector 16)))
        (fprintf (current-output-port) "lane number: ~a\n" %i)
        (fprintf (current-output-port) "perm_idx: ~a\n" %perm_idx)
        (fprintf (current-output-port) "o_odd: ~a\n" %o_odd)
        (fprintf (current-output-port) "o_even: ~a\n" %o_even)

        (concat %o_odd %o_even)
      )
    )
  )
  dst
)

(define xbuff_32_16 (bv #x6ac9ea5e1b63bf64ba082965c8ce260795ffea0fc8aa1b1a5c8a3d0ec666cc93738ecd92a2e77c6517c95e88e16645e858aac01e7e631729a5d9a9709e952eeb 512))
(define xoffset (bitvector->integer (bv #xECA82420 32)))
(define xoffset_hi (bitvector->integer (bv #xFDB97531 32)))


(define xoffset_z (bitvector->integer (bv #x0 32)))



(define xsquare (bitvector->integer (bv #x3120 16)))

;; (pretty-print (ra16_lane_sel 14 16 0 xoffset xoffset_hi xsquare))
;; (pretty-print (v32int16_abs16 xbuff_32_16 0 xoffset_z xoffset_z xsquare))


(define (v16int32_add16 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)


