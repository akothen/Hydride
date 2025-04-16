#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)
(require errortrace)

;; Uncomment the line below to enable verbose logging
(enable-debug)

(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))

;; Create buffers with dimension information
(define reg_0_bitvector (bv 0 (bitvector 8192)))
(define reg_0 (halide:create-buffer reg_0_bitvector (vector 16 16) (vector 1 0) 'int32 0))
(define reg_1_bitvector (bv 0 (bitvector 8192)))
(define reg_1 (halide:create-buffer reg_1_bitvector (vector 16 64) (vector 1 0) 'int8 1))
(define reg_2_bitvector (bv 0 (bitvector 8192)))
(define reg_2 (halide:create-buffer reg_2_bitvector (vector 64 16) (vector 1 0) 'int8 2))

; Creating a map between buffers and halide call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_0 (bv 0 (bitvector 8)))
(hash-set! id-map reg_1 (bv 1 (bitvector 8)))
(hash-set! id-map reg_2 (bv 2 (bitvector 8)))

(define halide-expr (vec-tile_matmul 16 64 64 reg_0 reg_1 reg_2))

(clear-vc!)

;(set-iterative-optimize)

(define synth-res (synthesize-halide-expr halide-expr id-map 2 256 'z3 #t #f "" "" "x86"))
(dump-synth-res-with-typeinfo synth-res id-map)
; Translate synthesized hydride-expression into LLVM-IR
(compile-to-llvm synth-res
                 id-map
                 "hydride.node.batched_matmul_256_32bit_x86_depth2_muchen.0"
                 "batched_matmul_256_32bit_x86_depth2_muchen")
(save-synth-map "/tmp/hydride_hash_batched_matmul_256_32bit_x86_depth2_muchen_0.rkt"
                "synth_hash_batched_matmul_256_32bit_x86_depth2_muchen_0"
                synth-log)
