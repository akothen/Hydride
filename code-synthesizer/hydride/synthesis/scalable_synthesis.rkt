#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require racket/sandbox)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/utils/misc)
(require hydride/utils/target)
(require hydride/ir/hydride/interpreter)
(require hydride/ir/hydride/binder)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/synth_main)
(require hydride/synthesis/python)

(require hydride/halide)
(require hydride/cpp)
(require hydride/ir/hydride/definition)
(require hydride/ir/hydride/cost_model)
(require hydride/ir/hydride/const_fold)
(require hydride/ir/hydride/printer)
(require hydride/ir/hydride/scale)

(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/scale)
(require hydride/ir/hvx/interpreter)

(require hydride/ir/arm/definition)
(require hydride/ir/arm/cost_model)
(require hydride/ir/arm/const_fold)
(require hydride/ir/arm/printer)
(require hydride/ir/arm/binder)
(require hydride/ir/arm/scale)
(require hydride/ir/arm/interpreter)

(require hydride/ir/visa/definition)
(require hydride/ir/visa/cost_model)
(require hydride/ir/visa/const_fold)
(require hydride/ir/visa/printer)
(require hydride/ir/visa/binder)
(require hydride/ir/visa/scale)
(require hydride/ir/visa/interpreter)

(require hydride/ir/arith/types)
(require hydride/ir/arith/interpreter)
(require hydride/ir/arith/utils)
(require hydride/ir/arith/visitor)

(provide (all-defined-out))

;; Defines the utilities to perform synthesis on Halide IR expressions

(define (scale-down-synthesis halide-expr
                              expr-depth
                              VF
                              id-map
                              solver
                              opt?
                              sym?
                              scale-factor
                              synth-log)

  (define actual-expr-depth
    (cond
      [(equal? input-lang 'mlir) expr-depth]
      ;; Immediate expression is ramp, we can use the provided depth
      [(ramp? halide-expr) expr-depth]
      [(halide:contains-complex-op-in-subexpr halide-expr expr-depth)
       (debug-log (format "Contains complex operation, hence decrement depth from ~a to ~a\n"
                          expr-depth
                          (max 1 (- expr-depth 1))))
       (max 1 (- expr-depth 1))]
      [(and (equal? target 'arm) (halide:contains-complex-op-in-subexpr-arm halide-expr expr-depth))
       (debug-log
        (format
         "Contains shr in arm, at least 2 depth are needed, hence increase depth from ~a to ~a\n"
         expr-depth
         (max expr-depth 2)))
       (max expr-depth 2)]
      [(not (halide:contains-mul-op-in-subexpr halide-expr expr-depth))
       (define max-no-mul-depth 4)
       (debug-log
        (format
         "Does not contain mul op, reduce depth to maximum of 5, hence decrement depth from ~a to ~a\n"
         expr-depth
         (min max-no-mul-depth expr-depth)))
       (min max-no-mul-depth expr-depth)]
      [else expr-depth]))

  (define-values (get-expr-depth get-sub-exprs
                                 get-expr-bv-sizes
                                 get-expr-elemT
                                 get-len
                                 scale-down-expr
                                 create-buffers
                                 bind-expr-args
                                 assemble-result
                                 hash-expr-fn)
    (cond
      [(equal? input-lang 'halide)
       (define (get-halide-output expr)
         (halide:assemble-bitvector (halide:interpret expr) (halide:vec-len expr)))

       (values halide:get-expr-depth
               halide:get-sub-exprs
               halide:get-expr-bv-sizes
               halide:get-expr-elemT
               halide:vec-len
               halide:scale-down-expr
               halide:create-buffers
               halide:bind-expr-args
               get-halide-output
               halide:hash-expr)]
      [(equal? input-lang 'mlir)
       (define (get-arith-output expr)
         (arith:evaluate-arith-expr expr))

       (values arith:get-expr-depth
               arith:get-sub-exprs
               arith:get-expr-bv-sizes
               arith:get-expr-elemT
               arith:vec-len
               arith:scale-down-expr
               arith:create-buffers
               arith:bind-expr-args
               get-arith-output
               arith:hash-expr)]))

  (set! actual-expr-depth (min actual-expr-depth (+ (get-expr-depth halide-expr) 1)))

  (debug-log "=======================================")
  (define leaves (get-sub-exprs halide-expr (+ actual-expr-depth 1)))
  (define leaves-sizes (get-expr-bv-sizes leaves))
  (define leaves-elemT (get-expr-elemT leaves))
  (define sym-bvs (create-concrete-bvs leaves-sizes)) ;; Can this be concrete

  (define effective-scale-factor scale-factor)
  (debug-log "Pre scale factor: ")
  (debug-log effective-scale-factor)
  (debug-log "Check leaves")
  (debug-log leaves)
  (define (set-effective-scale-factor ele)
    ;(define-values (can-scale? _ ) (halide:scale-down-expr ele scale-factor))
    (define ele-lanes (get-len ele))
    (debug-log ele-lanes)
    (debug-log (modulo ele-lanes scale-factor))
    (cond
      [(not (equal? (modulo ele-lanes scale-factor) 0))
       (debug-log (format "~a may not be scaled properly" ele))
       (set! effective-scale-factor 1)])
    ele)

  (map set-effective-scale-factor leaves)

  (debug-log (format "Setting effective scale-factor to ~a \n" effective-scale-factor))

  ;; Dummy args contains the scaled down arguments for the expression to be
  ;; synthesized
  (define (map-functor ele)
    (define-values (_ scaled-ele) (scale-down-expr ele effective-scale-factor))
    scaled-ele)

  (define scaled-leaves (map map-functor leaves))
  (define scaled-leaves-sizes (get-expr-bv-sizes scaled-leaves))
  (define scaled-leaves-elemT (get-expr-elemT scaled-leaves))
  (define scaled-bvs (create-concrete-bvs scaled-leaves-sizes)) ;; Can this be concrete

  (define dummy-args (create-buffers scaled-leaves scaled-bvs))

  ;; Produce a vector from dummy-args such that, everytime we encounter a leaf id we
  ;; have seen before, we use the previous dummy-arg, otherwise we preserve what 
  ;; in the list
  (define (update-arg-by-leaves leaves dummy-args) 
    (let ([tmp (make-hash)])
      (list->vector (for/list ([i (in-range (length leaves))])
        (let ([a_id (destruct (list-ref leaves i)
                              [(arith:tensor data shape layout elemT buffsize id)
                               id]
                              ;; TODO for halide reg
                              [_ (- i (length leaves))] ;; for non-reg-like leaves
                              ;; give it a unique id, i-n is collision free in this way
                              )])
          (if (hash-has-key? tmp a_id)
              (vector-ref dummy-args (hash-ref tmp a_id))
              (begin
                (hash-set! tmp a_id i)
                (vector-ref dummy-args i))))))))
  (set! dummy-args (update-arg-by-leaves scaled-leaves dummy-args))
  (debug-log "created dummy args!")

  ;; Helper for verification of later up-scaled versions
  (define (verify-upscaled-equal? hydride-expr)
    (debug-log "Verifying upscaled expression")
    (clear-vc!)
    (debug-log hydride-expr)
    (define leave-sizes (get-expr-bv-sizes leaves))

    ;; First test if the expressions are equivalent on a concrete value
    ;; instead of falling back to expensive verification

    (define conc-bvs (create-concrete-bvs leaves-sizes))
    (define halide-expr-args-conc (create-buffers leaves conc-bvs))
    (define-values (expr-extract-conc num-used-conc)
      (bind-expr-args halide-expr halide-expr-args-conc actual-expr-depth))

    (define conc-halide-res (assemble-result expr-extract-conc))

    (define conc-hydride-res
      (cond
        [(equal? target 'hvx) (hvx:interpret hydride-expr conc-bvs)]
        [(equal? target 'arm) (arm:interpret hydride-expr conc-bvs)]
        [(equal? target 'visa) (visa:interpret hydride-expr conc-bvs)]
        [(equal? target 'x86) (hydride:interpret hydride-expr conc-bvs)]))

    (define conc-equal? (equal? conc-halide-res conc-hydride-res))

    (cond
      [conc-equal?
       ;; Try expensive equivalnce verification

       (debug-log (format "Symbolic bv sizes: ~a" leave-sizes))

       (define sym-bvs (create-symbolic-bvs leaves-sizes))

       (define halide-expr-args (create-buffers leaves sym-bvs))
       (define-values (expr-extract num-used)
         (bind-expr-args halide-expr halide-expr-args actual-expr-depth))

       (debug-log expr-extract)

       ;(define halide-res (halide:assemble-bitvector (halide:interpret expr-extract) (halide:vec-len expr-extract)))
       (define halide-res (assemble-result expr-extract))
       (define hydride-res
         (cond
           [(equal? target 'hvx) (hvx:interpret hydride-expr sym-bvs)]
           [(equal? target 'arm) (arm:interpret hydride-expr sym-bvs)]
           [(equal? target 'visa) (visa:interpret hydride-expr sym-bvs)]
           [(equal? target 'x86) (hydride:interpret hydride-expr sym-bvs)]))

       (define verification-timeout? #t)
       (define cex
         (cond
           [verification-timeout?
            (with-handlers ([exn:fail? (lambda (exn) (unsat))])
              (with-deep-time-limit 30
                                    (verify (begin
                                              (assert (equal? halide-res hydride-res))))))]
           [else
            (verify (begin
                      (assert (equal? halide-res hydride-res))))]))

       (cond
         [(sat? cex)
          (debug-log "Up scaled version not equivalent")
          (debug-log cex)
          #f]
         [else
          (debug-log "Up scaled version  equivalent!")
          #t])]
      [else
       (debug-log "verification failed on initial concrete values for cex")
       #f]))

  (define synthesized-sol
    (destruct
     halide-expr
     [(buffer data elem buffsize)
      (debug-log "Leaf buffer:")
      (debug-log halide-expr)
      (reg (hash-ref! id-map halide-expr -1)) ;; have a map to use accurate reg number
      ]
     [(arith:tensor data shape layout elemT buffsize id)
      (debug-log "Arith:leaf buffer:")
      (debug-log halide-expr)
      (reg (hash-ref! id-map halide-expr -1)) ;; have a map to use accurate reg number
      ]
     [_
      (begin

        (define-values (_ scaled-down-expr) (scale-down-expr halide-expr effective-scale-factor))
        (define-values (expr-extract num-used)
          (bind-expr-args scaled-down-expr dummy-args actual-expr-depth))

        (debug-log expr-extract)

        ;; The extracted sub-expression is to be treated
        ;; as synthesis of some un-seen new expression
        ;; and so we must create a new id-map for the registers to bind to

        (define recalculate-args (create-buffers leaves sym-bvs))
        (define sub-id-map (make-hash))
        (for/list ([i (range (vector-length recalculate-args))])
          (define dummy-buf (vector-ref recalculate-args i))
          (hash-set! sub-id-map dummy-buf (bv i (bitvector 8))))

        (define expr-VF (get-len expr-extract))

        (debug-log (format "Vectorization factor for sub expression ~a\n" expr-VF))

        (define (invoke-spec env-full)
          (set! env-full (update-arg-by-leaves scaled-leaves env-full))
          (debug-log (format "invoke-spec with env: ~a\n" env-full))
          (define synth-buffers-full (create-buffers scaled-leaves env-full))
          ;(debug-log scaled-leaves)

          (cond
            [(equal? input-lang 'halide) (halide:assume-buffers-signedness synth-buffers-full)])

          (define-values (_ scaled-down-expr-full)
            (scale-down-expr halide-expr effective-scale-factor))
          (define-values (_expr-extract-full _num-used)
            (bind-expr-args scaled-down-expr-full synth-buffers-full actual-expr-depth))
          (debug-log "Scaled expression:")
          (debug-log _expr-extract-full)

          ;(define _result_full (halide:assemble-bitvector (halide:interpret _expr-extract-full) expr-VF))
          (define _result_full (assemble-result _expr-extract-full))
          (debug-log "Spec result")
          (debug-log _result_full)
          _result_full)

        ;; Calculate result for last most lane
        (define (invoke-spec-lane lane-idx env-lane)
          (set! env-lane (update-arg-by-leaves scaled-leaves env-lane))
          (debug-log (format "invoke-spec-lane with env: ~a\n" env-lane))
          (define synth-buffers-lane (create-buffers scaled-leaves env-lane))

          (cond
            [(equal? input-lang 'halide) (halide:assume-buffers-signedness synth-buffers-lane)])

          (define-values (_ scaled-down-expr-lane)
            (scale-down-expr halide-expr effective-scale-factor))
          (define-values (_expr-extract _num-used)
            (bind-expr-args scaled-down-expr-lane synth-buffers-lane actual-expr-depth))
          (define output-idx (- expr-VF 1 lane-idx))
          ;(define _result_lane (cpp:eval ((halide:interpret _expr-extract) output-idx)))
          (define _result_lane
            (cond
              [(equal? input-lang 'halide) (cpp:eval ((halide:interpret _expr-extract) output-idx))]
              [(equal? input-lang 'mlir)
               (cpp:eval (arith:interpret _expr-extract (vector output-idx)))]))

          _result_lane)

        (define depth-limit
          (cond
            [(equal? target 'hvx) 5]
            [(equal? target 'arm) 5]
            [(equal? target 'visa) 5]
            [(equal? target 'x86) 5]))
        (define optimize? opt?)
        (define symbolic? sym?)

        (debug-log (format "Synthesizing sub-expression using expression-depth ~a \n"
                           actual-expr-depth))
        (debug-log expr-extract)

        (define hashed-expr (hash-expr-fn expr-extract))

        (debug-log "Hashed expression")
        (debug-log hashed-expr)
        (debug-log "Leaves are bitvectors of sizes:")
        (debug-log leaves-sizes)

        ;; Check if unscaled version exists in hash
        (define halide-expr-args (create-buffers leaves sym-bvs))
        (define-values (unscaled-expr-extract unscaled-num-used)
          (bind-expr-args halide-expr halide-expr-args actual-expr-depth))
        (define unscaled-hashed-expr (hash-expr-fn unscaled-expr-extract))

        (debug-log "Unscaled Hashed expression")
        (debug-log unscaled-hashed-expr)

        (define hashed-sol? #f)

        (define-values (satisfiable? materialize elap)
          (cond
            [(hash-has-key? synth-log hashed-expr)
             (begin
               (debug-log "Equivalent expression synthesized before, returned stored solution")
               (define memo-result (hash-ref synth-log hashed-expr))
               (set! hashed-sol? (vector-ref memo-result 0))
               (debug-log (format "Equivalent solution required ~a seconds on synthesis time"
                                  (vector-ref memo-result 2)))
               (values (vector-ref memo-result 0)
                       (vector-ref memo-result 1)
                       (vector-ref memo-result 2)))]
            [(hash-has-key? synth-log unscaled-hashed-expr)
             (begin
               (debug-log
                "Equivalent unscaled expression synthesized before, returned stored solution")
               (define memo-result (hash-ref synth-log unscaled-hashed-expr))
               (set! hashed-sol? (vector-ref memo-result 0))
               (set! effective-scale-factor 1)
               (debug-log (format "Equivalent solution required ~a seconds on synthesis time"
                                  (vector-ref memo-result 2)))
               (values (vector-ref memo-result 0)
                       (vector-ref memo-result 1)
                       (vector-ref memo-result 2)))]
            [else
             (begin

               (define test-start (current-seconds))

               (define cost-bound
                 (cond
                   [else 30]))

               (debug-log "Hashed expression")
               (debug-log hashed-expr)

               (define-values (sat? mat el)
                 (step-wise-synthesis expr-extract
                                      scaled-leaves
                                      (max (+ -1 actual-expr-depth) 1)
                                      depth-limit
                                      invoke-spec
                                      invoke-spec-lane
                                      optimize?
                                      symbolic?
                                      solver
                                      effective-scale-factor))

               (define test-end (current-seconds))

               (debug-log "Test elapsed time: ")
               (debug-log (- test-end test-start))

               (debug-log hashed-expr)
               (debug-log (vector sat? mat el))

               ;; Only memoize succesful entries
               (cond
                 [sat? (hash-set! synth-log hashed-expr (vector sat? mat (- test-end test-start)))]
                 [else (hash-set! synth-log hashed-expr (vector sat? '() (- test-end test-start)))])

               (define result
                 (cond
                   [sat? (vector sat? mat (- test-end test-start))]
                   [else (vector #f '() 0)]))

               (debug-log "Synthesis step completed!")
               (values (vector-ref result 0) (vector-ref result 1) (vector-ref result 2)))]))

        (if satisfiable?
            (begin
              (debug-log "Solution")
              (debug-log materialize))
            (begin
              (debug-log "Unsatisfiable, try smaller window within given sub-expression")
              (define-values (expr-extract num-used)
                (bind-expr-args halide-expr recalculate-args actual-expr-depth))
              (define expr-VF (get-len expr-extract))

              (if (eq? actual-expr-depth 1)
                  (begin
                    (debug-log "Error unable to synthesize expression even with depth 1")
                    (exit))
                  '())
              (define recalculate
                (scale-down-synthesis expr-extract
                                      (max 1 (- actual-expr-depth 1))
                                      VF
                                      sub-id-map
                                      solver
                                      opt?
                                      sym?
                                      scale-factor
                                      synth-log))
              (debug-log "Smaller window synthesis returned:")
              (debug-log recalculate)
              (set! satisfiable? #t)
              (set! hashed-sol? #t)
              (set! materialize recalculate)
              (set! effective-scale-factor 1)
              ;(hash-set! synth-log hashed-expr (vector satisfiable? materialize 0))
              ))

        (debug-log materialize)

        (debug-log "Cost")

        (define cost-functor
          (cond
            [(equal? target 'hvx) hvx:cost]
            [(equal? target 'arm) arm:cost]
            [(equal? target 'visa) visa:cost]
            [(equal? target 'x86) hydride:cost]))
        (debug-log (cost-functor materialize))

        ;; Now that we've synthesized the sub-expression
        ;; we can clear the symbolic heap
        (clear-terms!)
        (collect-garbage)
        ;(debug-log "Collected Garbage!")

        (define synthesized-leaves

          (for/list ([leaf leaves])
            (scale-down-synthesis leaf expr-depth VF id-map solver opt? sym? scale-factor synth-log))
          ;)
          )
        (debug-log "Synthesized-leaves")
        (debug-log synthesized-leaves)

        (define bind-functor
          (cond
            [(equal? target 'hvx) hvx:bind-expr]
            [(equal? target 'arm) arm:bind-expr]
            [(equal? target 'visa) visa:bind-expr]
            [(equal? target 'x86) bind-expr]))

        (define upscaled-mat
          (cond
            [(equal? effective-scale-factor 1) materialize]
            [(equal? target 'hvx) (hvx:scale-expr materialize effective-scale-factor)]
            [(equal? target 'arm) (arm:scale-expr materialize effective-scale-factor)]
            [(equal? target 'visa) (visa:scale-expr materialize effective-scale-factor)]
            [(equal? target 'x86) (hydride:scale-expr materialize effective-scale-factor)]))

        (debug-log (format "Upscaled mat: ~a" upscaled-mat))

        (cond
          [(equal? effective-scale-factor 1)
           (define bound-expr (bind-functor upscaled-mat (list->vector synthesized-leaves)))
           (debug-log "Bound expr")
           (debug-log bound-expr)
           bound-expr]
          [else
           ;; Before combining solution check if the upscaled version still remains equivalent

           (begin
             (define equiv?
               (cond
                 [hashed-sol? #t]
                 [(lit? upscaled-mat) #t]
                 [else (verify-upscaled-equal? upscaled-mat)]))

             (define use-expr
               (cond
                 [equiv? upscaled-mat]
                 [else
                  (hash-remove! synth-log hashed-expr)

                  (debug-log "Not equivalent on upscaled version: need to synthesize without scaling")
                  (define-values (expr-extract num-used)
                    (bind-expr-args halide-expr recalculate-args actual-expr-depth))
                  (define expr-VF (get-len expr-extract))
                  (scale-down-synthesis expr-extract
                                        (max 1 (- actual-expr-depth 1))
                                        expr-VF
                                        sub-id-map
                                        solver
                                        opt?
                                        sym?
                                        1 ;scale-factor
                                        synth-log)]))

             (define bound-expr (bind-functor use-expr (list->vector synthesized-leaves)))
             (debug-log "Bound expr")
             (debug-log bound-expr)
             bound-expr)]))]))

  (debug-log "========================================")
  (debug-log "Original Halide Sub-Expression:")
  (debug-log halide-expr)
  (debug-log "Sub-expression Synthesis completed:")
  (debug-log synthesized-sol)
  (debug-log "========================================")
  (displayln "Synthesis query completed ...")
  synthesized-sol)

;; Perform iterative synthesis by partitioning relavent operations
;; into buckets and sampling operations from buckets in the grammar.
(define (step-wise-synthesis spec-expr
                             leaves
                             starting-depth
                             depth-limit
                             invoke-spec
                             invoke-spec-lane
                             optimize?
                             symbolic?
                             solver
                             scale-factor)
  (println (format "Invoked step-wise-synthesis!\n"))

  (define step-limit 8) ;; temporary change for arm

  (define solved? #f)
  (define min-cost
    #f) ;; Alternate threads may find different solutions together, we keep the one with the min cost
  (define expr-VF
    (cond
      [(equal? input-lang 'halide) (halide:vec-len spec-expr)]
      [(equal? input-lang 'mlir) (arith:vec-len spec-expr)]))

  (define leaves-sizes
    (cond
      [(equal? input-lang 'halide) (halide:get-expr-bv-sizes leaves)]
      [(equal? input-lang 'mlir) (arith:get-expr-bv-sizes leaves)]))
  (define cost-bound 30)

  (define sol '())

  ;(set! depth-limit (max depth-limit (+ 2 starting-depth) ))

  (set! starting-depth 1)
  (set! depth-limit 4)

  (define start-time (current-seconds))

  ;; Set timeout for overall time spent trying the synthesize any one query
  (set-start-time-global-timeout)
  (set-global-timeout #t)

  (define solutions

    ;; Traversal order first searchs the breadth of grammars
    ;; at the depth d before incrementing d.
    (for/list ([d (range starting-depth depth-limit)])

      (debug-log
       (format "=====================\nSTARTING SYNTHESIS FOR DEPTH ~a\n=====================\n" d))
      (define steps-per-depth
        (cond
          ;;; [(<= d 3) step-limit]
          [(<= d 1) 5]
          [(<= d 2) step-limit]
          [(<= d 3) 3]
          ;(* 1 step-limit)
          [(equal? d 4) 64]
          [else 64]))

      (define NUM_THREADS
        (cond
          ;;; [(<= d 2) 1]
          ;;; [else 4]))
          [(<= d 1) 1]
          [(<= d 2) 2]
          [(<= d 3) 4]
          [else 8]))

      (for/list ([s (range 0 steps-per-depth NUM_THREADS)])

        (cond
          ;; Already solved, no need to launch parallel threads
          ;; avoid overheads
          [solved? '()]
          [else

           (define step-low s)
           (define step-high (min (+ step-low NUM_THREADS) steps-per-depth))

           ;; If even one of the threads finds a valid solution,
           ;; we can kill all other threads. Use THREADS-REF variable
           ;; to 'hack' circular definition.
           (define THREADS-REF '())
           (define (kill-other-threads exclude-idx)
             (debug-log
              (format "Killing all other threads except ~a!, num threads currently executing: ~a\n"
                      exclude-idx
                      (length THREADS-REF)))
             (for/list ([t-idx (range (length THREADS-REF))])
               (define actual-thread-idx (+ step-low t-idx))
               (cond
                 [(equal? actual-thread-idx exclude-idx) '()]
                 [else
                  (debug-log (format "Killing thread at relative index ~a\n" t-idx))
                  (kill-thread (list-ref THREADS-REF t-idx))])))

           (define thds
             (for/list ([t (range step-low step-high)])
               (set-optimize-bound-found #f)
               (parameterize ([current-solver (if (equal? solver 'z3) (z3) (boolector))]
                              ;[current-custodian (make-custodian)]
                              [current-bitwidth 16])
                 (thread
                  (thunk
                   (clear-vc!)
                   (clear-terms!)
                   (collect-garbage)
                   ;    (custodian-limit-memory (current-custodian) (* 7000 1024 1024))
                   ;; if solution already found in previous
                   ;; iteration, do nothing.
                   (cond
                     [(not solved?)
                      (define base_name
                        (string-append "base_" (~s (random 10000)) "_s" (~s t) "_d" (~s d)))
                      ;; get-grammar step-i, depth d
                      ;; get-interpreter step-i, depth d
                      ;; get-cost-model step-i, depth d
                      (define-values (grammar interpreter cost-model)
                        (get-expr-grammar-step spec-expr leaves base_name expr-VF t d scale-factor))

                      (define (grammar-fn i)
                        (grammar i))

                      (debug-log (format "Specification: ~a\n" spec-expr))

                      ;; perform synthesis
                      (define-values (sat? mat el)
                        (synthesize-sol-with-depth d
                                                   d
                                                   invoke-spec
                                                   invoke-spec-lane
                                                   grammar-fn
                                                   leaves-sizes
                                                   optimize?
                                                   interpreter
                                                   cost-model
                                                   symbolic?
                                                   cost-bound
                                                   solver))

                      (cond
                        [(and sat? (equal? min-cost #f))
                         (set! solved? #t)
                         (set! sol mat)
                         (set! min-cost (cost-model mat))
                         (debug-log (format "First solution found for query with cost ~a\n"
                                            min-cost))]
                        [(and sat? (<= (cost-model mat) min-cost))
                         (set! sol mat)
                         (set! min-cost (cost-model mat))
                         (debug-log (format "Better solution found for query with cost ~a\n"
                                            min-cost))])]))) ; (thread thunk
                 ) ;; paramterize
               ) ;; threads list
             ) ;; thds

           (set! THREADS-REF thds)

           (debug-log (format "Waiting on parallel threads range ~a to ~a for synthesis depth ~a \n"
                              step-low
                              step-high
                              d))
           (for/list ([thd thds])
             (thread-wait thd))]))))

  (define end-time (current-seconds))

  ;; Reset context for next synthesis
  (set-optimize-bound-found #f)
  (set-global-timeout #f)
  (collect-garbage)

  (debug-log "Stepwise synthesis completed!")

  (if (not solved?)
      (begin
        (debug-log "Synthesis failed!")
        (values #f sol (- end-time start-time)))
      (values solved? sol (- end-time start-time))))
