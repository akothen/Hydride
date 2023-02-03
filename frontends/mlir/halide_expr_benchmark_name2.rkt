#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 
(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define reg_0_bitvector (bv 0 (bitvector 128)))
(define reg_0 (mlir:create-buffer reg_0_bitvector int32))

; Creating a map between buffers and halide call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))


(define (conv_1d_nwc_wcf_mixed_type_memref reg_0 )
 reg_0

)
