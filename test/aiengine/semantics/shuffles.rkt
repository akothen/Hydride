#lang rosette

(require racket/pretty)

;; Forward Ops

;; Transpose 64x2 matrix of 8 bit values. Extract low 512 bits of result. 
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
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 64x2 matrix of 8 bit values. Extract high 512 bits of result. 
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
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 32x2 matrix of 16 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T16_32x2_lo v32int8_a v32int8_b)
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
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 32x2 matrix of 16 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T16_32x2_hi v32int8_a v32int8_b)
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
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 16x2 matrix of 32 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T32_16x2_lo v16int32_a v16int32_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 32))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 32 1)))
                            (define %a (extract  %high %low v16int32_a))
                            (define %b (extract  %high %low v16int32_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 16x2 matrix of 32 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T32_16x2_hi v16int32_a v16int32_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 32))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 32 1)))
                            (define %a (extract  %high %low v16int32_a))
                            (define %b (extract  %high %low v16int32_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 8x2 matrix of 64 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T64_8x2_lo v8int64_a v8int64_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 64))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 64 1)))
                            (define %a (extract  %high %low v8int64_a))
                            (define %b (extract  %high %low v8int64_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 8x2 matrix of 64 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T64_8x2_hi v8int64_a v8int64_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 64))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 64 1)))
                            (define %a (extract  %high %low v8int64_a))
                            (define %b (extract  %high %low v8int64_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 4x2 matrix of 128 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T128_4x2_lo v4int128_a v4int128_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 128))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 128 1)))
                            (define %a (extract  %high %low v4int128_a))
                            (define %b (extract  %high %low v4int128_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 4x2 matrix of 128 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T128_4x2_hi v4int128_a v4int128_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 128))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 128 1)))
                            (define %a (extract  %high %low v4int128_a))
                            (define %b (extract  %high %low v4int128_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 2x2 matrix of 256 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T256_2x2_lo v2int256_a v2int256_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 256))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 256 1)))
                            (define %a (extract  %high %low v2int256_a))
                            (define %b (extract  %high %low v2int256_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 2x2 matrix of 256 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T256_2x2_hi v2int256_a v2int256_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 256))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 256 1)))
                            (define %a (extract  %high %low v2int256_a))
                            (define %b (extract  %high %low v2int256_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 1x2 matrix of 512 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T512_1x2_lo v1int512_a v1int512_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 512))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 512 1)))
                            (define %a (extract  %high %low v1int512_a))
                            (define %b (extract  %high %low v1int512_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 1x2 matrix of 512 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T512_1x2_hi v1int512_a v1int512_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 512 512))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 512 1)))
                            (define %a (extract  %high %low v1int512_a))
                            (define %b (extract  %high %low v1int512_b))
                            (concat %a %b)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 16x4 matrix of 16 bit values. Extract low 512 bits of result. 
(define
    (shuffle_T16_16x4_lo v16int16_a v16int16_b v16int16_c v16int16_d)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 256 16))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 16 1)))
                            (define %a (extract  %high %low v16int16_a))
                            (define %b (extract  %high %low v16int16_b))
                            (define %c (extract  %high %low v16int16_c))
                            (define %d (extract  %high %low v16int16_d))
                            (concat %a %b %c %d)
                            )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 16x4 matrix of 16 bit values. Extract high 512 bits of result. 
(define
    (shuffle_T16_16x4_hi v16int16_a v16int16_b v16int16_c v16int16_d)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 256 16))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 16 1)))
                            (define %a (extract  %high %low v16int16_a))
                            (define %b (extract  %high %low v16int16_b))
                            (define %c (extract  %high %low v16int16_c))
                            (define %d (extract  %high %low v16int16_d))
                            (concat %a %b %c %d)
                            )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)

;; Transpose 8x4 matrix of 16 bit values. Extract final 512 bits of result. 
(define
    (shuffle_T16_8x4 v8int16_a v8int16_b v8int16_c v8int16_d)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 512 512))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 128 16))])
                            (define %low %inner.it)
                            (define %high (+ %inner.it (- 16 1)))
                            (define %a (extract  %high %low v8int16_a))
                            (define %b (extract  %high %low v8int16_b))
                            (define %c (extract  %high %low v8int16_c))
                            (define %d (extract  %high %low v8int16_d))
                            (concat %a %b %c %d)
                            )
                  )
                )
      )
    )
    out_vec 
)


;; Backward Ops

;; Transpose 2x32 matrix of 16 bit values. Extract high 512 bits of result.
(define
    (shuffle_T16_2x32_lo v32int16_a v32int16_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%inner.it.0 (reverse (range 0 256 16))])
                              (define %low.0 (+ 16 (* 2 %inner.it.0)))
                              (define %high.0 (+ %low.0 (- 16 1)))
                              (define %ext.v32int16_a.0 (extract  %high.0 %low.0 v32int16_a))
                              %ext.v32int16_a.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.1 (reverse (range 0 256 16))])
                              (define %low.1 (+ 16 (* 2 %inner.it.1)))
                              (define %high.1 (+ %low.1 (- 16 1)))
                              (define %ext.v32int16_b.0 (extract  %high.1 %low.1 v32int16_b))
                              %ext.v32int16_b.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.2 (reverse (range 0 256 16))])
                              (define %low.2 (* 2 %inner.it.2))
                              (define %high.2 (+ %low.2 (- 16 1)))
                              (define %ext.v32int16_a.1 (extract  %high.2 %low.2 v32int16_a))
                              %ext.v32int16_a.1
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.3 (reverse (range 0 256 16))])
                              (define %low.3 (* 2 %inner.it.3))
                              (define %high.3 (+ %low.3 (- 16 1)))
                              (define %ext.v32int16_b.1 (extract  %high.3 %low.3 v32int16_b))
                              %ext.v32int16_b.1
                              )
                    )
                  )
                )
      )
    )
   (extract (- 512 1) 0 out_vec) 
)

;; Transpose 2x32 matrix of 16 bit values. Extract high 512 bits of result.
(define
    (shuffle_T16_2x32_hi v32int16_a v32int16_b)
    (define out_vec
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%inner.it.0 (reverse (range 0 256 16))])
                              (define %low.0 (+ 16 (* 2 %inner.it.0)))
                              (define %high.0 (+ %low.0 (- 16 1)))
                              (define %ext.v32int16_a.0 (extract  %high.0 %low.0 v32int16_a))
                              %ext.v32int16_a.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.1 (reverse (range 0 256 16))])
                              (define %low.1 (+ 16 (* 2 %inner.it.1)))
                              (define %high.1 (+ %low.1 (- 16 1)))
                              (define %ext.v32int16_b.0 (extract  %high.1 %low.1 v32int16_b))
                              %ext.v32int16_b.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.2 (reverse (range 0 256 16))])
                              (define %low.2 (* 2 %inner.it.2))
                              (define %high.2 (+ %low.2 (- 16 1)))
                              (define %ext.v32int16_a.1 (extract  %high.2 %low.2 v32int16_a))
                              %ext.v32int16_a.1
                              )
                    )
                  (apply
                    concat
                    (for/list ([%inner.it.3 (reverse (range 0 256 16))])
                              (define %low.3 (* 2 %inner.it.3))
                              (define %high.3 (+ %low.3 (- 16 1)))
                              (define %ext.v32int16_b.1 (extract  %high.3 %low.3 v32int16_b))
                              %ext.v32int16_b.1
                              )
                    )
                  )
                )
      )
    )
   (extract (- 1024 1) 512 out_vec) 
)