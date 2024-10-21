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
(require hydride/utils/misc)
(require hydride/utils/target)
(require hydride/ir/hydride/interpreter)
(require hydride/halide)
(require hydride/synthesis/python)
(require hydride/synthesis/algorithm)
(require hydride/ir/hydride/printer)

(require hydride/ir/hvx/printer)
(require hydride/ir/arm/printer)

(require hydride/ir/aie/printer)

(require hydride/ir/visa/printer)

(require hydride/ir/arith/utils)

(provide (all-defined-out))

;; Convert hydride expression with into string
;; with type information for inputs and intermediate
;; expressions.
(define (hydride-to-str hydride-expr id-map)
  (define (print-helper k v)
    (define type-str
      (string-append
       "; (reg "
       (~s (bitvector->natural v))
       ") "
       (cond
         [(equal? input-lang 'mlir) (arith:print-buffer-type-info k)]
         [(equal? input-lang 'halide) (halide:print-buffer-type-info k)]
         [else (error "llvm_codegen.rtk: Unsupported input language in hydride-to-str")])
       "\n"))
    type-str)
  (define string-list (hash-map id-map print-helper))

  (define printer-functor
    (cond
      [(equal? target 'hvx) hvx:hydride-printer]
      [(equal? target 'visa) visa:hydride-printer]
      [(equal? target 'arm) arm:hydride-printer]
      [(equal? target 'aie) aie:hydride-printer]
      [(equal? target 'x86) hydride:hydride-printer]))
  (define hydride-str (printer-functor hydride-expr))

  (string-append (apply string-append string-list) "\n" hydride-str "\n"))

;; Invoke the hydride code-generator passes to translate
;; a hydride-expression (written to a text-file) into
;; LLVM-IR.
(define (invoke-code-generator hydride-file bitcode-file)
  (define CODE-GEN-PATH (string-append HYDRIDE_SRC "/code-generator/"))
  (define CODE-GEN-SCRIPT
    (string-append CODE-GEN-PATH "/tools/low-level-codegen/RoseLowLevelCodeGen.py"))
  (define CMD (string-append PYTHON " " CODE-GEN-SCRIPT " " hydride-file " " bitcode-file))
  (debug-log CMD)
  ; (system CMD)
  )

(define (save-simplified-expr output-expr input-sizes input-precs function-name file-name)

  ;; Construct an id-map to print out buffer information
  ;; Using halide-buffer object currently to represent buffers

  (define id-map (make-hash))

  (for/list ([i (range (length input-sizes))])
    (define size-i (list-ref input-sizes i))
    (define prec-i (list-ref input-precs i))

    (define buf (halide:create-buffer (bv 0 size-i) (halide:size-to-elemT-signed prec-i #t)))

    (hash-set! id-map buf (bv i (bitvector 8))))

  ;(dump-synth-res-with-typeinfo output-expr id-map)
  (compile-to-llvm output-expr id-map function-name file-name))

;; Translate the synthesized hydride-expr in Rosette into LLVM
;; IR so that it may be linked into methods which invoke-it.
(define (compile-to-llvm hydride-expr id-map method-name bitcode-path)

  ;; Dump the method to a temporary text file
  (define serialized-method
    (string-append "; " method-name "\n" (hydride-to-str hydride-expr id-map)))

  (define dump_file_name (string-append "/tmp/" method-name ".rkt"))

  (write-str-to-file serialized-method dump_file_name)

  (if (file-exists? (string-append "/tmp/" bitcode-path ".rkt"))
      '()
      (write-str-to-file "" (string-append "/tmp/" bitcode-path ".rkt")))

  (define collect_file_name (string-append "/tmp/" bitcode-path ".rkt"))
  (append-str-to-file serialized-method collect_file_name)
  ;(invoke-code-generator dump_file_name bitcode-path)
  )
