#lang rosette
                             (require rosette/lib/synthax)
                             (require rosette/lib/angelic)
                             (require racket/pretty)
                             (require data/bit-vector)
                             (require rosette/lib/destruct)
                             (require rosette/solver/smt/boolector)
                             (require hydride)
 

                             ;; Uncomment the line below to enable verbose logging
                             ;(enable-debug)

(current-bitwidth 16)
(custodian-limit-memory (current-custodian) (* 20000 1024 1024))
(define-symbolic reg_4_bitvector (bitvector 16))
(define reg_4 (halide:create-buffer reg_4_bitvector 'uint16))
(define-symbolic reg_5_bitvector (bitvector 512))
(define reg_5 (halide:create-buffer reg_5_bitvector 'uint16))
(define-symbolic reg_7_bitvector (bitvector 512))
(define reg_7 (halide:create-buffer reg_7_bitvector 'uint16))
(define-symbolic reg_9_bitvector (bitvector 512))
(define reg_9 (halide:create-buffer reg_9_bitvector 'uint16))
(define-symbolic reg_2_bitvector (bitvector 512))
(define reg_2 (halide:create-buffer reg_2_bitvector 'uint16))
(define-symbolic reg_3_bitvector (bitvector 512))
(define reg_3 (halide:create-buffer reg_3_bitvector 'uint16))
(define-symbolic reg_8_bitvector (bitvector 16))
(define reg_8 (halide:create-buffer reg_8_bitvector 'uint16))
(define-symbolic reg_10_bitvector (bitvector 16))
(define reg_10 (halide:create-buffer reg_10_bitvector 'uint16))
(define-symbolic reg_6_bitvector (bitvector 16))
(define reg_6 (halide:create-buffer reg_6_bitvector 'uint16))
(define-symbolic reg_1_bitvector (bitvector 32))
(define reg_1 (halide:create-buffer reg_1_bitvector 'int32))
(define-symbolic reg_0_bitvector (bitvector 32))
(define reg_0 (halide:create-buffer reg_0_bitvector 'int32))

; Creating a map between buffers and halide call node arguments
(define id-map (make-hash))
(hash-set! id-map reg_4 4)
(hash-set! id-map reg_5 5)
(hash-set! id-map reg_7 7)
(hash-set! id-map reg_9 9)
(hash-set! id-map reg_2 2)
(hash-set! id-map reg_3 3)
(hash-set! id-map reg_8 8)
(hash-set! id-map reg_10 10)
(hash-set! id-map reg_6 6)
(hash-set! id-map reg_1 1)
(hash-set! id-map reg_0 0)

(define halide-expr 
(vec-add
     (vec-add
      reg_2
      (vec-mul
       reg_3
       (x32 reg_4)))
     (vec-mul
      reg_5
      (x32 reg_6)))
)

(clear-vc!)
;(define synth-res (synthesize-halide-expr halide-expr id-map 1 32 ))
;(dump-synth-res-with-typeinfo synth-res id-map)
(define addend (create-splat 32 32 16))

(displayln "Tensor 1")
(define t1 (create-tensor 1 32 16))
(print-mat t1 1 32 16)


(displayln "Tensor 2")
(define t2 (bvadd t1 addend))
(print-mat t2 1 32 16)


(displayln "First Half Concat")
(define fhc (vector-two-input-swizzle t1 t2  32 16 0 32 16 1 0))
(print-mat fhc 1 32 16)


(displayln "Second Half Concat")
(define shc (vector-two-input-swizzle t1 t2  16 16 0 16 16 1 0))
(print-mat shc 1 32 16)


(displayln "Interleave Pattern First Half ")
(define interleave (vector-two-input-swizzle t1 t2  32 16 0 32 16 16 0))
(print-mat interleave 1 32 16)


(displayln "Interleave Pattern Second Half ")
(define interleave2 (vector-two-input-swizzle t1 t2  16 16 0 32 16 16 0))
(print-mat interleave2 1 32 16)

