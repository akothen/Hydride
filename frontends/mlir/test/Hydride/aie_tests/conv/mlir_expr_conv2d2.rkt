#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_1_tensor (bv 0 (bitvector 256)))
(define reg_1 (arith:create-tensor reg_1_tensor (vector 8) (vector 0) 'int32 1))
(define reg_0_tensor (bv 0 (bitvector 256)))
(define reg_0 (arith:create-tensor reg_0_tensor (vector 8) (vector 0) 'int32 0))
(define reg_2_tensor (bv 0 (bitvector 256)))
(define reg_2 (arith:create-tensor reg_2_tensor (vector 8) (vector 0) 'int32 2))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_1 (bv 1 (bitvector 8)))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))
(hash-set! id-map reg_2 (bv 2 (bitvector 8)))


(define mlir-expr 
(arith:tensor-add reg_0 (arith:tensor-mul reg_1 reg_2))
)

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 2 0 'z3 #t #f  "hydride_hash_1.rkt"  "synth_hash_1"  "aie"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.conv2d.2" "conv2d")
(save-synth-map "/tmp/hydride_hash_2.rkt" "synth_hash_2" synth-log)