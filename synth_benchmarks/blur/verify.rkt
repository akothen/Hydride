(clear-vc!)
(define (synth_check arg0 )
  {}
  )

(println "Post verify---")

(define-symbolic sym2_arg0 (bitvector 288))

(define cex2 (time
               (verify
(assert (equal? (blur sym2_arg0  6 6 3 3 8)   (synth_check sym2_arg0)))
  )
))

(assert (sat? cex2) "Verified")
(println cex2)

(define v1 (evaluate sym2_arg0 cex2))

(display "v1 ")
(displayln v1)




