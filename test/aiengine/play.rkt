#lang rosette

(require racket/pretty)
(require hydride/ir/hvx/semantics)
(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/cost_model)
(require hydride/ir/hvx/length)
(require hydride/ir/hvx/prec)
(require hydride/ir/hvx/printer)
(require hydride/ir/hvx/interpreter)
(require hydride/ir/hvx/binder)
(require hydride/ir/hvx/const_fold)
(require hydride/ir/hvx/visitor)
(require hydride/ir/hvx/scale)
(require hydride/ir/hvx/get_ops)
(require hydride/ir/hvx/get_name)
(require hydride/ir/hvx/sub_expr)
(require hydride/ir/hvx/extract)
(require hydride/ir/hvx/instcombine_fast)
(require hydride/ir/hvx/get_variants)

(define xbuff_32_32 (bv #xb371140c83b58296bdc2ac931078493cd82153f0350cd474f058fdd6dc9c32a5809e8a9901c684dd2d19fe896a2d9cd31754a9f41d14f2e045b20129fc746b54c6e5bf88ef000b2394601a985a9756b66c1c7c75c360fe2910d7328d82b65170aa227a6875265ebb6a198047e2c95f84a790fb3ebb64c344696c846ac10273e6 1024))
(define ybuff_32_32 (bv #x72f7e4b8bfaff5a3b53f0e43a39a898f59ca7a0c7e87b07afe988aabdeef623507d41488c71c222c8446727eb2836417588dc93683abaf4d37d736d0c7709a27ac068bd0e97f5278bed3520ab0a770389512745ea27efc3fed968e4af73b821c29cb87311cc1585e6cb4a7141791a571e07582e573fa2b35b84409b78c28fbab 1024))

(define
    (shuffle_T8_64x2_lo v64int8_a v64int8_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 8))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 8 1)))
                            (define %a (extract  %high %low v64int8_a))
                            (define %b (extract  %high %low v64int8_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

(define
    (shuffle_T8_64x2_hi v64int8_a v64int8_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 8))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 8 1)))
                            (define %a (extract  %high %low v64int8_a))
                            (define %b (extract  %high %low v64int8_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)


(define
    (shuffle_T16_32x2_lo v32int16_a v32int16_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 16))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 16 1)))
                            (define %a (extract  %high %low v32int16_a))
                            (define %b (extract  %high %low v32int16_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

(define
    (shuffle_T16_32x2_hi v32int16_a v32int16_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 16))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 16 1)))
                            (define %a (extract  %high %low v32int16_a))
                            (define %b (extract  %high %low v32int16_b))
                            (concat %b %a)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)


(define Rt_int (bitvector->integer (bv #xfffffffc 32)))
(define %elem_size (* (- 0 Rt_int) 2))


(define xbuff_64_8 (bv #x45a0d919bc9d4bdbd8637303e721d570d0b2d5f8e42ba6fd16ddbf52b6b0542ebdc759304154e6e7d373322428835cc7a8f52d42a4ca6bf04d0eda561598c273 512))
(define ybuff_64_8 (bv #x1249fa9a217c482218ff269eeec77185a6df74e05f9e7d35c5bdca571d748398f2a01bb768f1d7f3b29fa03db08315f8dd5ee30e6a631f1962a68be5eb53365d 512))

(pretty-print (shuffle_T8_64x2_lo xbuff_64_8 ybuff_64_8))
(pretty-print (shuffle_T8_64x2_hi xbuff_64_8 ybuff_64_8))
(pretty-print (shuffle_T16_32x2_lo xbuff_64_8 ybuff_64_8))
(pretty-print (shuffle_T16_32x2_hi xbuff_64_8 ybuff_64_8))
;; (pretty-print Rt_int)
;; (pretty-print %elem_size)
;; 
;; (pretty-print (hexagon_V6_vdealvdd_128B xbuff_32_32 ybuff_32_32 (bv #xfffffffe 32) 2048  2048  0  512  0  512  0  512  0  512  8  2  2  2  2  0))
;; (pretty-print (hexagon_V6_vshuffvdd_128B xbuff_32_32 ybuff_32_32 (bv #xfffffffe 32) 2048 2048 0 1024 8 0 ))