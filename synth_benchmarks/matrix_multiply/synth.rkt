

(pretty-print "SYNTHESIZE----")
(define sol
  (time
    (synthesize
   ; (optimize
      #:forall (list  env )
     ; #:minimize (list (cost sketch-grammar) )
      #:guarantee ;(forall (list cex_arg0 cex_arg1 env) 
                                                     (begin 
                                                       ;(assume (< (cost sketch-grammar) 450))
                                                       (assume (equal? (interpret sketch-grammar env) (tensor-matmul cex_arg0 cex_arg1)))
                                                       {}
                                                       )
      )
    )
  )


(assert (sat? sol) "Unsatisfiable")

(define synth_res (evaluate sketch-grammar sol))
(pretty-print synth_res)
(display "synth cost: ")
(println (cost synth_res))

(with-output-to-file "./body_{}.txt" (lambda() (print-prog synth_res)))

;(println "Post verify---")
;(clear-vc!)

;(define-symbolic sym2_arg0 (bitvector 64))
;(define-symbolic sym2_arg1 (bitvector 192))

;(define sym_env (vector sym2_arg0 sym2_arg1))
;(define cex2 (time
;               (verify
;  (assert (equal? (tensor-matmul sym2_arg0 sym2_arg1)  
;                  (interpret synth_res sym_env)))
;  )
;))

;(assert (sat? cex2) "Verified")
;(println cex2)

;(define v1 (evaluate sym2_arg0 cex2))
;(define v2 (evaluate sym2_arg1 cex2))

;(display "v1 ")
;(displayln v1)


;(display "v2 ")
;(displayln v2)


