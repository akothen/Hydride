#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/solver/smt/boolector)

(define (_mm_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %1.new0 (*  j0.new  %factor0))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11.new0 (/  j0.new  %arg2))
  (define %12 (+  %11.new0  %arg1))
  (define %13 (*  %elemsize  %12))
  (define %lastidx1 (-  %elemsize  1))
  (define %14 (+  %13  %lastidx1))
  (define %15 (extract  %14 %13 a))
  (define %16 (sign-extend  %15 (bitvector %arg0)))
  (define %21 (extract  %14 %13 b))
  (define %22 (sign-extend  %21 (bitvector %arg0)))
  (define %23 (bvmul  %16  %22))
  (define %lastidx0 (-  %arg0  1))
  (define %25 (+  %1.new0  %lastidx0))
  (define %26 (extract  %25 %1.new0 src))
  (define %27 (bvadd  %26  %10))
  (define %28 (bvadd  %27  %23))
  %28
 )
 )
)
)
)

(define (_mm256_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %1.new0 (*  j0.new  %factor0))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11.new0 (/  j0.new  %arg2))
  (define %12 (+  %11.new0  %arg1))
  (define %13 (*  %elemsize  %12))
  (define %lastidx1 (-  %elemsize  1))
  (define %14 (+  %13  %lastidx1))
  (define %15 (extract  %14 %13 a))
  (define %16 (sign-extend  %15 (bitvector %arg0)))
  (define %21 (extract  %14 %13 b))
  (define %22 (sign-extend  %21 (bitvector %arg0)))
  (define %23 (bvmul  %16  %22))
  (define %lastidx0 (-  %arg0  1))
  (define %25 (+  %1.new0  %lastidx0))
  (define %26 (extract  %25 %1.new0 src))
  (define %27 (bvadd  %26  %10))
  (define %28 (bvadd  %27  %23))
  %28
 )
 )
)
)
)

(define-symbolic src_1 (bitvector 128))
(define-symbolic a_1 (bitvector 128))
(define-symbolic b_1 (bitvector 128))
(define %vectsize_1 128)
(define %lanesize1_1 128)
(define %lanesize2_1 64)
(define %elemsize_1 16)
(define %laneoffset_1 0)
(define %arg0_1 32)
(define %arg1_1 1)
(define %arg2_1 8)

(verify (assert (equal? (_mm_dpwssd_epi32 src_1 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 %arg2_1 ) (_mm256_dpwssd_epi32 src_1 a_1 b_1 %vectsize_1 %lanesize1_1 %lanesize2_1 %elemsize_1 %laneoffset_1 %arg0_1 %arg1_1 %arg2_1 ))))

(define-symbolic src_2 (bitvector 256))
(define-symbolic a_2 (bitvector 256))
(define-symbolic b_2 (bitvector 256))
(define %vectsize_2 256)
(define %lanesize1_2 256)
(define %lanesize2_2 128)
(define %elemsize_2 16)
(define %laneoffset_2 0)
(define %arg0_2 32)
(define %arg1_2 1)
(define %arg2_2 8)

(verify (assert (equal? (_mm_dpwssd_epi32 src_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 %arg2_2 ) (_mm256_dpwssd_epi32 src_2 a_2 b_2 %vectsize_2 %lanesize1_2 %lanesize2_2 %elemsize_2 %laneoffset_2 %arg0_2 %arg1_2 %arg2_2 ))))