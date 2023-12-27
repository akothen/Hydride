;;
;; Semantics of simple AIE MAC instructions
;; from: https://www.xilinx.com/htmldocs/xilinx2023_1/aiengine_intrinsics/intrinsics/group__intr__gpvectorop__mul__simple.html#gaa66cdeef3fb290a88b0ce783ef68257d
;; 

#lang rosette

(require racket/pretty)

;;; Vector Multiply

;; v16acc48 mul 	( 	v16int16  	a,
;; 		v16int16  	b 
;; 	) 		
;; 
;; Lane by lane 16-bit real multiply.


(define (v16acc48_mul xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 16 1))])
        (define %low1 (* 16 %i))
        (define %high1 (+ %low1 (- 16 1)))
        (define %ext_xbuff1 (extract %high1 %low1 xbuff))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_xbuff2 (extract %high2 %low2 ybuff))
        (define %o (bvmul %ext_xbuff1 %ext_xbuff2))
        %o
      )
    )
  )
  dst
)
