;; simple srs test for v8int80 to v8int32

;; TODO: Implement proper saturating and rounding algs

;; v32int16 srs_to_v32int16 	( 	v32acc32  	acc,
;; 		int  	shft,
;; 		int  	sign 
;; 	) 	

(define (srs_to_v32in16 acc)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 32 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %o (bvand (bv #xffff 16) (extract %high1 %low1 acc)))
        %o
      )
    )
  )
  dst 
)

;; simple ups test for v8int32 to v8int80

(define (ups_8_32_to_8_80 xbuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 8 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %o (sign-extend (extract %high1 %low1 xbuff) (bitvector 80)))
        %o
      )
    )
  )
  dst 
)