#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_0_tensor (bv 0 (bitvector 768)))
(define reg_0 (mlir:create-tensor reg_0_tensor (vector 3 2 4) (shape 0 1 2) 'int32))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))


(define mlir-expr 
(tensor-add (arith:tensor-mul (tensor-ext-stride a)
 (tensor-broadcast )
) (tensor-add (arith:tensor-mul (tensor-ext-stride a)
 (tensor-broadcast )
)  reg_0)
)


)

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 2 0 'z3 #t #f  "hydride_hash_0.rkt"  "synth_hash_0"  "X86"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.expr.1" "expr")
(save-synth-map "/tmp/hydride_hash_1.rkt" "synth_hash_1" synth-log)