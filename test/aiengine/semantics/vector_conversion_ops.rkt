;; simple srs test for v8int80 to v8int32

(define (srs_8_80_to_8_32 xbuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 8 1))])
        (define %low1 (* 80 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %o (extract %high1 %low1 xbuff))
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