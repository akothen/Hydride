#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)
(require hydride)


;; Uncomment the line below to enable verbose logging
(enable-debug)


(define (widening-add a b signed?)
  (define sizeext 
    (cond
      [signed? sign-extend]
      [else zero-extend]
      )
    )

  (define wide-a (sizeext a (bitvector (* 2 (bvlength a)))))
  (define wide-b (sizeext b (bitvector (* 2 (bvlength b)))))

  (bvadd wide-a wide-b)
  )


(define (widening-mul a b signed?)
  (define sizeext 
    (cond
      [signed? sign-extend]
      [else zero-extend]
      )
    )

  (define wide-a (sizeext a (bitvector (* 2 (bvlength a)))))
  (define wide-b (sizeext b (bitvector (* 2 (bvlength b)))))

  (bvmul wide-a wide-b)
  )

;; https://halide-lang.org/docs/namespace_halide_1_1_internal.html#a3d761851379580a9605f799491f933f7
;Compute saturating_narrow(widening_add(a, (1 << max(b, 0)) / 2) >> b).
(define (rounding-shift-right a b signed?)
  (define size (bvlength a))
  (define widened-size (* 2 size))

  (define-values (max-op sat-op shift-left shift-right div-op sizeext)
    (cond
      [signed? (values bvsmax bvssat bvshl bvashr bvsdiv sign-extend)]
      [else (values bvumax bvusat bvshl bvlshr bvudiv zero-extend)]
      )
    )

  ;(1 << max(b, 0))
  (define one-shifted (shift-left (bv 1 (bitvector size))  (max-op b (bv 0 (bitvector size)))))
  
  ;(1 << max(b, 0)) / 2)
  (define div-2 (div-op one-shifted (bv 2 (bitvector size))))


  ; widening_add(a, (1 << max(b, 0)) / 2)
  (define widened-add (widening-add a div-2 signed?))


  ; widening_add(a, (1 << max(b, 0)) / 2) >> b
  (define right-shift-b (shift-right widened-add (sizeext b (bitvector widened-size))))

  ;; Saturate narrow
  (define sat-res (sat-op right-shift-b widened-size size))


  sat-res
  
  )



; Compute saturating_narrow(rounding_shift_right(widening_mul(a, b), q))
(define (rounding-mul-shift-right a b c signed?)
  (define size (bvlength a))
  (define widened-size (* 2 size))

  (define-values (max-op sat-op shift-left shift-right div-op sizeext)
    (cond
      [signed? (values bvsmax bvssat bvshl bvashr bvsdiv sign-extend)]
      [else (values bvumax bvusat bvshl bvlshr bvudiv zero-extend)]
      )
    )

    ;  widening_mul(a, b)
    (define wide-ab (widening-mul a b signed?))

    ; rounding_shift_right(widening_mul(a, b), q)
    (define rnd-shift-right (rounding-shift-right wide-ab (sizeext c (bitvector widened-size)) signed?))

    ; saturating narrow
    (define sat-res (sat-op rnd-shift-right widened-size size))
    sat-res
  )


(define v1 (bv 2147483640 (bitvector 32)))
(define v2 (bv 256 (bitvector 32)))


(set! v1 (?? (bitvector 32)))
(set! v2 (?? (bitvector 32)))





 ;(model
 ;[??:test_equiv:109:10 (bv #xfd29f4a3 32)]
 ;[??:test_equiv:110:10 (bv #xd505a7f4 32)]) 

;(set! v1 (bv #xfd29f4a3 32))
;(set! v2 (bv #xd505a7f4 32))


(define v3 (bv 31 (bitvector 32)))

(rounding-mul-shift-right v1 v2 v3 #t)


;; Wrapper generating a 1024 bit vector
(define (rounding-mul-shift-right-vector v1 v2 v3 signed?)
  (apply concat
         (for/list ([i (range 32)])
                (rounding-mul-shift-right v1 v2 v3 signed?)
                   )
         )

  )

;; Halide maps this to 
;; https://github.com/halide/Halide/blob/df354c588701fc2f308a952817655e60d50d0f42/src/HexagonOptimize.cpp#L932
;; {"halide.hexagon.trunc_satdw_mpy2_rnd.vw.vw", rounding_mul_shift_right(wild_i32x, wild_i32x, 31)}
;; define weak_odr <32 x i32> @halide.hexagon.trunc_satdw_mpy2_rnd.vw.vw(<32 x i32> %a, <32 x i32> %b) nounwind uwtable readnone alwaysinline {
;;  %ab1 = call <32 x i32> @llvm.hexagon.V6.vmpyewuh.128B(<32 x i32> %a, <32 x i32> %b)
;;  %ab = call <32 x i32> @llvm.hexagon.V6.vmpyowh.rnd.sacc.128B(<32 x i32> %ab1, <32 x i32> %a, <32 x i32> %b)
;;  ret <32 x i32> %ab
;; }

;; This is specialized for when v3 = 31 32-bits
(define (halide-sol v1 v2 )

  (define v1-splat (create-splat-bv v1 32))
  (define v2-splat (create-splat-bv v2 32))

  (define ab1 (hexagon_V6_vmpyewuh_128B (bv #x0000000000000000000000000000000000000000000000000000000000000010 64) v1-splat v2-splat 1024 1024 0 512 16 32 1 1 64 1 0))

  (define ab (hexagon_V6_vmpyowh_rnd_sacc_128B (bv #x000000000000000000000000000000000000000000000000000000000000000e 64) (bv #x0000000000000000000000000000000000000000000000000000000000000001 64)  (bv #x0000000000000000000000000000000000000000000000000000000000000001 64) ab1 v1-splat v2-splat 1024 1024 0 512 16 32 1 1 -1 -1 1 64 1 64 1 16 0))

  ab
  
  
  )


(define input-result (rounding-mul-shift-right-vector v1 v2 v3 #t))
(define halide-result (halide-sol v1 v2))

(displayln "Input-result")
(print-mat input-result 1 32 32)


(displayln "Halide-result")
(print-mat halide-result 1 32 32)

(printf "Are results equal?:\t ~a\n" (equal? input-result halide-result))

(define cex 
  (verify
    (assert (equal? halide-result input-result))
    )
  )

(println cex)
