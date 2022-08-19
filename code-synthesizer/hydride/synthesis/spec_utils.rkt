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
(require hydride/ir/hydride/interpreter)
(require hydride/halide)


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
                     (debug-log (format "Expr ~a has vec-len ~a \n" expr cols))
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

(define (gen-synthesis-spec expr sub-expr-ls base_name)
  (define name (string-append "\"" base_name "\""))
  (define spec-name (get-spec-name base_name))
  (define sema (string-append "[ " (get-expr-sema expr) "]"))
  (define input_shapes (get-input-shapes sub-expr-ls))
  (define output_shape (get-output-shape expr))
  (define input_precision (~s (halide:vec-precision (list-ref sub-expr-ls 0))))
  (define output_precision (~s (halide:vec-precision expr)))
  (define args (get-args-str sub-expr-ls))
  (define spec_invoke "\"\"")
  (string-append 
    "{ \n"
    "\"name\": " name " , \n"
    "\"semantics\": " sema " , \n" 
    "\"input_shapes\": " input_shapes ", \n"
    "\"output_shape\": " output_shape ", \n" 
    "\"input_precision\": " input_precision ", \n"
    "\"output_precision\": " output_precision ", \n"
    "\"args\": " args ", \n"
    "\"spec_invokation\": " spec_invoke "\n" 
    "}\n"
    )
  )

