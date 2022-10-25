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




;; Generate LLVM Permute with mask vector. A quick way of 
;; generating the masks is to generate a vector of indices
;; in ascending order and simply apply the shuffle with
;; 32 bit elements and just use that as a mask of the 
;; original inputs.
(define (lower-swizzle-to-llvm-shuffle swizzle)
  (debug-log "lower-swizzle-to-llvm-shuffle ...")
  (define mask
    (destruct swizzle
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (define full-tensor (create-tensor 1 (* 2 num_2) 32))
               (define tensor1 (extract (- (* 2 num_2) 1)  num_2 full-tensor))
               (define tensor2 (extract (- (* 1 num_2) 1)  0 full-tensor))
               (vector-two-input-swizzle tensor1 tensor2  num_2 32 num_4 lane_size num_6 num_7 num_8)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (define num-elems (/ size_i_o prec_i_o))
               (define full-tensor (create-tensor 1 (* 2 num-elems) 32))
               (define tensor1 (extract (- (* 2 num-elems) 1)  num-elems full-tensor))
               (define tensor2 (extract (- (* 1 num-elems) 1)  0 full-tensor))
               (interleave-vectors tensor1 tensor2  (* 32 (/ size_i_o prec_i_o)) 32)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (interleave-vector (create-tensor 1 (/ size_i_o prec_i_o) 32)   (* 32 (/ size_i_o prec_i_o)) 32)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (deinterleave-vector (create-tensor 1 (/ size_i_o prec_i_o) 32)   (* 32 (/ size_i_o prec_i_o)) 32)
               ]
              [_ (error "unrecognized reference for swizzle")]
              )
    )

  (define mask-size (bvlength mask))
  (define num-mask-elems (/ mask-size 32))

  (define llvm-shuffled
    (destruct swizzle
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (llvm:shuffle-vectors_dsl v0 v1 num_2 prec_i_o (lit mask) num-mask-elems)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (llvm:shuffle-vectors_dsl v0 v1 (/ size_i_o prec_i_o) prec_i_o (lit mask) num-mask-elems)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (llvm:shuffle-vectors_dsl v0 v0 (/ size_i_o prec_i_o) prec_i_o (lit mask) num-mask-elems)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (llvm:shuffle-vectors_dsl v0 v0 (/ size_i_o prec_i_o) prec_i_o (lit mask) num-mask-elems)
               ]
              [_ (error "unrecognized reference for swizzle")]
              )

    )

  (debug-log (format "Generated llvm-shuffle ~a\n" llvm-shuffled))
  llvm-shuffled

  )


;; Memoize synthesis of swizzles
(define swizzle-synth-log (make-hash))

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

  (define swizzle-hash
    (destruct swizzle-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (vector-two-input-swizzle_dsl 'arg0 'arg1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (interleave-vectors_dsl 'arg0 'arg1 size_i_o prec_i_o)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (interleave-vector_dsl 'arg0 size_i_o prec_i_o)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (deinterleave-vector_dsl 'arg0 size_i_o prec_i_o)
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
               (vector v0 v0)
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (vector v0 v0)
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
    (if (hash-has-key? swizzle-synth-log swizzle-hash)
      (begin
        (define memo-result (hash-ref swizzle-synth-log swizzle-hash))
        (values (vector-ref memo-result 0)  (vector-ref memo-result 1) (vector-ref memo-result 2))
        )
      (synthesize-sol-with-depth 2 3  invoke_ref invoke_ref_lane swizzle-grammar bitwidth-list optimize? cost-fn symbolic? cost-bound solver)
      )
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

  ;; Add entry to hash
  (hash-set! swizzle-synth-log swizzle-hash (vector satisfiable? lowered-expression elapsed))

  ;; Bind the original operands of the shuffle back
  ;; into the synthesized shuffle


  (define bound-expr
    (destruct lowered-expression
              [(llvm:shuffle-vectors_dsl v0 v1 len prec_i_o mask num-mask-elems)  
               (llvm:shuffle-vectors_dsl (vector-ref original-args 0) (vector-ref original-args 1) len prec_i_o mask num-mask-elems)
               ]
              [v 
                (bind-expr v original-args)
                ]


              )
    )

  bound-expr


  )
