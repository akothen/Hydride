

(define forall-list (list cex_arg0 cex_arg1 {}))

(pretty-print "SYNTHESIZE----")
(define sol
     (synthesize
     ;(optimize
      #:forall forall-list ; (list  env )
     ; #:minimize (list (cost sketch-grammar) )
      #:guarantee 
                                                     (begin 
                                                       ;(assume (< (cost sketch-grammar) 390 ))
                                                       (assume (equal? (interpret sketch-grammar env) (tensor-conv2D cex_arg0 cex_arg1 4 4 2 2 8)))
                                                       ;(assume (equal? (ext-bv (interpret sketch-grammar env) 0 8) (ext-bv (tensor-conv2D cex_arg0 cex_arg1 4 4 2 2 8) 0 8)))
                                                       {}
                                                       )
      )
  )


(assert (sat? sol) "Unsatisfiable")

(define synth_res (evaluate sketch-grammar sol))
(pretty-print synth_res)
(display "synth cost: ")
(println (cost synth_res))

(with-output-to-file "./body_{}.txt" (lambda() (print-prog synth_res)))

