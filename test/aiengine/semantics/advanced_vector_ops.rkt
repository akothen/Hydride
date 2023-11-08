;;
;; Semantics of advanced AIE vector instructions
;; from: https://www.xilinx.com/htmldocs/xilinx2023_1/aiengine_intrinsics/intrinsics/group__intr__gpvectorop__arit__adv__int.html#gae6e9ed89d28623ede37b6eba9bb4fb79
;; 

#lang rosette

(require racket/pretty)


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
;;   (define low_index (modulo lane_number half_num_lanes))
;;   (define ext_bvxoffsets (extract (+ 4 low_index) low_index bvxoffsets))
;;   (define offset (bitvector->integer ext_bvxoffsets))
;;   (define result (modulo (+ lane_number + xstart offset) total_num_lanes))
;;   result
;; )
;; 
;;  Function for select intrinsics
;;

(define (select_aux lane_number total_num_lanes xbuff ybuff select)
  (define half_num_lanes (/ total_num_lanes 2))
  (define low_index (* 4 (- (- half_num_lanes 1) (modulo lane_number half_num_lanes))))
  (define high_index (+ low_index 3))
  (define ext_bvxsel (extract high_index low_index (integer->bitvector select (bitvector 32))))
  (define sel_idx (bitvector->integer ext_bvxsel))
  (define selection (if (= sel_idx 0) xbuff ybuff))
  selection
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
;;         (define %o (integer->bitvector %int_o))
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
;;         (define %o (integer->bitvector %int_o))
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
        (define %lane_number1 (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
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
        (define %lane_number1 (ra_lane_sel %i 16 xstart xoffsets xoffsets_hi))
        (define %low1 (* 32 %lane_number1))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %lane_number2 (ra_lane_sel %i 16 ystart yoffsets yoffsets_hi))
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
;; v16int32 add16 	( 	v16int32  	xbuff,
;; 		int  	xstart,
;; 		unsigned int  	xoffsets,
;; 		unsigned int  	xoffsets_hi,
;; 		v16int32  	ybuff,
;; 		int  	ystart,
;; 		unsigned int  	yoffsets,
;; 		unsigned int  	yoffsets_hi 
;; 	) 		
;; 
;; Description:	
;; Performs an addition between lanes of xbuff and ybuff.
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = x[idx] + y[idy]
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.

(define (v16int32_add16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
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
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;; v16int32 sub16	(	v32int32 	xbuff,
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
;;     o[i] = x[idx] - x[idy]
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_sub16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        (define %o (bvsub %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)

;;
;; v16int32 sub16	(	v16int32 	xbuff,
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
;;     o[i] = x[idx] - x[idy]
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_sub16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        (define %o (bvsub %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)

;; 
;; v16int32 sub16 	( 	v16int32  	xbuff,
;; 		int  	xstart,
;; 		unsigned int  	xoffsets,
;; 		unsigned int  	xoffsets_hi,
;; 		v16int32  	ybuff,
;; 		int  	ystart,
;; 		unsigned int  	yoffsets,
;; 		unsigned int  	yoffsets_hi 
;; 	) 		
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = x[idx] - y[idy]
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.

(define (v16int32_sub16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
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
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;;; Vector Compares

;; v16int32 max16	(	v32int32 	xbuff,
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
;;     o[i] = max(x[idx], x[idy])
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_max16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        %o
      )
    )
  )
  dst
)

;;
;; v16int32 max16	(	v16int32 	xbuff,
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
;;     o[i] = max(x[idx], x[idy])
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_max16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        %o
      )
    )
  )
  dst
)

;; 
;; v16int32 max16 	( 	v16int32  	xbuff,
;; 		int  	xstart,
;; 		unsigned int  	xoffsets,
;; 		unsigned int  	xoffsets_hi,
;; 		v16int32  	ybuff,
;; 		int  	ystart,
;; 		unsigned int  	yoffsets,
;; 		unsigned int  	yoffsets_hi 
;; 	) 		
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = max(x[idx], y[idy])
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.

(define (v16int32_max16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
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
        (define %o (bvsmax %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;; v16int32 min16	(	v32int32 	xbuff,
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
;;     o[i] = min(x[idx], x[idy])
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_min16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        (define %o (bvsmin %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)

;;
;; v16int32 min16	(	v16int32 	xbuff,
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
;;     o[i] = min(x[idx], x[idy])
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

(define (v16int32_min16 xbuff xstart xoffsets xoffsets_hi ystart yoffsets yoffsets_hi)
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
        (define %o (bvsmin %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)

;; 
;; v16int32 min16 	( 	v16int32  	xbuff,
;; 		int  	xstart,
;; 		unsigned int  	xoffsets,
;; 		unsigned int  	xoffsets_hi,
;; 		v16int32  	ybuff,
;; 		int  	ystart,
;; 		unsigned int  	yoffsets,
;; 		unsigned int  	yoffsets_hi 
;; 	) 		
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = min(x[idx], y[idy])
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.

(define (v16int32_min16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
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
        (define %o (bvsmin %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;;; Vector Lane Selection
;;
;;  v16int32 select16 	( 	unsigned int  	select,
;;  		v32int32  	xbuff,
;;  		int  	xstart,
;;  		unsigned int  	xoffsets,
;;  		unsigned int  	xoffsets_hi,
;;  		int  	ystart,
;;  		unsigned int  	yoffsets,
;;  		unsigned int  	yoffsets_hi 
;;  	) 		
;; 
;; Description:	
;; select(a, b, s)
;; {
;;   if (s)
;;     return b;
;;   else
;;     return a;
;; }
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = select(x[idx], x[idy], select[i])

;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

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

;;
;;  v16int32 select16 	( 	unsigned int  	select,
;;  		v16int32  	xbuff,
;;  		int  	xstart,
;;  		unsigned int  	xoffsets,
;;  		unsigned int  	xoffsets_hi,
;;  		int  	ystart,
;;  		unsigned int  	yoffsets,
;;  		unsigned int  	yoffsets_hi 
;;  	) 	
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = max(x[idx], x[idy])
;; 
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.
;;

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

;; 
;;  v16int32 select16 	( 	unsigned int  	select,
;;  		v16int32  	xbuff,
;;  		int  	xstart,
;;  		unsigned int  	xoffsets,
;;  		unsigned int  	xoffsets_hi,
;;  		v16int32  	ybuff,
;;  		int  	ystart,
;;  		unsigned int  	yoffsets,
;;  		unsigned int  	yoffsets_hi 
;;  	) 		
;; 
;; Description:	
;; for (int i = 0; i < 16; i++)
;;     idx = f( xstart, xoffsets[i]);
;;     idy = f( ystart, yoffsets[i]);
;;     o[i] = max(x[idx], y[idy])
;; xoffsets, xoffsets_hi, yoffsets, yoffsets_hi have 8 offset values each. 4 bits per offset.

(define (v16int32_select16 xbuff xstart xoffsets xoffsets_hi ybuff ystart yoffsets yoffsets_hi)
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
        (define %o (select_aux %i 16 %ext_xbuff %ext_ybuff select))
        %o
      )
    )
  )
  dst
)

;;
;; v16int32 shuffle16	(	v32int32 	xbuff,
;;                 int 	xstart,
;;                 unsigned int 	xoffsets,
;;                 unsigned int 	xoffsets_hi 
;; )
;;
;; Description:	
;; for (int i = 0; i < 16; i++)
;;    idx = f( xstart, xoffsets[i]);
;;    o[i] = x[idx]
;;
;; xoffsets, xoffsets_hi have 8 offset values each. 4 bits per offset.
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
;;
;; v16int32 shuffle16	(	v16int32 	xbuff,
;;                 int 	xstart,
;;                 unsigned int 	xoffsets,
;;                 unsigned int 	xoffsets_hi 
;; )
;;
;; Description:	
;; for (int i = 0; i < 16; i++)
;;    idx = f( xstart, xoffsets[i]);
;;    o[i] = x[idx]
;;
;; xoffsets, xoffsets_hi have 8 offset values each. 4 bits per offset.
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