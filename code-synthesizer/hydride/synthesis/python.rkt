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
(require hydride/utils/target)
(require hydride/ir/hydride/interpreter)
(require hydride/synthesis/symbolic_synthesis)
(require hydride/synthesis/iterative_synthesis)
(require hydride/synthesis/spec_utils)
(require hydride/halide)
(require hydride/ir/hydride/definition)
(require hydride/utils/misc)
(require racket/runtime-path)

(provide (all-defined-out))

(define HYDRIDE_SRC (getenv "HYDRIDE_ROOT"))
(define CODE-SYNTH-PATH
  (if (equal? HYDRIDE_SRC #f)
      (error "HYDRIDE_SRC is undefined!")
      (string-append HYDRIDE_SRC "/code-synthesizer/dsl-ir/")))
(define GEN-GRAMMAR-SCRIPT-NAME "emit_grammar.py")
(define GEN-GRAMMAR-SCRIPT (string-append CODE-SYNTH-PATH GEN-GRAMMAR-SCRIPT-NAME))
(define PYTHON "python3")

(define (generate-grammar-file-step grammar-spec
                                    grammar-file-name
                                    base_name
                                    VF
                                    is_shuffle
                                    step-idx
                                    depth
                                    scale-factor)
  (define target-str
    (cond
      [(equal? target 'x86) "x86"]
      [(equal? target 'hvx) "hvx"]
      [(equal? target 'halide) "halide"]
      [else (error "Unsupported target string for grammar generation" target)]))
  (define spec-file-name (string-append "/tmp/" base_name "_spec.JSON"))
  (write-str-to-file grammar-spec spec-file-name)
  (define gen-grammar-cmd
    (string-append PYTHON
                   " "
                   GEN-GRAMMAR-SCRIPT
                   " "
                   spec-file-name
                   " "
                   (path->string grammar-file-name)
                   " "
                   (~s VF)
                   " "
                   (~s is_shuffle)
                   " "
                   target-str
                   " "
                   (~s step-idx)
                   " "
                   (~s depth)
                   " "
                   (~s scale-factor)))
  (debug-log gen-grammar-cmd)
  (system gen-grammar-cmd))

(define (generate-grammar-file grammar-spec grammar-file-name base_name VF is_shuffle)
  (define target-str
    (cond
      [(equal? target 'x86) "x86"]
      [(equal? target 'hvx) "hvx"]))
  (define spec-file-name (string-append "/tmp/" base_name "_spec.JSON"))
  (write-str-to-file grammar-spec spec-file-name)
  (define gen-grammar-cmd
    (string-append PYTHON
                   " "
                   GEN-GRAMMAR-SCRIPT
                   " "
                   spec-file-name
                   " "
                   (path->string grammar-file-name)
                   " "
                   (~s VF)
                   " "
                   (~s is_shuffle)
                   " "
                   target-str))
  (debug-log gen-grammar-cmd)
  (system gen-grammar-cmd))

;; define-runtime-path: allowed only at the top level racket
;; Hence for dynamically requiring grammar files we use the
;; tmp directory.
(define-runtime-path gen "/tmp/")

;; During synthesis often identical sub-expressions are encountered.
;; To reduce compilation time, we can maintain a memo table of
;; previously synthesized expressions and their corresponding
;; specification. These utilities enable reading this hash-map
;; from file and writing the hash map to file.
(define (import-synth-map filename map_name)
  (debug-log (format "Importing synth log map ~a from ~a ... \n" map_name filename))

  (cond
    ;; First file we're synthesizing in this batch, return empty
    ;; map
    [(equal? filename "") (make-hash)]
    [else
     (define mod-path (build-path gen (string->path filename)))
     (dynamic-require mod-path (string->symbol map_name))]))

(define hydride-import-header
  "#lang rosette
  (require rosette/lib/synthax)
  (require rosette/lib/angelic)
  (require rosette/lib/destruct)
  (require rosette/solver/smt/boolector)
  (require hydride)



  (provide (all-defined-out))
  ")

(define (convert-hash-map-to-str hmap)
  (define str "")

  (define (hash-helper k v)
    (define serialized (format "~a ~a" (~v k) (~v v)))
    (set! str (string-append str "\n" serialized))
    v)

  (hash-map hmap hash-helper)

  (string-append "(hash " str ")"))

(define (save-synth-map filename map_name map-obj)
  (debug-log (format "Storing synth log map ~a to ~a ... \n" map_name filename))
  (define def-hash-str (format "(define ~a ~a)\n" map_name (convert-hash-map-to-str map-obj)))

  (define file_contents (string-append hydride-import-header "\n" def-hash-str))

  (write-str-to-file file_contents filename))

(define (get-expr-grammar expr sub-expr-ls base_name VF)
  (debug-log (format "get-expr-grammar with base_name: ~a\n" base_name))
  (define spec-contents (gen-synthesis-spec-halide expr sub-expr-ls base_name))
  (define grammar-file-name (string-append base_name "_grammar.rkt"))
  (debug-log grammar-file-name)
  (define mod-path (build-path gen (string->path grammar-file-name)))
  (debug-log mod-path)
  (generate-grammar-file spec-contents mod-path base_name VF 0) ;; IS_SHUFFLE = 0
  (debug-log "Generated Grammar File")
  (define (get-grammar mod name)
    (debug-log (format "Dynamically importing from ~a ... \n" name))
    (dynamic-require mod (string->symbol name)))

  (define grammar (get-grammar mod-path (string-append base_name "")))
  (define interpreter (get-grammar mod-path (string-append base_name ":interpret")))
  (define cost-model (get-grammar mod-path (string-append base_name ":cost")))
  (values grammar interpreter cost-model))

(define (get-expr-grammar-step expr sub-expr-ls base_name VF step-idx depth scale-factor)
  (debug-log (format "get-expr-grammar (step-wise synthesis) with base_name: ~a\n" base_name))
  (define spec-contents (gen-synthesis-spec-halide expr sub-expr-ls base_name))
  (define grammar-file-name (string-append base_name "_grammar.rkt"))
  (debug-log grammar-file-name)
  (define mod-path (build-path gen (string->path grammar-file-name)))
  (debug-log mod-path)
  (generate-grammar-file-step spec-contents
                              mod-path
                              base_name
                              VF
                              0
                              step-idx
                              depth
                              scale-factor) ;; IS_SHUFFLE = 0
  (debug-log "Generated Grammar File")
  (define (get-grammar mod name)
    (debug-log (format "Dynamically importing from ~a ... \n" name))
    (dynamic-require mod (string->symbol name)))

  (define grammar (get-grammar mod-path (string-append base_name "")))
  (define interpreter (get-grammar mod-path (string-append base_name ":interpret")))
  (define cost-model (get-grammar mod-path (string-append base_name ":cost")))
  (values grammar interpreter cost-model))

(define (get-expr-grammar-step-hydride expr
                                       base_name
                                       get-ops-functor
                                       visitor-functor
                                       get-length-functor
                                       get-prec-functor
                                       input-precs
                                       input-sizes
                                       input-signedness
                                       VF
                                       step-idx
                                       depth
                                       scale-factor)
  (debug-log (format "get-expr-grammar-hydride (step-wise synthesis) with base_name: ~a\n" base_name))
  (define spec-contents
    (gen-synthesis-spec-hydride expr
                                get-ops-functor
                                visitor-functor
                                get-length-functor
                                get-prec-functor
                                input-precs
                                input-sizes
                                input-signedness
                                base_name))
  (define grammar-file-name (string-append base_name "_grammar.rkt"))
  (debug-log grammar-file-name)
  (define mod-path (build-path gen (string->path grammar-file-name)))
  (debug-log mod-path)
  (generate-grammar-file-step spec-contents
                              mod-path
                              base_name
                              VF
                              0
                              step-idx
                              depth
                              scale-factor) ;; IS_SHUFFLE = 0
  (debug-log "Generated Grammar File")
  (define (get-grammar mod name)
    (debug-log (format "Dynamically importing from ~a ... \n" name))
    (dynamic-require mod (string->symbol name)))

  (define grammar (get-grammar mod-path (string-append base_name "")))
  (define interpreter (get-grammar mod-path (string-append base_name ":interpret")))
  (define cost-model (get-grammar mod-path (string-append base_name ":cost")))
  (values grammar interpreter cost-model))

(define (get-swizzle-expr-grammar expr base_name VF)
  (debug-log (format "get-swizzle-expr-grammar with base_name: ~a\n" base_name))
  (define spec-contents (gen-swizzle-synthesis-spec expr base_name))
  (define grammar-file-name (string-append base_name "_grammar.rkt"))
  (debug-log grammar-file-name)
  (define mod-path (build-path gen (string->path grammar-file-name)))
  (debug-log mod-path)
  (generate-grammar-file spec-contents mod-path base_name VF 1) ;; IS_SHUFFLE = 1
  (debug-log "Generated Grammar File")
  (define (get-grammar mod name)
    (debug-log (format "Dynamically importing from ~a ... \n" name))
    (dynamic-require mod (string->symbol name)))

  (define grammar (get-grammar mod-path (string-append base_name "")))
  grammar)
