#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require rosette/solver/smt/z3)
(require hydride/utils/bvops)
(require hydride/ir/hydride/interpreter)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/spec_utils)
(require hydride/halide)
(require hydride/ir/hydride/definition)
(require hydride/utils/misc)
(require racket/runtime-path)


(provide (all-defined-out))

(define HYDRIDE_SRC "/home/arnoor2/Racket/TensorSynth/Rosette-experiments/")
(define CODE-SYNTH-PATH (string-append HYDRIDE_SRC "/code-synthesizer/dsl-ir/" ))
(define GEN-GRAMMAR-SCRIPT-NAME "emit_grammar.py")
(define GEN-GRAMMAR-SCRIPT (string-append CODE-SYNTH-PATH GEN-GRAMMAR-SCRIPT-NAME))
(define PYTHON "python3")

(define (generate-grammar-file grammar-spec grammar-file-name base_name)
  (define spec-file-name (string-append base_name "_spec.JSON"))
  (write-str-to-file grammar-spec spec-file-name)




  (define gen-grammar-cmd (string-append PYTHON " " GEN-GRAMMAR-SCRIPT " " spec-file-name " " (path->string grammar-file-name)))
  (displayln gen-grammar-cmd)
  (system gen-grammar-cmd)



  )

;; define-runtime-path: allowed only at the top level racket
;; Hence for dynamically requiring grammar files we use the
;; tmp directory.
(define-runtime-path gen "/tmp/")



(define (get-expr-grammar expr sub-expr-ls base_name)
  (printf "get-expr-grammar with base_name: ~a\n" base_name)
  (define spec-contents (gen-synthesis-spec expr sub-expr-ls base_name))
  (define grammar-file-name (string-append base_name "_grammar.rkt"))
  (println grammar-file-name)
  (define mod-path (build-path gen (string->path grammar-file-name)))
  (println mod-path)
  (generate-grammar-file spec-contents mod-path base_name)
  (displayln "Generated Grammar File")
  (define (get-grammar mod name)
    (dynamic-require mod (string->symbol name))
    )

  (define grammar (get-grammar mod-path (string-append base_name "_grammar_operations")));;(dynamic-require gen (string->symbol (string-append base_name "_grammar_operations"))))
  grammar
  )


