#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm512_maskz_abs_epi16  k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (integer->bitvector (abs (bitvector->integer %3)) (bitvector %elemsize)))
   %4
   )
   (begin
   %arg0
   )
  )
 )
 )
)
)
)

(define (_mm512_mul_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %5 (extract  %2 %0.new0 b))
  (define %6 (zero-extend  %3 (bitvector %arg0)))
  (define %7 (zero-extend  %5 (bitvector %arg0)))
  (define %8 (bvmul  %6  %7))
  %8
 )
 )
)
)
)

(define-symbolic k_1 (bitvector 32))
(define-symbolic a_1 (bitvector 512))
(define %vectsize_1 512)
(define %lanesize1_1 512)
(define %lanesize2_1 512)
(define %elemsize_1 16)
(define %laneoffset_1 0)
(define %arg0_1 (bv #x0000000000000000 16))

(verify (assert (equal? (_mm512_maskz_abs_epi16 k_1 a_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 ) (_mm512_mul_epu32 k_1 a_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 ))))

(define-symbolic a_2 (bitvector 512))
(define-symbolic b_2 (bitvector 512))
(define %vectsize_2 512)
(define %lanesize1_2 512)
(define %lanesize2_2 256)
(define %elemsize_2 32)
(define %laneoffset_2 0)
(define %arg0_2 64)

(verify (assert (equal? (_mm512_maskz_abs_epi16 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 ) (_mm512_mul_epu32 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 ))))