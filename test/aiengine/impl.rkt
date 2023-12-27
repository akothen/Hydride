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

  ;;(fprintf (current-output-port) "lane number: ~a\n" lane_number)
  ;;(fprintf (current-output-port) "bvxoffsets: ~a\n" bvxoffsets)
  ;;(fprintf (current-output-port) "high index: ~a\nlow index: ~a\n" high_index low_index)
  ;;(fprintf (current-output-port) "ext_bvxoffsets: ~a\n" ext_bvxoffsets)
  ;;(fprintf (current-output-port) "offset: ~a\n" offset)
  ;;(fprintf (current-output-port) "result: ~a\n" result)
  ;;(fprintf (current-output-port) "\n\n")
  result
)

(define (ra16_lane_sel lane_number total_num_lanes xstart xoffsets xoffsets_hi)
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

(define (v64int16_abs32 xbuff xstart xoffsets xoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %lane_number (ra16_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low (* 32 %lane_number))
        (define %high (+ %low (- 32 1)))
        (define %ext_xbuff (extract %high %low xbuff))
        (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
        (define %int_o (abs %int_ext_xbuff))
        (define %o (integer->bitvector %int_o (bitvector 16)))
        %o
      )
    )
  )
  dst
)

;; 
;; (define (v16int32_max16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
;;   (define dst
;;     (apply concat
;;       (for/list ([%i (reverse (range 0 16 1))])
;;         (define %lane_number1 (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
;;         (define %low1 (* 32 %lane_number1))
;;         (define %high1 (+ %low1 (- 32 1)))
;;         (define %ext_xbuff1 (extract %high1 %low1 xbuff))
;;         (define %lane_number2 (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
;;         (define %low2 (* 32 %lane_number2))
;;         (define %high2 (+ %low2 (- 32 1)))
;;         (define %ext_xbuff2 (extract %high2 %low2 xbuff))
;;         (define %o (bvsmax %ext_xbuff1 %ext_xbuff2))
;;         %o
;;       )
;;     )
;;   )
;;   dst
;; )
;; 


(define (v16int32_shuffle16 xbuff xstart xoffsets xoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low (* 32 %lane_number))
        (define %high (+ %low (- 32 1)))
        (define %ext_xbuff (extract %high %low xbuff))
        (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
        (define %o (integer->bitvector %int_ext_xbuff (bitvector 32)))
        %o
      )
    )
  )
  dst
)

(define (v16int32_select16 select xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number1 (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
        (define %low2 (* 32 %lane_number2))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_xbuff2 (extract %high2 %low2 xbuff))
        (define %o (select_aux %i 16 %ext_xbuff1 %ext_xbuff2 select))
        %o
      )
    )
  )
  dst
)

(define (select_aux lane_number total_num_lanes xbuff ybuff select)
  (define half_num_lanes (/ total_num_lanes 2))
  (define low_index (* 4 (- (- half_num_lanes 1) (modulo lane_number half_num_lanes))))
  (define high_index (+ low_index 3))
  (define ext_bvxsel (extract high_index low_index (integer->bitvector select (bitvector 32))))
  (define sel_idx (bitvector->integer ext_bvxsel))
  (define selection (if (= sel_idx 0) xbuff ybuff))
  selection
)
;; cmp arg should be a pointer to array
(define (v16int32_maxcmp16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi cmp)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number1 (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
        (define %low2 (* 32 %lane_number2))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_xbuff2 (extract %high2 %low2 xbuff))
        (define %o (bvsmax %ext_xbuff1 %ext_xbuff2))
        (define %cmp_out (if (bveq %o %ext_xbuff1) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %cmp_out
      )
    )
  )
  dst
)

(define (v16int32_eq16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number_x (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low_x (* 32 %lane_number_x))
        (define %high_x (+ %low_x (- 32 1)))
        (define %ext_xbuff (extract %high_x %low_x xbuff))
        (define %lane_number_y (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
        (define %low_y (* 32 %lane_number_y))
        (define %high_y (+ %low_y (- 32 1)))
        (define %ext_ybuff (extract %high_y %low_y ybuff))
        (define %o (if (bveq %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 1)) (integer->bitvector 0 (bitvector 1))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; (define (v16int32_eq16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
;;   (define dst
;;     (apply concat
;;       (for/list ([%i (reverse (range 0 16 1))])
;;         (define %lane_number_x (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
;;         (define %low_x (* 32 %lane_number_x))
;;         (define %high_x (+ %low_x (- 32 1)))
;;         (define %ext_xbuff (extract %high_x %low_x xbuff))
;;         (define %lane_number_y (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
;;         (define %low_y (* 32 %lane_number_y))
;;         (define %high_y (+ %low_y (- 32 1)))
;;         (define %ext_ybuff (extract %high_y %low_y ybuff))
;;         (define %o (if (bveq %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 1)) (integer->bitvector 0 (bitvector 1))))
;;         %o
;;       )
;;     )
;;   )
;;   (bitvector->integer dst)
;; )


;; General full-lane algorithm
;;    //lanes
;;    lanes = (number of elements in output vector)
;;
;;    //multiplications
;;    int m=1;
;;    if (data_size  == 32) m*=2;
;;    if (coeff_size == 32) m*=2;
;;    if (data_complex)     m*=2;
;;    if (coeff_complex)    m*=2;
;;
;;    //rows and cols
;;    rows = lanes
;;    cols = 32/(m*lanes)
;; General scheme
;; 
;;     for i = 0 ; i < rows * cols ; i++
;;       c = i % cols
;;       r = i / cols
;; 
;;       idx[i] = ( start + offs[r] + step*c ) % (#samples in buffer)
;; For a v64int16 vector the number of samples would be 64. Whereas for a v4cint16 vector the number of samples would be 4.

(define (gen_scheme_full lane_number total_num_lanes xstart xoffsets xstep data_size coeff_size data_complex coeff_complex)
  (define half_num_lanes (/ total_num_lanes 2))
  ;; Select xoffsets or xoffsets_hi
  (define bvxoffsets
      (integer->bitvector xoffsets (bitvector 32))
  )

  (define m_val 
  
  (
      let ([m 1]) (let ([m (if (= data_size 32) (* m 2) m)]) (let ([m (if (= coeff_size 32) (* m 2) m)]) (let ([m (if data_complex (* m 2) m)]) (let ([m (if coeff_complex (* m 2) m)]) m))))
  )  
  )

  (define rows total_num_lanes)
  (define cols (/ 32 (* m_val total_num_lanes)))

  ;; Grab the 4 bits of xoffsets/xoffsets_hi
  (define low_index (* 4 (- (- half_num_lanes 1) (modulo r half_num_lanes))))
  (define high_index (+ low_index 3))
  (define ext_bvxoffsets (extract high_index low_index bvxoffsets))
  (define offset (bitvector->integer ext_bvxoffsets))

  (define result (modulo (+ lane_number (+ (* xstep c) (+ xstart offset))) total_num_lanes))

  (fprintf (current-output-port) "lane number: ~a\n" lane_number)
  (fprintf (current-output-port) "bvxoffsets: ~a\n" bvxoffsets)
  (fprintf (current-output-port) "high index: ~a\nlow index: ~a\n" high_index low_index)
  (fprintf (current-output-port) "ext_bvxoffsets: ~a\n" ext_bvxoffsets)
  (fprintf (current-output-port) "offset: ~a\n" offset)
  (fprintf (current-output-port) "result: ~a\n" result)
  (fprintf (current-output-port) "\n\n")
  result
)

;; lmul8 pseudoocde
;; each lane of accumulator uses idx calculated by general scheme to access xbuff and zbuff 




(define xbuff_16_32 (bv 56 512))
(define ybuff_16_32 (bv 4 512))
(define xbuff_32_32 (bv -6 1024))
(define xbuff_64_16 (bv -1024 1024))
(define xbuff_32_16 (bv -1024 512))

(define xoffset (bitvector->integer (bv #xECA86420 32)))
(define xoffset_hi (bitvector->integer (bv #xFDB97531 32)))
(define yoffset (bitvector->integer (bv #xFFA31327 32)))
(define yoffset_hi (bitvector->integer (bv #xBB85994D 32)))

(define select_bv (bitvector->integer (bv #x1101001 32)))

(define xoffset_0 (bitvector->integer (bv 0 32)))

;; (pretty-print "v16int32_abs16 w/ offset:")
(pretty-print "xbuff_16_32:")
(pretty-print xbuff_16_32)

(pretty-print (v16int32_select16 select_bv xbuff_16_32 0 xoffset xoffset_hi 0 xoffset xoffset_hi))
;; (pretty-print (v16int32_eq16 xbuff_16_32 0 xoffset xoffset_hi xbuff_16_32 0 xoffset xoffset_hi))

;; (pretty-print "xbuff_32_32:")
;; (pretty-print xbuff_32_32)
;; (pretty-print "xoffset:")
;; (pretty-print xoffset)
;; (pretty-print "xoffset_hi:")
;; (pretty-print xoffset_hi)
;; (fprintf (current-output-port) "\n")

;; (pretty-print (v16int32_abs16 xbuff_16_32 0 xoffset xoffset_hi))
;; (pretty-print (v16int32_abs16 xbuff_32_32 0 xoffset xoffset_hi))
