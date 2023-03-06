#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_2_tensor (bv 0 (bitvector 768)))
(define reg_2 (arith:create-tensor reg_2_tensor (vector 3 2 4) (shape 0 1 2) 'int32))
(define reg_0_tensor (bv 0 (bitvector 1536)))
(define reg_0 (arith:create-tensor reg_0_tensor (vector 3 4 4) (shape 0 1 2) 'int32))
(define reg_1_tensor (bv 0 (bitvector 256)))
(define reg_1 (arith:create-tensor reg_1_tensor (vector 2 4) (shape 0 1) 'int32))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_2 (bv 2 (bitvector 8)))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))
(hash-set! id-map reg_1 (bv 1 (bitvector 8)))


(define mlir-expr 
(arith:tensor-add (arith:tensor-mul (vector:extract_strided_slice reg_0 (vector 0 2 0) (vector 3 2 4) (vector 1 1 1) ) (vector:tensor-broadcast (3 (vector:extract reg_1 (vector 1))) )) (arith:tensor-add (arith:tensor-mul (vector:extract_strided_slice reg_0 (vector 0 0 0) (vector 3 2 4) (vector 1 1 1) ) (vector:tensor-broadcast (3 (vector:extract reg_1 (vector 0))) )) reg_2)
)

)

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 2 0 'z3 #t #f  "hydride_hash_0.rkt"  "synth_hash_0"  "X86"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.benchmark.1" "benchmark")
(save-synth-map "/tmp/hydride_hash_1.rkt" "synth_hash_1" synth-log)