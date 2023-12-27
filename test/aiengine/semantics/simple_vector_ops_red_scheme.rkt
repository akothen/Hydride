;;
;; Semantics of simple AIE vector instructions
;; from: https://www.xilinx.com/htmldocs/xilinx2023_1/aiengine_intrinsics/intrinsics/group__intr__gpvectorop__arit.html
;; 

#lang rosette

(require racket/pretty)

;;; Vector Arithmetic

;;
;; v16int32 abs16	( 	v16int32  	xbuff	) 
;;
;; Lane by lane 32-bit absolute value computation.
;;

(define (v16int32_abs16 xbuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low (* 32 %i))
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
;; v32int16 abs32 	( 	v32int16  	xbuff	) 	
;;
;; Lane by lane 16-bit absolute value computation.
;;

(define (v32int16_abs32 xbuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low (* 16 %i))
        (define %high (+ %low (- 16 1)))
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

;; v16int32 add16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 		
;; 
;; Lane by lane 32-bit real addition.

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

;; v32int16 add32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		
;; 
;; Lane by lane 16-bit real addition.

(define (v32int16_add32 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvadd %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;; v16int32 sub16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 		
;; 
;; Lane by lane 32-bit real subtraction.

(define (v16int32_sub16 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;; v32int16 sub32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		
;; 
;; Lane by lane 16-bit real subtraction.

(define (v32int16_sub32 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsub %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  dst
)

;;; Vector Compares

;; unsigned int eq16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_eq16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bveq %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 1)) (integer->bitvector 0 (bitvector 1))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int eq32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_eq32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bveq %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 1)) (integer->bitvector 0 (bitvector 1))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int ge16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_ge16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsge %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int ge32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_ge32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsge %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int gt16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_gt16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsgt %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int gt32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_gt32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsgt %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int le16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_le16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsle %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int le32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_le32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvsle %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int lt16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_lt16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvslt %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int lt32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_lt32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (bvslt %ext_xbuff %ext_ybuff) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int ne16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_ne16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (not (bvseq %ext_xbuff %ext_ybuff)) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int ne32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_ne32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (if (not (bvseq %ext_xbuff %ext_ybuff)) (integer->bitvector 1 (bitvector 32)) (integer->bitvector 0 (bitvector 32))))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int max16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_max16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsmax %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int max32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_max32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsmax %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int min16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_min16 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsmin %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; unsigned int min32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_min32 xbuff ybuff)
  (define dst
    (apply bvand
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %o (bvsmin %ext_xbuff %ext_ybuff))
        %o
      )
    )
  )
  (bitvector->integer dst)
)

;; v16int32 maxdiff16 	( 	v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 	

(define (v16int32_maxdiff16 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %diff (bvsub %ext_xbuff %ext_ybuff))
        (define %o (bvsmax %diff 0))
        %o
      )
    )
  )
  dst
)

;; v32int16 maxdiff32 	( 	v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		

(define (v32int16_maxdiff32 xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 ybuff))
        (define %diff (bvsub %ext_xbuff %ext_ybuff))
        (define %o (bvsmax %diff 0))
        %o
      )
    )
  )
  dst
)

;;; Vector Lane Selection

;;  Aux function for select intrinsics
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

;; v16int32 select16 	( 	unsigned int  	select,
;; 		v16int32  	xbuff,
;; 		v16int32  	ybuff 
;; 	) 		
;; 
;; Lane selection from 32-bit buffer. 

(define (v16int32_select16 select xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_ybuff (extract %high2 %low2 xbuff))
        (define %o (select_aux %i 16 %ext_xbuff %ext_ybuff select))
        %o
      )
    )
  )
  dst
)

;; v32int16 select32 	( 	unsigned int  	select,
;; 		v32int16  	xbuff,
;; 		v32int16  	ybuff 
;; 	) 		
;; 
;; Lane selection from 16-bit buffer. 

(define (v32int16_select32 select xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_ybuff (extract %high2 %low2 xbuff))
        (define %o (select_aux %i 32 %ext_xbuff %ext_ybuff select))
        %o
      )
    )
  )
  dst
)