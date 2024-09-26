#lang rosette

(require racket/pretty)

;; Transpose 64x2 matrix of 8 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T8_64x2_lo v64int8_a v64int8_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 8))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 8 1)))
                            (define %a (extract  %high %low v64int8_a))
                            (define %b (extract  %high %low v64int8_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 64x2 matrix of 8 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T8_64x2_hi v64int8_a v64int8_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 8))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 8 1)))
                            (define %a (extract  %high %low v64int8_a))
                            (define %b (extract  %high %low v64int8_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)
