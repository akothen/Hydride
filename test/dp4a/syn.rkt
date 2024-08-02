#lang rosette
 (require rosette/lib/synthax)
 (require rosette/lib/angelic)
 (require racket/pretty)
 (require data/bit-vector)
 (require rosette/lib/destruct)
 (require rosette/solver/smt/boolector)
 (require hydride)
 (enable-debug)

(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_0_tensor (bv 0 (bitvector 512)))
(define reg_0 (arith:create-tensor reg_0_tensor (vector 16) (vector 0) 'int32 0))
(define reg_1_tensor (bv 0 (bitvector 512)))
(define reg_1 (arith:create-tensor reg_1_tensor (vector 64) (vector 0) 'int8 1))
(define reg_2_tensor (bv 0 (bitvector 512)))
(define reg_2 (arith:create-tensor reg_2_tensor (vector 64) (vector 0) 'int8 2))

; Creating a map between buffers and mlir call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))
(hash-set! id-map reg_1 (bv 1 (bitvector 8)))
(hash-set! id-map reg_2 (bv 2 (bitvector 8)))


(define mlir-expr 
(arith:tensor-add 
    (arith:tensor-add 
        (arith:tensor-add 
            (arith:tensor-add 
                reg_0 
                (arith:tensor-mul 
                    (arith:cast-int (vector:extract_strided_slice reg_1 (vector 0) (vector 16) (vector 4)) 16 32)
                    (arith:cast-int (vector:extract_strided_slice reg_2 (vector 0) (vector 16) (vector 4)) 16 32)))
            (arith:tensor-mul
                (arith:cast-int (vector:extract_strided_slice reg_1 (vector 1) (vector 16) (vector 4) )16 32)
                (arith:cast-int (vector:extract_strided_slice reg_2 (vector 1) (vector 16) (vector 4) )16 32)))
        (arith:tensor-mul
            (arith:cast-int (vector:extract_strided_slice reg_1 (vector 2) (vector 16) (vector 4) )16 32)
            (arith:cast-int (vector:extract_strided_slice reg_2 (vector 2) (vector 16) (vector 4) )16 32)))
    (arith:tensor-mul
        (arith:cast-int (vector:extract_strided_slice reg_1 (vector 3) (vector 16) (vector 4) )16 32)
        (arith:cast-int (vector:extract_strided_slice reg_2 (vector 3) (vector 16) (vector 4) )16 32)))
  )

(clear-vc!)
(define synth-res (synthesize-mlir-expr mlir-expr id-map 9 16 'z3 #t #f  ""  ""  "visa"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res id-map "hydride.node.qfc.0" "qfc")
(save-synth-map "/tmp/hydride_hash_0.rkt" "synth_hash_0" synth-log)