#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/utils/debug)
(require hydride/halide)


(require hydride/ir/hydride/definition)

(require hydride/ir/hydride/length)
(require hydride/ir/hydride/prec)


(provide (all-defined-out))


(define (get-expr-sema expr)
  (define ops (remove-duplicates (halide:get-bv-ops expr)))
  (string-append "\"" (~s ops) "\"")
  )

(define (get-input-shapes input-list)
  (define num-inputs (length input-list))
  (define shapes 
    (apply string-append
           (for/list ([i (range num-inputs)])
                     (define expr (list-ref input-list i))
                     (define rows 1)
                     (define cols (halide:vec-len expr))
                     (define sep 
                       (if (equal? i (- num-inputs 1))
                         ""
                         ", "
                         )
                       )

                     (string-append "[" (~s rows) "," (~s cols) "]" sep)
                     )
           )
    )
  (string-append "[" shapes "]")
  )


(define (get-output-shape expr)
  (define shape 
    (string-append "[1 , " (~s (halide:vec-len expr)) "]" )
    )
  shape
  )

(define (get-args-str input-list)
  (define num-inputs (length input-list))
  (define args 
    (apply string-append
           (for/list ([i (range num-inputs)])
                     (define expr (list-ref input-list i))
                     (define bv-str (string-append "SYMBOLIC_BV_" (~s (halide:vec-size expr))))
                     (define sep 
                       (if (equal? i (- num-inputs 1))
                         ""
                         ", "
                         )
                       )

                     (string-append "\"" bv-str "\"" sep)
                     )
           )
    )
  (string-append "[" args "]")
  )

(define (get-spec-name base_name)
  (string-append base_name "_specification")
  )

(define (get-input-precisions sub-expr-ls)
  (define input-precisions (for/list ([i (range (length sub-expr-ls))])
                                     (halide:vec-precision (list-ref sub-expr-ls i))
                                     ))

  (define args 
    (apply string-append
           (for/list ([i (range (length input-precisions))])
                     (define prec (list-ref input-precisions i))
                     (define prec-str (~s prec))
                     (define sep 
                       (if (equal? i (- (length input-precisions) 1))
                         ""
                         ", "
                         )
                       )

                     (string-append  prec-str  sep)
                     )
           )
    )
  (string-append "[" args "]")
  )


(define (get-expr-imms expr)
  (define imms (halide:get-imm-values expr))
  (define imm-ints (for/list ([v imms]) (bitvector->integer v) ))
  (define imm-precs (for/list ([v imms]) (bvlength v) ))

  (define val-strs 
    (for/list ([i (range (length imm-ints))])
              (define val (list-ref imm-ints i))
              (define val-str (string-append "[" (~s val) ", " (~s (list-ref imm-precs i) ) "]"))
              (define sep
                (if (equal? i (- (length imms) 1)) 
                  ""
                  ", "
                  )
                )
              (string-append val-str sep)
              )
    )
  (string-append "[" (apply string-append val-strs) "]")
  )

;; Generates a specification for a Halide IR Expression
(define (gen-synthesis-spec expr sub-expr-ls base_name)
  (define name (string-append "\"" base_name "\""))
  (define spec-name (get-spec-name base_name))
  (define sema (string-append "[ " (get-expr-sema expr) "]"))
  (define input_shapes (get-input-shapes sub-expr-ls))
  (define output_shape (get-output-shape expr))
  (define input_precision (get-input-precisions sub-expr-ls))
  (define output_precision (~s (halide:vec-precision expr)))
  (define args (get-args-str sub-expr-ls))
  (define spec_invoke "\"\"")
  (define imm-ls (get-expr-imms expr))
  (string-append 
    "{ \n"
    "\"name\": " name " , \n"
    "\"semantics\": " sema " , \n" 
    "\"input_shapes\": " input_shapes ", \n"
    "\"output_shape\": " output_shape ", \n" 
    "\"input_precision\": " input_precision ", \n"
    "\"output_precision\": " output_precision ", \n"
    "\"args\": " args ", \n"
    "\"spec_invokation\": " spec_invoke ",\n" 
    "\"imms\": " imm-ls " \n"
    "}\n"
    )
  )


;; Spec generation for swizzles

(define (get-swizzle-expr-sema)
  "\"(list extract concat sign-extend zero-extend)\""
  )


(define (swizzle-shape-infer e)
  ;; TODO: For length and prec, we may potentially
  ;; need the actual types of the input arguments
  ;; as they may not be inferable from the expr
  ;; itself. (Pass id-map?)
  (define len (get-length e (vector))) 
  (define prec (get-prec e (vector)))
  (define num-elems (/ len prec))
  (string-append "[" (~s 1) "," (~s num-elems) "]")
  )

(define (get-swizzle-input-shapes expr)

  (destruct expr
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (string-append "[" "[" "1" "," (~s num_2) "]" ","   "[" "1" "," (~s num_2) "]"  "]" )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (string-append "[" "[" "1" "," (~s (/ size_i_o prec_i_o)) "]" "," "[" "1" "," (~s (/ size_i_o prec_i_o)) "]" "]" )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (string-append "["  "[" "1" "," (~s (/ size_i_o prec_i_o)) "]" "]" )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (string-append "["  "[" "1" "," (~s (/ size_i_o prec_i_o)) "]" "]" )
             ]
            [v (error "Unrecognized swizzle expression" v)]
            )
  )


(define (get-swizzle-output-shape expr)

  (destruct expr
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (swizzle-shape-infer expr)
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (swizzle-shape-infer expr)
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (swizzle-shape-infer expr)
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (swizzle-shape-infer expr)
             ]
            [v (error "Unrecognized swizzle expression" v)]
            )
  )


(define (get-swizzle-input-precisions expr)
  (destruct expr
            [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
             (define v0-prec (~s prec_i_o))
             (define v1-prec (~s prec_i_o))
             (string-append "[" v0-prec  "," v1-prec "]" )
             ]
            [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
             (define v0-prec (~s prec_i_o))
             (define v1-prec (~s prec_i_o))
             (string-append "[" v0-prec  "," v1-prec "]" )
             ]
            [ (interleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-prec (~s prec_i_o))
             (string-append "[" v0-prec  "]" )
             ]
            [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
             (define v0-prec (~s prec_i_o))
             (string-append "[" v0-prec "]" )
             ]
            [v (error "Unrecognized swizzle expression" v)]
            )

  )


(define (get-swizzle-args-str hydride-expr)
  (define input-list
    (destruct hydride-expr
              [ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
               (list  (* num_2 prec_i_o) (* num_2 prec_i_o) )
               ]
              [ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
               (list size_i_o size_i_o)
               ]
              [ (interleave-vector_dsl v0 size_i_o prec_i_o)
               (list size_i_o )
               ]
              [ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
               (list size_i_o )
               ]
              [v (error "Unrecognized swizzle expression" v)]
              )
    )

  (define num-inputs (length input-list))
  (define args 
    (apply string-append
           (for/list ([i (range num-inputs)])
                     (define expr (list-ref input-list i))
                     (define bv-str (string-append "SYMBOLIC_BV_" (~s expr)))
                     (define sep 
                       (if (equal? i (- num-inputs 1))
                         ""
                         ", "
                         )
                       )

                     (string-append "\"" bv-str "\"" sep)
                     )
           )
    )
  (string-append "[" args "]")
  )


;; Generates a specification for a Hydride IR Synthesis Expression
(define (gen-swizzle-synthesis-spec expr  base_name)
  (define name (string-append "\"" base_name "\""))
  (define spec-name (get-spec-name base_name))
  (define sema (string-append "[ " (get-swizzle-expr-sema) "]"))
  (define input_shapes (get-swizzle-input-shapes expr))
  (define output_shape (get-swizzle-output-shape expr))
  (define input_precision (get-swizzle-input-precisions expr))
  (define output_precision (~s (get-prec expr (vector))))
  (define args (get-swizzle-args-str expr))
  (define spec_invoke "\"\"")
  (define imm-ls "[]")
  (string-append 
    "{ \n"
    "\"name\": " name " , \n"
    "\"semantics\": " sema " , \n" 
    "\"input_shapes\": " input_shapes ", \n"
    "\"output_shape\": " output_shape ", \n" 
    "\"input_precision\": " input_precision ", \n"
    "\"output_precision\": " output_precision ", \n"
    "\"args\": " args ", \n"
    "\"spec_invokation\": " spec_invoke ",\n" 
    "\"imms\": " imm-ls " \n"
    "}\n"
    )
  )

