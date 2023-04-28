#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_5_tensor (bv 0 (bitvector 256)))
(define reg_5 (arith:create-tensor reg_5_tensor (vector 8) (vector 0) 'int32))
(define reg_4_tensor (bv 0 (bitvector 256)))
(define reg_4 (arith:create-tensor reg_4_tensor (vector 8) (vector 0) 'int32))
(define reg_3_tensor (bv 0 (bitvector 256)))
(define reg_3 (arith:create-tensor reg_3_tensor (vector 8) (vector 0) 'int32))
(define reg_0_tensor (bv 0 (bitvector 256)))
(define reg_0 (arith:create-tensor reg_0_tensor (vector 8) (vector 0) 'int32))
(define reg_2_tensor (bv 0 (bitvector 256)))
(define reg_2 (arith:create-tensor reg_2_tensor (vector 8) (vector 0) 'int32))
(define reg_1_tensor (bv 0 (bitvector 256)))
(define reg_1 (arith:create-tensor reg_1_tensor (vector 8) (vector 0) 'int32))
(define reg_6_tensor (bv 0 (bitvector 256)))
(define reg_6 (arith:create-tensor reg_6_tensor (vector 8) (vector 0) 'int32))
(define reg_7_tensor (bv 0 (bitvector 256)))
(define reg_7 (arith:create-tensor reg_7_tensor (vector 8) (vector 0) 'int32))
(define reg_8_tensor (bv 0 (bitvector 256)))
(define reg_8 (arith:create-tensor reg_8_tensor (vector 8) (vector 0) 'int32))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_5 (bv 5 (bitvector 8)))
(hash-set! id-map reg_4 (bv 4 (bitvector 8)))
(hash-set! id-map reg_3 (bv 3 (bitvector 8)))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))
(hash-set! id-map reg_2 (bv 2 (bitvector 8)))
(hash-set! id-map reg_1 (bv 1 (bitvector 8)))
(hash-set! id-map reg_6 (bv 6 (bitvector 8)))
(hash-set! id-map reg_7 (bv 7 (bitvector 8)))
(hash-set! id-map reg_8 (bv 8 (bitvector 8)))


(define mlir-expr 
(arith:tensor-add (arith:tensor-add (arith:tensor-add (arith:tensor-add reg_0 (arith:tensor-mul reg_1 reg_2)) (arith:tensor-mul reg_3 reg_4)) (arith:tensor-mul reg_5 reg_6)) (arith:tensor-mul reg_7 reg_8))
)

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 2 0 'z3 #t #f  "hydride_hash_2.rkt"  "synth_hash_2"  "x86"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.contraction_matmul.3" "contraction_matmul")
(save-synth-map "/tmp/hydride_hash_3.rkt" "synth_hash_3" synth-log)