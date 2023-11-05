;;
;; Semantics of advanced AIE vector instructions
;; from: https://www.xilinx.com/htmldocs/xilinx2023_1/aiengine_intrinsics/intrinsics/group__intr__gpvectorop__arit__adv__int.html#gae6e9ed89d28623ede37b6eba9bb4fb79
;; 

#lang rosette

(require racket/pretty)


;; Functions that compute lane numbers for vectors 
;; xoffsets, xoffsets_hi have 8 offset values each. 4 bits per offset.
;;
(define (select_lane1 lane_number total_num_lanes xstart xoffsets xoffsets_hi)
  (define half_num_lanes (/ total_num_lanes 2))
  ;; Select xoffsets or xoffsets_hi
  (define bvxoffsets
    (if (< lane_number half_num_lanes)
      (integer->bitvector xoffsets)
      (integer->bitvector xoffsets_hi)
    )
  )
  ;; Grab the last 4 bits of xoffsets/xoffsets_hi
  (define low_index (mod lane_number half_num_lanes))
  (define ext_bvxoffsets (extract (+ 4 low_index) low_index bvxoffsets))
  (define offset (bitvector->integer ext_bvxoffsets))
  (define result (mod (+ lane_number + xstart offset) total_num_lanes))
  result
)

;; (define (select_lane2 lane_number total_num_lanes xstart xoffsets xoffsets_hi xsquare)
;;   (define half_num_lanes (/ total_num_lanes 2))
;;   ;; Select xoffsets or xoffsets_hi
;;   (define bvxoffsets
;;     (if (< lane_number half_num_lanes)
;;       (integer->bitvector xoffsets)
;;       (integer->bitvector xoffsets_hi)
;;     )
;;   )
;;   ;; Grab the last 4 bits of xoffsets/xoffsets_hi
;;   (define low_index (mod lane_number half_num_lanes))
;;   (define ext_bvxoffsets (extract (+ 4 low_index) low_index bvxoffsets))
;;   (define offset (bitvector->integer ext_bvxoffsets))
;;   (define result (mod (+ lane_number + xstart offset) total_num_lanes))
;;   result
;; )


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
        (define %lane_number (select_lane1 %i 16 xstart xoffsets xoffsets_hi))
        (define %low (* 32 %lane_number))
        (define %high (+ %low (- 32 1)))
        (define %ext_xbuff (extract %high %low xbuff))
        (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
        (define %int_o (abs %int_ext_xbuff))
        (define %o (integer->bivector %int_o))
        %o
      )
    )
  )
  dst
)


;;
;; v16int32 abs16	(	v16int32 	xbuff,
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
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;
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
        (define %o (integer->bivector %int_o))
        %o
      )
    )
  )
  dst
)


;;
;; v32int16 abs32	(	v64int16 	xbuff,
;;                  int 	xstart,
;;                  unsigned int 	xoffsets,
;;                  unsigned int 	xoffsets_hi,
;;                  unsigned int 	xsquare 
;;                  )	
;; 
;; Description:	
;; for (int i = 0; i < 32; i++)
;;    idx = f( xstart, xoffsets[i],xsquare);
;;    o[i] = abs(x[idx])
;;
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;
;; (define (v32int16_abs32 xbuff xstart xoffsets xoffsets_hi xsquare)
;;   (define dst
;;     (apply concat
;;       (for/list ([%i (reverse (range 0 64 1))])
;;         (define %lane_number (select_lane2 %i 64 xstart xoffsets xoffsets_hi xsquare))
;;         (define %low (* 16 %lane_number))
;;         (define %high (+ %low (- 16 1)))
;;         (define %ext_xbuff (extract %high %low xbuff))
;;         (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
;;         (define %int_o (abs %int_ext_xbuff))
;;         (define %o (integer->bivector %int_o))
;;         %o
;;       )
;;     )
;;   )
;;   dst
;; )


;;
;; v32int16 abs32	(	v32int16 	xbuff,
;;                  int 	xstart,
;;                  unsigned int 	xoffsets,
;;                  unsigned int 	xoffsets_hi,
;;                  unsigned int 	xsquare 
;;                  )	
;; 
;; Description:	
;; for (int i = 0; i < 32; i++)
;;    idx = f( xstart, xoffsets[i],xsquare);
;;    o[i] = abs(x[idx])
;;
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;
;; (define (v32int16_abs32 xbuff xstart xoffsets xoffsets_hi xsquare)
;;   (define dst
;;     (apply concat
;;       (for/list ([%i (reverse (range 0 32 1))])
;;         (define %lane_number (select_lane2 %i 32 xstart xoffsets xoffsets_hi xsquare))
;;         (define %low (* 16 %lane_number))
;;         (define %high (+ %low (- 16 1)))
;;         (define %ext_xbuff (extract %high %low xbuff))
;;         (define %int_ext_xbuff (bitvector->integer %ext_xbuff))
;;         (define %int_o (abs %int_ext_xbuff))
;;         (define %o (integer->bivector %int_o))
;;         %o
;;       )
;;     )
;;   )
;;   dst
;; )


;;
;; v16int32 add16	(	v32int32 	xbuff,
;;                int 	xstart,
;;                unsigned int 	xoffsets,
;;                unsigned int 	xoffsets_hi,
;;                int 	ystart,
;;                unsigned int 	yoffsets,
;;                unsigned int 	yoffsets_hi 
;;               )	
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = x[idx] + x[idy]
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;
(define (v16int32_add16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number1 (select_lane1 %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (select_lane1 %i 16 ystart yoffsets yoffsets_hi))
        (define %low2 (* 32 %lane_number2))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_xbuff2 (extract %high2 %low2 xbuff))
        (define %o (bvadd %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)


;;
;; v16int32 add16	(	v16int32 	xbuff,
;;                int 	xstart,
;;                unsigned int 	xoffsets,
;;                unsigned int 	xoffsets_hi,
;;                int 	ystart,
;;                unsigned int 	yoffsets,
;;                unsigned int 	yoffsets_hi 
;;               )	
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = x[idx] + x[idy]
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;
(define (v16int32_add16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %lane_number1 (select_lane1 %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (select_lane1 %i 16 ystart yoffsets yoffsets_hi))
        (define %low2 (* 32 %lane_number2))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_xbuff2 (extract %high2 %low2 xbuff))
        (define %o (bvadd %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)

