#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_0_tensor (bv 0 (bitvector 1536)))
(define reg_0 (mlir:create-tensor reg_0_tensor (vector 2 3 8) (shape 0 1 2) 'int32))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))


(define mlir-expr 
(arith:tensor-add  reg_0 reg_0)

)

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 2 0 'z3 #t #f  ""  ""  "X86"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.expr.0" "expr")
(save-synth-map "/tmp/hydride_hash_0.rkt" "synth_hash_0" synth-log)