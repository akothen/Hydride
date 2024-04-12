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
        (define %ext_xbuff1 (sign-extend (extract %high1 %low1 xbuff) (bitvector 32)))
        (define %low2 (* 16 %i))
        (define %high2 (+ %low2 (- 16 1)))
        (define %ext_xbuff2 (sign-extend (extract %high2 %low2 ybuff) (bitvector 32)))
        (define %o (zero-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 48)))
        %o
      )
    )
  )
  dst
)

;; v8acc80_mul 	( 	v8int32  	a,
;; 		v8int32  	b 
;; 	) 		
;; 
;; Lane by lane 32-bit real multiply.

(define (v8acc80_mul xbuff ybuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 8 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %ext_xbuff1 (sign-extend (extract %high1 %low1 xbuff) (bitvector 48)))
        (define %low2 (* 32 %i))
        (define %high2 (+ %low2 (- 32 1)))
        (define %ext_xbuff2 (sign-extend (extract %high2 %low2 ybuff) (bitvector 48)))
        (define %o (sign-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 80)))
        %o
      )
    )
  )
  dst 
)