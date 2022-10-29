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
(require hydride/ir/hydride/interpreter)
(require hydride/halide)
(require hydride/synthesis/python)
(require hydride/synthesis/algorithm)
(require hydride/ir/hydride/printer)


(provide (all-defined-out))


;; Convert hydride expression with into string
;; with type information for inputs and intermediate
;; expressions.
(define (hydride-to-str hydride-expr id-map)
  (define (print-helper k v)
   (define type-str  
     (string-append "; (reg " (~s  (bitvector->natural v)) ") " (halide:print-buffer-type-info k) "\n")
     )
   type-str
   )
  (define string-list (hash-map id-map print-helper))
  (define hydride-str (hydride-printer hydride-expr))

  (string-append (apply string-append string-list) "\n" hydride-str "\n")
  )



;; Invoke the hydride code-generator passes to translate
;; a hydride-expression (written to a text-file) into
;; LLVM-IR.
(define (invoke-code-generator hydride-file bitcode-file)
  (define CODE-GEN-PATH (string-append HYDRIDE_SRC "/code-generator/"))
  (define CODE-GEN-SCRIPT (string-append CODE-GEN-PATH "/tools/low-level-codegen/RoseLowLevelCodeGen.py"))
  (define CMD (string-append PYTHON " " CODE-GEN-SCRIPT " " hydride-file " " bitcode-file))
  (debug-log CMD)
  ; (system CMD)
  
  )


;; Translate the synthesized hydride-expr in Rosette into LLVM
;; IR so that it may be linked into methods which invoke-it.
(define (compile-to-llvm hydride-expr id-map method-name bitcode-path)

  ;; Dump the method to a temporary text file
  (define serialized-method
    (string-append 
      "; " method-name "\n" (hydride-to-str hydride-expr id-map)
      )
    )

  (define dump_file_name (string-append "/tmp/" method-name ".rkt"))

  (write-str-to-file serialized-method dump_file_name)
  (append-str-to-file serialized-method "/tmp/hydride_exprs.rkt")
  (invoke-code-generator dump_file_name bitcode-path)
  
  )


