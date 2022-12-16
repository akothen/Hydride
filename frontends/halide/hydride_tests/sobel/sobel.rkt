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
(define-symbolic reg_20_bitvector (bitvector 512))
(define reg_20 (halide:create-buffer reg_20_bitvector 'uint16))
(define-symbolic reg_5_bitvector (bitvector 512))
(define reg_5 (halide:create-buffer reg_5_bitvector 'uint16))
(define-symbolic reg_2_bitvector (bitvector 512))
(define reg_2 (halide:create-buffer reg_2_bitvector 'uint16))
(define-symbolic reg_21_bitvector (bitvector 512))
(define reg_21 (halide:create-buffer reg_21_bitvector 'uint16))
(define-symbolic reg_9_bitvector (bitvector 512))
(define reg_9 (halide:create-buffer reg_9_bitvector 'uint16))
(define-symbolic reg_1_bitvector (bitvector 512))
(define reg_1 (halide:create-buffer reg_1_bitvector 'uint16))
(define-symbolic reg_10_bitvector (bitvector 512))
(define reg_10 (halide:create-buffer reg_10_bitvector 'uint16))
(define-symbolic reg_6_bitvector (bitvector 512))
(define reg_6 (halide:create-buffer reg_6_bitvector 'uint16))
(define-symbolic reg_12_bitvector (bitvector 512))
(define reg_12 (halide:create-buffer reg_12_bitvector 'uint16))
(define-symbolic reg_11_bitvector (bitvector 512))
(define reg_11 (halide:create-buffer reg_11_bitvector 'uint16))
(define-symbolic reg_18_bitvector (bitvector 32))
(define reg_18 (halide:create-buffer reg_18_bitvector 'int32))
(define-symbolic reg_4_bitvector (bitvector 32))
(define reg_4 (halide:create-buffer reg_4_bitvector 'int32))
(define-symbolic reg_17_bitvector (bitvector 32))
(define reg_17 (halide:create-buffer reg_17_bitvector 'int32))
(define-symbolic reg_0_bitvector (bitvector 32))
(define reg_0 (halide:create-buffer reg_0_bitvector 'int32))
(define-symbolic reg_3_bitvector (bitvector 512))
(define reg_3 (halide:create-buffer reg_3_bitvector 'uint16))
(define-symbolic reg_8_bitvector (bitvector 32))
(define reg_8 (halide:create-buffer reg_8_bitvector 'int32))
(define-symbolic reg_16_bitvector (bitvector 32))
(define reg_16 (halide:create-buffer reg_16_bitvector 'int32))
(define-symbolic reg_7_bitvector (bitvector 512))
(define reg_7 (halide:create-buffer reg_7_bitvector 'uint16))
(define-symbolic reg_15_bitvector (bitvector 32))
(define reg_15 (halide:create-buffer reg_15_bitvector 'int32))
(define-symbolic reg_14_bitvector (bitvector 32))
(define reg_14 (halide:create-buffer reg_14_bitvector 'int32))
(define-symbolic reg_19_bitvector (bitvector 32))
(define reg_19 (halide:create-buffer reg_19_bitvector 'int32))
(define-symbolic reg_13_bitvector (bitvector 32))
(define reg_13 (halide:create-buffer reg_13_bitvector 'int32))

(define sym_env (vector reg_20 reg_5 reg_2 reg_21 reg_9 reg_1 reg_10 reg_6 reg_12 reg_11 ))
(define-symbolic-buffer input uint16_t)

(define-symbolic output.s0.x.x integer?)
(define-symbolic t97 integer?)
(define-symbolic t91 integer?)
(define-symbolic t86 integer?)

(define input.stride.1 (var-lookup 'input.stride.1 reg_13))
(define t68 (var-lookup 't68 reg_14))
(define t76 (var-lookup 't76 (sca-add  reg_15  reg_16)))
(define t42 (var-lookup 't42 (sca-add  (sca-mul  reg_17  32)  reg_18)))
(define t44 reg_20)
(define t46 reg_21)
(define t62 (var-lookup 't62 (sca-sub reg_8 reg_19)))
(define t63 (var-lookup 't63 (sca-add reg_19 reg_8)))

(define halide-expr 
 (vec-min
  (vec-add
   (vec-absd
    (vec-add
     (vec-add
      reg_1
      (vec-shl
       reg_2
       (x32  (bv 1 16))))
     reg_3)
    (vec-add
     (vec-add
      reg_5
      (vec-shl
       reg_6
       (x32  (bv 1 16))))
     reg_7))
   (vec-absd
    (vec-add
     (vec-add
      reg_9
reg_3)
reg_7)
    (vec-add
     (vec-shl
      reg_10
      (x32  (bv 1 16)))
     (vec-add
      reg_11
      reg_12))))
  (x32  (bv 255 16)))
)
(clear-vc!)
(define synth-res (synthesize-halide-expr halide-expr 2 32 ))
(pretty-print synth-res)
