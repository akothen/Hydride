

(pretty-print "SYNTHESIZE----")
(define sol
  (time
    ;(synthesize
    (optimize
     ; #:forall (list  env )
      #:minimize (list (cost sketch-grammar) )
      #:guarantee ;(forall (list cex_arg0 cex_arg1 env) 
                                                     (begin 
                                                       (assume (equal? (interpret sketch-grammar env) (tensor-conv2D cex_arg0 cex_arg1 4 4 2 2 8)))
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

