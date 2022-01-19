(clear-vc!)
(define (synth_check arg0 arg1)
  {}
  )

(println "Post verify---")

(define-symbolic sym2_arg0 (bitvector 64))
(define-symbolic sym2_arg1 (bitvector 192))

(define cex2 (time
               (verify
  (assert (equal? (tensor-matmul sym2_arg0 sym2_arg1)  
                  (synth_check sym2_arg0 sym2_arg1)))
  )
))

(assert (sat? cex2) "Verified")
(println cex2)

(define v1 (evaluate sym2_arg0 cex2))
(define v2 (evaluate sym2_arg1 cex2))

(display "v1 ")
(displayln v1)


(display "v2 ")
(displayln v2)


