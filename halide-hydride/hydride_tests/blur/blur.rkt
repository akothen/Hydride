#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require racket/runtime-path)
(require hydride)

(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))

(define-symbolic reg_3_bitvector (bitvector 512))
(define reg_3 (halide:create-buffer reg_3_bitvector 'int16))
(define-symbolic reg_5_bitvector (bitvector 512))
(define reg_5 (halide:create-buffer reg_5_bitvector 'int16))
(define-symbolic reg_4_bitvector (bitvector 512))
(define reg_4 (halide:create-buffer reg_4_bitvector 'int16))
(define reg_7_bitvector (create-splat 3 (/ 512 16) 16))
(define reg_7 (x32 (bv 3 16)));;(halide:create-buffer reg_7_bitvector 'int16))



(define halide-expr 
  (vec-div
    (vec-add
      reg_3
      (vec-add
        reg_4
        reg_5))
    reg_7
    )
  )

(pretty-print halide-expr)


(define start (current-seconds))

;; Tree walker which captures sub-trees of depth expr-depth (parameteriazable)
(define expr-depth 2)

;; Main Synthesis method
(define synth-res (synthesize-halide-expr halide-expr expr-depth 32))



(define end (current-seconds))

(define elapsed (- end start))

(displayln "Full Synthesis completed:\n")
(pretty-print halide-expr)
(displayln "translated into:\n")
(pretty-print synth-res)

(printf "\nIn ~a seconds ...\n" elapsed)
