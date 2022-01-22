
(define e_0_0 (bv #x7fff7f7fffffffff7fffff7f7f7f7f7f (bitvector 128)))
(define e_0_1 (bv #xffffffff  (bitvector 32)))

(define e0_env (vector  e_0_0 e_0_1 ))


(define e_1_0 (bv #x0123456789abcdef0123456789abcdef  (bitvector 128)))
(define e_1_1 (bv #x7fff7f7fffffffff7fffff7f7f7f7f7f   (bitvector 32)))


(define e1_env (vector  e_1_0 e_1_1 ))

(define e_2_0 (bv 0 (bitvector 128)))
(define e_2_1 (bv 0  (bitvector 32)))

(define e2_env (vector  e_2_0 e_2_1 ))

(pretty-print "SYNTHESIZE----")
(define sol
     (synthesize
     ;(optimize
      #:forall (list cex_arg0 cex_arg1 e_0_0 e_0_1 e_1_0 e_1_1 e_0_1 e_2_0 e_2_1 {}) ;forall-list ; (list  env )
      ;#:minimize (list (cost sketch-grammar) )
      #:guarantee 
                                                     (begin 
                                                       (assert (equal? (interpret sketch-grammar env) (tensor-conv2D cex_arg0 cex_arg1 4 4 2 2 8)))

                                                       (assert (equal? (interpret sketch-grammar e0_env) (tensor-conv2D e_0_0 e_0_1 4 4 2 2 8)))

                                                       (assert (equal? (interpret sketch-grammar e1_env) (tensor-conv2D e_1_0 e_1_1 4 4 2 2 8)))

                                                       (assert (equal? (interpret sketch-grammar e2_env) (tensor-conv2D e_2_0 e_2_1 4 4 2 2 8)))
                                                       ;(assume (equal? (ext-bv (interpret sketch-grammar env) 0 8) (ext-bv (tensor-conv2D cex_arg0 cex_arg1 4 4 2 2 8) 0 8)))
                                                       {}
                                                       (assert (has-symmetric-structure sketch-grammar))
                                                       (assert (< (cost sketch-grammar) 450 ))
                                                       ;(assert (> (cost sketch-grammar) 350 ))
                                                       )
      )
  )


(assert (sat? sol) "Unsatisfiable")

(define synth_res (evaluate sketch-grammar sol))
(pretty-print synth_res)
(display "synth cost: ")
(println (cost synth_res))

;(println (get-structure-list synth_res))
(displayln "Does Solution have a symmetric structure?")
(println (has-symmetric-structure synth_res))

(with-output-to-file "./body_{}.txt" (lambda() (print-prog synth_res)))

