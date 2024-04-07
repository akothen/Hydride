;; simple srs test for v8int80 to v8int32

(define (srs xbuff)
  (define dst
    (apply concat
      (for/list ([%i (reverse (range 0 8 1))])
        (define %low1 (* 32 %i))
        (define %high1 (+ %low1 (- 32 1)))
        (define %o (extract %high1 %low1 xbuff))
        %o
      )
    )
  )
  dst 
)


(define (srs xbuff)
(define dst
(apply concat
(for/list ([%i (reverse (range 0 8 1))])
(define %low1 (* 32 %i))
(define %high1 (+ %low1 (- 32 1)))
(define %o (extract %high1 %low1 xbuff))
%o
)
)
)
dst 
)