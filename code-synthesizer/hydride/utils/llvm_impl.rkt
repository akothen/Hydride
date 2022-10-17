#lang rosette
(require rosette/lib/synthax)
(require racket/pretty)
(require rosette/lib/destruct)
(require hydride/utils/bvops)
(require hydride/utils/debug)

;; Implementation of llvm target agnostic operations 
;; to lower to.


(provide (all-defined-out))


;; Implementation of the LLVM shufflevector operation. v1 and v2
;; are vectors of type <len x prec> and permute-mask is a 
;; vector of type <mask-len x i32>.
(define (llvm:shuffle-vectors  v1 v2 len prec  permute-mask mask-len)
  (define result
    (apply 
      concat 
      (for/list ([i  (range mask-len)])
                ;; Get mask index at index i
                (define index-from-right (- mask-len 1 i))
                (define mask-low (* index-from-right 32))
                (define mask-high (+ mask-low 31))
                (define mask-idx-bv (extract mask-high mask-low permute-mask))

                (define mask-idx-val (bitvector->integer mask-idx-bv))

                ;; Identify whether to index into v1 or v2
                (define-values (vec adjusted-idx)
                               (if (>= mask-idx-val  len)

                                 ;; Index into v2
                                 (values v2 (- mask-idx-val len))


                                 ;; Index into v1
                                 (values v1 mask-idx-val)
                                 )
                               )


                (define vec-index-from-right (- len 1 adjusted-idx))
                (define vec-low (* vec-index-from-right prec))
                (define vec-high (+ vec-low (- prec 1)))
                (extract vec-high vec-low vec)
                )
      )
    )
  result
  )
