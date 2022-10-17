#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/misc)
(require hydride/utils/debug)

(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/visitor)
(require hydride/ir/hydride/binder)

(require hydride/synthesis/synth_main)

(require hydride/synthesis/iterative_synthesis)

(require hydride/synthesis/python)



(provide (all-defined-out))



(define (legalize-expr-swizzles hydride-expr solver cost-fn optimize? symbolic?)
  (debug-log "Legalize Expression Swizzle!")


  ;; Visitor function defined on hydride target agnostic instructions. 
  ;; Responsible for lowering the specialized swizzle patterns into
  ;; target specific swizzle operations.
  (define (swizzle-visitor expr)
    (destruct expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (lower-swizzle expr solver cost-fn optimize? symbolic?)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (lower-swizzle expr solver cost-fn optimize? symbolic?)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (lower-swizzle expr solver cost-fn optimize? symbolic?)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (lower-swizzle expr solver cost-fn optimize? symbolic?)
               ]
              [_ expr]
              )
    )

  (hydride:visitor hydride-expr swizzle-visitor)
  )




;; Generate LLVM Permute with mask vector
(define (lower-swizzle-to-llvm-shuffle swizzle)

  0

  )



(define (lower-swizzle swizzle-expr solver cost-fn optimize? symbolic?)
  (debug-log (format "lower-swizzle on expression: ~a \n" swizzle-expr))

  ;; Synthesize all lanes together instead of lane by lane
  ;; since we want multiple positions to be true simultaneously
  (set-synthesize-full)

  (define base_name (string-append "base_" (~s (random 10000))))

  (define swizzle-grammar (get-swizzle-expr-grammar swizzle-expr base_name 16))

  (define swizzle-prec 
    (destruct swizzle-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               prec_i_o
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               prec_i_o
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               prec_i_o
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               prec_i_o
               ]
              [_ (error "unrecognized reference for swizzle")]
              )
    )



  (define original-args 
    (destruct swizzle-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (vector v0 v1)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (vector v0 v1)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (vector v0)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (vector v0)
               ]
              [_ (error "unrecognized reference for swizzle")]
              )
    )

  (define (invoke_ref env)
    (debug-log (format "invoke_ref for swizzles on input ~a \n" env ))
    (define result 
    (destruct swizzle-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (vector-two-input-swizzle (vector-ref env 0) (vector-ref env 1) num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (interleave-vectors (vector-ref env 0) (vector-ref env 1) size_i_o prec_i_o)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (interleave-vector (vector-ref env 0) size_i_o prec_i_o)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (deinterleave-vector (vector-ref env 1) size_i_o prec_i_o)
               ]
              [_ (error "unrecognized reference for swizzle")]
              )
    )
    (debug-log (format "spec produced: ~a\n" result))
    result
    )



  (define (invoke_ref_lane lane-idx env)
    (debug-log (format "invoke_ref_lane for swizzles on input ~a with lane idx ~a\n" env lane-idx))
    (define full-result (invoke_ref env))
    (debug-log (format "invoke ref result: ~a\n" full-result))
    (define result-size (bvlength full-result))
    (define num-elems (/ result-size swizzle-prec))
    (define low (* swizzle-prec lane-idx))
    (define high (+ low (- swizzle-prec 1)))

    (extract high low full-result)
    )

  (define bitwidth-list 
    (destruct swizzle-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (list  (* num_2 prec_i_o) (* num_2 prec_i_o) )
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (list  size_i_o size_i_o )
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (list size_i_o)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (list size_i_o)
               ]
              [_ (error "unrecognized reference for swizzle")]
              )

    )

  (define cost-bound 40)

  (define-values 
    (satisfiable? materialize elapsed)
    (synthesize-sol-with-depth 2 3  invoke_ref invoke_ref_lane swizzle-grammar bitwidth-list optimize? cost-fn symbolic? cost-bound solver)
    )

  (define lowered-expression
    (cond 
      [satisfiable? materialize]
      [else 
        (lower-swizzle-to-llvm-shuffle swizzle-expr)
        ]
      )
    )


  ;; Restore synthesize-by-lane global
  ;; to original value
  (set-synthesize-by-lane)


  ;; Bind the original operands of the shuffle back
  ;; into the synthesized shuffle


  (bind-expr lowered-expression original-args)


  )
