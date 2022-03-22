#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm256_maskz_madd52hi_epu64  k a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
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
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg0))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg3)))
   (define %9 (zero-extend  %6 (bitvector %arg3)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg0  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg1  1))
   (define %highidx0 (+  %lastidx1  %arg2))
   (define %15 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg0)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   %arg4
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_madd52hi_epu64  k a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
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
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg0))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg3)))
   (define %9 (zero-extend  %6 (bitvector %arg3)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg0  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg1  1))
   (define %highidx0 (+  %lastidx1  %arg2))
   (define %15 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg0)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   %arg4
   )
  )
 )
 )
)
)
)

(define-symbolic k_1 (bitvector 8))
(define-symbolic a_1 (bitvector 256))
(define-symbolic b_1 (bitvector 256))
(define-symbolic c_1 (bitvector 256))
(define %vectsize_1 256)
(define %lanesize1_1 256)
(define %lanesize2_1 208)
(define %elemsize_1 52)
(define %laneoffset_1 0)
(define %arg0_1 64)
(define %arg1_1 52)
(define %arg2_1 52)
(define %arg3_1 128)
(define %arg4_1 (bv #x0000000000000000000000000000000000000000000000000000000000000000 64))

(verify (assert (equal? (_mm256_maskz_madd52hi_epu64 k_1 a_1 b_1 c_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 %arg2_1 %arg3_1 %arg4_1 ) (_mm512_maskz_madd52hi_epu64 k_1 a_1 b_1 c_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 %arg2_1 %arg3_1 %arg4_1 ))))

(define-symbolic k_2 (bitvector 8))
(define-symbolic a_2 (bitvector 512))
(define-symbolic b_2 (bitvector 512))
(define-symbolic c_2 (bitvector 512))
(define %vectsize_2 512)
(define %lanesize1_2 512)
(define %lanesize2_2 416)
(define %elemsize_2 52)
(define %laneoffset_2 0)
(define %arg0_2 64)
(define %arg1_2 52)
(define %arg2_2 52)
(define %arg3_2 128)
(define %arg4_2 (bv #x0000000000000000000000000000000000000000000000000000000000000000 64))

(verify (assert (equal? (_mm256_maskz_madd52hi_epu64 k_2 a_2 b_2 c_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 %arg2_2 %arg3_2 %arg4_2 ) (_mm512_maskz_madd52hi_epu64 k_2 a_2 b_2 c_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 %arg2_2 %arg3_2 %arg4_2 ))))
