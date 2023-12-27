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
        (define %o (zero-extend (bvmul %ext_xbuff1 %ext_xbuff2) (bitvector 48)))
        (pretty-print %o)
        %o
      )
    )
  )
  dst
)

(define xbuff_16_16 (bv #xa40893f80d007117bae366feb4673c6daad71b6842f0cd8e6f69967856ddf28e 256))
(define ybuff_16_16 (bv #xbac1fd5a5c9cc5a5cde2903c0c62085b504c9acdb653e4175430738aebd1d496 256))

(pretty-print (v16acc48_mul xbuff_16_16 ybuff_16_16))